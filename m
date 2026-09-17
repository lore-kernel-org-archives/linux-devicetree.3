Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC8649A3CF
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686649; cv=none; b=k/BFsEB+zBkPRYQAh9NzofdifOTbRBvCSBBc0VkcTAuEqM2yw3vU+NQlKEoso+tPUqIDltkxdwPOEEdyg+nqBnVyRo6Mb52eqF/xkC2dZU9SUy1aj1wEe6avQRGd5dOCDM0wejdIQPbnJdMG4lVKrFotlY/sKQZ7dlKvDr4AU3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686649; c=relaxed/simple;
	bh=JsJqylgnbUjR5Dl/m1HrePP6RvduBYEKCeqv6SusPG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UlVxekhEx+e3GhaWtvG08hTLg5gswQWjV3IhGC1nrhzs+ZyeSFSWKY1RNi3y78qo1UJ3SL7MlpIJLiIj0HaMkuBOJt6eXxT8N7y2WNlXcrzgZ09+wH2m8Yv6Ui6fQxf8bMFrBKzoPd58TSAMLVreMNyvZCS10geGhSLmkwpDguU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FchU2aWX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FchU2aWX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F0D1F000FF;
	Thu, 17 Sep 2026 23:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686640;
	bh=qvyweFDovdyew8/eIRYoX6gFrUZANwO7ZK8V0ObHTUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FchU2aWXxZT/fOqVH6MBtwT8p7VkenCEKfr4lazszDW88u+Gd2CxD73cmH7MccImO
	 +cPg6nTjMdi5PH0iXW1nKQ1juBlyw1aX3DHYayBhSXdp+X7t5GNxf2W4Z+YXBPi6m7
	 vB5W8x5V4j0dRlXkiAp4AMrsQWzRHGWt37VSXSYGpqONXv+vIqOU5REO/6PMFjSDeG
	 9R2iu4o+raywdCahXzE35QIphn4SOa6vsCLLSHXFMCG06LPdb/590j/u62uYt5/Dm3
	 yQocglt8vJuUOxrLdHP2cmTfllAjrj7D3K2otW65XfKjw0TXAgCLGGHYLAq5OHVz/k
	 tDhCxQ5sdvhwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/19] crypto: cmh - add RSA akcipher
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917225929.2494111-13-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-13-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:10:39 +0000
Message-Id: <20260917231039.E0F0D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] crypto: cmh: partial tfm state corruption on set_pub_key failure
--

commit 245d9a370fc37764e90c38f7f7cb69490074e21e
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add RSA akcipher

This commit registers the RSA akcipher algorithm using the CMH PKE core,
supporting encryption, decryption, signing, and verification operations
for multiple key sizes.

> diff --git a/drivers/crypto/cmh/cmh_pke_rsa.c b/drivers/crypto/cmh/cmh_pk=
e_rsa.c
> new file mode 100644
> index 0000000000000..251ae8275865d
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pke_rsa.c
[ ... ]
> +static int cmh_rsa_set_pub_key(struct crypto_akcipher *tfm,
> +			       const void *key, unsigned int keylen)
> +{
> +	struct cmh_rsa_tfm_ctx *ctx =3D cmh_rsa_ctx(tfm);
> +	struct rsa_key rsa =3D {};
> +	u32 bits;
> +	int ret;
> +
> +	/*
> +	 * Re-keying: release any private-key state (and its persistent DMA
> +	 * mapping) left by a prior set_priv_key so it is not leaked until
> +	 * exit_tfm and cannot be mistaken for the new public key.
> +	 */
> +	cmh_key_destroy(&ctx->key);
> +
> +	ret =3D rsa_parse_pub_key(&rsa, key, keylen);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does this leave the transform in a partially corrupted state if parsing fai=
ls?

If cmh_rsa_set_pub_key() is called after a key pair has already been
configured, the private key is destroyed early. If rsa_parse_pub_key() then
fails, the function returns without updating or clearing the existing public
key.

Userspace could potentially trigger this via the AF_ALG socket interface by
passing malformed key material. This would leave the transform in an
inconsistent state where encryption still works using the old public key, b=
ut
decryption fails.

Should the old private key be preserved until the new public key is fully
validated, or should the entire transform state be wiped on error?

The same pattern also appears in cmh_rsa_set_priv_key() where the old priva=
te
key could be left active while the public key is freed on a failure during
key material setup.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D12
