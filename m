Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1510344040
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787696929; cv=none; b=b40HCK0W2XNyxtnQiSSkPVD7enivFXK+eu++XHxGk5XIQ3fSOkbbJ7XRUGa8KWZLwh0ue6L3pagVAeJD4VJwbFycP//HKj6QryShed3kvb3LWmakyuwVJVOlAegyVWA/E90qKI2ehYTk5JAkVnZKR+d7KmKcGPcHmKiT2j/SUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787696929; c=relaxed/simple;
	bh=lWZ2S5cVyzq+KbBrsB/kFXf/r3W21SDVSX6K0pWiGa0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KsOK/pM6cQphillfMKb6R7g3DmV43pEA4wIKmeH303MapyaSCM4f9DXKyIebTjdHh5i7KylKuGyBf9Pl4vvv6l0vrxTc15+LgcriKlIC+TcK/Or9DXkbjAPMB7iYLvTgxWe08llmQC38GTG+e6GB9M3HczfFCAx7zGoJWyzJ/tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Db2XujeT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Db2XujeT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338B31F000E9;
	Tue, 25 Aug 2026 22:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787696927;
	bh=PqKpUrZSU83ktmEO4TLN3jKayKwiJ0YqZmJMTXxFksM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Db2XujeTQZPh9qm7PeqLwZ8PfFUa7n++UU5x4/5GO47sSSQ/LQpV4GTN+t98SQNRH
	 OcYsnvWg5C7JEFEdgpLSyOE/K/QILu+IBePKw1RhUcCmJIGNmUkPOGQA4VO2U+/Ahq
	 p05ci77vYU1+PMLqx3BtxkW2oyIkKK7QETRsy6VhyGiZqHbqzyTrgTZyzk2irk2CxX
	 +BZFfOR1WhAdsoF5IBJDZPziVAtzi5DWbM9RujGFHpshAdRXFZJ0kZIpKDKIZszNpU
	 vIZs+93o/olhv6XTGe6VXVmYXngrbiFb7pTpUmtWG28Y3bfWTiYL57Xid3Gi3HvQV5
	 1l9C++hCcnFDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/19] crypto: cmh - add AES skcipher/aead/cmac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825221539.255951-9-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-9-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:28:46 +0000
Message-Id: <20260825222847.338B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Aborted or re-initialized `cmac(aes)` ahash requests leak accumula=
ted dynamically allocated chunks until TFM destruction, allowing trivial ke=
rnel memory exhaustion (OOM).
- [High] Incorrect IV state update in `cmh_aes_update_iv` for AES-CFB mode =
with partial blocks breaks cipher chaining.
- [Medium] The skcipher driver attempts to kmalloc up to 32MB for input/out=
put buffers, deterministically failing for valid large requests.
--

commit 0ec57ce28ce08fa19d032fb79fd5650db5f53a75
Author: Alex Ousherovitch <aousherovitch@rambus.com>
Subject: crypto: cmh - add AES skcipher/aead/cmac

This commit registers AES algorithms using the CMH AES core for skcipher,
aead, and ahash interfaces. It handles key management, context setup, and
VCQ command sequencing for encryption and authentication.

> diff --git a/drivers/crypto/cmh/cmh_aes.c b/drivers/crypto/cmh/cmh_aes.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_aes.c
[ ... ]
> +static void cmh_aes_update_iv(struct skcipher_request *req, u32 mode,
> +			      u32 op, const u8 *in_buf, const u8 *out_buf)
> +{
> +	u32 bs =3D CMH_AES_BLOCK_SIZE;
> +	u32 nblocks;
> +
> +	switch (mode) {
[ ... ]
> +	case AES_MODE_CFB:
> +		/*
> +		 * CFB-128 chains on the last ciphertext block.  On encrypt,
> +		 * that is out_buf; on decrypt, it is in_buf.
> +		 *
> +		 * For sub-block requests (cryptlen < 16), there is no
> +		 * complete ciphertext block to chain, so the IV is left
> +		 * unchanged -- CFB-128 has no defined chaining semantic
> +		 * for partial blocks (shift-register CFB-n is a different
> +		 * mode).  Without this guard the pointer arithmetic
> +		 * underflows and reads before the buffer.
> +		 */
> +		if (req->cryptlen >=3D bs) {
> +			if (op =3D=3D AES_OP_ENCRYPT)
> +				memcpy(req->iv, out_buf + req->cryptlen - bs,
> +				       bs);
> +			else
> +				memcpy(req->iv, in_buf + req->cryptlen - bs,
> +				       bs);
> +		}
> +		break;

[Severity: High]
When dealing with partial blocks in CFB mode where req->cryptlen is not a=20
multiple of the block size, will the offset calculation (req->cryptlen - bs)
point to an unaligned offset rather than the last full block boundary? The=
=20
next operation in a chained CFB stream requires the last full ciphertext=20
block for the chaining IV, so could this break the cipher chaining by=20
copying the wrong bytes?

[ ... ]
> +#define CMH_AES_MAX_CRYPTLEN	SZ_32M
[ ... ]
> +static int cmh_aes_crypt(struct skcipher_request *req, u32 aes_op)
> +{
[ ... ]
> +	if (req->cryptlen > CMH_AES_MAX_CRYPTLEN)
> +		return -EINVAL;
[ ... ]
> +	/*
> +	 * Linearise input from scatterlist.  cryptlen is user-controlled up
> +	 * to CMH_AES_MAX_CRYPTLEN (well above KMALLOC_MAX_SIZE), so use
> +	 * __GFP_NOWARN: an oversized request fails cleanly with -ENOMEM
> +	 * instead of splatting the page allocator.
> +	 */
> +	rctx->in_buf =3D kmalloc(req->cryptlen, gfp | __GFP_NOWARN);
> +	if (!rctx->in_buf)
> +		return -ENOMEM;

[Severity: Medium]
Does this driver attempt to allocate up to 32MB of physically contiguous=20
memory via kmalloc() for the input and output buffers? While the __GFP_NOWA=
RN=20
flag ensures a clean failure, any valid request larger than KMALLOC_MAX_SIZ=
E=20
(typically 4MB or 8MB) will deterministically fail with -ENOMEM. Would it b=
e=20
better to cap the maximum length to KMALLOC_MAX_SIZE instead of 32MB, or=20
process the buffers in smaller chunks?

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
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	return 0;
> +}

[Severity: High]
If a user opens an AF_ALG socket, accumulates data by calling=20
crypto_ahash_update(), and then calls crypto_ahash_init() to reset the hash=
=20
state, won't this memset() clear the rctx->chunks list head and leak the=20
dynamically allocated chunks? The orphaned chunks would remain on=20
tctx->all_chunks indefinitely until the long-lived TFM is destroyed, which=
=20
could allow unprivileged userspace to easily exhaust kernel memory.

[ ... ]
> +static int cmh_aes_cmac_import(struct ahash_request *req, const void *in)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_aes_cmac_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct cmh_aes_cmac_reqctx *rctx =3D ahash_request_ctx(req);
> +	const struct cmh_aes_cmac_export_state *state =3D in;
> +	struct cmh_aes_cmac_chunk *chunk;
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
Similarly, if a caller performs a state import over a request that has=20
already accumulated data in its own chunk list, doesn't this memset() also=
=20
strand any previously allocated chunks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D8
