Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014379;
	b=cGdYXuBXFVZR06/VMCHM8L0xBD5ff/P5WiU03NuLcPC6mKmfCQQ/7HUzt9oPkR/Spc8m
	 5tL9S1SfhBh+x4/vaOvNyJYxSTZvmQpbj/allqSGdW/S1KbOfkColpFQ5Z0fQigKwkvT7
	 wWO5a6AezNsTfibaCT2mJPPNE9UXw3GJODU94+lYHkRk/+GsTxOz+Pb7fUKQj+XXgmiCx
	 lisukQ4tRZZV++6AWcGibzngQKCb9NwHigpEj+dDGakXCU71gEqkE6JLBn5k82u25QgPL
	 wjTAhhpZ9cv06cA6RV1/3dgR71kgqvC+ZN2cn67Rq70O7RSetnt4y8yFOQ7DXiI+S9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014379;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=595501fK6KaRLbAY25Tpz/FyibXvuOOrLKw5vBwcAdc=;
	b=JOZl9ZcwsnsS80sbkDWCjqSwHVItzJfWBeTfCH68iri7+jpY7ihoYolSh7fYuZNTkGFB
	 PLBTWZb9nHzQAh05BAHs1s6b4eh/FOQ2RS/rQa8+2oVgkCoxwQsSs76R2TlHwgNfwUCgn
	 lmn0mwCEjxxiriCq9t2oZ5jYmtL1tgmmejra89xrnt8enLNGkS3tjTe9KMdtVQ5CEyWXi
	 iKno1xd0GrlVQNdM51mlYqxae9IiM5iCwOT8T2CUEYQPvC4Aszzu3J8X+F5Oazji4EdHS
	 9hBZVLLQelvwygL3QzMoM65M5IKcsajQRr+2vpInnvEiEe0a271ygTniDbfemhJJ/DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FBJ/JNcI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B5F606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBJ/JNcI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D8E1F01825;
	Mon, 26 Oct 2026 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793014378;
	bh=595501fK6KaRLbAY25Tpz/FyibXvuOOrLKw5vBwcAdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FBJ/JNcIeTXLcz1ixx6t5D5p4tf44Qdg7mdcpJkozcrEokEz+KZrMlROUwoISefDH
	 FdPvIw5KwZbhpbq9XOAGl49+4N3smjrzq7JX1jXBf3x2CG/+cxf6W/jn5/iSSGQ9YS
	 rhsAXMpmAZJgNd5BjUO32nqXk3QQ782Yxm8d8tB75d4o/lHl/3vtMm7GLyfbZvQkqC
	 ZviXH00/JD8X7hkOe+HSyT9cKhIU05i5eIJzgOTHArL0op6czqYGW3I4rIxULgesxq
	 mP9zcGvrcEg+7RHmFTRkyXRi87mkBomJ4FcmCroXaomDGxfaGo3D96qkBGo/jBFjMI
	 FRse0uUi/Y00A==
Message-ID: <sashiko-outbox-185107@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] arm64: dts: airoha: en7581: add nodes for all
 supported uart and hsuart
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026095727.31708-8-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
 <20261026095727.31708-8-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 11:32:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: airoha: undocumented UART compatibles break serial con=
sole
- [Medium] arm64: dts: airoha: uart1 retains ns16550 workaround clock-frequ=
ency
--

commit 6e4317a9ed5754fa0011125ce3517c077746d85a
Author: Christian Marangi <ansuelsmth@gmail.com>

arm64: dts: airoha: en7581: add nodes for all supported uart and hsuart

This commit adds Device Tree nodes for the HSUART and additional UART
controllers on the Airoha EN7581 SoC, and updates the compatible string
on the existing uart1 node from "ns16550" to "airoha,en7523-uart".

> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts=
/airoha/en7581.dtsi
> index 760f0c3e60904..ee1633f01068e 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -470,13 +470,24 @@ fixed-link {
>  			};
>  		};
> =20
> +		serial@1fbe1000 {
> +			compatible =3D "airoha,an7581-hsuart";
> +			reg =3D <0x0 0x1fbe1000 0x0 0x40>;
> +			reg-io-width =3D <4>;
> +			reg-shift =3D <2>;
> +			interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency =3D <7372800>;
> +
> +			status =3D "disabled";
> +		};
> +
>  		pbus_csr: syscon@1fbe3400 {
>  			compatible =3D "airoha,en7581-pbus-csr", "syscon";
>  			reg =3D <0x0 0x1fbe3400 0x0 0xff>;
>  		};
> =20
>  		uart1: serial@1fbf0000 {
> -			compatible =3D "ns16550";
> +			compatible =3D "airoha,en7523-uart";
>  			reg =3D <0x0 0x1fbf0000 0x0 0x30>;
>  			reg-io-width =3D <4>;
>  			reg-shift =3D <2>;

[Severity: High]
Does replacing compatible =3D "ns16550" with "airoha,en7523-uart" on uart1
(serial@1fbf0000) without a fallback compatible break earlycon and the
serial console on EN7581 boards?

In arch/arm64/boot/dts/airoha/en7581-evb.dts, uart1 is selected as the
console via stdout-path:

	aliases {
		serial0 =3D &uart1;
	};

	chosen {
		stdout-path =3D "serial0:115200n8";

Neither "airoha,en7523-uart" (used in uart1, serial@1fbf0300,
serial@1fbf0600, and serial@1fbf0700) nor "airoha,an7581-hsuart" (used in
serial@1fbe1000) is documented in Documentation/devicetree/bindings/serial/
or matched by any driver in the tree, such as of_platform_serial_table in
drivers/tty/serial/8250/8250_of.c:

static const struct of_device_id of_platform_serial_table[] =3D {
	{ .compatible =3D "ns8250",   .data =3D (void *)PORT_8250, },
	{ .compatible =3D "ns16450",  .data =3D (void *)PORT_16450, },
	{ .compatible =3D "ns16550a", .data =3D (void *)PORT_16550A, },
	{ .compatible =3D "ns16550",  .data =3D (void *)PORT_16550, },

Without corresponding binding schemas, driver support, or a fallback
compatible on uart1, won't dtbs_check fail on all five serial nodes and
leave uart1 unable to bind during early_init_dt_scan_chosen_stdout() and
of_platform_serial_driver probing?

> @@ -517,6 +528,39 @@ en7581_pwm: pwm {
>  			};
>  		};
> =20
> +		serial@1fbf0300 {
> +			compatible =3D "airoha,en7523-uart";
> +			reg =3D <0x0 0x1fbf0300 0x0 0x30>;
> +			reg-io-width =3D <4>;
> +			reg-shift =3D <2>;
> +			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency =3D <7372800>;
> +
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Should uart1 (serial@1fbf0000) also have its clock-frequency updated to
7372800 when switching its compatible to "airoha,en7523-uart"?

The three new "airoha,en7523-uart" nodes (serial@1fbf0300, serial@1fbf0600,
and serial@1fbf0700) all use clock-frequency =3D <7372800>, whereas uart1 in
arch/arm64/boot/dts/airoha/en7581.dtsi keeps clock-frequency =3D <1843200>:

		uart1: serial@1fbf0000 {
			compatible =3D "airoha,en7523-uart";
			reg =3D <0x0 0x1fbf0000 0x0 0x30>;
			reg-io-width =3D <4>;
			reg-shift =3D <2>;
			interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
			clock-frequency =3D <1843200>;
		};

As noted in arch/mips/boot/dts/econet/en751221.dtsi for serial@1fbf0000,
1843200 was a workaround for the generic "ns16550" driver to fix the port
at 115200 baud:

	uart: serial@1fbf0000 {
		compatible =3D "ns16550";
		...
		/*
		 * Conversion of baud rate to clock frequency requires a
		 * computation that is not in the ns16550 driver, so this
		 * uart is fixed at 115200 baud.
		 */
		clock-frequency =3D <1843200>;
	};

If a driver matching "airoha,en7523-uart" computes baud-rate divisors from
clock-frequency, won't keeping 1843200 on uart1 cause a 4x baud-rate
mismatch compared to the other "airoha,en7523-uart" nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026095727.3170=
8-1-ansuelsmth@gmail.com?part=3D7
