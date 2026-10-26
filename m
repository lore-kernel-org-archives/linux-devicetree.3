Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015042;
	b=3ViZrvKVohq4hYN8X+wHPXiiBjRr0eFoFKcISk2+ADPvRk0FcoUOrYwoRfnzVqhibucg
	 oB3YlKbeZ+LKcrEcJi3BiPED05528IQV/Ef/xZJ1+Yw3T/PrR84QQt/Xcj+rljyz1V9sV
	 ye8gUkWOqgLZQHqG12/5ucL5jGSUk6/JWqThCxun5NqG7FKfQpvjsng9vXGnpECpI4fPU
	 fkqjqL/qczEOvR3es8GlL1Qq/2blecO3kWnslMJztek4nkdpB3Ufg/CgQZcDd+68sYZyJ
	 9oid4j/p885Are4zC6557s6Ezuboiz/y8fmiiI1Vh0SEKCYOqxW0dgBFjVPrh31twNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015042;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4E+GbnIzoAbI0+B3pj7/6k7J++JDUKY3kPvZ0ImvSE0=;
	b=W3vyCBdWkYMkSRwZKXI7CUzRc7h+fYPC0pNynDCc7eTTXNogukoELfywUYMsoWZJeB4W
	 cncn3FvxVineDG9gu1qKbGREFkz8IGzwK+bxhveoVuieeLn14Msp/4cuSYlrnCr+A6Yg0
	 ovCwuv35LNH63iI7wiWX91gJFHIy7hT9hCgTPx7CJAX92vUK82OlHnNJnW+Tb3cjGZWwg
	 M0wJnA/w+vtd0s1Z1de6QSOjvjJd32urClmPf8tae3yID0baUiSR3EXQqFk8K/uMu/UgG
	 7tux6iBcFreLeAPpxOGVTtHxtr+r6MAKfU6SRS0g37lwSpnZCcW4mtyoULXl2LjBMDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JYmE+eLt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49B2606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JYmE+eLt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0581F01829;
	Mon, 26 Oct 2026 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793015041;
	bh=4E+GbnIzoAbI0+B3pj7/6k7J++JDUKY3kPvZ0ImvSE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JYmE+eLtz7GVUii/GwIhDJQZZJmYeOVyhrqgSp9eVLkuaWhbEtl0WHY0beRrhLTpe
	 eUGHWxm/uR9OhI788SJklzoc453pITuly19Hup/GIiDo/VgOnIvf5OdQSycDfvSCAH
	 y4kATDQJCpcTt042DlAWIheWCrgH1UDnY0PC7GUWOI++KswkNgtoMyodk7JE9nFk47
	 62uzYz1PuH95zxTdUXqRtrK/l9TMgRu5oRwHldHIWW+A87r0dtzu5Wk23UivCJPzG4
	 isNToKevZCNJ2dWkRGGXfodUaiJ9lFjkb5QkfwPSwRyfRCpWRBvqf5ABBdA4WrsA3n
	 dQu5vaugX4L+g==
Message-ID: <sashiko-outbox-185115@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] arm64: dts: airoha: en7581: add crypto node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026095727.31708-9-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
 <20261026095727.31708-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 11:44:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] arm64: dts: airoha: unbound UART compatibles break EN7581 serial c=
onsole
- [Medium] arm64: dts: airoha: watchdog@1fbf0100 reg size 0x38 excludes WDT=
_RELOAD
- [Medium] arm64: dts: airoha: thermal@1efbd000 reg size 0xd5c excludes 0xf=
20..0xf28
- [Low] arm64: dts: airoha: undocumented airoha,en7581-chip-scu syscon comp=
atible
--

commit 4273f644e034fd0b9c1514ce767c400e4a6f58a5
Author: Christian Marangi <ansuelsmth@gmail.com>

arm64: dts: airoha: en7581: add crypto node

This series reorders and extends the Airoha EN7581 device tree with CPU OPP,
Chip-SCU, thermal sensor, watchdog, PWM, UART/HSUART, and EIP93 crypto node=
s.

> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts=
/airoha/en7581.dtsi
> index ff6908a76e8eb..f214fa3a3e2bb 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi

[ ... ]

