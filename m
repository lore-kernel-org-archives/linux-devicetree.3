Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3638239A
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787697012; cv=none; b=fq27w5o0eU97laLGIqts1XVqwfapGv5yKrOp1BGCwvAtROOX2LeqEYejhkmFn/AsA1nE1xAgQ2mvoRzVvd52IHI/StsyXCbxdGiwz+p4wuPOlkrST84ievol+pFvpv6gGWcuQjYy5Ct5mkDXBhCUwCMorb9W2L/EbkAZlZbCvzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787697012; c=relaxed/simple;
	bh=sXmCeXtwqEP56lrbEN92j3EQSQF0JZjimlvB4209044=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jfmx06ffUSYGuJkv4eRKVpaYLdgkQiAXEkB1vRaF8nxqbTQI1dbWLzcY5YD46tY9whf/au3fOKK49mgRtXOmoYxOuVPSC2qUg6Sm6k78J3YSur6iQ/pCfPjOlhtrRCumUbBmyx85UdZUyZ8IJ5waUouqYN374ABubSlr17MoGjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPF+a746; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPF+a746"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D648F1F000E9;
	Tue, 25 Aug 2026 22:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787697010;
	bh=Iskd8qcpe18vCcgQkhGxW5Ljzg+eOz3T7Ac4ZS39ZEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FPF+a746TP1hod2kTHhB+En5zovRIpnq7kjjVQFNbzky+kvVaeMZfzeqNjE54aBey
	 KCVWlXVp04htsTyjQvgg9EP1LVzNIH3NqFaKrQ3XFMDLVvooyAZ44Zx6j574VtqHrU
	 bYvIKI37FAwEAfR9Ndfx8Ww0wJa7rlD0xzYdKianW1RSN70JhZ2JYZbdFKzZg3wMuu
	 6vMMrRQDPz5aZOiQ1qF4fRC0H5Ecf/OIR1m6r1RH3y6YSbvs5sDtlL/Sed3GLs/ko7
	 fdCm7/IBxUN/uBbCKmxijakw9R76B2Oed6nVQ4/QCkxrsUzVeVu82UVUJxQN2ZhGTH
	 yLDWAKOMqr8JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/19] crypto: cmh - add HMAC ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260825221539.255951-6-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-6-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:30:09 +0000
Message-Id: <20260825223009.D648F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unbounded kernel memory leak via abandoned or re-initialized AF_AL=
G requests due to chunks orphaned in a shared TFM list.
--

commit bee5ec8c501d04b362a9a4720d98954a72b38c9e
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add HMAC ahash

This commit registers HMAC ahash algorithms for the CMH hash core,
supporting HMAC-SHA-2 and HMAC-SHA-3. It implements a software
accumulation buffer to handle intermediate HMAC state.

> diff --git a/drivers/crypto/cmh/cmh_hmac.c b/drivers/crypto/cmh/cmh_hmac.c
> new file mode 100644
> index 0000000000000..528079f60bfa9
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_hmac.c
[ ... ]
> +static int cmh_hmac_init(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_hmac_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	rctx->info =3D cmh_hmac_get_info(tfm);
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);

[Severity: High]
If an active request is re-initialized by calling cmh_hmac_init(), does this
INIT_LIST_HEAD() blindly wipe the list head and permanently sever access to
previously accumulated chunks, leaving them stranded on the TFM list?

[ ... ]
> +static int cmh_hmac_update(struct ahash_request *req)
> +{
[ ... ]
> +	chunk->len =3D req->nbytes;
> +	if (req->base.flags & CRYPTO_AHASH_REQ_VIRT) {
> +		memcpy(chunk->data, req->svirt, req->nbytes);
> +	} else {
> +		nents =3D sg_nents_for_len(req->src, req->nbytes);
> +		if (nents < 0 ||
> +		    sg_copy_to_buffer(req->src, nents,
> +				      chunk->data, req->nbytes) !=3D req->nbytes) {
> +			kfree_sensitive(chunk);
> +			rctx->error =3D -EINVAL;
> +			goto err_free_chunks;
> +		}
> +	}
> +
> +	list_add_tail(&chunk->list, &rctx->chunks);
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Since chunks are added to the per-transform list to survive request
destruction, doesn't this tie their lifecycle to the long-lived TFM?

Could this cause an unbounded kernel memory leak? An unprivileged local user
can create an AF_ALG socket, call accept() to create child sockets sharing
the same parent TFM, send data to allocate internal chunks here, and then
close the child socket. Since the crypto API lacks a per-request destructor
hook, the request context is freed without notifying the driver, leaving the
chunks orphaned on the TFM list.

[ ... ]
> +static int cmh_hmac_import(struct ahash_request *req, const void *in)
> +{
[ ... ]
> +	/*
> +	 * Do NOT call free_chunks() here: the crypto API does not
> +	 * guarantee the request context is in a valid state before
> +	 * import(), so the list pointers may be stale or invalid.
> +	 * Re-initialize from scratch instead.  Any pre-existing chunks
> +	 * are tracked on tctx->all_chunks and freed in cra_exit.
> +	 */
> +	rctx->info =3D cmh_hmac_get_info(tfm);
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);

[Severity: High]
Similar to cmh_hmac_init(), does importing over an active request orphan its
chunks? The comment acknowledges reliance on cmh_hmac_cra_exit() for cleanu=
p,
which confirms the memory remains tied up for the lifetime of the TFM.

[ ... ]
> +static void cmh_hmac_cra_exit(struct crypto_tfm *tfm)
> +{
> +	struct cmh_hmac_tfm_ctx *tctx =3D crypto_tfm_ctx(tfm);
> +	struct cmh_hmac_chunk *chunk, *tmp;
> +
> +	/* Free any orphaned chunks (e.g. testmgr export/reimport poison) */
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_for_each_entry_safe(chunk, tmp, &tctx->all_chunks, tfm_node) {
> +		list_del(&chunk->tfm_node);
> +		kfree_sensitive(chunk);
> +	}
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Sweeping orphaned chunks only at TFM destruction causes unbounded
accumulation when many requests are created and destroyed over the lifetime
of a single TFM. Is there a way to manage chunk lifetimes without tying them
to the TFM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D5
