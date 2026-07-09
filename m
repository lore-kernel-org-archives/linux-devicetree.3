Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBDD37C90A
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630037; cv=none; b=fXfr1meNbHAJcxmSeNwKEV6TJYXSzK2jz0cgBMkEvGYjGM0hOxwUGVE2wT4sCandR8ycszMc/09UEpKh8YIZLFQ6I/59FlnU5tjIBTstO8+sBbiKNxdv4gIB/+Ct+5b7qokRwhueVL0yqc0drdGaJSJMD8UXgLe4rF5+RlMPtsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630037; c=relaxed/simple;
	bh=oV6XsZVmXEo1AHnhjk7dUjutZ9FTQL3Z3Rr2pegISvg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QUrSwViQYoG8i9pPBxk5GXu1wUvZ8z/93pWfQn+acTqjkDykB0gBL0DdMjoDoDcHnPpA8mBNwbN5ExQsPZ5i5nBe73XUtL/hzJmAYLFvGWOc8h35fyc6J2EGm5YXBGrNwBt9kXtaXL0Af24FfeRmC+vlQfF5mzkXHQEPecJM3JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOb6Hd8Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOb6Hd8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB291F000E9;
	Thu,  9 Jul 2026 20:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630036;
	bh=XzKwkyYkT2//gO4+AR6ebjBaBhcjQdWlCYZiOdZncTc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TOb6Hd8QUbi1fdjeD5CPodilGY7rziHz0BZ4jFcpsIuLSkbdgq2Vt+vbWsne9nsAy
	 6mXcRrZ+DGKGDL3jQRsYMAIUnQez+NjZVfE4QAsO0LEDlkCma0HdZIE+E7ab+oGQnK
	 wnKtQE/xuBs2jCGoGnozDYqn6H5X/2nPaBVg1CQS9Lz510eJtdGYEUfo13VCJscP91
	 fxOKFNP/Z8qn1eQm/vAqQLrs7zvlBkQnXxT1ef1fyTWVS7qjDuPkQvOf94tYlgEs4g
	 ct8fLYmWZDTXN7Yc6KNdJd19h0NfcmdOal4VMt9zqUthMkvS5NNd9UK+NSHeKAhkHy
	 4TZ2zG5JLHoRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/19] crypto: cmh - add AES skcipher/aead/cmac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709203037.1884436-9-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-9-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:47:15 +0000
Message-Id: <20260709204715.ADB291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unbounded memory leak and DoS via orphaned chunks in `cmh_aes_cmac=
_init` and `cmh_aes_cmac_import`.
- [High] Memory allocation failure and `WARN` due to oversized `kmalloc` in=
 `cmh_aes_crypt`.
- [High] Cryptographic logic bug causing mathematically incorrect IV genera=
tion in CFB-128 partial block chaining.
- [High] Alignment violation resulting in misaligned pointers for generic C=
CM fallback subrequest.
- [High] Sleeping in atomic context due to hardcoded `GFP_KERNEL` in `cmh_a=
es_cmac_import`.
--

--- Patch [8]: [PATCH v2 08/19] crypto: cmh - add AES skcipher/aead/cmac ---
commit 0196177c32d5ce7a03aa73937a1fac3eb268a239
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add AES skcipher/aead/cmac

Register AES algorithms using the CMH AES core (core ID 0x03): skcipher, ae=
ad,
and ahash. Supports 128, 192, and 256-bit keys and handles associated data,
payload, and authentication tag.

