Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7C337757C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035308; cv=none; b=qHXUWu5d7cOymTNlxifS1kl2GjYKyX14Gkf6uPy3/GDJS8Cz9ctiBCGsCfL78Mj9xLui7zACY8B74gpwZXwNx4b4ZCJv+eISuHAQE3TfDW90qj3WNGRGgU1g9uju65Lnp8B2+hjJylwf0m54ro/eXF8zPDK38X62ho2XA4HYO+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035308; c=relaxed/simple;
	bh=Qt1ZOqBM/0MD0rb0hSsSHiY3nOb358MYcYQmytVEnTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ISKofp9LcCM7PXG3X0pT3tqdZFw1Dcvd65O9vbIwYmmh0PODyrBmHEBx3h58r7psLKuRfbj9+NAcHhqu7E4vNN8wg1qN/5KqtjX3dTpSE8V2I7wfbuR/477t5M7AJD3bQ0zTzt1dAJDUvtrfjgkmkkN5FSbLh/2ulH2X/FmQ4OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmD9wJHR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmD9wJHR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B44D1F000E9;
	Thu,  6 Aug 2026 16:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786035306;
	bh=NA8n4gItK+z66+Nrm7tP9pXvZRCaePsFSY8u5iIJjA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PmD9wJHRGL07R2s/XLFwx6ZR7GH7g9QLdhxtwFbdLMCUb4Luwk8vzGaQwSf0axM9a
	 tE3jlaCt4tjp6gdw5H5oHProdGlesrH+dFIkS9A9WwGFBo8py+nR1uQblzCpjvlp9F
	 JdGsdjB/wUmELUSZFujtR9Zx5YHuAaN0Eh/HpyVE5k/S1dvAO/MQJg5YYCLAv17i16
	 sd46cujJOpZulc1NbJdheZeLmkPsUWeLDEp85saEVZDgMhxTk6/JmK6cA2uVEjGyK8
	 WpXf87KbPM2ohmD1h2a5E2qhYSk2TfvA7AUDXNlWpzG8abwh1XYrktnnCysqWNPKyZ
	 9Yd6FwWZ1EOhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Tiwari" <anand.tiwari@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 16:55:05 +0000
Message-Id: <20260806165506.3B44D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `/delete-property/ #sound-dai-cells;` directive in the DT ov=
erlay is ineffective because standard device tree overlays do not support p=
roperty deletion.
- [Low] The eDP backlight PWM controller (`pmk8550_pwm`) is unintentionally=
 left enabled in the headless base DTB.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display=
 overlay ---
commit 820f4e5720b8cbcecbbe4eead917eaa1fbedcf0e
Author: Anand Tiwari <anand.tiwari@oss.qualcomm.com>

arm64: dts: qcom: hamoa-iot-evk: Add eDP display overlay

Move the eDP panel configuration and related power, backlight, and pinctrl
nodes into a separate overlay. Keep the base DTB suitable for headless
variants and provide a composite DTB for headed variants.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso b/arch/arm64=
/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> new file mode 100644
> index 0000000000000..759d05342627f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
[ ... ]
> +&mdss_dp3 {
> +	/delete-property/ #sound-dai-cells;

[Severity: Medium]
Will this /delete-property/ directive actually remove the property from the
base tree when merging the overlay?

Standard device tree overlays do not support property deletion. When compil=
ed
with dtc, this deletion directive is evaluated against the local overlay AST
where the property does not exist, and is silently discarded. The .dtbo
format lacks a deletion opcode, so the property will remain enabled in the
composite device tree, potentially causing DT schema validation errors or
incorrect audio subsystem probing.

[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/hamoa-iot-evk.dts
> index 9fa86bb6438ec..78cefd5391b17 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
[ ... ]
> -&pmk8550_gpios {
> -	edp_bl_pwm: edp-bl-pwm-state {
> -		pins =3D "gpio5";
> -		function =3D "func3";
> -	};
> -};
> -
>  &pmk8550_pwm {
>  	status =3D "okay";
>  };

[Severity: Low]
Should this status override for pmk8550_pwm have been removed from the base
device tree?

Since the backlight consumer and GPIO configurations have been moved to the
overlay, leaving pmk8550_pwm enabled here keeps it active on headless
variants without any consumers. It is also redundantly enabled in the new
overlay.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-edp_overla=
y_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com?part=3D1
