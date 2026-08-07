Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B193CC9E9
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092177; cv=none; b=qRePD/WBSUfbdz3d6wXYbpa2m1RQTYrpcH3G+RrYyazvnE3u/iq62BXo54SyS/V42VcSRR2g0VB4GONDAt3JNhKyncFHkzHgruJvwzTlZ86fb/dmXm4a60aFdUIOlFHsZPeZN0M0xnF+vX8bEDUa/MjyissV1bsH/5IMrcV0AbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092177; c=relaxed/simple;
	bh=9zMdCTDe3gpcg3f2momZDkpv+XykA1rN/uC/OSlUXvc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VUCwL1/VQ9osN9uFog2ppL+ugdNvomwKlffEOYBup+m+531eJXgIcYR4IaqD8piWE8NWCmI/VW9dde1iO0nwZphPV13tnRGC3aQDqegJq+Cael+53WGK3SJBkYKBFI+fWEIKYHA1VWcb20XCtkXAf2A+7bqnO5mI99hX1vhykY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmsZX5zF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmsZX5zF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE04A1F000E9;
	Fri,  7 Aug 2026 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092176;
	bh=1WYrDh5SmM4y8mWxr3hYDSWASmn+saUDcqF0qxGhRxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PmsZX5zFfKRCNOa9wM5jEiLIp6+lca8X2ThvxeQqziRKoCqDlGB+dV4C14XcZBaA6
	 LL/3swA9F47vvUetg4+GYuZgEQvPgz2jXl7gtV+ceZKpRBi6vYY2/w4JrCWfJ6tWi8
	 dJp4AE6M7XpsX8n3V7EYdOCgsAZmarmjDCftjbvrV1pz3FpB/+/siOdJruwuDacecO
	 veZ+w0WbUcBqzqOO7CaK1M/d4a0zB24UkNg3jVLKiRbEs8qeuYxgKME3IOxKMIdyQc
	 T+UhVmmkpiRAHyRsz9CDQv4f6OoLiT9EM0xgImjDI3Sppz4/A/aNyve/3wT0m4YdtM
	 a2djW6asqswsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/22] arm64: dts: qcom: sm8650: Reserve low IOVA range
 for Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-10-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-10-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:42:55 +0000
Message-Id: <20260807084255.DE04A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing parsing bug in `of_iommu_get_resv_regions()` causing =
misalignment and incorrect parsing when encountering non-matching shared re=
servations.
- [High] Missing NULL check for the return value of `of_translate_dma_regio=
n()` causes a kernel panic if address translation fails.
--

--- Patch [10]: [PATCH 10/22] arm64: dts: qcom: sm8650: Reserve low IOVA ra=
nge for Iris ---
commit 0235003bbbcd1eb35cb1bdeb1f805b1bd98ddfd1
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Reserve low IOVA range for Iris

Iris VPU reserves IOVA addresses below 0x25800000, primarily for secure
non-pixel buffers. This commit adds a reserved-memory IOVA reservation
node covering [0, 0x25800000] and references it from the Iris node to keep
DMA allocations above that boundary.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
[ ... ]
> @@ -5266,7 +5277,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONL=
Y>,
>  			interconnect-names =3D "cpu-cfg",
>  					     "video-mem";
> =20
> -			memory-region =3D <&video_mem>;
> +			memory-region =3D <&video_mem>, <&iris_iova>;

[Severity: High]
This isn't a bug introduced by this patch, but does adding multiple entries
to a memory-region expose a parsing bug in of_iommu_get_resv_regions()?

When processing a node with multiple entries, if an earlier phandle in the
list does not match dev->of_node, the loop in drivers/iommu/of_iommu.c
fails to advance the maps pointer over the address and size cells:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    phandle =3D be32_to_cpup(maps++);
    np =3D of_find_node_by_phandle(phandle);

    if (np =3D=3D dev->of_node) {
        ...
        maps =3D of_translate_dma_region(np, maps, &iova, &length);
        ...
    }
    /* Missing advancement of maps if np !=3D dev->of_node */
}

Will the next iteration erroneously read the unparsed address or size cells
as the next phandle, corrupting the device tree parsing?

[Severity: High]
This is another pre-existing issue in the same parsing area, but could
address translation failures lead to a kernel panic here?

If of_translate_dma_region() fails (for example, if the device lacks a DMA
parent), it returns NULL. The return value is assigned directly to maps
without checking:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    maps =3D of_translate_dma_region(np, maps, &iova, &length);
    if (length =3D=3D 0) {
    ...
}

On the next loop iteration, the condition maps < end will be evaluated
where NULL is less than the valid kernel pointer end, and
be32_to_cpup(maps++) will dereference the NULL pointer.

Could this trigger a crash on boot if an untranslatable DMA region is
encountered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D10
