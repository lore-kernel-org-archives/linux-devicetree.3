Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A943380FE5
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092246; cv=none; b=YCvws3alUnSq/u/3sH3n0jzcNgIax75A6vlTagUdqKskikj0hYkcZYnlQIcD7VQVrChBLsWpmsuPrzPqvnRSwqERugJviwj7AznnN4cVK1a2KskbDFFyvB/qQFXiZocifXN7hArGSetXfaFZWUExnc0iJwypIeZWJRuj+UIFpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092246; c=relaxed/simple;
	bh=rc/FR0v+zBhNwFvWfsB6MCWckq6JZ4Cnitttx4XBWjs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EkaLcLHaSk7eM9QaYrskWCptw1BlyJSxHcDcvw+nPey7wTpIYsoaoIsT0QiwvaKEKxIM/bgbv7q8xeEugTxH40zNBEqO/VHFkEzqRGSv5bmGpIboMnXaL9dctQTMGeyzP5Y1TQHbGFb6gqhhKgAnfGb4RGUnNAecEgdhetx/2tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjhouCzf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjhouCzf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8711F000E9;
	Fri,  7 Aug 2026 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092243;
	bh=Ue2rlJQCd5hPE6PbQrqDMQAwpn4EqJpWVpCvrucBSr8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VjhouCzfFCmL0DZNh6BWd/dqQe2Z43erFBBy4PS2Q8Ju8IUrh1Ro8e8032e/Ax66j
	 Rsj8htq3Xqrm8OC/qSpdJNWHdyBxTseMXnp32TcqALE0gpCt33Qp1bpCqs0lCrcMn0
	 L6lD4CWynxQYYf68PBIN0Q5yb4u9kgEQrXPpu1zYmXi6NUl7/GrQosY327xpP1glLk
	 skymnxIROwZWk/JDijE+gyaHT69ZiEk/9Rr7Ljr2RcWrs0Vl4QcCaZgPg1y2cifKbs
	 hx1NHACpuBg66mgWxpsyNvf6lJlaQlh+BK8IlBAhDGfmCfxQwtuhYnTSztq3nYLOsg
	 UZP90OaU5jDNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/22] arm64: dts: qcom: lemans: Reserve low IOVA range
 for Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-5-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-5-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:44:02 +0000
Message-Id: <20260807084403.3F8711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] of_iommu_get_resv_regions() fails to advance the 'maps' pointer wh=
en a parsed phandle does not match dev->of_node, leading to corrupted DT pr=
operty parsing and out-of-bounds reads.
- [High] of_iommu_get_resv_regions() will dereference a NULL pointer and us=
e uninitialized stack variables if of_translate_dma_region() fails.
- [Medium] Device node reference count leak in of_iommu_get_resv_regions().
--

--- Patch [5]: [PATCH 05/22] arm64: dts: qcom: lemans: Reserve low IOVA ran=
ge for Iris ---
commit 4e0d92ff7cab972552bdfb654d8534c1ad241835
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: lemans: Reserve low IOVA range for Iris

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots.

Fixes: 7bc95052c64f ("arm64: dts: qcom: sa8775p: add support for video node=
")
Cc: stable@vger.kernel.org

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 695eae1b72569..da0326fe24485 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -862,6 +862,17 @@ cpucp_fw_mem: cpucp-fw@db200000 {
>  			reg =3D <0x0 0xdb200000 0x0 0x100000>;
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
This isn't a bug introduced by this patch, but adding this property might
trigger a pre-existing issue in
drivers/iommu/of_iommu.c:of_iommu_get_resv_regions().

If the iommu-addresses property contains multiple entries and the first
entry's phandle does not match dev->of_node, the code skips the if block
but fails to advance the maps pointer:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
	...
	if (np =3D=3D dev->of_node) {
		// ... parses and advances maps ...
	}
	// MISSING ELSE BRANCH to advance maps pointer
	...
}

Will this cause the next iteration to incorrectly interpret the first addre=
ss
cell of the unmatched entry as a phandle, reducing the parsing to a corrupt=
ed
word-by-word scan?

[Severity: Medium]
This is a pre-existing issue, but does of_iommu_get_resv_regions() leak the
device node reference count when parsing these iommu-addresses?

Every iteration of the loop fetches the node, but there is no corresponding
of_node_put(np) to release it:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
	...
	np =3D of_find_node_by_phandle(phandle);
	...
}

[Severity: High]
This is also a pre-existing issue, but what happens if
of_translate_dma_region() fails when parsing this property?

The maps pointer is reassigned to the return value without checking for NUL=
L,
and the function relies on the uninitialized iova and length variables on
failure:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
	...
	maps =3D of_translate_dma_region(np, maps, &iova, &length);
	...
}

If of_translate_dma_region() returns NULL, the maps pointer is assigned NUL=
L,
and the loop condition maps < end evaluates to true. Will the next iteration
then dereference the NULL maps pointer?

> +		};
>  	};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D5
