
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400a60 <_init>:
  400a60:	48 83 ec 08          	sub    $0x8,%rsp
  400a64:	e8 13 02 00 00       	callq  400c7c <call_gmon_start>
  400a69:	e8 a2 02 00 00       	callq  400d10 <frame_dummy>
  400a6e:	e8 7d 17 00 00       	callq  4021f0 <__do_global_ctors_aux>
  400a73:	48 83 c4 08          	add    $0x8,%rsp
  400a77:	c3                   	retq   

Disassembly of section .plt:

0000000000400a78 <printf@plt-0x10>:
  400a78:	ff 35 4a 27 20 00    	pushq  0x20274a(%rip)        # 6031c8 <_GLOBAL_OFFSET_TABLE_+0x8>
  400a7e:	ff 25 4c 27 20 00    	jmpq   *0x20274c(%rip)        # 6031d0 <_GLOBAL_OFFSET_TABLE_+0x10>
  400a84:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400a88 <printf@plt>:
  400a88:	ff 25 4a 27 20 00    	jmpq   *0x20274a(%rip)        # 6031d8 <_GLOBAL_OFFSET_TABLE_+0x18>
  400a8e:	68 00 00 00 00       	pushq  $0x0
  400a93:	e9 e0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400a98 <close@plt>:
  400a98:	ff 25 42 27 20 00    	jmpq   *0x202742(%rip)        # 6031e0 <_GLOBAL_OFFSET_TABLE_+0x20>
  400a9e:	68 01 00 00 00       	pushq  $0x1
  400aa3:	e9 d0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400aa8 <gethostbyname@plt>:
  400aa8:	ff 25 3a 27 20 00    	jmpq   *0x20273a(%rip)        # 6031e8 <_GLOBAL_OFFSET_TABLE_+0x28>
  400aae:	68 02 00 00 00       	pushq  $0x2
  400ab3:	e9 c0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ab8 <puts@plt>:
  400ab8:	ff 25 32 27 20 00    	jmpq   *0x202732(%rip)        # 6031f0 <_GLOBAL_OFFSET_TABLE_+0x30>
  400abe:	68 03 00 00 00       	pushq  $0x3
  400ac3:	e9 b0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ac8 <__isoc99_sscanf@plt>:
  400ac8:	ff 25 2a 27 20 00    	jmpq   *0x20272a(%rip)        # 6031f8 <_GLOBAL_OFFSET_TABLE_+0x38>
  400ace:	68 04 00 00 00       	pushq  $0x4
  400ad3:	e9 a0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ad8 <exit@plt>:
  400ad8:	ff 25 22 27 20 00    	jmpq   *0x202722(%rip)        # 603200 <_GLOBAL_OFFSET_TABLE_+0x40>
  400ade:	68 05 00 00 00       	pushq  $0x5
  400ae3:	e9 90 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ae8 <strcasecmp@plt>:
  400ae8:	ff 25 1a 27 20 00    	jmpq   *0x20271a(%rip)        # 603208 <_GLOBAL_OFFSET_TABLE_+0x48>
  400aee:	68 06 00 00 00       	pushq  $0x6
  400af3:	e9 80 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400af8 <read@plt>:
  400af8:	ff 25 12 27 20 00    	jmpq   *0x202712(%rip)        # 603210 <_GLOBAL_OFFSET_TABLE_+0x50>
  400afe:	68 07 00 00 00       	pushq  $0x7
  400b03:	e9 70 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b08 <fopen@plt>:
  400b08:	ff 25 0a 27 20 00    	jmpq   *0x20270a(%rip)        # 603218 <_GLOBAL_OFFSET_TABLE_+0x58>
  400b0e:	68 08 00 00 00       	pushq  $0x8
  400b13:	e9 60 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b18 <__libc_start_main@plt>:
  400b18:	ff 25 02 27 20 00    	jmpq   *0x202702(%rip)        # 603220 <_GLOBAL_OFFSET_TABLE_+0x60>
  400b1e:	68 09 00 00 00       	pushq  $0x9
  400b23:	e9 50 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b28 <fgets@plt>:
  400b28:	ff 25 fa 26 20 00    	jmpq   *0x2026fa(%rip)        # 603228 <_GLOBAL_OFFSET_TABLE_+0x68>
  400b2e:	68 0a 00 00 00       	pushq  $0xa
  400b33:	e9 40 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b38 <bcopy@plt>:
  400b38:	ff 25 f2 26 20 00    	jmpq   *0x2026f2(%rip)        # 603230 <_GLOBAL_OFFSET_TABLE_+0x70>
  400b3e:	68 0b 00 00 00       	pushq  $0xb
  400b43:	e9 30 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b48 <__ctype_b_loc@plt>:
  400b48:	ff 25 ea 26 20 00    	jmpq   *0x2026ea(%rip)        # 603238 <_GLOBAL_OFFSET_TABLE_+0x78>
  400b4e:	68 0c 00 00 00       	pushq  $0xc
  400b53:	e9 20 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b58 <sprintf@plt>:
  400b58:	ff 25 e2 26 20 00    	jmpq   *0x2026e2(%rip)        # 603240 <_GLOBAL_OFFSET_TABLE_+0x80>
  400b5e:	68 0d 00 00 00       	pushq  $0xd
  400b63:	e9 10 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b68 <sleep@plt>:
  400b68:	ff 25 da 26 20 00    	jmpq   *0x2026da(%rip)        # 603248 <_GLOBAL_OFFSET_TABLE_+0x88>
  400b6e:	68 0e 00 00 00       	pushq  $0xe
  400b73:	e9 00 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b78 <strtol@plt>:
  400b78:	ff 25 d2 26 20 00    	jmpq   *0x2026d2(%rip)        # 603250 <_GLOBAL_OFFSET_TABLE_+0x90>
  400b7e:	68 0f 00 00 00       	pushq  $0xf
  400b83:	e9 f0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b88 <connect@plt>:
  400b88:	ff 25 ca 26 20 00    	jmpq   *0x2026ca(%rip)        # 603258 <_GLOBAL_OFFSET_TABLE_+0x98>
  400b8e:	68 10 00 00 00       	pushq  $0x10
  400b93:	e9 e0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b98 <gethostname@plt>:
  400b98:	ff 25 c2 26 20 00    	jmpq   *0x2026c2(%rip)        # 603260 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400b9e:	68 11 00 00 00       	pushq  $0x11
  400ba3:	e9 d0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ba8 <memcpy@plt>:
  400ba8:	ff 25 ba 26 20 00    	jmpq   *0x2026ba(%rip)        # 603268 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400bae:	68 12 00 00 00       	pushq  $0x12
  400bb3:	e9 c0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bb8 <signal@plt>:
  400bb8:	ff 25 b2 26 20 00    	jmpq   *0x2026b2(%rip)        # 603270 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400bbe:	68 13 00 00 00       	pushq  $0x13
  400bc3:	e9 b0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bc8 <socket@plt>:
  400bc8:	ff 25 aa 26 20 00    	jmpq   *0x2026aa(%rip)        # 603278 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400bce:	68 14 00 00 00       	pushq  $0x14
  400bd3:	e9 a0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bd8 <getenv@plt>:
  400bd8:	ff 25 a2 26 20 00    	jmpq   *0x2026a2(%rip)        # 603280 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400bde:	68 15 00 00 00       	pushq  $0x15
  400be3:	e9 90 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400be8 <alarm@plt>:
  400be8:	ff 25 9a 26 20 00    	jmpq   *0x20269a(%rip)        # 603288 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400bee:	68 16 00 00 00       	pushq  $0x16
  400bf3:	e9 80 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bf8 <__errno_location@plt>:
  400bf8:	ff 25 92 26 20 00    	jmpq   *0x202692(%rip)        # 603290 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400bfe:	68 17 00 00 00       	pushq  $0x17
  400c03:	e9 70 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c08 <strcpy@plt>:
  400c08:	ff 25 8a 26 20 00    	jmpq   *0x20268a(%rip)        # 603298 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400c0e:	68 18 00 00 00       	pushq  $0x18
  400c13:	e9 60 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c18 <fprintf@plt>:
  400c18:	ff 25 82 26 20 00    	jmpq   *0x202682(%rip)        # 6032a0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400c1e:	68 19 00 00 00       	pushq  $0x19
  400c23:	e9 50 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c28 <write@plt>:
  400c28:	ff 25 7a 26 20 00    	jmpq   *0x20267a(%rip)        # 6032a8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400c2e:	68 1a 00 00 00       	pushq  $0x1a
  400c33:	e9 40 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c38 <fflush@plt>:
  400c38:	ff 25 72 26 20 00    	jmpq   *0x202672(%rip)        # 6032b0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400c3e:	68 1b 00 00 00       	pushq  $0x1b
  400c43:	e9 30 fe ff ff       	jmpq   400a78 <_init+0x18>

Disassembly of section .text:

0000000000400c50 <_start>:
  400c50:	31 ed                	xor    %ebp,%ebp
  400c52:	49 89 d1             	mov    %rdx,%r9
  400c55:	5e                   	pop    %rsi
  400c56:	48 89 e2             	mov    %rsp,%rdx
  400c59:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400c5d:	50                   	push   %rax
  400c5e:	54                   	push   %rsp
  400c5f:	49 c7 c0 50 21 40 00 	mov    $0x402150,%r8
  400c66:	48 c7 c1 60 21 40 00 	mov    $0x402160,%rcx
  400c6d:	48 c7 c7 34 0d 40 00 	mov    $0x400d34,%rdi
  400c74:	e8 9f fe ff ff       	callq  400b18 <__libc_start_main@plt>
  400c79:	f4                   	hlt    
  400c7a:	90                   	nop
  400c7b:	90                   	nop

0000000000400c7c <call_gmon_start>:
  400c7c:	48 83 ec 08          	sub    $0x8,%rsp
  400c80:	48 8b 05 31 25 20 00 	mov    0x202531(%rip),%rax        # 6031b8 <_DYNAMIC+0x190>
  400c87:	48 85 c0             	test   %rax,%rax
  400c8a:	74 02                	je     400c8e <call_gmon_start+0x12>
  400c8c:	ff d0                	callq  *%rax
  400c8e:	48 83 c4 08          	add    $0x8,%rsp
  400c92:	c3                   	retq   
  400c93:	90                   	nop
  400c94:	90                   	nop
  400c95:	90                   	nop
  400c96:	90                   	nop
  400c97:	90                   	nop
  400c98:	90                   	nop
  400c99:	90                   	nop
  400c9a:	90                   	nop
  400c9b:	90                   	nop
  400c9c:	90                   	nop
  400c9d:	90                   	nop
  400c9e:	90                   	nop
  400c9f:	90                   	nop

0000000000400ca0 <__do_global_dtors_aux>:
  400ca0:	55                   	push   %rbp
  400ca1:	48 89 e5             	mov    %rsp,%rbp
  400ca4:	53                   	push   %rbx
  400ca5:	48 83 ec 08          	sub    $0x8,%rsp
  400ca9:	80 3d a8 30 20 00 00 	cmpb   $0x0,0x2030a8(%rip)        # 603d58 <completed.6349>
  400cb0:	75 4b                	jne    400cfd <__do_global_dtors_aux+0x5d>
  400cb2:	bb 18 30 60 00       	mov    $0x603018,%ebx
  400cb7:	48 8b 05 a2 30 20 00 	mov    0x2030a2(%rip),%rax        # 603d60 <dtor_idx.6351>
  400cbe:	48 81 eb 10 30 60 00 	sub    $0x603010,%rbx
  400cc5:	48 c1 fb 03          	sar    $0x3,%rbx
  400cc9:	48 83 eb 01          	sub    $0x1,%rbx
  400ccd:	48 39 d8             	cmp    %rbx,%rax
  400cd0:	73 24                	jae    400cf6 <__do_global_dtors_aux+0x56>
  400cd2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400cd8:	48 83 c0 01          	add    $0x1,%rax
  400cdc:	48 89 05 7d 30 20 00 	mov    %rax,0x20307d(%rip)        # 603d60 <dtor_idx.6351>
  400ce3:	ff 14 c5 10 30 60 00 	callq  *0x603010(,%rax,8)
  400cea:	48 8b 05 6f 30 20 00 	mov    0x20306f(%rip),%rax        # 603d60 <dtor_idx.6351>
  400cf1:	48 39 d8             	cmp    %rbx,%rax
  400cf4:	72 e2                	jb     400cd8 <__do_global_dtors_aux+0x38>
  400cf6:	c6 05 5b 30 20 00 01 	movb   $0x1,0x20305b(%rip)        # 603d58 <completed.6349>
  400cfd:	48 83 c4 08          	add    $0x8,%rsp
  400d01:	5b                   	pop    %rbx
  400d02:	c9                   	leaveq 
  400d03:	c3                   	retq   
  400d04:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
  400d0b:	00 00 00 00 00 

0000000000400d10 <frame_dummy>:
  400d10:	48 83 3d 08 23 20 00 	cmpq   $0x0,0x202308(%rip)        # 603020 <__JCR_END__>
  400d17:	00 
  400d18:	55                   	push   %rbp
  400d19:	48 89 e5             	mov    %rsp,%rbp
  400d1c:	74 12                	je     400d30 <frame_dummy+0x20>
  400d1e:	b8 00 00 00 00       	mov    $0x0,%eax
  400d23:	48 85 c0             	test   %rax,%rax
  400d26:	74 08                	je     400d30 <frame_dummy+0x20>
  400d28:	bf 20 30 60 00       	mov    $0x603020,%edi
  400d2d:	c9                   	leaveq 
  400d2e:	ff e0                	jmpq   *%rax
  400d30:	c9                   	leaveq 
  400d31:	c3                   	retq   
  400d32:	90                   	nop
  400d33:	90                   	nop

