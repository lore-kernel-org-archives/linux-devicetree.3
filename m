Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF4364058
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093691; cv=none; b=bwioElgHJaepUUAN0DvYWKwG89iY/E017EpaySx1tl+sOSZE/Bx+eHeo/bfUOEMcUybyNJoPObojtBmHGAcvJ40/fa3tmukYgB/noj1+G9fxOCs3gnkKh8NasAV2Q1m8U2hsp+Rml82T1JrlqeH/YkddoRXRwfK737AN++MeotM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093691; c=relaxed/simple;
	bh=xG5NSTKQYdZNyP/tbPfi0w6GC7uxaDyNNOJG8TJbJfI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p7n9IDciWQC6YS4XPBLPl5PnbYPA7RhjGqwbiYTcFtZosER1D5xeTuGFJ0R6jjO4WRNlhXu/JKmmG0wGslfD49ts7z/rByN/5E+0vTMK3/O2WSJ2ZUH2AqKj0LMALYqteMpzwpmUI5Hy+om+JczyJwgkHFFzwstCD1vG2tXVC5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijorFLjx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijorFLjx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED401F000E9;
	Fri,  7 Aug 2026 09:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786093690;
	bh=xixGNX9cIflU/edTX6VMmU5yKO+5da1d1Jn0xgio5LE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ijorFLjx6Qm57Nl+RWS+zvmyVvMOEr9HhqM3afwNFbMQ0XNbyigJv4EBcZzotfYRR
	 SarpSJtoar4kFACSDS8bf6aEVHaQmp7Cm1lPjhbHOr1h6vhL/rwI8dqKO9yP7X04XX
	 DN1HPR0mPFgzRKeZKqNGOPwYf/GNSfCgWCDi3Vli5ObKrf9WymUm5ngfNGCNgLNPFL
	 aLc3JVbP4cNMvsR4iAI6+uqhQz0Oxz+5qtBPdpXZyox3HIHeUyNF5JONW9uaOUSkZg
	 V5XiBu5XoIaKW/fPp3Isjc0adtb2fZ1khArvc0odLrYPguQXopvGKPqXs4W8NwHErg
	 3RQae7XDUF6TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/22] arm64: dts: qcom: talos: Reserve low IOVA range
 for Venus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-22-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-22-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 09:08:08 +0000
Message-Id: <20260807090809.0ED401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the parsing loop=
 in `of_iommu_get_resv_regions` fails to properly advance the `maps` pointe=
r when a tuple's `phandle` does not match the target device, leading to cor=
rupt parsing and potential out-of-bounds reads.
- [High] This problem wasn't introduced by this patch, but an unchecked ret=
urn value from `of_translate_dma_region()` in `of_iommu_get_resv_regions()`=
 leads to uninitialized stack variable usage and a NULL pointer dereference.
--

--- Patch [22]: [PATCH 22/22] arm64: dts: qcom: talos: Reserve low IOVA ran=
ge for Venus ---
commit c79264714a3878505bc5105c9bc703dbf039cc23
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: talos: Reserve low IOVA range for Venus

This commit adds a reserved-memory IOVA reservation node for the Venus VPU
and references it to keep DMA allocations above 0x25800000. This prevents
unhandled SMMU page faults and spontaneous device reboots.

> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qc=
om/talos.dtsi
> index eedfdce3c479e..8645b04e26643 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -687,6 +687,17 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>  			alignment =3D <0x0 0x400000>;
>  			size =3D <0x0 0x800000>;
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

[Severity: High]
This isn't a bug introduced by this patch, but does adding an
iommu-addresses property expose an existing parsing issue in
of_iommu_get_resv_regions()?

When parsing the iommu-addresses property, if a tuple's phandle does not
match dev->of_node, the loop skips the match block but fails to properly
advance the maps pointer past the current tuple's address and size cells:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    while (maps < end) {
        phandle =3D be32_to_cpup(maps++);
        np =3D of_find_node_by_phandle(phandle);
       =20
        if (np =3D=3D dev->of_node) {
            ...
        }
        /* maps is not advanced by address/size cells if np !=3D dev->of_no=
de */
    }
    ...
}

Could this lead to the next iteration incorrectly treating part of the DMA
address as the next phandle, resulting in out-of-bounds reads or corrupt
parsing?

[Severity: High]
This is also a pre-existing issue, but could parsing this property lead to a
NULL pointer dereference if of_translate_dma_region() fails?

If of_translate_dma_region() returns NULL (e.g. due to missing dma-ranges
or a malformed DT), the return value is assigned directly to maps without
a NULL check:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    maps =3D of_translate_dma_region(np, maps, &iova, &length);
    if (length =3D=3D 0) {
    ...
}

Since length is evaluated without initialization if the translation fails,
and maps becomes NULL, could the subsequent loop iteration dereference the
NULL maps pointer when reading the next phandle?

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    while (maps < end) {
        phandle =3D be32_to_cpup(maps++);
    ...
}

> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D22
