Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557278;
	b=vUTGJqexv9pGqq8Q4u3Hlv+wsgDhLvyYikDAFHJqyQ2Es9/wP4UQxhjEpVPo481hGr5D
	 JjoVHc32zLzn/RiZAdWQbiqhpKxjGef6VMVLQ+goSVgd4WfHvi3x9Wb8Jp9xYFwya2Rq1
	 esRNF0epQIsTOHvII2sxtz9amgi7/2Ke3y22AuVEZb4cPvtVcGqH7iwDh2wYfhRPqqz6T
	 UeX1v2ya6QEU600oLAxnWWVqdnTX6QETZF/f/183nu9jEyPE6GNrdlacwMH/D7hYbU36D
	 ho10raiIthPTAqOuNr+zzHoVcC7IPBRJh5T0rGRSFeoXIDM71MJHGkZOs4WU2KZwyOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557278;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ldebJULdahXawwaIjPPXo2Uevcyl3fmECri5N00Y0/A=;
	b=txcySa72jj5NzL92cNrsI9AetFsW6qO1cGKGg9gw6Mn4zETLilcWEW9IzldUD51xGN2V
	 qYOzmIP/F0IUgzvfuPLAvO2u927LlbYgNee56O0rUh90Mr1ybRpI8cgCrWNs/ju/hthM8
	 fohNdRmbxukfmvvgNu7NV/Z8xj9seUOgqFO6tcfoYx6NeYx7YnQhqEZyeSoMnD7jN9adz
	 ajTIVu5XtPutb36Xi9Kz1ztsyeCdOIYS8OPohPhz7S2GU9ulf1PaRvv2L7gLq+UsSoovH
	 iD42XBgqpV1XkK/HXoBxkZuwxf0HBAeQnhc3Qva555odaLEL+Wjv4Dve1htghPJXQgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eGf9B0UY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC79606A337
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eGf9B0UY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2211F000C5;
	Fri, 13 Nov 2026 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794557278;
	bh=ldebJULdahXawwaIjPPXo2Uevcyl3fmECri5N00Y0/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eGf9B0UYsYnQa1EIvRho1gl5CtZA8ZT7/7xQvZoA48yxBycx9kfdZTEqKEhOfOyWR
	 Pwzv05OQw/zhnU6Xq66le+btVQF8oXEPizqozOi/fx7QmVWwiMDpkq/mcv7akBLVoO
	 QMb8C+h7LFVxhJGNkPJFItG8O4HysYUFJ9c2R7bsH0UBd8lu0Sz3P//Igzd4Zmz72r
	 QmuPiJKAloaiBlIXsOvWTVbFlAeeSB/EgHZUWi9/smOHNLq6drr7F+/6Hp5GQOCMQ0
	 SWMiMHsL3ljR/Gek5pvXtf3FGPhNvrlS4phu3YqFYszTuuum4NJhxCCCYSiEQtyQ36
	 hnNxKsyl9SVvg==
Message-ID: <sashiko-outbox-212383@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] nvmem: core: add byte-mask support for
 non-contiguous cell bytes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongmei Xu" <hongmei.xu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-nvmem-byte-mask-for-split-macaddr-v1-2-138f715f18c1@oss.qualcomm.com>
References: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
 <20261113-nvmem-byte-mask-for-split-macaddr-v1-2-138f715f18c1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:07:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] nvmem: core: byte_mask raw_len reads full device and rounds
  past size
- [Medium] nvmem: core: byte_mask validation bypassed when nbits is
  non-zero
- [Medium] nvmem: core: missing zero-fill of trailing bytes in
  __nvmem_cell_read()
--

commit 2da8dac9e0c0313c6b2e42597b707a19ff863b3a
Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>

nvmem: core: add byte-mask support for non-contiguous cell bytes

This commit adds support for a byte-mask cell property that selects and pac=
ks
non-contiguous bytes from an NVMEM region into the logical cell value.

> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 7d4cce8e27424..6c9994abce39f 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c

[ ... ]