0000000000400d34 <main>:
  400d34:	55                   	push   %rbp
  400d35:	53                   	push   %rbx
  400d36:	48 83 ec 08          	sub    $0x8,%rsp
  400d3a:	48 89 f3             	mov    %rsi,%rbx
  400d3d:	83 ff 01             	cmp    $0x1,%edi
  400d40:	75 10                	jne    400d52 <main+0x1e>
  400d42:	48 8b 05 f7 2f 20 00 	mov    0x202ff7(%rip),%rax        # 603d40 <__bss_start>
  400d49:	48 89 05 20 30 20 00 	mov    %rax,0x203020(%rip)        # 603d70 <infile>
  400d50:	eb 5a                	jmp    400dac <main+0x78>
  400d52:	83 ff 02             	cmp    $0x2,%edi
  400d55:	75 39                	jne    400d90 <main+0x5c>
  400d57:	48 8d 6e 08          	lea    0x8(%rsi),%rbp
  400d5b:	be 50 22 40 00       	mov    $0x402250,%esi
  400d60:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
  400d64:	e8 9f fd ff ff       	callq  400b08 <fopen@plt>
  400d69:	48 89 05 00 30 20 00 	mov    %rax,0x203000(%rip)        # 603d70 <infile>
  400d70:	48 85 c0             	test   %rax,%rax
  400d73:	75 37                	jne    400dac <main+0x78>
  400d75:	48 8b 55 00          	mov    0x0(%rbp),%rdx
  400d79:	48 8b 33             	mov    (%rbx),%rsi
  400d7c:	bf 52 22 40 00       	mov    $0x402252,%edi
  400d81:	e8 02 fd ff ff       	callq  400a88 <printf@plt>
  400d86:	bf 08 00 00 00       	mov    $0x8,%edi
  400d8b:	e8 48 fd ff ff       	callq  400ad8 <exit@plt>
  400d90:	48 8b 36             	mov    (%rsi),%rsi
  400d93:	bf 6f 22 40 00       	mov    $0x40226f,%edi
  400d98:	b8 00 00 00 00       	mov    $0x0,%eax
  400d9d:	e8 e6 fc ff ff       	callq  400a88 <printf@plt>
  400da2:	bf 08 00 00 00       	mov    $0x8,%edi
  400da7:	e8 2c fd ff ff       	callq  400ad8 <exit@plt>
  400dac:	e8 b0 08 00 00       	callq  401661 <initialize_bomb>
  400db1:	bf d8 22 40 00       	mov    $0x4022d8,%edi
  400db6:	e8 fd fc ff ff       	callq  400ab8 <puts@plt>
  400dbb:	bf 18 23 40 00       	mov    $0x402318,%edi
  400dc0:	e8 f3 fc ff ff       	callq  400ab8 <puts@plt>
  400dc5:	e8 64 07 00 00       	callq  40152e <read_line>
  400dca:	48 89 c7             	mov    %rax,%rdi
  400dcd:	e8 f6 03 00 00       	callq  4011c8 <phase_1>
  400dd2:	e8 6c 05 00 00       	callq  401343 <phase_defused>
  400dd7:	bf 48 23 40 00       	mov    $0x402348,%edi
  400ddc:	e8 d7 fc ff ff       	callq  400ab8 <puts@plt>
  400de1:	e8 48 07 00 00       	callq  40152e <read_line>
  400de6:	48 89 c7             	mov    %rax,%rdi
  400de9:	e8 48 02 00 00       	callq  401036 <phase_2>
  400dee:	e8 50 05 00 00       	callq  401343 <phase_defused>
  400df3:	bf 89 22 40 00       	mov    $0x402289,%edi
  400df8:	e8 bb fc ff ff       	callq  400ab8 <puts@plt>
  400dfd:	e8 2c 07 00 00       	callq  40152e <read_line>
  400e02:	48 89 c7             	mov    %rax,%rdi
  400e05:	e8 0b 03 00 00       	callq  401115 <phase_3>
  400e0a:	e8 34 05 00 00       	callq  401343 <phase_defused>
  400e0f:	bf a7 22 40 00       	mov    $0x4022a7,%edi
  400e14:	e8 9f fc ff ff       	callq  400ab8 <puts@plt>
  400e19:	e8 10 07 00 00       	callq  40152e <read_line>
  400e1e:	48 89 c7             	mov    %rax,%rdi
  400e21:	e8 93 02 00 00       	callq  4010b9 <phase_4>
  400e26:	e8 18 05 00 00       	callq  401343 <phase_defused>
  400e2b:	bf 78 23 40 00       	mov    $0x402378,%edi
  400e30:	e8 83 fc ff ff       	callq  400ab8 <puts@plt>
  400e35:	e8 f4 06 00 00       	callq  40152e <read_line>
  400e3a:	48 89 c7             	mov    %rax,%rdi
  400e3d:	e8 37 02 00 00       	callq  401079 <phase_5>
  400e42:	e8 fc 04 00 00       	callq  401343 <phase_defused>
  400e47:	bf b6 22 40 00       	mov    $0x4022b6,%edi
  400e4c:	e8 67 fc ff ff       	callq  400ab8 <puts@plt>
  400e51:	e8 d8 06 00 00       	callq  40152e <read_line>
  400e56:	48 89 c7             	mov    %rax,%rdi
  400e59:	e8 dd 00 00 00       	callq  400f3b <phase_6>
  400e5e:	e8 e0 04 00 00       	callq  401343 <phase_defused>
  400e63:	b8 00 00 00 00       	mov    $0x0,%eax
  400e68:	48 83 c4 08          	add    $0x8,%rsp
  400e6c:	5b                   	pop    %rbx
  400e6d:	5d                   	pop    %rbp
  400e6e:	c3                   	retq   
  400e6f:	90                   	nop

0000000000400e70 <func4>:
  400e70:	48 83 ec 08          	sub    $0x8,%rsp
  400e74:	89 d0                	mov    %edx,%eax
  400e76:	29 f0                	sub    %esi,%eax
  400e78:	89 c1                	mov    %eax,%ecx
  400e7a:	c1 e9 1f             	shr    $0x1f,%ecx
  400e7d:	8d 04 01             	lea    (%rcx,%rax,1),%eax
  400e80:	d1 f8                	sar    %eax
  400e82:	8d 0c 30             	lea    (%rax,%rsi,1),%ecx
  400e85:	39 f9                	cmp    %edi,%ecx
  400e87:	7e 0c                	jle    400e95 <func4+0x25>
  400e89:	8d 51 ff             	lea    -0x1(%rcx),%edx
  400e8c:	e8 df ff ff ff       	callq  400e70 <func4>
  400e91:	01 c0                	add    %eax,%eax
  400e93:	eb 15                	jmp    400eaa <func4+0x3a>
  400e95:	b8 00 00 00 00       	mov    $0x0,%eax
  400e9a:	39 f9                	cmp    %edi,%ecx
  400e9c:	7d 0c                	jge    400eaa <func4+0x3a>
  400e9e:	8d 71 01             	lea    0x1(%rcx),%esi
  400ea1:	e8 ca ff ff ff       	callq  400e70 <func4>
  400ea6:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  400eaa:	48 83 c4 08          	add    $0x8,%rsp
  400eae:	c3                   	retq   

0000000000400eaf <fun7>:
  400eaf:	48 83 ec 08          	sub    $0x8,%rsp
  400eb3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  400eb8:	48 85 ff             	test   %rdi,%rdi
  400ebb:	74 29                	je     400ee6 <fun7+0x37>
  400ebd:	8b 17                	mov    (%rdi),%edx
  400ebf:	39 f2                	cmp    %esi,%edx
  400ec1:	7e 0d                	jle    400ed0 <fun7+0x21>
  400ec3:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  400ec7:	e8 e3 ff ff ff       	callq  400eaf <fun7>
  400ecc:	01 c0                	add    %eax,%eax
  400ece:	eb 16                	jmp    400ee6 <fun7+0x37>
  400ed0:	b8 00 00 00 00       	mov    $0x0,%eax
  400ed5:	39 f2                	cmp    %esi,%edx
  400ed7:	74 0d                	je     400ee6 <fun7+0x37>
  400ed9:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  400edd:	e8 cd ff ff ff       	callq  400eaf <fun7>
  400ee2:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  400ee6:	48 83 c4 08          	add    $0x8,%rsp
  400eea:	c3                   	retq   

0000000000400eeb <secret_phase>:
  400eeb:	53                   	push   %rbx
  400eec:	e8 3d 06 00 00       	callq  40152e <read_line>
  400ef1:	ba 0a 00 00 00       	mov    $0xa,%edx
  400ef6:	be 00 00 00 00       	mov    $0x0,%esi
  400efb:	48 89 c7             	mov    %rax,%rdi
  400efe:	e8 75 fc ff ff       	callq  400b78 <strtol@plt>
  400f03:	89 c3                	mov    %eax,%ebx
  400f05:	8d 43 88             	lea    -0x78(%rbx),%eax
  400f08:	3d 3a 0b 00 00       	cmp    $0xb3a,%eax
  400f0d:	76 05                	jbe    400f14 <secret_phase+0x29>
  400f0f:	e8 be 04 00 00       	callq  4013d2 <explode_bomb>
  400f14:	89 de                	mov    %ebx,%esi
  400f16:	bf 20 39 60 00       	mov    $0x603920,%edi
  400f1b:	e8 8f ff ff ff       	callq  400eaf <fun7>
  400f20:	83 f8 03             	cmp    $0x3,%eax
  400f23:	74 05                	je     400f2a <secret_phase+0x3f>
  400f25:	e8 a8 04 00 00       	callq  4013d2 <explode_bomb>
  400f2a:	bf a0 23 40 00       	mov    $0x4023a0,%edi
  400f2f:	e8 84 fb ff ff       	callq  400ab8 <puts@plt>
  400f34:	e8 0a 04 00 00       	callq  401343 <phase_defused>
  400f39:	5b                   	pop    %rbx
  400f3a:	c3                   	retq   

0000000000400f3b <phase_6>:
  400f3b:	41 54                	push   %r12
  400f3d:	55                   	push   %rbp
  400f3e:	53                   	push   %rbx
  400f3f:	48 83 ec 50          	sub    $0x50,%rsp
  400f43:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  400f48:	48 89 ee             	mov    %rbp,%rsi
  400f4b:	e8 1e 05 00 00       	callq  40146e <read_six_numbers>
  400f50:	41 bc 00 00 00 00    	mov    $0x0,%r12d
  400f56:	8b 45 00             	mov    0x0(%rbp),%eax
  400f59:	83 e8 01             	sub    $0x1,%eax
  400f5c:	83 f8 05             	cmp    $0x5,%eax
  400f5f:	76 05                	jbe    400f66 <phase_6+0x2b>
  400f61:	e8 6c 04 00 00       	callq  4013d2 <explode_bomb>
  400f66:	41 83 c4 01          	add    $0x1,%r12d
  400f6a:	41 83 fc 06          	cmp    $0x6,%r12d
  400f6e:	74 22                	je     400f92 <phase_6+0x57>
  400f70:	44 89 e3             	mov    %r12d,%ebx
  400f73:	48 63 c3             	movslq %ebx,%rax
  400f76:	8b 55 00             	mov    0x0(%rbp),%edx
  400f79:	3b 54 84 30          	cmp    0x30(%rsp,%rax,4),%edx
  400f7d:	75 05                	jne    400f84 <phase_6+0x49>
  400f7f:	e8 4e 04 00 00       	callq  4013d2 <explode_bomb>
  400f84:	83 c3 01             	add    $0x1,%ebx
  400f87:	83 fb 05             	cmp    $0x5,%ebx
  400f8a:	7e e7                	jle    400f73 <phase_6+0x38>
  400f8c:	48 83 c5 04          	add    $0x4,%rbp
  400f90:	eb c4                	jmp    400f56 <phase_6+0x1b>
  400f92:	bb 00 00 00 00       	mov    $0x0,%ebx
  400f97:	4c 8d 44 24 30       	lea    0x30(%rsp),%r8
  400f9c:	bd 01 00 00 00       	mov    $0x1,%ebp
  400fa1:	be 50 37 60 00       	mov    $0x603750,%esi
  400fa6:	48 89 e7             	mov    %rsp,%rdi
  400fa9:	eb 19                	jmp    400fc4 <phase_6+0x89>
  400fab:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  400faf:	83 c0 01             	add    $0x1,%eax
  400fb2:	39 c8                	cmp    %ecx,%eax
  400fb4:	75 f5                	jne    400fab <phase_6+0x70>
  400fb6:	48 89 14 5f          	mov    %rdx,(%rdi,%rbx,2)
  400fba:	48 83 c3 04          	add    $0x4,%rbx
  400fbe:	48 83 fb 18          	cmp    $0x18,%rbx
  400fc2:	74 10                	je     400fd4 <phase_6+0x99>
  400fc4:	41 8b 0c 18          	mov    (%r8,%rbx,1),%ecx
  400fc8:	89 e8                	mov    %ebp,%eax
  400fca:	48 89 f2             	mov    %rsi,%rdx
  400fcd:	83 f9 01             	cmp    $0x1,%ecx
  400fd0:	7f d9                	jg     400fab <phase_6+0x70>
  400fd2:	eb e2                	jmp    400fb6 <phase_6+0x7b>
  400fd4:	48 8b 1c 24          	mov    (%rsp),%rbx
  400fd8:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  400fdd:	48 89 43 08          	mov    %rax,0x8(%rbx)
  400fe1:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  400fe6:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400fea:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  400fef:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400ff3:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  400ff8:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400ffc:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  401001:	48 89 42 08          	mov    %rax,0x8(%rdx)
  401005:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  40100c:	00 
  40100d:	bd 00 00 00 00       	mov    $0x0,%ebp
  401012:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401016:	8b 13                	mov    (%rbx),%edx
  401018:	3b 10                	cmp    (%rax),%edx
  40101a:	7d 05                	jge    401021 <phase_6+0xe6>
  40101c:	e8 b1 03 00 00       	callq  4013d2 <explode_bomb>
  401021:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  401025:	83 c5 01             	add    $0x1,%ebp
  401028:	83 fd 05             	cmp    $0x5,%ebp
  40102b:	75 e5                	jne    401012 <phase_6+0xd7>
  40102d:	48 83 c4 50          	add    $0x50,%rsp
  401031:	5b                   	pop    %rbx
  401032:	5d                   	pop    %rbp
  401033:	41 5c                	pop    %r12
  401035:	c3                   	retq   

