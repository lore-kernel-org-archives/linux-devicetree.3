Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F2488D9C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047005; cv=none; b=fiCrqcKjkWeI+oADqqSOfcdqmkf1Q3fsl5I7QUmqFlgeyjBMUeQimcfH5r38sYDEBFnVxgVr0Vb2cCzSOkAS2lEG44UIaih7NUTXTbL3gwQvyp4clHkrUuqDLu6OcSO5+G/hqmSgiuLlLkGUS/xsmbgwDtNHzhKnD0Pdcoaz57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047005; c=relaxed/simple;
	bh=ZLbyzQ4xeet0OwWNsL+nq2UhQuQkRRZ+AuoDAd+5/bA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iQufit+PHtiSHMlp04wN92YOsa8lJwJ6S5qGiXFiyizrvyg/EOusAWiGweG3i0w0b8XpUhsV+94GnMMgokgQ7Lk/owuH/rqws/Qdl/NZfDOM4dgOtSveVMZQWB9eQhM1BVhWLY1+oEwHoKGwg2mPbY7unIfzKtpsl+iilVnsNQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzgsnXyU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzgsnXyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D921F000E9;
	Thu,  6 Aug 2026 20:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786046995;
	bh=o2UxsSjjGViupHrygmmEVaRbfPbvQ+HCe37DJ53qpV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YzgsnXyU4y1dbGC+8LDeVze9rgxwn6toon2svnGH1QP+oAM+9OmqH2033c4UDKfCp
	 WViQFiA7KlO+WccvfgQQqW0gU+kbYHjgD35MmdMdnMDMc+f2Jb4dVr0szRAdCDVwWh
	 M+QVW8VbmT74LEPLp5GYn6ZZg//fihNSG0ry5DNLV1QTeklkC2Ct4qQhtD4EOTqrFQ
	 uojCVk6EtjnvLPvNpGq5tWXHmfrra8vnN2Eani2y+8cdIFshc0rdNkrH+unCYTkv/4
	 gbPpx4gZbTJu2x/Q3e32+DS7zoTidE2a6zpu4koEu1iyPFBTTJum1k6t2Z3eRWZFGD
	 c+QsMADTxZ8kA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/19] crypto: cmh - add SM4 skcipher/aead/cmac/xcbc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806195519.2703224-10-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-10-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:09:55 +0000
Message-Id: <20260806200955.97D921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] CTR and CFB modes declare 1-byte block size but fail to buffer=
 partial blocks, leading to stream corruption and keystream reuse.
- [High] Unbounded accumulation of dynamically allocated `cmh_sm4_mac_chunk=
` structures on the TFM-global list (`tctx->all_chunks`), leading to Denial=
 of Service (OOM) via long-lived TFMs.
- [Medium] High-order kmalloc() is used for DMA linearisation of large payl=
oad buffers without __GFP_NOWARN, causing kernel splats and predictable all=
ocation failures.
--

--- Patch [9]: [PATCH v3 09/19] crypto: cmh - add SM4 skcipher/aead/cmac/xc=
bc ---
commit 8ef288abe6cc9b24616b4ae367d046897f184d01
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SM4 skcipher/aead/cmac/xcbc

This commit registers SM4 algorithms using the CMH SM4 core, including
skcipher, aead, and ahash variants.

