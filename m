Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21484E06FE
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651956; cv=none; b=jNCrt96/X5m3vE5J/W2mqNfR2szyOUVu9+A499sTuaJKGd0y1gvZDOM9E0lYN4zoZXOPf9je3f9MU5kHvPtamVmNMs2WT+XZSXKJ3f2GtCfxL98lF+OA9EPdW9hQE5+noRBIN3NQA8MtSU2j+16Fa1gWipzBEAvM1qWPU0QUdRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651956; c=relaxed/simple;
	bh=0YqQheoEv4fhDHyZL6pWNvim/d6YrHWomZjG/2lIV8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RH5qP/ftGwdrYdj08mHCeucDKo+4EyuIs1N6Q1p7IbbNUrdbslU9BPsZJ4zycDI91ze1XdGEUJ5/bsjZ3FM7Uw91ZjOsNVz9zhIAUTbU2i2369hpWjG7VBuCmnrKVX0/1d2CLemHavbTcY2b17bpQH2wlU71DZiP+yC+uRG57lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8T1iO1Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8T1iO1Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECE11F000FF;
	Thu, 17 Sep 2026 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789651952;
	bh=D3y+mL066qyenVPDUTBqNgSQmzgMNebSmMJuV0w49bM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c8T1iO1ZYdeCoYvB+/hmtnOUR4ZzETloaIRtsPYDuAbfl5sFoK9JTYwvYV/LGFpsU
	 IiIYVVc3g+QirEU8lC35vDWap6G90Lk5L3oqy0JePzRqKCSr0+2SXB5vwxi0u6Gu9Y
	 CcXuQkCEzMitV0iINgkyzcLhAkwIbQSeDAeN7PAgz001NrfrVLSH6EvODk79bgt9SB
	 A+gjE/HiU9nHRDTKP3agRrpv49zcytQzg/xGLHDkZElVlmC9aOAgHJZrzrZeoOMyIX
	 D1dYfpP05ESvDA++D4WwqrsmuODM/ZWDgbZqGW+Ntp+9/XjfeTvATIp6TE1/ZbuIuj
	 /TVQ3awGkVIdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/12] arm64: dts: qcom: x1e80100-t14s: Add on
 ov02c10 RGB sensor on CSIPHY4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-8-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
 <20260917-x1e-camss-csi2-phy-dtsi-v7-8-1a63eb35838b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:32:31 +0000
Message-Id: <20260917133231.DECE11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: build failure due to missing header and undefined macro
--

commit 4cfc348110b5eaeda5c161537a2fb18ff033019d
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on CSIPHY4

Switch on the ov02c10 RGB sensor on CSIPHY4.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index d2eaabf917f11..f8b0f9fc0a6f0 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -9,6 +9,8 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>

[Severity: Low]
Does this include a header that does not exist in the source tree? Including
dt-bindings/media/video-interface-devices.h will cause the C preprocessor to
fail during compilation.

[ ... ]

> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible =3D "ovti,ov02c10";
> +		reg =3D <0x36>;
> +
> +		reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&cam_rgb_default>;
> +
> +		clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +
> +		orientation =3D <MEDIA_ORIENTATION_FRONT>;

[Severity: Low]
Does camera@36 use an undefined macro here? MEDIA_ORIENTATION_FRONT does not
appear to be defined, which will lead to a syntax error from DTC when
building the device tree.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-x1e-camss-=
csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org?part=3D8
