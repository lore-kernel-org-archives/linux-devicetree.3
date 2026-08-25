Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EC238B7BA
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787696751; cv=none; b=JOVPVOJtZ/hSWJNnhgqTROeDG55Yz3b3zH0Nx/pDrAEqbzGEa+2ekTf4vJ6q1LU9lB48ap98+7U0zmWsq0ZztQdtsvm2mv3LdhDcl0LqNiXf8lwgkyqN5b46XcLmgcEuzaufn5QHbZ2qLP+ubC+TrUNvBAZw23aDvUYGkqk8zbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787696751; c=relaxed/simple;
	bh=3sQbqGqknMiy9dJAsPFknTLxsnt6tYUfEHpWsmidi7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XtmlSwPBcJtH5PSW403ZlglEl62pLOE8gvjh9ssGsVdxpBF2Xxr3QF/UTTskTsIxpTVwY10OzI8dpsRhNtDnQYt95j9UD2Zpsvr2FtR/ox3m15Tjv9prZB5/8Q50pqaMrlW2Auxha9qHECIEg9KFgWI4JWHDj0BSNFYBXRXfK4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeSIJXJ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeSIJXJ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C051F000E9;
	Tue, 25 Aug 2026 22:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787696749;
	bh=XImGSa6QMDpp3AXRUyiHkkFSGTA15MyNUAOivzoQEeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JeSIJXJ2Cd86+7facBJfvThs1I2KVyQT2gsDqHAt4WIFAqVst7aT6Tei7khFSgBdB
	 8c4twjiAEUWPwiYiQnL9GqyeJh0nZ7RDfi7bripaRfjtaoPftbySQTR7+PIpF969+D
	 LGzpe3GJsFqqaTap02UE4rNOwRXK2/Y0FvzcwcUk/Ri10jvF4kL3AT6K86MqUTWanc
	 eAK9DkJrPRlDTdceMYvhJyR3a+N/xW24AOdAi0hpOnIRlDcjOJ/bsZHn/8m715Roul
	 zTYIrIWM1mf6AO+pOWcdalniN5mOaGkNnL0srkrKwpLUaMtdL97VdkhN7/L0qX9u2a
	 jU/4IX8JA2J0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/19] crypto: cmh - add SM4 skcipher/aead/cmac/xcbc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825221539.255951-10-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-10-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:25:48 +0000
Message-Id: <20260825222549.53C051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unbounded kernel memory leak (OOM DoS) in SM4 MAC algorithms becau=
se dynamically allocated chunks are orphaned during request abortion or reu=
se, accumulating indefinitely on the TFM.
--

commit f6248f275c474337a22de8db8f15496b964e8dc8
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SM4 skcipher/aead/cmac/xcbc

This commit registers SM4 algorithms using the CMH SM4 core. It adds support
for various skcipher, aead, and ahash (CMAC and XCBC) operations.

> diff --git a/drivers/crypto/cmh/cmh_sm4_cmac.c b/drivers/crypto/cmh/cmh_s=
m4_cmac.c
> new file mode 100644
> index 0000000000000..acf654d98b0b4
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
Does this code leak cmh_sm4_mac_chunk structures if a request is reused?

By clearing rctx without freeing pre-existing chunks, it appears those chun=
ks
become permanently stranded on the tctx->all_chunks list until the entire T=
FM
is destroyed.

[ ... ]

> +static int cmh_sm4_mac_update(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_sm4_mac_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct cmh_sm4_mac_reqctx *rctx =3D ahash_request_ctx(req);
> +	struct cmh_sm4_mac_chunk *chunk;

[ ... ]

> +	chunk->len =3D req->nbytes;
> +	if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
> +		memcpy(chunk->data, req->svirt, req->nbytes);
> +	else
> +		scatterwalk_map_and_copy(chunk->data, req->src,
> +					 0, req->nbytes, 0);
> +	list_add_tail(&chunk->list, &rctx->chunks);
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +	spin_unlock_bh(&tctx->chunk_lock);
> +	rctx->total_len +=3D req->nbytes;
> +	return 0;

[Severity: High]
Can this lead to an unbounded memory leak and subsequent kernel OOM if a us=
er
creates an AF_ALG socket, streams data via cmh_sm4_mac_update(), and then
closes the socket without calling final?

Since the dynamically allocated chunks are tied to the TFM's lifetime on
tctx->all_chunks and the crypto API destroys the request without calling a
driver cleanup callback, an unprivileged local user could potentially trigg=
er
this accumulation indefinitely, causing a denial of service.

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
Is it safe to intentionally strand previous chunks here?

Because they are only cleaned up in exit_tfm instead of when the request
state is replaced, a rapid sequence of export and import operations on the
same request could quickly exhaust kernel memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D9
