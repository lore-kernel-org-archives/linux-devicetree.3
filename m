Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A483BD647
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630175; cv=none; b=X6FV0JLnFGESLTOAZP9YzQFepBDlFdZRdA5iZ+UWqGfu3Xy3ggdgCXpfPnpIydxZt50yM5NGZBlnlWgYjiDyBeTUg1l6imrxLjqvA67Rlu1Hxuy3YXTvzumTBd2grhMWqnIz73gLu6J14GfTnLgRL/TiE8az6hTpFCJoMoX5fRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630175; c=relaxed/simple;
	bh=VFBQEWskgoD4QmrmNDMfVOZo4DNsfoQ3+ipGJseocwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bchCRC+JUDRZAOyykpENfRDCo46/zFWffOCL+ULOufsvdFx88uQeTMjS/b/KVE1GhbLHEEBgyDwzkXuF+O2McMdXm3rmm5XymqTOtI+UsPmNjRv6NXvgf1bNd+ViSrh1Uh1WeVWTN+mBM4N1KZJEyNNs03E/5l/Gs9fEUs1ABS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KahVaobK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KahVaobK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879A01F00A3D;
	Thu,  9 Jul 2026 20:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630173;
	bh=+KyxZsgjfckTYepXUcLxjTRmRC1e2iK99yImRl2L7OU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KahVaobKlMLqliKI1/NWOLUy1UKKtECDDxTnxeSMZmAjkAUZoRWZ7LXCi/d3b5uUM
	 WWjGA5zxP5PK9XCWgK1VuMXOuNEeBRou6vZA/cL1JtWXty1jU0NluuQs1+ws92WLqJ
	 MS7ixtHas9rQ4/UGuXzqfXycO+17oFKj90CRh6Ze7lfYTHPoB1mi4O44adt3PWHNME
	 2lJUpa6A3CLnWE8OtEZomqt3AT8mYegPNWtgIabuYU4iDeJlAEzLSxqEWXrdQo4i4Z
	 pDqJyQaspawfuyonx1io9vlIG1Z/2OU4gU2XXY4ypItHDpNmyi64/AjkDcJUayim71
	 BR7xyePT5rGXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/19] crypto: cmh - add SM4 skcipher/aead/cmac/xcbc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709203037.1884436-10-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-10-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:49:33 +0000
Message-Id: <20260709204933.879A01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The driver allocates up to 32MB of contiguous memory using kmalloc=
 for skcipher requests, which exceeds KMALLOC_MAX_SIZE and triggers page al=
locator warnings.
- [High] The ahash export() function fails with -ENOSPC for valid hash accu=
mulations, breaking the crypto API contract.
- [High] The ahash update() error path fails to reset total_len, allowing u=
ninitialized kernel memory to be hashed and exposed as a MAC oracle.
- [High] Incorrect IV chaining in cmh_sm4_update_iv for CFB mode when req->=
cryptlen is not a multiple of the block size.
- [High] Unbounded memory leak of accumulated MAC data chunks when ahash re=
quests are aborted, re-initialized, or imported.
- [High] The cmh_sm4_mac_import() function unconditionally uses GFP_KERNEL,=
 which can cause a sleep in atomic context.
- [Medium] Failed key setups in AEAD and MAC algorithms lead to a torn stat=
e where the software fallback cipher and the hardware context use different=
 keys.
--

--- Patch [9]: [PATCH v2 09/19] crypto: cmh - add SM4 skcipher/aead/cmac/xc=
bc ---
commit f6f59427e5bb8538a2126c7ca1459a18ff4882e0
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SM4 skcipher/aead/cmac/xcbc

Registers SM4 algorithms using the CMH SM4 core (core ID 0x04),
including skcipher, aead, and ahash variants.

