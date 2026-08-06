Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEFC49482F
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786046850; cv=none; b=tSuZbkIVOSgPmaecZdaigVwdrgyPzC4XtZC2UWgqEix9pro0euxKjesFAD8VhAC8ZFkSG9nJ9uBfU7fsLsSAs16xhxJZQ+LV6EgVQ3N7eIb1oLOHnRkJyOEJfAHCQZm23wyEUJ9ZtANBJhSGqGbVNtySYGF7Ls75SEkhRpyOLBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786046850; c=relaxed/simple;
	bh=AXwyUFPNZyEb3B4FIXEKYxa8f446s3tYOi6InSU8EQY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VYvY7do2NqoDTPQYIPPSRYt0uPVet5Ci85Rkhov5uZhTJPT90Y9pdMAhPTRHmivjezOyu4rdq4Nyu1TzqQkK8aP5q2nn4ki/A/bAMjnWqWlAwkCmcNDrCjkHTbrs0NHN0hxVnvrD5u6sOagmOOWVf4UNjWocXc3vQtIkN2UV65I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwkyOjqX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwkyOjqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B661F000E9;
	Thu,  6 Aug 2026 20:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786046838;
	bh=XbP787BcVsyUYZqfiTqpQ1HzWnej+2GXghnjGeW/4LA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cwkyOjqX5lP6ezM8iDu5+3EJVHHulO/JuJPfUK5/k4AeKRegRJt0BZqJ8zPvr6jfO
	 ecAylW4NrBdlT2cfN9VvVXAWF7dn37xXsNvDmu0hwIjmXkaM2mUqkAyrDJUzmxBTJK
	 oGB1GKbXOmmggbBqcqBIlpdlwOQqc7FZmspkdLRESBhMqy2GYOdJQnwAKdEbTLB+Zf
	 tsUJdxDrwwJegjZ7xcsY8QWPolneF3L14miVj1viEvrruosfnUHsSglzjHfHybQ4/5
	 l8LktjMMDHh2RgWNu7gYdP5sQVfmhXkcvZUMB971/xJyGny3csNpXXyk0ZBA9FnDlN
	 HLM4Jz/3SGEwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/19] crypto: cmh - add SM3 ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806195519.2703224-8-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-8-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:07:17 +0000
Message-Id: <20260806200718.29B661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Integer overflow in `cmh_sm3_finup` computing `data_len` leads=
 to an undersized allocation and a massive out-of-bounds heap write.
- [High] The driver calls `cmh_dma_map_single()` directly on `rctx->checkpo=
int`, which is embedded in the request context, violating the prohibition a=
gainst mapping stack memory for DMA.
- [High] The driver linearizes arbitrarily large ahash updates into a singl=
e contiguous `kmalloc` buffer, violating the scatterlist API intent and fai=
ling predictably for large inputs.
- [Low] The module comment incorrectly claims `.digest()` is a zero-copy op=
eration.
--

--- Patch [7]: [PATCH v3 07/19] crypto: cmh - add SM3 ahash ---
commit 05a69da6cc020cf57376f4d81b53eb2fda358e00
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SM3 ahash
   =20
Register the SM3 ahash algorithm using the CMH SM3 core (core ID
0x05).  Supports incremental update/finup/final and export/import.

> diff --git a/drivers/crypto/cmh/cmh_sm3.c b/drivers/crypto/cmh/cmh_sm3.c
> new file mode 100644
> index 0000000000000..37a66cb1508ff
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_sm3.c
> @@ -0,0 +1,676 @@
[ ... ]
> + *   .finup()  -> linearise holdback + new data, then final path
> + *   .digest() -> INIT + UPDATE + FINAL + FLUSH (single-shot, zero-copy)

[Severity: Low]
This isn't a bug, but the comment claims .digest() is a zero-copy
operation. Since cmh_sm3_digest() delegates to cmh_sm3_finup() which
allocates and copies memory, should this documentation be updated to
reflect the actual implementation?

