Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA6F2D5923
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609395; cv=none; b=rmIJMNwR+3fX+0g6EpG9ZAE56++UDPBn75zqgJp82tQbESocAPS/55agagcq9YnxA+UOUVu8ydl9ojx1BaPfM1a18d0rA7rfj2WNJ9hsGa8TRn4UDVvsr7TJPYziooBz22kISeQ2iiZCthXbszi8P7CA5FP6Av9HMIB5h0fjP/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609395; c=relaxed/simple;
	bh=yj4Dz2SnhtNl05+daMdy52THRlpCzi/BuKt6nu4xPac=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WOBsAMmlIpUM/xbucDpOMUmvWbCveMFxBeIida34/HAOQEB3+E9rhhKQ7ATWSmPJPYXWkuHqnl1G2OEFipdv2NWAMNHYxThihdLL61QD/9mYB4ETIwc4hyZDAh/vzfBOUMrzjWoKbBh6pODDjQ8/VH2BIpOTO3i4cFlQAUQhBsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzF6DCDO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzF6DCDO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1B11F000E9;
	Thu,  9 Jul 2026 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783609393;
	bh=Pnvtqb+Hmz+TzxifFH3F66CccxkOD7fIyHN10ZZOSl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DzF6DCDO+VKMt3DFWnvvMZQ5wrQ0sLt4UwrCIeExhra/qYeRUsOCalf8g32kdhe0u
	 QZSr5pAJtas4IGVdsNbmfmPmVHotRnwYw7Kcg04Cxwox7yyBtI8m3orfGMv76BF/tc
	 3ECXTLB0+V44N2lQGAOy9jh70j7IecSKaJOjprhfqdjA9YHfP118ETSMklz93ilAwH
	 lyrBzdhJL7hVH6Ch/NRT3dAcu28JVL8ke4JK2yrjVPEk4oKcMfchi78DUMp/w/IeMC
	 XX4gEEPq9glaE3lu67Gwsxr+XkI4q4b5gWrO4Qi+TzI8qTcRxYdeXmU6HomFwB6u8S
	 k2W3AQaS29r3w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 10/11] arm64: dts: qcom: monaco: Move Iris IOMMUs to
 child nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-10-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-10-72bb62cb2dfd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 15:03:13 +0000
Message-Id: <20260709150313.9B1B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Misuse of `iommu-addresses` in a `reserved-memory` node creates an=
 `IOMMU_RESV_RESERVED` region that actively blocks IOVA allocations in the =
0-600MB range, rather than restricting allocations to it.
--

--- Patch [10]: [RFC PATCH 10/11] arm64: dts: qcom: monaco: Move Iris IOMMU=
s to child nodes ---
commit 2ee0f65b225528a8b439c85350380c9a56ad101f
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: monaco: Move Iris IOMMUs to child nodes

This commit splits the Iris VPU device into non-pixel and pixel child nodes
to accommodate different IOVA constraints. It adds a reserved IOVA range
intending to limit the non-pixel stream to the 0-600 MB range.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -831,6 +831,10 @@ video_mem: video-region@9be82000 {
>  			reg =3D <0x0 0x9be82000 0x0 0x700000>;
>  			no-map;
>  		};
> +
> +		iris_resv: reservation-iris {
> +			iommu-addresses =3D <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
> +		};

[Severity: High]
Does this iommu-addresses property block allocations in the 0-600MB range
instead of restricting allocations to it?

During device probe, of_iommu_get_resv_regions() parses this memory-region.
Because iris_resv has an iommu-addresses property but lacks a physical reg
property, it is classified as IOMMU_RESV_RESERVED.

The IOMMU DMA allocator then passes this range to reserve_iova(), which
explicitly excludes the 0-600MB range from the available IOVA pool.=20

Will this force subsequent allocations for the non-pixel stream into addres=
ses
above 600MB, resulting in the exact IOMMU faults and device crashes this
patch intends to fix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-vpu_iommu_=
iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com?part=3D10
