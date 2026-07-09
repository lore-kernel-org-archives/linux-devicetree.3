Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4ED3D3337
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630176; cv=none; b=FZeTQpxPOluCgG9dFbLyS8s5xR89o7+Gf0tm8LlGfPdNPLG38JUg6s1MhkPdSijNZiTpIMUXs7TMsSAj5VKJInhFgy4ZhQtYCqVr8MbPhaFJxnvDQqvYOPiu8vvwriZMuq2JI8OinjRgF+rLn830M7FfoRL9yF/PMXRl9aQ29UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630176; c=relaxed/simple;
	bh=ahFf06i3bUhTPtnOaSZdM7d5dq5f2qQ5vAesUd80niU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VeK/QWVI5/Y7Xi56ScmpzthObTXsj8q3ztEzr3mO5tcxLdx+JxfevpoMP+Vom3l4FFUwMW0eyf4c/oKkKxFsDUAUx/9XaGtUIKK8kJBMaIJnwFDphB7mgNSI/HIHro9aLS2hl3fnrWLutPQzsWQQWg+tWMWPSbqiZMmr8tRSaD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKjX9us+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKjX9us+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D111F000E9;
	Thu,  9 Jul 2026 20:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630174;
	bh=1n6LmBB3NhsX+jeP9MNl8/AuwQWxyWKVqT8Tdi/ykI0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MKjX9us+xS6b9g1XZKbTL7QRPIaHYHDSp6oJs/s625aovCoEDIOSher1rhHIGQGXQ
	 yeJclVhcMFvi1dP8aE5dsEASyQJzZs0wTPFjguO01SMQ8vqEzm4gIPoh6qJhgE4P/c
	 OYBy4X21iFjSe6MRoRu5nm0gVsfyeYmRoamlClo030SpYQ4W1UchzbZLTM0H+geNnW
	 C7iB9QcL72f+atfrMVOaDAou+pFRP43Vhbc8Wxny4p6JKQarO4bogNAyGgAe25dZOl
	 z+moUiGsMiXhxpGGCYQDkRnkOD6EODFZZv8aNKmkWeddIDmSq/XnLB5L9Hm4uwR+kV
	 D58W88EIkb0sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/19] crypto: cmh - add key provisioning and
 management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709203037.1884436-4-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-4-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:49:33 +0000
Message-Id: <20260709204934.51D111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] Unprotected cross-VCQ access to the shared per-mailbox `SYS_RE=
F_TEMP` datastore creates a race condition that can leak or corrupt raw cry=
ptographic keys.
- [High] Optional DMA pointers default to `DMA_MAPPING_ERROR` instead of `0=
`, causing the hardware to DMA from an invalid address.
- [High] The ECDH ioctl ignores the CMH_PKE_FLAG_DS_RESULT flag, causing an=
 unconditional out-of-bounds write to userspace memory.
- [High] Persistent hardware datastore slots for intermediate results are l=
eaked during normal execution of certain ioctls, leading to datastore exhau=
stion.
- [High] Applying `PKE_SWAP_FLAGS` to `SYS_CMD_NEW` scrambles the returned =
datastore reference handle, causing subsequent operations to fail.
- [High] ECDSA signatures are computed over the wrong hash value because th=
e digest is padded with trailing zeros instead of leading zeros.
- [High] Hardware datastore key slots become permanently orphaned if the fi=
nal `copy_to_user()` fails to deliver the reference to user space.
- [High] Unsynchronized hardware mailbox flush creates a denial of service =
(DoS) vector for concurrent crypto operations.
- [High] Premature exposure of the `/dev/cmh_mgmt` misc device before drive=
r initialization is complete leads to a NULL pointer dereference.
- [Medium] Valid DMA addresses mapped at `0` are leaked due to unsafe boole=
an evaluation.
- [Medium] Potential out-of-bounds kernel memory read in `cmh_mgmt_ds_expor=
t` if `req.len` is smaller than the wrapper header size.
- [Medium] Uninitialized kernel heap memory is potentially copied to user s=
pace in `cmh_mgmt_eac_read`.
--

