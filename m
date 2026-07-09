Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D321B6CE9
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 21:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630942; cv=none; b=gCKqlRsTM7GMEpHuXnu916k+y5dK8RpS0zpFKGaeRiMxGqXomvYhnJ+g3JqJpz/3xx/8RnOLh03RRuE44vySLmbkVVRk0IvYoWVUV04g9CdOtWebTCK5Ul2qhxj83rhco1GfI0FUorJOodPScD+9v43xyWaE6VQPBnisdY4z0oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630942; c=relaxed/simple;
	bh=n+1llFJMX4r2FwTuDpq4T0bSfLoNTza05auJsYn+pO8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MiFRPvZLuoq0KPbCvI38zmr7XjJQeRUolbdJ1PTv0fbl9TkFMBxjgSOTVkvk8KrkRoYPr6+00u1fvBc8SWkMgBBBhh5kkPOpCZcU+4yknzg6ygiinuZ+nvWFLR1Bye5lAu8eA7Mti6I4Ii3WbPvoXYhkaZ51zlN3CeJAkRo9ftM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCbPv/7+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCbPv/7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8832D1F000E9;
	Thu,  9 Jul 2026 21:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630940;
	bh=BnIwmRatJQ1oqBcVN2gpQyBg7LcXuPwU4knVhJPW6HY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WCbPv/7+zmJUtghHGnPcXNAtYCEQHzCZhjwCO5CMMW9C7MzKsmrAXteNuHNCFFygf
	 qAPYv1DtQJoZUIOcOB04gW+L94XBp6Lxt1oVk7yEgZUL8UHON4pQkv7CCOJBf2MZLu
	 Rm/TGSLb03dcsYzAddNCcRkpq+D0m8CUyQU2iUYp3n+kbi3RS0LKVZHocU22+9TuAl
	 7PcNJdqF5dY02qy55paywKsp7gJVeoLVcxgV6Sl7vKzxcsl2HGu6L6S3aYmHiUBIwB
	 MO3fij6LNVNFw+FoAhSoSr0No19h6HOw65ap269a0pLuiMyz3j3LPmQeVbTjDlkLy3
	 LgCi1RJ5F2eqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/19] crypto: cmh - add SLH-DSA/LMS/XMSS (HCQ)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709203037.1884436-17-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-17-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 21:02:18 +0000
Message-Id: <20260709210220.8832D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] The SLH-DSA, LMS, and XMSS verification and signing functions =
unconditionally unmap and free DMA-mapped buffers on timeout, leading to po=
tential use-after-free and memory corruption by the hardware.
- [High] LMS and XMSS algorithms fail to implement the `.max_size` callback=
 in their `struct sig_alg` definitions.
- [High] SLH-DSA, LMS, and XMSS algorithms fail to implement the `.digest_s=
ize` callback in their `struct sig_alg` definitions.
- [Medium] The PQC signature algorithms incorrectly reject 0-length message=
s, preventing empty message signing and verification.
--

--- Patch [16]: [PATCH v2 16/19] crypto: cmh - add SLH-DSA/LMS/XMSS (HCQ) -=
--
commit aa5a6d3ad22af27c0421ed22c5126da35c7caa5b
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SLH-DSA/LMS/XMSS (HCQ)

Register SLH-DSA, LMS, LMS-HSS, XMSS, and XMSS-MT algorithms
using the CMH HCQ core (core ID 0x08).  SLH-DSA is registered as a
sig algorithm with sign and verify support.

> --- a/drivers/crypto/cmh/cmh_pqc_slhdsa.c
> +++ b/drivers/crypto/cmh/cmh_pqc_slhdsa.c
> @@ -54,23 +54,342 @@ static inline struct cmh_slhdsa_tfm_ctx *cmh_slhdsa_=
ctx(struct crypto_sig *tfm)
>  static int cmh_slhdsa_sign(struct crypto_sig *tfm,
>                             const void *src, unsigned int slen,
>                             void *dst, unsigned int dlen)
>  {
[ ... ]
>         if (ctx->key.mode =3D=3D CMH_KEY_NONE)
>                 return -EINVAL;
>         if (dlen < sig_sz)
>                 return -EINVAL;
>         if (!slen || slen > SLHDSA_MAX_MSG_LEN)
>                 return -EINVAL;

[Severity: Medium]
Does this incorrectly reject valid 0-length messages? Empty strings are val=
id=20
inputs for SLH-DSA, but this returns -EINVAL when slen is 0. Is this intend=
ed=20
to prevent a ZERO_SIZE_PTR allocation from kmemdup()?=20

>         m_buf =3D kmemdup(src, slen, GFP_KERNEL);
[ ... ]
>         ret =3D cmh_tm_submit_sync_tmo(vcq, vcq_count, 1, d.mbx_idx,
>                                      cmh_tm_slow_op_timeout_jiffies());
>=20
>         if (!ret) {
>                 /* Sync bounce buffer so CPU sees the DMA-written signatu=
re */
>                 cmh_dma_sync_for_cpu(sig_dma, sig_sz, DMA_FROM_DEVICE);
>                 memcpy(dst, sig_buf, sig_sz);
>                 ret =3D sig_sz;
>         }
>=20
> out_unmap:
>         if (sk_buf) {
>                 if (!cmh_dma_map_error(sk_dma))
>                         cmh_dma_unmap_single(sk_dma, sk_sz, DMA_TO_DEVICE=
);
>                 kfree_sensitive(sk_buf);
>         }
>         if (!cmh_dma_map_error(sig_dma))
>                 cmh_dma_unmap_single(sig_dma, sig_sz, DMA_FROM_DEVICE);
>         if (!cmh_dma_map_error(m_dma))
>                 cmh_dma_unmap_single(m_dma, slen, DMA_TO_DEVICE);
>=20
> out_free:
>         kfree(sig_buf);
>         kfree(m_buf);
>         return ret;
>  }

