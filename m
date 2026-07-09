Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDF8386C16
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606235; cv=none; b=SqEfn6otxUzC/0wB9mcP9YGKzro4ko9IyarWRzgzAX1f8GGzbaPi934xD8ZbfuyRwCNgS4pHQXQO/j9z/6HBBbrTT/xaAxqM0jjzpAh8CoNLao4cV7saWIScN1Tdnt3t1SMhdquwwAO0uptWZuHLmm7kuR2/rC+BqtXfjstlG28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606235; c=relaxed/simple;
	bh=Wvh1iArySMyStTZbeqGmIwPlMpPSlRPuUwsa0Lqe0iU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yx8ROQh+g93SId0ioWATF92P1uRkEiqr6fryX9helTKQpAkiV5h7iRCgwaxMvJ0IHfnY2u+o7FCgw2F0JsAcQB3CtWPbXsAyzzNC4+YqzB0ilN0M4Z+oHJKnKLw50JzfsrgxG1Ml/RxNf9EqPpEFweJ3DU1dvs4fUT8jiSMCUU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1JTFsvL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1JTFsvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E201F000E9;
	Thu,  9 Jul 2026 14:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783606234;
	bh=UNjtRnTH0PCMwRKfghQZ3zWxNEiqR8zJyBxk+2zxlyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G1JTFsvLscL8GbLnc/PBb+k+FdLNtkGx8xyADqtDDPDB9+ughRxi+zcJT7QCXI42m
	 EB5x7NYi94PLKLvhkQWKc4BQ08ozrJuLjMip8B6Y4yoWhhMj9XGHMTxT78+I+++hSQ
	 Scw0vw3qim35royObeZILttiMCfQSJ08jaZrL5TEx62xN5Kh1HKXDiEQzWoF8b7gg9
	 eh8vnzC3gTTUbQKRJwNwJUQjCubx4k52OZFYljAUW69PfkBdOVKIfzvtkQT4J85W2J
	 MoVxdD0Kzn5TA8bq+tl+Dl3AjNxPal1m6IuFzJIB3N+g0OAHNg/UHdpnjwfWqYqOBg
	 z7udzNVKZvDqg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:10:33 +0000
Message-Id: <20260709141034.15E201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `iommu-addresses` property is incorrectly used to limit the no=
n-pixel stream's IOVA space. Instead of restricting allocations to the 0-60=
0 MB range, it marks the range as an IOMMU reservation (`IOMMU_RESV_RESERVE=
D`), which forces the allocator to skip it and allocate IOVAs above 600 MB,=
 directly violating hardware constraints.
--

--- Patch [7]: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs =
to sub nodes ---
commit 96b940efc5fae7db37d762be78144fc901472a7b
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Move Iris IOMMUs to sub nodes

This commit splits the Iris VPU into non-pixel and pixel sub-nodes to
describe separate IOVA constraints. It uses a reserved memory region with
iommu-addresses to attempt limiting the non-pixel stream to the 0-600 MB
range.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
>  			hwlocks =3D <&tcsr_mutex 3>;
>  			no-map;
>  		};
> +
> +		iris_resv: reservation-iris {
> +			iommu-addresses =3D <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
> +		};

[Severity: High]
Does this iommu-addresses property actually restrict allocations to the
0-600 MB range, or does it do the exact opposite?

Because this reservation node lacks a physical reg property,
of_iommu_get_resv_regions() parses it as an IOMMU_RESV_RESERVED region.
When iova_reserve_iommu_regions() processes this, it permanently blocks
the 0-600 MB range from the device's IOVA allocator.

Could this force the allocator to fall back to IOVAs above 600 MB (or
fail entirely), directly violating the hardware constraint and leading to
the device crashes mentioned in the commit message?

>  	};
> =20
[ ... ]
> @@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ON=
LY>,
>  			 */
>  			status =3D "disabled";
> =20
> +			iris_non_pixel: non-pixel {
> +				iommus =3D <&apps_smmu 0x1940 0x0>;
> +				memory-region =3D <&iris_resv>;
> +			};
> +
> +			iris_pixel: pixel {
> +				iommus =3D <&apps_smmu 0x1947 0x0>;
> +			};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-vpu_iommu_=
iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com?part=3D7