--- Patch [3]: [PATCH v2 03/19] crypto: cmh - add key provisioning and mana=
gement ---
commit fdf4a06222c37879ad3a1f641550a83825a212f0
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add key provisioning and management

This commit adds the CMH key management subsystem, including key provisioni=
ng,
system object management, and a management ioctl interface (/dev/cmh_mgmt).
It exposes key lifecycle, KIC key derivation, PKE operations, PQC operation=
s,
and SM2 multi-step protocols.

> diff --git a/drivers/crypto/cmh/cmh_main.c b/drivers/crypto/cmh/cmh_main.c
> index de065a425a2cf..7673ed3e58618 100644
> --- a/drivers/crypto/cmh/cmh_main.c
> +++ b/drivers/crypto/cmh/cmh_main.c
> @@ -196,12 +197,19 @@ static int cmh_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_rh_init;
> =20
> +	/* Register key management device (/dev/cmh_mgmt) */
> +	ret =3D cmh_mgmt_register();
> +	if (ret)
> +		goto err_mgmt_register;
> +
>  	g_cmh_dev =3D dev;

[Severity: High]
Is it safe to register the misc device via cmh_mgmt_register() before setti=
ng
the global g_cmh_dev pointer? If userspace opens the device and executes an
ioctl immediately, could the ioctl handler's use of cmh_dev() trigger a NULL
pointer dereference?