[Severity: Critical]
Are these buffers safely unmapped and freed if the transaction times out?

If cmh_tm_submit_sync_tmo() returns -ETIMEDOUT, the documentation in the TM
subsystem notes that the hardware abort might fail, leaving the hardware ac=
tively
writing to the DMA buffers. Because kfree() is called unconditionally on=20
sk_buf, sig_buf, and m_buf here, could this allow the hardware to corrupt=20
whatever data is subsequently allocated in those physical pages?

> @@ -165,22 +165,58 @@ static int cmh_slhdsa_verify(struct crypto_sig *tfm,
>                               const void *src, unsigned int slen,
>                               const void *digest, unsigned int dlen)
>  {
[ ... ]
>         if (!dlen || dlen > SLHDSA_MAX_MSG_LEN)
>                 return -EINVAL;

[Severity: Medium]
Similar to the sign function, does this prevent verifying 0-length messages=
=20
which are otherwise mathematically valid for SLH-DSA?

>         sig_buf =3D kmemdup(src, slen, GFP_KERNEL);
[ ... ]
>         /* SLH-DSA verify recomputes hyper-tree hashes -- inherently slow=
 */
>         ret =3D cmh_tm_submit_sync_tmo(vcq, HCQ_VCQ_CMDS_MIN, 1, d.mbx_id=
x,
>                                      cmh_tm_slow_op_timeout_jiffies());
>=20
> out_unmap:
>         if (!cmh_dma_map_error(pk_dma))
>                 cmh_dma_unmap_single(pk_dma, pk_sz, DMA_TO_DEVICE);
>         if (!cmh_dma_map_error(m_dma))
>                 cmh_dma_unmap_single(m_dma, dlen, DMA_TO_DEVICE);
>         if (!cmh_dma_map_error(sig_dma))
>                 cmh_dma_unmap_single(sig_dma, sig_sz, DMA_TO_DEVICE);
>=20
> out_free:
>         kfree(pk_buf);
>         kfree(m_buf);
>         kfree(sig_buf);
>         return ret;
>  }

[Severity: Critical]
Are pk_buf, m_buf, and sig_buf safe to free here on a timeout?=20

For the same reasons as above, if cmh_tm_submit_sync_tmo() returns -ETIMEDO=
UT,=20
does unconditionally freeing these buffers risk memory corruption by the=20
hardware?

> @@ -313,24 +313,64 @@ SLHDSA_INIT(HCQ_SLHDSA_SHA2_256F)
>  #define SLHDSA_ALG(name, drv, ps_val) {                                 =
       \
>                 .sign           =3D cmh_slhdsa_sign,                     =
 \
>                 .verify         =3D cmh_slhdsa_verify,                   =
 \
>                 .set_pub_key    =3D cmh_slhdsa_set_pub_key,              =
 \
>                 .set_priv_key   =3D cmh_slhdsa_set_priv_key,             =
 \
>                 .key_size       =3D cmh_slhdsa_key_size,                 =
 \
>                 .max_size       =3D cmh_slhdsa_max_size,                 =
 \
>                 .init           =3D cmh_slhdsa_init_##ps_val,            =
 \
>                 .exit           =3D cmh_slhdsa_exit,                     =
 \
