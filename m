Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4EF17A305
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 00:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891068; cv=none; b=Y7CT6SLx/kFlNRpJdPUMwuzTj6Tv8JRSioBxLoCaIBEtxeCaOIG34ZWrQLVzV9mIoe33xt70scQ4L5Ac7UkLlRUdGIXgLO9cU1Pn8IT2DWfNaSDIwRDafaKGJUqbXGGFMKN1TcYURVaPy/q9YiH6wxiUXGuk4kKitLqPH0SGX4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891068; c=relaxed/simple;
	bh=/6Y078M2eUHfV3uQ9aPHEv4zibeHwr9f4RiD88DyQdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YpUvhhI6lcdM355Q/2IWtxWQ94nm8UlvoD2TI3xieTWiY8ZvIK7kT27a6sPZ8he5fg66CKtQRchVE/ER/zKLxjoQdLEwBcx6hDVhQ4a4ZVZrTXBBs4XBMgungUH06SjQFJsRfyp/cm7HdjZmXI6VJguvtRlSqlrs5tIOLjcJIMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcxuKPw5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcxuKPw5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D711F000E9;
	Wed,  5 Aug 2026 00:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785891066;
	bh=VaJO/m8ldkyVgPZfGYxXdwb1DQO+VknWIptK1yOEMVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BcxuKPw5gTOWHxDvk44lGbMUatRengJvmlgcfl1pCvAIN7QLQtragANtBTB0oWiT7
	 DNLloEXp9pJzdVvKsleneJ4AnR75HQABrM7bAM0cylI+LBDaVCGv6oPVtjTd2PgF9F
	 FzNjowPPv8nKRK8LkLSMriLbmH1TTlySuo7uVkvYXfuUisZwo47Xj/nI77qWrBafTc
	 dYkbjTSjzTuozAATPXa+PnNoSFl0cXMoYh6AckMYPjyxhDS0g72lPj/2hBaQXau+wW
	 mFj4LOxRFfrTX53VjydegOP0rUnANfLQ18gwGk7n8M44hYDKUtnoOU8fjdY2XwNJVF
	 nD6TV5WX0uOBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am64: Enable IO expander
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805003859.412474-1-jm@ti.com>
References: <20260805003859.412474-1-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 00:51:05 +0000
Message-Id: <20260805005106.64D711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Configuring a level-sensitive IO expander interrupt as edge-trigge=
red creates a race condition that can permanently drop interrupts.
- [Medium] The internal pull-up is disabled for the open-drain IO expander =
interrupt line, potentially causing the pin to float if no external pull-up=
 is present.
- [Low] The IO expander node has `bootph-all` but its new `interrupt-parent=
` (`main_gpio1`) does not, leading to a dangling phandle in the bootloader'=
s DTB.
--

--- Patch [1]: [PATCH v2] arm64: dts: ti: k3-am64: Enable IO expander inter=
rupt ---
commit 17dd1ed4722bb7802cfb997027eb263adde31a41
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am64: Enable IO expander interrupt

On AM64 EVM and SK boards, MMC1_SDWP is used for IO expander interrupt,
remove from MMC1 pinmux node and setup as exp1 IO expander interrupt.

Link: https://lore.kernel.org/linux-devicetree/20260729195958.671147-1-jm@t=
i.com/

> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dt=
s/ti/k3-am642-evm.dts
> --- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
[ ... ]
> @@ -481,6 +488,12 @@ exp1: gpio@22 {
>  		bootph-all;
>  		compatible =3D "ti,tca6424";
>  		reg =3D <0x22>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&main_gpio1_ioexp_intr_pins_default>;
> +		interrupt-parent =3D <&main_gpio1>;

[Severity: Low]
Does this create a dangling phandle in the bootloader's DTB?

The exp1 node contains the bootph-all property, meaning U-Boot's fdtgrep
tool will extract it into the SPL device tree. However, it seems the
main_gpio1 node lacks the bootph-all property and will be stripped out of
the SPL DTB, leaving this interrupt-parent pointing to a missing node.

> +		interrupts =3D <78 IRQ_TYPE_EDGE_FALLING>;

[Severity: High]
Could configuring this as an edge-triggered interrupt cause a race condition
that permanently stalls the IO expander?

The IO expanders (TCA6424 and PCA9538) generate an active-low, level-sensit=
ive
interrupt that remains asserted (low) as long as unacknowledged events exis=
t.
If an input changes state while an existing interrupt is already being serv=
iced,
the line will remain low.

Because it is edge-triggered here, no subsequent falling edge will be obser=
ved,
and since the consumer driver doesn't poll the pending state before returni=
ng,
it appears the interrupt controller will miss all future events.

> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
>  		gpio-controller;
[ ... ]
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts=
/ti/k3-am642-sk.dts
> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
[ ... ]
> @@ -198,7 +199,6 @@ &main_pmx0 {
>  	main_mmc1_pins_default: main-mmc1-default-pins {
>  		bootph-all;
>  		pinctrl-single,pins =3D <
> -			AM64X_IOPAD(0x029c, PIN_INPUT_PULLUP, 0) /* (C20) MMC1_SDWP */
[ ... ]
> +	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM64X_IOPAD(0x029c, PIN_INPUT, 7) /* (C20) MMC1_SDWP.GPIO1_78 */

[Severity: Medium]
Will this disabled internal pull-up cause the interrupt line to float?

The IO expanders drive an active-low, open-drain interrupt line which requi=
res
a pull-up. The original configuration explicitly used PIN_INPUT_PULLUP.

By changing this to PIN_INPUT, the internal pull-up is disabled. If the boa=
rd
does not have a physical external pull-up resistor, the open-drain line cou=
ld
float and generate spurious falling edges.

> +		>;
> +		bootph-all;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805003859.4124=
74-1-jm@ti.com?part=3D1
