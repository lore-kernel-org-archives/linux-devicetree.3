Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E81A23ED6A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871073; cv=none; b=n2/jaEg+8zvI5PxLS3rzhrDx9ySJqCoADVivbM5CPYVOqFtPzty89wm0qDhUq2tIYdIj2LnQo3RYmU0ckRT2LpjmMSmNTNA2yttC2byhFlzmiegFkUEGIg85HKWVxkhk7aR9xCkdoypINmheCOe75c0POt8tl1lcsndhuA6cFXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871073; c=relaxed/simple;
	bh=5aLW0/GtYzRagq5FBsVmgnHxHE5z3/58lXepyBjU8HQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=S3lPCmF9IEhZoA/TSEhn9EpO57x+9ZRorWyqzsi7Ef4+wPROPJHpxJQuBN5w+feg0t2qQqDWVBd/ehBCBR03c23sqxTkkRFo3BK9wZnvqHDzIqHrs0GhaPLnXeiDVeYCwnbU/gXlijB9/m6DO2+UAs5kKg03sdvK9eEXmMedi50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMzlMnWW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMzlMnWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5D51F000FF;
	Tue, 13 Oct 2026 05:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791871071;
	bh=jDC5I4OssBwiX1+mppFFZbuSAU0HYhJjqhM+PUuYFtI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gMzlMnWWmwH+cxF+OmSBDcNnQLyo2siwO2qEOJcRbypjMIkzZRFcWQ+afdZufWkEi
	 d5o19jboSzSd5hpKWbUpwyhDaEXEl6SxtokNZ3smgnycR7dhVM5uCclbpTXyYyYmgd
	 HJ9lGrsC8+poROuoLs1i4VJq4QYq2VVK28A2Tk8NWey8e69Fanv0isCGRgYC1hdzrL
	 fYMgIXH5wE9Anq9aSpxh/JJEQnfv0cMFo69VcqPJOW5K11GhDen3li/b0cNnsYyFQn
	 5e4GsmulM9X7FHSck2Zs74yvwP5W+KRbiPeZOdbjmzSWmhd0NyaAvE8osOR0MrFqKF
	 PdjD6+w1q9H7Q==
Message-ID: <sashiko-outbox-169026@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 4/9] tee: optee: add RPMI shared-memory and
 parameter support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-4-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
 <20261012-rpmi-tee-service-grp-dev-v3-4-975b574667e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:57:50 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] tee: optee: OOB access in RPC handlers due to unvalidated memref s=
ize
- [High] tee: optee: NULL pointer dereference in RPC handlers from empty me=
mref
- [Medium] tee: optee: IDA nonce leak on memory_share failure allows DoS
--

commit 75de307b7e8cbec8782ab18004851de96c3a4c73
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

tee: optee: add RPMI shared-memory and parameter support

OP-TEE commands and RPCs need shared memory that secure world can
identify through RPMI parcels.

Register normal-world pages as read-write parcels shared with the
OP-TEE endpoint. Track each parcel ID and nonce with the common
shared-memory map. Store the combined identity in tee_shm.sec_world_id
and allocate nonzero nonces to distinguish registered memory from NULL
references. Reuse nonces after successful parcel reclamation.

Add conversions between TEE parameters and parcel memory references.

On client memory unregistration, ask OP-TEE to release its mapping
before reclaiming the parcel. Supplicant memory has already been
released by OP-TEE through its SHM_FREE RPC and only needs reclaiming.

> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> new file mode 100644
> index 0000000000000..940676794280d
> --- /dev/null
> +++ b/drivers/tee/optee/rpmi_abi.c

[ ... ]

