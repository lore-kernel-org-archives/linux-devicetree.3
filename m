Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D973B42D6
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686999; cv=none; b=Pm/xmF6KLYwUoLdNxl8TCGLNEWjN/8jcu/+M3BgvQN2IvQQCOKsx8Fueik/+naeGFPCXnp3uV3babDHXgCGr7isxZVJnZVwb0qDn6xe2rYtWhKXK/OxqqVR29H6o/Y3uCFZNsWwf9qA6XZEtpTX3yoFdbTwXtxmjOsjLSDCIOyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686999; c=relaxed/simple;
	bh=XDZisRQODHSdxAKm8n+yqY67VGiZ3TvUbUibCEFjcZY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jWsMtezB8YBaZ45KWEPvyDg6G/89xVP9AtmeujcYiizJ50qJQyXknBNYbXDLWn1h4EnePYCf8c5Shyzc9G8wPMkHTqMJI39AUcUv+STdOLTN8ZDVRKm7UQOkTR7uItZBp4KPGVQwU6c06o1llORA6MSZLjw2S5UVBmS5+pU/bw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmhJZiQa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmhJZiQa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5881F000FF;
	Thu, 17 Sep 2026 23:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686993;
	bh=OxpP+ohQBTPp8xIYbjnerQ9omzIcDhlf/oA/xH4KXnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmhJZiQarhLF5WR/NB1Cno3AbpmSpSY2DJ6okh0zMD7BXrhxgb4QhRtevF+hQwlEw
	 5UlcQlLfIkxb3TKd52ERKEbuwyrdfR1jiAqOISZjkh20hKbVdsg+tMqwlw+KeUrCZX
	 fWpqtIuW2aIcr1q8VvIq1/DeQJ+ekOGqvsTN/gbxP4MxxaGqxDhHVpRnoI53MCnyvU
	 ix624UMWLvk4d6bHi5F3AsPYxo7MdsKbjDga5WRlQeDK0vVfn4yo7OBASA1sthh4f0
	 G3aars853FkyQk7/KCPwo+xjBsqipahWORhrGr/SY2kXssGWPOpm5zh27xNe017lAP
	 LvcB7S2ALnP7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/19] crypto: cmh - add CSHAKE/KMAC ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917225929.2494111-7-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-7-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:16:32 +0000
Message-Id: <20260917231632.DC5881F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] crypto: cmh: cshake arbitrary length kmalloc causes ENOMEM/EMSGSIZE
- [High] crypto: cmh: kmac init on active request leaks chunks causing TFM =
DoS
- [High] crypto: cmh: kmac finup duplicates data on EAGAIN retry
- [Medium] crypto: cmh: kmac final error path allows empty MAC generation o=
n retry
--

commit c5367ee10d2ec6e4de159d32bb1d2e8f203ad0f6
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add CSHAKE/KMAC ahash

This commit registers ahash algorithms for cSHAKE128, cSHAKE256, KMAC128, a=
nd
KMAC256 using the CMH hash core. CSHAKE supports incremental update and
export/import, while KMAC accumulates the input for a single finalize-time
submission.

> diff --git a/drivers/crypto/cmh/cmh_cshake.c b/drivers/crypto/cmh/cmh_csh=
ake.c
> new file mode 100644
> index 0000000000000..56a6453a0e4fe
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_cshake.c
> @@ -0,0 +1,873 @@

[ ... ]

> +static int cmh_cshake_update(struct ahash_request *req)
> +{

[ ... ]

> +	/*
> +	 * Reject a single update whose linearisation would exceed the largest
> +	 * kmalloc: return a permanent -EMSGSIZE ("message too long") rather
> +	 * than a transient -ENOMEM the client would keep retrying.
> +	 */
> +	if (full_len > KMALLOC_MAX_SIZE)
> +		return -EMSGSIZE;
> +
> +	rctx->data_buf =3D kmalloc(full_len, gfp | __GFP_NOWARN);
> +	if (!rctx->data_buf)
> +		return -ENOMEM;

[Severity: High]
Does this code artificially limit standard ahash capabilities? The ahash API
requires drivers to support arbitrary-length inputs provided as scatterlist=
s.

By linearizing the entire input scatterlist into a single contiguous kmalloc
buffer, inputs larger than KMALLOC_MAX_SIZE are rejected with -EMSGSIZE.

Even for large inputs below this limit, relying on high-order contiguous
allocations is prone to -ENOMEM failures under memory fragmentation.

[ ... ]

> +static int cmh_cshake_finup(struct ahash_request *req)
> +{

[ ... ]

> +	/* Reject an oversized linearisation with a permanent -EMSGSIZE. */
> +	if (data_len > KMALLOC_MAX_SIZE)
> +		return -EMSGSIZE;
> +
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	data_buf =3D kmalloc(data_len, gfp | __GFP_NOWARN);

[Severity: High]
Is this the same single-buffer allocation pattern repeated here?

This appears to also break standard API usage by failing on large inputs.

> diff --git a/drivers/crypto/cmh/cmh_kmac.c b/drivers/crypto/cmh/cmh_kmac.c
> new file mode 100644
> index 0000000000000..97ff36af13a07
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_kmac.c
> @@ -0,0 +1,690 @@

[ ... ]

> +static int cmh_kmac_init(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_kmac_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	rctx->info =3D cmh_kmac_get_info(tfm);
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	rctx->num_chunks =3D 0;
> +	rctx->total_len =3D 0;
> +
> +	return 0;
> +}

[Severity: High]
Could this leak previously accumulated chunks on an active request?

Re-initializing an active request is permitted by the kernel crypto API to
abort a stream and restart. This code resets the list with INIT_LIST_HEAD
without calling cmh_kmac_free_chunks() to free any existing data.

The chunks would remain orphaned on tctx->all_chunks, permanently consuming
the per-TFM memory cap. Repeated aborts/re-inits will exhaust
CMH_KMAC_TFM_MAX_BUFFERED, breaking all subsequent operations on the TFM
with -ENOMEM.

[ ... ]

> +static int cmh_kmac_final(struct ahash_request *req)
> +{

[ ... ]

> +out_free:
> +	cmh_kmac_free_chunks(rctx, tctx);
> +	return ret;
> +}

[Severity: Medium]
Will this error path fail to prevent subsequent calls from silently hashing
an empty buffer?

If a synchronous failure occurs and the code jumps to out_free, it destroys
the accumulated input state but doesn't set rctx->error =3D ret.

If the caller retries the failed operation, the driver will see 0 chunks
and no error, and compute a MAC for an empty string instead of returning
the failure.

[ ... ]

> +static int cmh_kmac_finup(struct ahash_request *req)
> +{
> +	int ret;
> +
> +	ret =3D cmh_kmac_update(req);
> +	if (ret)
> +		return ret;
> +
> +	return cmh_kmac_final(req);
> +}

[Severity: High]
Does this logic duplicate data if the operation is retried?

If cmh_kmac_final() fails with -EAGAIN or -EBUSY, it intentionally retains
accumulated chunks so the caller can retry the submission. However, if the
original operation was crypto_ahash_finup(), the caller will retry finup.

This will call cmh_kmac_update() again, unconditionally allocating and
appending the input data to rctx->chunks, which duplicates the input data
and causes the retried operation to output an incorrect MAC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D6
