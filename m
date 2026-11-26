Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675561;
	b=JzPwmdA0KnvgBJ4YSnu5yMvO6tMBbi27n2+o41osFBc9Hq3lG8lmk2I0qgvv06BIsCPm
	 uy2cPptEGtiS8E141mT3N+anwlvGpnBa4Qx/mqhm8KmulZQjV+ptCbQBxZHF9ENa62UTI
	 cn2T6s0ZvYslDiApqRuOeloFutZACTtoWYYal7r71+HA3CEY3rfwC/vxkXV8uCZWF06L0
	 OJYbmWizbGXAqpKMS2K23Jw1PXX2pofq/2EsBc5y8UEmJKnMKE+WkmyOtxCeKCMJNz/Bd
	 uf2S1lc7JL2fVRF/TKbV0DbuHujxGz7UxE+Ozrsne+hKiJdTT74Vy3Oit8TSZr5jLeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675561;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j49d9FkOO/p0dmnZ0Ik6yMSCNkA/jfkYgsf8kQ77ow0=;
	b=0FXI5hasUjzvp3pl3tQJ17krBSqHtreEJL5B0xULGn0wCsC99HHdMqQnCFOqBIxLZPNx
	 XxVvButdhAtOyfe1YwX9/3rAUeb7f02KX8KBLj9BdmgF/T2C3VY9QMAvhSXOSqN3SGXq1
	 +ZAriUT6B0z2A9DpiWYyewEimNEjONtn4RQTKw7ObxP1d3pHalpNn4RRP2rWv0fGztqLf
	 tiSgWnSCgX8BWsA7WvxITEGdqorMLVHXNAlMAmHnGOBnivaB+CmaHOKUudYk62/LaKGG7
	 mTF9pm1X7gi7SgvH2O6OGMb2x5aLkhU/xNCUg9lokTAf2AEkWYRNU8F1REyrptCFTlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kq/BIKQY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1524C606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kq/BIKQY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84BA1F000C4;
	Thu, 26 Nov 2026 06:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795675560;
	bh=j49d9FkOO/p0dmnZ0Ik6yMSCNkA/jfkYgsf8kQ77ow0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kq/BIKQYJ4MD2XyvFkqQDQxkWoN4BF24o3poJNQ5OPIvyH7D/51aWuEavkTAHcVGI
	 VFoDhXzR4Cr+I9u+s1pTyDTJk0bgZ+/sOViVSx3xAUeS38rKvIzoJF9lp3kbqxHtZt
	 sC8kF5Atx1yVPZBkBedpSxIysfpTLvT+7m4DkaGeUqSeugiTpZzbe2rEMenFPDgHzn
	 l1b6v/1+/4g6PtDtGhbRyRIHJBoTo/MORhQGGrdGsf7us7nR2+jNHS0j3LBzHfXSKx
	 BDgm9LUjUqlP37nftyiA2FVD7PlTA7be9o7rbKB9kKoBAlsX7OWrO2et1jP4X5W7Bs
	 jg35zLvdWgtIw==
Message-ID: <sashiko-outbox-234899@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/21] drm/msm/dcp: Add generic HFI display commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jayant Shekhar" <jayant.shekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-8-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
 <20261126-jshekhar-v3-dcp-v3-8-f1e9d7505039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:45:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/msm/dcp: completion zeroing and unlocked caps_cache in
  dcp_hfi_kms.c
- [High] drm/msm/dcp: pipe count clobbering in
  dcp_hfi_parse_init_caps_kv()
- [Low] drm/msm/dcp: uninitialized stack buffer in
  dcp_hfi_log_pipe_ids()
--

commit 493628efb4ff9c95ef6c5374bcbb496f98a1b513
Author: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

drm/msm/dcp: Add generic HFI display commands

This commit adds HFI display command helpers for CRTCs, planes, encoders,
device initialization, and capability parsing in the DCP driver.

> diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c b/drivers/gpu/drm/msm/=
dcp/dcp_hfi_kms.c
> new file mode 100644
> index 0000000000000..82a7fb420e650
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c
> @@ -0,0 +1,325 @@

[ ... ]

> +static void dcp_hfi_caps_cache_init(struct dcp_hfi_caps_cache *cache)
> +{
> +	init_completion(&cache->device_done);
> +	init_completion(&cache->display_done);
> +}
> +
> +static void dcp_hfi_caps_cache_start(struct dcp_hfi *hfi)
> +{
> +	memset(&hfi->caps_cache, 0, sizeof(hfi->caps_cache));
> +	dcp_hfi_caps_cache_init(&hfi->caps_cache);
> +}
> +
> +static void dcp_hfi_caps_cache_stop(struct dcp_hfi *hfi)
> +{
> +	memset(&hfi->caps_cache, 0, sizeof(hfi->caps_cache));
> +}

[Severity: High]
Can dcp_hfi_caps_cache_stop() corrupt cache->device_done and
cache->display_done while capability events are still arriving on resp_vq?

memset() zeroes the whole struct dcp_hfi_caps_cache, including both struct
completion objects, setting their wait.task_list pointers to NULL and
zeroing wait.lock without holding hfi->caps_lock.  In
dcp_hfi_get_capabilities(), a timeout on cache->display_done only logs a
warning before jumping to out_free_cache and calling
dcp_hfi_caps_cache_stop() (and timeouts in dcp_hfi_send_device_init() or on
cache->device_done do the same):

