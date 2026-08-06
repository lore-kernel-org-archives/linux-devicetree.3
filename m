Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB273DA5BB
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047474; cv=none; b=kdZdKym1fkDupHQorWdtuZ16Hlhr9yoC1rT9cQ0JsbXmIQaO8uCOfNMY8aJ6BI/KQ6WApMS98heLrbBZVAvbzZftIp3azUqlY2fVBxE9L+207DlqwzFObiuEsD/L+mOFIkJt0P1loMa+t6d1eNijN6bSaWsLvmXOna7mRSQhuvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047474; c=relaxed/simple;
	bh=TZilUf9DTg69T0G52FZIUulI6oYKimeI59iUCS0PpyA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SINFQvGvvuOWaeqa6+5Qpc7mlgP0aXCrWXoyVcScH7PUGHa1fLp0XzRAhny79KQi4HN5v0v4FYYrde3itC2n8rG6xpTHWm9oqIeIoWAYl9eGQL1KRnYE1i9cQQV5+Zxf7MU0hD5o/m8xOlVlXWjRbTWUOL7kkOInFar8cU5fnw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHxM0lz8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHxM0lz8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE681F000E9;
	Thu,  6 Aug 2026 20:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047472;
	bh=7HKkxmMTjXkOH28lZcf61SOx0BuUPO8t/WiCGuOdDM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CHxM0lz8u6ZAbTrKK4IFrhm46z1WADCEch5Rfz0RXC7XzyeRS1qJ+URl0EP2Dede/
	 GjX5BwIr0US6dXAt3xg2rpQFQCi+o9y44aOXNbgSRdSY4XDmn7O21As7JnhNWaHuzA
	 i5PzIlNKDCxXXDDp1k145G4TiJoMuu+i+26YIs1JRPRYVodnwt7mzrCc/9kmH//Vcy
	 yY+Z+i1+1Cck3Y3bUV+cjZmyJ1rSu/+zY/SX60yKIGlq08MPzr6jwhfUcjBAm12USC
	 WDGaw1v6oTukGN5md78ifEIxcVoaAmEXCDJ1E/GM8Ll+yllQTwPgvsnzPPKGa2t+Wc
	 iH6GcaJadAMPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/19] crypto: cmh - add key provisioning and
 management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806195519.2703224-4-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-4-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:17:51 +0000
Message-Id: <20260806201752.4DE681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] cmh_mgmt_pke_ecdh() unconditionally writes raw shared secret bytes=
 to user memory, ignoring the CMH_PKE_FLAG_DS_RESULT flag.
- [High] Persistent datastore slots leak in success and error paths, perman=
ently exhausting hardware datastore memory.
- [High] Optional pointer validation fails to reject NULL pointers when par=
ameters are logically required, passing DMA_MAPPING_ERROR to hardware.
- [High] Shared mailbox and temp storage lack concurrency control, causing =
state corruption and cross-process data leaks.
- [High] PKE_SWAP_FLAGS incorrectly applied to SYS_CMD_NEW, corrupting SM2 =
datastore reference handles.
- [High] RSA ioctls calculate modulus lengths using unrounded division, cau=
sing out-of-bounds DMA writes.
- [High] Uninitialized DMA address sig_dma is passed to cmh_dma_unmap_singl=
e in the error path.
- [High] The KEY_NEW and KEY_NEW_RANDOM ioctls fail to enforce an upper bou=
nd on req.len.
- [Medium] Spurious DMA unmap of address 0 in error paths.
- [Medium] Truthiness check on DMA addresses in cmh_mgmt_pke_rsa_keygen sil=
ently leaks mappings on platforms where 0 is a valid DMA address.
--

--- Patch [3]: [PATCH v3 03/19] crypto: cmh - add key provisioning and mana=
gement ---
commit c64d67a4fd95b3ad0341d78dbf7993f36b367306
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add key provisioning and management

This commit adds the CMH key management subsystem. It introduces key
provisioning, derivation, and various PKE/PQC operations via a management
ioctl interface (/dev/cmh_mgmt). It also includes the SM2 ioctl handlers.

