Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCACE175A89
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686775; cv=none; b=jsAyjbK0w9fSMmJZvSRRQbORi9zq1xoEOvsz+X6JjEYc/TwK8/0r6NvWuO87pys0urJ1c0P+eLV+G7+Gdch0pLBgefxkoeqbLpGqQAyc2YWkYw/2Pc55oB01+NLpWxz0gt3W2FExWUV8+//DT+CjXkj2T0kAHlUrlnDAh0FAARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686775; c=relaxed/simple;
	bh=4k16BQH5GAZG0zHgNF4IinB63bvLjkQVdd1eC3b7uzw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EvqAcasRDJrL4dC+05ABYNmjbViGHHX9zuZPkUrZLS735U2ya6it/L8ePtGEip7l4ebW7+uyKLCA3rJAMzgry7uFHUNjTdX82x21AWuLKNjhzNiByHaP2QgqFYrPs9q9ye4qHYzuvb5RrabdN9kBlsRX2jMm6pj3fC88hNUYOKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtKWH5F8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtKWH5F8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550181F000FF;
	Thu, 17 Sep 2026 23:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686765;
	bh=EqnT5bthtXTzgsTaNYHEx/5WB/6F3vV5BY4ld725R74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jtKWH5F8sNrN2Z+H/DNUmgkjf1pkwlXdgTPUHunYqMxoeOcboPWmqAevHh4RVJgvY
	 XeVZJr2iGbxsV1ephkZu2ymhRxNvLZCzh4bup2RwqqaC89c9pnOiikc4X/PzdlwgQO
	 USOQLgi8B+1L+SfRhbfjRl4KmdUb8KCssupKtbG/TUuiemNaKr0vqk8H7e3faH9650
	 CzSDBS4YGZ80qtdN9QqOvfM6PufJ/t+ylf3zngOD7uHk3J4s7ax19Fm5It37qY0rd6
	 oTqlBafpFKvgmzIuSV/PSIX0Toht7HuRzh2mdjjvZrl9zU7ex0J9asJIW2XMj/cDHs
	 sWL6wFrn9UyKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/19] crypto: cmh - add SM3 ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917225929.2494111-8-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-8-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:12:44 +0000
Message-Id: <20260917231245.550181F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mm: memory cgroup bypass via unaccounted kmalloc in SM3 driver
--

commit c89ac2586e3512c64b328b90ba8ba1dd9b26ecc6
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SM3 ahash

This commit registers the SM3 ahash algorithm using the CMH SM3 core.
It supports incremental update, finup, final, and export/import operations.

> diff --git a/drivers/crypto/cmh/cmh_sm3.c b/drivers/crypto/cmh/cmh_sm3.c
> new file mode 100644
> index 0000000000000..a08341512e5d6
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_sm3.c
[ ... ]
> +static int cmh_sm3_update(struct ahash_request *req)
> +{
[ ... ]
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	/*
> +	 * Reject a single update whose linearisation would exceed the largest
> +	 * kmalloc: return a permanent -EMSGSIZE ("message too long") rather
> +	 * than a transient -ENOMEM the client would keep retrying.  __GFP_NOWA=
RN
> +	 * keeps a borderline-large (but sub-cap) request quiet if it still
> +	 * cannot be satisfied.
> +	 */
> +	if (full_len > KMALLOC_MAX_SIZE)
> +		return -EMSGSIZE;
> +
> +	rctx->data_buf =3D kmalloc(full_len, gfp | __GFP_NOWARN);

[Severity: High]
Should this allocation be charged to the caller's memory cgroup by adding t=
he
__GFP_ACCOUNT flag to the gfp mask?

Since the crypto API is accessible to untrusted local users via AF_ALG, an
unprivileged user can submit numerous large asynchronous hash requests. Bec=
ause
this kmalloc can allocate up to KMALLOC_MAX_SIZE bytes without accounting,
could this allow a malicious container to bypass its memory limits and exha=
ust
kernel memory, leading to a host-wide out-of-memory condition?

> +	if (!rctx->data_buf)
> +		return -ENOMEM;
[ ... ]
> +static int cmh_sm3_finup(struct ahash_request *req)
> +{
[ ... ]
> +	/* Reject an oversized linearisation with a permanent -EMSGSIZE. */
> +	if (data_len > KMALLOC_MAX_SIZE)
> +		return -EMSGSIZE;
> +
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	data_buf =3D kmalloc(data_len, gfp | __GFP_NOWARN);

[Severity: High]
Does this allocation also need __GFP_ACCOUNT for the same reason?

Like the update path above, this allocates unaccounted buffers based on user
input length, which could be abused to bypass memory container limits during
finalization.

> +	if (!data_buf)
> +		return -ENOMEM;
> +
> +	scatterwalk_map_and_copy(data_buf, req->src, 0, data_len, 0);
> +
> +	return cmh_sm3_submit_final(req, data_buf, data_len);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D7
