Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0203D966B
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789291; cv=none; b=EJynxdt1AghBUVBE1OObEUSogsufSK4CG+S4YpHP2I1W3QQKvccf+rmHfmL4evDkp2ExicWEUnscI938tx4N3aAZnSCieUx2AKY3hyCM7kLBOXYEUftk+aP9pIqoOYSYxNy3hw0ke5MV3IcxGukmNLlJDQGhw0rl/Rgr2D64NaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789291; c=relaxed/simple;
	bh=M1kfqLMrpXoDcgDOs9nKGdmCoIYlychhu37tiA8TlSs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N7pDkZt7DfoRNxn3l6bMU7Y0uc55dAT1qrT7u9h58z0YxfEgNAipukoA+hLCeOkahCwv5/H5HvPit+TMHIeFnGoFWdyePpfBhResIoIAHJ5govM2hTK7ZLxnXUs2fb2KG5sJqJgSOMjBm4CsmMgUuQH01/1YQLVK5gFwcG3opBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MR/nRG1P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MR/nRG1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E1F1F000E9;
	Tue, 26 May 2026 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779789289;
	bh=h49f4O3Zbft70qmy3HFckZIHYCi842PzKUEa1QDlsRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MR/nRG1P4uZB9WkLngYTaDEaPWbnvuTkxDWznI4Yo7bNjGs+wKV4uRTCCn0rD7qLe
	 qLFW4Oe9VNStVfynngwHG7JVgYdDoYfxGB6iAZqdoRqCz4HVilkjdROzNgthII0ihf
	 UvQaocmbIaH36Ep5qSBcmrimzcZzzb8thDlh6A4oImNBU6tGepH5dtg8j+4fVH6KHY
	 RwOjs763usonCCrmGbWDG3gh6fYTF+al8QJiUrdox6pAbkqKtA3gBT9J0sxd9PWvKm
	 ZY6dfV3IVHdpvez9zSNEBQmlz0l7k4QTBpp2EbYOwXuRjGTVyXTrK608cb0I4sm5yR
	 IAesbAMtTShRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f7 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260526-upstream_uboot_properties-v7-2-e17cd424d5db@foss.st.com>
References: <20260526-upstream_uboot_properties-v7-2-e17cd424d5db@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 09:54:48 +0000
Message-Id: <20260526095449.20E1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The patch completely omits necessary `bootph-all` tags for the `st=
m32746g-eval.dts` board.
- [High] Missing `bootph-all` on SDIO controller nodes despite the patch cl=
aiming to support SD boot.
- [High] The `&soc` parent bus node lacks the `bootph-all` tag in `stm32f76=
9-disco.dts` and `stm32746g-eval.dts`.
- [High] The patch tags `pwrcfg` instead of the `syscfg` node claimed in th=
e commit message, breaking `pinctrl` initialization.
- [Low] The patch erroneously adds `bootph-all` tags to display-related nod=
es (`&ltdc` and `&dsi`), which are unrelated to SD boot.
--

commit 616809e6aaaad31d633ea36ad66133cc44b7b361
Author: Patrice Chotard <patrice.chotard@foss.st.com>

ARM: dts: stm32: Add boot phase tags for STMicroelectronics f7 boards

The bootph-all flag was introduced in dt-schema to define node usage
across different boot phases. To ensure SD boot, timer, gpio, syscfg,
clock, and uart nodes need to be present in all boot stages, so this
patch adds the missing flags.

> diff --git a/arch/arm/boot/dts/st/stm32746g-eval.dts b/arch/arm/boot/dts/=
st/stm32746g-eval.dts
> --- a/arch/arm/boot/dts/st/stm32746g-eval.dts
> +++ b/arch/arm/boot/dts/st/stm32746g-eval.dts
[ ... ]
> @@ -226,6 +226,16 @@ &usart1 {
>  	status =3D "okay";
>  };
> =20
> +&usart1_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};

[Severity: High]
The commit message mentions adding tags to timer, gpio, syscfg, clock, and
uart nodes, but for this board only the usart1 pin configuration is modifie=
d.

Are controllers like &usart1, &timers5, &clk_hse, &pinctrl, &gpio*, &rcc,
and &soc also supposed to be tagged here?

Without these tags, the early bootloader (SPL) might drop these nodes,
causing the SD boot sequence to fail for this board.

Additionally, since the explicit goal of the commit is to support SD boot,
should the SD/MMC controller nodes (like &sdio1 and &sdio2) also be
tagged with bootph-all?

Without the tag, the device tree tooling for U-Boot SPL will prune the
SDIO nodes entirely, leaving the bootloader without knowledge of the SD
hardware.

> diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts=
/st/stm32f746-disco.dts
> --- a/arch/arm/boot/dts/st/stm32f746-disco.dts
> +++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
[ ... ]
> @@ -179,6 +224,7 @@ touchscreen@38 {
>  &ltdc {
>  	pinctrl-0 =3D <&ltdc_pins_a>;
>  	pinctrl-names =3D "default";
> +	bootph-all;
>  	status =3D "okay";

[Severity: Low]
Is bootph-all required on the LCD-TFT Display Controller for SD boot?

Retaining this node bloats the memory-constrained early bootloader device
tree (SPL) with display hardware nodes that may not be functionally
necessary for booting.

>  	port {
[ ... ]
> @@ -188,6 +234,22 @@ ltdc_out_rgb: endpoint {
>  	};
>  };
> =20
> +&pinctrl {
> +	bootph-all;
> +};
> +
> +&pwrcfg {
> +	bootph-all;
> +};

[Severity: High]
The commit message indicates that the syscfg node needs to be present in all
boot stages, but &pwrcfg is tagged here instead.

Does this leave the actual syscfg node (syscon@40013800) untagged?

The pinctrl node relies on syscfg via a phandle. If the syscfg node is
pruned in SPL because it lacks a boot phase tag, will the pinctrl driver
fail to probe due to a broken phandle, cascading into GPIO initialization
failures?

> diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts=
/st/stm32f769-disco.dts
> --- a/arch/arm/boot/dts/st/stm32f769-disco.dts
> +++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
[ ... ]
> @@ -140,11 +136,13 @@ &cec {
> =20
>  &clk_hse {
>  	clock-frequency =3D <25000000>;
> +	bootph-all;
>  };
> =20
>  &dsi {
>  	#address-cells =3D <1>;
>  	#size-cells =3D <0>;
> +	bootph-all;
>  	status =3D "okay";

[Severity: Low]
Similar to the ltdc node above, is the MIPI DSI host required to be
present during the early SPL boot phase for SD boot?

>  	ports {
[ ... ]
> @@ -199,6 +242,19 @@ ltdc_out_dsi: endpoint {
>  	};
>  };
> =20
> +&pinctrl {
> +	bootph-all;
> +};
> +
> +&pwrcfg {
> +	bootph-all;
> +};
> +
> +&rcc {
> +	compatible =3D "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
> +	bootph-all;
> +};

[Severity: High]
The &soc node was properly tagged in stm32f746-disco.dts, but it appears to
be omitted for stm32f769-disco.dts and stm32746g-eval.dts.

If a parent simple-bus node lacks a boot phase tag in U-Boot SPL processing,
its properties are stripped and the driver model will not bind to the bus.

Should &soc also be tagged with bootph-all here to ensure the children
nodes can probe successfully?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-upstream_u=
boot_properties-v7-0-e17cd424d5db@foss.st.com?part=3D2
