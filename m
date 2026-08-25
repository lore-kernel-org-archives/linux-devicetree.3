Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7740B3B5854
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 18:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787684241; cv=none; b=TPmnqg6VX+dnPmPK1XzLlL/RRqWlYHzhgQuS+0l1cGolkFpDF4e5fWjWrt8WTXn6XHsQqASKQyzzXY8iA/Gi+g8elni1u5/shgxYHgcqIdieu73pMIEwqIpvZU7lzDn54G02yjsABWl31PqtJUFYoDVDrOzi57q4eu+lI4x6zK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787684241; c=relaxed/simple;
	bh=1M9oN/0N1P4CqfFH/NmUthgmfarydOtpYzRoqS2eUxg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aCpj7q3neQMkfcgMFzjM0AuQT6gmvtQd5DpW9UUdg0xQ/dOZT9Q7bwfo7+UNjq2D0D+fqCJaIfvNbsitkpLVvLXcr7aRJMUN69K1LO3XUlI1ITJ67RkQKXi8DJHW+UsJ+fju7ykAhcY5g+Kk8h8kt+hBzdY53HNF/L8S8422erM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDozA0lJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDozA0lJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EBC1F000E9;
	Tue, 25 Aug 2026 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787684237;
	bh=9oTJiFEzIcOGs1c60xERcY4Ai/OsryroF3qkhdcZITM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KDozA0lJvH2tKasVONrWqpxzISUoePac2gdbQVHpF8GYoJBQeZZE9GNYkmPKCH4MT
	 G4Pylfhu+CnBasMCxiOS3BzJ+LmMhVKRHA1wav9kbGPzSe4fDkJjdbHllIWJZcz21u
	 CrAvxIye+fTDTwDRJwFmJFH51ZK4BE7JjZvWWdWv7oDaddad9JkOF2WILZfUQmSTHe
	 sy5SEc/7Z4D61NpXBJbQ53EaxIiKxwnUtjo9oTF4ISkNnxlp+hbJTE9De82/TOIB8d
	 vH+vgINnb1ZVq9Iz7xg22c3+/JSEg7zfTcw6eMJJcCTY1cuKyZvwbQDwB5EGB57PVN
	 tCs8EUBysELNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-dai: add VMID-based SCM
 assignment for mDSP buffers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-a2a-shikra-vmid-v5-v2-2-c3dc62354eee@oss.qualcomm.com>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-2-c3dc62354eee@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 18:57:16 +0000
Message-Id: <20260825185717.38EBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The DMA buffer allocation strictly limits the size to `reserved_bu=
f_size`, entirely omitting the required `POS_BUFFER_BYTES` for push-pull mo=
de streams. The position buffer calculation then points out-of-bounds, corr=
upting adjacent allocations in the DMA pool.
- [High] Compressed audio streams bypass SCM memory assignment completely, =
causing Stage-2 faults on protected targets.
- [High] Hardcoded Q6APM_MAX_CARVEOUTS limit breaks sound card probe for to=
pologies with more than 2 DAIs.
- [High] A failed SCM unassign in the non-reserved memory path allows the S=
tage-2 protected memory to be returned to the system page allocator, leadin=
g to kernel panics upon reallocation.
- [Medium] SCM VMID assignment leak on probe error path permanently locks o=
ut HLOS memory access.
- [Medium] Missing runtime buffer size constraint for capture streams when =
using reserved memory.
--

commit 57510541fbc0081167c27ca31e55e5b8fd89730c
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: ASoC: qcom: q6apm-dai: add VMID-based SCM assignment for mDSP buff=
ers

This commit adds VMID-based SCM assignment for memory buffers on platforms
with an mDSP. It parses the qcom,vmids property and assigns memory to HLOS
and consumer VMIDs to allow the DSP to access PCM buffers.

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-=
dai.c
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -84,9 +96,123 @@ struct q6apm_dai_rtd {
 };
[ ... ]
> +static void q6apm_dai_scm_unassign_addr(struct q6apm_dai_data *pdata,
> +					phys_addr_t addr)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < pdata->num_carveouts; i++) {
> +		if (pdata->carveout_regions[i].addr !=3D addr)
> +			continue;
> +
> +		q6apm_dai_scm_unassign(&pdata->carveout_regions[i], pdata);
> +		if (pdata->carveout_regions[i].assigned)
> +			return;	/* reclaim failed: keep tracking, warned already */

[Severity: High]
If restoring HLOS permissions fails in q6apm_dai_scm_unassign_addr(), it re=
turns
early while leaving the buffer marked as assigned to the DSP.

However, looking at q6apm_dai_pcm_free(), which calls this function during =
PCM
destruction, the failure is ignored since the callback returns void.
Won't the ALSA core then proceed to blindly free this Stage-2 protected mem=
ory
back to the system page allocator? This could lead to a kernel panic when t=
he
kernel later attempts to reuse the memory.

[ ... ]
> @@ -409,8 +535,11 @@ static int q6apm_dai_open(struct snd_soc_component *=
component,
>  	}
> =20
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		size_t buf_max =3D pdata->has_reserved_mem ?
> +				 pdata->reserved_buf_size : BUFFER_BYTES_MAX;
> +
>  		ret =3D snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFE=
R_BYTES,
> -						   BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
> +						   BUFFER_BYTES_MIN, buf_max);

[Severity: Medium]
This constraint restricts the buffer size to the reserved memory limit, but=
 it
appears to be gated entirely behind a check for playback streams.

