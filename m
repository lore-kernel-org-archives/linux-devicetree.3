Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D437353A6B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007450; cv=none; b=cZfUj3XVraT8moj0b75CeI2h05FjPSXC6VixM9d6KPMIc96ca2mL2F+0jRaU86x7L3LneiD+3paHxN+bPe8B8HROtcxGeKZwD6LrxbaKXeloWTl21yLLTXAuDoSogxpQG2UkTw+irRi8xC9nWB8BvaM+gOp7YF1HdrKpxkf2C1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007450; c=relaxed/simple;
	bh=6hfag/R/EPwCCIwL8Ci8ZZLel8tm7qklTVLFANt1DVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o9i1R9gIB1H7pnRsOV+C+rO26TL73EbIgk+jqrEuofarP0KywHgfWJJ9mP/xa2PnifzW8Hmb+sLDJJ996NqpJik1TNAbSJrttTHgN8rCJ5NHgys+HR1HJEVsRQ+GyLOKjEGvvkKJHM3hI9TMUbbR3cCFrtbGrJfCRmXSQO/XhWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8gNLbDW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8gNLbDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407441F00A3A;
	Thu,  6 Aug 2026 09:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007449;
	bh=VkczAgB2me+va5Rl4WYxwWEinijmp/O/AwzXpoThh/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I8gNLbDWe+JHjucbZqYgXbwsDYgbDL7bBm04n5k64zV8jLS3X7141HzN+xn+DUcDW
	 VpAEgDycocWckBmjZS6blRXEqNhMu0mfKpYDuq8tzHZLKRazKq8MY4x3TPeMpbA/OR
	 Ai8rgK44leA25mOf8EEubwoPAE+EmriugKP2siaf405pysueHgFUO4Yg+5Un3bg4sv
	 X3ivWsUd/mHsX5u0H2je6sKPsWBQVX/3ZgpVqpxhuvNrGtHzXHb8Zv3V3LgLSLEs5l
	 tzWxoLbvXMRvIB7TTuxFWYwJ9pzNyZbZ/K3GRZkIYGlqrcYXeOVfDQXJiiUzHex1+p
	 Iv8CCnrdvwurg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/17] nvmem: microchip-otpc: nvmem: microchip-otpc:
 add tag-based packet lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806074024.531259-10-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-10-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:10:48 +0000
Message-Id: <20260806091049.407441F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] TAG-based DT cells will be rejected by the nvmem core due to out-o=
f-bounds offset values.

Pre-existing issues:
- [High] Concurrent accesses to nvmem_reg_read will corrupt OTP controller =
registers.
- [High] Out-of-bounds MMIO read during probe due to `size` vs `word_pos` m=
iscalculation.
--

--- Patch [9]: [PATCH v6 09/17] nvmem: microchip-otpc: nvmem: microchip-otp=
c: add tag-based packet lookup ---
commit ffccf750925ce25af706c5e14106e91f61b012bc
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

nvmem: microchip-otpc: nvmem: microchip-otpc: add tag-based packet lookup

Add support for accessing OTP packets by their tag which is a FourCC
while preserving backward compatibility with the existing ID-based lookup.
During probe, packet meta data including the tag is read and cached.

> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otp=
c.c
> index df979e8549fdb..a17f82afdc37d 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -70,6 +74,52 @@ static struct mchp_otpc_packet *mchp_otpc_id_to_packet=
(struct mchp_otpc *otpc,

[ ... ]

> +static struct mchp_otpc_packet *mchp_otpc_resolve_packet(struct mchp_otp=
c *otpc, u32 off)
> +{
> +	/*
> +	 * Legacy id based packet access: offset =3D id * 4
> +	 * Inside the driver we use continuous unsigned integer numbers
> +	 * for packet id, thus divide off by 4 before passing it to
> +	 * mchp_otpc_id_to_packet().
> +	 */
> +	u32 remainder =3D off % 4;
> +	u32 id =3D off / 4;
> +
> +	if (!remainder && id < otpc->npackets)
> +		return mchp_otpc_id_to_packet(otpc, id);
> +
> +	/*
> +	 * TAG-based packet access: offset is a 4-byte ASCII tag (FourCC)
> +	 */
> +	return mchp_otpc_tag_to_packet(otpc, off);

[Severity: High]
Will TAG-based DT cells be rejected by the nvmem core due to out-of-bounds
offset values?

The nvmem core strictly validates DT cells in nvmem_add_cells_from_dt() usi=
ng:
if (cell->offset >=3D nvmem->size || cell->bytes > nvmem->size - cell->offs=
et)

Since the TAG value (e.g., 0x41435354) massively exceeds the physical size =
of
the OTP memory, will the core unconditionally reject the cell as out-of-bou=
nds
and fail to register it?

> +}
> +

[ ... ]

> @@ -154,12 +225,11 @@ static int mchp_otpc_read(void *priv, unsigned int =
off, void *val,
>  	int ret, payload_size;
> =20
>  	/*
> -	 * We reach this point with off being multiple of stride =3D 4 to
> -	 * be able to cross the subsystem. Inside the driver we use continuous
> -	 * unsigned integer numbers for packet id, thus divide off by 4
> -	 * before passing it to mchp_otpc_id_to_packet().
> +	 * From this point the offset has to be translated into the actual
> +	 * packet. For this we traverse the table of contents stored in a list
> +	 * "packet" based on the access type - packet id or tag.
>  	 */
> -	packet =3D mchp_otpc_id_to_packet(otpc, off / 4);
> +	packet =3D mchp_otpc_resolve_packet(otpc, off);
>  	if (!packet)
>  		return -EINVAL;
>  	offset =3D packet->offset;

[Severity: High]
This is a pre-existing issue, but does mchp_otpc_read() lack synchronization
when communicating with the hardware?

The nvmem core's sysfs binary file interface does not serialize reg_read
accesses across concurrent readers. When mchp_otpc_read() calls
mchp_otpc_prepare_read(), it performs a multi-register stateful sequence
(MCHP_OTPC_MR write, MCHP_OTPC_CR write, wait on MCHP_OTPC_SR) without hold=
ing
any lock.

Could concurrent reads interleave register writes and cause the hardware to
read from incorrect addresses or stall indefinitely?

[ ... ]

> @@ -215,6 +300,20 @@ static int mchp_otpc_init_packets_list(struct mchp_o=
tpc *otpc, u32 *size)
> =20
>  		packet->id =3D id++;
>  		packet->offset =3D word_pos;
> +		type =3D FIELD_GET(MCHP_OTPC_HR_PACKET, word);
> +
> +		if (type =3D=3D MCHP_OTPC_HR_PACKET_REGULAR) {
> +			ret =3D mchp_otpc_read_packet_tag(otpc, packet->offset,
> +							&packet->tag);
> +			if (ret)
> +				return ret;
> +
> +			if (!mchp_otpc_is_valid_fourcc(packet->tag))
> +				packet->tag =3D 0;
> +		} else {
> +			packet->tag =3D 0;
> +		}
> +
>  		INIT_LIST_HEAD(&packet->list);
>  		list_add_tail(&packet->list, &otpc->packets);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but does the loop in
mchp_otpc_init_packets_list() perform an out-of-bounds MMIO read?

The loop condition is while (*size < MCHP_OTPC_SIZE). During each iteration,
*size advances by 4 * (payload_size + 1) bytes, but word_pos advances by
payload_size + 2 words (which is 4 * (payload_size + 2) bytes).

Because word_pos grows faster than *size, won't it exceed the physical
hardware bounds well before the loop terminates? If so, the subsequent call=
 to
mchp_otpc_prepare_read(otpc, word_pos) could write this out-of-bounds offset
into the hardware address register.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806074024.5312=
59-1-varshini.rajendran@microchip.com?part=3D9