>                 .base =3D {                                              =
 \

[Severity: High]
Is the .digest_size callback missing from this algorithm definition?

When .digest_size is not provided, crypto_sig_digestsize() falls back to the
public key size. For SLH-DSA, could this cause valid sign/verify operations=
 to
be prematurely rejected with -EINVAL by the asymmetric_keys subsystem if th=
e=20
payload is larger than the small public key?

> --- a/drivers/crypto/cmh/cmh_pqc_lms.c
> +++ b/drivers/crypto/cmh/cmh_pqc_lms.c
> @@ -49,20 +49,60 @@ static int cmh_lms_verify(struct crypto_sig *tfm,
>                            const void *src, unsigned int slen,
>                            const void *digest, unsigned int dlen)
>  {
[ ... ]
>         if (!dlen || dlen > LMS_MAX_MSG_LEN)
>                 return -EINVAL;

[Severity: Medium]
Does this incorrectly reject valid 0-length messages for LMS?

>         sig_buf =3D kmemdup(src, slen, GFP_KERNEL);
[ ... ]
>         /* LMS verify traverses Merkle hash chains -- inherently slow */
>         ret =3D cmh_tm_submit_sync_tmo(vcq, LMS_VCQ_CMDS, 1, d.mbx_idx,
>                                      cmh_tm_slow_op_timeout_jiffies());
>=20
> out_unmap:
>         if (!cmh_dma_map_error(pk_dma))
>                 cmh_dma_unmap_single(pk_dma, ctx->pub_key_len, DMA_TO_DEV=
ICE);
>         if (!cmh_dma_map_error(m_dma))
>                 cmh_dma_unmap_single(m_dma, dlen, DMA_TO_DEVICE);
>         if (!cmh_dma_map_error(sig_dma))
>                 cmh_dma_unmap_single(sig_dma, slen, DMA_TO_DEVICE);
>=20
> out_free:
>         kfree(pk_buf);
>         kfree(m_buf);
>         kfree(sig_buf);
>         return ret;
>  }

[Severity: Critical]
Does unconditionally freeing pk_buf, m_buf, and sig_buf on a timeout risk
use-after-free and memory corruption by the hardware?

> @@ -164,36 +164,36 @@ static void cmh_lms_exit(struct crypto_sig *tfm)
>  static struct sig_alg cmh_lms_algs[] =3D {
>         {
>                 .verify         =3D cmh_lms_verify,
>                 .set_pub_key    =3D cmh_lms_set_pub_key,
>                 .key_size       =3D cmh_lms_key_size,
>                 .init           =3D cmh_lms_init,
>                 .exit           =3D cmh_lms_exit,
>                 .base =3D {

[Severity: High]
Are both the .max_size and .digest_size callbacks missing here?

Without .max_size, crypto_sig_maxsize() defaults to the public key size.=20
Because LMS signatures are much larger than their public keys, won't this=20
cause standard verification requests to fail with -EINVAL?=20

Similarly, missing .digest_size may cause operations to be rejected when th=
e=20
message size exceeds the public key size.

> --- a/drivers/crypto/cmh/cmh_pqc_xmss.c
> +++ b/drivers/crypto/cmh/cmh_pqc_xmss.c
> @@ -49,20 +49,60 @@ static int cmh_xmss_verify(struct crypto_sig *tfm,
>                             const void *src, unsigned int slen,
>                             const void *digest, unsigned int dlen)
>  {
[ ... ]
>         if (!dlen || dlen > XMSS_MAX_MSG_LEN)
>                 return -EINVAL;

[Severity: Medium]
Does this incorrectly reject valid 0-length messages for XMSS?

>         sig_buf =3D kmemdup(src, slen, GFP_KERNEL);
[ ... ]
>         /* XMSS verify traverses Merkle hash chains -- inherently slow */
>         ret =3D cmh_tm_submit_sync_tmo(vcq, XMSS_VCQ_CMDS, 1, d.mbx_idx,
>                                      cmh_tm_slow_op_timeout_jiffies());
>=20
> out_unmap:
>         if (!cmh_dma_map_error(pk_dma))
>                 cmh_dma_unmap_single(pk_dma, ctx->pub_key_len, DMA_TO_DEV=
ICE);
>         if (!cmh_dma_map_error(m_dma))
>                 cmh_dma_unmap_single(m_dma, dlen, DMA_TO_DEVICE);
>         if (!cmh_dma_map_error(sig_dma))
>                 cmh_dma_unmap_single(sig_dma, slen, DMA_TO_DEVICE);
>=20
> out_free:
>         kfree(pk_buf);
>         kfree(m_buf);
>         kfree(sig_buf);
>         return ret;
>  }

[Severity: Critical]
Does unconditionally freeing pk_buf, m_buf, and sig_buf on a timeout risk
use-after-free and memory corruption by the hardware?

> @@ -164,36 +164,36 @@ static void cmh_xmss_exit(struct crypto_sig *tfm)
>  static struct sig_alg cmh_xmss_algs[] =3D {
>         {
>                 .verify         =3D cmh_xmss_verify,
>                 .set_pub_key    =3D cmh_xmss_set_pub_key,
>                 .key_size       =3D cmh_xmss_key_size,
>                 .init           =3D cmh_xmss_init,
>                 .exit           =3D cmh_xmss_exit,
>                 .base =3D {

[Severity: High]
Are both the .max_size and .digest_size callbacks missing here?

As with LMS, missing .max_size means crypto_sig_maxsize() defaults to the=20
public key size, preventing validation of XMSS signatures because they are=
=20
larger than their public keys. Missing .digest_size may also break validati=
on=20
for any payload larger than the public key.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D16
