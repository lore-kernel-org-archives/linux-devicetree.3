Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A4C48F83F
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047045; cv=none; b=FIx23EqV0RXkuklCQhKlCJ4F/h0/DpGuIyXNia7p8UBBWFnSQqagrqALV1U34DXPWLe2ilM89AuCIfZyeeg2VdaeLGBM3eDDSYvROC2xe6Rdb3v0FVNJJc7JcBMUQNl/8FsOlGhEclRhlT3LUYoaqPy3fZcBmBh6BLhJquIDZAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047045; c=relaxed/simple;
	bh=YPgGJ+9hMdHtPDGt1JZjJv2IxrfVOEOJAJ2TKydIZHE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nb+6w9uj94j/kuLWtZvZ47620KHbOZHvp/E8sUnxiaU4/9pCS1y/bOGuLvKYUY+kVDq2FqeGMr0NvO245baeS8yVkrz5lsGfoj4lF2tQ/9bYIEbXRiHPk8U9SX7uWRgBZd2+pBKId/VhvcSicy62kYUiuS+3w0rL0HPOod1jq3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlzZ8DFd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlzZ8DFd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0181F000E9;
	Thu,  6 Aug 2026 20:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047038;
	bh=PQi0eridXSJIGgNpIL9R09rEpocfAmHdHlknhSrpyag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mlzZ8DFdT0Xf4kFhDzzRL+cAIGnuoNW/dHV0I2jL152XVqcOCoYZYf7XcpMZr0W/E
	 DavpNbhN4iJFnPzB0CgvXneIEzS3zYwyNHFFWeFeEpZlOLFUobNQolX1YeniMdya+b
	 v7x5bouCZ3VwN0Wtec321gRiu2JWO6DWRUdZT6jdErXBiw3x5q6LerAA3/aE9Nh2MS
	 sh59giO0L4GT0jHV9IihZedrEmMz5hy6cqMch29CeesS1CvuK7nLuYqVLPN9T8AXRP
	 seQeXeviqghMyabHslNWSoz3J1sZdDYvxv+VLK7QN4c/peiP+6l7gy0YVECTBjiqhl
	 pOVf6qE3DxrhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/19] crypto: cmh - add CSHAKE/KMAC ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806195519.2703224-7-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-7-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:10:37 +0000
Message-Id: <20260806201037.CD0181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Unbounded memory allocation in `cmh_cshake_update` allows triv=
ial kernel memory exhaustion (OOM).
- [High] Accumulated dynamically allocated chunks leak when ahash requests =
are re-initialized, imported, or abandoned.
- [High] `cmh_cshake_export` sleeps in atomic context by using `GFP_KERNEL`=
 and performing a synchronous hardware submission.
- [High] Direct DMA mapping of a stack-allocated request context variable.
- [High] Lack of synchronization in `setkey` allows concurrent hardware acc=
ess to freed key memory via DMA.
- [High] Integer overflow vulnerability during chunk allocation leads to he=
ap buffer overflow.
- [Medium] Unaligned structure members are directly mapped for DMA, breakin=
g cacheline coherency.
--

--- Patch [6]: [PATCH v3 06/19] crypto: cmh - add CSHAKE/KMAC ahash ---
commit 6138eb846ff49a783a8916ba0affae21d8744139
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add CSHAKE/KMAC ahash

This commit registers ahash algorithms for cSHAKE128, cSHAKE256, KMAC128,
and KMAC256 using the CMH hash core. It adds support for incremental
updates and export/import for cSHAKE, and imposes a 64KB data cap for
KMAC.

> diff --git a/drivers/crypto/cmh/cmh_cshake.c b/drivers/crypto/cmh/cmh_csh=
ake.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_cshake.c
> @@ -0,0 +1,814 @@
[ ... ]
> +struct cmh_cshake_chunk {
> +	struct list_head  list;
> +	struct list_head  tfm_node; /* per-tfm orphan tracking */
> +	u32               len;
> +	u8                data[];
> +};

[Severity: Medium]
Will this structure layout cause data corruption on cache-incoherent
architectures? The data array follows list pointers and a u32 length field,
placing it at an unaligned offset. When this flexible array member is
directly mapped for DMA, it violates the requirement that dynamically mapped
buffers must be aligned to ARCH_DMA_MINALIGN to prevent cacheline sharing.

