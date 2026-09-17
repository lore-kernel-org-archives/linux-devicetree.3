Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51754AAC44
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686696; cv=none; b=mRXP5gLOxFdHIHBz3G/d9pbvHHP2oPscwo5x2rnWzIeV6Ji2r/DbHYErjwvEmko3Izpy5wPCwupkL94dT8OnqdXwC54F/u0r/fx3jTwoXkihmAXlSZfOStvkh7cMH9NsKp/CJznDKF4Y/XLxzsjd+9Z6yUp19X6JmyojBazy4jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686696; c=relaxed/simple;
	bh=PyvNlzkDiYDjdwZZIn+UX7a9VrzB/M1E4IBC+pCuSlc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h5HnFCvanojrV8KmXUcVdSOiEQJRjjVoLTxWkCW2Fb0k+tLvOcOc7D5bxLGPqqvfRBukbh/QuO4qSv5v3f3b6q9gTGrEjQxshL++ayXiOrEifP2P0MmVwgpXx02Y9aL2MDlv1EF42sxA7OFt7zMTrtIGWP9cd7GftfJChwtL0lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GX/O99J+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GX/O99J+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0C71F00893;
	Thu, 17 Sep 2026 23:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686682;
	bh=2Visb+e2y2ldOS4sGcvQpnf5FV/4FOuloI1LlFRPRKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GX/O99J+JpQhHLwo2b78gWXJ0uGeo4vuF9QDOEQKvd6ss9Ob1dOSin2e0uOowLn7r
	 3ZWyPI/GHxIhLA50awF9sRKxOqF1JXDfHGpTKx8PSe4cunpV3JFhTo/9OkqpQKbM9b
	 9UhCyq20vj4XVLVlwo3aWQ5Xe/vN3xDrbKZ1kfL+x1A/DRTeIrjxsQ1/yMe8GlOCj/
	 j0iuoSVk4GybZFqlHZSZkOQGdvvGZoSEa8dNEbL8kM/X0pHY0uvSSmdWm9tP78wYzY
	 k6LE37hyDR1dshCxh1Qw4ij3lP3+vsn4JcMubG10mFOTw/CvFKbTg/uD5TRdsevwul
	 /OWA9CzYadACw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/19] crypto: cmh - add AES skcipher/aead/cmac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917225929.2494111-9-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-9-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:11:21 +0000
Message-Id: <20260917231122.5C0C71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] crypto: cmh: unbounded memory leak and TFM bricking in cmac(aes) A=
F_ALG path
--

commit a4044451c1e906d90442c0bef45c7be8c8846c42
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add AES skcipher/aead/cmac

This commit registers AES algorithms (skcipher, aead, cmac) using the CMH
AES core. It handles associated data, payloads, and authentication tags
for AEAD and supports 128, 192, and 256-bit keys.

> diff --git a/drivers/crypto/cmh/cmh_aes_cmac.c b/drivers/crypto/cmh/cmh_a=
es_cmac.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_aes_cmac.c

[ ... ]

> +static int cmh_aes_cmac_init(struct ahash_request *req)
> +{
> +	struct cmh_aes_cmac_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	memset(rctx, 0, sizeof(*rctx));
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	return 0;
> +}

[Severity: High]
Does this unconditionally wipe the request context? If the request already
has chunks attached to rctx->chunks, it looks like they will be permanently
orphaned and leaked. For example, if a user repeatedly resets an active
request via the AF_ALG interface, this might permanently consume the quota
until the transform is bricked.

[ ... ]

> +static int cmh_aes_cmac_final(struct ahash_request *req)
> +{
[ ... ]
> +	if (ret) {
> +		/*
> +		 * Synchronous rejection (e.g. -EAGAIN: CMQ full, no backlog).
> +		 * Free only the per-submit transients and keep the accumulated
> +		 * chunks intact so the caller can retry the identical final().
> +		 * If no retry comes, cra_exit reclaims the orphaned chunks; the
> +		 * per-tfm buffered-byte cap bounds how much stays pinned.
> +		 */
> +		if (rctx->total_len > 0 && !cmh_dma_map_error(rctx->in_dma))
> +			cmh_dma_unmap_single(rctx->in_dma, rctx->total_len,
> +					     DMA_TO_DEVICE);
> +		cmh_dma_unmap_single(rctx->tag_dma, AES_CMAC_DIGEST_SIZE,
> +				     DMA_FROM_DEVICE);
> +		kfree(rctx->tag_buf);
> +		rctx->tag_buf =3D NULL;
> +		kfree_sensitive(rctx->buf);
> +		rctx->buf =3D NULL;
> +		/* Keep chunks + total_len so the retry rebuilds the buffer. */
> +		return ret;

[Severity: High]
Is there a risk of leaking these accumulated chunks on a synchronous error?
The comment mentions keeping them so the caller can retry, but if the caller
ultimately drops the request instead of retrying, these chunks appear to be
left orphaned.

[ ... ]

> +static int cmh_aes_cmac_import(struct ahash_request *req, const void *in)
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
> +		rctx->total_len =3D state->total_len;
> +	}
> +	return 0;
> +}

[Severity: High]
Can an unprivileged user bypass the CMH_AES_CMAC_TFM_MAX_BUFFERED quota
here?

The cmac(aes) driver imposes a 16MB limit on tctx->tfm_buffered during
updates. However, this import function allocates memory and adds to
tctx->tfm_buffered without checking that limit.

If a user creates an ahash socket via AF_ALG, clones the socket repeatedly
with accept() (which triggers import()), and closes the child socket, could
this lead to unbounded kernel memory allocation and an OOM denial of servic=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D8
