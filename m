Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1317029A31C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155582; cv=none; b=LvpMzpO0M9r8Pv5GB6xn1tTt11yQR5OWIz7DXZ9m7/a2pNuaM7gN7z46wsfFOztuy0w3Ij+ILmQrr/KdYFhak6zPQoyzkzUG3x2voPlTWJ53p2Iq+1ZPXP/BsXawtbASNruDy+ctbjR4RWReRfXiBFTHzIO2iwME7thx+Um5KNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155582; c=relaxed/simple;
	bh=d4iqofAoF+zlLlLjNPDUGeu7eIMsRZihxHGLQYSOUEw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p+0oY4WdoDHm84LPdeeeonJEeYVGOZ4HYWcyq9i1vs8PZykA2gdxOguf3Lt4NxZwq81GDs+7EyhTMxixPOVOYnNqPI9KWfO9PYMoOJyl7Gxy4drMxwZqPSV6hFkJeVRrm/p3OWIAQZWwwFO2eZr7TuLHgjjPASFza8VLkDLtN+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9KgyaQi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9KgyaQi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129E71F00893;
	Thu, 11 Jun 2026 05:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155575;
	bh=4MR5mNkpzLD8nj+p/5T7g+2OGSiJylGx0CMTB1C57Ac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S9KgyaQiE90g/bqGgkkbAuO4EVpZ0NyiAxkQcoz+sNqs45M3qHRgrFgHAdLGM2Mnp
	 whti0ID4w3mdUW2D8yk+x4yANyk422nELozNFbJBHaYLWiKpvxaK4deAW6Bxu9m2Iv
	 2kT4B0gw0ygyQiVxzgnu7B5k62xevwUG2YnZE2CsreBKJPLUoPiiFH2S0s0UyCvzME
	 /71JtziFXED3b9X7qzCcKb96lV9Ga842aXaa0WFB+3GbZD/vvKneSFhtFdaB1qyODa
	 Hi+98Lbpg2AlEAkjVYCE1+ZDO+5b23ZUTux0SWRhvu15zeNIePPHfB9urlRyDhfCtl
	 LgvWQdP46caVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 36/37] arm64: dts: qcom: kodiak: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-wake-v2-36-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-36-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:26:14 +0000
Message-Id: <20260611052615.129E71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Accidental reversion of PCIe wake GPIO polarity and undocumented=
 property addition during relocation.
--

commit cfdfc7bf6f1000a6c06f30a3d29926ca3f427856
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Move PCIe phy and GPIOs to root port node

This commit moves PCIe phy references and the perst/wake GPIO properties
from the PCIe RC controller nodes to the root port nodes across several
Qualcomm devicetrees, renaming perst-gpios to reset-gpios.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch=
/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
> index b1ad1d7c346a2..92023aac967d7 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts

[ ... ]

> @@ -562,8 +564,6 @@ &pcie0_phy {
>  };
> =20
>  &pcie1 {
> -	perst-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 =3D <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
>  	pinctrl-names =3D "default";
> =20
> @@ -572,6 +572,11 @@ &pcie1 {
>  	status =3D "okay";
>  };
> =20
> +&pcie1_port0 {
> +	reset-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Was this new wake-gpios property intended here? The original pcie1 node did
not define wake-gpios before the relocation.

> +};
> +
>  &pcie1_phy {

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch=
/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index 3a9fbef89aff4..d0639eea398ee 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -522,15 +522,17 @@ &lpass_va_macro {
>  };
> =20
>  &pcie0 {
> -	perst-gpios =3D <&tlmm 87 GPIO_ACTIVE_LOW>;
> -	wake-gpios =3D <&tlmm 89 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 =3D <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
>  	pinctrl-names =3D "default";
> =20
>  	status =3D "okay";
>  };
> =20
> +&pcie0_port {
> +	reset-gpios =3D <&tlmm 87 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 89 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does this accidentally revert the wake-gpios polarity? The removed property
specified GPIO_ACTIVE_LOW, but this new node specifies GPIO_ACTIVE_HIGH.

> +};
> +
>  &pcie0_phy {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D36
