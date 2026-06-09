Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9BD35F16C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 06:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988205; cv=none; b=Bnx1p66rbT0ja+0MgjnL/RV9z4nPBJsJXh+S6pf0sf7h6yXmDH6NDNHskBLDzfJ+a6crAA7c+g1HojXDCgTDpRoVnsHxI/6NWO1De8l3pGXMEdyeWmOYPRWtPwAOD8QYoGEObXfb107g7HzuNfLuNwSrwWGm2xtrXmdqV4Dovzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988205; c=relaxed/simple;
	bh=E5arg94jXabXu3wu2KEPwKg5c6ARsGdKIyTctwKj47Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IV4o+C4hJwi4q3F3CbcXoUR8fEoxNfDBJBUqaByXl7tMwE1JGCOYkzVGg7G5kDm0EqSKztQF0ZK2fVRwUAyMK/7GiUcEhjohKKw/5K9lsoOtveIl3Yi0KvFL8tpRccBCHOl+sQT7DngHF+vqfvv4Lesg5IoMFq/Y/jMPTUYcqas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drcRkqmb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drcRkqmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDA61F00893;
	Tue,  9 Jun 2026 06:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780988204;
	bh=PlahEwihaumc99Wlg58HWG+8+lLpXjiWzBqfxRT8LJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=drcRkqmbjecXq6RO3g5L86spz++K45uA8Er8qUzfRDZ0nnBSpdHIjnYdiyKV3aPVW
	 wH7sK5eLdStiNKNGUEoX8p1+fZcUkDVCqKrYwlicrCV3qOf2CG3dUTTUAuUpwYRR78
	 PaJ1/g0AZe6QRsS2/pR5wl+XDjPzKrEGF7db7Qhfo4zdXkYpuRVC7PSLSKUqKKza3E
	 C45QZn8oslHgetcFxRGWo1mIWG6po7i4jROq4ghDYpmqhCRu/Z9BS9iW9zfxls7VIL
	 yEScfuISCh96XaLn9t5AVQBRO4E6w3/r6h62a5nlDehw5uf+W65CncXJU0dpisLtzo
	 2J5PN9EY3MZvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] ASoC: qcom: q6apm-dai: add VMID-based SCM
 assignment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609064038.492641-3-ajay.nandam@oss.qualcomm.com>
References: <20260609064038.492641-3-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 06:56:43 +0000
Message-Id: <20260609065644.2DDA61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Passing a DMA address (IOVA) to TrustZone instead of a physica=
l address causes arbitrary memory permission corruption.
- [Critical] If SCM unassign fails, the physical memory is freed back to th=
e kernel while the DSP retains RW permissions, creating a severe memory cor=
ruption vulnerability.
- [High] The SCM memory assignment size truncates the actually allocated bu=
ffer size, omitting the required DSP bug workaround page and the push-pull =
position buffer.
- [High] Compress audio streams are completely excluded from VMID SCM assig=
nment, causing playback/capture faults.
- [High] Component-wide SCM assignment state breaks support for multiple DA=
Is, leading to SMMU faults and active memory unassignment.
- [High] Double unmap of DSP memory on pcm_new failure due to manual cleanu=
p overriding the ALSA core pcm_free sequence.
--

commit c8f968a876b0a04c1d6a29dfdfb22332fde3da72
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

ASoC: qcom: q6apm-dai: add VMID-based SCM assignment

This commit adds optional VMID-based SCM memory assignment for q6apm
fixed PCM DMA buffers. It introduces a use_scm_assign flag and
assign/unassign handlers to grant the DSP shared ownership of the DMA
buffers when the qcom,vmid DT property is present.

> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6ap=
m-dai.c
> index bf1f872a09f45..ae7bcf9802367 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
[ ... ]
> @@ -83,10 +86,106 @@ struct q6apm_dai_rtd {
>  	bool notify_on_drain;
>  };
> =20
> +struct q6apm_scm_region {
> +	phys_addr_t dma_addr;
> +	unsigned int size;
> +	u64 src_perms;
> +	bool assigned;
> +};
> +
>  struct q6apm_dai_data {
>  	long long sid;
> +	int num_vmids;
> +	u32 vmids[Q6APM_MAX_VMIDS];
> +	bool use_scm_assign;
> +	struct q6apm_scm_region scm_regions[SNDRV_PCM_STREAM_LAST + 1];
>  };

[Severity: High]
Is it safe to store the SCM assignment state globally per component?

