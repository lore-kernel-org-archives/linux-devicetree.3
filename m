Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23769396579
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881378; cv=none; b=Rq2zl/PUWNnSDdIOMSutpsrn8IaTR4xvZb7yOu9mj7kFCgf4VI0O/UPbK2PVaLc4fNj7l//jX9JJZcyR9lhcrmFLi/TJvCmodBqujvpFw0Y/v81sPcTZ1EIvXkxB/hG/+PKBwyt+UntRaFRGNw6hWHzOe/Q/cvrj8yNVEziLDGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881378; c=relaxed/simple;
	bh=Vpmy8qPQ1U/lbVT3s/Aj5LfOgkOrnGAeHebnaA85Av4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K0SRCIyf2/NzywyxmDRdbKyhmBO2SGQDek/49jT0tQafDBpd2QsHHG1yeI7NblvgC3V2epKqXxb7pVYliS4OWa3G6yA082KwikmC5bI6pDYGEfcR4m4XjoE6VzTiFQUzRnd89cHEuVOB6luDwQ+Uylz12yrEAPPX/aIk/SICRS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SflXGKbO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SflXGKbO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5421F00A3A;
	Fri, 19 Jun 2026 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781881374;
	bh=YhggJNjnAbs7itaOx9WPDbCA2x/3vcHE7pc3gmzrjd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SflXGKbOoolDl+PIGDzZDFiGI3rNGyKfuSxX93Qwwi8Ik4CpFkqH1EOgcD1MvcBoy
	 MwDJEkaAoA4CGHXL3IDUE4li2d7kFG5dpeT/VH9hvC+oUJopKr72x9sA3SrXtNyYRL
	 tvAh3yDKV21I3/QlPcaeH95ht2FdY+gXp3rXgcsggdHAVZTtH9sDM6t9sLmyC+AELT
	 pvsdfWM/loKcVGqVq1o3PH9YEmpdEwTySZ/kV0KnvvE9DAZJYiFMpsS7HXPbOo2P0n
	 ODpeD7UmWXcQgI4sbtL7QEgJDoOQEi14ffGaxqZS56owtP72Ogqenx7ZJ9N1pUjAI5
	 sEWlOU5JmLx+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260619144558.1868995-3-pavitrakumarm@vayavyalabs.com>
References: <20260619144558.1868995-1-pavitrakumarm@vayavyalabs.com>
 <20260619144558.1868995-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:02:54 +0000
Message-Id: <20260619150254.8E5421F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] Heap buffer overflow in `spacc_hash_setkey` when processing ov=
ersized CMAC keys via userspace AF_ALG.
- [High] Global DMA pools in `spacc_hal.c` prevent multi-device support and=
 cause use-after-free on device unbind.
- [High] Cryptographic keys are corrupted on big-endian systems due to inco=
rrect byte-swapping I/O accessors.
- [High] Race condition in teardown due to `devm_request_irq` and `destroy_=
workqueue` leads to Use-After-Free.
- [High] Device driver teardown fails to stop or synchronize with in-flight=
 hardware operations.
- [High] Software fallback path in `spacc_hash_do_one_request` hashes exces=
s data beyond `req->nbytes`.
- [High] DMA Use-After-Free and state corruption when `spacc_compute_xcbc_k=
ey()` is interrupted by a signal.
- [High] `dma_addr_t` is explicitly truncated to 32 bits without enforcing =
a 32-bit DMA mask.
- [Medium] Hardware job context (`new_handle`) is leaked when DMA setup fai=
ls.
- [Medium] Device reference count leak in `spacc_hash_do_one_request`.
- [Medium] DMA descriptors are written in native CPU endianness instead of =
a fixed device endianness.
- [Low] `spacc_sg_to_ddt()` calls `dma_sync_sg_for_device()` with the mappe=
d segment count instead of the original scatterlist length.
--

commit ea0f852aa7f5a1432e0e841a15fc1ab659a9de28
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date:   Fri Jun 19 14:45:56 2026 +0000

    crypto: spacc - Add SPAcc ahash support
   =20
    Add ahash support to SPAcc driver.
    Below are the hash algos supported:
    - cmac(aes)
    - xcbc(aes)
    - cmac(sm4)
    - xcbc(sm4)
    - hmac(md5)
    - md5
    - hmac(sha1)
    - sha1
    - sha224
    - sha256
    - sha384
    - sha512
    - hmac(sha224)
    - hmac(sha256)
    - hmac(sha384)
    - hmac(sha512)
    - sha3-224
    - sha3-256
    - sha3-384
    - sha3-512

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> new file mode 100644
> index 0000000000000..644d9401289c3
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
[ ... ]
> @@ -222,6 +222,8 @@ static int spacc_hash_init_dma(struct device *dev, st=
ruct ahash_request *req)
> =20
>  err_free_dst:
>  	pdu_ddt_free(&ctx->dst);
>  err_free_digest:
>  	dma_pool_free(priv->hash_pool, ctx->digest_buf, ctx->digest_dma);

