Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793073383;
	b=y7lz/T7KXWS7uJv0bfwe15Si9SiTsSlAF4oX0+6vIEtYJQ1dcFZPHY03rLmnh9dqNhzG
	 8Ui0VAmyFWna22CyQrB8ekSF4ymedJM14pBlMVOg6GhYpl7H5cbnXviZAysmzR/3atcQv
	 gPYoxQ/LXYLaZ9s0/z6RZ6bDaXQjRygJE27uSuJsEHU6sWgj/7mQK+7C9/lfZzCpBWtke
	 U6bqXnwg5Mq4uApaEheMPBDbEFnkWT5NdIOFoIWYBzYfKToRpymQ8ZLC2/9qQ/CbSK/00
	 5ztSTQZZ3Y5GDwPN4bdL+v2hYBLXaFtNdlbvh0QOuNJE/MmTXCCXEdyEprh1n2CGfrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793073383;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sR3Y8vzKVxnijKx94V2nwZHgVduYpDuhYIT8UsuTU8A=;
	b=OT+9SwZ9KyzNpIi2R35XaL42cNykslJDUbZfzR96B1oo5VwAUbuLBfAUI0+JP0vTZS7P
	 /Az++NSNPtYA7ANN4oGGwLpvPfUrlXeteR3PmKcb4kTDqc4V0vdw0u0K9XdyTNFfkhENT
	 KrMwRVyVCB8i2GyGmF18aESXsOKapYxam1GNvpgea0K0SNLb/JaLIwmj/kanC1rwJKZy3
	 Za61Dj25h74GMVDiwqVUCXb0UeMcadcXKCTyCpDqfPEHepWVNANbGGii2JG1PyZXF4Zj+
	 MNGrcGXkzFkHn23B2U0j9dxwv39mpG4Fjqb7LWcz9iwUrOv9yMOialG6dIpgwQUPMKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bWQjHx5x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A16606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bWQjHx5x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C911F01825;
	Tue, 27 Oct 2026 03:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793073382;
	bh=sR3Y8vzKVxnijKx94V2nwZHgVduYpDuhYIT8UsuTU8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bWQjHx5xXYbGh5po4gPVRUncAslfDMgTm5bBFHvusnM2Xp7zMQe1axKikINSum5ib
	 Wp85b4q44a5E4SVHLR1dMoT7fTCU+4TqHRjup746ES9ZWB4Q6YDPrj1KbTJ8mIcA0H
	 o6OwZNfdAmfmbOmX3i/h0sen2sXoywpkjDI/SEAxsLLQGxeJfQUWob1/DNEisg0EhH
	 ri/kExx0+tM5Uy5kPM362tZYqDtGUpnaCejR1J8zELIW09rP1fE6Vo26E9cTBMVNum
	 TIthwybVju70UhjB0hvH+VAwjOBRwQa7kFcBTD3ijJXLitMR7Mma9Sa9ZnPMn20wa5
	 tLCCmkIoIotFg==
Message-ID: <sashiko-outbox-186061@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasanth Kumar Padarthi" <prasanth.padarthi10@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027034911.99482-3-prasanth.padarthi10@gmail.com>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
 <20261027034911.99482-3-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 03:56:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ARM: dts: aspeed: b650d4u: serial0 alias on uart5 conflicts with=
 aspeed-g6.dtsi
--

commit c5dab769447b1fc4b06269064e28141f872a8a59
Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

This patch adds the device tree for the ASRock Rack B650D4U BMC based on
the ASPEED AST2600 SoC, configuring memory, SPI flash, UART console, GPIO
line names, MAC0 with EEPROM NVMEM, and ADC channels via iio-hwmon.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 0000000000000..630588dcb9f3c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> +	model =3D "ASRock Rack B650D4U BMC";
> +
> +	aliases {
> +		serial0 =3D &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};

[Severity: Medium]
Should the aliases override be dropped here and stdout-path set to
"serial4:115200n8" (or &uart5) instead?

In arch/arm/boot/dts/aspeed/aspeed-g6.dtsi, the base aliases node already
maps serial0 to &uart1 and serial4 to &uart5:

	aliases {
		...
		serial0 =3D &uart1;
		serial1 =3D &uart2;
		serial2 =3D &uart3;
		serial3 =3D &uart4;
		serial4 =3D &uart5;
	};

Overriding serial0 =3D &uart5 in the board DTS leaves both serial0 and
serial4 pointing to &uart5 while stripping &uart1 of its alias. During
serial port probe, uart_read_and_validate_port_properties() ->
__uart_read_properties() in drivers/tty/serial/serial_port.c resolves the
port index from the first matching alias:

	/* Get index of serial line, if found in DT aliases */
	ret =3D of_alias_get_id(dev_of_node(dev), "serial");
	if (ret >=3D 0)
		port->line =3D ret;

Because of_alias_get_id() returns 0 from serial0 instead of 4 from serial4,
uart5 is registered as ttyS0 rather than the standard ASPEED/OpenBMC ttyS4,
which breaks serial console output when booted with standard console=3DttyS4
kernel arguments or userspace getty configurations expecting ttyS4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027034911.9948=
2-1-prasanth.padarthi10@gmail.com?part=3D2
