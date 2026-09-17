Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A913905E0
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686658; cv=none; b=ty15ZLpBArWvzQ3+Uk9J97LrOhWk/D3kFeYPkpNBMT8881vIIb8NENV6J/TNF7T6btMbsZRQsAJ3Ec3UxzyHqmdaZs82nnGG6lbr32ytv7X0AwyHwAYAtAwTfC5E3QTpmbXgeV5UYE4CLInjvax5fo5H7E4uPLiLJ2CyPXxFo50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686658; c=relaxed/simple;
	bh=XFB/xBJ1227qCbWL6/7OocuLnEwZuWIy8qT7XcB42rE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FjKPkqoLjAUlg3iQhWcjeObys1MQIAOxsTe3ldq26D0VHY/Yh49EK31lKjJgCLwskwpsX4TDItXA0SaICNOcjFvv00Ns2f+GFfMQzXaAzeiUYz6QB02d7N/9vA4DOpXZspQ0NHa1papKnAov7VwBhAuaViJDgki2iAxUBJ0oyhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO77vUUF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO77vUUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49791F00893;
	Thu, 17 Sep 2026 23:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686650;
	bh=fiC2ZNmEfLxrlJUhmsnN7eFxdcGtHsxTV+SZIYs6/64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SO77vUUFUhHscjRl6pW9SzFpRd58j/tmn3EW4jd6gE5khUGXioagZR8a+bD1/Ut1f
	 CCCd6/g5sg06vGAA8x+Ksc0GWExKTIoTYpf1a4mtnOMxzD1Fq4HsOu9fvrC9mIOa+e
	 SJCNRnFdyfcAXGrZXEVK2vgXzB4pX1UUaVTNxk4UTkGox5Hq9PrI4k875etjD/mNAm
	 kFIeMdOb6jo1dt6+3gSXULpFGsER5csVXlCCmy6r/37ueqn3FJ2CZx0YFwTR7r64v4
	 kMoR6CHQlFbVFKY+YtoV2ebdjRLnCfxJ24nntveARfVD8AmNUtvkVmnbG0pjfEvw0b
	 BdOKMvmJuWPhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/19] crypto: cmh - add SM4 skcipher/aead/cmac/xcbc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917225929.2494111-10-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-10-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:10:50 +0000
Message-Id: <20260917231050.B49791F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] crypto: cmh: missing DoS limit check in cmh_sm4_mac_import allows =
memory exhaustion
--

commit 60aa3a7525d3c5b378e645a473550b644da1ca56
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SM4 skcipher/aead/cmac/xcbc

This commit registers SM4 skcipher, AEAD, and MAC (CMAC, XCBC) algorithms
using the CMH SM4 core. It implements various fallback mechanisms for empty
inputs and handles scatter-gather logic by linearizing memory buffers.

> diff --git a/drivers/crypto/cmh/cmh_sm4_cmac.c b/drivers/crypto/cmh/cmh_s=
m4_cmac.c
> new file mode 100644
> index 0000000000000..abeadce312c09
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_sm4_cmac.c

[ ... ]

> +static int cmh_sm4_mac_import(struct ahash_request *req, const void *in)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_sm4_mac_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct cmh_sm4_mac_reqctx *rctx =3D ahash_request_ctx(req);
> +	const struct cmh_sm4_mac_export_state *state =3D in;
> +	struct cmh_sm4_mac_chunk *chunk;

[ ... ]

> +	if (state->total_len) {
> +		chunk =3D kmalloc(sizeof(*chunk) + state->total_len,
> +				req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +				GFP_KERNEL : GFP_ATOMIC);
> +		if (!chunk)
> +			return -ENOMEM;
> +		chunk->len =3D state->total_len;
> +		memcpy(chunk->data, state->data, state->total_len);
> +		spin_lock_bh(&tctx->chunk_lock);
> +		list_add_tail(&chunk->list, &rctx->chunks);
> +		list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +		tctx->tfm_buffered +=3D chunk->len;
> +		spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Does this code allow an unbounded memory allocation bypass?

When an AF_ALG socket is created for cmac(sm4) or xcbc(sm4), a user can wri=
te
some data so it gets buffered, and then repeatedly call accept() on the
socket. Each accept() clones the request, triggering a crypto_ahash_export
on the parent and a crypto_ahash_import on the child.

During cmh_sm4_mac_import(), the function allocates a new chunk for the
imported data and adds it to the per-tfm list tctx->all_chunks. However, it
does not check if the total buffered memory exceeds the
CMH_SM4_MAC_TFM_MAX_BUFFERED limit, unlike cmh_sm4_mac_update().

If the user closes the child socket, the allocated chunks are abandoned in
tctx->all_chunks. Repeating this indefinitely could exhaust kernel memory a=
nd
cause a denial of service.

> +		rctx->total_len =3D state->total_len;
> +	}
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D9
