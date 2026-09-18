Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B01F4FE2CE
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740467; cv=none; b=r8PJFdQH51ob+IYH76xfjk85Y4ONKy/66tTUF0CTiYg5hUiKDiDcQw/BxAi2ysyNWFPLrkTDZj8kypruGPT5D8QzCnUjAbhw7GPezt1rmaXSVLfH8zRmdjwy83Uq+7uHBAvfqptWbElsAuZNEtUdPUPfVU8HJ6t74YSAds2G9yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740467; c=relaxed/simple;
	bh=vlSdCUQ+UXUrjpZKGUj/KS/xNilO1ecxEJbZr2xH/6Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZX3CJaCTs9Lj0hPNcxc6Qc9EaPjPIx2IWcjkEGRHnvzVY9dfstNC4eszYfSTcODSpsLBlYTzQYDjXxC+SaK/P6KkmH8JxThd8nFyCKwQ0sR9c+1wlv5+YxLkUEy1ebSruesVM/OjnEOOTjfjMlX4+PRYeXzud5lG9/6Fa5kFvZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6aysnrw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6aysnrw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984E21F000FF;
	Fri, 18 Sep 2026 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789740465;
	bh=EB9MRWNFsvd4V1N82s0ToYQJrmgozv65UWQ/Tkt4DTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N6aysnrw+lxdCpGYly9SesEoIOps0YWjLVIVCzuzjCwpr80JKpL5W8bKwYdFNxgdO
	 AKyrbvqbHWY5R3DwH5CInJeXM++RqOwOIhrxc6C3k+5qV9B3RoAxEV38UNy4IdSU/j
	 EAun5dCiv73O4+u1JHul5vIWRp6TzIIX62bYgzRHccmn3nq7Wioh9CWG+1ttkZhDrM
	 Y2XD6Wbdmq9e/u2HdLx0nnWeyg/BpXbO2JTaNoKV5HeD8VP3jDvtAdFTMNXKjba+sT
	 6hK6Z38lAt5zBXbA9nVDWYoWt06iXo4CWyTrSzTjL9bwr+eb3b7SnGp7lEXCj8b4u2
	 dOzyDU7ZAZ1Cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] ASoC: qcom: q6apm-dai: add SCM buffer assignment
 for mDSP platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-vmid-v3-v3-3-f1cbf47bf173@oss.qualcomm.com>
References: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
 <20260918-vmid-v3-v3-3-f1cbf47bf173@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 14:07:45 +0000
Message-Id: <20260918140745.984E21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: qcom: missing SCM memory assignment for compressed streams
- [Medium] ASoC: qcom: PCM buffer allocation exceeds reserved memory limits
--

commit 649b8a689f5d756ca2e792c97278213430b739cd
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms

This commit introduces SCM buffer assignment to grant the modem DSP (mDSP)
access to audio memory regions. It adds logic to dynamically assign the
control-path carveout and per-stream data-path buffers on platforms where
the DSP runs in a stage-2 protected context.

> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6ap=
m-dai.c
> index 033197bdd8705..8fa8ef774c4bc 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
[ ... ]
> @@ -603,6 +708,17 @@ static int q6apm_dai_pcm_new(struct snd_soc_componen=
t *component, struct snd_soc
>  		if (ret)
>  			return ret;
> =20
> +		if (pdata->use_scm_assign) {
> +			ret =3D q6apm_dai_scm_assign(pdata,
> +						   substream->dma_buffer.addr,
> +						   ALIGN(size, PAGE_SIZE));

[Severity: High]
While SCM assignment is properly handled for PCM streams here, is a similar
call to q6apm_dai_scm_assign missing for compressed audio streams?

In q6apm_dai_compr_open, the driver allocates a DMA buffer for the compress
stream without calling the SCM assignment function:

	ret =3D snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size,
				  &prtd->dma_buffer);

If this buffer isn't assigned before exposing it to the hardware, wouldn't
this cause a stage-2 protection fault when the modem DSP attempts to read
the compressed audio stream on mDSP platforms?

> +			if (ret) {
> +				dev_err(component->dev,
> +					"SCM assign buffer failed: %d\n", ret);
> +				return ret;
> +			}
> +		}
> +
>  		ret =3D q6apm_dai_memory_map(component, substream, graph_id, is_push_p=
ull);
[ ... ]
> @@ -1029,12 +1157,104 @@ static int q6apm_dai_probe(struct platform_devic=
e *pdev)
[ ... ]
> +			rc =3D devm_add_action_or_reset(dev,
> +						      q6apm_dai_reserved_mem_release,
> +						      dev);
> +			if (rc)
> +				return rc;
> +
> +			pdata->reserved_buf_size =3D
> +				min_t(size_t, per_stream - POS_BUFFER_BYTES,
> +				      BUFFER_BYTES_MAX);

[Severity: Medium]
Does this calculation fail to account for the additional PAGE_SIZE padding
that is unconditionally added during stream allocation?

In q6apm_dai_pcm_new, the final allocation size includes PAGE_SIZE when the
reserved memory pool is present:

	if (pdata->has_reserved_mem)
		size =3D pdata->reserved_buf_size + PAGE_SIZE;

If the reserved pool is tightly sized based on the per_stream limits,
wouldn't adding PAGE_SIZE to each stream cause the total allocation to
exceed the memory pool budget? Could this lead to an allocation failure
when opening the maximum allowed number of concurrent streams?

> +			pdata->has_reserved_mem =3D true;
> +		}
> +	}
> +
>  	dev_set_drvdata(dev, pdata);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-vmid-v3-v3=
-0-f1cbf47bf173@oss.qualcomm.com?part=3D3
