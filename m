Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7C843CECB
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147070; cv=none; b=FsIJ2dbGFvlSpBIDSGJycWwICP9ruJFX6Ts536cuI94iL1ZkR5MjQoVDs4zYMIFIpBNmGA8WPXh+g+MLnyyYr3xraUhyNAADdDMGFeM2/a6b3ddzBwm9Yk2oEoMIPayJgKVeeQF3aNm96mho83+iqUnhqepEjVpoLrK7OoihWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147070; c=relaxed/simple;
	bh=lPWkcUH7bnXryrR825fbrnS7/vstqi45qf6RAg/tn5c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SURsO2GPFx5IEo/AD0Z9jU/fj1oV7A/ZaARbzGD3z0tCBxwZSpUCQMp1vDP0Do0Y8atllyKHsM8gdZcifGaQQl747nQQQv3R3JOIDCZg28fgysI6bQEdU1NrBl3ApVKANJwOGtKUW7Gehu7lwY9Yfhz/wTMvs0ElD8BVl2rUY14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxOmtgWF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxOmtgWF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0771F000FF;
	Wed, 23 Sep 2026 07:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790147068;
	bh=8pZApPRNtabiMREtUfB6SbIt+2ellueOX/i2myXqT9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fxOmtgWFDsSEwtw1lXNwO6TfoCiVzbqEPbC+1nZS10Z2wj7bX32ZZj72DSvUrkUjZ
	 ot6gJkDsq4L/DNu2uuOCisvS+aACSfDgQOcyz0XOkzaD6IXWd+Fd3eMmhjY2TkjOV1
	 8B08kh12sv6n7/ztMW4YHdndbr7c6rZOe0a9oZN2q3LPM1ALMQN+iy/lJkjANMsIhQ
	 TDDfHorohpqBLtqo0xIOdP+eTg8vcymEwVO/fOGyvh4opf+qi1RwwFZ1DWtSdVDmV4
	 KmfCk6amLi2kpaQHF1rBJgFHvbsyLDqbmJ7CamKkFQgUZdb5W4ntBVe5XXp8+9lCvP
	 EtIp5Z54EGesA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/10] ASoC: qcom: Add QAIF IRQ handling and platform
 register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-8-d5b6f056568e@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-8-d5b6f056568e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:04:27 +0000
Message-Id: <20260923070428.5C0771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Uninitialized memory access when reading IOMMU Stream ID
--

commit 033356d64f07f9a066675a08dfb513468fd441a1
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF IRQ handling and platform register

This commit finishes the QAIF PCM platform support so streams can be
registered, started, stopped, and serviced by DMA interrupts. It registers
the ASoC component, requests the QAIF interrupt, and adds trigger handling
to enable or disable DMA and its interrupt sources.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
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
> +	ret =3D of_parse_phandle_with_args(pdev->dev.of_node,
> +					 "iommus", "#iommu-cells", 0,
> +					 &iommu_spec);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to parse iommus property\n");
> +	sid =3D iommu_spec.args[0];

[Severity: Medium]
Could this read uninitialized stack memory if the device tree specifies an
IOMMU node with a zero argument count?

If of_parse_phandle_with_args() succeeds but finds zero arguments, it will
set iommu_spec.args_count to 0 without writing to the iommu_spec.args array.
Reading iommu_spec.args[0] unconditionally would then configure the hardware
with a garbage stream ID from the uninitialized stack, potentially causing
IOMMU context faults and breaking audio DMA.

Does this code need to validate that iommu_spec.args_count is greater than 0
before accessing the arguments array?

> +	of_node_put(iommu_spec.np);
> +	drvdata->smmu_csid_bits =3D sid & QAIF_CSID_MASK;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-b4-qaif-sh=
ikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com?part=3D8