> +static int optee_rpmi_shm_register(struct tee_context *ctx, struct tee_s=
hm *shm,
> +				   struct page **pages, size_t num_pages,
> +				   unsigned long start)
> +{

[ ... ]

> +	rc =3D ida_alloc_min(&optee->rpmi.nonce_ida, 1, GFP_KERNEL);
> +	if (rc < 0) {
> +		sg_free_table(&sgt);
> +		return rc;
> +	}
> +
> +	args.nonce =3D rc;
> +	args.sg =3D sgt.sgl;
> +	rc =3D rdev->ops->mem_ops->memory_share(rdev, &args);
> +	sg_free_table(&sgt);
> +	/* A failed exchange may leave a parcel using this nonce. */
> +	if (rc)
> +		return rc;

[Severity: Medium]
Does this error path leak the allocated IDA nonce?

If memory_share() fails (for instance, when firmware rejects the request),
it appears the nonce allocated via ida_alloc_min() is returned without being
freed. Since TEE_IOC_SHM_REGISTER is accessible to unprivileged users, could
this be repeatedly triggered to exhaust the IDA space and cause a denial of
service for subsequent shared memory registrations?

> +
> +	global_id =3D optee_rpmi_global_id(args.parcel_id, args.nonce);

[ ... ]

> +/* Convert an RPMI parcel reference to a memref; callers own SHM lifetim=
e. */
> +static int from_msg_param_rpmi_mem(struct optee *optee, struct tee_param=
 *p,
> +				   u32 attr, const struct optee_msg_param *mp)
> +{
> +	struct tee_shm *shm;
> +	u64 offset;
> +
> +	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT + attr -
> +		  OPTEE_MSG_ATTR_TYPE_PMEM_INPUT;
> +
> +	if (mp->u.pmem.size > SIZE_MAX)
> +		return -EOVERFLOW;
> +	p->u.memref.size =3D mp->u.pmem.size;
> +
> +	if (!optee_rpmi_nonce(mp->u.pmem.global_id)) {
> +		/* Return NULL shm. */
> +		if (mp->u.pmem.offs)
> +			return -EINVAL;
> +		p->u.memref.shm =3D NULL;
> +		p->u.memref.shm_offs =3D 0;
> +		return 0;

[Severity: High]
Can a malformed RPC request with an empty PMEM argument cause a NULL pointer
dereference in the common RPC handlers?

If OP-TEE sends a request with a NULL reference (global_id =3D=3D 0), this
function successfully sets shm to NULL and returns 0. When the common RPC
handlers in drivers/tee/optee/rpc.c (such as handle_rpc_func_rpmb_probe_nex=
t()
or handle_rpc_func_cmd_i2c_transfer()) process the parameters, they appear =
to
dereference the shm pointer or pass it to tee_shm_get_va() without checking=
 if
it is valid.

> +	}
> +
> +	shm =3D optee_shm_handle_map_lookup(&optee->rpmi.shm_map,
> +					  mp->u.pmem.global_id);
> +	if (!shm || mp->u.pmem.offs < shm->offset)
> +		return -EINVAL;
> +
> +	offset =3D mp->u.pmem.offs - shm->offset;
> +	if (offset > SIZE_MAX)
> +		return -EOVERFLOW;
> +
> +	p->u.memref.shm =3D shm;
> +	p->u.memref.shm_offs =3D offset;

[Severity: High]
Are we missing bounds checking for the memory reference size and offset?

The size and offset from the OP-TEE message are assigned to the tee_param
without bounds validation. While this might be necessary to return required
buffer sizes in TEEC_ERROR_SHORT_BUFFER, downstream RPC handlers in
drivers/tee/optee/rpc.c (like handle_rpc_func_rpmb_probe_next() and
handle_rpc_func_rpmb_frames()) appear to trust these parameters blindly.

Could a compromised OP-TEE use this to trigger out-of-bounds reads and writ=
es
in the kernel by causing the handlers to calculate out-of-bounds pointers v=
ia
tee_shm_get_va() and perform operations like memcpy()?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-rpmi-tee-s=
ervice-grp-dev-v3-0-975b574667e2@oss.qualcomm.com?part=3D4