> diff --git a/drivers/crypto/cmh/cmh_sm4_aead.c b/drivers/crypto/cmh/cmh_s=
m4_aead.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_sm4_aead.c
[ ... ]
> +static int cmh_sm4_aead_setkey(struct crypto_aead *tfm, const u8 *key,
> +			       unsigned int keylen)
> +{
> +	struct cmh_sm4_aead_tfm_ctx *tctx =3D crypto_aead_ctx(tfm);
> +	/* SM4 always uses 128-bit keys */
> +	if (keylen !=3D CMH_SM4_KEY_SIZE)
> +		return -EINVAL;
> +
> +	if (tctx->sw_cipher) {
> +		int ret;
> +
> +		ret =3D crypto_cipher_setkey(tctx->sw_cipher, key, keylen);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return cmh_key_setkey_raw(&tctx->key, key, keylen, CORE_ID_SM4);
> +}

[Severity: Medium]
Could this leave the transform context in a torn state if the hardware key
setup fails?

If cmh_key_setkey_raw() returns an error, the software cipher has already=20
been updated with the new key. Empty inputs might then be processed by the=
=20
software fallback using the new key, while non-empty inputs could be=20
processed by the hardware using the old key.=20

Would it be safer to only update the software cipher after the hardware=20
key setup succeeds?

> diff --git a/drivers/crypto/cmh/cmh_sm4_cmac.c b/drivers/crypto/cmh/cmh_s=
m4_cmac.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_sm4_cmac.c
[ ... ]
> +static int cmh_sm4_mac_init(struct ahash_request *req)
> +{
> +	struct cmh_sm4_mac_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	memset(rctx, 0, sizeof(*rctx));
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	return 0;
> +}

[Severity: High]
Does this leak accumulated chunks if the request is re-initialized?

The ahash cmh_sm4_mac_init() function simply zero-fills the request
context, which abandons any chunks previously allocated and appended to
tctx->all_chunks. Since these chunks are only freed during the teardown
in cmh_sm4_mac_exit_tfm(), could repeated initializations cause an
unbounded memory leak leading to an out of memory condition?

[ ... ]
> +err_free_chunks:
> +	/*
> +	 * Terminal error -- free all previously accumulated chunks.
> +	 * callers may not call .final() on error, so they would leak.
> +	 */
> +	cmh_sm4_mac_free_chunks(rctx, tctx);
> +	return ret;
> +}

[Severity: High]
Can this error path in cmh_sm4_mac_update() lead to an uninitialized
memory leak to user-space?

If an error occurs and it jumps to err_free_chunks, it frees the=20
accumulated chunks but does not reset rctx->total_len.=20
   =20
If a caller subsequently invokes final(), the code uses this stale=20
rctx->total_len to allocate the buffer:

rctx->buf =3D kmalloc(rctx->total_len, gfp);

Since the chunk list is empty, nothing is copied into the buffer, leaving=20
it fully uninitialized. This uninitialized kernel memory is then DMA-mapped=
=20
and passed to the hardware for MAC tag generation, which could expose=20
sensitive kernel memory when the tag is returned.

