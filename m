Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C930845198C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686703; cv=none; b=j965a4lACrtnxyBlMYMZ5KCNCVH5cl9QPU8kKpbdwoktEZOUO2Dcfqyv8Jdn6roBWvEMmHfcnS7h2m1n6jqtx/+YRVFcCK04e0q84XaUsupc6ODD2Bzec7psbpfjsdZB/NDl+8Z7K4PYNd7kWA2jvvYvVCHoz9ne6ezTI3etBvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686703; c=relaxed/simple;
	bh=ysHLLbreF7CrpJIQViuFSVkQVfy2CDuCDGokncvOFFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vD5LVK/ygQSEUcEKVoTFRUa3dYuySw13kZWj3Ybmj9MVf0ft/uDkKFcXY2kM4nndgqtDbQIz41o6LMYEfR20ma0NKepEy2BM+lZxkV40wsIOcnv6sZjy4cZLCjZJtdk1Kviro5Mm0MsnzDZ+nlz5rr1mQKdxWTksMzlxbr0ddV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fw5fi52b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fw5fi52b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CEC1F000FF;
	Thu, 17 Sep 2026 23:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686693;
	bh=S94S40mYVq4FjAtfrUNxQpVQ46f4isUvunqSPPASTgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fw5fi52bHASgIXNyCNhc4MaI7qAF9HJ5NJtfQ8Uj5u/2W/2I3fSTYCxO4wGXqNcZB
	 oucuRzvSbx0R0jjq+/+H6mUc+Rk3HEWlqRgqY0bgjrrZ/K6ny0msWsgPHkLOgwXjWn
	 PkM5XccyfbmMf9njn1ao509s0fndj0VX7yAq9aTh0NAhXQpQ42Xnsr42yZQrK+CGJM
	 iKK/Rmpd6Ti+GRzo48VmhuFczeaAIE/ZHGEpjof7bkcBawhwO6/d1yA+1rScWDOg90
	 q5ATQnwbjMudVYrFGn8McbRWhnaHFSYAMkXXriWCrBgxSI3018B1F8BK1yxMnAxQvR
	 KzcswnavKLUMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917225929.2494111-5-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-5-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:11:32 +0000
Message-Id: <20260917231133.22CEC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] crypto: cmh: ahash rejects valid large scatterlists
--

commit 75a869d1380414cdb3e2f319fd8862f445b10395
Author: Alex Ousherovitch <aousherovitch@rambus.com>
Date:   Thu Sep 17 22:59:13 2026 +0000

    crypto: cmh - add SHA-2/SHA-3/SHAKE ahash

This commit registers ahash algorithms for the SHA-2, SHA-3, and SHAKE
families using the CMH hash core. It implements incremental update/finup and
export/import for request cloning, relying on the crypto API's partial block
buffering.

> diff --git a/drivers/crypto/cmh/cmh_hash.c b/drivers/crypto/cmh/cmh_hash.c
> new file mode 100644
> index 0000000000000..1acc8bdab3522
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_hash.c
[ ... ]
> +static int cmh_hash_update(struct ahash_request *req)
> +{
> +	struct cmh_hash_reqctx *rctx =3D ahash_request_ctx(req);
> +	const struct cmh_hash_alg_info *info =3D rctx->info;
> +	struct vcq_cmd cmds[CMH_HASH_MAX_PAYLOAD];
> +	struct core_dispatch d;
> +	u32 block_size =3D info->block_size;
> +	u32 full_len;
> +	u32 idx;
> +	int ret;
> +	gfp_t gfp;
> +
> +	if (rctx->error)
> +		return rctx->error;
> +
> +	if (!req->nbytes)
> +		return 0;
> +
> +	/*
> +	 * block_size is not always a power of two (SHA-3 rates: 144/136/
> +	 * 104/72), so use modulo -- round_down() would corrupt the split.
> +	 */
> +	rctx->update_remainder =3D req->nbytes % block_size;
> +	full_len =3D req->nbytes - rctx->update_remainder;
> +
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	/*
> +	 * Reject a single update whose linearisation would exceed the largest
> +	 * kmalloc: return a permanent -EMSGSIZE ("message too long") rather
> +	 * than a transient -ENOMEM the client would keep retrying.
> +	 */
> +	if (full_len > KMALLOC_MAX_SIZE)
> +		return -EMSGSIZE;
> +
> +	/*
> +	 * Linearise the block-aligned prefix from the scatterlist.
> +	 * __GFP_NOWARN keeps a borderline-large (but sub-cap) request from
> +	 * splatting the page allocator if it still cannot be satisfied.
> +	 */
> +	rctx->data_buf =3D kmalloc(full_len, gfp | __GFP_NOWARN);

[Severity: Medium]
Since the Linux crypto API contract permits arbitrary-sized inputs via
scatterlists, is it okay to impose an allocation limit here?

A caller submitting an update with a large nbytes could be rejected with
-EMSGSIZE or fail with -ENOMEM due to physical memory fragmentation. Could
this code process the scatterlist in smaller chunks instead of attempting
to linearise the entire payload into a single physically contiguous buffer?

[ ... ]
> +static int cmh_hash_finup(struct ahash_request *req)
> +{
> +	struct cmh_hash_reqctx *rctx =3D ahash_request_ctx(req);
> +	u32 data_len =3D req->nbytes;
> +	u8 *data_buf =3D NULL;
> +	gfp_t gfp;
> +
> +	if (rctx->error)
> +		return rctx->error;
> +
> +	if (data_len =3D=3D 0)
> +		return cmh_hash_submit_final(req, NULL, 0);
> +
> +	/* Reject an oversized linearisation with a permanent -EMSGSIZE. */
> +	if (data_len > KMALLOC_MAX_SIZE)
> +		return -EMSGSIZE;
> +
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	data_buf =3D kmalloc(data_len, gfp | __GFP_NOWARN);

[Severity: Medium]
Does this code also need to process the scatterlist in chunks?

Similar to cmh_hash_update(), attempting to allocate a contiguous buffer for
the entire finalization payload restricts the maximum input size and violat=
es
the ahash scatterlist API contract.

> +	if (!data_buf)
> +		return -ENOMEM;
> +
> +	scatterwalk_map_and_copy(data_buf, req->src, 0, data_len, 0);
> +
> +	return cmh_hash_submit_final(req, data_buf, data_len);
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D4
