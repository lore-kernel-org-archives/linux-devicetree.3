Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7864F38757B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047167; cv=none; b=lVceFpzYinBy/0ex4mB2nGLcTT/MxEZOxmwh5iVxI++dtcfNi3FNe7t85eChKUGgLUFwdYlZ7+mneCssGB1VeLe5ee8oQRvwXlR9/otongaVmBWOJrln9UqLBKZXF3eCTDDAJWzMfTRH3tz1IqntcMaC/IrLtEupUK6Wb55Rpjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047167; c=relaxed/simple;
	bh=IFQ+ydRkePuYTG1U/66BEp92nkrvv0T/Az1lDxC288M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LBXH8OyUyX9QXhcyQq/H1ZkgEMEi1c/Mx5LNcZIv62cp8Zt9rAEectyqPgqo8umDuWPwTB/hKXA62Ir8DhrI727rdg56TTrZ+abiBIUoQ71CYNRJuLdSNQ+8+PMISgzcTCNitZUTn/9mgHHnvqC/L1IbpUWMnqodyw/5qWyw300=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVRP/l2L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVRP/l2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BEE1F000E9;
	Thu,  6 Aug 2026 20:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047162;
	bh=6JTMeDu8keIPm1jJBSfT9IWC2FeYykkLp1LIP70P45A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MVRP/l2LgzzdZPLvOywbFvVj3bxpBmlPcTyQ4wR0rGnL1Uid8TFmgeGFhtZRiKyNY
	 5oyUfPdcDr2JekpTn4thpDtha6NrTuFQ4ArVc9uHVFuWtsRM8TXd/frIBpCom76L4f
	 aDfA38EGmE+mdlMPms3Rkp4Gl3LORWd5je6onFK8v/NDyVo3KOret+5Xi9NKIN97fs
	 +KxKMDijmEaasskE6ZBnsORsgpMwC1/4Zjt9pXDzb7RcvZPMdRcDegE/mX+QjWh3N0
	 sthntunyymrV+HGEPti3s2ICsZeZn4EorFGjZ+BY8QOpktH3/wut1C8VY9Vyo9r5fx
	 +yUG/0/GzEp6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/19] crypto: cmh - add ChaCha20-Poly1305
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806195519.2703224-11-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-11-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:12:41 +0000
Message-Id: <20260806201242.12BEE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The Poly1305 driver dynamically allocates memory chunks for ahash =
requests which are permanently leaked when a request is aborted, re-initial=
ized, or imported, leading to an unbounded memory leak and Denial of Servic=
e (OOM).
- [High] The driver maps an unaligned memory offset for DMA and shares a ca=
cheline with frequently CPU-mutated fields, violating architecture cachelin=
e alignment rules.
- [High] The driver allocates huge contiguous buffers (up to 1MB) using `km=
alloc` without `__GFP_NOWARN` in potentially atomic contexts, which will re=
liably trigger page allocation failures.
--

--- Patch [10]: [PATCH v3 10/19] crypto: cmh - add ChaCha20-Poly1305 ---
commit 736bbd76828dea383bcdcc54143a0030ecd02a41
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add ChaCha20-Poly1305

Register ChaCha20-Poly1305 AEAD and ChaCha20 skcipher algorithms
using the CMH CCP core (core ID 0x18).  Also registers the Poly1305
ahash for standalone use.

> diff --git a/drivers/crypto/cmh/cmh_ccp.c b/drivers/crypto/cmh/cmh_ccp.c
> index 0000000000000..babf6ffe6ff09
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_ccp.c

[ ... ]

