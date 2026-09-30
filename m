Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77E4C7556
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767648; cv=none; b=AOSlwT6AwZdTyHDWbYTtwZpdPAqTr7F9XudxgBr50MLoERALv7O8TSlJ/arFfBfDGA+6m8O/MX5SorBpYjIbr7jTl8+diKrkh05rmzjoNgdnqnJUOEwW7CigszMvAM4o8B1by2owOllO8C27jVsDoMM3b1ZO83S1AjN77Gik/BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767648; c=relaxed/simple;
	bh=3Lch+iqDknWICVc9exWef1/L9bknekHRnw58stBKaAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hPZoJU7n8qyQJkGsTQ3dnwGRR67hVUhxVR/LOs8Z3GQYrqne0EkRFNolfEmq6P4Z0AOQ86YWzFUIuxVdvhvWy7EqLkbn+AGRkihgM2deUL4byYlCkdso+6gZndTLvKxhedFu3+DpdBUdn4cD7L/APky+jaYUVXDyu7zRQfHECa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZfonKLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZfonKLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F3B1F000FF;
	Wed, 30 Sep 2026 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790767647;
	bh=cQ2AEZG/WBj/4au6JIhREQ0FpU+cjtLxR2stZS8+AF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HZfonKLGyeIFe6zqqp6MpL9hv2fpwc5o88TIJFHLWrePl6DZrDmbHWOZ2vtSXcSlS
	 oRE8dByLjp/3f0lMNu60qMnB7i7kAmQcbcSCBGG8xATXUkvV6/0YLDjn+ipMSHzLmt
	 E3BAVV7QbVDockQ55trAAuPjsxs+XUEicEDdac4tn4NESuGzjKPSn0QPaP9GOW8/gg
	 L7DKx5sU9Fgyst4AEaLLVTuRNKoL9SNYqfVzJ96Yvt5FpQHzdM0vqLD3AJqwRz3VLT
	 TjplLUmMv3338iPFKX7JMZk4Cgk0l/nzkbCkTfh+ckdTOxJrxL5CU8h++m5/rL3ian
	 j/a3Gh5V68mAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260930-shikra-dt-changes-v5-2-8eaf658a0e38@oss.qualcomm.com>
References: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
 <20260930-shikra-dt-changes-v5-2-8eaf658a0e38@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 11:27:26 +0000
Message-Id: <20260930112726.E6F3B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: panel ilitek,ili7807s ignores invalid wled-supply leaving bac=
klight disabled
- [High] dts: missing pinctrl configuration for vreg_wled GPIO 91
--

commit d926189f53e6ce7f475ac9993bc0332fb49bcb7f
Author: Arpit Saini <arpit.saini@oss.qualcomm.com>

arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
   =20
Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqs-evk.dts
> index 7a2f3e1518fdb..5e49a5c71a777 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -23,6 +23,86 @@ aliases {
[ ... ]
> +	vreg_wled: regulator-wled {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg_wled";
> +		gpio =3D <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};

[Severity: High]
Does this regulator definition need a pinctrl configuration for gpio 91?

Without explicitly configuring the pin muxing to a GPIO output function with
appropriate drive strength and bias, the pin may remain in an alternate
function or High-Z state left by the bootloader, causing attempts to enable
the backlight power to fail silently during hardware initialization.

> +};
> +
> +&mdss {
> +	status =3D "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply =3D <&pm4125_l5>;
> +
> +	status =3D "okay";
> +
> +	panel@0 {
> +		compatible =3D "dlc,dlc0697", "ilitek,ili7807s";
> +		reg =3D <0>;
> +
> +		reset-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply =3D <&pm4125_l15>;
> +		avdd-supply =3D <&vreg_disp_p>;
> +		avee-supply =3D <&vreg_disp_n>;
> +		wled-supply =3D <&vreg_wled>;

[Severity: High]
Is wled-supply supported by the ilitek,ili7807s panel binding and driver?

The ilitek,ili7807s device tree binding specifies unevaluatedProperties: fa=
lse,
which makes wled-supply invalid and ignored by the panel-ilitek-ili7807s.c
driver.

Since vreg_wled lacks regulator-always-on and is not successfully tied to a
consumer that will enable it, it defaults to off, leaving the display backl=
ight
hardware unpowered and the screen dark on the Shikra CQS EVK or CQM EVK boa=
rds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-shikra-dt-=
changes-v5-0-8eaf658a0e38@oss.qualcomm.com?part=3D2