> diff --git a/drivers/crypto/cmh/cmh_mgmt.c b/drivers/crypto/cmh/cmh_mgmt.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_mgmt.c
[ ... ]
> +static int cmh_mgmt_key_new(void __user *argp)
> +{
> +	struct cmh_ioctl_key_new req;
> +	struct vcq_cmd vcq[MGMT_VCQ_CMDS];
> +	u64 *ref_buf;
> +	dma_addr_t ref_dma;
> +	int ret;
> +
> +	if (copy_from_user(&req, argp, sizeof(req)))
> +		return -EFAULT;
> +
> +	if (req.version !=3D CMH_MGMT_V1)
> +		return -EINVAL;
> +	if (!req.len)
> +		return -EINVAL;

[Severity: High]
Could this code overflow when passing an unbounded length to the firmware?

If a user specifies a very large req.len (e.g., 0xFFFFFFFF) for
CMH_IOCTL_KEY_NEW or CMH_IOCTL_KEY_NEW_RANDOM, it is passed directly
to the CMH eSW.=20

If the firmware adds object header sizes to this, it may integer overflow,
resulting in a tiny allocation followed by out-of-bounds writes into datast=
ore
memory. Should we add a check like req.len > CMH_MGMT_MAX_DATA_LEN here?

[ ... ]
> +static long cmh_mgmt_ioctl(struct file *file, unsigned int cmd,
> +			   unsigned long arg)
> +{
> +	void __user *argp =3D (void __user *)arg;
> +	int ret;
> +
> +	if (cmh_mgmt_needs_temp_flush(cmd) &&
> +	    atomic_xchg(&mgmt_temp_dirty, 0)) {
> +		ret =3D cmh_tm_flush_mbx(MGMT_MBX);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Does this shared mailbox and temp storage logic allow concurrent processes
to corrupt the SYS_REF_TEMP state?

If cmh_tm_flush_mbx() fails with -EBUSY, the mgmt_temp_dirty flag is
already cleared. Subsequent ioctls will then fail to flush the temp
storage, potentially exhausting memory.

Also, since multiple processes can call this ioctl concurrently on the
same mailbox, can one process's temp key be wiped out or overwritten
by another process's key before it gets exported?

> diff --git a/drivers/crypto/cmh/cmh_mgmt_pke.c b/drivers/crypto/cmh/cmh_m=
gmt_pke.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_mgmt_pke.c
[ ... ]
> +int cmh_mgmt_pke_rsa_enc(void __user *argp)
> +{
> +	u32 pke_cid =3D cmh_core_default_id(CMH_CORE_PKE);
> +
> +	struct cmh_ioctl_pke_rsa_enc req;
> +	struct vcq_cmd vcq[PKE_VCQ_CMDS_MIN];
> +	u32 n_len, e_padded;
> +	u8 *e_buf, *n_buf, *m_buf, *c_buf;
> +	dma_addr_t e_dma, n_dma, m_dma, c_dma;
> +	int ret;
> +
> +	if (copy_from_user(&req, argp, sizeof(req)))
> +		return -EFAULT;
> +	if (req.version !=3D CMH_MGMT_V1)
> +		return -EINVAL;
> +	if (req.__reserved)
> +		return -EINVAL;
> +	if (req.bits < PKE_RSA_MIN_BITS || req.bits > PKE_RSA_MAX_BITS)
> +		return -EINVAL;
> +	if (!req.e_len || req.e_len > PKE_MAX_OPERAND)
> +		return -EINVAL;
> +
> +	n_len =3D req.bits / 8;

[Severity: High]
Can this modulus length calculation result in an undersized DMA buffer?

If a user specifies an unaligned bit length like req.bits =3D 1025,
n_len becomes 128 bytes. However, the hardware will perform a 1025-bit
RSA operation and write 129 bytes to the mapped buffer c_buf, overflowing
it and corrupting adjacent slab memory.

[ ... ]
> +int cmh_mgmt_pke_rsa_keygen(void __user *argp)
> +{
[ ... ]
> +out_unmap:
> +	if (crt_ref_dma && !cmh_dma_map_error(crt_ref_dma))
> +		cmh_dma_unmap_single(crt_ref_dma, sizeof(u64),
> +				     DMA_FROM_DEVICE);
> +	if (d_ref_dma && !cmh_dma_map_error(d_ref_dma))
> +		cmh_dma_unmap_single(d_ref_dma, sizeof(u64), DMA_FROM_DEVICE);

[Severity: High]
Are we missing cleanup for the persistent datastore slots in this error pat=
h?

If Phase 2 of the key generation fails (for example, due to a timeout from
cmh_tm_submit_sync_tmo), the code jumps directly to out_unmap. The slots
that were allocated in Phase 1 via SYS_CMD_NEW will remain orphaned in
the datastore, leading to permanent hardware memory exhaustion.

[Severity: Medium]
Could the truthiness check on d_ref_dma and crt_ref_dma leak mappings
on architectures where physical address 0 is valid?

If cmh_dma_map_single returns 0, the check evaluates to false, causing
the driver to skip unmapping the address.

[ ... ]
> +int cmh_mgmt_pke_ecdh(void __user *argp)
> +{
[ ... ]
> +	/* Phase 2: extract shared secret from DS via actual ref */
> +	vcq_set_header(&vcq[0], 3);
> +	vcq_add_sys_data(&vcq[1], *ref_buf, ss_dma, clen);
> +	vcq[1].id |=3D pke_swap_flags(req.curve);
> +	vcq_add_sys_flush(&vcq[2]);
> +
> +	ret =3D cmh_tm_submit_sync_mbx(vcq, 3, 1, MGMT_MBX);

[Severity: High]
Does this leave the datastore slot orphaned after reading the shared secret?

The slot is allocated using SYS_CMD_NEW in Phase 1, but after reading
the data back with SYS_CMD_DATA, there is no SYS_CMD_GRANT with 0
permissions to delete it. This permanently leaks hardware datastore memory.

[ ... ]
> +	if (!ret) {
> +		if (copy_to_user(u64_to_user_ptr(req.output), ss_buf, clen))
> +			ret =3D -EFAULT;
> +	}

[Severity: High]
Can this unconditional copy corrupt userspace memory?

If the user calls CMH_IOCTL_PKE_ECDH with the CMH_PKE_FLAG_DS_RESULT flag
set, they expect a 64-bit datastore reference in req.output. Since the
driver ignores this flag entirely, it fetches the raw shared secret and
unconditionally copies clen bytes (e.g., 32 bytes for P-256) into
req.output, overflowing the expected 8-byte variable.

[ ... ]
> +int cmh_mgmt_pke_eddsa_keygen_sca(void __user *argp)
> +{
[ ... ]
> +	if (!ret) {
> +		req.sca_ref =3D *ref_buf;
> +		if (copy_to_user(argp, &req, sizeof(req)))
> +			ret =3D -EFAULT;
> +	}

[Severity: High]
Will the datastore slot leak if copy_to_user fails here?

Other functions contain a SYS_CMD_GRANT cleanup block if the copy to
user space fails. Here, it simply returns -EFAULT, leaving the persistent
slot orphaned in hardware memory.

> diff --git a/drivers/crypto/cmh/cmh_mgmt_pqc.c b/drivers/crypto/cmh/cmh_m=
gmt_pqc.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_mgmt_pqc.c
[ ... ]
> +int cmh_mgmt_ml_kem_enc(void __user *argp)
> +{
[ ... ]
> +	if (!hw_rng && req.coin) {
> +		u32 coin_len =3D masked ? QSE_SEED_LEN_MASKED : QSE_SEED_LEN;
> +
> +		coin_buf =3D kmalloc(coin_len, GFP_KERNEL);

[Severity: High]
Will this optional pointer validation pass a DMA_MAPPING_ERROR to the
hardware?

If hw_rng is false but req.coin is 0, the mapping block is completely
skipped. However, coin_dma was initialized to DMA_MAPPING_ERROR and will
be passed to vcq_add_qse_ml_kem_enc. The hardware will then attempt a wild
DMA read from the error value.

[ ... ]
> +int cmh_mgmt_ml_dsa_sign(void __user *argp)
> +{
[ ... ]
> +	dma_addr_t m_dma =3D DMA_MAPPING_ERROR, sig_dma;
> +	dma_addr_t sk_dma =3D DMA_MAPPING_ERROR;
> +	/*
> +	 * 0 =3D "no added randomness": the eSW treats a zero rnd pointer as
> +	 * absent.  A garbage DMA_MAPPING_ERROR would be taken as a real
> +	 * address and DMA'd from.
> +	 */
> +	dma_addr_t rnd_dma =3D 0;
[ ... ]
> +out_unmap:
> +	if (rnd_buf && !cmh_dma_map_error(rnd_dma))
> +		cmh_dma_unmap_single(rnd_dma, rnd_len, DMA_TO_DEVICE);

[Severity: Medium]
Might this code spuriously unmap address 0 on error paths?

Because rnd_dma is initialized to 0, if mapping fails later and the code
jumps to out_unmap, cmh_dma_map_error(0) will evaluate to false. The driver
will then call cmh_dma_unmap_single on address 0.

[ ... ]
> +	if (sk_buf && !cmh_dma_map_error(sk_dma))
> +		cmh_dma_unmap_single(sk_dma, ml_dsa_sk_size[mi],
> +				     DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(sig_dma))
> +		cmh_dma_unmap_single(sig_dma, sig_size, DMA_FROM_DEVICE);

[Severity: High]
Can the out_unmap error path pass an uninitialized DMA address to
cmh_dma_unmap_single?

The variable sig_dma is declared uninitialized. If m_dma fails to map
and jumps to out_unmap early, the error path evaluates
!cmh_dma_map_error(sig_dma). Because the uninitialized stack value is
highly unlikely to perfectly match DMA_MAPPING_ERROR, it will attempt
to unmap a random address, which could cause an IOMMU fault or kernel panic.

[ ... ]
> +int cmh_mgmt_slhdsa_keygen(void __user *argp)
> +{
[ ... ]
> +	if (!ds_ref)
> +		vcq_add_sys_read(&vcq[idx++], SYS_REF_LAST, sk_dma,
> +				 0, sk_sz + SYS_WRAP_HDR_SIZE);
> +	vcq_add_hcq_flush(&vcq[idx++], hcq_cid);
> +
> +	ret =3D cmh_tm_submit_sync_tmo(vcq, vcq_cnt, 1, MGMT_MBX,
> +				     cmh_tm_slow_op_timeout_jiffies());

[Severity: High]
Does reading the newly created persistent slot without deleting it cause
a hardware memory leak?

The VCQ allocates a slot with SYS_CMD_NEW and reads it back using
vcq_add_sys_read. However, there is no command to delete it (e.g., via
SYS_CMD_GRANT with 0 permissions) after the read completes.

[ ... ]
> +int cmh_mgmt_slhdsa_sign(void __user *argp)
> +{
[ ... ]
> +	if (req.ctx_len > 0 && req.ctx) {
> +		ctx_buf =3D kmalloc(req.ctx_len, GFP_KERNEL);
> +		if (!ctx_buf) {
> +			ret =3D -ENOMEM;
> +			goto out_free;
> +		}
> +		if (copy_from_user(ctx_buf, u64_to_user_ptr(req.ctx),
> +				   req.ctx_len)) {
> +			ret =3D -EFAULT;
> +			goto out_free;
> +		}
> +	}

[Severity: High]
Would this optional pointer validation pass a DMA_MAPPING_ERROR to the
hardware?

If a user calls this ioctl with req.ctx_len > 0 but req.ctx =3D 0, this blo=
ck
is skipped. The variable ctx_dma is left as DMA_MAPPING_ERROR (~0ULL),
and the driver populates the VCQ command with a non-zero ctx_len and
the ~0ULL DMA address, causing the hardware to attempt a wild DMA read.

> diff --git a/drivers/crypto/cmh/cmh_pke_sm2.c b/drivers/crypto/cmh/cmh_pk=
e_sm2.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pke_sm2.c
[ ... ]
> +int cmh_mgmt_sm2_ecdh(void __user *argp)
> +{
[ ... ]
> +	/* Phase 1: sys_new(shared_point_ref) + SM2_ECDH(->SYS_REF_LAST) */
> +	idx =3D 0;
> +	vcq_set_header(&vcq[idx++], 4);
> +	vcq_add_sys_new(&vcq[idx], 0, ref_dma, SM2_POINT_LEN);
> +	vcq[idx++].id |=3D PKE_SWAP_FLAGS;

[Severity: High]
Does applying PKE_SWAP_FLAGS to SYS_CMD_NEW corrupt the returned datastore
reference?

The hardware will byte-swap the 64-bit reference ID when DMA-writing it
back to memory. In Phase 2, the driver will read this garbled reference
and pass it to SYS_CMD_DATA, which will fail to find the object.

[ ... ]
> +	if (!keep_ds) {
> +		/* Sync bounce buffer so CPU sees the DMA-written ref */
> +		cmh_dma_sync_for_cpu(ref_dma, sizeof(u64), DMA_FROM_DEVICE);
> +
> +		/* Phase 2: read shared point from DS -> DMA, consuming the slot */
> +		vcq_set_header(&vcq[0], 3);
> +		vcq_add_sys_data(&vcq[1], *ref_buf, sp_dma, SM2_POINT_LEN);
> +		vcq[1].id |=3D PKE_SWAP_FLAGS;
> +		vcq_add_sys_flush(&vcq[2]);
> +
> +		ret =3D cmh_tm_submit_sync_mbx(vcq, 3, 1, MGMT_MBX);
> +	}

[Severity: High]
Are we leaving the datastore slot orphaned when !keep_ds is true?

The code reads the shared point from the datastore using SYS_CMD_DATA
but does not issue a command to delete the allocated slot, leading to a
permanent memory leak in the hardware datastore.

[ ... ]
> +int cmh_mgmt_sm2_ecdh_hash(void __user *argp)
> +{
[ ... ]
> +	/*
> +	 * Phase 1: sys_new(shared_key_ref) + SM2_ECDH_HASH
> +	 * The shared_point_ref from the ECDH step is passed directly
> +	 * as a DS reference -- the eSW hub reads it from DS.
> +	 */
> +	vcq_set_header(&vcq[0], 4);
> +	vcq_add_sys_new(&vcq[1], 0, ref_dma, SM2_SHARED_KEY_LEN);
> +	vcq[1].id |=3D PKE_SWAP_FLAGS;

[Severity: High]
Will PKE_SWAP_FLAGS applied to SYS_CMD_NEW here similarly garble the
reference ID?

Similar to cmh_mgmt_sm2_ecdh, the hardware will byte-swap the 64-bit
reference ID when it is written back, causing subsequent lookups to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D3