> @@ -175,34 +175,34 @@ static int cmh_ccp_crypt(struct skcipher_request *r=
eq, u32 ccp_op)
>  	struct crypto_skcipher *tfm =3D crypto_skcipher_reqtfm(req);
>  	struct cmh_ccp_tfm_ctx *tctx =3D crypto_skcipher_ctx(tfm);
>  	struct cmh_ccp_reqctx *rctx =3D skcipher_request_ctx(req);
>  	struct vcq_cmd cmds[CMH_CCP_MAX_PAYLOAD];
>  	u64 key_ref;
>  	u32 keylen;
>  	struct core_dispatch d;
>  	s32 target_mbx;
>  	u32 core_id;
>  	u32 idx;
>  	int ret;
>  	gfp_t gfp;
> =20
>  	if (tctx->key.mode =3D=3D CMH_KEY_NONE)
>  		return -ENOKEY;
> =20
>  	if (!req->cryptlen)
>  		return 0;
> =20
>  	/* Limit linearisation buffers to avoid large allocations. */
>  	if (req->cryptlen > SZ_1M)
>  		return -EINVAL;
> =20
>  	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
>  	      GFP_KERNEL : GFP_ATOMIC;
> =20
>  	memset(rctx, 0, sizeof(*rctx));
>  	rctx->cryptlen =3D req->cryptlen;
> =20
>  	/* Linearise input from scatterlist */
>  	rctx->in_buf =3D kmalloc(req->cryptlen, gfp);

[Severity: High]
Does this code risk triggering reliable page allocation failures?

In cmh_ccp_crypt() (drivers/crypto/cmh/cmh_ccp.c), since cryptlen can be up=
 to
1MB, calling kmalloc() with GFP_ATOMIC for high-order allocations is highly
susceptible to memory fragmentation and will fail frequently.=20

Since __GFP_NOWARN is not used, these failures will also spam the kernel log
with stack traces, causing a denial of service.

[ ... ]

> diff --git a/drivers/crypto/cmh/cmh_ccp_aead.c b/drivers/crypto/cmh/cmh_c=
cp_aead.c
> index 0000000000000..df5482179bdc4
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_ccp_aead.c

[ ... ]

