Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C183905E0
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686884; cv=none; b=lCgpwX7RqPJbpvAYvRyFL8dKJfZ18q+N0E/dOP7LERzDtTYFbNrnoJXIxVafkvY0X5AiEvKs56nVA8I8UdOjTWZyFlNV5kaiTNG5Ejf1uEZvXKul92kbfWaqL0D3ZzrNiwZjU/vJJQQS7cHXdNja5RaCrmUEuNSU10hSormnMCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686884; c=relaxed/simple;
	bh=x/vq7hNloPAlovp2eaORJSRH6/rCJls6suGNTxSe8TY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tiHMuy2iuvx1XMn7EWJaH/JKoD1P+clMHhwwrLpLmUEW1l8FNQGiTt09vn9K0jQhkN4iQjP0zq337lAdgVaHbgPJHEK0H1vyMxySwmRMH9xqYnYPT9I7QFzzpcpLYsdcqSZ6PaLYPKFhIAKqRg6g32GT08+TgJuSIpTMoWOK+Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X95fzyp6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X95fzyp6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3061F000FF;
	Thu, 17 Sep 2026 23:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686876;
	bh=Q8bLjHf2lKxWtqfnoEC3TP3ZGzqmNs81cMnuI26gKcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X95fzyp6m78IAIhhltL8brN/7IJzn2eWSneqcr3rwgwrZWsfTs9DRAJyqDdzNo8Yw
	 9PLq42utPSb/yOVK47/lUfr0NOhrRTO09QPiRys3ClJgajuDVnEa5CMYzEVjRsvSmY
	 Ak2OXiMnN1BLxMr6zJ1Oe1ai53oGbnpVv2DKPMDDMGCkqRBBXlZu2sS4s3bqb/T9nM
	 y6nupUmnIqW81AE9RD8W1nK89JQoGedEqJmjJbGNMppuiEXS0pCqW0H6kOMDlH87Xx
	 vmIDwZs+oFtrcuhshrcvWdNqq5RSZFPvFwMgbEtz/xZEeiP1AMtzOhTKkR2QnG8MoH
	 g0itMmPmc7wew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/19] crypto: cmh - add HMAC ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917225929.2494111-6-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-6-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:14:35 +0000
Message-Id: <20260917231436.1F3061F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] crypto: cmh: missing bounds check in cmh_hmac_import allows unboun=
ded memory allocation
- [High] crypto: cmh: under-accounting of chunk struct overhead allows extr=
eme memory exhaustion
- [Medium] crypto: cmh: freeing millions of chunks under spin_lock_bh can t=
rigger a softlockup
- [Medium] crypto: cmh: DMA buffer shares a cache line with CPU-modified va=
riables
--

commit e7307bc7cf1e65f0adb503e546d45a39b86900bd
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add HMAC ahash

This commit registers HMAC ahash algorithms (HMAC-SHA-2 and HMAC-SHA-3) usi=
ng
the CMH hash core. It implements a self-contained transaction model using
accumulated inputs, with a generic software fallback for payloads above 64K=
B.

> diff --git a/drivers/crypto/cmh/cmh_hmac.c b/drivers/crypto/cmh/cmh_hmac.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_hmac.c
[ ... ]
> @@ -136,7 +136,7 @@
> +/* Per-Request State */
> +
> +struct cmh_hmac_chunk {
> +	struct list_head  list;
> +	struct list_head  tfm_node; /* per-tfm orphan tracking */
> +	u32               len;
> +	u8                data[];
> +};

[Severity: Medium]
Does this structure layout place the data buffer on the same cache line as
the list heads?

Since the data buffer is mapped for DMA, could concurrent list
modifications in cmh_hmac_update() dirty the cache line while a transfer
is in progress, potentially violating mapping rules on non-coherent
architectures?

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
> +
> +	chunk->len =3D req->nbytes;
[ ... ]
> +	spin_lock_bh(&tctx->chunk_lock);
> +	if (tctx->tfm_buffered + chunk->len > CMH_HMAC_TFM_MAX_BUFFERED) {
> +		spin_unlock_bh(&tctx->chunk_lock);
> +		kfree_sensitive(chunk);
> +		rctx->error =3D -ENOMEM;
> +		goto err_free_chunks;
> +	}
> +	list_add_tail(&chunk->list, &rctx->chunks);
> +	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +	tctx->tfm_buffered +=3D chunk->len;
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Are we only accounting for the payload length here, instead of the full
size of the allocated struct?

Since the chunk header is 36 bytes (often rounded up to 64 bytes by the
slab allocator), could repeated 1-byte updates allow pinning roughly 1GB
of kernel memory per transform socket without exceeding the 16MB budget?

[ ... ]
> +static int cmh_hmac_import(struct ahash_request *req, const void *in)
> +{
[ ... ]
> +	if (state->total_len) {
> +		chunk =3D kmalloc(sizeof(*chunk) + state->total_len,
> +				req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +				GFP_KERNEL : GFP_ATOMIC);
> +		if (!chunk)
> +			return -ENOMEM;
> +		chunk->len =3D state->total_len;
> +		memcpy(chunk->data, state->data, state->total_len);
> +		spin_lock_bh(&tctx->chunk_lock);
> +		list_add_tail(&chunk->list, &rctx->chunks);
> +		list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +		tctx->tfm_buffered +=3D chunk->len;
> +		spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Should we verify if the budget is exceeded before appending the imported
chunk and adding to tctx->tfm_buffered?

Without a check against CMH_HMAC_TFM_MAX_BUFFERED, could an unprivileged
user repeatedly call accept() on a socket to clone its state and cause
unbounded kernel memory allocation?

[ ... ]
> +static void cmh_hmac_cra_exit(struct crypto_tfm *tfm)
> +{
> +	struct cmh_hmac_tfm_ctx *tctx =3D crypto_tfm_ctx(tfm);
> +	struct cmh_hmac_chunk *chunk, *tmp;
> +
> +	/* Free any orphaned chunks (e.g. testmgr export/reimport poison) */
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_for_each_entry_safe(chunk, tmp, &tctx->all_chunks, tfm_node) {
> +		list_del(&chunk->tfm_node);
> +		tctx->tfm_buffered -=3D chunk->len;
> +		kfree_sensitive(chunk);
> +	}
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: Medium]
Is it safe to free potentially large numbers of chunks while holding the
spinlock with softirqs disabled?

If the 16MB budget contains millions of small chunks (due to the accounting
size issue mentioned earlier), could this loop take significant CPU time
and risk triggering a soft or hard lockup panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D5
