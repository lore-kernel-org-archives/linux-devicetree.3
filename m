Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58373CE0A2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629782; cv=none; b=PAooVrDTXkb3vjcV12AqFJjiNMn2+QauWbWCF3Al4noyB7Aa9eG1f1Jfi7BKX44xFnkd0izz+xmlJkIDTvUb9enr9Patn+/OyArkOwqQVLfdrrtSA85JKeoBqOKqnpQLpQ8SG61ZgQAn2cS6rfEe0O/YoFi0eH6e+o3BYWrKB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629782; c=relaxed/simple;
	bh=1zvICOfhyw1LOeVpe1mzyyhA5bIgz1IRxkrlcqnDsjU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gd1azkkmsfC8ZJsbBgWG3rOd+HwRzgoZUwmgc8PO4fVDpvk97Dc/YRwYpwaEoRJoAID+8aOlebaM3GBhHC48v7ufvDdBRNPynQOT7zA9lp0pgCNS1+hYbVMWLxRl+6uxFhBkTQ7IiTWu2SfY4Ce/cg6rW87+7n7e+hfSAdKAvdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsSQijIK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsSQijIK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7841F00A3F;
	Thu,  9 Jul 2026 20:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783629780;
	bh=A+zu/cFqd/F1eq2Dd7B8W/O7aUgKCyrPVTSAv2M7/X4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lsSQijIKd6hlCcw594nXK9P/3ItuMwFVyHeMsC/ItNRykGFtt28eCwiVbei7jJk6S
	 YDM9cZn/XGeE8c2w/19NwIUM5DRI6pN6T4KEcHlZVONY2SFFYez9ljyW4RY6XLNGF4
	 4WEf7lL8vqnKa3JkVNL2qFcPl1f1BTSJYv5lc4fbQsELc4gEver3baHX6/wXXIGsVb
	 YGPyfmVHyLp9qKsGH9IRWsPfyDdthdTvUlIB6V2kQuu/n74QjHmKt3H19SnY1ilLwd
	 jKprDwmM5QfTMx4PkK95NBYfe2VcG2iFuMUnydTpAwK7PSL36Qt1zM9QROsDnD24A6
	 Z6RuSjQxbRhAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/19] crypto: cmh - add HMAC ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709203037.1884436-6-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-6-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:42:59 +0000
Message-Id: <20260709204259.EA7841F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The HMAC driver buffers unbounded input data in software, violatin=
g `ahash` API contracts for arbitrary data lengths and state export.
- [High] Dynamically allocated chunks leak when an ahash request is aborted=
 or reused, allowing an unprivileged local DoS.
- [High] Unconditional use of `GFP_KERNEL` in `cmh_hmac_import` can cause t=
he kernel to sleep in an atomic context.
- [High] Mismatched Core IDs between HMAC Key setup and HMAC operation exec=
ution.
--

--- Patch [5]: [PATCH v2 05/19] crypto: cmh - add HMAC ahash ---
commit dc6fee6be6ca3f7c1ff3752ad3551a1e1e242ea0
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add HMAC ahash

Register ahash algorithms for HMAC-SHA-224, HMAC-SHA-256,
HMAC-SHA-384, HMAC-SHA-512, HMAC-SHA3-224, HMAC-SHA3-256,
HMAC-SHA3-384, and HMAC-SHA3-512 using the CMH hash core.

> diff --git a/drivers/crypto/cmh/cmh_hmac.c b/drivers/crypto/cmh/cmh_hmac.c
> new file mode 100644
> index 0000000000000..1f536088eabf2
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_hmac.c
[ ... ]
> @@ -262,18 +262,14 @@ static int cmh_hmac_setkey(struct crypto_ahash *tfm=
, const u8 *key,
>  			   unsigned int keylen)
>  {
>  	struct cmh_hmac_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> =20
>  	return cmh_key_setkey_raw(&tctx->key, key, keylen, CORE_ID_HC);

[Severity: High]
Is the core ID statically hardcoded to CORE_ID_HC here during key setup?

>  }
> =20
>  static int cmh_hmac_init(struct ahash_request *req)
>  {
>  	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
>  	struct cmh_hmac_reqctx *rctx =3D ahash_request_ctx(req);
> =20
>  	rctx->info =3D cmh_hmac_get_info(tfm);
>  	rctx->error =3D 0;
>  	INIT_LIST_HEAD(&rctx->chunks);

[Severity: High]
If a request is reused (for example, by calling crypto_ahash_init() before
final()), will this blindly overwrite the chunk list and strand any previou=
sly
accumulated chunks?

>  	rctx->num_chunks =3D 0;
>  	rctx->total_len =3D 0;
> =20
>  	return 0;
>  }
> =20
>  static int cmh_hmac_update(struct ahash_request *req)
>  {
>  	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
>  	struct cmh_hmac_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
>  	struct cmh_hmac_reqctx *rctx =3D ahash_request_ctx(req);
>  	struct cmh_hmac_chunk *chunk;
>  	int nents;
> =20
>  	if (rctx->error)
>  		return rctx->error;
> =20
>  	if (!req->nbytes)
>  		return 0;
> =20
>  	if (req->nbytes > HMAC_MAX_DATA - rctx->total_len) {

[Severity: High]
Does this code violate the ahash API contract by arbitrarily capping the
input data length at 64KB?

The crypto API expects ahash implementations to handle streaming inputs of
arbitrary lengths. Should we be allocating a software fallback (like shash)
to handle inputs larger than what the hardware can support?

>  		rctx->error =3D -EINVAL;
>  		goto err_free_chunks;
>  	}
[ ... ]
>  	list_add_tail(&chunk->list, &rctx->chunks);
>  	spin_lock_bh(&tctx->chunk_lock);
>  	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);

