# Judge0 for HUEL OJ

> **Note**: This is a customized, lightweight fork of [Judge0](https://github.com/judge0/judge0), maintained by **Yozuru**.

This version is specifically optimized for **Henan University of Economics and Law Online Judge (HUEL OJ)**. It strips away commercial features and marketing content to focus purely on performance, stability, and the specific academic needs of our university's grading system.

## Key Changes in v1.14.0

-   **Core Upgrade**: Ported to Ruby 4.0 and Rails 7.2 for improved performance and modern standards.
-   **Lite & Clean**: Removed unnecessary dependencies and promotional material.
-   **Infrastructure**: Optimized for strictly sandboxed execution using `isolate` with cgroups v2.
-   **Custom Languages**: Curated language list specific to our curriculum.

## Get Started

### Docker Deployment
```bash
docker run -it -p 2358:2358 --privileged yozuru/judge0:latest
```

### Usage Example (Python)
```bash
curl -X POST "http://localhost:2358/submissions?wait=true&base64_encoded=false" \
  -H "Content-Type: application/json" \
  -d '{
    "source_code": "print(\"Hello from Judge0!\")",
    "language_id": 98
  }'
```

## Community

* [Website](https://judge0.com)
* [Discord](https://discord.judge0.com)
* [Documentation](https://ce.judge0.com)
* [Changelog](CHANGELOG.md)

## Credits

*   **Original Author**: [Herman Zvonimir Došilović](https://hermanz.dosilovic.com) (Creator of Judge0)
*   **Fork Maintainer**: Yozuru (HUEL OJ Team)

## License

Judge0 is released under the [GNU General Public License v3.0](LICENSE).
