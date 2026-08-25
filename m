Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC6438A706
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787697408; cv=none; b=kWNP70QQOL4kHdULxu1qVL02+Iq6dVk55TTkQ2ACKthQK4oDBJHOYAHlD0JG9yj1kT+fx/4iIw3iI6gO1BjaMMUgIeTXTYJ5POas9aRwLJs1BAI9M0D5/jrNye3KZYK48B/Dt3JnWf/XXxILObbP0bQCXSRzqShLo245bTOEqKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787697408; c=relaxed/simple;
	bh=BfEhZVV8hSKqmYzQAVZCM+kG6T+CAnwOl5LappRI66I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TpZB1AOB7env4BlwWDvse/GhW+6V66E7PbAAREIkJk314WJ7SDGpoe+QGpijX5VKMT7c6do3JfgR+a+qJyf6FWS8jiEkYWwsiiLAOKyc5kDEJHYLpVeTW+42k63VU+Bw8ZZCy9pD/fbLe/V//Xet+n2XCvFCPW9hT0WrIeNhDcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBJ4MWNY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBJ4MWNY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294F81F000E9;
	Tue, 25 Aug 2026 22:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787697407;
	bh=XX+I4pdjqboABhtM6xQY71l6eevU1am8J75DHk202kM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VBJ4MWNYdnYqfrD7AbcP+D85VfO7GgWEGVmRTgG4PAlTbtSEj6VHjKPu4vjDJaG0f
	 77VBOjRUTSD+iG1WqWNg3XHrSXqIUYK2XHAgkNnEMdhEudHhQfLuhQafULGAZimroV
	 /F4ibFovjxQkF7YORXDO1aVmBv6leB2iTOlhwQY+19nQaCtEJk4eYUkUxhlDPYyt8i
	 PrwubuQZLo/S2uiJ/TUkXQAwuVEFCOTL9++KVuKJB44vphrjnf99syh5r9kC8JVZEC
	 nrgTs36WJTs5geWtEHfeYHLrOGmGky/uWgxE59kZtR0Wda2LInog4vuMEeTjOcDUol
	 mrmDVoimu7Oyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/19] crypto: cmh - add ML-KEM/ML-DSA (QSE)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825221539.255951-16-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-16-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:36:46 +0000
Message-Id: <20260825223647.294F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ML-DSA implementation incorrectly rejects 0-length messages, preve=
nting signing and verification of empty messages.
--

commit 69ecf7bfc1b6bb507d086ddc8d892b5e6791e35f
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add ML-KEM/ML-DSA (QSE)

Register ML-KEM (Kyber) and ML-DSA (Dilithium) algorithms using the CMH
QSE core (core ID 0x09).

> diff --git a/drivers/crypto/cmh/cmh_pqc_mldsa.c b/drivers/crypto/cmh/cmh_=
pqc_mldsa.c
> new file mode 100644
> index 0000000000000..cbaba7d63b437
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pqc_mldsa.c
> @@ -0,0 +1,389 @@
[ ... ]
> +static int cmh_mldsa_sign(struct crypto_sig *tfm,
> +			  const void *src, unsigned int slen,
> +			  void *dst, unsigned int dlen)
> +{
[ ... ]
> +	if (ctx->key.mode !=3D CMH_KEY_RAW)
> +		return -EINVAL;
> +	if (dlen < sig_size)
> +		return -EINVAL;
> +	if (!slen || slen > ML_DSA_MAX_MLEN)
> +		return -EINVAL;

[Severity: High]
Does this incorrectly reject valid 0-length messages?

Because this driver overrides the kernel's fallback implementation with a
higher priority (5001), system-wide empty message signing operations could
unconditionally fail with -EINVAL, violating the FIPS 204 specification.

[ ... ]
> +static int cmh_mldsa_verify(struct crypto_sig *tfm,
> +			    const void *src, unsigned int slen,
> +			    const void *digest, unsigned int dlen)
> +{
[ ... ]
> +	if (!ctx->pub_key)
> +		return -EINVAL;
> +	if (slen !=3D sig_size)
> +		return -EINVAL;
> +	if (!dlen || dlen > ML_DSA_MAX_MLEN)
> +		return -EINVAL;

[Severity: High]
Does this also incorrectly reject valid 0-length messages for verification?

Similar to signing, this could block drop-in compatibility for userspace or
kernel components verifying an empty payload.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D15
