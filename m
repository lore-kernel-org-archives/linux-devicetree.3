Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E38373C1A
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 03:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431644; cv=none; b=SiVhkGQrTzBoIAnYlT2EGQ3eyHmIsYehGLeHxE9sDpm08WLSNfHQGHIzFQ7UzcRGZiw99Ub3MAR966mX48Ox1Id3uboltC46cecsNkeJ4wfPVMAC84b4m/lEPVWykDPVT6xphdPw2IqshrluXjs8kHftyaJekRgJLe3lfeS1nyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431644; c=relaxed/simple;
	bh=jNpCaVW59+iGZPbjqQ+2Gd29W3DosDB1efYU/z62hJk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gZA4xpDik6bvk+page13qI2LFK4zTHszalnoWghC45gjxDW6KEGlU5RLHAtJ/p2QNhWWyMz5vgPWAYeLrCbBMKX//GRi9YgIeOdy8xLbqWK47D0TL/aqo2Ayd+BmE/PBVnaKB7woR8mNLb8VGzA8QD49IpiW/Xtugt6CqSbDmgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/T0h30Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/T0h30Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA7B1F000FF;
	Thu,  8 Oct 2026 03:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791431643;
	bh=KklTKogYm2PeKcIGWkyiDFJl2Nqwg/7VRtwzLnU8suI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H/T0h30Ze0hRjjgcmCdGA7nILInSNvjg5jcJaXn26WT1SQmcnJf56oh6et347VyfC
	 XRxyMt0g5oHRSy5IYImaQ/I575t0QvsVNElbqNEj8vgT4slSLjgsQnpqyTi8XZBAdh
	 SsmSXTFOgm6Mia7b3yFHyc9dH5Ikj2Ba3TxXVD8sHmLiwcE0OZcP0ZZ2Uk5V9hydA/
	 HRVBepCll6Va0JXwrPJedAYudedRAGbF8I/D7Up5/HOwr8qQMTUpL1l+iHEvsx0V/u
	 ljjsDYdgcn/gbRQEco+4mTcsACrsNecddIBS4X/LDGrDlZuntvOTJ1gRc+xj5ys/Cl
	 +FyQxG/efZeiw==
Message-ID: <sashiko-outbox-163591@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 09/10] firmware: riscv: rpmi-tee: add memory
 parcel operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-9-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
 <20261007-riscv-rpmi-tee-abi-v2-9-45939a13d223@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 03:54:02 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] rpmi-tee: segment slot leak and goto mixing in rpmi_tee_parcel_c=
reate()
- [Low] cleanup: mixing goto and __free() in rpmi_tee_parcel_create()
--

commit cb2515b520037bb2b95420754a397f9b4e4d3e5d
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

firmware: riscv: rpmi-tee: add memory parcel operations

Add memory lending, sharing and reclamation through RPMI memory parcels
so service drivers can exchange memory with TEE endpoints. This patch
introduces two issues in rpmi_tee_parcel_create(): a mixture of __free()
and goto-based cleanup, and a resource leak caused by bypassing the cleanup
label.

> diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/=
riscv_rpmi_tee/driver.c
> index b43a09f5e8536..690561ed949dc 100644
> --- a/drivers/firmware/riscv_rpmi_tee/driver.c
> +++ b/drivers/firmware/riscv_rpmi_tee/driver.c
[ ... ]
> @@ -326,6 +446,355 @@ static int rpmi_tee_op_call(struct rpmi_tee_device =
*rdev, const void *req,
[ ... ]
> +/* Create a memory parcel after the caller has validated its operation. =
*/
> +static int rpmi_tee_parcel_create(struct rpmi_tee_transport *priv,
> +				  struct rpmi_tee_mem_args *args)
> +{
> +	struct rpmi_tee_parcel_create_resp resp;
> +	struct rpmi_tee_parcel_xfer xfer;
> +	size_t blk_off, req_len, resp_len;
> +	bool segmented;
> +	int ret;
> +	u32 i;
> +
> +	ret =3D rpmi_tee_count_blocks_sg(args->sg, &xfer.block_count);
> +	if (ret)
> +		return ret;
> +
> +	/* BLOCK_HIGH[] follows the request header and receiver arrays. */
> +	blk_off =3D RPMI_TEE_PARCEL_CREATE_SIZE + args->receiver_count *
> +		RPMI_TEE_PARCEL_CREATE_RECEIVER_INFO_SIZE;
> +
> +	/* Limit the initial request to the parcel's actual block count. */
> +	xfer.next_block =3D min((priv->mbox.max_msg_data_size - blk_off) /
> +			      RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE,
> +			      xfer.block_count);
> +
> +	segmented =3D xfer.next_block < xfer.block_count;
> +	if (segmented) {
> +		if (!priv->mem.multisegment_max)
> +			return -EOPNOTSUPP;
> +		/* Reserve a slot against the firmware's advertised limit. */
> +		ret =3D rpmi_tee_reserve_segment_slot(priv);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	req_len =3D blk_off + RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE * xfer.next_blo=
ck;
> +
> +	struct rpmi_tee_parcel_create_req *req __free(kfree) =3D
> +		kzalloc(req_len, GFP_KERNEL);
> +	if (!req) {
> +		ret =3D -ENOMEM;
> +		goto out_release_slot;
> +	}

[Severity: Low]
Does this mix goto-based error handling with scope-based cleanup?

The cleanup.md subsystem guide explicitly forbids mixing goto-based cleanup
labels and __free() declarations in the same function because it creates
confusing ownership semantics and leak hazards.

Could this be refactored to either use scope-based cleanup for all resource=
s or
stick entirely to goto-based cleanup?

> +
> +	rpmi_tee_block_iter_init(&xfer.iter, args->sg);
> +
> +	/* INIT request. */
> +	req->creator_id =3D cpu_to_le32(priv->self_id);
> +	req->creator_access =3D cpu_to_le32(rpmi_tee_access(args->creator_acces=
s));
> +	req->receiver_count =3D cpu_to_le32(args->receiver_count);
> +	req->flags =3D cpu_to_le32(segmented ? RPMI_TEE_PARCEL_MULTI_SEGMENT : =
0);
> +	req->nonce =3D cpu_to_le32(args->nonce);
> +	req->block_count =3D cpu_to_le32(xfer.next_block);
> +	memcpy(req->label, args->label, sizeof(req->label));
> +
> +	for (i =3D 0; i < args->receiver_count; i++) {
> +		u32 tee_access =3D rpmi_tee_access(args->receivers[i].access);
> +		/* Store RECEIVER_ID[i] and ACCESS[i]. */
> +		rpmi_tee_put_receiver(req->data, args->receiver_count, i,
> +				      args->receivers[i].endpoint_id,
> +				      tee_access);
> +	}
> +
> +	ret =3D rpmi_tee_fill_blocks(&xfer.iter,
> +				   req->data + 8 * args->receiver_count,
> +				   xfer.next_block);
> +	if (ret)
> +		goto out_release_slot;
> +
> +	resp_len =3D sizeof(resp);
> +	ret =3D rpmi_tee_send(priv, RPMI_TEE_SRV_MEMORY_PARCEL_CREATE,
> +			    req, req_len, &resp, &resp_len);
> +	if (ret)
> +		goto out_release_slot;
> +	if (resp_len !=3D sizeof(resp))
> +		return -EPROTO;

[Severity: Medium]
Does this direct return leak the reserved segment slot?

If the firmware returns a malformed response with a valid length but not ex=
actly
equal to sizeof(resp), the direct return of -EPROTO bypasses the
goto out_release_slot; cleanup path.

This causes a permanent leak of the multisegment_active accounting slot, wh=
ich
can permanently block future multisegment memory operations with -EBUSY once
the limit is reached.

This seems to be a direct consequence of mixing __free() and goto in the sa=
me
function. Should this also use goto out_release_slot; to ensure the slot
is properly released?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-riscv-rpmi=
-tee-abi-v2-0-45939a13d223@oss.qualcomm.com?part=3D9
