Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCA14611CA
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093213; cv=none; b=o5KMLgwxsbxoohMwmIkXnGlWBM3ClIzlOywZyJZ27XNIY8Cj0Ntiid+/PaolGC/+BEVFIGMvbdtduGa/+2FEZTtMAkMrBoExzQ1UNdz0/mb0+8bfvf8YL4TKgnZDcF5h2uJGNSJGqnIoE9ypnm8/cYw/4SdGhUVIRnQHRnWVkK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093213; c=relaxed/simple;
	bh=gQXziHF5nDnl2aG5ra2kWclPVmIPNQ4MoJzyrIafM6M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pKamdMOMe9s1XpRApnfD1x40sKJXxfTINiX9anz5u+UPtZ+K0FZr7BFTz33ptzLBn6wjNXYiqJ3dPM7bpDNRTS2AirXMzSaMqp8s6UjxoWQs7wNUYfJQgIBDCeMAUI1MobgUdvO80TvxOktWph2X96dOqoOzih28+BhIgFF3WqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjKwhCXK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjKwhCXK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9B41F000E9;
	Fri,  7 Aug 2026 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786093211;
	bh=4RMzhpWNnO5q24l9cjN2dDWmRfyXrA1SSupkivmDxPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YjKwhCXKG21vgZW7x6Ol4AyYS3f2kE5vGYj8Th8967jsY3mRDLPoPAg23TSYxtk+l
	 rgZhd7UVituTCm0stCqRCDTAc8oKoMZNnPjbVV5w1IlESf3f0ohuPxvLgJgXifPd8N
	 wYIiUJOJUI66EcpFVe6PSM55/dz9ZUTKc+58W3z/xyO13UQVTazpSy3ryWLnvrIctB
	 xzMg/MaWEM23qxk7GTPGzoY4kQSD5QvGOFXZFUtIgRqmt+Kl9sdtAc9snggRb2jYx8
	 9Rq3wqi+qef3YvDWFnmJ+O7PnC2OHsJEx5O+7KG0QKsioLg6niPDCWKMz1UOZ2lMRm
	 zc+e0LG/IXSHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/22] arm64: dts: qcom: sdm630: Reserve low IOVA range
 for Venus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-18-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-18-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 09:00:10 +0000
Message-Id: <20260807090011.3A9B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Severe parsing flaws in `of_iommu_get_resv_regions()` lead to pars=
er desynchronization, out-of-bounds reads, and a NULL pointer dereference w=
hen processing the `iommu-addresses` device tree property.
--

--- Patch [18]: [PATCH 18/22] arm64: dts: qcom: sdm630: Reserve low IOVA ra=
nge for Venus ---
commit c911f79533bbf9fd3f531d014c6333ee5871bf3d
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sdm630: Reserve low IOVA range for Venus

This commit reserves IOVA addresses below 0x25800000 for the Venus VPU to
prevent unhandled SMMU page faults. It adds a reserved-memory IOVA
reservation node and references it from the venus node.

> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/q=
com/sdm630.dtsi
> index a41ba0da380bb..a80ae33f2c45c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
[ ... ]
> @@ -518,6 +518,17 @@ mdata_mem: mpss-metadata {
>  			size =3D <0x0 0x4000>;
>  			no-map;
>  		};
> +
> +		/*
> +		 * The Venus VPU reserves IOVA below 0x25800000 (600MB),
> +		 * primarily for non-pixel buffers using different Stream IDs.
> +		 * DMA into that range triggers unhandled SMMU faults and
> +		 * spontaneous reboots, so reserve it to keep IOMMU
> +		 * allocations above this boundary.
> +		 */
> +		venus_iova: venus-iova {
> +			iommu-addresses =3D <&venus 0x0 0x25800000>;
> +		};
[Severity: High]
This is a pre-existing issue, but could this iommu-addresses property
trigger parsing flaws in of_iommu_get_resv_regions()?

Looking at drivers/iommu/of_iommu.c:of_iommu_get_resv_regions():

	while (maps < end) {
		struct device_node *np;
		u32 phandle;

		phandle =3D be32_to_cpup(maps++);
		np =3D of_find_node_by_phandle(phandle);

		if (np =3D=3D dev->of_node) {

If np !=3D dev->of_node, the loop fails to advance maps by the number
of address and size cells for the current phandle. This causes a parser
desynchronization on the next iteration.

Additionally, a few lines later:

		maps =3D of_translate_dma_region(np, maps, &iova, &length);
		if (length =3D=3D 0) {

The unchecked NULL return from of_translate_dma_region() is assigned
directly to maps. The uninitialized length stack variable is then checked
instead of verifying the pointer.

If of_translate_dma_region() fails and returns NULL, it can lead to a
subsequent NULL pointer dereference in the next loop iteration.

>  	};
> =20
>  	smem: smem {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D18