> @@ -235,36 +235,36 @@ static int cmh_ccp_aead_crypt(struct aead_request *=
req, u32 ccp_op)
>  	struct crypto_aead *tfm =3D crypto_aead_reqtfm(req);
>  	struct cmh_ccp_aead_tfm_ctx *tctx =3D crypto_aead_ctx(tfm);
>  	struct cmh_ccp_aead_reqctx *rctx =3D aead_request_ctx(req);
>  	struct vcq_cmd cmds[CMH_CCP_AEAD_MAX_PAYLOAD];
>  	u64 key_ref;
>  	u32 keylen, authsize, cryptlen;
>  	struct core_dispatch d;
>  	s32 target_mbx;
>  	u32 core_id;
>  	u32 idx;
>  	int ret;
>  	gfp_t gfp;
> =20
>  	if (tctx->key.mode =3D=3D CMH_KEY_NONE)
>  		return -ENOKEY;
> =20
>  	authsize =3D tctx->authsize;
> =20
>  	if (ccp_op =3D=3D CCP_OP_ENCRYPT) {
>  		cryptlen =3D req->cryptlen;
>  	} else {
>  		if (req->cryptlen < authsize)
>  			return -EINVAL;
>  		cryptlen =3D req->cryptlen - authsize;
>  	}
> =20
>  	/*
>  	 * HW uses a proprietary LLI scatter-gather format that is
>  	 * incompatible with struct scatterlist, so the payload is
>  	 * linearised into contiguous buffers for DMA.  Cap total
>  	 * size to prevent excessive memory consumption.
>  	 */
>  	if ((u64)cryptlen + req->assoclen > SZ_1M)
>  		return -EINVAL;
> =20
>  	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
>  	      GFP_KERNEL : GFP_ATOMIC;
> =20
>  	memset(rctx, 0, sizeof(*rctx));
>  	rctx->cryptlen =3D cryptlen;
>  	rctx->assoclen =3D req->assoclen;
>  	rctx->authsize =3D authsize;
>  	rctx->encrypting =3D (ccp_op =3D=3D CCP_OP_ENCRYPT);
> =20
>  	/*
>  	 * rfc7539esp: the last ivsize (8) bytes of the AAD region are the
>  	 * IV/nonce, not actual associated data.  Subtract them so HW only
>  	 * authenticates the real AAD.
>  	 */
>  	if (crypto_aead_ivsize(tfm) =3D=3D CCP_ESP_IV_SIZE) {
>  		if (rctx->assoclen < CCP_ESP_IV_SIZE)
>  			return -EINVAL;
>  		rctx->assoclen -=3D CCP_ESP_IV_SIZE;
>  	}
> =20
>  	/* Linearise AAD */
>  	if (rctx->assoclen > 0) {
>  		rctx->aad_buf =3D kmalloc(rctx->assoclen, gfp);
>  		if (!rctx->aad_buf)
>  			return -ENOMEM;
>  		scatterwalk_map_and_copy(rctx->aad_buf, req->src,
>  					 0, rctx->assoclen, 0);
>  		rctx->aad_dma =3D cmh_dma_map_single(rctx->aad_buf,
>  						   rctx->assoclen,
>  						    DMA_TO_DEVICE);
>  		if (cmh_dma_map_error(rctx->aad_dma)) {
>  			ret =3D -ENOMEM;
>  			goto out_free_aad;
>  		}
>  	}
> =20
>  	/* Linearise input */
>  	if (cryptlen > 0) {
>  		rctx->in_buf =3D kmalloc(cryptlen, gfp);

[Severity: High]
Does this face the same allocation failure risk as in cmh_ccp_crypt()?

In cmh_ccp_aead_crypt() (drivers/crypto/cmh/cmh_ccp_aead.c), with allocatio=
ns
up to 1MB and GFP_ATOMIC context, high-order memory allocations could fail=
=20
easily and produce large stack trace spam without __GFP_NOWARN.

[ ... ]

> diff --git a/drivers/crypto/cmh/cmh_ccp_poly.c b/drivers/crypto/cmh/cmh_c=
cp_poly.c
> index 0000000000000..0f783a98d54de
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_ccp_poly.c

[ ... ]

> @@ -62,14 +62,14 @@
>   */
>  struct cmh_poly_tfm_ctx {
>  	u8  key[POLY1305_KEY_SIZE];
>  	dma_addr_t rkey_dma;
>  	dma_addr_t skey_dma;
>  	u32 keylen;
>  	bool has_key;
>  	spinlock_t         chunk_lock;  /* protects all_chunks */
>  	struct list_head   all_chunks;  /* orphan-safe chunk tracking */
>  };

[Severity: High]
Can this structure layout cause data corruption on non-cache-coherent=20
architectures?

In struct cmh_poly_tfm_ctx (drivers/crypto/cmh/cmh_ccp_poly.c), the key arr=
ay=20
is mapped for DMA. Since it shares a cacheline with chunk_lock and all_chun=
ks,=20
CPU modifications to these fields could be lost or corrupted during DMA cac=
he=20
clean/invalidate operations.

[ ... ]

> @@ -144,32 +144,32 @@ static int cmh_poly_setkey(struct crypto_ahash *tfm=
, const u8 *key,
>  			   unsigned int keylen)
>  {
>  	struct cmh_poly_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> =20
>  	/* Poly1305: exactly 32 bytes (r[16] + s[16]) */
>  	if (keylen !=3D POLY1305_KEY_SIZE)
>  		return -EINVAL;
> =20
>  	/* Unmap old key DMA if re-keying */
>  	if (tctx->has_key) {
>  		cmh_dma_unmap_single(tctx->rkey_dma, CCP_POLY_KEY_SIZE,
>  				     DMA_TO_DEVICE);
>  		cmh_dma_unmap_single(tctx->skey_dma, CCP_POLY_KEY_SIZE,
>  				     DMA_TO_DEVICE);
>  	}
> =20
>  	memcpy(tctx->key, key, POLY1305_KEY_SIZE);
>  	tctx->keylen =3D POLY1305_KEY_SIZE;
> =20
>  	/*
>  	 * Pre-map both key halves for DMA.  The key buffer lives in
>  	 * the tfm context and is stable until exit_tfm() or re-setkey.
>  	 */
>  	tctx->skey_dma =3D cmh_dma_map_single(tctx->key + CCP_POLY_KEY_SIZE,
>  					    CCP_POLY_KEY_SIZE,
>  					     DMA_TO_DEVICE);

[Severity: High]
Does this break architecture alignment rules?

In cmh_poly_setkey() (drivers/crypto/cmh/cmh_ccp_poly.c), mapping tctx->key=
 + 16
(CCP_POLY_KEY_SIZE) means the buffer offset isn't ARCH_DMA_MINALIGN aligned.

[ ... ]

> @@ -245,15 +245,15 @@ static void cmh_poly_fb_forward(struct ahash_reques=
t *req,
>  				struct cmh_poly_reqctx *rctx)
>  {
>  	if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
>  		poly1305_update(&rctx->fb_state, req->svirt, req->nbytes);
>  	else
>  		cmh_poly_fb_feed_sg(&rctx->fb_state, req->src, req->nbytes);
>  }
> =20
>  static int cmh_poly_init(struct ahash_request *req)
>  {
>  	struct cmh_poly_reqctx *rctx =3D ahash_request_ctx(req);
> =20
>  	memset(rctx, 0, sizeof(*rctx));
>  	INIT_LIST_HEAD(&rctx->chunks);
>  	return 0;
>  }

[Severity: High]
Does this leak any chunks accumulated in a previous update call?

In cmh_poly_init() (drivers/crypto/cmh/cmh_ccp_poly.c), if this function or=
=20
cmh_poly_import() is called on an active request, the memset() overwrites t=
he=20
rctx->chunks list head, silently orphaning any existing chunks and leaking=
=20
memory.

[ ... ]

> @@ -262,35 +262,35 @@ static int cmh_poly_update(struct ahash_request *re=
q)
>  {
>  	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
>  	struct cmh_poly_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
>  	struct cmh_poly_reqctx *rctx =3D ahash_request_ctx(req);
>  	struct cmh_poly_chunk *chunk;
>  	gfp_t gfp;
>  	int ret;
> =20
>  	if (!req->nbytes)
>  		return 0;
> =20
>  	/* Already handed off to the library: forward directly (O(1) mem). */
>  	if (rctx->switched) {
>  		cmh_poly_fb_forward(req, rctx);
>  		return 0;
>  	}
> =20
>  	/*
>  	 * Exceeding the HW input cap: switch to the Poly1305 library
>  	 * (replaying the buffered chunks) rather than failing, then
>  	 * forward this update.
>  	 */
>  	if (req->nbytes > POLY_MAX_DATA - rctx->total_len) {
>  		ret =3D cmh_poly_switch_to_fb(req);
>  		if (ret)
>  			goto err_free_chunks;
>  		cmh_poly_fb_forward(req, rctx);
>  		return 0;
>  	}
> =20
>  	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
>  	      GFP_KERNEL : GFP_ATOMIC;
>  	chunk =3D kmalloc(sizeof(*chunk) + req->nbytes, gfp);
>  	if (!chunk) {
>  		ret =3D -ENOMEM;
>  		goto err_free_chunks;
>  	}
> =20
>  	chunk->len =3D req->nbytes;
>  	if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
>  		memcpy(chunk->data, req->svirt, req->nbytes);
>  	else
>  		scatterwalk_map_and_copy(chunk->data, req->src,
>  					 0, req->nbytes, 0);
>  	list_add_tail(&chunk->list, &rctx->chunks);
>  	spin_lock_bh(&tctx->chunk_lock);
>  	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
>  	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Does this leak memory if the request is closed by userspace before final() =
is=20
called?

In cmh_poly_update() (drivers/crypto/cmh/cmh_ccp_poly.c), if an unprivilege=
d=20
local attacker uses AF_ALG to hash data, calls update(), and then closes th=
e=20
socket, the crypto ahash API has no .freereq callback to clean up.=20

The chunks allocated here will be orphaned and remain on tctx->all_chunks=20
indefinitely until the TFM is destroyed, leading to an unbounded memory lea=
k=20
and system OOM.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D10
