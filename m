Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AAA30EF77
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155282; cv=none; b=GcRur9wB8YcFU1b7/hbv89njTCgX9/Q0mDFDA1BZCM9ffkR0hF4MoD99pmsCgiq0S3bhKPpDs7ik5yJjq88uViA4aYmW1SGe+dZF0lY+se+c4bVg38G5isOW5aGOQFfs76MQMc7BeYkjRHB1qJO/CDgIYlD59I6Q/OLdpSEKiKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155282; c=relaxed/simple;
	bh=8+W4Z0HTHSuv2KTlu1NEnzlaOU3st+PBRbXvMe60TJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ms0dGSMa/9TRG0ZU8SZ8n18+H2C6Xt7ILCaK9R1RgZuQsAFNne35Foa+1vwtfe5/+WIrA+r+NxuDlBRS+paX2qPBfzmDYkgHbSg28IC1V19I0ubkeDN2VjvQc60ThdRIWRRCkND1kUecgFdh65YXInITAE0CgFrIYlWFsE4FesM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fus50fFj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fus50fFj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1D61F00893;
	Thu, 11 Jun 2026 05:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155279;
	bh=nKtD9DiEOT8zXaat5vGq8DkXp8TcPhOAqFEHat9rV44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fus50fFjFo/zw8D7kSHNqSOju0O21TFN7F60CUcj2H19qZqTpwbvH/5/VFkVBzuJj
	 m5i/UI8wiZict17bwNmQG2taVcj7qHwJ6ue3miWsFKMuH4Nnlq9SProApoofN/REg2
	 ufUmdp8+zBSf0PBAQa5Lys88nFC2N101nOQhobS2Yb0SSd7Hv8VHl6OR3kv9Jxzfbv
	 fpBP90y1JpKYIYNYP6NVdJXNlmqNzpijvrN/w35sT78vYIS1urr7lFxFLrW1YBPkLi
	 gVazXmZvEkXZuFFJ+FZ8W0cak0+2A5LbOs+MaHGQ2WITgvWcl9hyNOVRjQSh1ecCWI
	 HeV/xDqyZ78MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 28/37] arm64: dts: qcom: sdm845: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-wake-v2-28-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-28-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:21:18 +0000
Message-Id: <20260611052119.3F1D61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message explicitly claims to 'Move phys and phy-names=
' to the port node, but the `phy-names` property is entirely dropped from t=
he device tree.
--

commit 40936f38e877a6fb54a0e3819f9826330b1bb090
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to root port node

This commit moves PCIe PHY references and perst/wake GPIO properties from
the RC controller node to the root port node. It also renames perst-gpios
to reset-gpios to match the root port binding context.

> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow

[Severity: Medium]
The commit message explicitly mentions moving phy-names to the port nodes,
but looking at the device tree changes below, this property is completely
dropped. Was the intention to keep phy-names in the port nodes as described
here?

> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index 4ae8627d6dbc3..efaa71a1d13ca 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2394,12 +2394,9 @@ pcie0: pcie@1c00000 {

[ ... ]

> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
> -
>  			status =3D "disabled";
> =20
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {

[ ... ]

>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				phys =3D <&pcie0_phy>;
>  			};

[Severity: Medium]
Is this missing the phy-names =3D "pciephy"; property that was removed from
the controller node above?

[ ... ]

> @@ -2524,12 +2523,9 @@ pcie1: pcie@1c08000 {

[ ... ]

> -			phys =3D <&pcie1_phy>;
> -			phy-names =3D "pciephy";
> -
>  			status =3D "disabled";
> =20
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {

[ ... ]

>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				phys =3D <&pcie1_phy>;
>  			};

[Severity: Medium]
Similarly here, the phy-names property is removed from the controller node
but not added to the pcie1_port0 node as the commit message describes. Does
this node also need the phy-names property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D28
