Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794566078;
	b=MPTVNDGqTiyuJAo1cqfgpDPz4O8SR+1VCtk3RzQS6Hdt8dpPnthJFYgDrmYsJIIFQmeJ
	 +k8zywb2ydZaqwAc+OXSmUx2Wv5Ye26hcQUAKyJFX6tCCbW+7poSQ+SKhOJaSI5lO2GdP
	 6GI+au89NLKQ4OQfFqrCbNPqtPXNA/tRuDWi6cLhomDUoOHt6REJYfWAa++1Oro8/ej2w
	 sQkSLkEtjIltC/0wBMEsmHz54L/Z3kXm3eT0VUmBn1jerdy1F7q1hQZeo1ITRdNpaBQiZ
	 D7vWOyymEjQRB6VAglcoVwrz9+WrNW0pH++TBgARs5rkfxfadM3joqR2s4uPkuHaklQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J1gTyXJtgE80nZ1JcIGP2rgD9HntZP2FMN/BXrOJIRU=;
	b=VWVCNGtnv5cvT0jxyVCerCpBlGYJniQ2QEfNishpaLF7GFe804IrZ1CCJEEQdnQ1oRIz
	 b7DLDMrL+MgorjTfumgP3T0WVwrRJxDlodnceBS8jag0Ayks8D/OKGB/mnK6O/S++PXlD
	 /MpOb+tcADGVXZQFFqElNq3hvkFlN8xLVJvsAuTIsk4uWa7mIC9o0L9+KpqjH+6ZeiKAF
	 6w1rKBhIZI7GcJ4vlgNjMMDpSS+kRhSC8Eybzqw8olpuECihyWlIiHkfwDq9tfpuMj0c5
	 uHt6Zgnb5S86n7+ciSumCcWfRTNKI3t0OYKJ2un53PTxq0GlJ4bHPg5inz9KgkFmKsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7fBciU8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QCqCpAQm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BEB606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7BEB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7fBciU8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QCqCpAQm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V9Rq074775
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1gTyXJtgE80nZ1JcIGP2rgD9HntZP2FMN/BXrOJIRU=; b=V7fBciU8NnlxCF+X
	SKN9TAddXBWkfxzQKAiPxTb4Y8r5FshZz8q+Tr38nS45C42nIMoy6DjOkKVhyHy4
	DwCjPGIXddh3UShgtB53gesZglaEN8C4cdc4KJmg1KM+YXS71kjXBmGgjujHFfb2
	jKrjQPaYH3f48vzSBirVCKMlbm5rFMKkyjUKWnrmhUvBiTI48jBViLi5+no4Wvkf
	usG/tRkUKpV+VQpTSl+sET6zy6+Y5LGP9ON4hh+2ymF2JstSPbCxT7GOWd6gVbTy
	lvWQwxY3F7gchkLEplB8X8rzidHJ2Eoea4E/rTb4F90dvNCyYedylVlnA4RNhIEX
	dgFeuw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhwhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:34:37 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b3b74c495dso12467037b3.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794566076; cv=none;
        d=google.com; s=arc-20260327;
        b=OLsWxxTTWZhRtHGEy9EslrlPISxalr2+VqnW6YtHbB32OK6gyHxZULmCQcybkP6sJ5
         Gte0bcG+QaoERu1w0djT5plMD9OWPZEukUVPvL0RKPsW95Vxpy496i8MlxYRqTYErK3x
         LUPPnnEI2EULt9XrCP8ATArrr3w+X1WhaGq00sJqIaHXyHDNV2EejulJsROnhxLydRlX
         j9KrpV7ZMFmXsAA+xN7rALW3bmY3XxFlFdg7/dytKsrFGTxLSAWl+PPywNDrL5RXhy8Q
         IAe8c0qSc6YwNqasZrTZqtCIScv6BlS2SC439vO1wYp/Q+n0V+1r/kP6PpKgmL2DzgKE
         NvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J1gTyXJtgE80nZ1JcIGP2rgD9HntZP2FMN/BXrOJIRU=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=RSR5bLO4vTYSEONRL+Jc75Egrl4KN9w4SaEQNQrJJj1zEIUwnbtk2rJPsPTtY6xcpr
         fZNMAc5sOOgFzeWJhxBqMjfdjSYGePk26VkmjNnrB+Ec3cbhaTWTld7RaxNQ/P1651yr
         eNfJuB/4sYAHzaCFEsyJ2af3hHF2ImpNdjAVT82CrrpcMQEavH1Qd2U1qOIntEoY+P++
         K0w0A7zGUCh23RDj2GqMh+tJWIPMfnGIc++L29BFeKVo99TKVMwWYfRkU9Y8rrGSgpSY
         OBrkMJt69otXQGkaDYGwsJwbxDRQSPu3/ncZ7bhvwAWFhgbEUAanu3P6S2m948Mprg1X
         wXvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794566076; x=1795170876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1gTyXJtgE80nZ1JcIGP2rgD9HntZP2FMN/BXrOJIRU=;
        b=QCqCpAQmcvMXpWn+b8JTVbQCsYj2/mrghGbrUpxcDJi+HK85F63y22IflYxztoqBCC
         ImGP75fa1yBANLJ3qZ6cmyGq+UpfFzuU1NaO5piYwo5WV5ByrB6X+6k+L0UdfsAstvTc
         7sLuqHgNGfEgVH82rNWhVE8byv44KYDvKzFnj92g8W2vGBzqI/QoAy212VnTLAZDzmAY
         lmX3iC1EQtaIuZUMb8uOm9XT6Nu0/CpU38J2V8TaM6ahkanlH25hdYlzBlujCozlwqMv
         pvu032w0uAdle37/d77IgXNI1k05EvE3JRk2C0RtyRYzOdOPMeu5AQPVMz/TFUL+f3ZV
         TcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566076; x=1795170876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1gTyXJtgE80nZ1JcIGP2rgD9HntZP2FMN/BXrOJIRU=;
        b=BSHbCfuYYP0JksJU98TRhrlqum4b+R58Yra8Pz3R6jYtcFZAUSI1kCFPrU0rptJqz8
         R5H3nLqEQnaZ8imjvN8DC0H3hFMIcBRhxQqQh6+cGWJogGG8SMuqkgSIlM4SmX9berJ4
         FE+ax43sOinvmCUbgYXszAYW6x9Jatn3FKn3Mrem+6OMtoed0m/ErqYqWxAlV4+Bk5ir
         UwdOskvRhbLByiYK4YqqmZh2ZfhQ7mg+XhM6o9MD1tv5gAY8YJGFnRa4CRAW20wI0TG+
         0mPqmarNt0KTatl3ChNK7h5a+329ifqJM3O9P8HlNIuQBkQj0k6o5gka/X9+6CFNvOP9
         15+Q==