Are capture streams also supposed to be constrained when using reserved mem=
ory?
Without it, userspace might request a capture buffer larger than the reserv=
ed
DMA pool slice, leading to unexpected -ENOMEM errors.

[ ... ]
> @@ -431,17 +560,18 @@ static int q6apm_dai_open(struct snd_soc_component =
*component,
>  	}
> =20
>  	runtime->private_data =3D prtd;
> -	runtime->dma_bytes =3D BUFFER_BYTES_MAX;
>  	if (pdata->sid < 0)
>  		prtd->phys =3D substream->dma_buffer.addr;
>  	else
>  		prtd->phys =3D substream->dma_buffer.addr | (pdata->sid << 32);
> =20
>  	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
> +		size_t buf_sz =3D pdata->has_reserved_mem ?
> +				pdata->reserved_buf_size : BUFFER_BYTES_MAX;
>  		void *pos_buffer;
> =20
> -		prtd->pos_phys =3D prtd->phys + BUFFER_BYTES_MAX;
> -		pos_buffer =3D (void *)(substream->dma_buffer.area + BUFFER_BYTES_MAX);
> +		prtd->pos_phys =3D prtd->phys + buf_sz;
> +		pos_buffer =3D (void *)(substream->dma_buffer.area + buf_sz);
>  		prtd->pos_buffer =3D (struct sh_mem_pull_push_mode_position_buffer *)(=
pos_buffer);
>  	}

[ ... ]
> @@ -599,13 +741,46 @@ static int q6apm_dai_pcm_new(struct snd_soc_compone=
nt *component, struct snd_soc
>  		if (is_push_pull)
>  			size +=3D POS_BUFFER_BYTES;
> =20
> -		ret =3D snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, componen=
t->dev, size);
> +		if (pdata->has_reserved_mem)
> +			ret =3D snd_pcm_set_managed_buffer_all(pcm,
> +							     SNDRV_DMA_TYPE_DEV, component->dev,
> +							     pdata->reserved_buf_size,
> +							     pdata->reserved_buf_size);
> +		else
> +			ret =3D snd_pcm_set_fixed_buffer_all(pcm,
> +							   SNDRV_DMA_TYPE_DEV, component->dev,
> +							   size);

[Severity: High]
When using reserved memory for push-pull streams, the managed buffer size i=
s set
strictly to pdata->reserved_buf_size, completely omitting the extra overhead
required for POS_BUFFER_BYTES.

However, looking back at q6apm_dai_open(), the position buffer is mapped to:
pos_buffer =3D (void *)(substream->dma_buffer.area + pdata->reserved_buf_si=
ze);

Since the allocation doesn't account for this extra size, does this pointer
now access out-of-bounds virtual memory immediately following the allocated
chunk? This seems like it could corrupt adjacent allocations in the DMA poo=
l.

[ ... ]
> +		if (pdata->use_scm_assign && !pdata->has_reserved_mem) {
> +			struct q6apm_scm_region *r;
> +
> +			if (pdata->num_carveouts >=3D Q6APM_MAX_CARVEOUTS) {
> +				dev_err(component->dev,
> +					"too many SCM carveouts (max %d)\n",
> +					Q6APM_MAX_CARVEOUTS);
> +				q6apm_dai_memory_unmap(component, substream);
> +				return -ENOSPC;
> +			}

[Severity: High]
This dynamically adds a carveout for every PCM substream but rigidly caps t=
he
limit at Q6APM_MAX_CARVEOUTS (which is defined as 2).

Does this arbitrarily restrict the entire sound card to only 2 PCM streams?
Standard configurations often instantiate multiple DAIs with both playback =
and
capture streams. Would a third PCM stream creation fail probe with -ENOSPC?

[ ... ]
> @@ -1017,23 +1206,161 @@ static const struct snd_soc_component_driver q6a=
pm_fe_dai_component =3D {
[ ... ]
> +		if (pdata->num_carveouts) {
> +			for (i =3D 0; i < pdata->num_carveouts; i++) {
> +				rc =3D q6apm_dai_scm_assign(&pdata->carveout_regions[i],
> +							  pdata);
> +				if (rc) {
> +					dev_err(dev,
> +						"SCM assign carveout[%d] failed: %d\n",
> +						i, rc);
> +					return rc;
> +				}
> +			}
> +			rc =3D devm_add_action_or_reset(dev,
> +						      q6apm_dai_unassign_all,
> +						      pdata);

[Severity: Medium]
If q6apm_dai_scm_assign() succeeds for the first carveout but fails during a
subsequent iteration, does this early return leak the earlier assignment?

The cleanup action (devm_add_action_or_reset) hasn't been registered yet,
so we might permanently lose HLOS access to that reserved memory region if
probe fails partway through this loop.

[ ... ]

Looking at q6apm_dai_compr_open() which handles compressed audio streams:

static int q6apm_dai_compr_open(struct snd_soc_component *component,
				struct snd_compr_stream *stream)
{
[ ... ]
	size =3D COMPR_PLAYBACK_MAX_FRAGMENT_SIZE * COMPR_PLAYBACK_MAX_NUM_FRAGMEN=
TS;
	ret =3D snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size, &prtd->dma_buff=
er);
[ ... ]
}

[Severity: High]
For compressed streams, the DMA buffer is allocated from system memory via
snd_dma_alloc_pages() but never appears to be assigned via q6apm_dai_scm_as=
sign().

Since the DSP on these platforms requires explicit VMID assignment to access
memory, will this omission cause a Stage-2 permission fault or DSP crash wh=
en
attempting to play compressed audio?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-a2a-shikra=
-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com?part=3D2