[ ... ]
> +static int cmh_sm4_mac_export(struct ahash_request *req, void *out)
> +{
> +	struct cmh_sm4_mac_reqctx *rctx =3D ahash_request_ctx(req);
> +	struct cmh_sm4_mac_export_state *state =3D out;
> +	struct cmh_sm4_mac_chunk *chunk;
> +	u32 offset =3D 0;
> +
> +	if (rctx->total_len > CMH_SM4_MAC_EXPORT_MAX)
> +		return -ENOSPC;

[Severity: High]
Does this break the crypto API contract for ahash export?

The driver allows accumulating up to 64KB in cmh_sm4_mac_update(), but=20
cmh_sm4_mac_export() strictly checks against CMH_SM4_MAC_EXPORT_MAX (which=
=20
is slightly under 4KB). If a caller accumulates more than this threshold=20
and calls export(), it will fail with ENOSPC.=20

Since the API requires export() to succeed when provided a buffer of=20
exactly statesize, will this unexpectedly break subsystems like IPsec=20
that clone ahash states?

[ ... ]
> +static int cmh_sm4_mac_import(struct ahash_request *req, const void *in)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_sm4_mac_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct cmh_sm4_mac_reqctx *rctx =3D ahash_request_ctx(req);
> +	const struct cmh_sm4_mac_export_state *state =3D in;
> +	struct cmh_sm4_mac_chunk *chunk;
> +
> +	/*
> +	 * Do NOT call free_chunks() here: the crypto API does not
> +	 * guarantee the request context is in a valid state before
> +	 * import(), so the list pointers may be stale or invalid.
> +	 * Re-initialize from scratch instead.  Any pre-existing chunks
> +	 * are tracked on tctx->all_chunks and freed in exit_tfm.
> +	 */
> +	memset(rctx, 0, sizeof(*rctx));
> +	INIT_LIST_HEAD(&rctx->chunks);

[Severity: High]
Could this memset abandon existing chunks similar to the init() function?

When the crypto API imports state, the request context might already=20
contain active allocations. Zeroing it out directly abandons them in=20
tctx->all_chunks, creating another pathway for unbounded memory leaks.

> +
> +	if (state->total_len > CMH_SM4_MAC_EXPORT_MAX)
> +		return -EINVAL;
> +
> +	if (state->total_len) {
> +		chunk =3D kmalloc(sizeof(*chunk) + state->total_len, GFP_KERNEL);

[Severity: High]
Is it safe to use GFP_KERNEL here?

The crypto API allows import() to be called from atomic or softirq=20
contexts, such as when the networking stack restores IPsec states. Using=20
GFP_KERNEL here allows direct reclaim, which could result in a scheduling
while atomic bug or deadlock.

> diff --git a/drivers/crypto/cmh/cmh_sm4_skcipher.c b/drivers/crypto/cmh/c=
mh_sm4_skcipher.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_sm4_skcipher.c
[ ... ]
> +static void cmh_sm4_update_iv(struct skcipher_request *req, u32 mode,
> +			      u32 op, const u8 *in_buf, const u8 *out_buf)
> +{
> +	u32 bs =3D CMH_SM4_BLOCK_SIZE;
> +	u32 nblocks;
> +
> +	switch (mode) {
[ ... ]
> +	case SM4_MODE_CFB:
> +		/*
> +		 * For sub-block requests (cryptlen < 16), there is no
> +		 * complete ciphertext block to chain, so the IV is left
> +		 * unchanged -- CFB-128 has no defined chaining semantic
> +		 * for partial blocks (shift-register CFB-n is a different
> +		 * mode).  Without this guard the pointer arithmetic
> +		 * underflows and reads before the buffer.
> +		 */
> +		if (req->cryptlen >=3D bs) {
> +			if (op =3D=3D SM4_OP_ENCRYPT)
> +				memcpy(req->iv, out_buf + req->cryptlen - bs,
> +				       bs);
> +			else
> +				memcpy(req->iv, in_buf + req->cryptlen - bs,
> +				       bs);
> +		}
> +		break;

[Severity: High]
Will this copy an invalid IV for unaligned CFB requests?

If req->cryptlen is not a multiple of the 16-byte block size, this pointer=
=20
arithmetic will copy a mix of bytes from the last full ciphertext block and=
=20
the final partial block.=20
   =20
Since CFB-128 strictly requires full 128-bit blocks for its feedback=20
mechanism, this looks like it creates a shift-register style IV.=20
Could this result in corrupted ciphertext on chained sub-block requests?

[ ... ]
> +static int cmh_sm4_crypt(struct skcipher_request *req, u32 sm4_op)
> +{
> +	struct crypto_skcipher *tfm =3D crypto_skcipher_reqtfm(req);
> +	struct cmh_sm4_tfm_ctx *tctx =3D crypto_skcipher_ctx(tfm);
[ ... ]
> +	rctx->in_buf =3D kmalloc(req->cryptlen, gfp);
> +	if (!rctx->in_buf)
> +		return -ENOMEM;

[Severity: High]
Can this allocation exceed the maximum kmalloc limits?

The req->cryptlen value is user-controlled and can be up to 32MB=20
(CMH_SM4_MAX_CRYPTLEN). Passing this directly to kmalloc() exceeds=20
the typical maximum page order limit (usually 4MB or 8MB).=20

If a large payload is submitted, this will fail and trigger a page=20
allocation warning in the kernel log. Could this be exploited by an=20
unprivileged user to cause log spam or a denial of service? Would=20
a scatter-gather approach or chunking be more appropriate here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D9
