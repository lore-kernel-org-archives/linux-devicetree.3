Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACC42E8DEA
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092389; cv=none; b=hKZdvSvF5jeZTJs2Qe9bDS9a5+LoDxWdqQjMEONQXuWkGT36TxGGjNiqQufdNH6kh40e00umpz3RoI1y8/8DyiXLr81O92qxqYkW3mI7emCJ+kldy8038wuTyS8ALsU9meo7d/gulhQJbejQmzVLD9YEE2Wt7WMmDTMm6ahr9/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092389; c=relaxed/simple;
	bh=5oKaFciGzTM9Zq1neoKzHP+Fpg/EeQNlD76VgJpU1OQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kGcm6rnYFKTMoDAGgs1lKyha+wL4PG9ORxt3Bm6oyi5ZPUvSrNDUaEi/GCWCQHqCaiyVPqTZgXbn74CAti0BzJooHdhkVBfysH4zBoACO3QVtFG4sF9U20BZ0Hp0Pe5tvOzZVs3Y2eLwtuO0aGoTgShMAMbDn02nZxo8qOfpzwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zd3vMAMf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zd3vMAMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D631F000E9;
	Fri,  7 Aug 2026 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092387;
	bh=uMcBiLD+l5a9Le7pS/sMIqFFKuEozVNb5/UwDAdmjBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zd3vMAMfx2eZZuq+xrwv0nqXCpuO+hpHBKt4jrIm/Via0EV0xmN5payDzWP0/dOnP
	 SmEaSlyTwotJ5ip3XQI0uNpLxa397LivrmLnpfi3XdUZGmPd/PansPqUcKmulSuqUf
	 YtR0Av2tfNYT2EeDgWzF8hqjwAUQTZMXvtage3/2ouH4XAKQdjDp8f+M00Xh/CaVqH
	 1yLvk4KZs7gW2omhP3JUvPC0y+Gns4ilJrIhsuKZPDOh0CdxfXJ+4dBmnKuZ9hObIU
	 wvKM7tN4N7FJLlAQ/e5edA4G/QNN/77O4Yuq4yRDBGda83tVlpb6fLJnvACmpc5fvj
	 9SMOK8sQjzeqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/22] arm64: dts: qcom: sm8550: Reserve low IOVA range
 for Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-9-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-9-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:46:26 +0000
Message-Id: <20260807084627.62D631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Kernel panic via NULL pointer dereference in `of_iommu_get_resv_re=
gions()` if DMA translation fails.
- [High] Incorrect iteration over `iommu-addresses` when a phandle does not=
 match `dev->of_node`, causing parsing misalignment and out-of-bounds reads.
- [Medium] Pre-existing memory leak of `device_node` in `of_iommu_get_resv_=
regions()`.
--

--- Patch [9]: [PATCH 09/22] arm64: dts: qcom: sm8550: Reserve low IOVA ran=
ge for Iris ---
commit b23293d9b1e601df9a40295b28db44388efa63a4
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8550: Reserve low IOVA range for Iris

This commit adds a reserved-memory IOVA reservation node for the Iris VPU to
keep IOMMU allocations above 0x25800000. It prevents SMMU page faults and
device reboots when DMA accesses that range. The new region is referenced
from the Iris node using the iommu-addresses property.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 0e701e709235c..1eb725a584b26 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi

[ ... ]

> @@ -1088,6 +1088,17 @@ hyp_ext_reserved_mem: hyp-ext-reserved-region@ff70=
0000 {
>  			reg =3D <0 0xff700000 0 0x100000>;
>  			no-map;
>  		};
> +
> +		/*
> +		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
> +		 * primarily for non-pixel buffers using different Stream IDs.
> +		 * DMA into that range triggers unhandled SMMU faults and
> +		 * spontaneous reboots, so reserve it to keep IOMMU
> +		 * allocations above this boundary.
> +		 */
> +		iris_iova: iris-iova {
> +			iommu-addresses =3D <&iris 0x0 0x0 0x0 0x25800000>;
> +		};

[Severity: High]
This is a pre-existing issue, but could introducing this iommu-addresses
property expose a panic in the device tree parsing logic?

In drivers/iommu/of_iommu.c:of_iommu_get_resv_regions(), if the DMA region
translation fails, the maps pointer is overwritten with a NULL pointer and
length is left uninitialized:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
				maps =3D of_translate_dma_region(np, maps, &iova, &length);
				if (length =3D=3D 0) {
    ...
}

Because length is uninitialized stack memory, it might not be zero.=20

The loop would then iterate again, and since maps is NULL and end is a valid
memory address, the loop condition is met and it attempts to dereference the
NULL pointer:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
		while (maps < end) {
			struct device_node *np;
			u32 phandle;

			phandle =3D be32_to_cpup(maps++);
    ...
}


[Severity: High]
This isn't a bug introduced by this patch, but does the IOMMU parsing logic
correctly advance the maps pointer when a phandle does not match?

When iterating over the properties, if the phandle does not match the active
device node, the maps pointer only advances by one cell:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
			np =3D of_find_node_by_phandle(phandle);

			if (np =3D=3D dev->of_node) {
    ...
}

Without logic to advance maps past the address and size cells of the skipped
entry, subsequent iterations will mistakenly read the address or size data =
as
the next phandle, corrupting the array parsing and potentially causing an
out-of-bounds read.


[Severity: Medium]
This is a pre-existing issue, but is there a reference count leak for the
device node during this parsing loop?

Inside the same property parsing loop, a reference to the device node is
obtained:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
			np =3D of_find_node_by_phandle(phandle);
    ...
}

However, the loop iteration concludes without calling of_node_put() to drop
the reference:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
			}
		}
    ...
}

Would it be helpful to add an of_node_put(np) call after the entry is parsed
to prevent leaking the reference on each valid phandle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D9
