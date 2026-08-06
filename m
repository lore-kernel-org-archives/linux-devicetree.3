Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620DB3BB68B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786046961; cv=none; b=Img+Cm2XTjeAqQ0LQ5VfFyOGps1eeYnsxk3YQPGB7bas1s3d+/kZX4HbJnGPqDtkxRF89SDFC946UCgD9vvLnA70v+S47thmzFOLXKs520oETiEQNAev6gbkELEbhSfd5TPO+NrqMJaHcrQ9FiwAdSC276FWmVGmgub3Qlq2VDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786046961; c=relaxed/simple;
	bh=+z5sXnK5e+1OAAWzB0i8g0tUKAuf5uhl46b5wrCQ5kw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AJlNAKJ7r+OinQmy5i8wsdRnSbYP9Du1TX3aRc2Ch7InJ/OmgYSWtTDi3rWVHuSSK54t7LyMUPvu/938ijx5JLHdG0NmYG075mk0E8Zhe9Eii2nDJ6amr7eUkKQowHDD96kNew4RUSZMpJ332vkJV1hMP8Yi4rQJ15vWdW8a4bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXcUcw0U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXcUcw0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAC11F000E9;
	Thu,  6 Aug 2026 20:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786046960;
	bh=zoPU5OCEXxpvVZS9dodpwrDtssyOL44HPPFsDz5x5ZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mXcUcw0USJiZjHRdM2rBaD0MkvTAFsi0kQAGE4WZ6egAIr2zkWudLlfiXZkf7GE8m
	 buR1egz57nQkW3/aZfBl7xQw+9mmZOYSw4GynfbnvFb476JiLuvAxO2wyrI9/o5ltu
	 pSvEHO8W7u8D0EYTzVhK9a6CbaKBXcgJ6b2g85Zqwdc9unbvip48EpdLNL5qYWMsKV
	 1QBtPExbCi0Q6XK/l0+GbLFisJBV3HR7o9MH5qw86P/RYeK64G1Af2wnaXihdj8L0u
	 t66yJT5mQ0A8BjqV+17HfSEuRg+EFonft4TP8ToCIeaunuvwZgm8zdDBlKufFWbfwQ
	 v9cv8jcUIdvhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/19] crypto: cmh - add HMAC ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806195519.2703224-6-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-6-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:09:19 +0000
Message-Id: <20260806200919.BCAC11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unbounded kernel memory leak due to orphaned dynamically allocated=
 chunks when a hash request is aborted before `.final()` or re-initialized/=
imported.
- [Medium] Potential out-of-bounds write in `cmh_hmac_export` when exportin=
g the software fallback state due to missing statesize validation.
- [Medium] Mapping an unaligned interior pointer (`chunk->data`) for DMA vi=
olates DMA API requirements and risks cacheline corruption or runtime warni=
ngs.
--

--- Patch [5]: [PATCH v3 05/19] crypto: cmh - add HMAC ahash ---
commit 29cce2e66e05b4cda73d07e16e2b43d65f198bd1
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add HMAC ahash

This commit registers HMAC-SHA-2 and HMAC-SHA-3 ahash algorithms using the
CMH hash core. It implements a self-contained transaction model with
software fallback for large accumulated inputs and state cloning.

> diff --git a/drivers/crypto/cmh/cmh_hmac.c b/drivers/crypto/cmh/cmh_hmac.c
> new file mode 100644
> index 0000000000000..b43b358c35963
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_hmac.c
> @@ -0,0 +1,865 @@
[ ... ]
> +struct cmh_hmac_chunk {
> +	struct list_head  list;
> +	struct list_head  tfm_node; /* per-tfm orphan tracking */
> +	u32               len;
> +	u8                data[];
> +};

[Severity: Medium]
Does mapping this unaligned data array violate DMA API requirements?

The data array sits at an unaligned offset (36 bytes), which shares a
cacheline with the struct's metadata.

Later, in cmh_hmac_build_sg(), this unaligned interior pointer is passed to
the DMA mapping subsystem:

    list_for_each_entry(chunk, &rctx->chunks, list) {
        bufs[i].data =3D chunk->data;
        bufs[i].len =3D chunk->len;
        i++;
    }
    sgm =3D cmh_dma_build_sg(bufs, rctx->num_chunks, gfp);

Could this risk cacheline corruption on non-coherent architectures and
trigger CONFIG_DMA_API_DEBUG warnings?

[ ... ]
> +static int cmh_hmac_init(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_hmac_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	rctx->info =3D cmh_hmac_get_info(tfm);
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);

[Severity: High]
If cmh_hmac_init() is called on an active request, does this unconditionally
overwrite the list head and permanently lose track of any locally buffered
chunks?

A similar pattern appears in cmh_hmac_import().

[ ... ]
> +static int cmh_hmac_update(struct ahash_request *req)
> +{
[ ... ]
> +	chunk =3D kmalloc(sizeof(*chunk) + req->nbytes,
> +			req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +			GFP_KERNEL : GFP_ATOMIC);
> +	if (!chunk) {
> +		rctx->error =3D -ENOMEM;
> +		goto err_free_chunks;
> +	}
[ ... ]
> +	list_add_tail(&chunk->list, &rctx->chunks);
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
What happens to these allocations if an unprivileged user creates an
AF_ALG socket, sends data to trigger this allocation, and then closes the
socket before calling recv() to trigger final()?

Since the crypto API has no per-request destructor, and these chunks are
added to the global tctx->all_chunks list, it appears they are only freed
in cmh_hmac_cra_exit():

    list_for_each_entry_safe(chunk, tmp, &tctx->all_chunks, tfm_node) {
        list_del(&chunk->tfm_node);
        kfree_sensitive(chunk);
    }

Could a user repeat this in a loop on new accepted sockets to indefinitely
consume kernel memory until the system runs out of memory?

[ ... ]
> +static int cmh_hmac_export(struct ahash_request *req, void *out)
> +{
[ ... ]
> +	if (rctx->switched) {
> +		state->format =3D CMH_HMAC_FMT_FB;
> +		return crypto_ahash_export(cmh_hmac_fb_req(rctx), state->data);
> +	}

[Severity: Medium]
Is there a risk of an out-of-bounds write here if the generic software
fallback algorithm allocated in cmh_hmac_cra_init() has a state size larger
than CMH_HMAC_EXPORT_MAX?

The state buffer size is computed using crypto_ahash_statesize(tfm), but
there appears to be no structural validation in cmh_hmac_cra_init() ensuring
the allocated fallback's state actually fits within this fixed-size limit
before it is exported.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D5
