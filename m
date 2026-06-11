Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713531D730
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154767; cv=none; b=AIp37vB3wtf/BanAbj4o7DbklZDxdfW2D7W/BDaivSzxtV2TYUJ84WWM8SeMOy1P+ndqDq2EAML6exJMKBzFTQccKT6e21YOySce3uHnnmA7oAdAubBYC5JTbVJJPhsU3HUkXFtUKn9sWZcDukpG+2TV/1JYdv5+p5B4nNAD9LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154767; c=relaxed/simple;
	bh=Vr6LPuxSnkGt/Hb14NMi3sF0wgmeo8pzq+aGpN+BmjM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e34VXGCvOkEHJOFWTcuiiNRYUnhnGx0aDxQDqOe07oKf6664TDjMV9U4U8vbFctkW/Bv3FzHXoY6ZU1VBZELzCXVCn+nj3RQ7IW/Plzf6XTW9k0UdViKew667Jp5Vh1Hkxw7wTryI6pBZAHl9l/2pvs7Eia4lt8i5FO5DBPIYDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFJ+J+4p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFJ+J+4p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACBE1F00893;
	Thu, 11 Jun 2026 05:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781154759;
	bh=iCm4psJwp8ZlHu2alJxagJXlqcHpX4jDQWSUrxTkdE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZFJ+J+4ptlW6AUNeTUB8LK0cBX4gOOp0lco8e9ULXqApkgliITcY3nDy/HhADG3x7
	 H4bbaHHPLoXu5xnxjS7uTZiKe8+1EbiZ7mOZCIRAEo/k2u8H/DfcheL7Y3OAqr8M3I
	 OZtmZ2iTf8WGIU3jHii7LkfqQ8yB1gYVu1I1cSXgwXgYyZuAJEBYB+mPh/NvwNQJHH
	 pKtdmYpTu63u3oeJCP36PxVODeDdMPLzANnpoV6osu0X4yJwgWvkwcNfmilJkCC157
	 45zK4N6eNMszBNVcDpEA7L+2NuvoMnDWFnZH8+MjJ4QLLCK9Pz40R1zJTewd5lULlp
	 Mau14sQBavPzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 20/37] arm64: dts: qcom: msm8998: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260611-wake-v2-20-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-20-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:12:38 +0000
Message-Id: <20260611051239.3ACBE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch completely drops `phy-names` instead of moving it to the =
root port node as claimed by the commit message.
--

commit ed76b5fde29c9cdbab990c6d9d7c1352cdfa8910
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs to root port node

This commit updates the device tree for MSM8998 by shifting the PCIe phy
and perst GPIO properties from the root complex controller node to the
root port child node. It also renames perst-gpios to reset-gpios to
align with the root port binding schema.

> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/=
qcom/msm8998.dtsi
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi

[ ... ]

> @@ -928,8 +928,6 @@ pcie0: pcie@1c00000 {
>  			#address-cells =3D <3>;
>  			#size-cells =3D <2>;
>  			num-lanes =3D <1>;
> -			phys =3D <&pcie_phy>;
> -			phy-names =3D "pciephy";
>  			status =3D "disabled";

[ ... ]

> @@ -969,9 +967,8 @@ pcie0: pcie@1c00000 {
> =20
>  			power-domains =3D <&gcc PCIE_0_GDSC>;
>  			iommu-map =3D <0x100 &anoc1_smmu 0x1480 1>;
> -			perst-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;
> =20
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> @@ -979,6 +976,9 @@ pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				phys =3D <&pcie_phy>;
> +				reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;

[Severity: Low]
The commit message explicitly states: "Move phys, phy-names, and perst-gpios
from the controller to pcie0_port0". However, it looks like phy-names was
dropped from the parent node and not added to this child node as described.

While the kernel driver's root port parsing might ignore the phy-names
property anyway, does this omission unintentionally violate the behavior
described in the commit message?

>  			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D20
