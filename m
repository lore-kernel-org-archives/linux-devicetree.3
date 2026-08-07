Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DBD38B148
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093052; cv=none; b=PzmnjKaabq6HNG//9/f09aL31TMQ/zeT15s2E2/vTfg4QHcjEzNdYlD6jNF0n0aX8KxccjkxHPiN0kdL/otGTDXxX/VYEQSKyPp4QKBMhgkXQeEdhA7LFd6Ua+NMfK+fQOK6GZ08Lknn3Si3B5psjg2Cq0K1Ebacxm8eVm+g8zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093052; c=relaxed/simple;
	bh=jxuSqHsB7kRkoM1aELfaTjxtRrj3RIPyCQmqPVGCcNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MMYKoqNYQRERQ4aIH3EwiWHL1nsD+7lT3IKvmKxk0m/0nR8xSOGkHo8pJJWxKW/k72jIJ6omysG5LlTQ2XAeoED5iQJgxKQNpmgxiX5/Tvc0c4v1toIKuqNOTCv8R+NLJ+OpuIG1AOV0WENLS2SkgcHqxAfYZrYOYj6q8pIHgAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXzuUMvn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXzuUMvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953011F000E9;
	Fri,  7 Aug 2026 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786093051;
	bh=pdpOXKxIlAbjTuFTyPvKQFZVQw6cblIntbDgvoq3hNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oXzuUMvnoDXqxXVCI71XHEC0E8RRggmk8aJrt0tndI49YJE6UcbSmO2G5kgnchhZ6
	 Rzl4vTFD40pf1w6wWZlf5vQdvq3bIgiS/GaO+M93IqBrwmFIMRITUlvsF+H2DX2VSM
	 eTqIVqUnYjW8vCv3AQNrWLYtEVLfumPzJiEtP4qUP5RYRhYDIMTs7CPAyyfZ9TSmDK
	 beRhObMCrRLzvihRVFV75JOX/Tir8DZeMty3qXbDpD/zeYhIqsQrcpOWrVb05/h7fd
	 jOWNNlq0IfZ3qjOL4iRL8/PV+TXrQqztKB2jYbqdHw5FqOIOiUkFiYv1B4+dsJrGeB
	 6kXxalXMoPsUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/22] arm64: dts: qcom: agatti: Reserve low IOVA range
 for Venus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-12-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-12-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:57:29 +0000
Message-Id: <20260807085730.953011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Multiple parsing vulnerabilities in `of_iommu_get_resv_regions` wh=
en processing `iommu-addresses`.
--

--- Patch [12]: [PATCH 12/22] arm64: dts: qcom: agatti: Reserve low IOVA ra=
nge for Venus ---
commit ce9067cc6b514ef4e9f906bcee46fa8222f6c18b
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: agatti: Reserve low IOVA range for Venus

This commit reserves IOVA addresses below 0x25800000 for the Venus VPU.
This prevents unhandled SMMU page faults and spontaneous reboots when
other stream IDs DMA into that range.

Fixes: 7a37bf31e3a7 ("arm64: dts: qcom: qcm2290: Add Venus video node")
Cc: stable@vger.kernel.org

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85b..6ae66ef882363 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
[ ... ]
> @@ -381,6 +381,17 @@ rmtfs_mem: memory@89b01000 {
>  			qcom,client-id =3D <1>;
>  			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
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
> +			iommu-addresses =3D <&venus 0x0 0x0 0x0 0x25800000>;
> +		};
[Severity: High]
This isn't a bug introduced by this patch, but using the iommu-addresses
property here exposes multiple parsing vulnerabilities in
of_iommu_get_resv_regions() in drivers/iommu/of_iommu.c.

First, if a memory-region specifies iommu-addresses with entries for
multiple devices, the loop reads the first phandle. If it doesn't match
dev->of_node, it continues without advancing the maps pointer by the
required address and size cells (na + ns):

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    phandle =3D be32_to_cpup(maps++);
    np =3D of_find_node_by_phandle(phandle);

    if (np =3D=3D dev->of_node) {
        ...
}

Does this cause the next iteration to incorrectly interpret the remaining
address and size cells as a phandle?

Second, if of_translate_dma_region() fails because there is no DMA parent,
it returns null. The stack variable length remains uninitialized. If length
is not zero, the loop proceeds.

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    maps =3D of_translate_dma_region(np, maps, &iova, &length);
    if (length =3D=3D 0)
        continue;
    ...
}

Since maps is null, will this trigger a fatal null pointer dereference on
the next maps++ ?

Finally, there appears to be no bounds check before of_translate_dma_region=
()
reads na + ns cells from the maps pointer.

Should these parser issues in of_iommu_get_resv_regions() be fixed before
or alongside introducing this iommu-addresses usage?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D12
