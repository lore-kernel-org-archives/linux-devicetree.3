Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58EE4A2E1A
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784719; cv=none; b=YqH29hYdJ9IanfzJ+TPi8nE+Mn2mUm9gp3rSRBc/pJDSBvMD/J728dSwpy5xat/HTVN+r+ldzk1w/iZNaPhux17dCOQm0XBkZ7B9HwqIinoUAdv6IhC903NFb9FaGx1nncbCmcMd7R4jAv2cJiym/coL2sbor11wazadhnK5dl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784719; c=relaxed/simple;
	bh=adNkSdPYFLq51KL/S+dIOQoKdNPTEAihS3sd4EzzXhQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z5bcLpMoq4CykzwAMaOe0MTi16Sb/XeEbm5s8zBZZBeAcyqhy/50P6rs49i21a/7e2BY4ijvpB9oxyaidOFEWat9EUXBF21Z+LF02UechH8pupPeEKwC2vgs83ISa6/uDG6PfQpfDhjCdIUecYo3clxxHFHyOq7rqMAaeFL8P3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKBuv5+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKBuv5+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E4B1F00A3D;
	Mon,  7 Sep 2026 12:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788784717;
	bh=R5BvB93hdW5Qs0MT/+Bu+UZNp61RQsiADWh350keb00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nKBuv5+P+mAWs3O0C75eDh4DtHgQvkDwWsvwPA9f7ulDZRScl6u1pTyJaaNeyKO3u
	 Me+zrSvKyDRV8wbHlGUkjn5F5dDWdlEWKBFHTuZdZZur6qbR4t9nsKXBQLIeD7v0OS
	 W1nN5pEXlCtJdA76u5CpkWF5Cz0GchXcRu7Nvxb7ydzZjg8AO3XLm0QKBevPpObUqN
	 qx/FT0GxYjrDjq6Zdn3IGYHw6BkDC8IW35ABzDYSv1mwMQLWtJYzHf2zl9uY7Zp1Q4
	 6UX0OIpLt8BmZ7+OlcH3jXRf5reTpri8knsC9qLhJTcZoPKYbCiLYJ4zXV5/0x3Eft
	 U/mcK0rY9vLoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/10] ASoC: qcom: Add QAIF PCM operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-7-6d8ad9ba5c9f@oss.qualcomm.com>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-7-6d8ad9ba5c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:38:36 +0000
Message-Id: <20260907123837.40E4B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Dangling pointers left in persistent substream->dma_buffer on clos=
e and error paths, leading to a Double-Free memory corruption.
- [Medium] Large order-5 contiguous DMA buffer allocation in open() callbac=
k is highly prone to failure due to memory fragmentation.
--

commit e38dec114f51cf2a17be9cb465b247a4bd24cc25
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF PCM operations

This commit adds ALSA SoC PCM platform driver callbacks for Qualcomm Audio=
=20
Interface (QAIF) devices. It provides open, close, hw_params, prepare, and=
=20
pointer operations, and handles DMA buffer allocation and mmap/copy support=
=20
for playback and capture streams.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> new file mode 100644
> index 0000000000000..a64bbd7f6fe56
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-platform.c
[ ... ]
> +static int qaif_platform_pcmops_open(struct snd_soc_component *component,
> +				     struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct snd_soc_pcm_runtime *soc_runtime =3D snd_soc_substream_to_rtd(su=
bstream);
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	unsigned int dai_id =3D cpu_dai->driver->id;
> +	struct snd_dma_buffer *buf =3D &substream->dma_buffer;
> +	struct qaif_dma_mem_info *dma_mem_info;
> +	struct qaif_pcm_data *data;
> +	int ret, stream_dma_idx, dma_reg_idx, dir =3D substream->stream;
[ ... ]
> +	dma_mem_info =3D kzalloc(sizeof(*dma_mem_info), GFP_KERNEL);
> +	if (!dma_mem_info) {
> +		ret =3D -ENOMEM;
> +		goto err_free_data;
> +	}
> +	dma_mem_info->alloc_size =3D qaif_platform_hardware.buffer_bytes_max;
> +	dma_mem_info->vaddr =3D dma_alloc_coherent(component->dev,
> +						 dma_mem_info->alloc_size,
> +						 &dma_mem_info->dma_addr,
> +						 GFP_KERNEL);

[Severity: Medium]
Is it safe to perform a large contiguous allocation dynamically during the=
=20
stream open callback?=20

On a system that has been running for some time, memory fragmentation might=
=20
cause this order-5 (120 KB) dma_alloc_coherent() call to fail with -ENOMEM,=
=20
which would prevent the stream from opening. ALSA patterns generally avoid=
=20
this by pre-allocating DMA buffers during driver probe via=20
snd_pcm_set_managed_buffer_all().

> +	if (!dma_mem_info->vaddr) {
> +		ret =3D -ENOMEM;
> +		goto err_free_mem_info;
> +	}
[ ... ]
> +	buf->bytes =3D qaif_platform_hardware.buffer_bytes_max;
> +	buf->addr =3D dma_mem_info->dma_addr;
> +	buf->area =3D (unsigned char *)dma_mem_info->vaddr;
[ ... ]
> +	snd_pcm_set_runtime_buffer(substream, buf);
[ ... ]
> +static int qaif_platform_pcmops_close(struct snd_soc_component *componen=
t,
> +				      struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime =3D snd_soc_substream_to_rtd(su=
bstream);
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	struct qaif_pcm_data *data =3D substream->runtime->private_data;
> +	struct qaif_dma_mem_info *dma_mem_info;
> +	unsigned int dai_id =3D cpu_dai->driver->id;
[ ... ]
> +	if (dma_mem_info) {
> +		dma_free_coherent(component->dev, dma_mem_info->alloc_size,
> +				  dma_mem_info->vaddr, dma_mem_info->dma_addr);
> +		kfree(dma_mem_info);
> +	}
> +
> +	snd_pcm_set_runtime_buffer(substream, NULL);

[Severity: High]
Does this leave a dangling pointer in the persistent substream->dma_buffer=
=20
structure that could result in a double-free memory corruption?

The dynamically allocated memory is assigned to the persistent=20
substream->dma_buffer (via the local buf pointer) during=20
qaif_platform_pcmops_open().

While snd_pcm_set_runtime_buffer(substream, NULL) correctly clears the=20
pointers in the runtime structure, it leaves substream->dma_buffer.area=20
pointing to the memory that was just freed here by dma_free_coherent().=20

When the ALSA PCM device is later unregistered (e.g. during driver unbind=20
or module unload), the ALSA core calls snd_pcm_lib_preallocate_free_for_all=
(),=20
which sees that dma_buffer.area !=3D NULL and attempts to free it again usi=
ng=20
snd_dma_free_pages().=20

Should the persistent buffer pointers be explicitly cleared here to avoid=20
the double-free?

> +	substream->runtime->private_data =3D NULL;
> +
> +	kfree(data);
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-b4-qaif-sh=
ikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com?part=3D7
