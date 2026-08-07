Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27781363096
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092848; cv=none; b=KkG5di4Nq5asXlzfKj7t2o6caxVEtoiGEZ0MmoI0rCNpgD3xXl/wt35ej/0/BgRSKLOoM+8/KgYEtAQTTikburvwbxGPC9q9YqWAe3MH/i0XVrDO5j8NXVUNgmxCAH2O9i5g28mgSbaveTMD3xc/5IxhRNptk7NR4dvdBlsNYqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092848; c=relaxed/simple;
	bh=Mmzc/d5nL+b1CTrI6Qi/ETuK6MRwcQfl3NkKUq1XHCA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lan6KRuxrBmb/J46BazfzWTvHb4e/wuImcHr0C6Z7khtgPNxtHrjgENTl2g3wbJcmluMudCsNrS7H4FvySS4WvIXkvZ2u6It+1PlgdNEwVnhW93ogDCicLz+Xh4hsUm8soTF4ur/Q5Cpdoh/LoQ99O/dfgX9Z0gW3zf3FOkcolU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNSP26Ae; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNSP26Ae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF101F000E9;
	Fri,  7 Aug 2026 08:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092846;
	bh=4JZu9tdjKaSzbOZGOxJImM5hvzwHFayjY3jOZ8WEIyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kNSP26AeJkikoVRdGTiShk+r6kbGb/x7PGn0EuHqd0b5P7qesPfL0qZEFOiv04Tw8
	 09dz365GZBvk7UBBYIyL/EUgWkgBTsVSjOE7h7AngosQvit9EnIwFO3eQ5cEJwXh9y
	 soAONEC1mLAwUd/SLixoNXCtUwk/36qA4iUxc57M/13ZTUmTDfnsleiPvsgKEhyC6y
	 QPH0CNlRvSfLxm7ZQs7Jt7SY8+iZ1IPg2vYQn75u9s0RApQmgt43XeTFLig/L9vBkP
	 fJ7+wdWx9kS/ZSzbYN5GDACpGvpOith7vaWtMrZUxjJSRXIAJPtATbAqT2gMjKGMN6
	 uK6QwvzGSRFQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/22] arm64: dts: qcom: sm8750: Reserve low IOVA range
 for Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-11-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-11-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:54:05 +0000
Message-Id: <20260807085406.6CF101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing error handling for `of_translate_dma_region` leads to unin=
itialized stack usage and a NULL pointer dereference.
- [High] The loop parsing `iommu-addresses` fails to advance the property p=
ointer when skipping entries for other devices, corrupting parsing.
--

--- Patch [11]: [PATCH 11/22] arm64: dts: qcom: sm8750: Reserve low IOVA ra=
nge for Iris ---
commit c7d055796e0d5e48c39a3d7938283d3a8d0628e4
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8750: Reserve low IOVA range for Iris

This commit adds a reserved-memory IOVA reservation node for the Iris VPU t=
o=20
keep IOMMU allocations above 0x25800000, preventing unhandled SMMU faults.
It also references the reservation node from the Iris node.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index dd738d13df8e0..cf17c76a4a390 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -562,6 +562,17 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>  			size =3D <0x0 0xc00000>;
>  			reusable;
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
This isn't a bug introduced by this patch, but using iommu-addresses here
exposes a NULL pointer dereference risk in drivers/iommu/of_iommu.c if the
device tree is ever misconfigured.

If of_translate_dma_region() fails (e.g., due to invalid dma-ranges), it
returns NULL, which is assigned directly to maps without checking:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    maps =3D of_translate_dma_region(np, maps, &iova, &length);
    ...
}

On the next loop iteration, maps is compared to end, and then dereferenced
via be32_to_cpup(maps++), causing a kernel oops and failing to boot:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    while (maps < end) {
        struct device_node *np;
        u32 phandle;

        phandle =3D be32_to_cpup(maps++);
    ...
}

In addition, length and iova remain uninitialized stack variables. Can we
add a check for NULL after of_translate_dma_region() to prevent this crash?

[Severity: High]
This is a pre-existing issue, but adding iommu-addresses here is affected by
a parsing bug in drivers/iommu/of_iommu.c for multi-entry properties.

When parsing the array, if the phandle does not match dev->of_node, the code
skips the if block and loops, but fails to advance past the DMA address and
size cells for the skipped entry:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
        if (np =3D=3D dev->of_node) {
            int err;

            maps =3D of_translate_dma_region(np, maps, &iova, &length);
    ...
}

The next loop iteration will misinterpret the skipped DMA address as the ne=
xt
phandle, corrupting the parsing entirely. Does this need to be fixed in
of_iommu_get_resv_regions() to safely support multi-entry iommu-addresses
properties?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D11