[ ... ]
> diff --git a/drivers/crypto/cmh/cmh_sm4_aead.c b/drivers/crypto/cmh/cmh_s=
m4_aead.c
[ ... ]
> @@ -567,8 +567,6 @@ static int cmh_sm4_aead_crypt(struct aead_request *re=
q, u32 sm4_op)
>  	rctx->authsize =3D authsize;
>  	rctx->encrypting =3D (sm4_op =3D=3D SM4_OP_ENCRYPT);
> =20
>  	/* Linearise AAD */
>  	if (req->assoclen > 0) {
>  		rctx->aad_buf =3D kmalloc(req->assoclen, gfp);

[Severity: Medium]
Will this high-order allocation trigger kernel splats if it fails under mem=
ory
fragmentation? The maximum payload size is checked against 1MB (SZ_1M), whi=
ch
can require an order-8 contiguous page allocation. Because unprivileged use=
rs
can trigger this via AF_ALG, adding the __GFP_NOWARN flag here and for the
input buffer allocation below might be necessary to avoid spamming dmesg.

>  		if (!rctx->aad_buf)
>  			return -ENOMEM;
[ ... ]
> diff --git a/drivers/crypto/cmh/cmh_sm4_cmac.c b/drivers/crypto/cmh/cmh_s=
m4_cmac.c
[ ... ]
> @@ -279,7 +279,6 @@ static int cmh_sm4_mac_init(struct ahash_request *req)
>  {
>  	struct cmh_sm4_mac_reqctx *rctx =3D ahash_request_ctx(req);
> =20
>  	memset(rctx, 0, sizeof(*rctx));
>  	INIT_LIST_HEAD(&rctx->chunks);
>  	return 0;
>  }

[Severity: High]
Does this zero-initialization leak chunks that were previously allocated and
added to the context? If a user-space application opens an AF_ALG socket,
calls update() multiple times (which allocates chunks and links them to both
rctx->chunks and tctx->all_chunks), and then calls accept() to reset the ha=
sh
state, init() will be called again.

Because the old chunks are abandoned on the global tctx->all_chunks list
without being freed here, can this result in an unbounded TFM-global memory
leak and a denial of service (OOM)? The same pattern occurs in
cmh_sm4_mac_import().

[ ... ]
> diff --git a/drivers/crypto/cmh/cmh_sm4_skcipher.c b/drivers/crypto/cmh/c=
mh_sm4_skcipher.c
[ ... ]
> @@ -167,16 +167,11 @@ static void cmh_sm4_update_iv(struct skcipher_reque=
st *req, u32 mode,
>  			      u32 op, const u8 *in_buf, const u8 *out_buf)
>  {
>  	u32 bs =3D CMH_SM4_BLOCK_SIZE;
>  	u32 nblocks;
> =20
>  	switch (mode) {
>  	case SM4_MODE_CBC:
[ ... ]
>  	case SM4_MODE_CTR:
>  		/* Arithmetic big-endian 128-bit counter increment */
>  		nblocks =3D DIV_ROUND_UP(req->cryptlen, bs);

[Severity: Critical]
For CTR mode, since the block size is declared as 1 byte in
cmh_sm4_register(), is it possible for callers to provide partial blocks
(e.g., 5 bytes)?

If so, DIV_ROUND_UP will advance the counter to the next full block (nblock=
s=3D1)
even though the block was only partially consumed. On the next request, the
encryption will start at the next counter block instead of continuing the
keystream from the correct offset, leading to corrupted streams and keystre=
am
reuse.

>  		{
>  			u8 *iv =3D req->iv;
[ ... ]
>  	case SM4_MODE_CFB:
>  		/*
>  		 * For sub-block requests (cryptlen < 16), there is no
>  		 * complete ciphertext block to chain, so the IV is left
>  		 * unchanged -- CFB-128 has no defined chaining semantic
>  		 * for partial blocks (shift-register CFB-n is a different
>  		 * mode).  Without this guard the pointer arithmetic
>  		 * underflows and reads before the buffer.
>  		 */
>  		if (req->cryptlen >=3D bs) {

[Severity: Critical]
Similarly for CFB mode, if a caller issues a sub-block request, the IV upda=
te
is skipped entirely. Will the next sub-block request then reuse the exact s=
ame
IV and keystream, breaking cryptographic confidentiality? Because the algor=
ithm
declares a 1-byte block size, partial block updates need to be properly
buffered instead of skipping the IV update.

>  			if (op =3D=3D SM4_OP_ENCRYPT)
>  				memcpy(req->iv, out_buf + req->cryptlen - bs,
>  				       bs);
>  			else
>  				memcpy(req->iv, in_buf + req->cryptlen - bs,
>  				       bs);
>  		}
>  		break;
[ ... ]
> @@ -379,10 +379,12 @@ static int cmh_sm4_crypt(struct skcipher_request *r=
eq, u32 sm4_op)
> =20
>  	/*
>  	 * cryptlen is user-controlled up to CMH_SM4_MAX_CRYPTLEN (well above
>  	 * KMALLOC_MAX_SIZE), so use __GFP_NOWARN: an oversized request fails
>  	 * cleanly with -ENOMEM instead of splatting the page allocator.
>  	 */
>  	rctx->in_buf =3D kmalloc(req->cryptlen, gfp | __GFP_NOWARN);

[Severity: Medium]
Will this reliably fail with -ENOMEM for valid inputs? The cryptlen limit
CMH_SM4_MAX_CRYPTLEN is set to 32MB, but kmalloc cannot allocate memory bey=
ond
KMALLOC_MAX_SIZE (which is generally much smaller, typically 4MB or 8MB).

>  	if (!rctx->in_buf)
>  		return -ENOMEM;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D9
