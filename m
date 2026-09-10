Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4FD3BE172
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048499; cv=none; b=UG/9sk/OoCe9O+MN64nLb2DuAbpLmpVaADBzqOBWNEo8znkLVJ6FTUD5yUEbq3Rqji2JHhwJhTT/gBoYd0st/WkprKhoIhqWc6+sJLT7Dt5C+CDYvGie26BPr8SVKP2KYx9e+JoioAY1LslJxnJkP5yFENSOyhDe2/kJvLNNTuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048499; c=relaxed/simple;
	bh=P72gzsqfaTBy63t/hsuAYEZCQP6dXQviR486YDsqS/U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NhgZDsz65bxkUTBxHIOb0CT4LOYR9Pmgh8tzOH+wYFN13HDBiwDRIar/5zPm9VvFv9u4Pj7Lxu4tn+FHD6QDiwec9sdxdAYEBCXtmUkjNM4+Nk29KOoUz1cF4vZgu24o+dS5tZwxqLGyAuLN9BrSlr9bHum+IVy+kRQAxwdZRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgM88VGW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgM88VGW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271BA1F00898;
	Thu, 10 Sep 2026 13:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048498;
	bh=HvCK29U+LGiP9n0zi/7Ahz3Ui3w4UKgBNDzZOXpYR4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bgM88VGWT3ipYbRJdcBmpSRL/2wq8TzeCyrYlBJVjeqvwx8cePS7y6BV0jI6zv/q6
	 +rp46qBEoa1s+1bcXjgqw2vyhyLO9HJ0d/ZUnPQQzvPvLHlNPkrFGDMahnpdo67zP4
	 BZ08XVpVHyUE7o6wZ0O6Snpz+ERsUsXUfksxoIgHIKuLrC1noPMTYP+m7oJuHIXaCk
	 HAfZD56TVvoZTBc2Ik7QJw4jrzctUuNzKqYvPNuZFhS0Dhb9zixbcYZeJbjtRt2JN9
	 kvui0aFpQPfLe2pq2q6uMEPQnl64rlbe4VuD3RSGyRsqS0TvjBaXlB2s4gC6SQIJBG
	 zRxgbkA0vKJsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 29/34] arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs
 to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260910-root_port-v1-29-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-29-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:54:57 +0000
Message-Id: <20260910135458.271BA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Removing `phys` and `perst-gpios` from the root complex node break=
s PCIe on older kernels.
- [Medium] The commit message claims that `phy-names` was moved to the root=
 port node, but it was completely dropped.
--

commit f7da5024671b8a2ed22694b38cd5eab69ebf0cdc
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs to root port node

This commit moves the PCIe phy references and the perst/wake GPIO properties
from the PCIe root complex controller node to the root port node. It also
renames perst-gpios to reset-gpios to match the root port binding context.

> Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0, allowing board-level overrides.

[Severity: Medium]
The commit message claims that phy-names was moved to the root port node, b=
ut
looking at the changes to pcieport0 and pcie1_port0, it appears to have been
completely dropped instead.

While devm_of_phy_get() correctly retrieves the first PHY if no name is
provided, this creates a mismatch between the patch's intent as documented
and the implemented code.=20

Should phy-names be added to the port nodes, or should the commit message be
updated to reflect its removal?

> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> index 7bc5f85e7ebc0..05e852ed7995c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
[ ... ]
> @@ -2017,12 +2017,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> =20
>  			power-domains =3D <&gcc PCIE_0_GDSC>;
> =20
> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
> -
> -			perst-gpios =3D <&tlmm 94 GPIO_ACTIVE_LOW>;
> -			wake-gpios =3D <&tlmm 96 GPIO_ACTIVE_LOW>;
> -

[Severity: High]
Does removing phys and perst-gpios from the root complex node break backward
compatibility for older kernels?

Older kernels booting with this updated device tree might fail to initialize
the PCIe controller if they lack the logic to parse child port nodes and
strictly look for phys and perst-gpios in the root complex node.

Since Device Tree is considered a stable ABI, does this break forward
compatibility (booting a newer DT on an older kernel) by not leaving a
deprecated fallback in the parent node?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D29