[ ... ]
> +static int cmh_cshake_setkey(struct crypto_ahash *tfm, const u8 *key,
> +			     unsigned int keylen)
> +{
[ ... ]
> +	/* Free previous N and S */
> +	kfree(tctx->func_name);
> +	kfree(tctx->custom);

[Severity: High]
Could this lockless memory free race with an ongoing final() operation?
If user space calls setsockopt() to set a new key concurrently with
socket I/O, the active custom string's memory might be unmapped and freed
while the hardware is actively accessing it via DMA, leading to a
use-after-free and potential memory corruption.

[ ... ]
> +static int cmh_cshake_init(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_cshake_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	rctx->info =3D cmh_cshake_get_info(tfm);
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	rctx->num_chunks =3D 0;

[Severity: High]
Does this cause a memory leak when a request is re-initialized or abandoned?
If a caller issues crypto_ahash_init() on an existing request that already
accumulated data chunks, the chunk list is reset via INIT_LIST_HEAD()
without freeing the existing chunks. The chunks remain indefinitely tracked
in the transform context list, which could allow unbounded memory growth
over the lifetime of a long-lived transform.

[ ... ]
> +static int cmh_cshake_update(struct ahash_request *req)
> +{
[ ... ]
> +	if (!req->nbytes)
> +		return 0;
> +
> +	chunk =3D kmalloc(sizeof(*chunk) + req->nbytes,
> +			req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +			GFP_KERNEL : GFP_ATOMIC);

[Severity: Critical]
Can the arithmetic operation here wrap around on 32-bit platforms?
Since req->nbytes is an unsigned int controlled by the caller, providing
an extremely large value could overflow the addition, allocating a tiny
buffer. The subsequent data copy would then overwrite kernel heap memory.

[Severity: Critical]
Does this allow an unprivileged attacker to exhaust kernel memory?
Unlike the KMAC implementation which enforces a 64KB maximum limit, the
cSHAKE implementation unconditionally buffers all incoming data chunks
without any bounds check on the total length or number of chunks.

[ ... ]
> +static int cmh_cshake_final(struct ahash_request *req)
> +{
[ ... ]
> +	/* Map checkpoint buffer if present (CMH eSW reads it) */
> +	if (rctx->has_checkpoint) {
> +		ckpt_dma =3D cmh_dma_map_single(rctx->checkpoint,
> +					      HC_CONTEXT_SIZE, DMA_TO_DEVICE);

[Severity: High]
Is it safe to map this request context variable directly for DMA?
The driver maps rctx->checkpoint via cmh_dma_map_single(), but the ahash
request context is frequently placed on the kernel stack by callers.
DMA mapping stack memory causes cacheline sharing corruption on non-coherent
architectures and immediately panics if DMA API debugging is enabled.

[ ... ]
> +static int cmh_cshake_export(struct ahash_request *req, void *out)
> +{
[ ... ]
> +	if (rctx->num_chunks > 0) {
> +		sgm =3D cmh_cshake_build_sg(rctx, GFP_KERNEL);
> +		if (!sgm)
> +			return -ENOMEM;
> +	}
> +
> +	save_buf =3D kzalloc(HC_CONTEXT_SIZE, GFP_KERNEL);
> +	if (!save_buf) {
[ ... ]
> +	ret =3D cmh_vcq_pack_and_submit(cmds, idx, rctx->packed, CMH_CSHAKE_MAX=
_PACKED,
> +				      d.mbx_idx);

[Severity: High]
Will this sequence sleep in atomic context?=20
The crypto_ahash_export() API must be non-blocking because it is called
from atomic contexts like IPsec softirq. Allocating memory with GFP_KERNEL
and performing a synchronous, blocking hardware submission will trigger a
bug or deadlock when called from these contexts.

[ ... ]
> +static int cmh_cshake_import(struct ahash_request *req, const void *in)
> +{
[ ... ]
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	rctx->num_chunks =3D 0;

[Severity: High]
Does this cause a memory leak when a request is imported?
Similar to cmh_cshake_init(), this resets the chunk list without freeing
the previously accumulated chunks.

> diff --git a/drivers/crypto/cmh/cmh_kmac.c b/drivers/crypto/cmh/cmh_kmac.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_kmac.c
> @@ -0,0 +1,630 @@
[ ... ]
> +struct cmh_kmac_chunk {
> +	struct list_head  list;
> +	struct list_head  tfm_node; /* per-tfm orphan tracking */
> +	u32               len;
> +	u8                data[];
> +};

[Severity: Medium]
Will this structure layout cause data corruption on cache-incoherent
architectures? Similar to the cSHAKE implementation, placing the flexible
array member at an unaligned offset and mapping it directly for DMA breaks
cacheline coherency.

[ ... ]
> +static int cmh_kmac_setkey(struct crypto_ahash *tfm, const u8 *key,
> +			   unsigned int keylen)
> +{
[ ... ]
> +		/* Store raw key */
> +		{
> +			int ret =3D cmh_key_setkey_raw(&tctx->key, ptr,
> +						     raw_keylen, CORE_ID_HC);
> +			if (ret)
> +				return ret;
> +		}

[Severity: High]
Could this lockless memory replacement race with an ongoing final() functio=
n?
The cmh_key_setkey_raw() function destroys the active key and unmaps its DMA
address. If this happens concurrently with hardware accessing the key memory
via DMA during a request, it could lead to a use-after-free and memory
corruption.

[ ... ]
> +static int cmh_kmac_init(struct ahash_request *req)
> +{
[ ... ]
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	rctx->num_chunks =3D 0;

[Severity: High]
Does this cause a memory leak when a request is re-initialized?
Like in the cSHAKE driver, the chunk list is reset without freeing the
previously accumulated chunks, leaking kernel memory.

[ ... ]
> +static int cmh_kmac_update(struct ahash_request *req)
> +{
[ ... ]
> +	chunk =3D kmalloc(sizeof(*chunk) + req->nbytes,
> +			req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +			GFP_KERNEL : GFP_ATOMIC);

[Severity: Critical]
Can the arithmetic operation here wrap around on 32-bit platforms?
Since req->nbytes is controlled by the caller, providing an extremely large
value could overflow the addition and allocate a tiny buffer. The subsequent
data copy would then overwrite kernel heap memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D6