> diff --git a/drivers/crypto/cmh/cmh_aes.c b/drivers/crypto/cmh/cmh_aes.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_aes.c
[ ... ]
> +static void cmh_aes_update_iv(struct skcipher_request *req, u32 mode,
> +			      u32 op, const u8 *in_buf, const u8 *out_buf)
> +{
[ ... ]
> +	case AES_MODE_CFB:
[ ... ]
> +		if (req->cryptlen >=3D bs) {
> +			if (op =3D=3D AES_OP_ENCRYPT)
> +				memcpy(req->iv, out_buf + req->cryptlen - bs,
> +				       bs);

[Severity: High]
Does this extract an unaligned 16-byte slice when the request length is not
block-aligned? Mixing the end of the previous ciphertext block and the start
of the partial block produces an incorrect shift-register state for CFB-128.
If cra_blocksize is set to 1, standard CFB-128 chaining on partial blocks
requires saving the unused keystream in the state between requests instead.

[ ... ]
> +static int cmh_aes_crypt(struct skcipher_request *req, u32 aes_op)
> +{
[ ... ]
> +	if (req->cryptlen > CMH_AES_MAX_CRYPTLEN)
> +		return -EINVAL;
[ ... ]
> +	/* Linearise input from scatterlist */
> +	rctx->in_buf =3D kmalloc(req->cryptlen, gfp);

[Severity: High]
Does this allow kmalloc to be called with a size up to 32MB? Since
KMALLOC_MAX_SIZE is typically 4MB or 8MB, allocations exceeding this limit
will trigger page allocator warnings and fail. Unprivileged userspace could
potentially trigger this via the AF_ALG skcipher interface.

> diff --git a/drivers/crypto/cmh/cmh_aes_aead.c b/drivers/crypto/cmh/cmh_a=
es_aead.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_aes_aead.c
[ ... ]
> +static int cmh_aes_aead_init_tfm(struct crypto_aead *tfm)
> +{
[ ... ]
> +		/*
> +		 * Subreq lives at (rctx + 1).  Alignment is guaranteed
> +		 * by the crypto framework's __ctx ALIGN mechanism.
> +		 */
> +		crypto_aead_set_reqsize(tfm,
> +					sizeof(struct cmh_aes_aead_reqctx) +
> +					sizeof(struct aead_request) +
> +					crypto_aead_reqsize(fb));
[ ... ]
> +static int cmh_aes_ccm_fallback(struct aead_request *req, u32 aes_op)
> +{
> +	struct crypto_aead *tfm =3D crypto_aead_reqtfm(req);
> +	struct cmh_aes_aead_tfm_ctx *tctx =3D crypto_aead_ctx(tfm);
> +	struct cmh_aes_aead_reqctx *rctx =3D aead_request_ctx(req);
> +	struct aead_request *subreq =3D (void *)(rctx + 1);

[Severity: High]
Does this calculate a misaligned pointer for subreq? The crypto framework
aligns the start of the primary request context, but
sizeof(struct cmh_aes_aead_reqctx) is not guaranteed to be a multiple of
CRYPTO_MINALIGN.

Because struct aead_request requires strict alignment for its __ctx member,
this can lead to alignment faults or data corruption when CCM mode falls
back to software. Should the context size wrap the struct size with
ALIGN(..., crypto_tfm_ctx_alignment())?

> diff --git a/drivers/crypto/cmh/cmh_aes_cmac.c b/drivers/crypto/cmh/cmh_a=
es_cmac.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_aes_cmac.c
[ ... ]
> +static int cmh_aes_cmac_init(struct ahash_request *req)
> +{
> +	struct cmh_aes_cmac_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	memset(rctx, 0, sizeof(*rctx));
[ ... ]
> +static int cmh_aes_cmac_update(struct ahash_request *req)
> +{
[ ... ]
> +	chunk =3D kmalloc(sizeof(*chunk) + req->nbytes, gfp);

[Severity: High]
Does zeroing the request context in cmh_aes_cmac_init() orphan the chunks
dynamically allocated during cmh_aes_cmac_update()? If a user repeatedly
calls .update() followed by .init() on the same request via the AF_ALG
socket, it seems total_len is reset and the link to the allocated chunks is
severed. Can this lead to unbounded memory leaks and an out-of-memory
condition?

[ ... ]
> +static int cmh_aes_cmac_import(struct ahash_request *req, const void *in)
> +{
[ ... ]
> +	if (state->total_len) {
> +		chunk =3D kmalloc(sizeof(*chunk) + state->total_len, GFP_KERNEL);

[Severity: High]
Can this allocation happen in atomic or softirq contexts? The kernel crypto
API allows .import() callbacks to execute during IPsec packet processing.
Using a hardcoded GFP_KERNEL here without checking
req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP could trigger a sleeping in
atomic context bug.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D8