X-Gm-Message-State: APuU4Z8kS7LtuM0sMwydZ9m71Yq7w1Eb2vHlBndn6FnwCImdZwDGN/Q6
	Wd4DSprOlpmk5kYsf4vvB8fos3cXADd/q0Puc3sR3Tzr64nixOzztTuID3gQzY0hyKHVg1DTnmS
	JOPp8hpRyRHpB8HHw8TYXzVEy8olb8IPO0b4hqxCLvUI66Mgz+KaQbhdr++JNeB09oUKER4Tcfx
	T99tvh4mhw+IyISpD/tDI8W//71csitsMje50IEBM=
X-Gm-Gg: AYBFou0NEP9JjJGJs0BczKKU+pZESscjisZkOh3K1CgS7njdpf8rFy7FVMHK1rDMGy0
	pgLpAShUdcGkL/xyu78Xqrtc+XwJ+oHmoDmf7hpAKfjGbTOpYrGLCal4t3mEbK4NoAI38E3ubZj
	VHygRCQB+mZlyRoWyyS9dY4PtEHHb4Tevcg8wcji+P0uKNGr4oZA80ApOTcw==
X-Received: by 2002:a05:690c:6987:b0:8b2:91eb:c0e7 with SMTP id 00721157ae682-8b4aa25cb02mr12149267b3.42.1794566076218;
        Fri, 13 Nov 2026 02:34:36 -0800 (PST)
X-Received: by 2002:a05:690c:6987:b0:8b2:91eb:c0e7 with SMTP id
 00721157ae682-8b4aa25cb02mr12149207b3.42.1794566075784; Fri, 13 Nov 2026
 02:34:35 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
 <20261113-nvmem-byte-mask-for-split-macaddr-v1-2-138f715f18c1@oss.qualcomm.com>
 <sashiko-outbox-212383@kernel.org>
