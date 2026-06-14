Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCBD846A
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781449388; cv=none; b=SCJ9atnT3rR8jaybUXmtWfl02aH47VoqpaUrpIz8LJOlkA0L1cv3VdUJ/itvH9qQ+KUKg+G0lK2+P2shfgiNyWlNFHRTUFqlJqCfJCWmoDwYTuTJ+7UipkLWX4xonLJIthO0rbVfKVBR4VpRF68Ck6bcsReZIdu4NJijESXVCUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781449388; c=relaxed/simple;
	bh=aClykzhyTmiMNDqUNj4vrNBPfVefjJVHQ2QJVE3yXak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SacF7fk1gyDChNCgwIBeuxR3tsUvN4l2B//fkIw6CJh03QYbGvme9dckrrSQM1Rr7dgOCT4ZP1avd07CLiIFxaxzsuHvE/gGEfQ6B752dmwmiwbOBlLOHMNSEVExrX4LBmMv5dvv6ID3ekU6w8DDYTIW5azFjmM7mvbZ/Y/ZVgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFJrY+++; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFJrY+++"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD0F1F000E9;
	Sun, 14 Jun 2026 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781449387;
	bh=FULkRTdND4hWwkKmX/twtBSj44aqm5DubBSILFi7DT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BFJrY+++BwiUzu72DDfodswdgZBVysogPhhvF7a+uGS9dMcRfADcH6JXVeGNnnJ5O
	 sTGlWm7F9PuvuCvLXzsBcERoSBh3a9NF4KUCJZXnMoM2D4N6MTfS9PRMUUrvOj1OGF
	 NSQW16iMa8Xgswsop+Y3c1KGsVB6KoE++VHirOSIIUqD5gC/YglxTA6zvFCMtB6ZOu
	 3UPiapIMor5/3PgV3D8ELnPe3bfvD2rqjJQj5djsi5hokeDTCa5SSApZmxgFJK168c
	 o+hlmDireYZq2e72P6EiTZ930hH0SMkyjAT70ciiTbd1wO8kXMMVx0vVhrSWMr82bQ
	 qUDr5jbcNGmqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range
 for Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel J Blueman" <daniel@quora.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260614145113.84243-2-daniel@quora.org>
References: <20260614145113.84243-2-daniel@quora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 15:03:07 +0000
Message-Id: <20260614150307.7BD0F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing NULL check on the return value of `of_translate_dma_region=
()` causes use of uninitialized variables and a guaranteed NULL pointer der=
eference.
- [High] The parser fails to advance the `maps` pointer when skipping entri=
es for other devices, leading to misaligned parsing and potential out-of-bo=
unds memory reads.
--

commit 9504aa19b1b75ded98afc02b95aff54f7fd1ba37
Author: Daniel J Blueman <daniel@quora.org>

arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris

On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
below 0x25800000 (600MB), primarily for non-pixel buffers accessed
via different Stream IDs. DMA into that range triggers unhandled SMMU
page faults that cause spontaneous device reboots. This is readily
reproduced with one or more browser tabs driving multiple concurrent
video decode streams.

Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomm=
ent-4458933574

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 051dee0764167..ce96e7f8d8c10 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -716,6 +716,17 @@ smem_mem: smem@ffe00000 {
>  			hwlocks =3D <&tcsr_mutex 3>;
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

[Severity: High]
This isn't a bug introduced by this patch, but adding this iommu-addresses
property exercises a pre-existing issue in
drivers/iommu/of_iommu.c:of_iommu_get_resv_regions().

If of_translate_dma_region() fails (e.g. returning OF_BAD_ADDR), it returns
NULL without populating the local variables iova and length. The maps
pointer is unconditionally overwritten with this NULL value:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    maps =3D of_translate_dma_region(np, maps, &iova, &length);
    ...
}

The code then evaluates if (length =3D=3D 0) using uninitialized stack garb=
age.

If it proceeds to the next iteration, the while (maps < end) condition
evaluates as true because NULL (0) is less than the valid kernel pointer
end. The next iteration then blindly dereferences the NULL pointer with
be32_to_cpup(maps++), causing a kernel panic.

Does the IOMMU core need to be fixed to handle a NULL return from
of_translate_dma_region() before adding new users of iommu-addresses?


[Severity: High]
This is a pre-existing issue, but there is a second bug in
drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() related to
iommu-addresses parsing that makes shared memory regions unsafe.

If an entry's phandle belongs to a different device, the loop skips the
translation block:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    if (np =3D=3D dev->of_node) {
        // ...
    }
    // missing else branch to advance maps pointer
    ...
}

Because it lacks an else branch to advance the maps pointer by the required
#address-cells + #size-cells, the next iteration erroneously reads the first
cell of the skipped address as a new phandle.

This desynchronizes the entire parser, potentially causing it to interpret
an address or size value as a matching device phandle. It would then call
of_translate_dma_region() on misaligned data, risking an out-of-bounds
memory read since there is no bounds checking against the end of the
property buffer.

Should the parsing logic be corrected to properly advance the maps pointer
for non-matching devices?

> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614145113.8424=
3-1-daniel@quora.org?part=3D2
