Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A2351C2D
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155422; cv=none; b=FORESUmUKLBaw+ZVEkcT22MFr64fIw1KcL9dIH+o9c4H4qekqKUh+GVtHerTgGvbxdqicmBlC1leIr4WjyguQvLNLAAcXAo6XvIUYBUTUWmuLg26s9ooyTfICRmu9Vg4RU2HyQDazSo9qidRoE5wq8KeOt5HnXA+yE/39yGEct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155422; c=relaxed/simple;
	bh=kZqbP+aC1FyBK5ZfrHvrIXhPn2Do2Z3P3HbZxUo4toI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mu+oKI4OGh0IQU2Fzx2QEbykjNirfDG5tfn/znsftiNTacNXh/+KBXGwypPktE5Pup/zt8dUsIRDXBb2WbMGfVUvWiJSETcS+N4QDeftzZcR8R4bnegtMmlKy2MIQJITZA1v6ts8algF+4u/Pc5x6WohWkfJBRShxWPmbM8CvwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASm29qnN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASm29qnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2981F00893;
	Thu, 11 Jun 2026 05:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155419;
	bh=bsmsyPTXRaSjgDlM6uE/rgK0t0HvWjh6mw97ZUY1We8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ASm29qnN9y50FYWIW9rl7Pym65Y6KHBhIIVjKQMB8EtUZ0uXrAcXvkpFH0daijhVL
	 nKuNhPIVAVBKZs6rvyjDpTmjOu7fazSSfWKydONaXfMmGBGYuj8Dyu8C8c54MyUOKQ
	 nFEp/1elccrmKqXWV/dmpx9uXc8YKUpvL4sCnYB03M6A2tjBuH9BVjTGI46egIm23V
	 OZaerzye0HNY1W4gBnf6KVkru4HM46oSeZ9kroQ0A34iVfF7QUS/D5Ct9CiS/RSOwh
	 UpHbVoX3kR2DxvGpaKL6f/rO91t7T6OyKOq4YRw9mC0OVhzWsmRGKjOXH8a8HJfajP
	 GUgEuwV66alxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 32/37] arm64: dts: qcom: sm8450: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-wake-v2-32-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-32-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:23:38 +0000
Message-Id: <20260611052339.0E2981F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to move `phy-names` to the root port n=
ode, but the property is completely removed instead.
--

commit 9d7dd05726a6daa00789e9da0c80d284e0e6db66
Author: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.c=
om>

arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs to root port node

This commit moves the PCIe PHY reference and perst/wake GPIO properties
from the RC controller node to the root port nodes. It also renames
perst-gpios to reset-gpios to match the bindings.

> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0, allowing board-level overrides. Rename perst-gpios to
> reset-gpios to match the binding used in the root port context.

[Severity: Medium]
The commit message states that phy-names is being moved from the controller
to the root port nodes. However, looking at the diff below, the property is
removed from the controller but does not seem to be added to the destination
nodes. Should the commit message be updated to reflect the removal, or was
the property supposed to be added to the root ports?

> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2031,12 +2031,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> =20
>  			power-domains =3D <&gcc PCIE_0_GDSC>;
> =20
> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
> -
> -			perst-gpios =3D <&tlmm 94 GPIO_ACTIVE_LOW>;
> -			wake-gpios =3D <&tlmm 96 GPIO_ACTIVE_LOW>;
> -
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&pcie0_default_state>;
> =20
> @@ -2080,6 +2074,10 @@ pcieport0: pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				phys =3D <&pcie0_phy>;
> +				reset-gpios =3D <&tlmm 94 GPIO_ACTIVE_LOW>;
> +				wake-gpios =3D <&tlmm 96 GPIO_ACTIVE_LOW>;
>  			};
>  		};

[Severity: Medium]
Does pcieport0 need phy-names =3D "pciephy"; added here, as suggested by the
commit message?

[ ... ]

> @@ -2285,6 +2277,10 @@ pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				phys =3D <&pcie1_phy>;
> +				reset-gpios =3D <&tlmm 97 GPIO_ACTIVE_LOW>;
> +				wake-gpios =3D <&tlmm 99 GPIO_ACTIVE_LOW>;
>  			};
>  		};

[Severity: Medium]
Similarly, should phy-names be added here to pcie1_port0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D32