0000000000401036 <phase_2>:
  401036:	55                   	push   %rbp
  401037:	53                   	push   %rbx
  401038:	48 83 ec 28          	sub    $0x28,%rsp
  40103c:	48 89 e6             	mov    %rsp,%rsi
  40103f:	e8 2a 04 00 00       	callq  40146e <read_six_numbers>
  401044:	83 3c 24 04          	cmpl   $0x4,(%rsp)
  401048:	74 05                	je     40104f <phase_2+0x19>
  40104a:	e8 83 03 00 00       	callq  4013d2 <explode_bomb>
  40104f:	48 89 e5             	mov    %rsp,%rbp
  401052:	48 8d 5c 24 04       	lea    0x4(%rsp),%rbx
  401057:	48 83 c5 18          	add    $0x18,%rbp
  40105b:	8b 43 fc             	mov    -0x4(%rbx),%eax
  40105e:	01 c0                	add    %eax,%eax
  401060:	39 03                	cmp    %eax,(%rbx)
  401062:	74 05                	je     401069 <phase_2+0x33>
  401064:	e8 69 03 00 00       	callq  4013d2 <explode_bomb>
  401069:	48 83 c3 04          	add    $0x4,%rbx
  40106d:	48 39 eb             	cmp    %rbp,%rbx
  401070:	75 e9                	jne    40105b <phase_2+0x25>
  401072:	48 83 c4 28          	add    $0x28,%rsp
  401076:	5b                   	pop    %rbx
  401077:	5d                   	pop    %rbp
  401078:	c3                   	retq   

0000000000401079 <phase_5>:
  401079:	53                   	push   %rbx
  40107a:	48 89 fb             	mov    %rdi,%rbx
  40107d:	e8 6e 01 00 00       	callq  4011f0 <string_length>
  401082:	83 f8 06             	cmp    $0x6,%eax
  401085:	74 05                	je     40108c <phase_5+0x13>
  401087:	e8 46 03 00 00       	callq  4013d2 <explode_bomb>
  40108c:	48 8d 73 06          	lea    0x6(%rbx),%rsi
  401090:	b8 00 00 00 00       	mov    $0x0,%eax
  401095:	ba 60 24 40 00       	mov    $0x402460,%edx
  40109a:	48 0f be 0b          	movsbq (%rbx),%rcx
  40109e:	83 e1 0f             	and    $0xf,%ecx
  4010a1:	03 04 8a             	add    (%rdx,%rcx,4),%eax
  4010a4:	48 83 c3 01          	add    $0x1,%rbx
  4010a8:	48 39 f3             	cmp    %rsi,%rbx
  4010ab:	75 ed                	jne    40109a <phase_5+0x21>
  4010ad:	83 f8 2d             	cmp    $0x2d,%eax
  4010b0:	74 05                	je     4010b7 <phase_5+0x3e>
  4010b2:	e8 1b 03 00 00       	callq  4013d2 <explode_bomb>
  4010b7:	5b                   	pop    %rbx
  4010b8:	c3                   	retq   

00000000004010b9 <phase_4>:
  4010b9:	48 83 ec 18          	sub    $0x18,%rsp
  4010bd:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  4010c2:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  4010c7:	be 16 25 40 00       	mov    $0x402516,%esi
  4010cc:	b8 00 00 00 00       	mov    $0x0,%eax
  4010d1:	e8 f2 f9 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  4010d6:	83 f8 02             	cmp    $0x2,%eax
  4010d9:	75 0d                	jne    4010e8 <phase_4+0x2f>
  4010db:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4010df:	85 c0                	test   %eax,%eax
  4010e1:	78 05                	js     4010e8 <phase_4+0x2f>
  4010e3:	83 f8 0e             	cmp    $0xe,%eax
  4010e6:	7e 05                	jle    4010ed <phase_4+0x34>
  4010e8:	e8 e5 02 00 00       	callq  4013d2 <explode_bomb>
  4010ed:	ba 0e 00 00 00       	mov    $0xe,%edx
  4010f2:	be 00 00 00 00       	mov    $0x0,%esi
  4010f7:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  4010fb:	e8 70 fd ff ff       	callq  400e70 <func4>
  401100:	85 c0                	test   %eax,%eax
  401102:	75 07                	jne    40110b <phase_4+0x52>
  401104:	83 7c 24 08 00       	cmpl   $0x0,0x8(%rsp)
  401109:	74 05                	je     401110 <phase_4+0x57>
  40110b:	e8 c2 02 00 00       	callq  4013d2 <explode_bomb>
  401110:	48 83 c4 18          	add    $0x18,%rsp
  401114:	c3                   	retq   

0000000000401115 <phase_3>:
  401115:	48 83 ec 18          	sub    $0x18,%rsp
  401119:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  40111e:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  401123:	be 16 25 40 00       	mov    $0x402516,%esi
  401128:	b8 00 00 00 00       	mov    $0x0,%eax
  40112d:	e8 96 f9 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  401132:	83 f8 01             	cmp    $0x1,%eax
  401135:	7f 05                	jg     40113c <phase_3+0x27>
  401137:	e8 96 02 00 00       	callq  4013d2 <explode_bomb>
  40113c:	83 7c 24 0c 07       	cmpl   $0x7,0xc(%rsp)
  401141:	77 64                	ja     4011a7 <phase_3+0x92>
  401143:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401147:	ff 24 c5 20 24 40 00 	jmpq   *0x402420(,%rax,8)
  40114e:	b8 00 00 00 00       	mov    $0x0,%eax
  401153:	eb 4b                	jmp    4011a0 <phase_3+0x8b>
  401155:	b8 00 00 00 00       	mov    $0x0,%eax
  40115a:	eb 3f                	jmp    40119b <phase_3+0x86>
  40115c:	b8 00 00 00 00       	mov    $0x0,%eax
  401161:	eb 33                	jmp    401196 <phase_3+0x81>
  401163:	b8 00 00 00 00       	mov    $0x0,%eax
  401168:	eb 27                	jmp    401191 <phase_3+0x7c>
  40116a:	b8 00 00 00 00       	mov    $0x0,%eax
  40116f:	eb 1b                	jmp    40118c <phase_3+0x77>
  401171:	b8 00 00 00 00       	mov    $0x0,%eax
  401176:	eb 11                	jmp    401189 <phase_3+0x74>
  401178:	b8 ae 01 00 00       	mov    $0x1ae,%eax
  40117d:	eb 05                	jmp    401184 <phase_3+0x6f>
  40117f:	b8 00 00 00 00       	mov    $0x0,%eax
  401184:	2d 57 01 00 00       	sub    $0x157,%eax
  401189:	83 c0 4e             	add    $0x4e,%eax
  40118c:	2d 40 01 00 00       	sub    $0x140,%eax
  401191:	05 40 01 00 00       	add    $0x140,%eax
  401196:	2d 40 01 00 00       	sub    $0x140,%eax
  40119b:	05 40 01 00 00       	add    $0x140,%eax
  4011a0:	2d 40 01 00 00       	sub    $0x140,%eax
  4011a5:	eb 0a                	jmp    4011b1 <phase_3+0x9c>
  4011a7:	e8 26 02 00 00       	callq  4013d2 <explode_bomb>
  4011ac:	b8 00 00 00 00       	mov    $0x0,%eax
  4011b1:	83 7c 24 0c 05       	cmpl   $0x5,0xc(%rsp)
  4011b6:	7f 06                	jg     4011be <phase_3+0xa9>
  4011b8:	3b 44 24 08          	cmp    0x8(%rsp),%eax
  4011bc:	74 05                	je     4011c3 <phase_3+0xae>
  4011be:	e8 0f 02 00 00       	callq  4013d2 <explode_bomb>
  4011c3:	48 83 c4 18          	add    $0x18,%rsp
  4011c7:	c3                   	retq   

00000000004011c8 <phase_1>:
  4011c8:	48 83 ec 08          	sub    $0x8,%rsp
  4011cc:	be c8 23 40 00       	mov    $0x4023c8,%esi
  4011d1:	e8 36 00 00 00       	callq  40120c <strings_not_equal>
  4011d6:	85 c0                	test   %eax,%eax
  4011d8:	74 05                	je     4011df <phase_1+0x17>
  4011da:	e8 f3 01 00 00       	callq  4013d2 <explode_bomb>
  4011df:	48 83 c4 08          	add    $0x8,%rsp
  4011e3:	c3                   	retq   
  4011e4:	90                   	nop
  4011e5:	90                   	nop
  4011e6:	90                   	nop
  4011e7:	90                   	nop
  4011e8:	90                   	nop
  4011e9:	90                   	nop
  4011ea:	90                   	nop
  4011eb:	90                   	nop
  4011ec:	90                   	nop
  4011ed:	90                   	nop
  4011ee:	90                   	nop
  4011ef:	90                   	nop

00000000004011f0 <string_length>:
  4011f0:	48 89 fa             	mov    %rdi,%rdx
  4011f3:	b8 00 00 00 00       	mov    $0x0,%eax
  4011f8:	80 3f 00             	cmpb   $0x0,(%rdi)
  4011fb:	74 0d                	je     40120a <string_length+0x1a>
  4011fd:	48 83 c2 01          	add    $0x1,%rdx
  401201:	89 d0                	mov    %edx,%eax
  401203:	29 f8                	sub    %edi,%eax
  401205:	80 3a 00             	cmpb   $0x0,(%rdx)
  401208:	75 f3                	jne    4011fd <string_length+0xd>
  40120a:	f3 c3                	repz retq 

000000000040120c <strings_not_equal>:
  40120c:	41 54                	push   %r12
  40120e:	55                   	push   %rbp
  40120f:	53                   	push   %rbx
  401210:	48 89 fb             	mov    %rdi,%rbx
  401213:	48 89 f5             	mov    %rsi,%rbp
  401216:	e8 d5 ff ff ff       	callq  4011f0 <string_length>
  40121b:	41 89 c4             	mov    %eax,%r12d
  40121e:	48 89 ef             	mov    %rbp,%rdi
  401221:	e8 ca ff ff ff       	callq  4011f0 <string_length>
  401226:	41 39 c4             	cmp    %eax,%r12d
  401229:	75 26                	jne    401251 <strings_not_equal+0x45>
  40122b:	0f b6 13             	movzbl (%rbx),%edx
  40122e:	84 d2                	test   %dl,%dl
  401230:	74 26                	je     401258 <strings_not_equal+0x4c>
  401232:	48 89 e8             	mov    %rbp,%rax
  401235:	3a 55 00             	cmp    0x0(%rbp),%dl
  401238:	74 0a                	je     401244 <strings_not_equal+0x38>
  40123a:	eb 15                	jmp    401251 <strings_not_equal+0x45>
  40123c:	48 83 c0 01          	add    $0x1,%rax
  401240:	3a 10                	cmp    (%rax),%dl
  401242:	75 0d                	jne    401251 <strings_not_equal+0x45>
  401244:	48 83 c3 01          	add    $0x1,%rbx
  401248:	0f b6 13             	movzbl (%rbx),%edx
  40124b:	84 d2                	test   %dl,%dl
  40124d:	75 ed                	jne    40123c <strings_not_equal+0x30>
  40124f:	eb 07                	jmp    401258 <strings_not_equal+0x4c>
  401251:	b8 01 00 00 00       	mov    $0x1,%eax
  401256:	eb 05                	jmp    40125d <strings_not_equal+0x51>
  401258:	b8 00 00 00 00       	mov    $0x0,%eax
  40125d:	5b                   	pop    %rbx
  40125e:	5d                   	pop    %rbp
  40125f:	41 5c                	pop    %r12
  401261:	c3                   	retq   

0000000000401262 <initialize_bomb_solve>:
  401262:	f3 c3                	repz retq 

0000000000401264 <invalid_phase>:
  401264:	48 83 ec 08          	sub    $0x8,%rsp
  401268:	48 89 fe             	mov    %rdi,%rsi
  40126b:	bf a0 24 40 00       	mov    $0x4024a0,%edi
  401270:	b8 00 00 00 00       	mov    $0x0,%eax
  401275:	e8 0e f8 ff ff       	callq  400a88 <printf@plt>
  40127a:	bf 08 00 00 00       	mov    $0x8,%edi
  40127f:	e8 54 f8 ff ff       	callq  400ad8 <exit@plt>

