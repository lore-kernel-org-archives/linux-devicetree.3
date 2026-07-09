Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F89B399350
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630026; cv=none; b=EuMLS/7qecVoyQfOfuf3OxVqmfKVgx4rvOj4vnFtYZKIyEPAHbD3bVFKevjkVDreXc71MRijvi03TCKI4bpwox1oxtxNvGeZlejlvBia5c72zA9FFBXrnXLL7SNU2UcLvzudUHSKbV61KTeECJQbBK850eVrhFkPl+pecpaV7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630026; c=relaxed/simple;
	bh=alPH4/mnAtyhHzufFFDrmwhmow3dhNhtBb+jpFc+KSs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PhcqeTq+nao70oxCUm7dMrSXgyIlUmJZDYTJLvwxEmJeG80o/NVdHv/Pmusyl+w21qfHRKz0rRLDfL7CV2CYJkKGs+Hqf5sUwyVqeKM5SU9jw7eYKbatd8wc0ojg483OgP9Fme2zcIybJgyQGjViKnO5SCEpa3woKm6rsy4IMBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcDMBaRq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcDMBaRq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0771F000E9;
	Thu,  9 Jul 2026 20:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630025;
	bh=E9uu5cme0gouU9MxPZEIUCsdwx9/6IsdE/4M5lN5aVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KcDMBaRqwXGyN6To927UVN0A0DwrPSsk4V/IqysqDyfsdbdoDdNkc6p/bK+oxM4HI
	 5n1UaV+NbfoCYuAzHHHwvC+cgQWzKEHnxYlzDsl7lX44+4lQ55JZrekDbfSWjalq8h
	 Nz/fwaHrEq+bTmC3wbrdwmA45p81aDS30H3I8S6Of/o8UxS88i5GHc9tLm1yNUmgRH
	 O9TC4yDNH87fi7GCqn75ozLE4k+usu1O2GpQH7PqwkQO+MhRLcpzjd5hggxjDvCcEt
	 LnBBN4ksaVZ9nMTi3hfLV2L+iY/3tXwc3ezAJmoyO0BXxZam0IU9mzMffuUeF4a3L2
	 2dLG649i2sJgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/19] crypto: cmh - add SM3 ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709203037.1884436-8-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-8-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:47:04 +0000
Message-Id: <20260709204704.BC0771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Linearizing arbitrarily large ahash input buffers via kmalloc rest=
ricts request sizes and risks deterministic allocation failures.
- [High] DMA mapping an inline array (rctx->checkpoint) potentially on the =
stack violates the DMA API, causing cacheline sharing and vmap stack corrup=
tion.
- [High] An integer overflow when calculating total available data leads to=
 a massive heap buffer overflow.
- [Medium] cmh_sm3_export leaks uninitialized memory into the exported stat=
e buffer.
- [Medium] Missing endianness conversions when populating hardware command =
descriptors.
--

--- Patch [7]: [PATCH v2 07/19] crypto: cmh - add SM3 ahash ---
commit 28c61ed61efa5f206b21de41a5196e656d04ad75
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SM3 ahash

Register the SM3 ahash algorithm using the CMH SM3 core (core ID
0x05).  Supports incremental update/finup/final and export/import.