If multiple playback DAIs are opened, q6apm_dai_assign_memory() might
see scm_region->assigned as true from the first DAI and silently skip
assigning the second DAI's buffer. If the first DAI is subsequently closed,
the memory could be unassigned while the second DAI is still actively
using its buffer. Should this state be tracked per-substream or per-DAI
instead?

[Severity: High]
Are compress audio streams intentionally excluded from VMID SCM assignment?

The VMID assignment appears to be integrated exclusively into the standard
PCM path. Compress audio streams allocate their own DMA buffers in
q6apm_dai_compr_open() using snd_dma_alloc_pages(), but they never seem
to get assigned to the configured VMIDs. Could this trigger a secure Stage-2
memory protection fault on platforms requiring VMID assignment?

[ ... ]
> +static int q6apm_dai_assign_memory(struct snd_pcm_substream *substream,
> +				   struct q6apm_dai_data *pdata)
> +{
[ ... ]
> +	scm_region->dma_addr =3D substream->dma_buffer.addr;
> +	scm_region->size =3D ALIGN(BUFFER_BYTES_MAX, PAGE_SIZE);
> +	scm_region->src_perms =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> +
> +	ret =3D qcom_scm_assign_mem(scm_region->dma_addr, scm_region->size,
> +				  &scm_region->src_perms, dst_vmids, dst_count);

[Severity: Critical]
Does substream->dma_buffer.addr contain an IOVA rather than a physical addr=
ess?

If an IOMMU is present, passing an IOVA to qcom_scm_assign_mem() can cause
issues since TrustZone modifies Stage-2 translation tables, which strictly
operate on physical addresses. Passing an IOVA could instruct the hypervisor
to restrict physical memory that numerically matches the IOVA, leading to
memory permission corruption of arbitrary pages.

[Severity: High]
Does this hardcoded assignment size omit the extra workaround page and the
push-pull position buffer?

In q6apm_dai_pcm_new(), the allocated buffer size is calculated as
BUFFER_BYTES_MAX plus an extra PAGE_SIZE, and an additional POS_BUFFER_BYTES
if push-pull mode is active. Since the SCM assigned size is hardcoded to
ALIGN(BUFFER_BYTES_MAX, PAGE_SIZE), it seems the extra padding page and
position buffer might remain without correct SCM permissions.

[ ... ]
> +static int q6apm_dai_unassign_memory(struct snd_soc_component *component,
> +				     struct snd_pcm_substream *substream,
> +				     struct q6apm_dai_data *pdata)
> +{
[ ... ]
> +	ret =3D qcom_scm_assign_mem(scm_region->dma_addr, scm_region->size,
> +				  &scm_region->src_perms, &hlos, 1);
> +	if (!ret) {
> +		scm_region->assigned =3D false;
> +		scm_region->src_perms =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> +	} else {
> +		dev_err(dev, "Failed to unassign DMA buffer %pa from VMIDs: %d\n",
> +			&scm_region->dma_addr, ret);
> +	}
> +
> +	return ret;
> +}

[Severity: Critical]
If qcom_scm_assign_mem() fails, does returning the error code allow the ALSA
core to subsequently free the physical DMA buffer back to the kernel?

If the unassign fails, the code merely logs an error and returns. Since
q6apm_dai_pcm_free() ignores this return value, the ALSA core could free
the buffer while the DSP retains architectural RW permissions to the freed
memory. Could this allow the DSP to arbitrarily corrupt kernel or userspace
memory that later reuses these pages? Should the memory be intentionally
leaked instead if it cannot be successfully unassigned?

[ ... ]
> @@ -606,6 +706,14 @@ static int q6apm_dai_pcm_new(struct snd_soc_componen=
t *component, struct snd_soc
>  		ret =3D q6apm_dai_memory_map(component, substream, graph_id, is_push_p=
ull);
>  		if (ret)
>  			return ret;
> +
> +		if (pdata->use_scm_assign) {
> +			ret =3D q6apm_dai_assign_memory(substream, pdata);
> +			if (ret) {
> +				q6apm_dai_memory_unmap(component, substream);
> +				return ret;
> +			}
> +		}
>  	}

[Severity: High]
Does this manual call to q6apm_dai_memory_unmap() cause a double-free on the
DSP?

If q6apm_dai_assign_memory() fails, the driver manually calls
q6apm_dai_memory_unmap(). However, the ALSA framework inherently handles
pcm_new failures by tearing down the sound card components, which invokes
q6apm_dai_pcm_free(). This callback unconditionally calls
q6apm_dai_memory_unmap() again, which might result in a duplicate unmap
command sent to the DSP firmware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609064038.4926=
41-1-ajay.nandam@oss.qualcomm.com?part=3D2
