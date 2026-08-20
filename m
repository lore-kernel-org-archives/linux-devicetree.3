Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346B933CE86
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787260202; cv=none; b=VIZWkmDKMyhCdUipBrcB+/AmqB6dUvAgt6xXrf6XBBr/6gcPFJlfnPWd+D/xYNJlAzekREmcgLA8fSohOavces9xl0DPdrkCckZLqZ8H4lZRBQr+HiX6b2dBY4i31gEH2B8N443sFvebV7RFIUuz8UN7La3ET/ucQClkXVudypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787260202; c=relaxed/simple;
	bh=z2Pp+v7159H0kwUon7F2njPrA731aIlbi2sjF8Qz6MY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QlWaTVXORvaUTru4DbcdQSlaJ8f0huHW6N80Hj83O8Sa0ZYvdU5Y7FBTyzIoqTjNCoPPvGrpfD03bQS/4z8xCkhJxl56UKSONQeYX8ZYuyRVrl60aaetoneK3qMu+9BE8ApDykBMFfx59H4GCvzbhKzbvIFog923g415ssQcHxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTfeo47G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTfeo47G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A331F000E9;
	Thu, 20 Aug 2026 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787260200;
	bh=LYfCXOCVh6YpF3gYB6jViq2nuuKHPMnun1hYyRlewjQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kTfeo47GRVF0KJZm2JCkuYNwxM4aHm+AA4ZNUut/J3G/ez7D+WfSPE+8KC3z5if1d
	 9UuM35elyfyvJ3sinpsbiN0qyKVJhuGLLWvwyP4erGFfnZLgGDCc26uqf696NFcfcD
	 /jx9RIby8rypgAlRJM6jg7/EEje3lKoGCr1Gr+ruPSW/QaslHNA6yPlHrM3w6Y0LHS
	 dLlXV0AbQf319HlYVelKdlhzbfP/Sj8V86E7c0KHNW1mofNYJJ9XSlzstQ6LHT8oPh
	 1A2XEHfm65WkLQhENTIFBMF1iqt9OdSy8SgAXCf6ThKXSF+s8/pONUvODJ8Pe4bnfi
	 6I36Ah6RymVuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kristian Brox" <isyourbrainfoss@proton.me>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260819210906.2500789-4-isyourbrainfoss@proton.me>
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260819210906.2500789-1-isyourbrainfoss@proton.me>
 <20260819210906.2500789-4-isyourbrainfoss@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 21:09:59 +0000
Message-Id: <20260820211000.74A331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The default pinctrl state applies `output-high` to the reset pin u=
nconditionally at probe time, before the NFC chip's power supply (`vdd-io-s=
upply`) is enabled, risking hardware latch-up.
- [Low] The `reset-gpios` polarity is specified as `GPIO_ACTIVE_HIGH` to wo=
rk around inverted logic in the `st-nci` driver, resulting in an inaccurate=
 hardware description.

Pre-existing issues:
- [High] The NCI device is registered and exposed to userspace before its s=
tate (the `raw_nci` flag and the IRQ handler) is fully initialized, creatin=
g race windows.
--

--- Patch [3]: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add =
ST21NFCD NFC ---
commit 5a4863ae6956a4a982d319ea2fa7fb68012f0fdf
Author: Kristian Brox <isyourbrainfoss@proton.me>

arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD NFC

Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
active-high. Compatible is st,st21nfcd (raw NCI).

SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/ar=
m64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 04cb9230d29fd..c5d51826b6033 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -908,7 +908,23 @@ redriver_ss_in: endpoint {
>  &i2c9 {
>  	status =3D "okay";
> =20
> -	/* ST21NFC NFC @ 28 */
> +	nfc@8 {
> +		compatible =3D "st,st21nfcd";
> +		reg =3D <0x08>;
> +
> +		interrupts-extended =3D <&tlmm 41 IRQ_TYPE_LEVEL_HIGH>;
> +		reset-gpios =3D <&tlmm 38 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Is this GPIO polarity specified as GPIO_ACTIVE_HIGH to work around inverted
logic in the st-nci driver?

The ST21NFCD physically uses an active-low reset pin. While specifying
GPIO_ACTIVE_HIGH compensates for the driver incorrectly handling it as an
active-high enable line, it forces the DT to describe the physical hardware
polarity incorrectly.

> +
> +		pinctrl-0 =3D <&nfc_int_default>, <&nfc_reset_default>;
> +		pinctrl-names =3D "default";
> +
> +		clocks =3D <&rpmhcc RPMH_LN_BB_CLK2>;
> +		vdd-io-supply =3D <&vreg_l18b>;

[ ... ]

> @@ -1410,6 +1426,21 @@ hall_sensor_default: hall-sensor-default-state {
>  		drive-strength =3D <2>;
>  		bias-pull-up;
>  	};
> +
> +	nfc_int_default: nfc-int-default-state {
> +		pins =3D "gpio41";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	nfc_reset_default: nfc-reset-default-state {
> +		pins =3D "gpio38";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +		output-high;
> +	};

[Severity: High]
Could this output-high configuration cause a hardware latch-up?

This applies the output-high state to the reset pin unconditionally at probe
time. Driving 1.8V into the pin before the NFC chip's vdd-io-supply is
enabled forward-biases ESD protection diodes, which can cause back-powering
and excessive current draw.

[Severity: High]
This is a pre-existing issue, but I wanted to mention a race condition in t=
he
NCI device registration that might be aggravated by this patch.

In drivers/nfc/st-nci/i2c.c:st_nci_i2c_probe(), the NCI device is registered
and exposed to userspace before its state (the raw_nci flag and the IRQ
handler) is fully initialized:

drivers/nfc/st-nci/i2c.c:st_nci_i2c_probe() {
    ...
	phy->ndlc->raw_nci =3D phy->raw_nci;

	phy->irq_active =3D true;
	r =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
				st_nci_irq_thread_fn,
				IRQF_ONESHOT,
				ST_NCI_DRIVER_NAME, phy);
    ...
}

Userspace can react to the netlink device registration uevent and bring up =
the
device before the probe function finishes executing, which can lead to drop=
ped
interrupts or misprocessing of NFC frames.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819210906.2500=
789-1-isyourbrainfoss@proton.me?part=3D3
