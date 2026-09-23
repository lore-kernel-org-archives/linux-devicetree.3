Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FA0353A80
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180153; cv=none; b=s8ShTuSk/nevGBxpHieAT59ahIQGL4OMR9QmXBsHH5JgHaKdlVdcx135iefsTV4fC0WN/AXeWK7PDduhHfgQqGMGpXzPLKt89PUA2rsOONzwXYcZY/CHFa+lUwuV46edIorBzHJ8LS/Glj37MDuMFBrsFKRI2QS7Sz5Gu1lKjOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180153; c=relaxed/simple;
	bh=q774RUlMBNKYdq/Ik/CngHpytu7SWD8PogGY3EIJOTA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D/I2mLXrTuuSYxaQTR1SwAZo2wtJNrqUzAsHbZtDwyrAu7bnTAWl2AvLXS0ZKlmrm3t+Lgq3jz9v2U+oYs5B2OpJtTWk9lCckw5tpIX3qYQtj9NIgpEAnXTkhJrx9EXW+e6lhEhwqhGqxar2xAn1K63zgZgNLHSGAubbCQ9W7dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGAHKJ0e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGAHKJ0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986A21F00893;
	Wed, 23 Sep 2026 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790180151;
	bh=kdumpIXMMoUGUFB5Z0XFAMENtI4nHaNSA7YglMw54nE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZGAHKJ0e0htVgycdhcHMrsjYLTOWiynpCNZ44qGQIKjmxE7O8BmmyzfMT3bVwQ7Q/
	 WaHss7AwTvLmNfWyFY4nAHa1mnaNkW6lRNmRmKvgjDnu29W4W/mcvd7/7ynkA1OOqL
	 L4uvpXx4zISY+JfH3zRe9QEgQx/onDRuFOkVQ6vJ2ySBuNe44rnqI/zc7bZ+Pbqx/M
	 4JXKxju1pSqLNTEZYQq8HP2wKYRuG5LX8Epj8i5O7jFwdesj2530JEGEVLvInzOe12
	 T2sfPYgUeev24r6y1dxNr+ApdBHqWHGqDT//IgjAJwtY/r/w5Q4oJ4K4cmXXSPZyKP
	 mu/Zjmw16OypA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 7/9] arm64: dts: qcom: agatti: Add OPE node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260923-camss-isp-ope-v9-7-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
 <20260923-camss-isp-ope-v9-7-86a75dc18b83@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 16:15:51 +0000
Message-Id: <20260923161551.986A21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: overlapping iommu stream IDs artificially merge IOMMU groups
--

commit f837397d169ca6bd9f29b986ea39a8a6e4ab9b26
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: qcom: agatti: Add OPE node

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290).

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85b..69237959adc15 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1984,6 +1984,83 @@ port@1 {
>  			};
>  		};
> =20
> +		isp_ope: isp@5c42000 {
> +			compatible =3D "qcom,qcm2290-camss-ope";

[ ... ]

> +			interconnect-names =3D "config",
> +					     "data";
> +
> +			iommus =3D <&apps_smmu 0x800 0x0>,
> +				 <&apps_smmu 0x820 0x0>,
> +				 <&apps_smmu 0x840 0x0>;

[Severity: Medium]
Does this create a resource conflict with the existing camss node?

The newly added isp_ope node claims stream IDs 0x800, 0x820, and 0x840,
but these IDs are already claimed by the sibling camss node:

camss {
	...
	iommus =3D <&apps_smmu 0x400 0x0>,
		 <&apps_smmu 0x800 0x0>,
		 <&apps_smmu 0x820 0x0>,
		 <&apps_smmu 0x840 0x0>;
	...
}

Because these overlapping stream IDs are unconditionally parsed during boot,
arm_smmu_master_alloc_smes detects the exact SMR overlap and forcefully
places both distinct platform devices into the exact same IOMMU group.

Will this artificially intertwine their DMA domains, break device isolation,
and cause both drivers to map IOVAs into a shared context?

Should the OPE stream IDs be removed from the camss node since OPE is now
split into its own distinct platform device?

> +
> +			operating-points-v2 =3D <&ope_opp_table>;
> +			power-domains =3D <&gcc GCC_CAMSS_TOP_GDSC>,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-camss-isp-=
ope-v9-0-86a75dc18b83@oss.qualcomm.com?part=3D7
