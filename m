Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB95338DC6B
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 19:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786910170; cv=none; b=hES/eA5ia9vfve7hEE+rnvSCBq94NOn/zClOqEiT6EPG9cR4SHFFE+VmRO+0CUvD+iQlQZYsfxz580ZSHVXlNPnmzZ5Vc963O44CqIJxnj+Uu3hn710AGJ/6iSYg4UBsMq9tXjzow4Dz31+virKaO61nXz8+b0vNMPyNegToJgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786910170; c=relaxed/simple;
	bh=ygfso3+N0fs/ZjP46RWyAI37/9mlLfJtl3RMT75+k6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pNHuc+NckS8OdSByFkESSldXJOp8Abk+YKlTNrg4HN/ou4zDUYRX3OUhpgZIV0peFKCUVAYOQX6Uul1ZgssdUmkpOu+jXI7Gtr5pZX5HwnKjd+Fmyt0rFhCoVIMQ+CxA+caMX5L0H9Bfzku8eH9ENC3VAT1bNVblovj8v8CpvEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JotuGdVz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JotuGdVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378B11F000E9;
	Sun, 16 Aug 2026 19:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786910168;
	bh=5SQ6RFVjMEWI82BljOjk2lTDPsEOaeeD0F8a0jJwbCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JotuGdVzWUoZWVeWhBRt2rRL9dOjH+xxruj7WPOh8tUou3z4i9+Z2aWnyNztHfVNr
	 z1z9o7nj5666Sy06JoZ692e50FbWs4edhOujpVzQ6X0I9vpUb7KTKeBBXDwtLiyrsw
	 bQhSngv9DkU7lylLO1GT4m62uXnp/xQIp1NUTCtIdd07uWX5cLa1ldcK8UeUMyOEU+
	 AouJlmYi5H45NUUgZlmVjADUSeiHUg1Kb6B+cXaui+kTbfqNfeyhY+/cHgol2anQQ0
	 00p+HfkQE9jPCFGBfG5hTn9Ix+KVjsxgQ9VQKrkz+sx8lzy/CS5KRe3QSlVsvdjVLl
	 aWZL1UIkD6xow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] crypto: rockchip: Add RK356x/RK3588
 cryptographic offloader driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Olesinski" <dawidro@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816194112.552100-3-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
 <20260816194112.552100-3-dawidro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 19:56:07 +0000
Message-Id: <20260816195608.378B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] In `rk2_hash_run`, the DMA descriptor's source length is programme=
d with the full scatterlist node length instead of the requested cryptograp=
hic payload length, causing a DMA hardware overrun and timeout.
- [High] The driver dynamically allocates its algorithm structures (`rkc->a=
lgs`) and explicitly frees them in `rk2_crypto_remove()`, leading to a use-=
after-free when active TFMs later access the freed memory.
- [High] In the DMA timeout error path, the hardware reset control is asser=
ted without first disabling the device interrupt, causing a race condition =
with the IRQ handler.
- [Medium] The fallback checker `rk2_ahash_need_fallback` incorrectly evalu=
ates unused scatterlist entries beyond the requested payload length, causin=
g unnecessary software fallbacks.
--

--- Patch [2]: [PATCH v3 2/4] crypto: rockchip: Add RK356x/RK3588 cryptogra=
phic offloader driver ---
commit 4f54e41eac56e61deb80f3aed1c19c8ac7cba18a
Author: Dawid Olesinski <dawidro@gmail.com>

crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver

Add a driver for the second-generation Rockchip cryptographic hardware
accelerator found on RK3568 and RK3588 SoCs. It provides hardware
acceleration for AES block ciphers and hashing functions via a DMA engine,
falling back to software for unsupported requests.

diff --git a/drivers/crypto/rockchip/rk2_crypto.c b/drivers/crypto/rockchip=
/rk2_crypto.c
--- a/drivers/crypto/rockchip/rk2_crypto.c
+++ b/drivers/crypto/rockchip/rk2_crypto.c
[ ... ]
> static void rk2_crypto_remove(struct platform_device *pdev)
> {
>       struct rk2_crypto_dev *rkc =3D platform_get_drvdata(pdev);
>=20
>       rk2_crypto_unregister(rkc);
[ ... ]
>       dma_free_coherent(rkc->dev, sizeof(struct rk2_crypto_lli) * MAX_LLI,
>                         rkc->tl, rkc->t_phy);
>=20
>       kfree(rkc->algs);

[Severity: High]
Could this result in a use-after-free if active TFMs are still referencing
the algorithm structures?

When a user opens a crypto session and allocates a TFM, the crypto_alg
structure is pinned. If the device is unbound via sysfs, rk2_crypto_remove()
is invoked and frees rkc->algs immediately without waiting for active TFMs
to close.

When the session is later closed, the crypto core might access the freed
alg structure, for example in crypto_alg_put(). Should the algorithm
structures be statically allocated or managed differently to avoid this?

> }