In-Reply-To: <sashiko-outbox-212383@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:34:24 +0800
X-Gm-Features: AclHuK8mFpE9OCaW70KMGFFEizMFRzOLaVCmTd0ClizTeV0yD4-mHfi3SBi2t38
Message-ID: <CAPTcHHRjTHoBA1OLeDA5qQ_xzeoTEfxFePEUycgk28ch=KUE-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] nvmem: core: add byte-mask support for non-contiguous
 cell bytes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _a1t-0sC5OzPxlTJAySgDj8592x7Nf6o
X-Proofpoint-ORIG-GUID: _a1t-0sC5OzPxlTJAySgDj8592x7Nf6o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfXzq/fBY1z6W2b
 U07nSHu1cKGktWmsOLXw3PevoPedYNGcMV1cOmu5Ptl3n7RNUDxoEPjcr74jy1OoQHe1pjOKd0u
 ayQPwW8xFxIDiX+lklt523NsYxC/kQNqcAcl45rEPgBnt3Ft/3d+aSHvqks/s4hEnX8phFYm4mh
 maHzLLdwDvcMlCx+jzbDqseLV/CmOE7+xQk79pqVFtEo1NzccydOuLRF+P/5Jkom6SK1WxE4Dl6
 lhZW8TNjnCNlfJdVZzrkIjMxTLkx76Vg/3VJ/A0SOpI/0BG3UX/2TYSOzADVXm/OLuxU0JPtjkQ
 qd+pZ5uSWZrgmc2JTLkcJ4wdkUaik7e+5NIg4rheAWFkFZSO361Lzyfl8dsPqMeI+NRI0kYE81D
 HcOXRfZrY0n9oM2stLEVjfydbgL23KgYobXauxHnoUFJsHXgTIvT0thDYkM9J2Ul/nT36k2q6bV
 l70Zix0XXxbpV7wTIuQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6e7bd cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=i8XU8SuXwj2VLj9jS7kA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfXwqt+Pan0IANa
 aHaId6iSQP58xZjhPrq2rJzQRUEBw4qMDqUuu9D08Xnelh9wS3BT5OjVUmeHHQPuyiY1R4k4g79
 qSsE8AwWJpD/vERFPMOEdWaF2kcywfs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130042