0000000000401284 <send_msg>:
  401284:	53                   	push   %rbx
  401285:	48 81 ec 00 40 00 00 	sub    $0x4000,%rsp
  40128c:	89 fa                	mov    %edi,%edx
  40128e:	44 8b 05 d3 2a 20 00 	mov    0x202ad3(%rip),%r8d        # 603d68 <num_input_strings>
  401295:	4d 63 c8             	movslq %r8d,%r9
  401298:	49 83 e9 01          	sub    $0x1,%r9
  40129c:	4d 69 c9 b4 00 00 00 	imul   $0xb4,%r9,%r9
  4012a3:	49 81 c1 80 3d 60 00 	add    $0x603d80,%r9
  4012aa:	4c 89 cf             	mov    %r9,%rdi
  4012ad:	b8 00 00 00 00       	mov    $0x0,%eax
  4012b2:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4012b9:	f2 ae                	repnz scas %es:(%rdi),%al
  4012bb:	48 f7 d1             	not    %rcx
  4012be:	48 83 c1 63          	add    $0x63,%rcx
  4012c2:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  4012c9:	76 14                	jbe    4012df <send_msg+0x5b>
  4012cb:	bf d0 25 40 00       	mov    $0x4025d0,%edi
  4012d0:	e8 b3 f7 ff ff       	callq  400a88 <printf@plt>
  4012d5:	bf 08 00 00 00       	mov    $0x8,%edi
  4012da:	e8 f9 f7 ff ff       	callq  400ad8 <exit@plt>
  4012df:	85 d2                	test   %edx,%edx
  4012e1:	b8 b1 24 40 00       	mov    $0x4024b1,%eax
  4012e6:	b9 ba 24 40 00       	mov    $0x4024ba,%ecx
  4012eb:	48 0f 44 c8          	cmove  %rax,%rcx
  4012ef:	48 8d 9c 24 00 20 00 	lea    0x2000(%rsp),%rbx
  4012f6:	00 
  4012f7:	8b 15 e3 1f 20 00    	mov    0x201fe3(%rip),%edx        # 6032e0 <bomb_id>
  4012fd:	be c2 24 40 00       	mov    $0x4024c2,%esi
  401302:	48 89 df             	mov    %rbx,%rdi
  401305:	b8 00 00 00 00       	mov    $0x0,%eax
  40130a:	e8 49 f8 ff ff       	callq  400b58 <sprintf@plt>
  40130f:	48 89 e1             	mov    %rsp,%rcx
  401312:	ba 00 00 00 00       	mov    $0x0,%edx
  401317:	48 89 de             	mov    %rbx,%rsi
  40131a:	bf 00 33 60 00       	mov    $0x603300,%edi
  40131f:	e8 8f 0d 00 00       	callq  4020b3 <driver_post>
  401324:	85 c0                	test   %eax,%eax
  401326:	79 12                	jns    40133a <send_msg+0xb6>
  401328:	48 89 e7             	mov    %rsp,%rdi
  40132b:	e8 88 f7 ff ff       	callq  400ab8 <puts@plt>
  401330:	bf 00 00 00 00       	mov    $0x0,%edi
  401335:	e8 9e f7 ff ff       	callq  400ad8 <exit@plt>
  40133a:	48 81 c4 00 40 00 00 	add    $0x4000,%rsp
  401341:	5b                   	pop    %rbx
  401342:	c3                   	retq   

0000000000401343 <phase_defused>:
  401343:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
  40134a:	bf 01 00 00 00       	mov    $0x1,%edi
  40134f:	e8 30 ff ff ff       	callq  401284 <send_msg>
  401354:	83 3d 0d 2a 20 00 06 	cmpl   $0x6,0x202a0d(%rip)        # 603d68 <num_input_strings>
  40135b:	75 6d                	jne    4013ca <phase_defused+0x87>
  40135d:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  401362:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  401367:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  40136c:	be ce 24 40 00       	mov    $0x4024ce,%esi
  401371:	bf 9c 3f 60 00       	mov    $0x603f9c,%edi
  401376:	b8 00 00 00 00       	mov    $0x0,%eax
  40137b:	e8 48 f7 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  401380:	83 f8 03             	cmp    $0x3,%eax
  401383:	75 31                	jne    4013b6 <phase_defused+0x73>
  401385:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  40138a:	be d7 24 40 00       	mov    $0x4024d7,%esi
  40138f:	e8 78 fe ff ff       	callq  40120c <strings_not_equal>
  401394:	85 c0                	test   %eax,%eax
  401396:	75 1e                	jne    4013b6 <phase_defused+0x73>
  401398:	bf f8 25 40 00       	mov    $0x4025f8,%edi
  40139d:	e8 16 f7 ff ff       	callq  400ab8 <puts@plt>
  4013a2:	bf 20 26 40 00       	mov    $0x402620,%edi
  4013a7:	e8 0c f7 ff ff       	callq  400ab8 <puts@plt>
  4013ac:	b8 00 00 00 00       	mov    $0x0,%eax
  4013b1:	e8 35 fb ff ff       	callq  400eeb <secret_phase>
  4013b6:	bf 58 26 40 00       	mov    $0x402658,%edi
  4013bb:	e8 f8 f6 ff ff       	callq  400ab8 <puts@plt>
  4013c0:	bf 88 26 40 00       	mov    $0x402688,%edi
  4013c5:	e8 ee f6 ff ff       	callq  400ab8 <puts@plt>
  4013ca:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
  4013d1:	c3                   	retq   

00000000004013d2 <explode_bomb>:
  4013d2:	48 83 ec 08          	sub    $0x8,%rsp
  4013d6:	bf de 24 40 00       	mov    $0x4024de,%edi
  4013db:	e8 d8 f6 ff ff       	callq  400ab8 <puts@plt>
  4013e0:	bf e7 24 40 00       	mov    $0x4024e7,%edi
  4013e5:	e8 ce f6 ff ff       	callq  400ab8 <puts@plt>
  4013ea:	bf 00 00 00 00       	mov    $0x0,%edi
  4013ef:	e8 90 fe ff ff       	callq  401284 <send_msg>
  4013f4:	bf d0 26 40 00       	mov    $0x4026d0,%edi
  4013f9:	e8 ba f6 ff ff       	callq  400ab8 <puts@plt>
  4013fe:	bf 08 00 00 00       	mov    $0x8,%edi
  401403:	e8 d0 f6 ff ff       	callq  400ad8 <exit@plt>

0000000000401408 <read_ten_numbers>:
  401408:	48 83 ec 38          	sub    $0x38,%rsp
  40140c:	48 89 f2             	mov    %rsi,%rdx
  40140f:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  401413:	48 8d 46 24          	lea    0x24(%rsi),%rax
  401417:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  40141c:	48 8d 46 20          	lea    0x20(%rsi),%rax
  401420:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
  401425:	48 8d 46 1c          	lea    0x1c(%rsi),%rax
  401429:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  40142e:	48 8d 46 18          	lea    0x18(%rsi),%rax
  401432:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  401437:	48 8d 46 14          	lea    0x14(%rsi),%rax
  40143b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401440:	48 8d 46 10          	lea    0x10(%rsi),%rax
  401444:	48 89 04 24          	mov    %rax,(%rsp)
  401448:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  40144c:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  401450:	be fe 24 40 00       	mov    $0x4024fe,%esi
  401455:	b8 00 00 00 00       	mov    $0x0,%eax
  40145a:	e8 69 f6 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  40145f:	83 f8 09             	cmp    $0x9,%eax
  401462:	7f 05                	jg     401469 <read_ten_numbers+0x61>
  401464:	e8 69 ff ff ff       	callq  4013d2 <explode_bomb>
  401469:	48 83 c4 38          	add    $0x38,%rsp
  40146d:	c3                   	retq   

000000000040146e <read_six_numbers>:
  40146e:	48 83 ec 18          	sub    $0x18,%rsp
  401472:	48 89 f2             	mov    %rsi,%rdx
  401475:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  401479:	48 8d 46 14          	lea    0x14(%rsi),%rax
  40147d:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401482:	48 8d 46 10          	lea    0x10(%rsi),%rax
  401486:	48 89 04 24          	mov    %rax,(%rsp)
  40148a:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  40148e:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  401492:	be 0a 25 40 00       	mov    $0x40250a,%esi
  401497:	b8 00 00 00 00       	mov    $0x0,%eax
  40149c:	e8 27 f6 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  4014a1:	83 f8 05             	cmp    $0x5,%eax
  4014a4:	7f 05                	jg     4014ab <read_six_numbers+0x3d>
  4014a6:	e8 27 ff ff ff       	callq  4013d2 <explode_bomb>
  4014ab:	48 83 c4 18          	add    $0x18,%rsp
  4014af:	90                   	nop
  4014b0:	c3                   	retq   

00000000004014b1 <blank_line>:
  4014b1:	55                   	push   %rbp
  4014b2:	53                   	push   %rbx
  4014b3:	48 83 ec 08          	sub    $0x8,%rsp
  4014b7:	48 89 fd             	mov    %rdi,%rbp
  4014ba:	eb 1e                	jmp    4014da <blank_line+0x29>
  4014bc:	e8 87 f6 ff ff       	callq  400b48 <__ctype_b_loc@plt>
  4014c1:	48 0f be db          	movsbq %bl,%rbx
  4014c5:	48 8b 00             	mov    (%rax),%rax
  4014c8:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
  4014cd:	75 07                	jne    4014d6 <blank_line+0x25>
  4014cf:	b8 00 00 00 00       	mov    $0x0,%eax
  4014d4:	eb 11                	jmp    4014e7 <blank_line+0x36>
  4014d6:	48 83 c5 01          	add    $0x1,%rbp
  4014da:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  4014de:	84 db                	test   %bl,%bl
  4014e0:	75 da                	jne    4014bc <blank_line+0xb>
  4014e2:	b8 01 00 00 00       	mov    $0x1,%eax
  4014e7:	48 83 c4 08          	add    $0x8,%rsp
  4014eb:	5b                   	pop    %rbx
  4014ec:	5d                   	pop    %rbp
  4014ed:	c3                   	retq   

00000000004014ee <skip>:
  4014ee:	53                   	push   %rbx
  4014ef:	48 63 3d 72 28 20 00 	movslq 0x202872(%rip),%rdi        # 603d68 <num_input_strings>
  4014f6:	48 69 ff b4 00 00 00 	imul   $0xb4,%rdi,%rdi
  4014fd:	48 81 c7 80 3d 60 00 	add    $0x603d80,%rdi
  401504:	48 8b 15 65 28 20 00 	mov    0x202865(%rip),%rdx        # 603d70 <infile>
  40150b:	be b4 00 00 00       	mov    $0xb4,%esi
  401510:	e8 13 f6 ff ff       	callq  400b28 <fgets@plt>
  401515:	48 89 c3             	mov    %rax,%rbx
  401518:	48 85 c0             	test   %rax,%rax
  40151b:	74 0c                	je     401529 <skip+0x3b>
  40151d:	48 89 c7             	mov    %rax,%rdi
  401520:	e8 8c ff ff ff       	callq  4014b1 <blank_line>
  401525:	85 c0                	test   %eax,%eax
  401527:	75 c6                	jne    4014ef <skip+0x1>
  401529:	48 89 d8             	mov    %rbx,%rax
  40152c:	5b                   	pop    %rbx
  40152d:	c3                   	retq   

