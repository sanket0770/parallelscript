import os
import subprocess
from concurrent.futures import ThreadPoolExecutor, as_completed

# Define a function to deploy Elastic Beanstalk environment for a specific workspace
def deploy_environment(workspace):
    try:
        # Get the absolute path of the script directory
        script_dir = os.path.dirname(os.path.abspath(__file__))

        # Run Terraform commands for deployment
        subprocess.run(["terraform", "init", "-input=false"], check=True, cwd=os.path.join(script_dir, workspace))
        subprocess.run(["terraform", "apply", "-auto-approve", "-lock=false"], check=True, cwd=os.path.join(script_dir, workspace))
    except Exception as e:
        print(f"Error deploying workspace {workspace}: {e}")

# List of Terraform workspace directories
workspaces = [r"/workspace/workspace1", r"workspace/workspace2", r"workspace/workspace3"]  # Add your workspace directories here

# Set the maximum number of concurrent threads
max_workers = 3  # You can adjust this based on your system's capabilities

# Use ThreadPoolExecutor and as_completed to run deploy_environment function in parallel and maintain order
with ThreadPoolExecutor(max_workers=max_workers) as executor:
    futures = {executor.submit(deploy_environment, workspace): workspace for workspace in workspaces}
    for future in as_completed(futures):
        workspace = futures[future]
        try:
            future.result()
        except Exception as e:
            print(f"Error deploying workspace {workspace}: {e}")

print("Parallel deployment completed.")