diff --git a/drivers/crypto/rockchip/rk2_crypto_ahash.c b/drivers/crypto/ro=
ckchip/rk2_crypto_ahash.c
--- a/drivers/crypto/rockchip/rk2_crypto_ahash.c
+++ b/drivers/crypto/rockchip/rk2_crypto_ahash.c
[ ... ]
> static bool rk2_ahash_need_fallback(struct ahash_request *areq)
> {
[ ... ]
>       sg =3D areq->src;
>       while (sg) {
>               if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
>                       atomic_long_inc(&algt->stat_fb_align);
>                       return true;
>               }
>               if (sg->length % 4) {
>                       atomic_long_inc(&algt->stat_fb_sglen);
>                       return true;
>               }
>               sg =3D sg_next(sg);
>       }

[Severity: Medium]
Does this loop unnecessarily force a fallback for scatterlist entries that
extend beyond the requested payload length?

If a request fits entirely within the first scatterlist entry, but the chain
contains subsequent unused entries from the network stack that are unaligned
or have lengths not a multiple of 4, this loop will still evaluate them and
trigger a fallback.

Is there a way to limit this check to only the scatterlist length up to
areq->nbytes to avoid performance degradation on hardware-capable requests?

[ ... ]
> int rk2_hash_run(struct crypto_engine *engine, void *breq)
> {
[ ... ]
>       /*
>        * Multi-SG requests are forced into the software fallback path due=
 to
>        * hardware padding limitations (HW_PAD). Therefore, we are guarant=
eed
>        * to only process a single scatterlist element here.
>        */
>       dd->src_addr =3D cpu_to_le32(lower_32_bits(sg_dma_address(sgs)));
>       dd->src_len  =3D cpu_to_le32(sg_dma_len(sgs));

[Severity: High]
Will programming the DMA descriptor source length with the full scatterlist
node length cause a hardware overrun?

If a caller submits an asynchronous hash request where the scatterlist elem=
ent
is larger than areq->nbytes, the hardware padding engine will expect exactly
areq->nbytes. However, the DMA engine will push the entire sg_dma_len(sgs)
into the FIFO.

Could this cause the DMA engine to stall when the hash engine stops reading,
resulting in a timeout? Should this length be capped at areq->nbytes instea=
d?

[ ... ]
>       timeout =3D wait_for_completion_timeout(&rkc->complete,
>                                             msecs_to_jiffies(2000));
>       if (!timeout) {
>               dev_err(rkc->dev, "DMA timeout\n");
>               err =3D -ETIMEDOUT;
>               reset_control_assert(rkc->rst);
>               udelay(10);
>               reset_control_deassert(rkc->rst);
>               synchronize_irq(rkc->irq);
>       }

[Severity: High]
Is there a race condition here between asserting the hardware reset and the
interrupt handler?

If the DMA transfer times out and the hardware asserts an interrupt exactly
as the timeout expires, rk2_crypto_irq_handle() might execute concurrently
on another CPU.

If the interrupt handler attempts to read the RK2_CRYPTO_DMA_INT_ST register
while reset_control_assert() is active, could this crash the system with a
synchronous external abort?

Would it be safer to disable the interrupt before asserting the reset contr=
ol?

diff --git a/drivers/crypto/rockchip/rk2_crypto_skcipher.c b/drivers/crypto=
/rockchip/rk2_crypto_skcipher.c
--- a/drivers/crypto/rockchip/rk2_crypto_skcipher.c
+++ b/drivers/crypto/rockchip/rk2_crypto_skcipher.c
[ ... ]
> int rk2_cipher_run(struct crypto_engine *engine, void *async_req)
> {
[ ... ]
>               timeout =3D wait_for_completion_timeout(&rkc->complete,
>                                                     msecs_to_jiffies(2000=
));
>=20
>               if (!timeout) {
>                       dev_err(rkc->dev, "DMA timeout\n");
>                       err =3D -ETIMEDOUT;
>                       reset_control_assert(rkc->rst);
>                       udelay(10);
>                       reset_control_deassert(rkc->rst);
>                       synchronize_irq(rkc->irq);
>               }

[Severity: High]
Similar to the timeout path in rk2_hash_run(), does asserting the reset
control before synchronizing and disabling the IRQ risk a race condition
with rk2_crypto_irq_handle() here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816194112.5521=
00-1-dawidro@gmail.com?part=3D2
