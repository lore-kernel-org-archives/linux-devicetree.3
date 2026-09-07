Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E77E4A92E1
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784607; cv=none; b=KxExi9TBqIim0BzBCWWyVsMSubQUJyPnI088oJcoFIf2Z5kNh1l9CHJ8Z5Bfg40Hw+zM5NLTSmsqN22sqDsb0EPRPkxvw6aZ2V2LCyYqRt0xTtC29VHZieuPEKXFZaj7i6ATCIW6XzTl2Mi9+F6p0lLuc8Gq2SQEQTD5dIOU5DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784607; c=relaxed/simple;
	bh=SGaERxxhfoXnBYrsF7Gn/WORrYcgYW+25OyLsVtXw58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T2P0D6wvAmOQpZucut7tiZVAugB/vWIt1Se6mGbhRBCjPZZVy1i4DKVGwQaP/bOMG9c2uK/iQvv92XrD3jvzIBDlcK2PMvBgNItCCWvhvVuFm3Ly0xWnOMob0V+iCsdYT4QAryh76Ra+knkZIOEl0YDcEuhfEE9w1Vewm0VCtyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGg96Kn+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGg96Kn+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63641F00A3D;
	Mon,  7 Sep 2026 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788784606;
	bh=4w6AH27KnH2EsDSJuJZLeO5DxkOu48IhkWTNruUYRVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VGg96Kn+7/ykRBi6ri2ca8GudI+itprnlhBO0P+BVHdJXNYlwKUJ7oh2S+dF7D686
	 gfS2rclyKjPdQt9DV+II4ZRzyMbr8z+TsDdAGAkyABiZzAc+YnADF+coxC830QZnCM
	 UFrm39gVDec+lxCWbQT7TaBySOmzAe6ALskGCmSprfRfllrDvRRv+9rVLG71ibrlQr
	 WUOkSdbWcn4+PrZP0C+VU8YmSPTQLpikNCWi28S/MHb1xNxz+gViRgsbZNXWU3K4aU
	 rZbi6+S4Qg7J8/z1WariBIrmAmFd5n1MZzCo4JbOXtBYdLD+IEC3J+vaAXxOm6yT2/
	 TWE5hC9kM7FFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/10] ASoC: qcom: Add QAIF IRQ handling,
 suspend/resume and platform register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-8-6d8ad9ba5c9f@oss.qualcomm.com>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-8-6d8ad9ba5c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:36:45 +0000
Message-Id: <20260907123645.D63641F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardcoded 2 cells for 'iommus' property parsing ignores '#iommu-ce=
lls' specification.
--

commit c9879e803b7f932397e4e9a7c40595da90b01510
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform register

This commit completes the QAIF PCM platform support by adding component
registration and trigger handling for DMA interrupts. It sets up IRQ
dispatching for AIF and CIF DMA handlers, manages stream starting/stopping,
and retrieves the IOMMU stream ID during probe.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> index a64bbd7f6fe56..1da50a834b786 100644
> --- a/sound/soc/qcom/qaif-platform.c
> +++ b/sound/soc/qcom/qaif-platform.c

[ ... ]

> +int asoc_qcom_qaif_platform_register(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> +	struct of_phandle_args iommu_spec;
> +	u32 sid;
> +	int ret;
> +
> +	if (!drvdata->variant->alloc_stream_dma_idx ||
> +	    !drvdata->variant->free_stream_dma_idx)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Variant missing mandatory callbacks\n");
> +
> +	ret =3D of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +					       "iommus", 2, 0,
> +					       &iommu_spec);

[Severity: High]
Is it safe to hardcode 2 cells for the "iommus" property here?

This will deterministically fail to probe on platforms where the target
IOMMU uses #iommu-cells =3D <1>, which is very common for ARM SMMUs passing
a single Stream ID.

Should this use of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
"#iommu-cells", 0, &iommu_spec) instead to correctly determine the cell
count from the target IOMMU node?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-b4-qaif-sh=
ikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com?part=3D8
