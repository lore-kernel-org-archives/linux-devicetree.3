Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CAA3A0B3B
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346794; cv=none; b=aC3hgiqFFM2DH4cMGZ0FJwBI+1mhId6buc+bAEl7+j90UtjOEB0VRnvJimaZw/HAA7krFfi4OZDHQD8rvxHXcuJWon1txSSrlhaB0Okx+718zqyESBxpVLfZ5NJsnaYs+FeJVlF2xtzRG74/7Jck/TUSauvaIw7gAMg/n5Tk3GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346794; c=relaxed/simple;
	bh=0w2f7VAvjwqR24qZluCbW5AfbdYP7bZVDjvFDkwU3FE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dJt7xwvEtp0cnp4nF65B+nBgBbYW3tGq8a20fdPsyU/1No3PYsQXTx2xM25Bt9/kZ6FUi/3+A3WKs4Zz4Pl5F03HRb2Q8esp5U8oNUe9FW7J9B+/Pna41znZu4xteDhg4phnaa0D4wGG4HbnJUQxu4bcybr8wJDrqU847E8pK80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8iBQyJv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8iBQyJv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2831F000E9;
	Mon, 10 Aug 2026 07:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346792;
	bh=iWTQEwxwofqV8Z7L2VVcWhyOup8Fy9iCko8LU6DaDUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z8iBQyJvXoAz3neja402h53VONmApAp5X9ufGSfqztgabW+8VOLwHIchhk+7yUBrm
	 hMclQEdARNdagRZ8AzJ7QIpTVTa9GIigcS3OlbTk/SJGLqglHQTkaZLKZyo6TKler/
	 v6771gk/+qZIii+CErHYAerFZplb+hClRr4MiFFBc+Xu0YZQi3F8wsPBXbTSw3THrr
	 EtBDeDPeBiMpZPHqcNzgZrH0wF4I7x7l8+ZNfyDIL66/YCh7ENa9a+L2thkehoZlae
	 cm1s2TL+5sT5GogjOWbzkbNE8DTQSbeAE8ZvqVFLivpY8INtb8NQ6jqljr1stkBp1O
	 o/jk5qydJWNyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810-rzg2-sr-boards-v6-3-41faa32cdafb@solid-run.com>
References: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
 <20260810-rzg2-sr-boards-v6-3-41faa32cdafb@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:26:31 +0000
Message-Id: <20260810072632.3C2831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Lost interrupts for child devices due to edge-triggered parent i=
nterrupt configuration on the I2C expander
--

--- Patch [3]: [PATCH v6 3/5] arm64: dts: renesas: add support for solidrun=
 rzg2l som and hb-iiot evb ---
commit 3f1957626f1e1e5ab1e7ddedbfb53c5dea3788e0
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb

This commit adds device tree support for the SolidRun RZ/G2L SoM on the
Hummingboard IIoT carrier board, including Ethernet, eMMC, USB, and
configurable mux states for various interfaces.

Link: https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-g2l-som/
Link: https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.d=
tsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> new file mode 100644
> index 0000000000000..eaec4cca76949
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi

[ ... ]

> +	tca6416_u21: gpio@21 {
> +		compatible =3D "ti,tcal6416";
> +		reg =3D <0x21>;

[ ... ]

> +		/* Level triggered irq does not currently work well on RZ/G2L, fall-ba=
ck to edge */
> +		interrupts-extended =3D <&pinctrl RZG2L_GPIO(4, 0) IRQ_TYPE_EDGE_FALLI=
NG>;

[ ... ]

> +	light-sensor@44 {
> +		compatible =3D "isil,isl29023";
> +		reg =3D <0x44>;
> +		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5=
007) */
> +		interrupts-extended =3D <&tca6416_u21 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	accelerometer@53 {
> +		compatible =3D "adi,adxl345";
> +		reg =3D <0x53>;
> +		interrupts-extended =3D <&tca6416_u21 7 IRQ_TYPE_LEVEL_LOW>;
> +		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5=
007) */
> +		interrupt-names =3D "INT1";
> +	};

[Severity: Medium]
Will this edge-triggered configuration cause lost interrupts for the child
devices sharing this expander?

The parent expander (tca6416_u21) interrupt is forced to
IRQ_TYPE_EDGE_FALLING. However, child devices like the accelerometer and
light sensor are configured to use IRQ_TYPE_LEVEL_LOW on the shared pin 7.

If one device asserts its interrupt (pulling the shared line low), the
expander will trigger a falling edge to the SoC. If the second device
also asserts its interrupt before the first is cleared, the shared line
remains low even after the first device deasserts it.

Because the SoC parent interrupt is strictly edge-triggered, no second
falling edge is generated in this scenario. Could this leave the interrupt
line stuck low permanently and drop all future interrupts from these sensor=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-rzg2-sr-bo=
ards-v6-0-41faa32cdafb@solid-run.com?part=3D3