[Severity: Medium]
Is a spacc_close() call missing on this error path?

Earlier in spacc_hash_init_dma(), a hardware context handle is acquired via
spacc_ctx_clone_handle(). If mapping the scatterlist to the device fails,
the function jumps to err_free_dst to clean up.

Without a spacc_close() call here, it looks like this leaks the hardware
context semaphore count and job slot.

> =20
>  	return rc;
>  }
[ ... ]
> @@ -253,6 +253,8 @@ static int spacc_hash_setkey(struct crypto_ahash *tfm=
, const u8 *key,
>  		keylen =3D digest_size;
>  		dev_dbg(salg->dev, "updated keylen: %u\n", keylen);
>  	} else {
>  		memcpy(tctx->ipad, key, keylen);
>  	}

[Severity: Critical]
Is it possible for a user to provide a key larger than 128 bytes here?

When userspace configures a CMAC algorithm via the AF_ALG netlink socket,
it can pass a key of arbitrary length. The logic in spacc_hash_setkey()
bypasses key hashing for CRYPTO_MODE_MAC_CMAC and unconditionally executes
the memcpy().

Since tctx->ipad is a fixed 128-byte array, passing a key larger than
128 bytes would cause a heap buffer overflow.

Could we validate the key length before copying? I notice the
spacc_is_mode_keysize_supported() check happens after this memory copy.

