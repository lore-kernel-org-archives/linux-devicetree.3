Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103403;
	b=znTjXtIrpozdkO7jc5+IRUtaA467hIU95NbbuGWpqZRBxQfu168mgw3wcj8+NkUxh6LX
	 lfXCdQSJ1xcHCLIhnVjWsHqaC4SZQX7gmi5WmC08Va8ObGUhKRRR3ZyFhqh2xQTHEYLk+
	 ek7+XpshIjbVgzM1Om3DoWzY2jDMZ2dOMNB2w/jd9qgzcoqgXdyueGb9eQ0UkAlby34y8
	 2+27665HBr+Qcagy9KXXdWL+R0BLzX9ofwIQXEY6YRGsav+8UZJ/GnO/IEkDG1CwcoiCI
	 BoV3475bDmEHJ9f0sj2vRBFY51V3Vd8O9UwhNH/0N+YMyytq8LS7QwU4zUe1C6FALkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103403;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D19QiGbX6jZXZmEzENtsg4e7fsyT3BenVvif+LHZ+Pc=;
	b=VyxZAO/qH2McK89IdjwfyMJh8pUrTqSpQywkWmpJ6kIikB6OFNOxf0hl/YSXzbL2Fkh/
	 RZlUw2bL9CYQ76AxxnzaC5FgL/flPypSBSf8OLPjPSmFTQRF3HTIbyZeseH0+ELTGud8Q
	 Pzera5FT96QSwAvo82vzNaFOZ/Jic2Mm/4kgTwAu3gfWRchACLPJE4Ov4MXu1e8fvpJWA
	 FbDMq3Hbxqvt3P05m4V9Y4usqFbvq4uW5Kskrp18XW6ZYOIvge5VF2FCRGjO536wczy4Q
	 KUPr+bRkccQOgORPwP4AycLvA/V0Fh6L6qjUQgkSh5Gw1ZD/MRxNiDbAgwNkKdNwb/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBSVbysh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F504606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBSVbysh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F079E1F000C7;
	Thu, 19 Nov 2026 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103403;
	bh=D19QiGbX6jZXZmEzENtsg4e7fsyT3BenVvif+LHZ+Pc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gBSVbysh/2VFqdjBifWHwVEXOkC2dVvz3GsA0h+cBtXfybiFZZcVr/8HhHg3rF/Nr
	 g2DNd+uElNfcj6bW152uQ/QshioiSpHhqTfXtdMq8AKrYywNklHgJmxYATupkHnD1b
	 FF/PNONfFsMsLxzL+BLqKs93mynkIiosDrb3gCRAcWMe9syEyMBeqTmLNZCAfbB541
	 zFuIWeuJBKOfMf+C0FwqEisLjE4KmeSECcUmQFAGlf0i6fOnNXFq1r+t7dd28zAFX1
	 nHKcXHg9m5lAhKblwflXfENQluXxpvCuLIk8sZWG9jMRRd3qq1DPtI6nLRN7jRDcfi
	 YN2TjWO/0R3Mw==
Message-ID: <sashiko-outbox-223425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 10/28] media: mali-vpu: add firmware cache
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-11-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-11-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:50:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] media: mali-vpu: race and UAF in mali_vpu_fw_cache_cleanup()
- [Low] media: mali-vpu: %zu format mismatch in
  mali_vpu_fw_parse_header()
--

commit c4904ccc1e8387726744e3d73159243657fc5c24
Author: Charvi Mehta <charvi.mehta@arm.com>

media: mali-vpu: add firmware cache infrastructure

This commit adds a per-device firmware cache for Mali VPU firmware
binaries, loading entries asynchronously and pruning unused binaries in a
background thread.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.=
c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
> new file mode 100644
> index 0000000000000..746d30f179305
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
> @@ -0,0 +1,461 @@

[ ... ]