000000000040152e <read_line>:
  40152e:	55                   	push   %rbp
  40152f:	53                   	push   %rbx
  401530:	48 83 ec 08          	sub    $0x8,%rsp
  401534:	b8 00 00 00 00       	mov    $0x0,%eax
  401539:	e8 b0 ff ff ff       	callq  4014ee <skip>
  40153e:	48 85 c0             	test   %rax,%rax
  401541:	75 6e                	jne    4015b1 <read_line+0x83>
  401543:	48 8b 05 f6 27 20 00 	mov    0x2027f6(%rip),%rax        # 603d40 <__bss_start>
  40154a:	48 39 05 1f 28 20 00 	cmp    %rax,0x20281f(%rip)        # 603d70 <infile>
  401551:	75 14                	jne    401567 <read_line+0x39>
  401553:	bf 1c 25 40 00       	mov    $0x40251c,%edi
  401558:	e8 5b f5 ff ff       	callq  400ab8 <puts@plt>
  40155d:	bf 08 00 00 00       	mov    $0x8,%edi
  401562:	e8 71 f5 ff ff       	callq  400ad8 <exit@plt>
  401567:	bf 3a 25 40 00       	mov    $0x40253a,%edi
  40156c:	e8 67 f6 ff ff       	callq  400bd8 <getenv@plt>
  401571:	48 85 c0             	test   %rax,%rax
  401574:	74 0a                	je     401580 <read_line+0x52>
  401576:	bf 00 00 00 00       	mov    $0x0,%edi
  40157b:	e8 58 f5 ff ff       	callq  400ad8 <exit@plt>
  401580:	48 8b 05 b9 27 20 00 	mov    0x2027b9(%rip),%rax        # 603d40 <__bss_start>
  401587:	48 89 05 e2 27 20 00 	mov    %rax,0x2027e2(%rip)        # 603d70 <infile>
  40158e:	b8 00 00 00 00       	mov    $0x0,%eax
  401593:	e8 56 ff ff ff       	callq  4014ee <skip>
  401598:	48 85 c0             	test   %rax,%rax
  40159b:	75 14                	jne    4015b1 <read_line+0x83>
  40159d:	bf 1c 25 40 00       	mov    $0x40251c,%edi
  4015a2:	e8 11 f5 ff ff       	callq  400ab8 <puts@plt>
  4015a7:	bf 00 00 00 00       	mov    $0x0,%edi
  4015ac:	e8 27 f5 ff ff       	callq  400ad8 <exit@plt>
  4015b1:	bd 80 3d 60 00       	mov    $0x603d80,%ebp
  4015b6:	48 63 05 ab 27 20 00 	movslq 0x2027ab(%rip),%rax        # 603d68 <num_input_strings>
  4015bd:	48 69 c0 b4 00 00 00 	imul   $0xb4,%rax,%rax
  4015c4:	48 8d b8 80 3d 60 00 	lea    0x603d80(%rax),%rdi
  4015cb:	b8 00 00 00 00       	mov    $0x0,%eax
  4015d0:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4015d7:	f2 ae                	repnz scas %es:(%rdi),%al
  4015d9:	48 f7 d1             	not    %rcx
  4015dc:	8d 59 ff             	lea    -0x1(%rcx),%ebx
  4015df:	81 fb b2 00 00 00    	cmp    $0xb2,%ebx
  4015e5:	7e 47                	jle    40162e <read_line+0x100>
  4015e7:	bf 45 25 40 00       	mov    $0x402545,%edi
  4015ec:	e8 c7 f4 ff ff       	callq  400ab8 <puts@plt>
  4015f1:	8b 05 71 27 20 00    	mov    0x202771(%rip),%eax        # 603d68 <num_input_strings>
  4015f7:	8d 50 01             	lea    0x1(%rax),%edx
  4015fa:	89 15 68 27 20 00    	mov    %edx,0x202768(%rip)        # 603d68 <num_input_strings>
  401600:	48 98                	cltq   
  401602:	48 69 c0 b4 00 00 00 	imul   $0xb4,%rax,%rax
  401609:	48 8d 44 05 00       	lea    0x0(%rbp,%rax,1),%rax
  40160e:	c7 00 2a 2a 2a 74    	movl   $0x742a2a2a,(%rax)
  401614:	c7 40 04 72 75 6e 63 	movl   $0x636e7572,0x4(%rax)
  40161b:	c7 40 08 61 74 65 64 	movl   $0x64657461,0x8(%rax)
  401622:	c7 40 0c 2a 2a 2a 00 	movl   $0x2a2a2a,0xc(%rax)
  401629:	e8 a4 fd ff ff       	callq  4013d2 <explode_bomb>
  40162e:	8b 15 34 27 20 00    	mov    0x202734(%rip),%edx        # 603d68 <num_input_strings>
  401634:	83 eb 01             	sub    $0x1,%ebx
  401637:	48 63 db             	movslq %ebx,%rbx
  40163a:	48 63 c2             	movslq %edx,%rax
  40163d:	48 69 c0 b4 00 00 00 	imul   $0xb4,%rax,%rax
  401644:	c6 84 03 80 3d 60 00 	movb   $0x0,0x603d80(%rbx,%rax,1)
  40164b:	00 
  40164c:	83 c2 01             	add    $0x1,%edx
  40164f:	89 15 13 27 20 00    	mov    %edx,0x202713(%rip)        # 603d68 <num_input_strings>
  401655:	48 8d 44 05 00       	lea    0x0(%rbp,%rax,1),%rax
  40165a:	48 83 c4 08          	add    $0x8,%rsp
  40165e:	5b                   	pop    %rbx
  40165f:	5d                   	pop    %rbp
  401660:	c3                   	retq   

0000000000401661 <initialize_bomb>:
  401661:	55                   	push   %rbp
  401662:	53                   	push   %rbx
  401663:	48 81 ec 48 20 00 00 	sub    $0x2048,%rsp
  40166a:	be 1e 17 40 00       	mov    $0x40171e,%esi
  40166f:	bf 02 00 00 00       	mov    $0x2,%edi
  401674:	e8 3f f5 ff ff       	callq  400bb8 <signal@plt>
  401679:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  401680:	00 
  401681:	be 40 00 00 00       	mov    $0x40,%esi
  401686:	e8 0d f5 ff ff       	callq  400b98 <gethostname@plt>
  40168b:	85 c0                	test   %eax,%eax
  40168d:	75 1b                	jne    4016aa <initialize_bomb+0x49>
  40168f:	48 8b 3d aa 22 20 00 	mov    0x2022aa(%rip),%rdi        # 603940 <host_table>
  401696:	bb 48 39 60 00       	mov    $0x603948,%ebx
  40169b:	48 8d ac 24 00 20 00 	lea    0x2000(%rsp),%rbp
  4016a2:	00 
  4016a3:	48 85 ff             	test   %rdi,%rdi
  4016a6:	75 16                	jne    4016be <initialize_bomb+0x5d>
  4016a8:	eb 56                	jmp    401700 <initialize_bomb+0x9f>
  4016aa:	bf f8 26 40 00       	mov    $0x4026f8,%edi
  4016af:	e8 04 f4 ff ff       	callq  400ab8 <puts@plt>
  4016b4:	bf 08 00 00 00       	mov    $0x8,%edi
  4016b9:	e8 1a f4 ff ff       	callq  400ad8 <exit@plt>
  4016be:	48 89 ee             	mov    %rbp,%rsi
  4016c1:	e8 22 f4 ff ff       	callq  400ae8 <strcasecmp@plt>
  4016c6:	85 c0                	test   %eax,%eax
  4016c8:	74 0e                	je     4016d8 <initialize_bomb+0x77>
  4016ca:	48 8b 3b             	mov    (%rbx),%rdi
  4016cd:	48 83 c3 08          	add    $0x8,%rbx
  4016d1:	48 85 ff             	test   %rdi,%rdi
  4016d4:	75 e8                	jne    4016be <initialize_bomb+0x5d>
  4016d6:	eb 28                	jmp    401700 <initialize_bomb+0x9f>
  4016d8:	48 89 e7             	mov    %rsp,%rdi
  4016db:	e8 90 00 00 00       	callq  401770 <init_driver>
  4016e0:	85 c0                	test   %eax,%eax
  4016e2:	79 30                	jns    401714 <initialize_bomb+0xb3>
  4016e4:	48 89 e6             	mov    %rsp,%rsi
  4016e7:	bf 60 25 40 00       	mov    $0x402560,%edi
  4016ec:	b8 00 00 00 00       	mov    $0x0,%eax
  4016f1:	e8 92 f3 ff ff       	callq  400a88 <printf@plt>
  4016f6:	bf 08 00 00 00       	mov    $0x8,%edi
  4016fb:	e8 d8 f3 ff ff       	callq  400ad8 <exit@plt>
  401700:	bf 30 27 40 00       	mov    $0x402730,%edi
  401705:	e8 ae f3 ff ff       	callq  400ab8 <puts@plt>
  40170a:	bf 08 00 00 00       	mov    $0x8,%edi
  40170f:	e8 c4 f3 ff ff       	callq  400ad8 <exit@plt>
  401714:	48 81 c4 48 20 00 00 	add    $0x2048,%rsp
  40171b:	5b                   	pop    %rbx
  40171c:	5d                   	pop    %rbp
  40171d:	c3                   	retq   

000000000040171e <sig_handler>:
  40171e:	48 83 ec 08          	sub    $0x8,%rsp
  401722:	bf 68 27 40 00       	mov    $0x402768,%edi
  401727:	e8 8c f3 ff ff       	callq  400ab8 <puts@plt>
  40172c:	bf 03 00 00 00       	mov    $0x3,%edi
  401731:	e8 32 f4 ff ff       	callq  400b68 <sleep@plt>
  401736:	bf 7a 25 40 00       	mov    $0x40257a,%edi
  40173b:	b8 00 00 00 00       	mov    $0x0,%eax
  401740:	e8 43 f3 ff ff       	callq  400a88 <printf@plt>
  401745:	48 8b 3d 04 26 20 00 	mov    0x202604(%rip),%rdi        # 603d50 <stdout@@GLIBC_2.2.5>
  40174c:	e8 e7 f4 ff ff       	callq  400c38 <fflush@plt>
  401751:	bf 01 00 00 00       	mov    $0x1,%edi
  401756:	e8 0d f4 ff ff       	callq  400b68 <sleep@plt>
  40175b:	bf 82 25 40 00       	mov    $0x402582,%edi
  401760:	e8 53 f3 ff ff       	callq  400ab8 <puts@plt>
  401765:	bf 10 00 00 00       	mov    $0x10,%edi
  40176a:	e8 69 f3 ff ff       	callq  400ad8 <exit@plt>
  40176f:	90                   	nop

0000000000401770 <init_driver>:
  401770:	41 54                	push   %r12
  401772:	55                   	push   %rbp
  401773:	53                   	push   %rbx
  401774:	48 83 ec 10          	sub    $0x10,%rsp
  401778:	49 89 fc             	mov    %rdi,%r12
  40177b:	be 01 00 00 00       	mov    $0x1,%esi
  401780:	bf 0d 00 00 00       	mov    $0xd,%edi
  401785:	e8 2e f4 ff ff       	callq  400bb8 <signal@plt>
  40178a:	be 01 00 00 00       	mov    $0x1,%esi
  40178f:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401794:	e8 1f f4 ff ff       	callq  400bb8 <signal@plt>
  401799:	be 01 00 00 00       	mov    $0x1,%esi
  40179e:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4017a3:	e8 10 f4 ff ff       	callq  400bb8 <signal@plt>
  4017a8:	ba 00 00 00 00       	mov    $0x0,%edx
  4017ad:	be 01 00 00 00       	mov    $0x1,%esi
  4017b2:	bf 02 00 00 00       	mov    $0x2,%edi
  4017b7:	e8 0c f4 ff ff       	callq  400bc8 <socket@plt>
  4017bc:	89 c5                	mov    %eax,%ebp
  4017be:	85 c0                	test   %eax,%eax
  4017c0:	79 62                	jns    401824 <init_driver+0xb4>
  4017c2:	41 c7 04 24 45 72 72 	movl   $0x6f727245,(%r12)
  4017c9:	6f 
  4017ca:	41 c7 44 24 04 72 3a 	movl   $0x43203a72,0x4(%r12)
  4017d1:	20 43 
  4017d3:	41 c7 44 24 08 6c 69 	movl   $0x6e65696c,0x8(%r12)
  4017da:	65 6e 
  4017dc:	41 c7 44 24 0c 74 20 	movl   $0x6e752074,0xc(%r12)
  4017e3:	75 6e 
  4017e5:	41 c7 44 24 10 61 62 	movl   $0x656c6261,0x10(%r12)
  4017ec:	6c 65 
  4017ee:	41 c7 44 24 14 20 74 	movl   $0x206f7420,0x14(%r12)
  4017f5:	6f 20 
  4017f7:	41 c7 44 24 18 63 72 	movl   $0x61657263,0x18(%r12)
  4017fe:	65 61 
  401800:	41 c7 44 24 1c 74 65 	movl   $0x73206574,0x1c(%r12)
  401807:	20 73 
  401809:	41 c7 44 24 20 6f 63 	movl   $0x656b636f,0x20(%r12)
  401810:	6b 65 
  401812:	66 41 c7 44 24 24 74 	movw   $0x74,0x24(%r12)
  401819:	00 
  40181a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40181f:	e9 18 01 00 00       	jmpq   40193c <init_driver+0x1cc>
  401824:	bf 8a 25 40 00       	mov    $0x40258a,%edi
  401829:	e8 7a f2 ff ff       	callq  400aa8 <gethostbyname@plt>
  40182e:	48 85 c0             	test   %rax,%rax
  401831:	0f 85 81 00 00 00    	jne    4018b8 <init_driver+0x148>
  401837:	41 c7 04 24 45 72 72 	movl   $0x6f727245,(%r12)
  40183e:	6f 
  40183f:	41 c7 44 24 04 72 3a 	movl   $0x44203a72,0x4(%r12)
  401846:	20 44 
  401848:	41 c7 44 24 08 4e 53 	movl   $0x6920534e,0x8(%r12)
  40184f:	20 69 
  401851:	41 c7 44 24 0c 73 20 	movl   $0x6e752073,0xc(%r12)
  401858:	75 6e 
  40185a:	41 c7 44 24 10 61 62 	movl   $0x656c6261,0x10(%r12)
  401861:	6c 65 
  401863:	41 c7 44 24 14 20 74 	movl   $0x206f7420,0x14(%r12)
  40186a:	6f 20 
  40186c:	41 c7 44 24 18 72 65 	movl   $0x6f736572,0x18(%r12)
  401873:	73 6f 
  401875:	41 c7 44 24 1c 6c 76 	movl   $0x2065766c,0x1c(%r12)
  40187c:	65 20 
  40187e:	41 c7 44 24 20 73 65 	movl   $0x76726573,0x20(%r12)
  401885:	72 76 
  401887:	41 c7 44 24 24 65 72 	movl   $0x61207265,0x24(%r12)
  40188e:	20 61 
  401890:	41 c7 44 24 28 64 64 	movl   $0x65726464,0x28(%r12)
  401897:	72 65 
  401899:	66 41 c7 44 24 2c 73 	movw   $0x7373,0x2c(%r12)
  4018a0:	73 
  4018a1:	41 c6 44 24 2e 00    	movb   $0x0,0x2e(%r12)
  4018a7:	89 ef                	mov    %ebp,%edi
  4018a9:	e8 ea f1 ff ff       	callq  400a98 <close@plt>
  4018ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4018b3:	e9 84 00 00 00       	jmpq   40193c <init_driver+0x1cc>
  4018b8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4018bf:	00 
  4018c0:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  4018c7:	00 00 
  4018c9:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  4018cf:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4018d3:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  4018d8:	48 8b 40 18          	mov    0x18(%rax),%rax
  4018dc:	48 8b 38             	mov    (%rax),%rdi
  4018df:	e8 54 f2 ff ff       	callq  400b38 <bcopy@plt>
  4018e4:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
  4018eb:	ba 10 00 00 00       	mov    $0x10,%edx
  4018f0:	48 89 e6             	mov    %rsp,%rsi
  4018f3:	89 ef                	mov    %ebp,%edi
  4018f5:	e8 8e f2 ff ff       	callq  400b88 <connect@plt>
  4018fa:	85 c0                	test   %eax,%eax
  4018fc:	79 25                	jns    401923 <init_driver+0x1b3>
  4018fe:	ba 8a 25 40 00       	mov    $0x40258a,%edx
  401903:	be e0 27 40 00       	mov    $0x4027e0,%esi
  401908:	4c 89 e7             	mov    %r12,%rdi
  40190b:	b8 00 00 00 00       	mov    $0x0,%eax
  401910:	e8 43 f2 ff ff       	callq  400b58 <sprintf@plt>
  401915:	89 ef                	mov    %ebp,%edi
  401917:	e8 7c f1 ff ff       	callq  400a98 <close@plt>
  40191c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401921:	eb 19                	jmp    40193c <init_driver+0x1cc>
  401923:	89 ef                	mov    %ebp,%edi
  401925:	e8 6e f1 ff ff       	callq  400a98 <close@plt>
  40192a:	66 41 c7 04 24 4f 4b 	movw   $0x4b4f,(%r12)
  401931:	41 c6 44 24 02 00    	movb   $0x0,0x2(%r12)
  401937:	b8 00 00 00 00       	mov    $0x0,%eax
  40193c:	48 83 c4 10          	add    $0x10,%rsp
  401940:	5b                   	pop    %rbx
  401941:	5d                   	pop    %rbp
  401942:	41 5c                	pop    %r12
  401944:	c3                   	retq   

