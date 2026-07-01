Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D1238D
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 20:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939598; cv=none; b=VCKNkUavxPYWMP2eMlJ1+nTHQQobSS8GcnvbrSF/sTOS2btOxWG5X3mStDk+gtq0DAq7sGskA2GQefOCBQ+6WBGngexjxpw4B+fY9FV75yImFsCe/yCFT4BVthYu8CNisVmNMB04V1IBsQwAgI/sss55DAetfRjTDyVl8/n3bPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939598; c=relaxed/simple;
	bh=FHHiQssL3tQC722lOqnrqxOi/4/l2ElscF07dCkNt1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QlPqjROsrglmbJDIBcpDhDiWYw+wD5VOEKdzDtvhyF80VamHVLFu5ePWpyBm6UIiFIjT8ryrQwDHyRSOwk06Ap6cjCcoBk+BvwQTB7sB0Ddh++2NVTptVYzL/tgzK3cERf51umpo+whPK+vj+fdk5cU19T4j05NvwsLniu2FUkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTb/xXVr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTb/xXVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE121F000E9;
	Wed,  1 Jul 2026 20:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782939597;
	bh=bkKUvCtM0kKvV4ZEaYFCMgMq8+ov6kQny5Xhp2bmuC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CTb/xXVrHaxJO+tBr/YcMgPIObq4u5EZh+r9kFGOEmW1AcbEha9y1lYW/Nl0zP0s2
	 Z8BTJ9YkVUN0ubxWlDPNzXc+WEhr8fn5/gMT0LnB0N8VG7tSk7gU4tZvT1SlIF2SMM
	 zubCxJgyZ5TI7uFdJFGAUexyHRPMaoPduH3QYRiNnUc1EZA4l6fHcOLmU40YGM2HD1
	 Jf6fqJyFeBXkZ9YXumoStedrgLHw0b5m6Pw1QfiSE+wqpt/fiG7SdsuSsHVZv3hNRq
	 lt9bHBlqX0m/V3dtodSa37EDz+9UoZqHGOIylwuMPGGgpRHAnU78rpxYA0xxAF7im8
	 qeC8ZPwpP5/qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Cozzolino" <cristian_ci@protonmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260701-rimob-new-features-v6-1-be7d5d1e007f@protonmail.com>
References: <20260701-rimob-new-features-v6-0-be7d5d1e007f@protonmail.com>
 <20260701-rimob-new-features-v6-1-be7d5d1e007f@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 20:59:56 +0000
Message-Id: <20260701205956.EDE121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The panel's compatible property is missing the mandatory generic fa=
llback string.
--

commit 14ab3e4951175e1cf33309cf294f421f36606cd0
Author: Cristian Cozzolino <cristian_ci@protonmail.com>

arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
   =20
This commit adds the description for the display panel found on the phone.
It also enables the GPU and sets the zap shader firmware path.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/a=
rm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> index ef4faf7631327..5a9d71d1e4664 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
[ ... ]
> @@ -87,11 +94,70 @@ &hsusb_phy {
>  	status =3D "okay";
>  };
> =20
[ ... ]
> +&mdss_dsi0 {
> +	vdda-supply =3D <&pm8953_s3>;
> +	vddio-supply =3D <&pm8953_l6>;
> +
> +	status =3D "okay";
> +
> +	panel: panel@0 {
> +		compatible =3D "flipkart,rimob-panel-nt35532-cs";

[Severity: Low]
Is the generic fallback string missing from this compatible property?

The DT schema for this panel (novatek,nt35532.yaml) strictly requires two i=
tems
for the compatible property: the device-specific string and the generic fal=
lback
"novatek,nt35532". Providing only the device-specific string violates the
binding and will trigger a dtbs_check warning.

> +		reg =3D <0>;
> +
> +		backlight =3D <&pmi8950_wled>;
> +		reset-gpios =3D <&tlmm 61 GPIO_ACTIVE_LOW>;
> +		avdd-supply =3D <&lab>;
> +		avee-supply =3D <&ibb>;
> +		vci-supply =3D <&pm8953_l17>;
> +		vddi-supply =3D <&pm8953_l6>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-rimob-new-=
features-v6-0-be7d5d1e007f@protonmail.com?part=3D1