> +static int mali_vpu_fw_parse_header(const struct firmware *fw,
> +				    struct mali_vpu_fw_bin *vpu_fw_bin)
> +{

[ ... ]

> +	if (bss_bitmap_size > ARRAY_SIZE(header->bss_bitmap) * 32) {
> +		dev_err(vpu_fw_bin->cache->dev,
> +			"invalid firmware BSS bitmap size: %u (max %zu)\n",
> +			bss_bitmap_size, ARRAY_SIZE(header->bss_bitmap) * 32UL);
> +		return -EBADMSG;
> +	}

[Severity: Low]
Does multiplying ARRAY_SIZE(header->bss_bitmap) by 32UL promote the
argument to unsigned long, causing a -Wformat warning with %zu on 32-bit
builds where size_t is unsigned int?  Multiplying by 32 instead of 32UL
preserves size_t.

[ ... ]

> +static void mali_vpu_fw_request_done(const struct firmware *fw, void *co=
ntext)
> +{
> +	struct mali_vpu_fw_bin *vpu_fw_bin =3D context;
> +	const struct mali_vpu_fw_header *hdr;
> +	LIST_HEAD(local_event_list);
> +	int ret =3D 0;
> +
> +	mutex_lock(&vpu_fw_bin->cache->lock);
> +	mutex_lock(&vpu_fw_bin->lock);
> +
> +	if (!fw) {
> +		ret =3D -ENOENT;
> +		vpu_fw_bin->fw =3D NULL;
> +	} else {
> +		ret =3D mali_vpu_fw_parse_header(fw, vpu_fw_bin);
> +		if (ret) {
> +			release_firmware(fw);
> +			vpu_fw_bin->fw =3D NULL;
> +		} else {
> +			vpu_fw_bin->fw =3D fw;
> +		}
> +	}
> +
> +	/* We have to notify waiters in failure or success case */
> +	vpu_fw_bin->load_status =3D ret;
> +	vpu_fw_bin->state =3D ret ? MALI_VPU_FW_BIN_FAILED : MALI_VPU_FW_BIN_RE=
ADY;
> +
> +	/*
> +	 * Take a local copy of events/waiters
> +	 * so that notify callback can be called outside vpu_fw_bin->lock
> +	 */
> +	list_splice_init(&vpu_fw_bin->event_list, &local_event_list);
> +
> +	if (ret) {
> +		/* Firmware load failed, remove cached entry */
> +		list_del_init(&vpu_fw_bin->cache_link);
> +		kref_put(&vpu_fw_bin->refcount, mali_vpu_fw_bin_release); /* Drop cach=
e-ref */
> +	}
> +
> +	mutex_unlock(&vpu_fw_bin->lock);
> +	mutex_unlock(&vpu_fw_bin->cache->lock);

[ ... ]

> +void mali_vpu_fw_cache_cleanup(struct mali_vpu_fw_cache *cache)
> +{
> +	struct mali_vpu_fw_bin *bin;
> +	struct mali_vpu_fw_bin *temp;
> +	LIST_HEAD(local);
> +
> +	if (cache->cache_thread)
> +		kthread_stop(cache->cache_thread);
> +
> +	mutex_lock(&cache->lock);
> +	list_splice_init(&cache->fw_bins, &local);
> +	mutex_unlock(&cache->lock);
> +
> +	list_for_each_entry_safe(bin, temp, &local, cache_link) {
> +		list_del_init(&bin->cache_link);
> +		kref_put(&bin->refcount, mali_vpu_fw_bin_release);
> +	}
> +}

[Severity: High]
Can an in-flight request_firmware_nowait() callback race with
mali_vpu_fw_cache_cleanup() during device removal, causing list
corruption, a double kref_put() of the cache reference, and use-after-free
of both vpu_fw_bin and vpu_dev->fw_cache?

CPU0                                  CPU1 (firmware loader work)
mali_vpu_remove()
  mali_vpu_fw_cache_cleanup()
    mutex_lock(&cache->lock)
    list_splice_init(&cache->fw_bins,
                     &local)
    mutex_unlock(&cache->lock)
                                      mali_vpu_fw_request_done()
                                        mutex_lock(&bin->cache->lock)
                                        /* load fails: ret !=3D 0 */
                                        list_del_init(&bin->cache_link)
                                          <-- races with local traversal
                                        kref_put(&bin->refcount, ...)
                                          <-- drops cache-ref
    list_for_each_entry_safe(...,
                             &local, ...)
      list_del_init(&bin->cache_link)
      kref_put(&bin->refcount, ...)
        <-- drops cache-ref a second time
  /* devres frees vpu_dev->fw_cache */
                                        dev_warn(bin->cache->dev, ...)
                                          <-- use-after-free of cache
                                        kref_put(&bin->refcount, ...)
                                          <-- use-after-free of bin

mali_vpu_fw_cache_cleanup() releases cache->lock while each bin->cache_link
is still linked into the stack-allocated local list, so a failing
mali_vpu_fw_request_done() can mutate bin->cache_link while local is being
walked unlocked.  Even if the list operations do not overlap, both
mali_vpu_fw_cache_cleanup() and the failure path in
mali_vpu_fw_request_done() unconditionally drop the single cache-owned
reference on bin->refcount, freeing vpu_fw_bin before
mali_vpu_fw_request_done() finishes logging and dropping its loader
reference.  Finally, because mali_vpu_fw_cache_cleanup() does not wait for
pending request_firmware_nowait() callbacks before mali_vpu_remove() lets
devres free vpu_dev->fw_cache, any later callback dereferences freed memory
through vpu_fw_bin->cache.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D10