0000000000401945 <init_timeout>:
  401945:	53                   	push   %rbx
  401946:	89 fb                	mov    %edi,%ebx
  401948:	85 ff                	test   %edi,%edi
  40194a:	74 1e                	je     40196a <init_timeout+0x25>
  40194c:	be 22 21 40 00       	mov    $0x402122,%esi
  401951:	bf 0e 00 00 00       	mov    $0xe,%edi
  401956:	e8 5d f2 ff ff       	callq  400bb8 <signal@plt>
  40195b:	85 db                	test   %ebx,%ebx
  40195d:	bf 00 00 00 00       	mov    $0x0,%edi
  401962:	0f 49 fb             	cmovns %ebx,%edi
  401965:	e8 7e f2 ff ff       	callq  400be8 <alarm@plt>
  40196a:	5b                   	pop    %rbx
  40196b:	c3                   	retq   

000000000040196c <rio_readlineb>:
  40196c:	41 57                	push   %r15
  40196e:	41 56                	push   %r14
  401970:	41 55                	push   %r13
  401972:	41 54                	push   %r12
  401974:	55                   	push   %rbp
  401975:	53                   	push   %rbx
  401976:	48 83 ec 28          	sub    $0x28,%rsp
  40197a:	48 89 fb             	mov    %rdi,%rbx
  40197d:	48 89 14 24          	mov    %rdx,(%rsp)
  401981:	49 89 f7             	mov    %rsi,%r15
  401984:	48 83 fa 01          	cmp    $0x1,%rdx
  401988:	0f 86 c0 00 00 00    	jbe    401a4e <rio_readlineb+0xe2>
  40198e:	4c 8d 6f 10          	lea    0x10(%rdi),%r13
  401992:	4d 89 ec             	mov    %r13,%r12
  401995:	41 be 01 00 00 00    	mov    $0x1,%r14d
  40199b:	eb 38                	jmp    4019d5 <rio_readlineb+0x69>
  40199d:	ba 00 20 00 00       	mov    $0x2000,%edx
  4019a2:	4c 89 ee             	mov    %r13,%rsi
  4019a5:	8b 3b                	mov    (%rbx),%edi
  4019a7:	e8 4c f1 ff ff       	callq  400af8 <read@plt>
  4019ac:	89 43 04             	mov    %eax,0x4(%rbx)
  4019af:	85 c0                	test   %eax,%eax
  4019b1:	79 16                	jns    4019c9 <rio_readlineb+0x5d>
  4019b3:	e8 40 f2 ff ff       	callq  400bf8 <__errno_location@plt>
  4019b8:	83 38 04             	cmpl   $0x4,(%rax)
  4019bb:	74 18                	je     4019d5 <rio_readlineb+0x69>
  4019bd:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4019c4:	e9 a6 00 00 00       	jmpq   401a6f <rio_readlineb+0x103>
  4019c9:	85 c0                	test   %eax,%eax
  4019cb:	0f 84 99 00 00 00    	je     401a6a <rio_readlineb+0xfe>
  4019d1:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  4019d5:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4019d8:	85 ed                	test   %ebp,%ebp
  4019da:	7e c1                	jle    40199d <rio_readlineb+0x31>
  4019dc:	85 ed                	test   %ebp,%ebp
  4019de:	0f 85 90 00 00 00    	jne    401a74 <rio_readlineb+0x108>
  4019e4:	48 63 c5             	movslq %ebp,%rax
  4019e7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4019ec:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4019f0:	48 89 c2             	mov    %rax,%rdx
  4019f3:	48 8d 7c 24 1f       	lea    0x1f(%rsp),%rdi
  4019f8:	e8 ab f1 ff ff       	callq  400ba8 <memcpy@plt>
  4019fd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  401a02:	48 01 43 08          	add    %rax,0x8(%rbx)
  401a06:	29 6b 04             	sub    %ebp,0x4(%rbx)
  401a09:	89 c2                	mov    %eax,%edx
  401a0b:	83 f8 01             	cmp    $0x1,%eax
  401a0e:	75 15                	jne    401a25 <rio_readlineb+0xb9>
  401a10:	0f b6 44 24 1f       	movzbl 0x1f(%rsp),%eax
  401a15:	41 88 07             	mov    %al,(%r15)
  401a18:	49 83 c7 01          	add    $0x1,%r15
  401a1c:	80 7c 24 1f 0a       	cmpb   $0xa,0x1f(%rsp)
  401a21:	75 1c                	jne    401a3f <rio_readlineb+0xd3>
  401a23:	eb 2f                	jmp    401a54 <rio_readlineb+0xe8>
  401a25:	44 89 f1             	mov    %r14d,%ecx
  401a28:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401a2f:	85 d2                	test   %edx,%edx
  401a31:	75 28                	jne    401a5b <rio_readlineb+0xef>
  401a33:	b8 00 00 00 00       	mov    $0x0,%eax
  401a38:	83 f9 01             	cmp    $0x1,%ecx
  401a3b:	75 17                	jne    401a54 <rio_readlineb+0xe8>
  401a3d:	eb 1c                	jmp    401a5b <rio_readlineb+0xef>
  401a3f:	41 83 c6 01          	add    $0x1,%r14d
  401a43:	49 63 c6             	movslq %r14d,%rax
  401a46:	48 3b 04 24          	cmp    (%rsp),%rax
  401a4a:	72 89                	jb     4019d5 <rio_readlineb+0x69>
  401a4c:	eb 06                	jmp    401a54 <rio_readlineb+0xe8>
  401a4e:	41 be 01 00 00 00    	mov    $0x1,%r14d
  401a54:	41 c6 07 00          	movb   $0x0,(%r15)
  401a58:	49 63 c6             	movslq %r14d,%rax
  401a5b:	48 83 c4 28          	add    $0x28,%rsp
  401a5f:	5b                   	pop    %rbx
  401a60:	5d                   	pop    %rbp
  401a61:	41 5c                	pop    %r12
  401a63:	41 5d                	pop    %r13
  401a65:	41 5e                	pop    %r14
  401a67:	41 5f                	pop    %r15
  401a69:	c3                   	retq   
  401a6a:	ba 00 00 00 00       	mov    $0x0,%edx
  401a6f:	44 89 f1             	mov    %r14d,%ecx
  401a72:	eb b4                	jmp    401a28 <rio_readlineb+0xbc>
  401a74:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401a78:	0f b6 00             	movzbl (%rax),%eax
  401a7b:	88 44 24 1f          	mov    %al,0x1f(%rsp)
  401a7f:	48 83 43 08 01       	addq   $0x1,0x8(%rbx)
  401a84:	83 6b 04 01          	subl   $0x1,0x4(%rbx)
  401a88:	eb 86                	jmp    401a10 <rio_readlineb+0xa4>

