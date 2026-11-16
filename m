Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798838;
	b=E1gcFkV6nds3F3gwFG4YwAtgs5Ms4tmLJhgKBJX4db7YYiRb/nGSGRKirGIkoDBRZf3m
	 zS2nmxv7kZlVFQzHZUT0GbVD2l5Aauy86T44bRK81rPx+nV8D/w8u6D2nnLpD1ynAlSTa
	 NgAFJ8jMiYRBs1jQQQBGKYo0y+Esby7fG+WXElU2JmqnG1YKjhhyxSsZaaOD0PMRQtPdI
	 06EsuztypC7+alL7TNSEcCh8bNa+gyan3bHq/lJTvBiVhT7mc2msG42rkuLhL+JUAuhiv
	 +XnTia+jajA/0/UauB8es93qeynukgGsdtde7Y7BPSMnsaiSzWeYvXaLABbkUv6/+6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798838;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NPEtTXFUoFzK7wsmx+bhz2FqqhGj5JTMxvfIObx3PZA=;
	b=wDq0eroN74iJiGMFhPlI3xpSSZTXIRTdB7aRX023tDBuosTQo5XqS4+3O/4DAToFqyjL
	 NkJBa6nrOh0inTnWr4jbPfsXvEprvUaMApwq2j0pRFHpSR9dt3u/0Y6rXIeXUzpui0vzV
	 /egU+6o3eDPmiIKgeJwpExKf9wKV5YS9qtqri14OXMu99CSN/ILJ4InDfZkLNfYd4vzsB
	 spZI2g6iS99jZJuxZG4FdywZUbTx7s5UyN9Ho6pkZn8fKr7UDNZ7wZZaO6hJH6D/J4sdl
	 TYZIBAvccejyk0E7rlwIZTGCpHoBSubCdUhpK1mWNaVEMLBN+bHSSXsNdTo3RPdVg6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O89oMK+y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6190E606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O89oMK+y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8AB1F000C4;
	Mon, 16 Nov 2026 03:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794798838;
	bh=NPEtTXFUoFzK7wsmx+bhz2FqqhGj5JTMxvfIObx3PZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O89oMK+yhWIB7aPPPvGaMs0MIzChAXr+AoGefD/kB0dHtRvZfJdKTH0/X+AZhrCxn
	 hbOhtx7eGz7lBHoBj7KyuIKBHuG8DRRrTiXFJGYjsq4AV9qgbL0b6dzZlsLwJ+w5Fe
	 iIn9uAE9gBgyP28nad8ufBysQQj5NdGVRWC4ZQLdYFWvh7ixCCUioz5AW4xEWFi/B3
	 Wij64xNtlPZQo4A9PCuWM3EyIZJ1LIHBRkezJhR89T7hZsoKhehB9k5qFX/JNrpipU
	 e6jTGt+Chapa+h6PIUATeDSqCNJGEGDM/IqKD22CpaH79MV3fhMECeg0IXFk28fIlx
	 up5MAlMaUZWaQ==
Message-ID: <sashiko-outbox-216112@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] nvmem: core: add byte-mask support for
 non-contiguous cell bytes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongmei Xu" <hongmei.xu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-nvmem-byte-mask-for-split-macaddr-v2-2-96f4a0c08264@oss.qualcomm.com>
References: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
 <20261116-nvmem-byte-mask-for-split-macaddr-v2-2-96f4a0c08264@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 03:13:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] nvmem: core: unaligned raw_len in
  nvmem_cell_info_to_nvmem_cell_entry_nodup()
- [Low] nvmem: core: redundant nvmem_validate_byte_mask() in
  nvmem_add_cells_from_dt()
--

commit ef65d0ead813d5be4bc32f2283c1a2c9aee24659
Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>

nvmem: core: add byte-mask support for non-contiguous cell bytes

This commit adds a byte-mask cell property to select and pack
non-contiguous physical bytes from an NVMEM region into a logical cell
value.

> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 7d4cce8e27424..7e96b84bc4e28 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
[ ... ]
> @@ -603,12 +645,22 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodu=
p(struct nvmem_device *nvmem,
> =20
>  	cell->bit_offset =3D info->bit_offset;
>  	cell->nbits =3D info->nbits;
> +	cell->byte_mask =3D info->byte_mask;
>  	cell->np =3D info->np;
> =20
> +	if (cell->byte_mask) {
> +		int rc =3D nvmem_validate_byte_mask(nvmem, info);
> +
> +		if (rc)
> +			return rc;
> +	}
> +
>  	if (cell->nbits) {
>  		cell->bytes =3D DIV_ROUND_UP(cell->nbits + cell->bit_offset,
>  					   BITS_PER_BYTE);
>  		cell->raw_len =3D ALIGN(cell->bytes, nvmem->word_size);
> +	} else if (cell->byte_mask) {
> +		cell->raw_len =3D fls(info->byte_mask);
>  	}

[Severity: Medium]
Should cell->raw_len be aligned to nvmem->word_size here, as the
cell->nbits branch and nvmem_validate_byte_mask() do?

Leaving cell->raw_len as fls(info->byte_mask) triggers the
!IS_ALIGNED(cell->raw_len, nvmem->word_size) check just below whenever
nvmem->word_size > 1 and fls(info->byte_mask) is not a multiple of
word_size:

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
}

That logs a false error and, if info->raw_len was set (for example by a
fixup_dt_cell_info callback), fails cell registration with -EINVAL.

[ ... ]

> @@ -829,16 +881,27 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nv=
mem, struct device_node *np)
[ ... ]
> +		of_property_read_u32(child, "byte-mask", &info.byte_mask);
> +
>  		info.np =3D of_node_get(child);
> =20
>  		if (nvmem->fixup_dt_cell_info)
>  			nvmem->fixup_dt_cell_info(nvmem, &info);
> =20
> +		if (info.byte_mask) {
> +			ret =3D nvmem_validate_byte_mask(nvmem, &info);
> +			if (ret)
> +				goto err_free_name;
> +		}
> +
>  		ret =3D nvmem_add_one_cell(nvmem, &info);

[Severity: Low]
This isn't a bug, but nvmem_add_one_cell() ->
nvmem_cell_info_to_nvmem_cell_entry() ->
nvmem_cell_info_to_nvmem_cell_entry_nodup() already calls
nvmem_validate_byte_mask(nvmem, &info), so this check in
nvmem_add_cells_from_dt() is redundant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-nvmem-byte=
-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com?part=3D2
