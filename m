Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B018F3B27DC
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 06:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763667; cv=none; b=qp8QK919Nsu5uTtmI/zNTvGLG3YCtz4FFIplfOSJqhQTtdiI17am9WJyxKYtCQM0E/FZGXzUCMoo0oM3Yc/mAJX02NzRPCDheAdSf8gWyspJhrg1BatiYwsls2QC9BZ6ZSsv66eTxnP6CEIn2rJclpOAn819+qXZZlFV8xamVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763667; c=relaxed/simple;
	bh=A2cpBHV091vvtq0pOAT4AoqCDS9Qt/BAItbrxBDJkps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oTmV+Q1tK+0/1H+dJiGYVXb4Dx3HGjCNdCnoROI2Pb2ovGDlATSX0FcKtg+tmC9igqAh1ynvw4l/mJTmH9bq2DKBBuXeerbvHuFw49iAST/PxkfTMGjSRvzl72DvIB5O8c3qgjRmA64kTlSaT38ychoM7XV54SS2W23JX5kgTDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flPmMltc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flPmMltc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B381F00A3D;
	Mon,  7 Sep 2026 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788763665;
	bh=I2ieof2cdY/Ph3GnPUbJ9gr8fxbW7rPTMbD7H/Ynwmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=flPmMltcmkdLBYWx+9b0hLBIdUI167paqZq5uOzqom1/lgyUGuseoJWehtxw8/+V6
	 cTMxrkW415QPYMtzhLwLwnyE0Dq1QTwVwjG43Dqtx36CQUN3SnMKqcjsVXDgZwdjP8
	 BQU8HkRcX6BnsiXdW+aX9pUMeeWcqDeYz+GPWkEj3Fs9zY+db5rXXyrK6Q3fZ0BkoV
	 S15SphXNkm7SScKfxN0C5tn1o9k9K3wuQoUxbxAZEMx52w+ysPmwMX4nw+b7IVZTBu
	 uVD+QlLDAv1keBJZRTbpAXsYtB24rULigwUPguCx1bSGiqWXkU5Mx3GxNY3hwCyavj
	 fWR/qH4SIWP4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shashank Maurya" <shashank.maurya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 06:47:44 +0000
Message-Id: <20260907064745.45B381F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The overlay uses 'regulator-always-on' for 'reg_dsi_touch' to wo=
rk around missing regulator support in the 'rpi-touchscreen-v2' driver, bre=
aking power management.
- [Low] The &i2c8 node contains undocumented downstream properties 'qcom,lo=
ad-firmware' and 'qcom,xfer-mode'.
- [Low] The panel node is missing the required fallback compatible string '=
ilitek,ili9881c'.
--

commit ea08b302349d4826d0dcf202cbbe6bec559335f7
Author: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay

This commit adds a device tree overlay for the Raspberry Pi 7-inch DSI
touchscreen panel on the Monaco EVK platform. It enables mdss_dsi0 with 2 d=
ata
lanes and configures the panel MCU on I2C8.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dt=
so b/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso
> new file mode 100644
> index 0000000000000..f27b5a4a60934
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso

[ ... ]

> +	reg_dsi_touch: regulator-touch {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "rpi-touch";
> +		regulator-min-microvolt =3D <5500000>;
> +		regulator-max-microvolt =3D <5500000>;
> +		gpio =3D <&expander3 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;

[Severity: Medium]
Does this regulator-always-on property prevent the display from being power=
ed
down?

It appears this forces the regulator to remain active because the I2C MCU
driver (rpi-panel-v2-regulator) does not acquire or enable vcc-supply.

While this ensures the MCU has power during I2C probe, it structurally
prevents the display driver from legitimately disabling power during system
suspend or display blanking, leading to increased power consumption.

> +	};
> +};
> +
> +&i2c8 {
> +	qcom,load-firmware;
> +	qcom,xfer-mode =3D <1>;

[Severity: Low]
Are these downstream properties supported by the upstream device tree schem=
as?

Adding qcom,load-firmware and qcom,xfer-mode directly to the I2C bus node
will lead to dtbs_check validation failures during compilation since they a=
re
undocumented.

> +
> +	status =3D "okay";

[ ... ]

> +&mdss_dsi0 {
> +	vdda-supply =3D <&vreg_l1c>;
> +
> +	status =3D "okay";
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	panel@0 {
> +		compatible =3D "raspberrypi,dsi-7inch";

[Severity: Low]
Is this missing the required ilitek,ili9881c fallback compatible string?

The DT schema for the Ilitek ILI9881c explicitly requires the compatible st=
ring
to be an array that includes the device-specific compatible and the
ilitek,ili9881c fallback. Omitting it will cause dtbs_check validation
failures.

> +		reg =3D <0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-rpi_dts_ov=
erlay-v2-0-a4989322ce00@oss.qualcomm.com?part=3D1