[Severity: High]
The chunks are added to the TFM-wide list here, but if the request doesn't
complete, they will be left indefinitely on this list.

>  	spin_unlock_bh(&tctx->chunk_lock);
>  	rctx->num_chunks++;
>  	rctx->total_len +=3D req->nbytes;
> =20
>  	return 0;
[ ... ]
> @@ -428,14 +428,11 @@ static int cmh_hmac_final(struct ahash_request *req)
> =20
>  	/*
>  	 * Raw key: pack SYS_CMD_WRITE(SYS_REF_TEMP) into the
>  	 * same VCQ so the key write + HMAC are atomic.
>  	 */
>  	key_dma =3D tctx->key.raw.dma;
>  	vcq_add_sys_write(&cmds[idx++], SYS_REF_TEMP, (u64)key_dma,
>  			  SYS_REF_NONE, tctx->key.raw.len,
>  			  tctx->key.raw.sys_type);

[Severity: High]
If the system has multiple HC instances, cmh_core_select_instance() will
return a dynamically selected core_id.

Will this SYS_CMD_WRITE command dispatch the key to the static core cached
earlier in cmh_hmac_setkey(), while the HC_CMD_HMAC command executes on the
new dynamically selected core, causing cryptographic failures?

>  	key_ref =3D SYS_REF_TEMP;
>  	keylen =3D tctx->key.raw.len;
>  	d =3D cmh_core_select_instance(CMH_CORE_HC);
[ ... ]
> @@ -513,11 +513,9 @@ static int cmh_hmac_export(struct ahash_request *req=
, void *out)
>  {
>  	struct cmh_hmac_reqctx *rctx =3D ahash_request_ctx(req);
>  	struct cmh_hmac_export_state *state =3D out;
>  	struct cmh_hmac_chunk *chunk;
>  	u32 offset =3D 0;
> =20
>  	if (rctx->total_len > CMH_HMAC_EXPORT_MAX)
>  		return -ENOSPC;

[Severity: High]
Will this fail the export operation for any state exceeding ~4KB?

Generic consumers like af_alg expect state serialization to always succeed =
if
given a buffer matching the declared statesize.

> =20
>  	state->total_len =3D rctx->total_len;
[ ... ]
> @@ -529,19 +529,14 @@ static int cmh_hmac_import(struct ahash_request *re=
q, const void *in)
>  {
>  	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
>  	struct cmh_hmac_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
>  	struct cmh_hmac_reqctx *rctx =3D ahash_request_ctx(req);
>  	const struct cmh_hmac_export_state *state =3D in;
>  	struct cmh_hmac_chunk *chunk;
> =20
>  	/*
>  	 * Do NOT call free_chunks() here: the crypto API does not
>  	 * guarantee the request context is in a valid state before
>  	 * import(), so the list pointers may be stale or invalid.
>  	 * Re-initialize from scratch instead.  Any pre-existing chunks
>  	 * are tracked on tctx->all_chunks and freed in cra_exit.
>  	 */
>  	rctx->info =3D cmh_hmac_get_info(tfm);
>  	rctx->error =3D 0;
>  	INIT_LIST_HEAD(&rctx->chunks);

[Severity: High]
Similarly to cmh_hmac_init(), will this overwrite the chunk list and leak
previously tracked chunks if an active request is reused?

>  	rctx->num_chunks =3D 0;
>  	rctx->total_len =3D 0;
> =20
>  	if (state->total_len > CMH_HMAC_EXPORT_MAX)
>  		return -EINVAL;
> =20
>  	if (state->total_len) {
>  		chunk =3D kmalloc(sizeof(*chunk) + state->total_len, GFP_KERNEL);

[Severity: High]
Can this trigger a sleep-in-atomic BUG?

The ahash import() operation can be invoked from atomic or interrupt contex=
ts
(such as the IPsec network stack processing packets in softirq), making an
unconditional GFP_KERNEL allocation unsafe.

>  		if (!chunk)
>  			return -ENOMEM;
[ ... ]
> @@ -578,13 +578,11 @@ static void cmh_hmac_cra_exit(struct crypto_tfm *tf=
m)
>  {
>  	struct cmh_hmac_tfm_ctx *tctx =3D crypto_tfm_ctx(tfm);
>  	struct cmh_hmac_chunk *chunk, *tmp;
> =20
>  	/* Free any orphaned chunks (e.g. testmgr export/reimport poison) */
>  	spin_lock_bh(&tctx->chunk_lock);
>  	list_for_each_entry_safe(chunk, tmp, &tctx->all_chunks, tfm_node) {
>  		list_del(&chunk->tfm_node);

[Severity: High]
Since orphaned chunks are only freed here when the entire TFM is destroyed,
couldn't a user trivially trigger unbounded memory exhaustion (OOM) by
repeatedly accumulating data via AF_ALG sockets and aborting requests?

>  		kfree_sensitive(chunk);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D5