[ ... ]
> +static int cmh_sm3_update(struct ahash_request *req)
> +{
[ ... ]
> +	/*
> +	 * full_len is user-controlled and can exceed KMALLOC_MAX_SIZE for a
> +	 * single large update; __GFP_NOWARN avoids splatting the page
> +	 * allocator on an oversized request.
> +	 */
> +	rctx->data_buf =3D kmalloc(full_len, gfp | __GFP_NOWARN);

[Severity: High]
Does this linearize arbitrarily large ahash updates into a single
contiguous buffer?

For large inputs (e.g., from IMA, dm-verity, or AF_ALG), this could fail
with -ENOMEM when full_len exceeds KMALLOC_MAX_SIZE or if memory is
fragmented.

Is it possible to chunk the updates or natively walk the scatterlist
instead of performing this large contiguous allocation?

[ ... ]
> +	rctx->ckpt_dma =3D DMA_MAPPING_ERROR;
> +	if (rctx->has_checkpoint) {
> +		rctx->ckpt_dma =3D cmh_dma_map_single(rctx->checkpoint,
> +						    SM3_CONTEXT_SIZE,
> +						     DMA_TO_DEVICE);

[Severity: High]
Can this cause a panic or data corruption if the request context is
allocated on the stack?

When callers use AHASH_REQUEST_ON_STACK, rctx->checkpoint will reside on
the stack. Mapping stack memory for DMA violates DMA API rules, which
triggers a panic on architectures with CONFIG_VMAP_STACK=3Dy.

Should the checkpoint buffer be allocated separately?

[ ... ]
> +static int cmh_sm3_submit_final(struct ahash_request *req,
> +				u8 *data_buf, u32 data_len)
> +{
[ ... ]
> +	rctx->ckpt_dma =3D DMA_MAPPING_ERROR;
> +	if (rctx->has_checkpoint) {
> +		rctx->ckpt_dma =3D cmh_dma_map_single(rctx->checkpoint,
> +						    SM3_CONTEXT_SIZE,
> +						     DMA_TO_DEVICE);

[Severity: High]
Similar to cmh_sm3_update(), does this improperly map the potentially
stack-allocated rctx->checkpoint for DMA during finalization?

[ ... ]
> +static int cmh_sm3_finup(struct ahash_request *req)
> +{
> +	struct cmh_sm3_reqctx *rctx =3D ahash_request_ctx(req);
> +	u32 data_len;
> +	u8 *data_buf;
> +	gfp_t gfp;
> +
> +	if (rctx->error)
> +		return rctx->error;
> +
> +	data_len =3D rctx->buf_len + req->nbytes;

[Severity: Critical]
Does this computation have an integer overflow risk?

If a caller provides a large req->nbytes value from userspace via the
AF_ALG socket interface, rctx->buf_len + req->nbytes could wrap around
a 32-bit boundary.

Unlike cmh_sm3_update(), there is no explicit overflow check here before
the addition.

> +
> +	if (data_len =3D=3D 0)
> +		return cmh_sm3_submit_final(req, NULL, 0);
> +
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	data_buf =3D kmalloc(data_len, gfp | __GFP_NOWARN);

[Severity: High]
Similar to cmh_sm3_update(), this linearizes the input into a single
contiguous buffer. Could this fail with -ENOMEM for large valid inputs?

> +	if (!data_buf)
> +		return -ENOMEM;
> +
> +	if (rctx->buf_len > 0)
> +		memcpy(data_buf, rctx->buf, rctx->buf_len);
> +
> +	if (req->nbytes > 0) {
> +		if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
> +			memcpy(data_buf + rctx->buf_len,
> +			       req->svirt, req->nbytes);
> +		else
> +			scatterwalk_map_and_copy(data_buf + rctx->buf_len,
> +						 req->src, 0,
> +						 req->nbytes, 0);

[Severity: Critical]
If data_len overflows during the earlier addition, could this result in
allocating an undersized buffer, followed by an out-of-bounds heap write
when copying req->nbytes of data here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D7