CPU0                              CPU1 (resp_vq callback)
dcp_hfi_get_capabilities()
  wait_for_completion_timeout(
    &cache->display_done, ...)
    -> times out
  ...
  dcp_hfi_caps_cache_stop(hfi)
    memset(&hfi->caps_cache, 0, ...)
                                  dcp_hfi_dispatch_event()
                                    spin_lock_irqsave(&hfi->caps_lock)
                                    dcp_hfi_store_caps_payload(...,
                                      &hfi->caps_cache.display_done, ...)
                                      complete(&cache->display_done)
                                        swake_up_locked()
                                          <-- NULL pointer dereference

In swake_up_locked(), list_empty(&q->task_list) evaluates NULL =3D=3D
&q->task_list as false and dereferences NULL when waking the first entry.

In addition, dcp_hfi_dispatch_event() updates hfi->caps_cache under
hfi->caps_lock, whereas dcp_hfi_caps_cache_start(),
dcp_hfi_caps_cache_stop(), and dcp_hfi_get_capabilities() only hold
hfi->caps_cache_lock.  Because VIG_CAPS, DMA_CAPS, VIG_R1_CAPS, and
DMA_R1_CAPS do not signal a completion, dcp_hfi_get_capabilities() can read
and zero those buffers concurrently with dcp_hfi_store_caps_payload().

[ ... ]

> +static void dcp_hfi_parse_init_caps_kv(struct dcp_caps *caps,
> +				       u32 prop_key,
> +				       const u32 *payload,
> +				       u32 max_words)
> +{
> +	u32 prop_id =3D HFI_PROP_ID(prop_key);
> +	u32 count, i;
> +
> +	if (!payload || !max_words)
> +		return;
> +
> +	switch (prop_id) {

[ ... ]

> +	case HFI_PROPERTY_DEVICE_INIT_VIG_INDICES:
> +		if (max_words < 1)
> +			break;
> +		count =3D payload[0];
> +		if (count > max_words - 1)
> +			count =3D max_words - 1;
> +		caps->num_vig_pipes =3D 0;
> +		caps->virt_vig_count =3D 0;
> +		for (i =3D 0; i < count; i++) {
> +			u32 idx =3D payload[1 + i];
> +
> +			if (DCP_REC_ID(idx) =3D=3D 0) {
> +				if (caps->num_vig_pipes < DCP_MAX_SSPP_COUNT)
> +					caps->vig_pipe_ids[caps->num_vig_pipes++] =3D idx;
> +			} else {
> +				if (caps->virt_vig_count < DCP_MAX_SSPP_COUNT)
> +					caps->vig_r1_indices[caps->virt_vig_count++] =3D idx;
> +			}
> +		}
> +		break;
> +	case HFI_PROPERTY_DEVICE_INIT_DMA_INDICES:
> +		if (max_words < 1)
> +			break;
> +		count =3D payload[0];
> +		if (count > max_words - 1)
> +			count =3D max_words - 1;
> +		caps->num_dma_pipes =3D 0;
> +		caps->virt_dma_count =3D 0;
> +		for (i =3D 0; i < count; i++) {
> +			u32 idx =3D payload[1 + i];
> +
> +			if (DCP_REC_ID(idx) =3D=3D 0) {
> +				if (caps->num_dma_pipes < DCP_MAX_SSPP_COUNT)
> +					caps->dma_pipe_ids[caps->num_dma_pipes++] =3D idx;
> +			} else {
> +				if (caps->virt_dma_count < DCP_MAX_SSPP_COUNT)
> +					caps->dma_r1_indices[caps->virt_dma_count++] =3D idx;
> +			}
> +		}
> +		break;

[Severity: High]
Does parsing cache->vig_r1_buf and cache->dma_r1_buf in
dcp_hfi_get_capabilities() wipe out caps->num_vig_pipes and
caps->num_dma_pipes?

Both primary (DCP_REC_ID(idx) =3D=3D 0) and rect-1 (DCP_REC_ID(idx) !=3D 0)=
 pipe
lists use HFI_PROPERTY_DEVICE_INIT_VIG_INDICES and
HFI_PROPERTY_DEVICE_INIT_DMA_INDICES.  Because dcp_hfi_parse_init_caps_kv()
unconditionally zeroes both primary and virtual counts before looping,
parsing vig_r1_buf and dma_r1_buf after vig_buf and dma_buf resets
caps->num_vig_pipes and caps->num_dma_pipes to 0, causing caps->max_planes
to become 0 and dcp_hfi_get_capabilities() to fail with -EINVAL.

[ ... ]

> +static void dcp_hfi_log_pipe_ids(struct device *dev, const char *label,
> +				 const u32 *ids, u32 count)
> +{
> +	char buf[128];
> +	int pos =3D 0;
> +	u32 i;
> +
> +	for (i =3D 0; i < count && pos < (int)sizeof(buf) - 8; i++)
> +		pos +=3D scnprintf(buf + pos, sizeof(buf) - pos,
> +				  "%s0x%x", i ? "," : "", ids[i]);
> +
> +	dev_dbg(dev, "%s: count=3D%u ids=3D[%s]\n", label, count, buf);
> +}

[Severity: Low]
If count is 0, the loop does not run and dev_dbg() prints buf uninitialized
from the stack.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-jshekhar-v=
3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com?part=3D8
