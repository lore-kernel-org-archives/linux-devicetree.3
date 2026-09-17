Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCC34A99DE
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686685; cv=none; b=S4pNXSbGYgihooUpEqO/riuknhCCaLB3k1E9A0yQZuAlnfT3fllRqeSf8VC+kQHhASAZU/+k1NI0vy0XW3aZZIweUiqkFuONZAQdbARvIuPD8mYgLVJLLoLZyxeW2wda0EIq/fovwYPULgFUB9DQp/J1LNcDEqTXAqPDvlid5qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686685; c=relaxed/simple;
	bh=ckeswvSMGG+Q39wX/I8o7Jj66Enx++1X80HTFg3sceg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KfIdK9oRQdVw6nJ5hHhAmu9tZjM0bYV9ozDa8HcqX3JJCPTH/mIVhNtm39g2xgtmev08NzEbq1lUnCUQcTOoa0Wk6k5DdcaaIBOciybVhUqNmZHeIK/BVKR6obQaBLR3XcUuVMclTrLBGRg46LfrpPaI9p42cvGQ5z86r5FSZJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=je8d3VZg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="je8d3VZg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7061F1F000FF;
	Thu, 17 Sep 2026 23:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686666;
	bh=BrVVKv6CXfvkj8yWi7fTS2Nl1HYvRc1qGNYmZ0lfQvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=je8d3VZgCDGzi4xRvN+nzTGiVYYVqf3z16nNYx7HBfwI8U8racoZVHTCPhuZcCNoE
	 XsxFzhw3p/nu1ZfGVnRNSmK0ufmu8fBQqz1Ck3CaJJLX+ZJwDwPJhZn78IaOB/OqBa
	 UHdnEUk83U9YYRTrIPAExnicOBsVi8gGWJvOL346izCTu0qgWBCZXSs5r7+r4WPLPr
	 MFYmaawrB9cQoUg2JQ3qF8YWNh4Y8xzIfLAFWZNdDl/M70eCvSg4BVWPPEE0S5JKHp
	 E6MOrOGlfwGhL51YX3rGIeuM+ETG8vftiTNUPIQiL/Yb70ChHlesYcBf0QAtFQzSJX
	 Tf9u65odeV5Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/19] crypto: cmh - add ChaCha20-Poly1305
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917225929.2494111-11-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-11-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:11:06 +0000
Message-Id: <20260917231106.7061F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] crypto: cmh: missing tfm_buffered increment in cmh_poly_import()=
 causes underflow
--

commit 8e2b87897bac0eee1fd1dfc15026269caab4f233
Author: Alex Ousherovitch <aousherovitch@rambus.com>
Subject: crypto: cmh - add ChaCha20-Poly1305

This commit registers the ChaCha20-Poly1305 AEAD and ChaCha20 skcipher
algorithms using the CMH CCP core. It also registers the Poly1305 ahash for
standalone use.

> diff --git a/drivers/crypto/cmh/cmh_ccp_poly.c b/drivers/crypto/cmh/cmh_c=
cp_poly.c
> new file mode 100644
> index 0000000000000..d8482dd96d12c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_ccp_poly.c
[ ... ]
> +static void cmh_poly_free_chunks(struct cmh_poly_reqctx *rctx,
> +				 struct cmh_poly_tfm_ctx *tctx)
> +{
> +	struct cmh_poly_chunk *c, *tmp;
> +
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_for_each_entry_safe(c, tmp, &rctx->chunks, list) {
> +		list_del(&c->list);
> +		list_del(&c->tfm_node);
> +		tctx->tfm_buffered -=3D c->len;

[Severity: Medium]
Can this subtraction underflow if the chunk was created during an import?

This is where the underflow actually occurs when the request is freed,
because the corresponding increment was missing in cmh_poly_import.

> +		kfree_sensitive(c);
> +	}
> +	spin_unlock_bh(&tctx->chunk_lock);
> +	rctx->total_len =3D 0;
> +}
[ ... ]
> +static int cmh_poly_import(struct ahash_request *req, const void *in)
> +{
[ ... ]
> +	if (state->total_len) {
> +		chunk =3D kmalloc(sizeof(*chunk) + state->total_len,
> +				req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +				GFP_KERNEL : GFP_ATOMIC);
> +		if (!chunk)
> +			return -ENOMEM;
> +		chunk->len =3D state->total_len;
> +		memcpy(chunk->data, state->data, state->total_len);
> +		list_add_tail(&chunk->list, &rctx->chunks);
> +		spin_lock_bh(&tctx->chunk_lock);
> +		list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +		spin_unlock_bh(&tctx->chunk_lock);

[Severity: Medium]
Should tctx->tfm_buffered be incremented here?

Since the newly allocated chunk is being added to the TFM tracking list,
omitting the increment causes tctx->tfm_buffered to become unbalanced.

When a user creates an AF_ALG hash socket, writes data to it, and clones it
via accept(), cmh_poly_import is called for the clone. When the sockets are
closed, cmh_poly_free_chunks will subtract the chunk lengths from
tctx->tfm_buffered twice (once for the parent, once for the clone).

Because the clone never added its length during import, the counter
underflows to a massive positive value, permanently breaking the instance by
causing subsequent update calls to spuriously fail with -ENOMEM.

> +		rctx->total_len =3D state->total_len;
> +	}
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D10