> =20
>  	if (!spacc_is_mode_keysize_supported(&priv->spacc, salg->mode->id,
[ ... ]
> @@ -342,6 +342,8 @@ static int spacc_hash_do_one_request(struct crypto_en=
gine *engine, void *areq)
>  	tctx->tmp_sgl[0].length =3D 0;
> =20
>  	if (tctx->handle < 0 || !tctx->ctx_valid) {
>  		priv =3D dev_get_drvdata(salg->dev);
>  		tctx->dev =3D get_device(salg->dev);

[Severity: Medium]
Does this path leak a device reference?

During spacc_hash_do_one_request(), if the context handle needs to be
reopened, tctx->dev gets a new reference. Because spacc_hash_setkey() sets
tctx->ctx_valid =3D false after already taking a reference to the device, t=
he
next hash operation fetches a new reference and overwrites tctx->dev.

Will this prevent the device from ever being cleanly removed since
put_device() isn't called on the old reference?

> =20
>  		/*
[ ... ]
> @@ -484,6 +484,8 @@ static int spacc_hash_do_one_request(struct crypto_en=
gine *engine, void *areq)
>  				       sg_nents_for_len(req->src, req->nbytes),
>  				       SG_MITER_ATOMIC | SG_MITER_FROM_SG);
>  			while (sg_miter_next(&miter)) {
>  				rc =3D crypto_shash_update(desc,
>  							 miter.addr,
>  							 miter.length);
>  				if (rc)

[Severity: High]
Can this software fallback loop process more data than requested?

Unlike standard fallback loops, miter.length isn't clamped to the
remaining req->nbytes. If req->nbytes indicates a partial segment
(for example, 10 bytes), but the underlying scatterlist element length
is larger (like a 4096-byte page), it seems the entire 4096 bytes will
be hashed.

Would this cause an incorrect digest and potentially read out-of-bounds
page data into the hash context?

>  					break;
>  			}
> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> new file mode 100644
> index 0000000000000..bfbd6624e9268
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
[ ... ]
> @@ -423,6 +423,8 @@ int spacc_compute_xcbc_key(struct spacc_device *spacc=
, int mode_id,
>  			if (err !=3D 0)
>  				goto xcbc_err;
> =20
>  			wait_event_interruptible(job->waitq, job->job_done);
>  			job->job_done =3D 0;
>  			err =3D job->job_err;
> =20
>  			if (err !=3D 0)
>  				goto xcbc_err;

[Severity: High]
What happens if wait_event_interruptible() is interrupted by a signal?

It returns -ERESTARTSYS, and the driver checks err =3D job->job_err,
which would still be -EINPROGRESS. The code then jumps to the error path,
frees the DMA buffer, and closes the job handle.

However, the hardware DMA might still be actively running. If the job
handle is released, could it be re-allocated to a new request while the
hardware subsequently corrupts the freed memory and finishes asynchronously?

>  		}
[ ... ]
> @@ -1137,6 +1137,8 @@ int spacc_sg_to_ddt(struct device *dev, struct scat=
terlist *sg,
>  		pdu_ddt_add(dev, ddt, sg_dma_address(sg_entry),
>  			    sg_dma_len(sg_entry));
>  	}
> =20
>  	dma_sync_sg_for_device(dev, sg, nents, dma_direction);

[Severity: Low]
Is this DMA sync call necessary, and is it using the correct segment count?

dma_map_sg() implicitly transfers ownership to the device and performs
necessary cache synchronization. Immediately calling dma_sync_sg_for_device=
()
appears redundant.

Additionally, it is called using nents (the mapped segments) instead of
orig_nents (the original scatterlist size), which violates the DMA API
contract for syncing.

> =20
>  	return orig_nents;
>  }
> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> new file mode 100644
> index 0000000000000..deade3a8f2529
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
[ ... ]
> @@ -205,6 +205,10 @@ static void spacc_crypto_remove(struct platform_devi=
ce *pdev)
>  	spacc_irq_glbl_disable(&priv->spacc);
>  	spacc_unregister_algs(priv);
> =20
>  	if (priv->engine)
>  		crypto_engine_exit(priv->engine);

[Severity: High]
Does this teardown path properly synchronize with in-flight hardware
operations?

During driver removal, crypto_engine_exit() stops the engine. However,
if the hardware queue isn't empty, it can fail and the driver proceeds
to free all DMA buffers and unmap memory via devres.

Because the hardware engine was not explicitly reset or halted, could it
continue executing and perform DMA operations into freed memory?

> =20
>  	if (priv->spacc_wq)
>  		destroy_workqueue(priv->spacc_wq);

[Severity: High]
Is there a race condition between the workqueue destruction and the
devres-managed IRQ handler?

spacc_crypto_remove() tries to silence interrupts and then destroys the
workqueue. Because the IRQ handler was registered with devm_request_irq()
and IRQF_SHARED, it remains fully registered until after the remove
function completes.

If the shared interrupt fires, spacc_irq_handler() may execute and call
queue_work() on the already destroyed workqueue, leading to a Use-After-Fre=
e.

> =20
>  	spacc_remove(pdev);
>  }
> diff --git a/drivers/crypto/dwc-spacc/spacc_hal.c b/drivers/crypto/dwc-sp=
acc/spacc_hal.c
> new file mode 100644
> index 0000000000000..b3c1fcda4df2a
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_hal.c
[ ... ]
> @@ -160,6 +160,9 @@ static void pdu_to_dev_little(void __iomem *addr_, co=
nst unsigned char *src,
>  	__le32 val;
> =20
>  	while (nword--) {
>  		data =3D *((u32 *)src);
>  		val =3D __cpu_to_le32(data);
> =20
>  		__raw_writel((u32 __force)val, addr);

[Severity: High]
Does casting the byte array to a 32-bit integer corrupt keys on
big-endian systems?

The code casts an arbitrary unaligned byte array to u32 * and
dereferences it. This causes a crash on architectures that trap
unaligned accesses like ARM or SPARC.

Furthermore, reading bytes as a native 32-bit integer means the byte
order within the word changes depending on CPU endianness. On big-endian
systems, writing this word to the device registers causes the key or IV
bytes to be reversed within every 4-byte chunk.

>  		src +=3D 4;
>  		addr++;
>  	}
>  }
[ ... ]
> @@ -229,6 +229,8 @@ int pdu_mem_init(void *device)
>  {
>  	if (ddt_device)
>  		return 0; /* already setup */
> =20
>  	/* max of 64 DDT entries */
>  	ddt_device =3D device;
>  	ddt_pool =3D dma_pool_create("spaccddt", device,
>  				   DDT_MAX_ENTRIES, 8, 0);

[Severity: High]
Do these global DMA pools prevent multi-device support?

pdu_mem_init() creates DMA pools using static global variables (ddt_pool,
ddt_device). If a second SPAcc instance probes, it reuses the first
instance's pools, which breaks DMA on systems with IOMMUs.

If the first instance is unbound, pdu_mem_deinit() destroys the global
pools, leaving any remaining instances with dangling pointers. This would
result in a use-after-free crash on subsequent crypto requests.

> =20
>  	if (!ddt_pool)
[ ... ]
> @@ -336,6 +336,8 @@ int pdu_ddt_add(struct device *dev, struct pdu_ddt *d=
dt, dma_addr_t phys,
>  	if (ddt->idx =3D=3D ddt->limit)
>  		return -EINVAL;
> =20
>  	ddt->virt[ddt->idx * 2 + 0] =3D (uint32_t)phys;
>  	ddt->virt[ddt->idx * 2 + 1] =3D size;

[Severity: High]
Does this truncate the DMA address on systems with memory above 4GB?

The 64-bit phys DMA address is cast to uint32_t and written into the
descriptor, but the driver does not appear to call
dma_set_mask_and_coherent() during probe to enforce a 32-bit restriction.
This could result in silent memory corruption.

[Severity: Medium]
Are these descriptors being written in the native CPU endianness?

Because the hardware DMA descriptor is written directly to coherent memory
using uint32_t, running the driver on a big-endian architecture will result
in the hardware reading byte-swapped values for addresses and lengths.

Should this explicitly enforce endianness via cpu_to_le32()?

>  	ddt->virt[ddt->idx * 2 + 2] =3D 0;
>  	ddt->virt[ddt->idx * 2 + 3] =3D 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619144558.1868=
995-1-pavitrakumarm@vayavyalabs.com?part=3D2
