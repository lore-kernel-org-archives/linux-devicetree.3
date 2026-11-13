Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602531;
	b=We+dAR8yqD5V2WoUXeIOCulbDPWJLAx8ufsi5zvjYKtUFGgh6zv+X6DkItqAN13xAqO1
	 AdGgjrBhVluOKT+McgQGeX69RtVqv8F2fbfzrHWHIi/r/yePhk6z3LLVsiGwOZAXuiAGQ
	 E6SuMW0z8CKmxUht0Si52WP94F1WwHtxoPH9SerGOuRZZS4Wt9NEIyY5WlD2UsnU21RZo
	 vxA/dQgJ0QrBo8XlA5SQQmS9R+0IMy+GNshKx+K1fwRviu1pQCPrqgQO8UCB7H/O7Uz6h
	 5jpWjOeoxxvyvpaJTs9wBWzbqzKmoDhaUlk2eicyPifVhqzsll1UM9hs1sZJ4Z1kDzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602531;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Yow3iB7Ugv0v+zbREP5WPcCfG/DNEomvgzAhpbkxIQE=;
	b=yihRKHPp5neYnLfJ1FdB5S8Bw9Q5X8higtgrx2lfq957A+0XGmHLE6MhHR9oGsM8OxJW
	 zKpKsVDfprT59L/hUOqIPQnwWFN5DdLymNjo+8DnPsKFgJmvc36RV+ph/nHAhIJkcQv20
	 hQfcEblX6NlL4YdXc8wDJbrUc+TK/Uvd0Dft6m+H1uqV+klFvbo1w2F5m25AqGas4CjJI
	 u6leMLkGdglmWizW8P78ED2oJ45h3yAs3IZQGxdA6GFw+emTsB0BYnz4lYwDj4km+Nx9A
	 9JbVJN+wuOoORw7wKfVgbqYxoQaya+g+UUuACZBtEfjE+0f/0vJh3P3k4pWJb6CIPCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YJumToPi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66A5606A88A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YJumToPi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0CB1F000CA;
	Fri, 13 Nov 2026 20:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602530;
	bh=Yow3iB7Ugv0v+zbREP5WPcCfG/DNEomvgzAhpbkxIQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YJumToPixlTkzeq5tMesldgxwGKX2Hv2U4PkV6JHwpu8KcgLDJFaxROn+OJq1Zqms
	 94tGMj1rnL6m2zsFQqQz0hxtIpI7l99Om4TiSssFmXD0tOW66rWAlwjVFrzOzQK0jD
	 OTqnuSBNskK9lILOBZSNvmfHcyJsdynty3tcAdhVRcnc1mFuj2jPMJEwQHWd5OfwLk
	 VirgMON6kD5DL0QvOJCgSZ1eOq2DxRFE1btqbmD+bubuJT2QRRCpi6TiRdVmeZCNT2
	 85scaTUuXr4LysnfYl0SeSF12WEfcOCPIHwHMZo57zR8YsLeaEloPDBNW2I6o3XqJj
	 IC+QuHpebBDnw==
Message-ID: <sashiko-outbox-213671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add Waveshare
 8" DSI touch overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com>
References: <20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 20:42:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: qcom: monaco-arduino-monza-waveshare: wrong
  mdss_dsi0 vdda-supply
- [High] arm64: dts: qcom: Makefile: monaco-el2.dtbo applied to non-EL2
  Waveshare DTB
--

commit b8a3c8f8c7e536ea10afaadd72a3ac9f01d55e3c
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8" DSI touch overlay

This commit adds a device tree overlay for the Waveshare 8" DSI TOUCH-A
panel and touch controller on the Arduino Monza board, disabling the
shared DSI0 HDMI bridge path when applied.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 8329c06b60a3f..faa0e0f7b867f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -83,6 +83,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D monaco-arduino-monza.dtb
>  monaco-arduino-monza-el2-dtbs	:=3D monaco-arduino-monza.dtb monaco-el2.d=
tbo
> =20
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D monaco-arduino-monza-el2.dtb
> +
> +monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs	:=3D monaco-arduino-mo=
nza.dtb monaco-el2.dtbo monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo

[Severity: High]
Should monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs omit
monaco-el2.dtbo?  Including monaco-el2.dtbo in the non-EL2 target disables
gpu_zap_shader and iris, and attaches EL2-only apps_smmu IOMMU mappings to
remoteproc_adsp, remoteproc_cdsp, and remoteproc_gpdsp when booting in the
default EL1 mode under Gunyah.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-ds=
i-touch-a.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-=
dsi-touch-a.dtso
> new file mode 100644
> index 0000000000000..003c5bcea4973
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch=
-a.dtso

[ ... ]

> +&mdss_dsi0 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	vdda-supply =3D <&vreg_l1c>;
> +
> +	panel@0 {
> +		compatible =3D "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
> +		reg =3D <0>;
> +		backlight =3D <&wsgpio>;
> +		reset-gpios =3D <&wsgpio 1 GPIO_ACTIVE_LOW>;
> +		vccio-supply =3D <&panel_iovcc>;
> +		vdd-supply =3D <&panel_avdd>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint =3D <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes =3D <0 1 2 3>;
> +	remote-endpoint =3D <&panel_in>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply =3D <&vreg_l4a>;
> +};

[Severity: High]
Does setting vdda-supply =3D <&vreg_l1c> on mdss_dsi0 overwrite the SoM's
1.2V DSI supply with the LPDDR VDDQ regulator?

In arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi, mdss_dsi0 already uses
vreg_l5a (1.2V), while vreg_l1c is the 0.3V-0.512V LPDDR VDDQ rail:

arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi:
		vreg_l1c: ldo1 { /* LPDDR VDDQ */
			regulator-name =3D "vreg_l1c";
			regulator-min-microvolt =3D <300000>;
			regulator-max-microvolt =3D <512000>;
    ...
&mdss_dsi0 {
	vdda-supply =3D <&vreg_l5a>;
};

&mdss_dsi0_phy {
	vdds-supply =3D <&vreg_l4a>;
};

Overriding vdda-supply with vreg_l1c leaves vreg_l5a unvoted and causes
the DSI driver to disable the LPDDR VDDQ regulator on display suspend or
probe unwind.  Both vdda-supply on mdss_dsi0 and the redundant
mdss_dsi0_phy node can be dropped from the overlay since
monaco-monza-som.dtsi already configures them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-monza_wave=
share_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com?part=3D1
