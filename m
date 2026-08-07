Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9090D3D9531
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092317; cv=none; b=ZVB26eKEa9J5I9tT5nInRMOlG8Hd73RPLKXlRopbqV8G/ptpontiRJ6Q1Ve8tyOPRRy3b3uKBGj7WwfHWkSkOMZlqP+IMn19nxKZvo6V4pFXx8odODu2g503ztIvGqtO9ZPc3FLFtvmw+2TLOKcf/HCOOuG5dgwdDtT2K109PJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092317; c=relaxed/simple;
	bh=TZKxgtyZmn5+qKP+eJmEzxG1ueMEl2fgZwUmd4TY0JA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gaj8FefjHhaXLE3WjFxCoMJsBlj1/pBU32FmwCeVy73gmngaerlM9EtwsuNMqKVtYQMa2HGKA6MCMTrM7HXeWREzQ5HjBgzhRlid8H2nqydqXL8htf9VjRmsyG/9iUpjhubG+ucFovqQlsuY5vYQnuKuFZl1GNfcaSgN7eQAzkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDj04tAz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDj04tAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCDA1F000E9;
	Fri,  7 Aug 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092316;
	bh=y6yhzihsf9h1Ls7NPn8c1OJDjgomNx6+ZNA1z/IN5E0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hDj04tAz3BRIPxyGxQXIIgNzxOnxz1Ei7GxLRQhHRG8DrKMc7wGZc8AWFgSGHwClb
	 t5MFOcqFTISiMGsxo4SOwvEWFmjTBI6xL6nKKw7X784iQclswM4/EKjaD9TPPow8Gi
	 h4IIo0iV6r1fPSGIhNsZZFMvdMWZYZlzf6q/paaOlERt8aV538WmJ3nrd8D5qCDz4W
	 fpU8tQ+jVoc9OFO+13AOVGjsWER+Vl5nTQzuFPJpiyagfZMsdeAuVgS9yaxW8xfwkC
	 yF0NdgdIXDBLqoG2+h2W6rhD9DiM99sX5SXpyqX5dGbD5bL8JYlqdVdzhZycfHnYP5
	 D1rYp7sfeIong==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range
 for Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:45:15 +0000
Message-Id: <20260807084516.2BCDA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check, incorrect pointer advancement, and potential=
 NULL pointer dereference when parsing the `iommu-addresses` property.
--

--- Patch [4]: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA rang=
e for Iris ---
commit 0d7d545a5dddd31b4e0cc75f7a486bdd8ebe240d
Author: Daniel J Blueman <daniel@quora.org>

arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris

This commit adds a reserved iova region below 0x25800000 for the Iris vpu on
hamoa platforms to prevent smmu faults. It references this reserved memory
using the iommu-addresses property to keep dma allocations above the bounda=
ry.

Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomm=
ent-4458933574

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 8a96ea1bdb9c4..87f424765d513 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
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
property could trigger a pre-existing issue in the device tree parsing logi=
c.

Looking at of_iommu_get_resv_regions() in drivers/iommu/of_iommu.c, when
parsing the iommu-addresses property, if a parsed phandle does not match
dev->of_node, the loop fails to skip the parent's na + ns cells:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
	while (maps < end) {
		struct device_node *np;
		u32 phandle;

		phandle =3D be32_to_cpup(maps++);
		np =3D of_find_node_by_phandle(phandle);

		if (np =3D=3D dev->of_node) {
			// ...
			maps =3D of_translate_dma_region(np, maps, &iova, &length);
    ...
}

Because maps is only incremented by 1 cell (the phandle) instead of
1 + na + ns, the parser becomes misaligned. Subsequent iterations will
interpret address and size cells as phandles.

Additionally, if of_translate_dma_region() fails, it returns null. The loop
then assigns null to maps. Since end is a valid kernel pointer, the maps < =
end
check passes on the next iteration, and be32_to_cpup(maps++) dereferences t=
he
null pointer.

Furthermore, in of_translate_dma_region(), there is no bounds checking agai=
nst
the property's allocation size:

drivers/of/address.c:of_translate_dma_region() {
    ...
	address =3D of_translate_dma_address(dev, prop);
	if (address =3D=3D OF_BAD_ADDR)
		return NULL;

	size =3D of_read_number(prop + na, ns);
    ...
}

If the parser is misaligned and a false match occurs near the end of the
buffer, this can read out-of-bounds heap memory.

Does this new device tree property risk exposing these parsing issues if
multiple entries or malformed data are present in the device tree?

> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D4
