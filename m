Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4571364942
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092297; cv=none; b=D+c5hQF1o+vZT8FjNHKH0UUP37omDR8Extgcg/wMjQ+dnqzGEkpn3Z4PMCqdHw/QdJbq2nLwLkMr4+wkjdR+IDOl3w4zkfwdwFHlZ+tRXqFoFwp5YOQLH/Z5/7ldwgoZQn9HQqZWBtr+fSEKgzNhaH6W7sSBSao4W0CqXT1vpIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092297; c=relaxed/simple;
	bh=5RiWPROCqqVvDNMpzEWEcQ2DVJtfSd4c/d621u6U+5c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ucbnrwLLSL/L1F+jBbU6y4KJ/oGMtnAWNtv0JfECzKLf2ZPsWELzxOsMf+yp5pnJDI0JHNe9LvGOA9DGqh5VOas7wLCN/GIDx2hiupcyYcRU58ingBMznI2gEC71vqFfpETO/WEGZUOMz3LA4Hcnmon8u4pfkkvkTEGe4R6n3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nX1ni51Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX1ni51Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452D11F000E9;
	Fri,  7 Aug 2026 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092295;
	bh=fGFYYWQE5plnYKUqfa7F04zxJWlUpIA4b64Fil0T7zo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nX1ni51ZFR4Eh+H0AXilXhmvNl7598/4rDe1GXlUK4cJnfvHdWP////Aj+VlyaI2c
	 f6K9jOWfDucim9TJxHOttnX+SxUxx0jQTJqsjNtc7ZoMgOQxdFa/YRj/tctA/qlWBm
	 lqsPH7fh8VeGgzXImyJMACn0UPHpkDCDP4eP7g7RgEiHYF/dfC2UJewjVMY0vxpxNs
	 g/bJ+QwWs2mRjI8ibuuE3ea3hYbag93Ajo0KToSJ6X1aB2WoLeKME9cjanEUuRArJ2
	 FH2UFwP6KWPf/r4CRxffk+2m1jAva5oLHXkqwbMEiNUAv80ZtyfvAaR+ziCP5bf+eo
	 ZW7SvJmHrS2cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/22] arm64: dts: qcom: sc8280xp: Reserve low IOVA
 range for Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-7-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-7-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:44:54 +0000
Message-Id: <20260807084455.452D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `of_translate_dma_region()` fails during IOVA reservation parsi=
ng, it returns NULL, which causes a subsequent NULL pointer dereference on =
the next loop iteration.
- [Medium] The device node reference obtained via `of_find_node_by_phandle(=
)` is never released, leading to a memory leak.
--

--- Patch [7]: [PATCH 07/22] arm64: dts: qcom: sc8280xp: Reserve low IOVA r=
ange for Iris ---
commit 5bb5ca70fa7d2aa5a3d66cdd7f006042161ce0dc
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sc8280xp: Reserve low IOVA range for Iris

This patch reserves an IOVA range for the Iris VPU to prevent unhandled
SMMU page faults when DMA accesses that range from other stream IDs. It
achieves this by adding a reserved-memory IOVA reservation node and
referencing it from the Iris node.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index fbcfd3883bbb4..1c624683d0033 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -669,6 +669,17 @@ reserved-region@aeb00000 {
>  			reg =3D <0 0xaeb00000 0 0x16600000>;
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

[Severity: Medium]
This is a pre-existing issue, but does of_iommu_get_resv_regions() leak the
device node reference when processing the iommu-addresses property?

When parsing these nodes, the reference is acquired via
of_find_node_by_phandle():

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
		while (maps < end) {
			struct device_node *np;
			u32 phandle;

			phandle =3D be32_to_cpup(maps++);
			np =3D of_find_node_by_phandle(phandle);
    ...
}

But it looks like of_node_put(np) is never called within the loop or the
function, which would result in a leak on every element in the property.

[Severity: High]
This is a pre-existing issue, but is there a risk of a NULL pointer
dereference here if of_translate_dma_region() fails?

If the translation fails (for example, due to an invalid DMA parent),
of_translate_dma_region() returns NULL:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
				maps =3D of_translate_dma_region(np, maps, &iova, &length);
				if (length =3D=3D 0) {
					dev_warn(dev, "Cannot reserve IOVA region of 0 size\n");
					continue;
				}
    ...
}

Since maps is updated to NULL, the loop condition (maps < end) still
evaluates to true. On the next iteration, be32_to_cpup(maps++) would
unconditionally dereference the NULL pointer:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
		while (maps < end) {
			struct device_node *np;
			u32 phandle;

			phandle =3D be32_to_cpup(maps++);
    ...
}

> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D7