> @@ -603,12 +645,19 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodu=
p(struct nvmem_device *nvmem,
> =20
>  	cell->bit_offset =3D info->bit_offset;
>  	cell->nbits =3D info->nbits;
> +	cell->byte_mask =3D info->byte_mask;
>  	cell->np =3D info->np;
> =20
>  	if (cell->nbits) {
>  		cell->bytes =3D DIV_ROUND_UP(cell->nbits + cell->bit_offset,
>  					   BITS_PER_BYTE);
>  		cell->raw_len =3D ALIGN(cell->bytes, nvmem->word_size);
> +	} else if (cell->byte_mask) {
> +		int rc =3D nvmem_validate_byte_mask(nvmem, info);
> +
> +		if (rc)
> +			return rc;

[Severity: Medium]
Does placing nvmem_validate_byte_mask() in the else-if branch after
if (cell->nbits) bypass validation when both nbits and byte_mask are set?

cell->byte_mask is copied unconditionally above, so if info->nbits is
non-zero, nvmem_cell_info_to_nvmem_cell_entry_nodup() takes the
if (cell->nbits) branch and skips nvmem_validate_byte_mask(). In
nvmem_add_cells_from_dt(), nvmem_validate_byte_mask() runs before
nvmem->fixup_dt_cell_info(), which can set info.nbits and info.bit_offset a=
nd
adjust info.offset (as qfprom_fixup_dt_cell_info() does when a cell offset =
is
not 4-byte aligned) before nvmem_add_one_cell() runs.

During __nvmem_cell_read(), nvmem_reg_read() then reads into rawbuf while
nvmem_shift_read_buffer_in_place() shifts the unwritten buf, and the
byte_mask loop writes hweight32(cell->byte_mask) bytes into buf without
bounds validation, corrupting the cell data or overflowing buf.

> +		cell->raw_len =3D nvmem->size - cell->offset;
>  	}

[Severity: High]
Can setting cell->raw_len to nvmem->size - cell->offset cause out-of-bounds
reads past nvmem->size?

Right below this block, nvmem_cell_info_to_nvmem_cell_entry_nodup() aligns
cell->raw_len up to nvmem->word_size:

drivers/nvmem/core.c:nvmem_cell_info_to_nvmem_cell_entry_nodup() {
    ...
	if (!IS_ALIGNED(cell->raw_len, nvmem->word_size)) {
		dev_err(&nvmem->dev,
			"cell %s raw len %zd unaligned to nvmem word size %d\n",
			cell->name ?: "<unknown>", cell->raw_len,
			nvmem->word_size);

		if (info->raw_len)
			return -EINVAL;

		cell->raw_len =3D ALIGN(cell->raw_len, nvmem->word_size);
	}
    ...
}

When nvmem->size - cell->offset is not a multiple of nvmem->word_size,
rounding cell->raw_len up makes cell->offset + cell->raw_len exceed
nvmem->size, causing __nvmem_cell_read() to call nvmem_reg_read() past the
end of the device.

Even when aligned, setting cell->raw_len to the rest of the device rather
than the masked span (at most 32 bytes) forces every read to allocate and
read the entire trailing region, which fails on providers where reading
protected or unmapped trailing fuse rows returns an error (such as
sec-qfprom).

[ ... ]

> @@ -1648,28 +1708,51 @@ static int __nvmem_cell_read(struct nvmem_device =
*nvmem,
>  			     struct nvmem_cell_entry *cell,
>  			     void *buf, size_t *len, const char *id, int index)
>  {
> +	u8 *rawbuf =3D NULL;
> +	void *readbuf =3D buf;
>  	int rc;
> =20
> -	rc =3D nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
> +	if (cell->byte_mask) {
> +		rawbuf =3D kzalloc(cell->raw_len, GFP_KERNEL);
> +		if (!rawbuf)
> +			return -ENOMEM;
> +		readbuf =3D rawbuf;
> +	}
> +
> +	rc =3D nvmem_reg_read(nvmem, cell->offset, readbuf, cell->raw_len);
> =20
>  	if (rc)
> -		return rc;
> +		goto err_exit;
> =20
>  	/* shift bits in-place */
>  	if (cell->bit_offset || cell->nbits)
>  		nvmem_shift_read_buffer_in_place(cell, buf);
> =20
> +	/* compact non-contiguous bytes selected by byte_mask */
> +	if (cell->byte_mask) {
> +		int out_idx =3D 0;
> +		int i;
> +
> +		for (i =3D 0; i < cell->raw_len && i < 32; i++) {
> +			if (cell->byte_mask & BIT(i))
> +				((u8 *)buf)[out_idx++] =3D rawbuf[i];
> +		}
> +	}

[Severity: Medium]
When hweight32(cell->byte_mask) is smaller than cell->bytes, does this leave
the trailing bytes in buf uninitialized instead of zero-filling them?

Because nvmem_reg_read() reads into rawbuf, buf is only written up to
out_idx. Callers such as nvmem_device_cell_read() pass a caller-supplied
buffer directly into __nvmem_cell_read() without pre-zeroing it and return
cell->bytes, leaving stale or uninitialized memory in
buf[out_idx .. cell->bytes - 1] for both cell->read_post_process() and the
caller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-nvmem-byte=
-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com?part=3D2
