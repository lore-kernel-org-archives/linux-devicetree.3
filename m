Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF574C14
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925200; cv=none; b=NohPzKi/fQFsiKMkb+CHpiXZsEZaxR+CCxleYE14mD/TZTlulPrnp2PdJ52e6C5d5sqEANL+6dgTcQuz09wDJrxrIBTSR+By6YRidUAUn9fQQkfbo32Kx4yyw5z54Lgb7MtgHWRS8hopNM9FvXGWfQu6FL7G+0WCuf8sGXOvb4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925200; c=relaxed/simple;
	bh=gQixRVoAr/RQBndoOQzSRW8qdj0JPB4M74z9o9nfcds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tlaIvF/7Ftu2fEjuYodEPpA9U6cwPyfd5lANnYUneP+/Wpz5sqyyUfj36Z9pXKVeoPXsMttuowizSITWUshkaV5hDRekbIpcGpwUclLEKJHeuJVI8TYNcMNK28LpZrYf9+eRFcb/BOyWkEfaVC68ZYexNmaS22xKgUR9Q23dFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYN8lz5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYN8lz5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7CB1F000E9;
	Wed,  1 Jul 2026 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925199;
	bh=8ezNTxbX6OymyHFE25f+StJesiHJ5/czwa560RP0kYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kYN8lz5cQtlWOYOJLBVMOshcbxmN9BgcIVyu6FMdiOXtC0jhEX/FaFUaHTzCMYnra
	 Q5NtUynxmWjHa7nmMEQR3XFz/HdcNjYR3z37rSd+KROl/1U4yHPD5/pUcNeeRu7GU7
	 J3yQbOhroOSHaFKsU75OuWcuz6RNO5KdMWxCbNQDYjkoESt3gUlhSRds96ieRVK8O1
	 xTQoVav8nMq0gqh58SD6Wq389KEvTov4wCT4q6hX0ho4FXsMZYENXde/J337xr5FRo
	 9zTGLhlWasXuP47SsbcJyN8LaKko4Q8SJA/kU8HHxKcUwz/7dcRfWGClSBfKsYjCVS
	 UUQcUwVB9lDIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: Add devicetree for the
 Graperain G3568 v2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701164543.3967388-9-coiaprant@gmail.com>
References: <20260701164543.3967388-3-coiaprant@gmail.com>
 <20260701164543.3967388-9-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 16:59:58 +0000
Message-Id: <20260701165958.BC7CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The Broadcom SDIO Wi-Fi node uses an undocumented compatible str=
ing without the required generic fallback, breaking driver OF parsing.
- [Medium] The adc-keys press-threshold-microvolt values are calculated as =
midpoints rather than target voltages, causing the MENU button to be incorr=
ectly detected as the ESC button.
- [Medium] Incomplete Bluetooth I2S audio configuration: missing pinctrl an=
d sound card binding.
- [Low] Copy-paste error in bluetooth pinctrl node names indicating the wro=
ng GPIO bank and pin numbers.
--

commit 808ebde69e3acf8280f05f45c66fcb212e1918cd
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

The Graperain G3568 v2 is an RK3568-based development board. This patch
introduces the device tree file to support its hardware features, including
Ethernet, wireless connectivity, and physical buttons.

Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6dadd=
ec9e400458816dd4c57ba807fc3.pdf
Link: https://blog.gov.cooking/archives/research-graperain-g3568-v2-and-fla=
sh.html

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts b=
/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
> @@ -0,0 +1,931 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)

[ ... ]

> +	adc-keys {
> +		compatible =3D "adc-keys";
> +		io-channels =3D <&saradc 0>;
> +		io-channel-names =3D "buttons";
> +		keyup-threshold-microvolt =3D <1800000>;
> +		poll-interval =3D <100>;
> +
> +		button-esc {
> +			label =3D "esc";
> +			linux,code =3D <KEY_ESC>;
> +			press-threshold-microvolt =3D <1250000>;
> +		};
> +
> +		button-menu {
> +			label =3D "menu";
> +			linux,code =3D <KEY_MENU>;
> +			press-threshold-microvolt =3D <1600000>;
> +		};

[Severity: Medium]
Will this configuration correctly identify the MENU button? The commit mess=
age
notes the hardware voltage for MENU is 1400000 microvolts.

Because the adc-keys driver matches based on the smallest absolute differen=
ce,
a 1400000 microvolt reading is closer to the ESC threshold
(1400000 - 1250000 =3D 150000) than the MENU threshold
(1600000 - 1400000 =3D 200000).

Could this cause pressing the MENU button to register as an ESC key press
instead?

[ ... ]

> +/* used for AP6356S Bluetooth Sound */
> +&i2s3_2ch {
> +	status =3D "okay";
> +};

[Severity: Medium]
Does this node require pinctrl and a simple-audio-card binding to function?
It appears the I2S interface is enabled, but without routing the signals to
the external AP6356S chip pins and linking the I2S CPU DAI to the Bluetooth
codec DAI, ALSA might not register the sound card.

[ ... ]

> +&pinctrl {
> +	bluetooth {
> +		bt_reg_on_h_gpio3_a0: bt-reg-on-h-gpio4-b2 {
> +			rockchip,pins =3D <3 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		bt_wake_host_h_gpio3_a1: bt-wake-host-h-gpio4-b4 {
> +			rockchip,pins =3D <3 RK_PA1 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +
> +		host_wake_bt_h_gpio3_a2: host-wake-bt-h-gpio4-b5 {
> +			rockchip,pins =3D <3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};

[Severity: Low]
This isn't a functional bug, but do the node names here have a copy-paste
error? They indicate gpio4-b2, gpio4-b4, and gpio4-b5, but the contents
configure pins on GPIO bank 3 (RK_PA0, RK_PA1, RK_PA2).

[ ... ]

> +/* used for AP6356S WiFi */
> +&sdmmc2 {
> +	bus-width =3D <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;
> +	mmc-pwrseq =3D <&sdio_pwrseq>;
> +	non-removable;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sdmmc2m0_bus4 &sdmmc2m0_cmd &sdmmc2m0_clk>;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc3v3_sys>;
> +	vqmmc-supply =3D <&vcc_1v8>;
> +	status =3D "okay";
> +
> +	wifi@1 {
> +		compatible =3D "brcm,bcm4356-fmac";
> +		reg =3D <1>;
> +	};
> +};

[Severity: Medium]
Is the generic fallback compatible string missing here? The brcmfmac driver
explicitly checks for brcm,bcm4329-fmac during OF probing. Without this
fallback, the driver's OF parser aborts and properties like a
bootloader-injected local-mac-address might be ignored.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701164543.3967=
388-3-coiaprant@gmail.com?part=3D3
