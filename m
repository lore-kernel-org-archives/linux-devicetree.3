Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA763D3D10
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785355779; cv=none; b=vDR6HJMTwiZekpyi+AcZY57sAPyhURi8j2TVREF4hI5M5ybcNQ+TShBMIra3RTQ2xLIWSEAKGLl2VDEGRrGfh+Wluz1h880dppxjVOuQ5PImGG4wkSIMzma8Oaoi6VIQcIyoCZLu0HqoUCUt48tBfqHVo/w34f0QN9eInmpJ8Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785355779; c=relaxed/simple;
	bh=7WtJKbII1nAJ7IErXCDFO8vrDUBR2tOFEMItZCr4A1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JsENC2VET+g0uGYF8cGpbIB4nuBkVkMnKKmhRaqny1ZW40izPihcGTb2OOQZJNqqY8p5hGXBKJW8C3P7fLp0jwmy6Ry3E5RLppnTK6fiPkE8ZvTIOuUwk0aEXmCRgNpUvkPnAbNTR2Z1dpCj/8lZ/7FX6ztbkz2yJro27WtDXR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSu0NeOd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSu0NeOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BCE1F000E9;
	Wed, 29 Jul 2026 20:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785355775;
	bh=XX5RE7CwNa0ZtxKa+ku8yH1zvgrcygJ7P72JqWji7b4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lSu0NeOdgg/cgUbPbIUqCp0IZr/c+FrrIPw+H12besw4nkmIrmxzEfJHtxCaTMr3T
	 LgmAmwEgMm+cJ18iHsw4ECKYCFOBbBBFS9w4c91XeFu2gpIZ+n0uVvbbiflsf6jZnO
	 WarHeV1yHmGvroJuGeKVYMLyDqdi31QPxPVMb4TwaNNtLPl7AL0rrCIcTw3HSOOcC1
	 PYI3Dli7jmNxORMp3BdT8HWsBG4XObeD9NUgmzui9pl8bJKnzGx68FUPYJIWzWSApm
	 CRjf1Vf+Tz6DZTdVZ1rHmeGuIXXyezCJVZoYd/JlwKHUqYmBjA+WXS7a/ehHCTXzrP
	 dq1xq5j5I0ysQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] arm64: dts: ti: k3-am64: Enable IO expander
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729195958.671147-6-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
 <20260729195958.671147-6-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 20:09:34 +0000
Message-Id: <20260729200934.C5BCE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The IO expander interrupt is incorrectly configured with IRQ_TYPE_=
LEVEL_HIGH polarity for an active-low open-drain output.
- [Medium] The pad configuration for the SK board removes the internal pull=
-up, potentially leaving the open-drain interrupt line floating.
--

--- Patch [5]: [PATCH 5/8] arm64: dts: ti: k3-am64: Enable IO expander inte=
rrupt ---
commit 846c9ea4531cda7562459d539ef568783fb1e41c
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am64: Enable IO expander interrupt

On AM64 EVM and SK boards, MMC1_SDWP is used for IO expander interrupt,
remove from MMC1 pinmux node and setup as exp1 IO expander interrupt.

> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dt=
s/ti/k3-am642-evm.dts
> --- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
[ ... ]
> @@ -481,6 +487,12 @@ exp1: gpio@22 {
>  		bootph-all;
>  		compatible =3D "ti,tca6424";
>  		reg =3D <0x22>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&main_gpio1_ioexp_intr_pins_default>;
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <78 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Will setting this interrupt to IRQ_TYPE_LEVEL_HIGH cause an interrupt storm?

Since the TCA6424 IO expander has an active-low open-drain interrupt output,
an active-high configuration might trigger continuously when the line is
idle, eventually causing the kernel to disable the interrupt.

> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
>  		gpio-controller;

> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts=
/ti/k3-am642-sk.dts
> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> @@ -198,7 +198,6 @@ &main_pmx0 {
>  	main_mmc1_pins_default: main-mmc1-default-pins {
>  		bootph-all;
>  		pinctrl-single,pins =3D <
> -			AM64X_IOPAD(0x029c, PIN_INPUT_PULLUP, 0) /* (C20) MMC1_SDWP */
>  			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
>  			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
[ ... ]
> @@ -210,6 +209,13 @@ AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MM=
C1_DAT3 */
>  		>;
>  	};
> =20
> +	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM64X_IOPAD(0x029c, PIN_INPUT, 7) /* (C20) MMC1_SDWP.GPIO1_78 */

[Severity: Medium]
Does dropping the internal pull-up on this pad risk leaving the interrupt
line floating?

The previous configuration for this pad on the SK board used
PIN_INPUT_PULLUP. If the board lacks a dedicated external pull-up resistor
for this open-drain interrupt, using PIN_INPUT might lead to spurious edge
detections.

> +		>;
> +		bootph-all;
> +	};
[ ... ]
> @@ -383,6 +389,12 @@ exp1: gpio@70 {
>  		bootph-all;
>  		compatible =3D "nxp,pca9538";
>  		reg =3D <0x70>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&main_gpio1_ioexp_intr_pins_default>;
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <78 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Could this also trigger an interrupt storm on the SK board?

Similar to the EVM board, the PCA9538 IO expander typically has an
active-low open-drain interrupt. An active-high configuration will likely
trigger unconditionally on boot.

> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729195958.6711=
47-1-jm@ti.com?part=3D5
