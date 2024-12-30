# ARM Bootloader

A simple bootloader for ARM architecture that runs on QEMU. This project demonstrates basic ARM assembly programming and bootloader concepts by implementing a minimal bootloader that prints a message to the console.

## Prerequisites

Before you begin, ensure you have the following installed on your macOS system:

- [Homebrew](https://brew.sh/)
- QEMU ARM Emulator
- ARM GNU Toolchain (arm-none-eabi-gcc)

You can install the required tools using Homebrew:

```bash
brew install qemu
brew install arm-none-eabi-gcc
```

## Project Structure

```
.
├── README.md
├── boot.S             # Main bootloader assembly code
├── link.ld           # Linker script
└── .gitignore        # Git ignore file
```

## Building the Bootloader

1. Clone the repository:
```bash
git clone https://github.com/yourusername/arm-bootloader.git
cd arm-bootloader
```

2. Build the bootloader:
```bash
# Assemble the code
arm-none-eabi-as -mcpu=arm926ej-s boot.S -o boot.o

# Link the object file
arm-none-eabi-ld -T link.ld boot.o -o boot.elf

# Convert to raw binary
arm-none-eabi-objcopy -O binary boot.elf boot.bin
```

## Running the Bootloader

Run the bootloader using QEMU:

```bash
qemu-system-arm -M versatilepb -nographic -kernel boot.bin
```

You should see the message "Hello from ARM Bootloader!" appear in your terminal.

To exit QEMU:
- Press `Ctrl+A`
- Then press `X`

## Technical Details

### Boot Process
1. Sets up initial stack pointer
2. Initializes UART with proper settings
3. Prints welcome message
4. Enters infinite loop

### Hardware Configuration
- Target Board: Versatile PB (emulated)
- UART Base Address: 0x101f1000
- Entry Point: 0x10000

### Memory Map
```
0x10000 -> Text Section Start
    |
    v
   Code
    |
    v
   Data
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- ARM Architecture Reference Manual
- QEMU Documentation
- Versatile PB Board Documentation

## Support

If you have any questions or run into issues, please open an issue in the repository.
