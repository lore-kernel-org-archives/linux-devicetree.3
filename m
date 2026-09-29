Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AEA411F90
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790652558; cv=none; b=Vj+IPj6TO/4SxaPxehrYHXOPVjBTSGQr7tR8KbvjUbCmohgSS2gEWrAi1fBH3eMDC2senjYq03AUQLhdrI00gnZvTMt40IB21TkZfxPCMzadtbBo99eTgkiZ8yT/Zijeeqq7AfbXVWv8jh47KaX96osfbZpYpqK/ln+hg5LAtww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790652558; c=relaxed/simple;
	bh=3mm7YyBh58i7FNRKwLwQQAJhN28rnFl1EmRf/Ttquj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZjMZtB7WEGi/8jZ+ua0mDqFSb+bfcaP5Q/VFCMPaR9EcbR5fS+EAOBZ5f8O5Gjp2EYZVFFYRZ+3ar78K2iwvGMXlGrgNtm7ySjUEH3gIynRAas7aYE4YYSCE3NXuTDptn1mTkvhJ+h3MDgIY7OPA0sbsl6Wm7NuOnCGGgflnUIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyRF0mTb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyRF0mTb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFE41F000FF;
	Tue, 29 Sep 2026 03:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790652556;
	bh=tkS5g37UdRTzhe3ShG+9JDmBPNZGVrqtw40JfAA/I+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HyRF0mTbWCcj8OE09aOQcGxjrXfackcOM3x78roDfyEKkpCDPcvX1KxTYwNz2MjC4
	 dv7+pgqMuk2cGGlNtGKF3xNCqMo9QMAxp1ijtTKrbINugndSaWKjJwxIGmX7+tLhDv
	 PhdB+wQIVowVAwfATXdVfZStcubIuh/juSOjvzEwXvKts9ksSFLONi79HPMOXT7H6w
	 ATPXRpFVS45TufkZgMoMXAFPBRbfK7qXA6yZfYU9IcR4FqQyRt3WyW8yQlZpDvYTeU
	 WmGa2Scmx+fDRpAD+Jgg4G0joiUuoWHsEKuFTCJf+GvOCWbfLb/dx1QrM4iFzn20et
	 ncsL+D3rxqQqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 09/10] firmware: riscv: rpmi-tee: add memory parcel
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-9-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
 <20260928-riscv-rpmi-tee-abi-v1-9-04908b81d885@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 03:29:16 +0000
Message-Id: <20260929032916.6BFE41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] mm: physical address truncation in rpmi_tee_block_iter_next()
- [Medium] mm: resource leak of segment slot in rpmi_tee_parcel_create() er=
ror path
- [Low] subsystem: mixing goto-based error handling and __free() in rpmi_te=
e_parcel_create()
--

commit 1ca10244d1c27d1eb1d5158785dc0b417f521a59
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

firmware: riscv: rpmi-tee: add memory parcel operations
   =20
Implement lend, share, and reclaim of RPMI memory parcels for public
memory endpoints. Convert scatterlists into RPMI page blocks and
transparently split large parcels across multiple requests when they
do not fit a single mailbox message, subject to the per-endpoint
multisegment limit reported by firmware.

> diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/=
riscv_rpmi_tee/driver.c
> index 7b06c1f96ba83..0004f54c7d899 100644
> --- a/drivers/firmware/riscv_rpmi_tee/driver.c
> +++ b/drivers/firmware/riscv_rpmi_tee/driver.c

[ ... ]

> +static bool rpmi_tee_block_iter_next(struct rpmi_tee_block_iter *iter,
> +				     u32 *high, u32 *low)
> +{
> +	u32 pages;
> +
> +	if (!iter->length) {
> +		if (!iter->sg)
> +			return false;
> +		/* Next SG. */
> +		iter->address =3D sg_phys(iter->sg);
> +		iter->length =3D iter->sg->length;
> +		iter->sg =3D sg_next(iter->sg);
> +	}
> +
> +	/* RPMI memory block represents at most @RPMI_TEE_BLOCK_MAX_PAGES pages=
. */
> +	pages =3D min_t(size_t, iter->length >> RPMI_TEE_MEM_PAGE_SHIFT,
> +		      RPMI_TEE_BLOCK_MAX_PAGES);
> +
> +	*high =3D upper_32_bits(iter->address >> RPMI_TEE_MEM_PAGE_SHIFT);
> +	*low =3D lower_32_bits(iter->address >> RPMI_TEE_MEM_PAGE_SHIFT) << 12 |
> +		(pages - 1);

[Severity: High]
Does this code inadvertently truncate physical addresses at or above 4GB?

Because lower_32_bits() returns a u32, shifting the result left by 12 will
overflow and lose the upper 12 bits, which correspond to bits 43..32 of the
original physical address.=20

Similarly, upper_32_bits() will extract bits 75..44 instead of 63..32.

This might cause the firmware to receive incorrect physical addresses,
leading to the TEE accessing the wrong memory and potentially causing data
corruption or crashes during sharing/lending requests.

> +
> +	iter->address +=3D (phys_addr_t)pages << RPMI_TEE_MEM_PAGE_SHIFT;
> +	iter->length -=3D (size_t)pages << RPMI_TEE_MEM_PAGE_SHIFT;
> +
> +	return true;
> +}

[ ... ]

> +static int rpmi_tee_parcel_create(struct rpmi_tee_transport *priv,
> +				    struct rpmi_tee_mem_args *args)
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

[Severity: Low]
Is it intentional to mix __free() with goto-based cleanup here?

The subsystem guidelines recommend converting all resources that need a goto
cleanup to scope-based cleanup, or converting none of them. This function
uses __free(kfree) for the req allocation but also maintains a goto
out_release_slot label for releasing the segment slot.

> +	if (!req) {
> +		ret =3D -ENOMEM;
> +		goto out_release_slot;
> +	}

[ ... ]

> +	resp_len =3D sizeof(resp);
> +	ret =3D rpmi_tee_send(priv, RPMI_TEE_SRV_MEMORY_PARCEL_CREATE,
> +			    req, req_len, &resp, &resp_len);
> +	if (ret)
> +		goto out_release_slot;
> +	if (resp_len !=3D sizeof(resp))
> +		return -EPROTO;

[Severity: Medium]
Can this direct return leak a segment slot on unexpected response lengths?

If rpmi_tee_send() succeeds but the response length is invalid, returning
-EPROTO directly skips the out_release_slot label.=20

This fails to decrement priv->mem.multisegment_active, leaking the reserved
slot and eventually exhausting multisegment_max, which would permanently
block future multi-segment operations with -EBUSY.

> +
> +	xfer.parcel_id =3D get_unaligned_le32(&resp.parcel_id);
> +	/* Send remaining blocks as segments. */
> +	ret =3D rpmi_tee_parcel_send_segments(priv, &xfer);
> +	if (ret) {
> +		/* On error, retain the slot as firmware may still hold it. */
> +		if (rpmi_tee_memory_reclaim(priv, xfer.parcel_id)) {
> +			dev_warn(priv->dev, "failed to abort parcel %#x\n",
> +				 xfer.parcel_id);
> +
> +			return ret;
> +		}
> +	} else {
> +		args->parcel_id =3D xfer.parcel_id;
> +	}
> +
> +out_release_slot:
> +	if (segmented)
> +		rpmi_tee_release_segment_slot(priv);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-riscv-rpmi=
-tee-abi-v1-0-04908b81d885@oss.qualcomm.com?part=3D9
