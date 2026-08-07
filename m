Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A6D3DDB0D
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092642; cv=none; b=t8h2zBa34Vj4tzV8G0xbPoi2zkZ/vtu11KFQMdG+BPHq9bogO/CD+uF3vtLSEuCO8S1M24IahN89A3xS40MEClwquY+3CsOAH2u8pe02OtlWGYPy5pt8KCIXM3GgaaICKMiPnFVh9t0drY0OlUgaxlzvalskefscIrvJCZ5wByg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092642; c=relaxed/simple;
	bh=J6jLqQ1RZl81itN7lHvnzBbmLIBuQ3jWqUU6fGpmi3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oEX7K8qJjAYErq02INe81y/nx5Y0lP0ysj+XCtZ/TzClbmRYaN8PMC7KcSxilxA1EKXdXkq46/TVlWgTN1dCmwLD8oj9zaWd6dTzWyaEzeBJFGjrQeTciCYgI/Phqp35Uv5saOwLK7L1urTNAmaG2Vs+X9wh5SGHmS3CS0zviX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asU3MSux; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asU3MSux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAE71F000E9;
	Fri,  7 Aug 2026 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092641;
	bh=IQ0jjXBSjFkX3p3h3LTTuraDXIxLQorDnIR79O1irj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=asU3MSuxQGyJTlBltDZuT2UgRTuiKytrLgoRkVncJIpETNOh/sDLIV025Xx4i22Pa
	 JyaWTeLG59Zht9gLuY6IT/7HkNCsnvvhaHL3L1JPLSZ5QoQC6Gj6Ua0lzkE9vRleCP
	 7tA2cfmtiVbDG+YZc8uEZGa74sPpm1oreNGIc/pDBNTrb7jy29bs+9Lf/PFz5YWqFa
	 S5xBH2MBW92d29me1/fZw6/mtq2j3mg093ecsdQplMEHkZg3kfwg/a4pn66MyDe49L
	 NxGLSWkGrLnaYp2QFZl+3yRl6fqqe+xycRoC385R5FCEyNA5teUWFD4jdUfzFy+i+S
	 5fXYPpM9EA2Dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/22] arm64: dts: qcom: sm8350: Reserve low IOVA range
 for Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-8-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-8-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:50:40 +0000
Message-Id: <20260807085040.BEAE71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized variable usage and NULL pointer dereference in of_io=
mmu_get_resv_regions() when of_translate_dma_region() fails.
--

--- Patch [8]: [PATCH 08/22] arm64: dts: qcom: sm8350: Reserve low IOVA ran=
ge for Iris ---
commit ff9e2ea90c6d8293aa79fd7350941f4a90c4b7df
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8350: Reserve low IOVA range for Iris

The Iris VPU needs IOVA addresses below 0x25800000 reserved to prevent
unhandled SMMU page faults and reboots caused by DMA from other stream
IDs. This patch adds a reserved-memory IOVA reservation node and references
it from the Iris node.

Fixes: a2b0c5eba743 ("arm64: dts: qcom: sm8350: add Iris device")
Cc: stable@vger.kernel.org

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> index 32b47f5ec1f67..b376dda0ed520 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi

[ ... ]

> @@ -553,6 +553,17 @@ removed_mem: memory@d8800000 {
>  			reg =3D <0x0 0xd8800000 0x0 0x6800000>;
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
property highlights a pre-existing issue in the parsing code. Does
of_iommu_get_resv_regions() safely handle translation failures?

Looking at drivers/iommu/of_iommu.c:of_iommu_get_resv_regions(), when
of_translate_dma_region() fails, it returns NULL:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    maps =3D of_translate_dma_region(np, maps, &iova, &length);
    if (length =3D=3D 0) {
    ...
}

The return value is assigned directly to maps without checking for NULL,
leaving the iova and length stack variables uninitialized.

If the loop continues to the next iteration, it attempts to dereference
maps:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    phandle =3D be32_to_cpup(maps++);
    ...
}

This causes a NULL pointer dereference and a kernel panic.

Could the parsing code in of_iommu.c be hardened to gracefully handle
invalid or untranslatable data without panicking?

> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D8
