Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8676B3AB283
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 21:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546024; cv=none; b=trnJYGpw41Z5ElLuqcpdWqFJsZ3Y2i1CWTrmoLbjhZrv9Rp+IrOYPJSKnRzhKgg+ZFYle1rjWCK2YDY1eaT10e5qankLCh/DlejFS2vdh8omMrYBF9nJftYrNpMQO3quRs4752OWXGfoCq+2+LT476xACybKloWY1c3BtI0rUN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546024; c=relaxed/simple;
	bh=R0gb8zx51y5UDbf24blqrEEm5DyWv/hE6m+36Sd4JAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Acoak2SI/cTg1jqk0Ido8fWUxlzp7n4hlstwoZA7BaAkHDGCmmp0MJk2KZZP8/ttM7vFDrSRToT4OLvf1TP79Vbl3e3Npw2SF1GE6htU/s93+cJLocstJ4sLuoYveOZXR8uEjVxAHpoDQomUmd9tss94fozL+fzz/OSiI2qKGq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVkL90oD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVkL90oD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA1D1F00A3A;
	Wed,  8 Jul 2026 21:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783546023;
	bh=09KoiWAmqnzrzYreXxLHaVmi4hi9NFr+Letix6nMpo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nVkL90oDbgksk98rnE3jvhz9MD2bGJe8sMyNPq21h1YCo0jzViVGWjwk56N81HbSJ
	 MWCg6wZYA7EiIR/OxJup0Z+tfkKWR947lMBsKETWeMxVRbOTlHxXs4vEY76+534m4M
	 js2pTY1kLe1EYmccs+BhPUdoIVEYcX0e5CBx4teo7QmcSzqvX/XWQrTqJnHa/shmUk
	 C0lFeUIB7mLjhM/IlFCaDDqSYuG/eSwwLzWQNRurDeEr5VhcParOYwCmtJmdmWEEjm
	 vA1TFlc8koCfCTVaPxRZWZqrVrAjCh5cloEzcEeHz+/4a+R1T1QCl0oeqh5TeM8yPY
	 bJF8KA9LPHFbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: ti: var-som-am62: Add support for
 Variscite Symphony Board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <09a0962ea44181ad2c951c129ced30dd4a57aa21.1783545241.git.stefano.r@variscite.com>
References: <cover.1783545241.git.stefano.r@variscite.com>
 <09a0962ea44181ad2c951c129ced30dd4a57aa21.1783545241.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 21:27:02 +0000
Message-Id: <20260708212703.1CA1D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `reg_sdhc1_vmmc` regulator incorrectly assigns a pinctrl node =
to `vin-supply` and is missing its `pinctrl-0` property.
- [Medium] `reg_ov5640_buf_en` toggles `GPIO0_21` during early boot, but it=
s pinmux is incorrectly grouped into the `ov5640` camera node.
--

--- Patch [3]: [PATCH v1 3/3] arm64: dts: ti: var-som-am62: Add support for=
 Variscite Symphony Board ---
commit 12f2ccbdac4310e1455bb2f2cb77ba574e516e28
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

This commit adds device tree support for the Variscite Symphony carrier
board with the VAR-SOM-AM62 system on module. It includes configuration
for SD card, USB, Ethernet, camera, GPIO expander, and other interfaces.

Link: https://www.variscite.it/product/single-board-computers/symphony-boar=
d/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts b/arch/=
arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
[ ... ]
> +	reg_sdhc1_vmmc: regulator-sdhc1 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "+V3.3_SD";
> +		vin-supply =3D <&pinctrl_sd1_vmmc>;

[Severity: High]
Does this incorrectly assign a pinctrl node to the vin-supply property?

If the regulator subsystem attempts to resolve this as a parent regulator,
will it fail and return -EPROBE_DEFER, preventing the SDHC1 controller
from probing?

Additionally, are the pinctrl properties (like pinctrl-0 and pinctrl-names)
missing from this regulator node entirely? Without them, will the enable
GPIO (GPIO0_30) fail to have its pin multiplexing configured correctly?

[ ... ]
> +	reg_ov5640_buf_en: regulator-camera-buf-en {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov5640_buf_en";
> +		gpios =3D <&main_gpio0 21 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Because this regulator is marked as regulator-boot-on, it will attempt to
drive GPIO0_21 during early boot. Does it lack its own pinctrl mapping
to ensure the pin is configured as a GPIO at that time?

[ ... ]
> +	ov5640: camera@3c {
> +		compatible =3D "ovti,ov5640";
> +		reg =3D <0x3c>;
> +		clocks =3D <&clk_ov5640_fixed>;
> +		clock-names =3D "xclk";
> +		AVDD-supply =3D <&reg_2p8v>;
> +		DOVDD-supply =3D <&reg_1p8v>;
> +		DVDD-supply =3D <&reg_1p5v>;
> +		powerdown-gpios =3D <&main_gpio0 10 GPIO_ACTIVE_HIGH>;
> +		reset-gpios =3D <&main_gpio0 22 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_ov5640>;

Since pinctrl_ov5640 contains the pinmux configuration for GPIO0_21, but is
attached to the camera node instead of the regulator, will the pin remain
in an undefined state during early boot until the camera driver probes
much later?=20

Should the pinmux for GPIO0_21 be moved to the reg_ov5640_buf_en regulator
node instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783545241.gi=
t.stefano.r@variscite.com?part=3D3