0000000000401a8a <submitr>:
  401a8a:	41 57                	push   %r15
  401a8c:	41 56                	push   %r14
  401a8e:	41 55                	push   %r13
  401a90:	41 54                	push   %r12
  401a92:	55                   	push   %rbp
  401a93:	53                   	push   %rbx
  401a94:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  401a9b:	48 89 fb             	mov    %rdi,%rbx
  401a9e:	41 89 f4             	mov    %esi,%r12d
  401aa1:	48 89 14 24          	mov    %rdx,(%rsp)
  401aa5:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  401aaa:	4d 89 c7             	mov    %r8,%r15
  401aad:	4c 89 cd             	mov    %r9,%rbp
  401ab0:	4c 8b b4 24 90 a0 00 	mov    0xa090(%rsp),%r14
  401ab7:	00 
  401ab8:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  401abf:	00 00 00 00 
  401ac3:	ba 00 00 00 00       	mov    $0x0,%edx
  401ac8:	be 01 00 00 00       	mov    $0x1,%esi
  401acd:	bf 02 00 00 00       	mov    $0x2,%edi
  401ad2:	e8 f1 f0 ff ff       	callq  400bc8 <socket@plt>
  401ad7:	41 89 c5             	mov    %eax,%r13d
  401ada:	85 c0                	test   %eax,%eax
  401adc:	79 19                	jns    401af7 <submitr+0x6d>
  401ade:	be 08 28 40 00       	mov    $0x402808,%esi
  401ae3:	b9 26 00 00 00       	mov    $0x26,%ecx
  401ae8:	4c 89 f7             	mov    %r14,%rdi
  401aeb:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401aed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401af2:	e9 45 05 00 00       	jmpq   40203c <submitr+0x5b2>
  401af7:	48 89 df             	mov    %rbx,%rdi
  401afa:	e8 a9 ef ff ff       	callq  400aa8 <gethostbyname@plt>
  401aff:	48 85 c0             	test   %rax,%rax
  401b02:	75 21                	jne    401b25 <submitr+0x9b>
  401b04:	be 30 28 40 00       	mov    $0x402830,%esi
  401b09:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  401b0e:	4c 89 f7             	mov    %r14,%rdi
  401b11:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401b13:	44 89 ef             	mov    %r13d,%edi
  401b16:	e8 7d ef ff ff       	callq  400a98 <close@plt>
  401b1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b20:	e9 17 05 00 00       	jmpq   40203c <submitr+0x5b2>
  401b25:	48 8d 9c 24 40 a0 00 	lea    0xa040(%rsp),%rbx
  401b2c:	00 
  401b2d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  401b34:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
  401b3b:	00 
  401b3c:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  401b43:	00 02 00 
  401b46:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401b4a:	48 8d 73 04          	lea    0x4(%rbx),%rsi
  401b4e:	48 8b 40 18          	mov    0x18(%rax),%rax
  401b52:	48 8b 38             	mov    (%rax),%rdi
  401b55:	e8 de ef ff ff       	callq  400b38 <bcopy@plt>
  401b5a:	66 41 c1 cc 08       	ror    $0x8,%r12w
  401b5f:	66 44 89 a4 24 42 a0 	mov    %r12w,0xa042(%rsp)
  401b66:	00 00 
  401b68:	ba 10 00 00 00       	mov    $0x10,%edx
  401b6d:	48 89 de             	mov    %rbx,%rsi
  401b70:	44 89 ef             	mov    %r13d,%edi
  401b73:	e8 10 f0 ff ff       	callq  400b88 <connect@plt>
  401b78:	85 c0                	test   %eax,%eax
  401b7a:	79 21                	jns    401b9d <submitr+0x113>
  401b7c:	be 60 28 40 00       	mov    $0x402860,%esi
  401b81:	b9 27 00 00 00       	mov    $0x27,%ecx
  401b86:	4c 89 f7             	mov    %r14,%rdi
  401b89:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401b8b:	44 89 ef             	mov    %r13d,%edi
  401b8e:	e8 05 ef ff ff       	callq  400a98 <close@plt>
  401b93:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b98:	e9 9f 04 00 00       	jmpq   40203c <submitr+0x5b2>
  401b9d:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401ba4:	48 89 ef             	mov    %rbp,%rdi
  401ba7:	b8 00 00 00 00       	mov    $0x0,%eax
  401bac:	48 89 d1             	mov    %rdx,%rcx
  401baf:	f2 ae                	repnz scas %es:(%rdi),%al
  401bb1:	48 89 cb             	mov    %rcx,%rbx
  401bb4:	48 f7 d3             	not    %rbx
  401bb7:	48 8b 3c 24          	mov    (%rsp),%rdi
  401bbb:	48 89 d1             	mov    %rdx,%rcx
  401bbe:	f2 ae                	repnz scas %es:(%rdi),%al
  401bc0:	48 89 ce             	mov    %rcx,%rsi
  401bc3:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  401bc8:	48 89 d1             	mov    %rdx,%rcx
  401bcb:	f2 ae                	repnz scas %es:(%rdi),%al
  401bcd:	49 89 c8             	mov    %rcx,%r8
  401bd0:	49 f7 d0             	not    %r8
  401bd3:	4c 89 ff             	mov    %r15,%rdi
  401bd6:	48 89 d1             	mov    %rdx,%rcx
  401bd9:	f2 ae                	repnz scas %es:(%rdi),%al
  401bdb:	49 29 f0             	sub    %rsi,%r8
  401bde:	49 29 c8             	sub    %rcx,%r8
  401be1:	48 8d 5c 5b fd       	lea    -0x3(%rbx,%rbx,2),%rbx
  401be6:	49 8d 44 18 7b       	lea    0x7b(%r8,%rbx,1),%rax
  401beb:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  401bf1:	0f 86 81 00 00 00    	jbe    401c78 <submitr+0x1ee>
  401bf7:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401bfe:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401c05:	52 
  401c06:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401c0d:	6c 
  401c0e:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401c15:	74 
  401c16:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401c1d:	67 
  401c1e:	41 c7 46 14 20 74 6f 	movl   $0x6f6f7420,0x14(%r14)
  401c25:	6f 
  401c26:	41 c7 46 18 20 6c 61 	movl   $0x72616c20,0x18(%r14)
  401c2d:	72 
  401c2e:	41 c7 46 1c 67 65 2e 	movl   $0x202e6567,0x1c(%r14)
  401c35:	20 
  401c36:	41 c7 46 20 49 6e 63 	movl   $0x72636e49,0x20(%r14)
  401c3d:	72 
  401c3e:	41 c7 46 24 65 61 73 	movl   $0x65736165,0x24(%r14)
  401c45:	65 
  401c46:	41 c7 46 28 20 53 55 	movl   $0x42555320,0x28(%r14)
  401c4d:	42 
  401c4e:	41 c7 46 2c 4d 49 54 	movl   $0x5254494d,0x2c(%r14)
  401c55:	52 
  401c56:	41 c7 46 30 5f 4d 41 	movl   $0x58414d5f,0x30(%r14)
  401c5d:	58 
  401c5e:	41 c7 46 34 42 55 46 	movl   $0x465542,0x34(%r14)
  401c65:	00 
  401c66:	44 89 ef             	mov    %r13d,%edi
  401c69:	e8 2a ee ff ff       	callq  400a98 <close@plt>
  401c6e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c73:	e9 c4 03 00 00       	jmpq   40203c <submitr+0x5b2>
  401c78:	48 8d 94 24 30 40 00 	lea    0x4030(%rsp),%rdx
  401c7f:	00 
  401c80:	b9 00 04 00 00       	mov    $0x400,%ecx
  401c85:	b8 00 00 00 00       	mov    $0x0,%eax
  401c8a:	48 89 d7             	mov    %rdx,%rdi
  401c8d:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401c90:	48 89 ef             	mov    %rbp,%rdi
  401c93:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401c9a:	f2 ae                	repnz scas %es:(%rdi),%al
  401c9c:	48 f7 d1             	not    %rcx
  401c9f:	83 e9 01             	sub    $0x1,%ecx
  401ca2:	0f 84 a6 03 00 00    	je     40204e <submitr+0x5c4>
  401ca8:	48 89 d3             	mov    %rdx,%rbx
  401cab:	44 8d 61 ff          	lea    -0x1(%rcx),%r12d
  401caf:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  401cb3:	3c 2a                	cmp    $0x2a,%al
  401cb5:	74 24                	je     401cdb <submitr+0x251>
  401cb7:	3c 2d                	cmp    $0x2d,%al
  401cb9:	74 20                	je     401cdb <submitr+0x251>
  401cbb:	3c 2e                	cmp    $0x2e,%al
  401cbd:	74 1c                	je     401cdb <submitr+0x251>
  401cbf:	3c 5f                	cmp    $0x5f,%al
  401cc1:	74 18                	je     401cdb <submitr+0x251>
  401cc3:	8d 50 d0             	lea    -0x30(%rax),%edx
  401cc6:	80 fa 09             	cmp    $0x9,%dl
  401cc9:	76 10                	jbe    401cdb <submitr+0x251>
  401ccb:	8d 50 bf             	lea    -0x41(%rax),%edx
  401cce:	80 fa 19             	cmp    $0x19,%dl
  401cd1:	76 08                	jbe    401cdb <submitr+0x251>
  401cd3:	8d 50 9f             	lea    -0x61(%rax),%edx
  401cd6:	80 fa 19             	cmp    $0x19,%dl
  401cd9:	77 08                	ja     401ce3 <submitr+0x259>
  401cdb:	88 03                	mov    %al,(%rbx)
  401cdd:	48 83 c3 01          	add    $0x1,%rbx
  401ce1:	eb 4b                	jmp    401d2e <submitr+0x2a4>
  401ce3:	3c 20                	cmp    $0x20,%al
  401ce5:	75 09                	jne    401cf0 <submitr+0x266>
  401ce7:	c6 03 2b             	movb   $0x2b,(%rbx)
  401cea:	48 83 c3 01          	add    $0x1,%rbx
  401cee:	eb 3e                	jmp    401d2e <submitr+0x2a4>
  401cf0:	8d 50 e0             	lea    -0x20(%rax),%edx
  401cf3:	80 fa 5f             	cmp    $0x5f,%dl
  401cf6:	76 04                	jbe    401cfc <submitr+0x272>
  401cf8:	3c 09                	cmp    $0x9,%al
  401cfa:	75 48                	jne    401d44 <submitr+0x2ba>
  401cfc:	0f b6 d0             	movzbl %al,%edx
  401cff:	be a0 27 40 00       	mov    $0x4027a0,%esi
  401d04:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  401d09:	b8 00 00 00 00       	mov    $0x0,%eax
  401d0e:	e8 45 ee ff ff       	callq  400b58 <sprintf@plt>
  401d13:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
  401d18:	88 03                	mov    %al,(%rbx)
  401d1a:	0f b6 44 24 11       	movzbl 0x11(%rsp),%eax
  401d1f:	88 43 01             	mov    %al,0x1(%rbx)
  401d22:	0f b6 44 24 12       	movzbl 0x12(%rsp),%eax
  401d27:	88 43 02             	mov    %al,0x2(%rbx)
  401d2a:	48 83 c3 03          	add    $0x3,%rbx
  401d2e:	45 85 e4             	test   %r12d,%r12d
  401d31:	0f 84 17 03 00 00    	je     40204e <submitr+0x5c4>
  401d37:	48 83 c5 01          	add    $0x1,%rbp
  401d3b:	41 83 ec 01          	sub    $0x1,%r12d
  401d3f:	e9 6b ff ff ff       	jmpq   401caf <submitr+0x225>
  401d44:	be 88 28 40 00       	mov    $0x402888,%esi
  401d49:	b9 43 00 00 00       	mov    $0x43,%ecx
  401d4e:	4c 89 f7             	mov    %r14,%rdi
  401d51:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401d53:	44 89 ef             	mov    %r13d,%edi
  401d56:	e8 3d ed ff ff       	callq  400a98 <close@plt>
  401d5b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401d60:	e9 d7 02 00 00       	jmpq   40203c <submitr+0x5b2>
  401d65:	48 01 c5             	add    %rax,%rbp
  401d68:	48 89 da             	mov    %rbx,%rdx
  401d6b:	48 89 ee             	mov    %rbp,%rsi
  401d6e:	44 89 ef             	mov    %r13d,%edi
  401d71:	e8 b2 ee ff ff       	callq  400c28 <write@plt>
  401d76:	48 85 c0             	test   %rax,%rax
  401d79:	7f 0d                	jg     401d88 <submitr+0x2fe>
  401d7b:	e8 78 ee ff ff       	callq  400bf8 <__errno_location@plt>
  401d80:	83 38 04             	cmpl   $0x4,(%rax)
  401d83:	75 0d                	jne    401d92 <submitr+0x308>
  401d85:	4c 89 f8             	mov    %r15,%rax
  401d88:	48 29 c3             	sub    %rax,%rbx
  401d8b:	75 d8                	jne    401d65 <submitr+0x2db>
  401d8d:	4d 85 e4             	test   %r12,%r12
  401d90:	79 5d                	jns    401def <submitr+0x365>
  401d92:	4c 89 f7             	mov    %r14,%rdi
  401d95:	be d0 28 40 00       	mov    $0x4028d0,%esi
  401d9a:	b8 2c 00 00 00       	mov    $0x2c,%eax
  401d9f:	41 f6 c6 01          	test   $0x1,%r14b
  401da3:	74 04                	je     401da9 <submitr+0x31f>
  401da5:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  401da6:	83 e8 01             	sub    $0x1,%eax
  401da9:	40 f6 c7 02          	test   $0x2,%dil
  401dad:	74 05                	je     401db4 <submitr+0x32a>
  401daf:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
  401db1:	83 e8 02             	sub    $0x2,%eax
  401db4:	89 c1                	mov    %eax,%ecx
  401db6:	c1 e9 02             	shr    $0x2,%ecx
  401db9:	89 c9                	mov    %ecx,%ecx
  401dbb:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  401dbd:	ba 00 00 00 00       	mov    $0x0,%edx
  401dc2:	a8 02                	test   $0x2,%al
  401dc4:	74 0c                	je     401dd2 <submitr+0x348>
  401dc6:	0f b7 0c 16          	movzwl (%rsi,%rdx,1),%ecx
  401dca:	66 89 0c 17          	mov    %cx,(%rdi,%rdx,1)
  401dce:	48 83 c2 02          	add    $0x2,%rdx
  401dd2:	a8 01                	test   $0x1,%al
  401dd4:	74 07                	je     401ddd <submitr+0x353>
  401dd6:	0f b6 04 16          	movzbl (%rsi,%rdx,1),%eax
  401dda:	88 04 17             	mov    %al,(%rdi,%rdx,1)
  401ddd:	44 89 ef             	mov    %r13d,%edi
  401de0:	e8 b3 ec ff ff       	callq  400a98 <close@plt>
  401de5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401dea:	e9 4d 02 00 00       	jmpq   40203c <submitr+0x5b2>
  401def:	44 89 ac 24 30 80 00 	mov    %r13d,0x8030(%rsp)
  401df6:	00 
  401df7:	c7 84 24 34 80 00 00 	movl   $0x0,0x8034(%rsp)
  401dfe:	00 00 00 00 
  401e02:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  401e09:	00 
  401e0a:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401e0e:	48 89 84 24 38 80 00 	mov    %rax,0x8038(%rsp)
  401e15:	00 
  401e16:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  401e1d:	00 
  401e1e:	ba 00 20 00 00       	mov    $0x2000,%edx
  401e23:	e8 44 fb ff ff       	callq  40196c <rio_readlineb>
  401e28:	48 85 c0             	test   %rax,%rax
  401e2b:	7f 21                	jg     401e4e <submitr+0x3c4>
  401e2d:	be 00 29 40 00       	mov    $0x402900,%esi
  401e32:	b9 36 00 00 00       	mov    $0x36,%ecx
  401e37:	4c 89 f7             	mov    %r14,%rdi
  401e3a:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401e3c:	44 89 ef             	mov    %r13d,%edi
  401e3f:	e8 54 ec ff ff       	callq  400a98 <close@plt>
  401e44:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401e49:	e9 ee 01 00 00       	jmpq   40203c <submitr+0x5b2>
  401e4e:	4c 8d bc 24 30 60 00 	lea    0x6030(%rsp),%r15
  401e55:	00 
  401e56:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  401e5d:	00 
  401e5e:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  401e65:	00 
  401e66:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  401e6b:	be a7 27 40 00       	mov    $0x4027a7,%esi
  401e70:	4c 89 ff             	mov    %r15,%rdi
  401e73:	b8 00 00 00 00       	mov    $0x0,%eax
  401e78:	e8 4b ec ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  401e7d:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  401e84:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  401e8a:	0f 84 b8 00 00 00    	je     401f48 <submitr+0x4be>
  401e90:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  401e95:	be 38 29 40 00       	mov    $0x402938,%esi
  401e9a:	4c 89 f7             	mov    %r14,%rdi
  401e9d:	b8 00 00 00 00       	mov    $0x0,%eax
  401ea2:	e8 b1 ec ff ff       	callq  400b58 <sprintf@plt>
  401ea7:	44 89 ef             	mov    %r13d,%edi
  401eaa:	e8 e9 eb ff ff       	callq  400a98 <close@plt>
  401eaf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401eb4:	e9 83 01 00 00       	jmpq   40203c <submitr+0x5b2>
  401eb9:	ba 00 20 00 00       	mov    $0x2000,%edx
  401ebe:	48 89 de             	mov    %rbx,%rsi
  401ec1:	4c 89 e7             	mov    %r12,%rdi
  401ec4:	e8 a3 fa ff ff       	callq  40196c <rio_readlineb>
  401ec9:	48 85 c0             	test   %rax,%rax
  401ecc:	0f 8f 8b 00 00 00    	jg     401f5d <submitr+0x4d3>
  401ed2:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401ed9:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401ee0:	43 
  401ee1:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401ee8:	6e 
  401ee9:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401ef0:	6e 
  401ef1:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401ef8:	65 
  401ef9:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401f00:	20 
  401f01:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  401f08:	64 
  401f09:	41 c7 46 1c 20 68 65 	movl   $0x61656820,0x1c(%r14)
  401f10:	61 
  401f11:	41 c7 46 20 64 65 72 	movl   $0x73726564,0x20(%r14)
  401f18:	73 
  401f19:	41 c7 46 24 20 66 72 	movl   $0x6f726620,0x24(%r14)
  401f20:	6f 
  401f21:	41 c7 46 28 6d 20 73 	movl   $0x6573206d,0x28(%r14)
  401f28:	65 
  401f29:	41 c7 46 2c 72 76 65 	movl   $0x72657672,0x2c(%r14)
  401f30:	72 
  401f31:	41 c6 46 30 00       	movb   $0x0,0x30(%r14)
  401f36:	44 89 ef             	mov    %r13d,%edi
  401f39:	e8 5a eb ff ff       	callq  400a98 <close@plt>
  401f3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f43:	e9 f4 00 00 00       	jmpq   40203c <submitr+0x5b2>
  401f48:	48 8d 9c 24 30 60 00 	lea    0x6030(%rsp),%rbx
  401f4f:	00 
  401f50:	bd b8 27 40 00       	mov    $0x4027b8,%ebp
  401f55:	4c 8d a4 24 30 80 00 	lea    0x8030(%rsp),%r12
  401f5c:	00 
  401f5d:	0f b6 03             	movzbl (%rbx),%eax
  401f60:	3a 45 00             	cmp    0x0(%rbp),%al
  401f63:	0f 85 50 ff ff ff    	jne    401eb9 <submitr+0x42f>
  401f69:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  401f6d:	3a 45 01             	cmp    0x1(%rbp),%al
  401f70:	0f 85 43 ff ff ff    	jne    401eb9 <submitr+0x42f>
  401f76:	0f b6 43 02          	movzbl 0x2(%rbx),%eax
  401f7a:	3a 45 02             	cmp    0x2(%rbp),%al
  401f7d:	0f 85 36 ff ff ff    	jne    401eb9 <submitr+0x42f>
  401f83:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  401f8a:	00 
  401f8b:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  401f92:	00 
  401f93:	ba 00 20 00 00       	mov    $0x2000,%edx
  401f98:	e8 cf f9 ff ff       	callq  40196c <rio_readlineb>
  401f9d:	48 85 c0             	test   %rax,%rax
  401fa0:	7f 5a                	jg     401ffc <submitr+0x572>
  401fa2:	4c 89 f7             	mov    %r14,%rdi
  401fa5:	be 68 29 40 00       	mov    $0x402968,%esi
  401faa:	b8 38 00 00 00       	mov    $0x38,%eax
  401faf:	41 f6 c6 01          	test   $0x1,%r14b
  401fb3:	74 04                	je     401fb9 <submitr+0x52f>
  401fb5:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  401fb6:	83 e8 01             	sub    $0x1,%eax
  401fb9:	40 f6 c7 02          	test   $0x2,%dil
  401fbd:	74 05                	je     401fc4 <submitr+0x53a>
  401fbf:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
  401fc1:	83 e8 02             	sub    $0x2,%eax
  401fc4:	89 c1                	mov    %eax,%ecx
  401fc6:	c1 e9 02             	shr    $0x2,%ecx
  401fc9:	89 c9                	mov    %ecx,%ecx
  401fcb:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  401fcd:	ba 00 00 00 00       	mov    $0x0,%edx
  401fd2:	a8 02                	test   $0x2,%al
  401fd4:	74 0c                	je     401fe2 <submitr+0x558>
  401fd6:	0f b7 0c 16          	movzwl (%rsi,%rdx,1),%ecx
  401fda:	66 89 0c 17          	mov    %cx,(%rdi,%rdx,1)
  401fde:	48 83 c2 02          	add    $0x2,%rdx
  401fe2:	a8 01                	test   $0x1,%al
  401fe4:	74 07                	je     401fed <submitr+0x563>
  401fe6:	0f b6 04 16          	movzbl (%rsi,%rdx,1),%eax
  401fea:	88 04 17             	mov    %al,(%rdi,%rdx,1)
  401fed:	44 89 ef             	mov    %r13d,%edi
  401ff0:	e8 a3 ea ff ff       	callq  400a98 <close@plt>
  401ff5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401ffa:	eb 40                	jmp    40203c <submitr+0x5b2>
  401ffc:	4c 89 fe             	mov    %r15,%rsi
  401fff:	4c 89 f7             	mov    %r14,%rdi
  402002:	e8 01 ec ff ff       	callq  400c08 <strcpy@plt>
  402007:	44 89 ef             	mov    %r13d,%edi
  40200a:	e8 89 ea ff ff       	callq  400a98 <close@plt>
  40200f:	b8 bb 27 40 00       	mov    $0x4027bb,%eax
  402014:	41 0f b6 16          	movzbl (%r14),%edx
  402018:	3a 10                	cmp    (%rax),%dl
  40201a:	75 1b                	jne    402037 <submitr+0x5ad>
  40201c:	41 0f b6 56 01       	movzbl 0x1(%r14),%edx
  402021:	3a 50 01             	cmp    0x1(%rax),%dl
  402024:	75 11                	jne    402037 <submitr+0x5ad>
  402026:	41 0f b6 56 02       	movzbl 0x2(%r14),%edx
  40202b:	3a 50 02             	cmp    0x2(%rax),%dl
  40202e:	75 07                	jne    402037 <submitr+0x5ad>
  402030:	b8 00 00 00 00       	mov    $0x0,%eax
  402035:	eb 05                	jmp    40203c <submitr+0x5b2>
  402037:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40203c:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402043:	5b                   	pop    %rbx
  402044:	5d                   	pop    %rbp
  402045:	41 5c                	pop    %r12
  402047:	41 5d                	pop    %r13
  402049:	41 5e                	pop    %r14
  40204b:	41 5f                	pop    %r15
  40204d:	c3                   	retq   
  40204e:	48 8d 9c 24 30 60 00 	lea    0x6030(%rsp),%rbx
  402055:	00 
  402056:	4c 8d 8c 24 30 40 00 	lea    0x4030(%rsp),%r9
  40205d:	00 
  40205e:	4d 89 f8             	mov    %r15,%r8
  402061:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  402066:	48 8b 14 24          	mov    (%rsp),%rdx
  40206a:	be a0 29 40 00       	mov    $0x4029a0,%esi
  40206f:	48 89 df             	mov    %rbx,%rdi
  402072:	b8 00 00 00 00       	mov    $0x0,%eax
  402077:	e8 dc ea ff ff       	callq  400b58 <sprintf@plt>
  40207c:	48 89 df             	mov    %rbx,%rdi
  40207f:	b8 00 00 00 00       	mov    $0x0,%eax
  402084:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40208b:	f2 ae                	repnz scas %es:(%rdi),%al
  40208d:	48 f7 d1             	not    %rcx
  402090:	49 89 cc             	mov    %rcx,%r12
  402093:	49 83 ec 01          	sub    $0x1,%r12
  402097:	0f 84 52 fd ff ff    	je     401def <submitr+0x365>
  40209d:	4c 89 e3             	mov    %r12,%rbx
  4020a0:	48 8d ac 24 30 60 00 	lea    0x6030(%rsp),%rbp
  4020a7:	00 
  4020a8:	41 bf 00 00 00 00    	mov    $0x0,%r15d
  4020ae:	e9 b5 fc ff ff       	jmpq   401d68 <submitr+0x2de>

