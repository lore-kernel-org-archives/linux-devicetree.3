Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34001433E93
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783193466; cv=none; b=ooSV/SxHsXClRnIxIpZLbRqTjYhL6YXWVNR2m0scOXhZxpi9Fpj0/fVyUON+NvSDWkWjzzO0eBQ9Or6sNFQX5KFO9mbmTZXka/5zZslHVcHHV2FinD7nhudE0WJq+yFmvM4iubJgaIEK2SDOpBFPbR+HPQCsQpbIXphr66gRsck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783193466; c=relaxed/simple;
	bh=1Gez/aQp6e9IgoLlphIeFK6NG7ASBbRjWjQ35DBaJ5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ThJUITMF7/eE7el192MNdwDHj8/w1GZ66R8wa+GRWFclarMtZcAY3CUVbeue97GwVzgIHFxzC3DjA+WVzOvZz9P3ej2Jbs905iP0okTgh8/pfX4Jx4O59Ltmg4T5hTk7hP6h4Olx2v3hLNMVlw7oNacKf3ykS2qDNv1+naa2tVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqS9oRAb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqS9oRAb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A581F000E9;
	Sat,  4 Jul 2026 19:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783193464;
	bh=zEiT3S+iLL0mEeWMsbfgiy2NnOWnx9oHaHPfXlhnCZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqS9oRAb14YXr8AUComVbiBMwp4XtbREWcgEmAgvUc/a0xhaqbeR0y2gXZQncMC7Y
	 hfSO2xl5zriBmxnWVJbAuXLF/EAGQL1/YqfAZIDjcOV6NQrOHsvy2Se3Xt+uQGnH1M
	 tY0jcf80RPzEZcVI5gC6ZLkEHvsXi0CPSebc6zhjSQIFp2SwXWD8rIF/tCddnSI/Nx
	 6tW+4Y9HKHdKuFraliw4EGgKwWZJSKDJOZ+/AOY0b/y2AfxxPxFa4vRIedg6F9qgs7
	 Tvp3lDFSCgfaagKuDTVtROnTR9Id53bKd7K6aej4VcwVqK+WvKnXCJIy7b/wLoA5N8
	 vUPlZuOiub1dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: mediatek: mt6572: rename fixed clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260704-6572-phase1-v1-1-61c2fe6be19c@protonmail.com>
References: <20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com>
 <20260704-6572-phase1-v1-1-61c2fe6be19c@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 19:31:03 +0000
Message-Id: <20260704193104.41A581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The fixed-clock nodes are renamed to `clk26m`, `clk13m`, and `clk32=
k`, which violates the preferred node naming convention in the fixed-clock =
DT schema.

Pre-existing issues:
- [High] The UART nodes (`uart0` and `uart1`) specify `clock-names =3D "bau=
d"` but omit the required `"bus"` clock, leading to a guaranteed probe fail=
ure in the UART driver.
--

commit b76c9552213f6a611c0faa777e13268895b879c6
Author: Roman Vivchar <rva333@protonmail.com>

ARM: dts: mediatek: mt6572: rename fixed clocks

This commit renames the old-style fixed clocks uart_clk, system_clk, and
rtc_clk to clk26m, clk13m, and clk32k to better reflect the hardware.

> diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/m=
ediatek/mt6572.dtsi
> index ac70f266d698d..fa0e5df766c20 100644
> --- a/arch/arm/boot/dts/mediatek/mt6572.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> @@ -28,19 +28,19 @@ cpu@1 {
>  		};
>  	};
> =20
> -	uart_clk: dummy26m {
> +	clk26m: clk26m {

[Severity: Low]
Do these new node names violate the preferred device tree schema pattern?

According to the fixed-clock schema:

Documentation/devicetree/bindings/clock/fixed-clock.yaml:
    pattern: "^clock-([0-9]+|[a-z0-9-]+)$"

Should these nodes be named clock-26m, clock-13m, and clock-32k to pass
dtbs_check without warnings?

>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <26000000>;
>  		#clock-cells =3D <0>;
>  	};

[ ... ]

> @@ -91,7 +91,7 @@ uart0: serial@11005000 {
>  			compatible =3D "mediatek,mt6572-uart", "mediatek,mt6577-uart";
>  			reg =3D <0x11005000 0x400>;
>  			interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
> -			clocks =3D <&uart_clk>;
> +			clocks =3D <&clk26m>;
>  			clock-names =3D "baud";

[Severity: High]
This is a pre-existing issue, but does providing only the baud clock
cause the UART driver probe to fail?

Looking at the 8250 driver:

drivers/tty/serial/8250/8250_mtk.c:mtk8250_probe_of() {
    ...
    data->bus_clk =3D devm_clk_get_enabled(&pdev->dev, "bus");
    if (IS_ERR(data->bus_clk))
        return PTR_ERR(data->bus_clk);
    ...
}

If the baud clock is present, the driver skips the legacy fallback
logic and unconditionally tries to fetch the bus clock. Since bus
is omitted from the device tree, this returns an error and aborts the probe.

Should the missing bus clock be added to these UART nodes?

>  			status =3D "disabled";
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704-6572-phase=
1-v1-0-61c2fe6be19c@protonmail.com?part=3D1
