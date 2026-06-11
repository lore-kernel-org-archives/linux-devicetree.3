Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4865328643A
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155448; cv=none; b=jBvkqnNhJXQSHMJA4ln8uo6nRXc+kCTDC8FWtxtuo1E//+e/A6cMpAlj0PICOb5lKecNAaFubQRvwf2f+3OC9UJ6czgVipmhXwMbpGSXlwFmwl0btJ1i7o0FSa2VzWGIMYkyX4dRNB3zcyA+Rg2ISC89/bWaIpgQPn6V6Yif0pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155448; c=relaxed/simple;
	bh=4s5/qHURqqimwDu3eJB3yxDP17SqoH8YKfTkadMc8zQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YMs1VDvl4Xq/Fc1kntl2QeZDKWd3BK/b1EwTYqIgdws+G40WqoZEGCDdMLxwPzrxHgwV3Wt1tP+UBP7eFUibGc/adpzChompWo1G+reWk3TLINSTSMstS6pCCr3ABJP7IPBy18AMgn4DYOt7R2GVuHYR114LqbRfDQBpHrtEWPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQ9EryBe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQ9EryBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B441F00893;
	Thu, 11 Jun 2026 05:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155445;
	bh=1dCdcdBgUcQ28husRXIzY846hk1GhFHhR7sjjKduPu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BQ9EryBesMYEwsOpjH/pzawUTjD8Vv04etShQS7EUp/O03TM0MQMDTkUjoOwZGZGy
	 n6dwtkImKy46Ja1ozteBZYjyB1y8vJI1elPUTGujkXCgCeH5Ve10xaKXmqRA5gsvGQ
	 u4nMYkUn/Jm0q150/Y1sdoL+agEnyjoFT3m2D/+kGb+RQHTyjGJ26kLoP6xFTjMGyy
	 gxasRK+ijdzYmSewBLsfM2orJkX8bMx266bXAx3xogG0aSH6Y6uynRtcGD1xK/kTr2
	 Z9EzSBEdYcOE7dmwar7/pmx3u+hjhB+caDZbTX2L7PGY9HGx+3IRe1jk5H1zizhVUz
	 lOaBlDWg7/nIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 35/37] arm64: dts: qcom: sm8650: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-wake-v2-35-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-35-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:24:04 +0000
Message-Id: <20260611052404.E9B441F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Commit message inaccuracy: `phy-names` is deleted rather than mo=
ved.
- [Low] Duplicate `&pcie1_port0` node override blocks in `sm8650-ayaneo-poc=
ket-s2.dts`.
--

commit b4d125e6d9f71b5d8465461d136dd4a316c95248
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to root port node

This commit moves PCIe PHY references and perst/wake GPIO properties from
the RC controller node to the root port nodes across several sm8650 device
trees. It also renames perst-gpios to reset-gpios to match the bindings.

> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and pcie1_port0, allowing board-level

[Severity: Medium]
The commit message states that both phys and phy-names are moved to the port
nodes. However, looking at the diff for sm8650.dtsi below, the phy-names
property is deleted from the controller but never added to the port node.

Could the commit message be updated to reflect that phy-names is being drop=
ped,
or should phy-names also be added to the port nodes?

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/=
arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 2123312d88f6b..74a286bf76960 100644
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
This isn't a functional bug since the device tree compiler will merge these
blocks, but does this leave two adjacent &pcie1_port0 override blocks?

Would it be better to consolidate the reset-gpios and wake-gpios into the
existing &pcie1_port0 block right below this to keep the tree tidy?

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 1604bc8cff373..fc6fc4d7e39d7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi

[ ... ]

> @@ -3644,9 +3644,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			num-lanes =3D <2>;
>  			bus-range =3D <0 0xff>;
> =20
> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
> -
>  			#address-cells =3D <3>;
>  			#size-cells =3D <2>;
>  			ranges =3D <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
> @@ -3716,6 +3713,8 @@ pcieport0: pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				phys =3D <&pcie0_phy>;
>  			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D35
