Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B5364058
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092430; cv=none; b=KXhplE+gOQZcYBWQxjxmJAn86kinF5Uc+7nLEMFsqUnQ1oToWou0ah6LUgVQDsIYOyRn7AAYogHeCqXYvB/E3lon9OBSw3DAtPXNckO1olP3/upxBBAla/N5pRJelHmAeJDuzvOkaFFYXGNpZ2aUcioSpk8FbtyAXNgiEpoAimY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092430; c=relaxed/simple;
	bh=crW9izSCfl6marcXNaQkrQtJH2uwy/moxJ80rZp55+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ky82uFQPObDrCI5w2F7UyPHURWTh8kd1LGsPOHx7QPjeADy6hT+AGQ0KNoHZoE0TaMxqFqBByin3+LxXiIspZZAd82Q9l1TJ1mqlPA2JjaApuDTvv5hdAjqMFxxsU/SI7wXUJGEdEcT7DL4uhV1YuacbeBBsd3eGNugpoxNS8Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9KjEuW/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9KjEuW/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E641F000E9;
	Fri,  7 Aug 2026 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092428;
	bh=baaqtq+fUwKiH6FR2aWcNMk1PDstKAKp9LhfmswBt0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L9KjEuW/XiRil3Cjkw71yboxdxb2Ckq6G6wsrf8vxnAB0+H9e55P+KPHyaCJ2oIxN
	 8kstNfoNBsI7zTmYqVyUXEYSKw0T6Sh6Haya2sVHcnvKA3m40lPPaxzc//aJJaoxgX
	 EpR5khAN7ARJoCbKv3L6fjy9w+3LtjwvrHEgakb2g9CsxoVSPhPt5zD7ri1PbqG7Ht
	 P4ouc8MwrcFOu8DQPgwmmzH/AKHcpVSFJmZavdH6Nt8WYoplAhVhlu99CYZnMgaUaA
	 EFQ2BRWpWu+BFwcUkWj5IOM/0nhVlEVYyxovJcOu0nvZTWl70nY7/3CGYFthz6B9pD
	 oiZLVsIYrBjxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/22] arm64: dts: qcom: monaco: Reserve low IOVA range
 for Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-6-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-6-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:47:07 +0000
Message-Id: <20260807084708.43E641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing flaws in `of_iommu_get_resv_regions` cause a kernel p=
anic on translation failure, break parsing for multiple device entries, and=
 leak device node references.
--

--- Patch [6]: [PATCH 06/22] arm64: dts: qcom: monaco: Reserve low IOVA ran=
ge for Iris ---
commit 80dd45ef37e8a085b1612e1aef1e011d1e74726c
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: monaco: Reserve low IOVA range for Iris

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. Add a reserved-memory IOVA reservation node
covering [0, 0x25800000] and reference it from the Iris node.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index cfe39f923224f..048b4490fcafd 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
[ ... ]
> @@ -812,6 +812,17 @@ video_mem: video-region@9be82000 {
>  			reg =3D <0x0 0x9be82000 0x0 0x700000>;
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
This is a pre-existing issue, but does using the iommu-addresses property
expose flaws in the underlying parser in of_iommu_get_resv_regions()?

Looking at drivers/iommu/of_iommu.c:of_iommu_get_resv_regions():

		while (maps < end) {
			struct device_node *np;
			u32 phandle;

			phandle =3D be32_to_cpup(maps++);
			np =3D of_find_node_by_phandle(phandle);

			if (np =3D=3D dev->of_node) {
				...
				maps =3D of_translate_dma_region(np, maps, &iova, &length);

If of_translate_dma_region() fails, it returns NULL. The maps pointer becom=
es
NULL, and the while loop condition (maps < end) continues evaluating to tru=
e.
The next iteration calls be32_to_cpup(maps++), which dereferences NULL and
panics the kernel.

Additionally, if the parsed phandle does not match dev->of_node, maps is not
advanced past the skipped device's address and size cells. This causes the =
next
iteration to incorrectly read part of the DMA address as a phandle, which b=
reaks
parsing for any property with multiple entries.

Finally, np is acquired via of_find_node_by_phandle() which increments the
refcount, but of_node_put() is never called to release it. Does this leak t=
he
device node reference?

While this patch adds only a single-entry array and might bypass the multi-=
entry
parsing failure, the parser itself appears vulnerable to panicking on malfo=
rmed
device trees.

> +		};
>  	};
> =20
>  	smp2p-adsp {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D6