00000000004020b3 <driver_post>:
  4020b3:	53                   	push   %rbx
  4020b4:	48 83 ec 10          	sub    $0x10,%rsp
  4020b8:	48 89 cb             	mov    %rcx,%rbx
  4020bb:	85 d2                	test   %edx,%edx
  4020bd:	74 1f                	je     4020de <driver_post+0x2b>
  4020bf:	bf be 27 40 00       	mov    $0x4027be,%edi
  4020c4:	b8 00 00 00 00       	mov    $0x0,%eax
  4020c9:	e8 ba e9 ff ff       	callq  400a88 <printf@plt>
  4020ce:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4020d3:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4020d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4020dc:	eb 3e                	jmp    40211c <driver_post+0x69>
  4020de:	48 85 ff             	test   %rdi,%rdi
  4020e1:	74 2b                	je     40210e <driver_post+0x5b>
  4020e3:	80 3f 00             	cmpb   $0x0,(%rdi)
  4020e6:	74 26                	je     40210e <driver_post+0x5b>
  4020e8:	48 89 0c 24          	mov    %rcx,(%rsp)
  4020ec:	49 89 f1             	mov    %rsi,%r9
  4020ef:	41 b8 d5 27 40 00    	mov    $0x4027d5,%r8d
  4020f5:	48 89 f9             	mov    %rdi,%rcx
  4020f8:	ba d9 27 40 00       	mov    $0x4027d9,%edx
  4020fd:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
  402102:	bf 8a 25 40 00       	mov    $0x40258a,%edi
  402107:	e8 7e f9 ff ff       	callq  401a8a <submitr>
  40210c:	eb 0e                	jmp    40211c <driver_post+0x69>
  40210e:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402113:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402117:	b8 00 00 00 00       	mov    $0x0,%eax
  40211c:	48 83 c4 10          	add    $0x10,%rsp
  402120:	5b                   	pop    %rbx
  402121:	c3                   	retq   

0000000000402122 <sigalrm_handler>:
  402122:	48 83 ec 08          	sub    $0x8,%rsp
  402126:	ba 00 00 00 00       	mov    $0x0,%edx
  40212b:	be f0 29 40 00       	mov    $0x4029f0,%esi
  402130:	48 8b 3d 11 1c 20 00 	mov    0x201c11(%rip),%rdi        # 603d48 <stderr@@GLIBC_2.2.5>
  402137:	b8 00 00 00 00       	mov    $0x0,%eax
  40213c:	e8 d7 ea ff ff       	callq  400c18 <fprintf@plt>
  402141:	bf 01 00 00 00       	mov    $0x1,%edi
  402146:	e8 8d e9 ff ff       	callq  400ad8 <exit@plt>
  40214b:	90                   	nop
  40214c:	90                   	nop
  40214d:	90                   	nop
  40214e:	90                   	nop
  40214f:	90                   	nop

0000000000402150 <__libc_csu_fini>:
  402150:	f3 c3                	repz retq 
  402152:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  402159:	1f 84 00 00 00 00 00 

0000000000402160 <__libc_csu_init>:
  402160:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  402165:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  40216a:	48 8d 2d 8f 0e 20 00 	lea    0x200e8f(%rip),%rbp        # 603000 <__CTOR_LIST__>
  402171:	4c 8d 25 88 0e 20 00 	lea    0x200e88(%rip),%r12        # 603000 <__CTOR_LIST__>
  402178:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  40217d:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  402182:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  402187:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  40218c:	48 83 ec 38          	sub    $0x38,%rsp
  402190:	4c 29 e5             	sub    %r12,%rbp
  402193:	41 89 fd             	mov    %edi,%r13d
  402196:	49 89 f6             	mov    %rsi,%r14
  402199:	48 c1 fd 03          	sar    $0x3,%rbp
  40219d:	49 89 d7             	mov    %rdx,%r15
  4021a0:	e8 bb e8 ff ff       	callq  400a60 <_init>
  4021a5:	48 85 ed             	test   %rbp,%rbp
  4021a8:	74 1c                	je     4021c6 <__libc_csu_init+0x66>
  4021aa:	31 db                	xor    %ebx,%ebx
  4021ac:	0f 1f 40 00          	nopl   0x0(%rax)
  4021b0:	4c 89 fa             	mov    %r15,%rdx
  4021b3:	4c 89 f6             	mov    %r14,%rsi
  4021b6:	44 89 ef             	mov    %r13d,%edi
  4021b9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4021bd:	48 83 c3 01          	add    $0x1,%rbx
  4021c1:	48 39 eb             	cmp    %rbp,%rbx
  4021c4:	72 ea                	jb     4021b0 <__libc_csu_init+0x50>
  4021c6:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4021cb:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  4021d0:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  4021d5:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  4021da:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  4021df:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  4021e4:	48 83 c4 38          	add    $0x38,%rsp
  4021e8:	c3                   	retq   
  4021e9:	90                   	nop
  4021ea:	90                   	nop
  4021eb:	90                   	nop
  4021ec:	90                   	nop
  4021ed:	90                   	nop
  4021ee:	90                   	nop
  4021ef:	90                   	nop

00000000004021f0 <__do_global_ctors_aux>:
  4021f0:	55                   	push   %rbp
  4021f1:	48 89 e5             	mov    %rsp,%rbp
  4021f4:	53                   	push   %rbx
  4021f5:	48 83 ec 08          	sub    $0x8,%rsp
  4021f9:	48 8b 05 00 0e 20 00 	mov    0x200e00(%rip),%rax        # 603000 <__CTOR_LIST__>
  402200:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  402204:	74 19                	je     40221f <__do_global_ctors_aux+0x2f>
  402206:	bb 00 30 60 00       	mov    $0x603000,%ebx
  40220b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402210:	48 83 eb 08          	sub    $0x8,%rbx
  402214:	ff d0                	callq  *%rax
  402216:	48 8b 03             	mov    (%rbx),%rax
  402219:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40221d:	75 f1                	jne    402210 <__do_global_ctors_aux+0x20>
  40221f:	48 83 c4 08          	add    $0x8,%rsp
  402223:	5b                   	pop    %rbx
  402224:	c9                   	leaveq 
  402225:	c3                   	retq   
  402226:	90                   	nop
  402227:	90                   	nop

Disassembly of section .fini:

0000000000402228 <_fini>:
  402228:	48 83 ec 08          	sub    $0x8,%rsp
  40222c:	e8 6f ea ff ff       	callq  400ca0 <__do_global_dtors_aux>
  402231:	48 83 c4 08          	add    $0x8,%rsp
  402235:	c3                   	retq   