> @@ -150,6 +357,15 @@ gic: interrupt-controller@9000000 {
>  			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>  		};
> =20
> +		thermal: thermal-sensor@1efbd000 {
> +			compatible =3D "airoha,en7581-thermal";
> +			reg =3D <0x0 0x1efbd000 0x0 0xd5c>;

[Severity: Medium]
Is the register region size of 0xd5c on thermal-sensor@1efbd000 (added in
commit 32580fdfac9a ("arm64: dts: airoha: en7581: add thermal sensor nodes"=
))
large enough for the registers accessed by the thermal driver?

During probe, en7581_thermal_probe() -> en7581_thermal_setup_adc_val() in
drivers/thermal/airoha_thermal.c reads calibration registers at offsets 0xf=
20
(EN7581_EFUSE_TEMP_OFFSET_REG) and 0xf28 (EN7581_EFUSE_TEMP_CPU_SENSOR_REG):

    regmap_read(priv->map, EN7581_EFUSE_TEMP_OFFSET_REG, &efuse_calib_info);
    if (efuse_calib_info) {
        priv->default_offset =3D FIELD_GET(EN7581_EFUSE_TEMP_OFFSET, efuse_=
calib_info);
        /* Different slope are applied if the sensor is used for CPU or for=
 package */
        regmap_read(priv->map, EN7581_EFUSE_TEMP_CPU_SENSOR_REG, &cpu_senso=
r);

Since both offsets exceed 0xd5c, should the reg size be at least 0xf2c so
these reads stay within the declared resource bounds?

[ ... ]

> @@ -173,16 +389,9 @@ spi_nand: nand@0 {
>  			};
>  		};
> =20
> -		scuclk: clock-controller@1fb00000 {
> -			compatible =3D "airoha,en7581-scu";
> -			reg =3D <0x0 0x1fb00000 0x0 0x970>;
> -			#clock-cells =3D <1>;
> -			#reset-cells =3D <1>;
> -		};
> -
> -		pbus_csr: syscon@1fbe3400 {
> -			compatible =3D "airoha,en7581-pbus-csr", "syscon";
> -			reg =3D <0x0 0x1fbe3400 0x0 0xff>;
> +		chip_scu: syscon@1fa20000 {
> +			compatible =3D "airoha,en7581-chip-scu", "syscon";
> +			reg =3D <0x0 0x1fa20000 0x0 0x388>;
>  		};

[Severity: Low]
Does chip_scu: syscon@1fa20000 (added in commit bb621c4a83bc ("arm64: dts:
airoha: en7581: add Chip-SCU accessor node")) pass dtbs_check?

In Documentation/devicetree/bindings/mfd/syscon.yaml, the compatible enum
includes "airoha,en7581-pbus-csr" and "econet,en751221-chip-scu", but
"airoha,en7581-chip-scu" is not listed in that schema or any other binding.
Should "airoha,en7581-chip-scu" be documented in the syscon binding schema?

[ ... ]

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
> +		pbus_csr: syscon@1fbe3400 {
> +			compatible =3D "airoha,en7581-pbus-csr", "syscon";
> +			reg =3D <0x0 0x1fbe3400 0x0 0xff>;
> +		};
> +
> +		uart1: serial@1fbf0000 {
> +			compatible =3D "airoha,en7523-uart";
> +			reg =3D <0x0 0x1fbf0000 0x0 0x30>;
> +			reg-io-width =3D <4>;
> +			reg-shift =3D <2>;
> +			interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency =3D <1843200>;
> +		};

[Severity: High]
Can the serial driver still bind to uart1 (serial@1fbf0000) or the newly
added serial@1fbe1000, serial@1fbf0300, serial@1fbf0600, and serial@1fbf0700
nodes after commit 6e4317a9ed57 ("arm64: dts: airoha: en7581: add nodes for
all supported uart and hsuart")?

Previously, uart1: serial@1fbf0000 used compatible =3D "ns16550", which mat=
ched
of_platform_serial_table in drivers/tty/serial/8250/8250_of.c:

    static const struct of_device_id of_platform_serial_table[] =3D {
        { .compatible =3D "ns8250",   .data =3D (void *)PORT_8250, },
        { .compatible =3D "ns16450",  .data =3D (void *)PORT_16450, },
        { .compatible =3D "ns16550a", .data =3D (void *)PORT_16550A, },
        { .compatible =3D "ns16550",  .data =3D (void *)PORT_16550, },

Replacing "ns16550" with "airoha,en7523-uart" (and using
"airoha,an7581-hsuart" on serial@1fbe1000) without a fallback compatible le=
aves
these nodes unmatched by any driver under drivers/tty/serial/ and undocumen=
ted
in Documentation/devicetree/bindings/serial/8250.yaml. On en7581-evb.dts,
where serial0 aliases uart1 for stdout-path, won't this regression break the
serial console on boot?

> +
> +		watchdog@1fbf0100 {
> +			compatible =3D "airoha,en7581-wdt";
> +			reg =3D <0x0 0x1fbf0100 0x0 0x38>;

[Severity: Medium]
Does the reg size of 0x38 on watchdog@1fbf0100 (added in commit 285873958d4b
("arm64: dts: airoha: en7581: add watchdog node")) exclude the WDT_RELOAD
register at offset 0x38?

In drivers/watchdog/airoha_wdt.c, WDT_RELOAD is defined at offset 0x38, and
airoha_wdt_ping() performs 32-bit accesses at 0x38..0x3b:

    val =3D readl(airoha_wdt->base + WDT_RELOAD);
    val |=3D WDT_RLD;
    writel(val, airoha_wdt->base + WDT_RELOAD);

The binding example in
Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml also list=
s:

    watchdog@1fbf0100 {
        compatible =3D "airoha,en7581-wdt";
        reg =3D <0x1fbf0100 0x3c>;

Should the reg size in en7581.dtsi be 0x3c instead of 0x38?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026095727.3170=
8-1-ansuelsmth@gmail.com?part=3D8
