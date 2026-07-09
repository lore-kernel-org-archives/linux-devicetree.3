Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956937FF62
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610981; cv=none; b=AyRZsM7Vp3mQm0GrG0tUE1ERUwH/ZR6aJH6HXIUkeecgNuBv6/25BYn7c5ynCYnIfPiNSU+S19G4cM8X/qrc43j9nKp3oeraP681WHc4gKzohWztE/rQjUzEkWLamnJTwRRbJ+nFaIpNP2jgtxWVLY/fWo5AjKYIWThpuHBCwbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610981; c=relaxed/simple;
	bh=9/+75KADrqP0sgU5/oKWrJUW6NfedParDlIGsgTxTIQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LaFiidDgWxHVCX3NQ7PFZmPStO3JGna0mfU3C2KYwRpVia53UoamM+C4zuox8QVn3DtHOzXKJ8UWJfZcEEPovdk/40/mJYCjVnbfQdsXBRxb4lxYdPuLeWg0k4DElPsHaunZW+KH81f91YFrljQOci2oibrYWXQN89l4wibAgrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPhL5eDp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPhL5eDp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CCA1F000E9;
	Thu,  9 Jul 2026 15:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783610979;
	bh=jaz6pFNQhIk1dLBvQubcm95dYroaqBrlowtl/GXx/fI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dPhL5eDpnjkymGphAfrxLLQAZ7+U2vDsF+3Wz4oAQgxXzKifSM7VRFHHRhUSqxflD
	 abU1snfUIXSDzzatwLQ95EfHvo3T24hg7u3JFMXZzaT/oIi1bgwIK91DFY8E3VJ8mD
	 ZbeHhaTbFovm4MpgUB6/ryshyTg3zms01RMH03BrN7DNJ5T1uenLBG+ztm5c03ywlZ
	 WGQtTYklbDIJ0p9Lo100x22rnv7R67nNTdrZrIfG8M/rSs3xcvm+DDIOa6pETudYtE
	 Jqd2pmDQf1/BOxFchqSIUT0DkCHGHUGVBdg/smNiJ3XRCfhH1XAhPGe/sjGsNzE+0A
	 3OtjZzOqkCcag==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 11/11] arm64: dts: qcom: sm8650: Move Iris IOMMUs to
 child nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-11-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-11-72bb62cb2dfd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 15:29:38 +0000
Message-Id: <20260709152938.B4CCA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using `iommu-addresses` without a `reg` property inside the `reser=
ved-memory` node creates an `IOMMU_RESV_RESERVED` region. This explicitly e=
xcludes the 0-600MB IOVA range from being allocated, which completely contr=
adicts the patch's stated intention to limit allocations to this range.
--

--- Patch [11]: [RFC PATCH 11/11] arm64: dts: qcom: sm8650: Move Iris IOMMU=
s to child nodes ---
commit c2708742df23b3eb0cc33ed47303581c81143971
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Move Iris IOMMUs to child nodes

This patch separates the Iris VPU streams into pixel and non-pixel child
nodes to enforce different IOVA constraints. It attempts to limit the=20
non-pixel stream to the 0-600 MB IOVA range by adding a reserved IOVA=20
range node.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 447b788fcbb96..f9c03de1317f1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -1849,6 +1849,10 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>  			reg =3D <0 0xff800000 0 0x600000>;
>  			no-map;
>  		};
> +
> +		iris_resv: reservation-iris {
> +			iommu-addresses =3D <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
> +		};

[Severity: High]
Does using iommu-addresses without a reg property in this reserved-memory=20
node actually block the 0-600MB range instead of allowing allocations=20
within it?

When the non-pixel device is initialized, iommu_dma_init_domain() calls
of_iommu_get_resv_regions(). Because iris_resv lacks a reg property,
this function returns an IOMMU_RESV_RESERVED region for 0-600MB. The=20
generic IOMMU layer then calls reserve_iova(), inserting this range into
the rbtree as occupied.

If the 0-600MB range is reserved as blocked, will dma_alloc_attrs() for
the non-pixel stream skip this region entirely and return IOVAs strictly
above 600MB?

This appears to contradict the stated intention of limiting allocations=20
to the 0-600MB range, which could guarantee the very device crash the=20
patch aims to fix.

[ ... ]

> @@ -5231,6 +5235,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ON=
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
>  			iris_opp_table: opp-table {
>  				compatible =3D "operating-points-v2";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-vpu_iommu_=
iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com?part=3D11