On Fri, Nov 13, 2026 at 4:07=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] nvmem: core: byte_mask raw_len reads full device and rounds
>   past size
> - [Medium] nvmem: core: byte_mask validation bypassed when nbits is
>   non-zero
> - [Medium] nvmem: core: missing zero-fill of trailing bytes in
>   __nvmem_cell_read()
> --
>
> commit 2da8dac9e0c0313c6b2e42597b707a19ff863b3a
> Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>
> nvmem: core: add byte-mask support for non-contiguous cell bytes
>
> This commit adds support for a byte-mask cell property that selects and p=
acks
> non-contiguous bytes from an NVMEM region into the logical cell value.
>
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index 7d4cce8e27424..6c9994abce39f 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
>
> [ ... ]
>
> > @@ -603,12 +645,19 @@ static int nvmem_cell_info_to_nvmem_cell_entry_no=
dup(struct nvmem_device *nvmem,
> >
> >       cell->bit_offset =3D info->bit_offset;
> >       cell->nbits =3D info->nbits;
> > +     cell->byte_mask =3D info->byte_mask;
> >       cell->np =3D info->np;
> >
> >       if (cell->nbits) {
> >               cell->bytes =3D DIV_ROUND_UP(cell->nbits + cell->bit_offs=
et,
> >                                          BITS_PER_BYTE);
> >               cell->raw_len =3D ALIGN(cell->bytes, nvmem->word_size);
> > +     } else if (cell->byte_mask) {
> > +             int rc =3D nvmem_validate_byte_mask(nvmem, info);
> > +
> > +             if (rc)
> > +                     return rc;
>
> [Severity: Medium]
> Does placing nvmem_validate_byte_mask() in the else-if branch after
> if (cell->nbits) bypass validation when both nbits and byte_mask are set?
>
bits and byte-mask property are mutual-exclusive.

> cell->byte_mask is copied unconditionally above, so if info->nbits is
> non-zero, nvmem_cell_info_to_nvmem_cell_entry_nodup() takes the
> if (cell->nbits) branch and skips nvmem_validate_byte_mask(). In
> nvmem_add_cells_from_dt(), nvmem_validate_byte_mask() runs before
> nvmem->fixup_dt_cell_info(), which can set info.nbits and info.bit_offset=
 and
> adjust info.offset (as qfprom_fixup_dt_cell_info() does when a cell offse=
t is
> not 4-byte aligned) before nvmem_add_one_cell() runs.
>
Will fix this.

> During __nvmem_cell_read(), nvmem_reg_read() then reads into rawbuf while
> nvmem_shift_read_buffer_in_place() shifts the unwritten buf, and the
> byte_mask loop writes hweight32(cell->byte_mask) bytes into buf without
> bounds validation, corrupting the cell data or overflowing buf.
>
> > +             cell->raw_len =3D nvmem->size - cell->offset;
> >       }
>
bits and byte-mask property are mutual-exclusive.

> [Severity: High]
> Can setting cell->raw_len to nvmem->size - cell->offset cause out-of-boun=
ds
> reads past nvmem->size?
>
> Right below this block, nvmem_cell_info_to_nvmem_cell_entry_nodup() align=
s
> cell->raw_len up to nvmem->word_size:
>
> drivers/nvmem/core.c:nvmem_cell_info_to_nvmem_cell_entry_nodup() {
>     ...
>         if (!IS_ALIGNED(cell->raw_len, nvmem->word_size)) {
>                 dev_err(&nvmem->dev,
>                         "cell %s raw len %zd unaligned to nvmem word size=
 %d\n",
>                         cell->name ?: "<unknown>", cell->raw_len,
>                         nvmem->word_size);
>
>                 if (info->raw_len)
>                         return -EINVAL;
>
>                 cell->raw_len =3D ALIGN(cell->raw_len, nvmem->word_size);
>         }
>     ...
> }
>
> When nvmem->size - cell->offset is not a multiple of nvmem->word_size,
> rounding cell->raw_len up makes cell->offset + cell->raw_len exceed
> nvmem->size, causing __nvmem_cell_read() to call nvmem_reg_read() past th=
e
> end of the device.
>
> Even when aligned, setting cell->raw_len to the rest of the device rather
> than the masked span (at most 32 bytes) forces every read to allocate and
> read the entire trailing region, which fails on providers where reading
> protected or unmapped trailing fuse rows returns an error (such as
> sec-qfprom).
>
Will fix this by just read fls(mask) bytes to avoid reading over-bound.

> [ ... ]
>
> > @@ -1648,28 +1708,51 @@ static int __nvmem_cell_read(struct nvmem_devic=
e *nvmem,
> >                            struct nvmem_cell_entry *cell,
> >                            void *buf, size_t *len, const char *id, int =
index)
> >  {
> > +     u8 *rawbuf =3D NULL;
> > +     void *readbuf =3D buf;
> >       int rc;
> >
> > -     rc =3D nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
> > +     if (cell->byte_mask) {
> > +             rawbuf =3D kzalloc(cell->raw_len, GFP_KERNEL);
> > +             if (!rawbuf)
> > +                     return -ENOMEM;
> > +             readbuf =3D rawbuf;
> > +     }
> > +
> > +     rc =3D nvmem_reg_read(nvmem, cell->offset, readbuf, cell->raw_len=
);
> >
> >       if (rc)
> > -             return rc;
> > +             goto err_exit;
> >
> >       /* shift bits in-place */
> >       if (cell->bit_offset || cell->nbits)
> >               nvmem_shift_read_buffer_in_place(cell, buf);
> >
> > +     /* compact non-contiguous bytes selected by byte_mask */
> > +     if (cell->byte_mask) {
> > +             int out_idx =3D 0;
> > +             int i;
> > +
> > +             for (i =3D 0; i < cell->raw_len && i < 32; i++) {
> > +                     if (cell->byte_mask & BIT(i))
> > +                             ((u8 *)buf)[out_idx++] =3D rawbuf[i];
> > +             }
> > +     }
>
> [Severity: Medium]
> When hweight32(cell->byte_mask) is smaller than cell->bytes, does this le=
ave
> the trailing bytes in buf uninitialized instead of zero-filling them?
>
> Because nvmem_reg_read() reads into rawbuf, buf is only written up to
> out_idx. Callers such as nvmem_device_cell_read() pass a caller-supplied
> buffer directly into __nvmem_cell_read() without pre-zeroing it and retur=
n
> cell->bytes, leaving stale or uninitialized memory in
> buf[out_idx .. cell->bytes - 1] for both cell->read_post_process() and th=
e
> caller.
>
Will fix this by memset the [out_idx..cell->bytes-1].

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-nvmem-by=
te-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com?part=3D2

pw-bot: cr

Regards,
Hongmei Xu