> diff --git a/drivers/crypto/cmh/cmh_sm3.c b/drivers/crypto/cmh/cmh_sm3.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_sm3.c
> @@ -0,0 +1,651 @@
[ ... ]
> +struct cmh_sm3_reqctx {
> +	int    error;
> +	u32    hw_started;
> +	u32    buf_len;
> +	u32    has_checkpoint;
> +	u8     checkpoint[SM3_CONTEXT_SIZE]; /* SM3 context from last SAVE */

[Severity: High]
Can this structure be allocated on the stack?

The crypto framework often allocates ahash request contexts on the stack
using AHASH_REQUEST_ON_STACK. If CONFIG_VMAP_STACK is enabled, mapping this
inline checkpoint array for DMA via cmh_dma_map_single() will pass a
vmalloc address, which yields an invalid physical address.

Additionally, since the checkpoint array isn't cacheline aligned, could
DMA operations corrupt adjacent fields in the context on non-coherent
architectures?

> +	/* DMA state for current async operation */
> +	dma_addr_t ckpt_dma;
> +	dma_addr_t save_dma;
[ ... ]
> +static void vcq_add_sm3_update(struct vcq_cmd *slot, u32 core_id, u64 in=
put_phys, u32 len)
> +{
> +	memset(slot, 0, sizeof(*slot));
> +	slot->magic =3D VCQ_CMD_MAGIC;
> +	slot->id =3D VCQ_CMD_ID(core_id, 0, 1, SM3_CMD_UPDATE);
> +	slot->hwc.sm3.cmd_update.input =3D input_phys;
> +	slot->hwc.sm3.cmd_update.inlen =3D len;
> +}

[Severity: Medium]
Does the hardware expect a specific endianness for these command descriptor=
s?

The CPU-native values are assigned directly to the hardware command structu=
re.
If this driver is built on a Big-Endian architecture and the hardware expec=
ts
Little-Endian (which is typical for PCIe/SoCs), will these values be
interpreted correctly without explicit conversions like cpu_to_le64()?

[ ... ]
> +static int cmh_sm3_update(struct ahash_request *req)
> +{
> +	struct cmh_sm3_reqctx *rctx =3D ahash_request_ctx(req);
> +	struct vcq_cmd cmds[CMH_SM3_MAX_PAYLOAD];
> +	struct core_dispatch d;
> +	u32 total_avail, full_len, tail_len, from_src;
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
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	total_avail =3D rctx->buf_len + req->nbytes;
> +
> +	if (total_avail < CMH_SM3_BLOCK_SIZE) {

[Severity: High]
Could this arithmetic wrap around if a caller provides a very large request?

If req->nbytes is close to U32_MAX, total_avail can overflow and become
less than CMH_SM3_BLOCK_SIZE. The code would then bypass the block size
check and execute:

    scatterwalk_map_and_copy(rctx->buf + rctx->buf_len,
                             req->src, 0,
                             req->nbytes, 0);

Would this attempt to copy gigabytes of data into the 64-byte rctx->buf,
causing a massive buffer overflow?

> +		if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
> +			memcpy(rctx->buf + rctx->buf_len,
> +			       req->svirt, req->nbytes);
> +		else
> +			scatterwalk_map_and_copy(rctx->buf + rctx->buf_len,
> +						 req->src, 0,
> +						 req->nbytes, 0);
> +		rctx->buf_len =3D total_avail;
> +		return 0;
> +	}
> +
> +	full_len =3D total_avail - total_avail % CMH_SM3_BLOCK_SIZE;
> +	tail_len =3D total_avail - full_len;
> +	from_src =3D full_len - rctx->buf_len;
> +
> +	rctx->data_buf =3D kmalloc(full_len, gfp);

[Severity: High]
Is it safe to assume the input data will always fit in a contiguous kmalloc
allocation?

The ahash API contract requires drivers to handle arbitrarily large inputs
(e.g., multi-megabyte requests from IPsec or dm-verity). Bouncing the
entire scatterlist into a single contiguous buffer via kmalloc() will fail
deterministically for sizes exceeding KMALLOC_MAX_SIZE, or earlier due to
memory fragmentation.

Should the driver process the scatterlist in bounded chunks instead of
attempting to linearize it entirely?

[ ... ]
> +static int cmh_sm3_export(struct ahash_request *req, void *out)
> +{
> +	struct cmh_sm3_reqctx *rctx =3D ahash_request_ctx(req);
> +	struct cmh_sm3_export_state *state =3D out;
> +
> +	if (rctx->hw_started && rctx->has_checkpoint)
> +		memcpy(state->checkpoint, rctx->checkpoint, SM3_CONTEXT_SIZE);
> +	else
> +		memset(state->checkpoint, 0, SM3_CONTEXT_SIZE);
> +
> +	if (rctx->buf_len > 0)
> +		memcpy(state->buf, rctx->buf, rctx->buf_len);

[Severity: Medium]
Does this leave the remainder of the export buffer uninitialized?

If rctx->buf_len is less than CMH_SM3_BLOCK_SIZE, the trailing bytes in
state->buf are never initialized. Since the state buffer is provided by the
caller (e.g., via crypto_ahash_export) and could be an uninitialized socket
allocation from AF_ALG, could this leak kernel memory if the state is later
exposed to userspace?

> +
> +	state->buf_len =3D rctx->buf_len;
> +	state->hw_started =3D rctx->hw_started;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D7
