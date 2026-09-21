Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D539020C
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018724; cv=none; b=IhXVJpUjs4HKHHbemc2llkBbX4PQpRR7A87scrQvt577elw2jBGW+tqbXfnJJb6kjhnwsPlOt7XZ4k3bnu0SwhdlGqXrknw/HO+sWXry0fIrpfm/kUSIfELSjXYXGGjP4FU7eddgwe2ASuWxZrL2SQmDNSVu1KA2tDyF0wqMMyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018724; c=relaxed/simple;
	bh=DmrpIYOQ8ExFiAIrHxWd73HalZhaIGVnB1SKMycZENA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wt+5Zh17dwUb+yYqo2zfjvbe4j6Zy5demHC7sS2HFTDrp3xyDmHmmYb3Nuynysw9l0kgbXteFbCj/x0ruQsMtM7iB00EkVEPwizKUVXhNyUfUbUFWQRuNopxwsVenedQjICycIoCVRiH3Ul6++q2m7T23RB01enequBq+Vo0Ts4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYoOtgJ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYoOtgJ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8DE1F00893;
	Mon, 21 Sep 2026 19:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790018723;
	bh=XgfowBqWfVI8oGjE7CgGFevM7mIce17ZANUVlJuO8bA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EYoOtgJ5kfqShW2Tk9XcCweXkMBAgAHlQuk2gsVDathHwYe+Cho0D6cmqfl5RMvjP
	 gmZicIxLktXkPfWlQefn0SEnpUaWJxmJxNzIvX1CavxifFKIDfna9UC8bh/sMy23Uz
	 lpMsgA7nktiqrtE6QY30vY3o+wjBhZVC5JPxzelK3ljFTXIo3rbm5/lBIwCREAa9Dk
	 Gnuy+oDRzP1Ur99IFS42k9PnDIuOrgBBVp/h+uwJhYuocuo94sxHxrXBRHQ1LMhgN5
	 fog784ztoxDR2yuNVRtnYY9uKNdCb6jokDBQTtDg4IhBKYxrlHsxahOsVXuVd7AO9C
	 drgaka6Ygq5iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] ASoC: qcom: q6apm-dai: add SCM buffer assignment
 for mDSP platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922-vmid-v4-v5-4-e79cfd7af5b3@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-4-e79cfd7af5b3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 19:25:22 +0000
Message-Id: <20260921192523.2A8DE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] asoc: qcom: compress stream allocation bypasses reserved pool size=
 limits
- [Medium] asoc: qcom: SCM assignment expands beyond reserved memory bounds
- [Medium] asoc: qcom: memory and graph leak in q6apm_dai_compr_open() erro=
r path
- [Medium] asoc: qcom: capture stream lacks dynamic buffer size constraint
--

commit 8016abb309ec8211ded913589c6a8b5656e3fed2
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms

This commit adds support for mDSP platforms by explicitly assigning PCM buf=
fers
to the appropriate Virtual Machine IDs via SCM calls at probe time and duri=
ng
stream opening. It manages whole-pool assignment for data-path buffers when=
 a
memory region is provided, falling back to per-buffer assignments when no
data-path pool is present.

> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6ap=
m-dai.c
> index 033197bdd8705..8f12b860e1250 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
[ ... ]
> @@ -409,8 +502,11 @@ static int q6apm_dai_open(struct snd_soc_component *=
component,
>  	}
> =20
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		size_t buf_max =3D pdata->has_reserved_mem ? pdata->reserved_buf_size :
> +							   BUFFER_BYTES_MAX;
> +
>  		ret =3D snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFE=
R_BYTES,
> -						   BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
> +						   BUFFER_BYTES_MIN, buf_max);

[Severity: Medium]
Since this constraint is only applied when the stream is
SNDRV_PCM_STREAM_PLAYBACK, capture streams still advertise a static
BUFFER_BYTES_MAX of 512KB. If the reserved memory pool limits reserved_buf_=
size
to something smaller than 512KB, couldn't userspace request a capture size =
up
to 512KB, causing hw_params to fail because the preallocated buffer is too =
small?

>  		if (ret < 0) {
[ ... ]
> @@ -683,6 +814,17 @@ static int q6apm_dai_compr_open(struct snd_soc_compo=
nent *component,
>  	if (ret)
>  		return ret;
> =20
> +	if (pdata->use_scm_assign && !pdata->has_reserved_mem) {

[Severity: High]
When has_reserved_mem is true, the device's DMA allocations are fulfilled f=
rom
the memory-region[1] pool. However, this function unconditionally allocates=
 8MB
(COMPR_PLAYBACK_MAX_FRAGMENT_SIZE * COMPR_PLAYBACK_MAX_NUM_FRAGMENTS) witho=
ut
capping it to pdata->reserved_buf_size like the PCM streams do. Will this
massive allocation immediately exhaust the shared data-path pool, starving =
all
other streams, or fail outright if the pool slice is smaller than 8MB?

> +		ret =3D q6apm_dai_scm_assign(pdata, prtd->dma_buffer.addr,
> +					   ALIGN(size, PAGE_SIZE));
> +		if (ret) {
> +			dev_err(dev, "SCM assign compr buffer failed: %d\n",
> +				ret);
> +			snd_dma_free_pages(&prtd->dma_buffer);
> +			return ret;

[Severity: Medium]
If q6apm_dai_scm_assign() fails here, the driver frees the DMA buffer and
returns directly. Doesn't this bypass freeing the prtd structure (allocated=
 via
kzalloc_obj) and closing the DSP graph (opened via q6apm_graph_open)? The A=
LSA
core does not invoke the .free callback when .open returns an error, so this
appears to cause a permanent memory and graph resource leak.

> +		}
> +	}
> +
[ ... ]
> @@ -1029,12 +1177,122 @@ static int q6apm_dai_probe(struct platform_devic=
e *pdev)
[ ... ]
> +		if (mem_count >=3D 1) {
> +			struct device_node *mem_node;
> +			struct reserved_mem *rmem;
> +
> +			mem_node =3D of_parse_phandle(node, "memory-region", 0);
> +			rmem =3D of_reserved_mem_lookup(mem_node);
> +			of_node_put(mem_node);
> +			if (!rmem) {
> +				dev_err(dev,
> +					"memory-region[0]: lookup failed\n");
> +				return -ENODEV;
> +			}
> +
> +			rc =3D q6apm_dai_scm_assign(pdata, rmem->base,
> +						  ALIGN(rmem->size, PAGE_SIZE));

[Severity: Medium]
SCM assignments modify memory protections at the TrustZone level. Since the
ALIGN macro indiscriminately rounds up the size, what happens if the device
tree provides a carveout size that is not a multiple of PAGE_SIZE? It seems
the driver will request TrustZone to reassign the trailing bytes that belong
to adjacent, unreserved kernel memory, which revokes HLOS access to that
adjacent memory and could cause a kernel crash when accessed by other
subsystems.

> +			if (rc) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-vmid-v4-v5=
-0-e79cfd7af5b3@oss.qualcomm.com?part=3D4
