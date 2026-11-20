Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197460;
	b=nkZt+4xVcbiY7AgNUqQQf6KLM9loHkOBPJPXMcRcyKzf6c34WjX+/cpgVon8XbnHk4s8
	 1yF4lifGWSa3e+GB2DehSaAX90giVrPOsYsrstqQD+yr9qLc6AE/aCIPrbGbZ47IjfhGa
	 bhrWYZILpeTSIGrkES3MiOxoXR06CaGvJSpdUVK9IxUqSxKSsTs60YB4eXg4nHNjFJkfR
	 8pqr5VM7iW623ZBOg+sFle5wUDJ5W2YjXiDveKcxVjB34E+EjDeZKLjHzfmgqqSphIQCi
	 3vOgjWlTN7a3PkhQc+5cZKSrdz8xZkvKs8b5IL2rslr/iszrDzNGhXWqv6TCsOUnMDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197460;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ecLR1fN0Y+dJHROrUU5BBImS5TDB5ZusxNjERiW31Is=;
	b=31cG1Bj7Za6Kme3Ohagx9EbB1emsp1SQwyz2erKLKR4KZOCZqMOEe52ST/z++U1r6RuM
	 unK7GYheg51B0uT4Sg3XysgnqGp6CBqm4wmnfWxuR1oXkr1OlXxFHjlTBPxgYNfvnBfbh
	 GmwyecbcuxbsfgPbkjltUC93iME4cW1JPdnYPTlG6kunh1Pk7goiKWNNMTEfvU7LmS8Du
	 XmPKZuGx1e0yp+5vOuGDZjeHBrN9eRYsZqLOTu0vb0BBePC5ey2ooPIBwY84LsARyWrhB
	 RhJZw/HA1KbJM9GjjdaRMCVgOwCBqEaAAJomKfhH0nVr1PD9jRkFvdfY38cnbfwzezQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBBM2iF7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8711606A333
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBBM2iF7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8371F000C4;
	Fri, 20 Nov 2026 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795197459;
	bh=ecLR1fN0Y+dJHROrUU5BBImS5TDB5ZusxNjERiW31Is=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mBBM2iF7rgvKoWOTExwl2rbH1lkfqU7zFYuE3zhmmEk9LMOIx0TxR1K43es4BpQ46
	 sUG3EBeZD5D1UebpZ5pEIGZyMk8xIBfPeVafh/APPRdH8Gx0E6SRykgv5qXkNR3FH9
	 74GvRnMA8JajQjC+QqffFZnX0+pNCG/gqsT5dAROItSSgGVgC/ED6nBMICdYcWqbdQ
	 bLMgXJBllOygUcM0z+dStRuZj9msDkQ/EZLdr60ab5iYDXXbT28Gs4YinttXSHXk0a
	 Pb4agKaLmZgbyHkpSikh5mW3yPz/AeVoDrDo+6De/gJ/P+RSLS7kNo6Ki+ytCVWwNR
	 KPagdp77r4zrA==
Message-ID: <sashiko-outbox-225751@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasanth Kumar Padarthi" <prasanth.padarthi10@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120174440.123487-3-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-3-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:57:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] nvmem: aspeed: mix of guard(mutex) and goto cleanup in OTP
  helpers
--

commit 34b51f06ae272e72e9e379fc1f5bbb493333d824
Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

nvmem: aspeed: Add read-only AST2600 OTP support

This commit adds a read-only NVMEM provider driver for the ASPEED AST2600
OTP controller, masking the secure prefix with an NVMEM keepout and
serializing hardware unlock, read, and relock transactions.

Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d6998723b0e=
a60280e380183553/drivers/soc/aspeed/ast2600-otp.c
Link: https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9A=
D5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/

> diff --git a/drivers/nvmem/nvmem-aspeed-otp.c b/drivers/nvmem/nvmem-aspee=
d-otp.c
> new file mode 100644
> index 0000000000000..8a433dccaaaf0
> --- /dev/null
> +++ b/drivers/nvmem/nvmem-aspeed-otp.c
> @@ -0,0 +1,297 @@

[ ... ]