> diff --git a/drivers/crypto/cmh/cmh_mgmt.c b/drivers/crypto/cmh/cmh_mgmt.c
> index 0000000000000..d228213f7850c 100644
> --- a/drivers/crypto/cmh/cmh_mgmt.c
> +++ b/drivers/crypto/cmh/cmh_mgmt.c
> @@ -89,6 +89,53 @@ static atomic_t mgmt_temp_dirty =3D ATOMIC_INIT(0);
> =20
>  /* -- KEY_NEW -------------------------- */
> =20
> +static int cmh_mgmt_key_new(void __user *argp)
> +{
[ ... ]
> +	req.ref =3D *ref_buf;
> +	kfree(ref_buf);
> +
> +	if (copy_to_user(argp, &req, sizeof(req)))
> +		return -EFAULT;

[Severity: High]
Does this code leak the newly allocated hardware datastore key if copy_to_u=
ser
fails? Should it issue a SYS_CMD_GRANT with 0 permissions to delete the obj=
ect
before returning -EFAULT?

> @@ -351,6 +351,59 @@ static int cmh_mgmt_ds_export(void __user *argp)
> +	dmabuf =3D kzalloc(req.len, GFP_KERNEL);
> +	if (!dmabuf)
> +		return -ENOMEM;
[ ... ]
> +	/* Parse actual blob size from the eSW-written header */
> +	{
> +		struct sys_wrap_hdr *hdr =3D (struct sys_wrap_hdr *)dmabuf;
> +		u64 actual;
> +
> +		if (check_add_overflow((u64)sizeof(*hdr), (u64)hdr->wrap,
> +				       &actual) ||

[Severity: Medium]
What happens if the user specifies a very small req.len, such as 4 bytes?
If the hardware unexpectedly returns success for a truncated buffer, could
casting dmabuf to struct sys_wrap_hdr * and reading its fields cause an
out-of-bounds read of kernel memory?

> @@ -493,6 +493,76 @@ static int cmh_mgmt_ds_import(void __user *argp)
> +static int cmh_mgmt_kic_hkdf1(void __user *argp)
> +{
[ ... ]
> +	if (temp) {
> +		/* Flush MBX to reset temp stack -- see KIC section comment */
> +		ret =3D cmh_tm_flush_mbx(MGMT_MBX);

[Severity: High]
Will unconditionally flushing MGMT_MBX abort any active commands concurrent=
ly
executing on that shared mailbox? Does this create a denial of service vect=
or
for other crypto operations?

> +		if (ret)
> +			goto out_unmap_label;
> +
> +		n_cmds =3D 3;
> +		vcq_set_header(&vcq[0], n_cmds);
> +		vcq_add_kic_hkdf1(&vcq[1], SYS_REF_TEMP, req.base_key,
> +				  label_dma, req.key_len, req.label_len,
> +				   SYS_TYPE_SET(0, CORE_ID_AES));
> +		vcq_add_sys_flush(&vcq[2]);
[ ... ]
> +	ret =3D cmh_tm_submit_sync_mbx(vcq, n_cmds, 1, MGMT_MBX);

[Severity: Critical]
Since the derived key is stored in SYS_REF_TEMP and the ioctl then returns =
to
userspace, what prevents a concurrent crypto request on the same MGMT_MBX f=
rom
overwriting this temporary slot before the key is later consumed? Could a
subsequent read inadvertently extract the raw key of the unrelated crypto
operation?

> @@ -608,6 +608,8 @@ out_unmap_label:
> +out_unmap_label:
> +	if (label_buf && !cmh_dma_map_error(label_dma) && label_dma)
> +		cmh_dma_unmap_single(label_dma, req.label_len, DMA_TO_DEVICE);

[Severity: Medium]
Does the && label_dma condition mistakenly treat a valid DMA mapping at add=
ress
0 as an error? Will this leak the mapping on architectures where 0 is a
legitimate bus address?

> @@ -1185,6 +1185,41 @@ static int cmh_mgmt_key_new_random(void __user *ar=
gp)
> +static long cmh_mgmt_eac_read(void __user *argp)
> +{
[ ... ]
> +	rsp =3D kmalloc_obj(*rsp, GFP_KERNEL);
> +	if (!rsp)
> +		return -ENOMEM;

[Severity: Medium]
Since rsp is allocated without zeroing its contents, what happens if the
hardware performs a partial DMA write? Could the trailing unwritten fields
such as sram_bank_errors retain old kernel heap data that gets leaked when
copied to userspace?

> @@ -1369,6 +1369,87 @@ static inline bool cmh_mgmt_needs_temp_flush(unsig=
ned int cmd)
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
Can this conditional flush of MGMT_MBX abort in-flight commands from concur=
rent
crypto operations? Should there be a lock to verify no concurrent operations
are executing before flushing the shared mailbox?

> diff --git a/drivers/crypto/cmh/cmh_mgmt_pke.c b/drivers/crypto/cmh/cmh_m=
gmt_pke.c
> index 0000000000000..6954832fa8ac5 100644
> --- a/drivers/crypto/cmh/cmh_mgmt_pke.c
> +++ b/drivers/crypto/cmh/cmh_mgmt_pke.c
> @@ -319,6 +319,160 @@ int cmh_mgmt_pke_rsa_keygen(void __user *argp)
> +{
[ ... ]
> +		/* Sync DMA so we can read back the opaque refs */
> +		cmh_dma_unmap_single(d_ref_dma, sizeof(u64), DMA_FROM_DEVICE);
> +		cmh_dma_unmap_single(crt_ref_dma, sizeof(u64),
> +				     DMA_FROM_DEVICE);
> +		d_ref_dma =3D 0;
> +		crt_ref_dma =3D 0;
[ ... ]
> +out_unmap:
> +	if (crt_ref_dma && !cmh_dma_map_error(crt_ref_dma))
> +		cmh_dma_unmap_single(crt_ref_dma, sizeof(u64),
> +				     DMA_FROM_DEVICE);

[Severity: Medium]
Does this code use 0 as a sentinel for an unmapped address? If the DMA API
returns 0 as a valid mapped address, will this condition skip the unmap step
and leak the mapping?

[ ... ]
> +	if (!ret) {
> +		/* Copy generated modulus and refs back */
> +		if (copy_to_user(u64_to_user_ptr(req.n), n_buf, n_len)) {
> +			ret =3D -EFAULT;
> +			goto out_free;
> +		}

[Severity: High]
If copy_to_user fails here, does this skip cleaning up the d_ref and crt_ref
datastore objects? Will these hardware key slots become permanently orphaned
since the user never receives the references to free them?

> @@ -513,6 +513,66 @@ int cmh_mgmt_pke_ecdsa_sign(void __user *argp)
> +{
[ ... ]
> +	dig_map_len =3D max_t(u32, req.digest_len, clen);
> +
> +	dig_buf =3D kzalloc(dig_map_len, GFP_KERNEL);
> +	sig_buf =3D kzalloc(sig_len, GFP_KERNEL);
[ ... ]
> +	if (copy_from_user(dig_buf, u64_to_user_ptr(req.digest),
> +			   req.digest_len)) {

[Severity: High]
If the provided req.digest_len is smaller than the curve length clen, does
copying the digest to the start of dig_buf incorrectly pad it with trailing
zeros? Since the buffer is interpreted as a big-endian integer, will this a=
ct
as a mathematical left-shift and cause the signature to be computed over the
wrong hash value?

> @@ -594,6 +594,76 @@ int cmh_mgmt_pke_ecdh(void __user *argp)
> +{
[ ... ]
> +	vcq_add_sys_new(&vcq[idx++], 0, ref_dma, clen);
> +	vcq_add_pke_ecdh(&vcq[idx++], pke_cid, req.curve, clen, clen,
> +			 ss_type, peer_dma, req.key_ref,
> +			 SYS_REF_LAST, swap);
[ ... ]
> +	ret =3D cmh_tm_submit_sync_mbx(vcq, 4, 1, MGMT_MBX);
> +	if (ret)
> +		goto out_unmap;
> +
> +	/* Sync bounce buffer so CPU sees the DMA-written ref */
> +	cmh_dma_sync_for_cpu(ref_dma, sizeof(u64), DMA_FROM_DEVICE);
> +
> +	/* Phase 2: extract shared secret from DS via actual ref */
> +	vcq_set_header(&vcq[0], 3);
> +	vcq_add_sys_data(&vcq[1], *ref_buf, ss_dma, clen);
[ ... ]
> +	ret =3D cmh_tm_submit_sync_mbx(vcq, 3, 1, MGMT_MBX);

[Severity: High]
Does this code leak the persistent datastore slot for the shared secret? Af=
ter
the result is extracted to memory, it appears the slot is never deleted via=
 a
SYS_CMD_GRANT with 0 permissions.

[ ... ]
> +	if (!ret) {
> +		if (copy_to_user(u64_to_user_ptr(req.output), ss_buf, clen))
> +			ret =3D -EFAULT;
> +	}

[Severity: High]
Is the CMH_PKE_FLAG_DS_RESULT flag in req.flags being ignored here? By
unconditionally executing Phase 2 and copying clen bytes to req.output, will
this cause an out-of-bounds write to userspace memory if the caller expected
only an 8-byte reference?

> diff --git a/drivers/crypto/cmh/cmh_mgmt_pqc.c b/drivers/crypto/cmh/cmh_m=
gmt_pqc.c
> index 0000000000000..db479e80326bc 100644
> --- a/drivers/crypto/cmh/cmh_mgmt_pqc.c
> +++ b/drivers/crypto/cmh/cmh_mgmt_pqc.c
> @@ -356,6 +356,117 @@ int cmh_mgmt_ml_kem_dec(void __user *argp)
> +{
[ ... ]
> +		ret =3D cmh_tm_submit_sync_mbx(vcq, QSE_VCQ_CMDS_MIN,
> +					     1, MGMT_MBX);
> +		if (ret)
> +			goto out_unmap;
> +
> +		/* Phase 2: extract ss from SYS_REF_TEMP */
> +		vcq_set_header(&vcq[0], QSE_VCQ_CMDS_MIN);
> +		vcq_add_sys_data(&vcq[1], SYS_REF_TEMP, ss_dma,
> +				 ss_out_len);
> +		vcq_add_sys_flush(&vcq[2]);
> +
> +		ret =3D cmh_tm_submit_sync_mbx(vcq, QSE_VCQ_CMDS_MIN,
> +					     1, MGMT_MBX);

[Severity: Critical]
Because Phase 1 writes to SYS_REF_TEMP and Phase 2 reads from it using
entirely separate submissions, what prevents a concurrent crypto request on
MGMT_MBX from overwriting the temporary slot in between these phases? Does
this lack of synchronization risk leaking raw keys to userspace?

> @@ -844,6 +844,115 @@ int cmh_mgmt_slhdsa_keygen(void __user *argp)
> +{
[ ... ]
> +	} else {
> +		vcq_cnt =3D HCQ_VCQ_CMDS_MAX; /* hdr+new+write+keygen+read+flush */
> +		vcq_set_header(&vcq[idx++], vcq_cnt);
> +		vcq_add_sys_new(&vcq[idx++], SYS_CID_NONE, ref_dma,
> +				sk_sz);
> +	}
[ ... ]
> +	if (!ds_ref)
> +		vcq_add_sys_read(&vcq[idx++], SYS_REF_LAST, sk_dma,
> +				 0, sk_sz + SYS_WRAP_HDR_SIZE);

[Severity: High]
When ds_ref is false, a persistent slot is created to hold the generated ke=
y,
but does it ever get deleted after the key is read back to memory? This see=
ms
to leak the datastore slot.

> @@ -1005,6 +1005,108 @@ int cmh_mgmt_slhdsa_sign(void __user *argp)
> +{
[ ... ]
> +	dma_addr_t sig_dma, rnd_dma =3D DMA_MAPPING_ERROR;
[ ... ]
> +	if (req.add_random) {
> +		rnd_buf =3D kmalloc(n_val, GFP_KERNEL);
[ ... ]
> +	if (rnd_buf) {
> +		rnd_dma =3D cmh_dma_map_single(rnd_buf, n_val, DMA_TO_DEVICE);
[ ... ]
> +	vcq_add_hcq_slhdsa_sign(&vcq[1], hcq_cid, req.parameter_set,
> +				req.msg_len, req.ctx_len,
> +				rnd_dma, msg_dma, ctx_dma,
> +				req.sk, sig_dma);

[Severity: High]
If req.add_random is omitted, rnd_dma remains DMA_MAPPING_ERROR. When this
is passed directly into the hardware VCQ structure, won't the hardware atte=
mpt
a DMA read from an invalid physical address and trigger bus errors?

> diff --git a/drivers/crypto/cmh/cmh_pke_sm2.c b/drivers/crypto/cmh/cmh_pk=
e_sm2.c
> index 0000000000000..9a6e30c7f5e59 100644
> --- a/drivers/crypto/cmh/cmh_pke_sm2.c
> +++ b/drivers/crypto/cmh/cmh_pke_sm2.c
> @@ -156,6 +156,128 @@ int cmh_mgmt_sm2_ecdh(void __user *argp)
> +{
[ ... ]
> +	/* Phase 1: sys_new(shared_point_ref) + SM2_ECDH(->SYS_REF_LAST) */
> +	idx =3D 0;
> +	vcq_set_header(&vcq[idx++], 4);
> +	vcq_add_sys_new(&vcq[idx], 0, ref_dma, SM2_POINT_LEN);
> +	vcq[idx++].id |=3D PKE_SWAP_FLAGS;

[Severity: High]
Does applying PKE_SWAP_FLAGS to the SYS_CMD_NEW command ID scramble the 64-=
bit
reference handle returned by the hardware? Will this cause subsequent
operations attempting to use this reference to fail with an ENOENT error?

> @@ -563,6 +563,80 @@ int cmh_mgmt_sm2_ecdh_hash(void __user *argp)
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
Similarly here, does applying PKE_SWAP_FLAGS to SYS_CMD_NEW corrupt the
datastore reference handle?

[ ... ]
> +	/* Phase 2: read shared key from DS -> DMA */
> +	vcq_set_header(&vcq[0], 3);
> +	vcq_add_sys_data(&vcq[1], *ref_buf, sk_dma, SM2_SHARED_KEY_LEN);
> +	vcq_add_sys_flush(&vcq[2]);

[Severity: High]
Is the persistent object orphaned and leaked here after extracting its data?
Should it be deleted with SYS_CMD_GRANT using 0 permissions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D3
