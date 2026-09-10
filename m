Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2CC3932DB
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048782; cv=none; b=IcLgywC8sPWuec/vItG90+ONIf8lcxAeXZXpzzsWTnh9Ma3nOLzMcQL2cn1dMT4pWBsgLQb+jInmM2LHvmY8am2mkWVJ+zO/aZxQvTmSOTV2cT+1UwtgIFhrMNBZ+V7Y/l0inIbRxAHIRD3lX/6sYiJRu0tb4E0HMolWREmDw/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048782; c=relaxed/simple;
	bh=88VGpwxBwRBSjy1IQSXfD6IrhaM68K9MMuP86kuoGko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kZZsPaAo05hI8b1rsu1db2ATJ0/FyB7gcZ4YKyfe0mkhUBGr+zFZpftTzht5LDOxdJAOK74I0aWwQ9jw3TRD423wFegFEhczYAL3jqgCsw/ILpEY0IsUTZdBcBxALfFbI1NR87MscwlzdINqL10oeniu8aicsfCHwhlt/DfpLww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oslIMo5s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oslIMo5s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD2D1F000FF;
	Thu, 10 Sep 2026 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048781;
	bh=tRwWceYyXJHcwqh4Ank4Ei+WXyk15h2YkZBdmNKcyiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oslIMo5sEb+0FxWV+blwJFRLSL55rDRhBdrR8ict64A3+Su0MBMWDFpsB3G3zcnqE
	 m4Tov4GtwALQGqkK47xqH94cZv6UmmYeK6Z2kekeXZDBKLVTqxXmck25HI3RyGpn47
	 OYtAuWvNncwI3y8ROr5MFxpX/W0zHhM4XLMKKNBnpK06+AkusscK+dyqtVocJhFLZo
	 PJCAwBX50TJH0hQ9hNYHqGSUb4bsf1OtbMVld1QTNA99ODQlcX1RXd2L1IZRmnxBHP
	 ryjJNyHTjPjjZgrK1als17qloAkpJlXYQSog7R2ldozIgIDOO4eueoATqJXuHA+vIe
	 e9mE5wBAEz8cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 31/34] arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs
 to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-root_port-v1-31-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-31-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:59:40 +0000
Message-Id: <20260910135941.3AD2D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Removing `phys` and `phy-names` from the Root Complex node break=
s backwards compatibility with older kernels.
- [Low] Duplicate `&pcie1_port0` node definition in `sm8650-ayaneo-pocket-s=
2.dts`.
--

commit 833589d45fdeff1baf13bf57dca340bf7b4c39dc
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to root port node

This commit moves the PCIe phy references and the perst/wake GPIO properties
from the RC controller node to the root port node. It also renames the
perst-gpios property to reset-gpios.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/=
arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 668c183bc1777..9fb53fd8c3f5e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts

[ ... ]

> @@ -1108,15 +1108,17 @@ &pcie0_phy {
>  };
> =20
>  &pcie1 {
> -	wake-gpios =3D <&tlmm 99 GPIO_ACTIVE_LOW>;
> -	perst-gpios =3D <&tlmm 97 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 =3D <&pcie1_default_state>;
>  	pinctrl-names =3D "default";
> =20
>  	status =3D "okay";
>  };
> =20
> +&pcie1_port0 {
> +	reset-gpios =3D <&tlmm 97 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 99 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcie1_port0 {
>  	/* Renesas =CE=BCPD720201 PCIe USB3.0 HOST CONTROLLER */
>  	usb-controller@0 {

[Severity: Low]
Does this unintentionally duplicate the &pcie1_port0 node definition in
sm8650-ayaneo-pocket-s2.dts?

Since there is already a &pcie1_port0 block directly below it, could these
reset-gpios and wake-gpios properties be placed into that existing block
instead to improve readability?

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index b679fd8afb7d5..39ecf4686c4b8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi

[ ... ]

> @@ -3700,9 +3700,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			num-lanes =3D <2>;
>  			bus-range =3D <0 0xff>;
> =20
> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
> -
>  			#address-cells =3D <3>;
>  			#size-cells =3D <2>;
>  			ranges =3D <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,

[Severity: Medium]
Will removing the phys and phy-names properties from the pcie0 Root Complex
node break backwards compatibility with older kernels?

Older kernels booting with this updated Device Tree might fail to initialize
the PCIe PHY because they only look for these properties in the parent Root
Complex node, which could lead to a complete loss of PCIe functionality.

[ ... ]

> @@ -3893,9 +3892,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			num-lanes =3D <2>;
>  			bus-range =3D <0 0xff>;
> =20
> -			phys =3D <&pcie1_phy>;
> -			phy-names =3D "pciephy";
> -
>  			dma-coherent;
> =20
>  			#address-cells =3D <3>;

[Severity: Medium]
Is backward compatibility broken for older kernels on the pcie1 Root Complex
node as well by removing these PHY references?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D31