> +static int ast2600_otp_init_keepout(struct ast2600_otp *priv)
> +{
> +	u32 conf0, unused;
> +	int ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	writel(AST2600_OTP_UNLOCK_KEY, priv->base + AST2600_OTP_PROTECT_KEY);
> +	if (readl(priv->base + AST2600_OTP_PROTECT_KEY) !=3D 1) {
> +		ret =3D -EACCES;
> +		goto out_lock;
> +	}
> +
> +	ret =3D ast2600_otp_init_read_mode(priv);
> +	if (ret)
> +		goto out_lock;
> +
> +	ret =3D ast2600_otp_read_pair(priv, AST2600_OTP_CONF0_ADDR,
> +				    &conf0, &unused);
> +	if (ret)
> +		goto out_lock;
> +
> +	priv->secure_keepout.start =3D 0;
> +	priv->secure_keepout.end =3D
> +		FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, conf0) *
> +		AST2600_OTP_SEC_SIZE_UNIT;
> +	priv->secure_keepout.value =3D 0;
> +
> +out_lock:
> +	writel(0, priv->base + AST2600_OTP_PROTECT_KEY);
> +	/* Complete the lock write before returning and releasing the mutex. */
> +	readl(priv->base + AST2600_OTP_PROTECT_KEY);
> +	return ret;
> +}
> +
> +static int ast2600_otp_read(void *context, unsigned int offset,
> +			    void *val, size_t bytes)
> +{
> +	struct ast2600_otp *priv =3D context;
> +	u8 *buf =3D val;
> +	unsigned int word_index;
> +	unsigned int aligned_word;
> +	unsigned int secure_size;
> +	u32 extra_read;
> +	u32 word0, word1;
> +	int ret;
> +
> +	if (!bytes)
> +		return 0;
> +
> +	if (offset % sizeof(u32) || bytes % sizeof(u32))
> +		return -EINVAL;
> +
> +	if (offset >=3D AST2600_OTP_SIZE ||
> +	    bytes > AST2600_OTP_SIZE - offset)
> +		return -EINVAL;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	if (priv->failed)
> +		return -EIO;
> +
> +	/* SEC54 can grow after probe; keep the registered keepout immutable. */
> +	extra_read =3D readl(priv->base + AST2600_OTP_EXTRA_READ_PROTECT);
> +	secure_size =3D FIELD_GET(AST2600_OTP_EXTRA_READ_RANGE, extra_read) *
> +		      AST2600_OTP_SEC_SIZE_UNIT;
> +	secure_size =3D max(priv->secure_keepout.end, secure_size);
> +	if (offset < secure_size)
> +		return -EACCES;
> +
> +	writel(AST2600_OTP_UNLOCK_KEY, priv->base + AST2600_OTP_PROTECT_KEY);
> +	if (readl(priv->base + AST2600_OTP_PROTECT_KEY) !=3D 1) {
> +		ret =3D -EACCES;
> +		goto out_lock;
> +	}
> +
> +	ret =3D ast2600_otp_wait_complete(priv);
> +	if (ret)
> +		goto out_lock;
> +
> +	word_index =3D offset / sizeof(u32);
> +	while (bytes) {
> +		aligned_word =3D word_index & ~1U;
> +
> +		ret =3D ast2600_otp_read_pair(priv, aligned_word,
> +					    &word0, &word1);
> +		if (ret)
> +			goto out_lock;
> +
> +		if (!(word_index & 1)) {
> +			put_unaligned_le32(word0, buf);
> +			buf +=3D sizeof(u32);
> +			bytes -=3D sizeof(u32);
> +			word_index++;
> +		}
> +		if (bytes) {
> +			put_unaligned_le32(word1, buf);
> +			buf +=3D sizeof(u32);
> +			bytes -=3D sizeof(u32);
> +			word_index++;
> +		}
> +	}
> +
> +	ret =3D 0;
> +
> +out_lock:
> +	writel(0, priv->base + AST2600_OTP_PROTECT_KEY);
> +	/* Complete the lock write before returning and releasing the mutex. */
> +	readl(priv->base + AST2600_OTP_PROTECT_KEY);
> +	return ret;
> +}

[Severity: Low]
This isn't a bug, but both ast2600_otp_init_keepout() and
ast2600_otp_read() mix guard(mutex) with goto out_lock cleanup within the
same function, contrary to the Cleanup API convention in
include/linux/cleanup.h.  Moving the work performed while
AST2600_OTP_PROTECT_KEY is unlocked into inner helpers (or using consistent
cleanup) would avoid mixing guard() with goto labels and also share the
duplicated unlock/relock sequence.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120174440.1234=
87-1-prasanth.padarthi10@gmail.com?part=3D2
