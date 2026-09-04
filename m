Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3671D38B7B0
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519586; cv=none; b=lQMmpnePZ/qWGIvURuXxt5EeqHa7o+aKyfLN0rwMV0QUOeks4U3pMGMkmKRjs5KhG1t5Zwdr9k7/uCrGK7DqGPLBVq/5JWO66HIPJOke0ra4xlRmvvyDygJyxavNFXYhuy8Dg7vn6o4srSR6JlcbHU5XmIUonJONof0Oz5KNsjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519586; c=relaxed/simple;
	bh=sZKqxlh6sWTOUq2EVTXZ58RUJuupgjcg9oWkAYnK92U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h2r0gUKjH4/mPosqYV0/TvzDIxwIEI3YasUtJAojG5pXXwUnh4qCIUZKZ7nHfjoAs4tH/VYoCX8YlV3mFwKPk7yQPAzmkPsqf4YoNRf9plhvF3KjQI5VFp4IzNNDq7LzVjqr0XHruoKebvhpnlR+KPs8w3DAbhhc7EqtZ89GurM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSr8tBZc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSr8tBZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958E21F00A3D;
	Fri,  4 Sep 2026 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788519584;
	bh=wUz+qoi/D9j+j8G/uqMv6UXKIensxrE8A0WUrZuvxQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YSr8tBZcNnWrbfM68PQ83fTkn8pDKFjpP0GShicTKAu0YKndA7ZnA9Lhui0EJx3yA
	 2GNFxmrlpr0YPJoXS1Ni8SX4/73RfIammcN5IJK1dtlw6Si/Ro5tYmkiFa2aWuUQXE
	 lqNo6OgsX4lMNpo96pMAHNPIAbpVPjSo7KEeTUThRuBoa9wqwUxlnIxeR5sU55EpRC
	 YTNDOLuBCFKNF6vxwcH5xkJLeWsZ31UtYxAd001nt4rlJYcGh+bVg7tkDOYE7hrOuO
	 UHK+4vE9mUisUIWwTCPQJ71xrDXKlwy87oqw9GC8K1vIDDRRsHMLGYLVL5zcz+1FN4
	 PdtMjkfA/fCVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-rubikpi-next-20260605-v3-6-f49146d85af3@thundersoft.com>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
 <20260904-rubikpi-next-20260605-v3-6-f49146d85af3@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 10:59:44 +0000
Message-Id: <20260904105944.958E21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undefined pinctrl labels used in the sound node cause device tree c=
ompilation failure.
--

commit d72f2352a4f5bf62c0a3db9c3ccca60e51c060c1
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>

arm64: dts: qcom: qcs6490-rubikpi3: Add audio support

This commit adds audio support for the RubikPi 3 using the AudioReach
firmware path. It describes the ES8316 supplies, MCLK, jack detection,
audio routing, and adds the primary and quaternary MI2S links.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/=
arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> index 13e8e62f6205a..0322658337ea0 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts

[ ... ]

> @@ -1014,6 +1084,69 @@ &sdhc_2 {
>  	status =3D "okay";
>  };
> =20
> +&sound {
> +	compatible =3D "thundercomm,qcs6490-rubikpi3-sndcard";
> +	model =3D "QCS6490-Thundercomm-RubikPi3";
> +
> +	pinctrl-0 =3D <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>,
> +		    <&mi2s0_sclk>, <&mi2s0_ws>,

[Severity: Low]
Will this device tree compile successfully when using make dtbs?=20

The primary MI2S pinctrl labels (&mi2s0_data0, &mi2s0_data1, &mi2s0_mclk,
&mi2s0_sclk, and &mi2s0_ws) referenced in the sound node do not appear to be
defined in this file or its included .dtsi files. Referencing an undefined
label usually causes the Device Tree Compiler to abort with a fatal=20
"Reference to non-existent node or label" error.

> +		    <&lpass_qua_mi2s_sclk>, <&lpass_qua_mi2s_ws>,
> +		    <&lpass_qua_mi2s_data>;
> +	pinctrl-names =3D "default";
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-rubikpi-ne=
xt-20260605-v3-0-f49146d85af3@thundersoft.com?part=3D6
