Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794894075;
	b=D5sY8RQwb7YRTUMgffrjH+Lo8v3jsoDyCpfb1bjLp9GXXlQXS5MSZvVRglfoagJmvQi9
	 6kVW97JKRanq+2/T2t8ePgoGQqeF824SO+p5yAR34T3L5QwqkdJJ2/3zcYJVmv0AAL8K5
	 J8ZxOL9Xk4DS8aqN8ZIDFyA0xtpXqZDVSuSjZpR7dpFlx06MuQ87QHKPhJ4+UovJaKcD+
	 xrPxqD6M6TJ/syYKytahwCt0A+yzOYY/ht2F7VWgd1Ah0+q3wGCsG2b7OuCERT4lzrHsy
	 TpdH+ZvJMOX2ZqR3BI5qUZGZFOpYmnesSOjyg01m3Tv5sGYCUVlHrqwbdwSF/CZ92Ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CWsw73b2Vq6u6SCVqNGoE54KH8eOIZ27G7///Mxj4FY=;
	b=2+8lL7QXkTm5FP5PZTANHG16gBTpMsEs/26VcfpT6YNAF02d6gRmUdzULde8f3bFuxyR
	 Ro3GyWTb9pj9eZEdmdR1tbMPlSra+KhmnOeUxlhoiSbKypcQGKr938XBVpKrsgAgHceW5
	 lHOclPPg4DC6FJq6jNggIBaWVno/pGc1j0Rs/55Tq3jqNERwwUCW52mAjDQ9NS0fagpmY
	 h6mPRY2SJxGEWrVcMY0OoDzrkUDFeRmbu8WznM8fzVoN4Mo1osY7fnaGeuojVgz5hxIov
	 KBDDme4Rdm1PqNho/rurfAv21WDEal81U/yXLVAYdpKd3YfJiOAB3G47cyVYsBmtnaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WqCU53mP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PA4P344P;
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59A1606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E59A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WqCU53mP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PA4P344P
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH535DJ3458009
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWsw73b2Vq6u6SCVqNGoE54KH8eOIZ27G7///Mxj4FY=; b=WqCU53mPdkkWqhjT
	woI14OTwgjQJhQTcJHcsuuGPif6RHEj6xgCMnbS6Cokmnxk86I2C9chL1EmsZgeR
	CLYtKnNKyfhjCOvdsj0l384aOccYBOhNEj/tY633PxqVM6rAUfj0bXZJVuFZURtQ
	y/FsUutng1h/+eyNTmoDqtzG5Slan6D+ybndsm0QFraFuekIZFFIeN2SW8poF+9q
	yKbXd27+1LabZPl5otUk1XmE+SRihZLyflfmOUDxtZ0oBXT2hxSVWf4jCfpVAsM6
	kWsIt/GhVU0hzvzvG+6pi/Pb3zD2ku77WCL590xu11Etsy/P0iPn3DW6xHLyieZ/
	xXkU+A==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh849h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:41:13 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0e4c2f052so67897227b3.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794894073; cv=none;
        d=google.com; s=arc-20260327;
        b=RveDgn3Rzou75zuJfNtb7Aw9JwOw0FtTzVjeQ1vvLTwsg5OgD/addpkMTGtu6L641e
         wNXvhrW2EJ1BnbSvj7j83w8e2SA7stZf9rGb5CzIaISyL7ZhTJTSjvqmEV6hfLpItcox
         PvHPZDaSIy+1LVBiKsziN/5zVSiRpsk7sEJl4zLcWgWfylxR5VCjB696oeaqMxHOj8h3
         rQKZ48lcBFBGQ31/1vlPpCkTfnHOH9FYPP2CwhJ07bVDZKluzSfYNkoYukBe4QT+fvK8
         RYAC0FVvKEcOQgoIsmvSdsNO4qB78kgRIRtqF2pLw1sQt77lIBI8lRGu1RCDXNafYanx
         sCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CWsw73b2Vq6u6SCVqNGoE54KH8eOIZ27G7///Mxj4FY=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=NvMgAePx/LX1jJ4Wh+byaVthHeIQwmf0EFrcTsFw/NaGDBFHt46bllxKMheNLg+nBR
         nl1NNBbgQrt6SD2MJwNMXYO2eMgYqs48bTC967S3AYAc9yr7QEVeAg9zM01GVrs4V1+N
         I2G8Y7VLxf+N7pppJPIHf3vah1OChGx7aXUh7I3Nf37qkb21g0e2W3sl4j4URoqUgtBH
         auUOa9tM8zAaUwxE+9hdO3vDMseimnh753jJDXVxLfVZS8aQvHwdEnGRgBE4uCEBY5Z6
         U0yPA+pj4gVmw1zlL2sHP6PlHL8hfu6zs+/R879dBicHQORvaFT0SC3m62ZPKeg+gJGK
         7ybg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794894073; x=1795498873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CWsw73b2Vq6u6SCVqNGoE54KH8eOIZ27G7///Mxj4FY=;
        b=PA4P344Pfsx7J6pNdl6nVf8bLcbvqIpSYZN+Sw/IvgD6X04x1OAEPUlULIGtBCUuX4
         +W0gYGOWK9zaBvIDMxQOJ4oIoZ0ppaajOxPEXQE6JJbu7HySOIj67qXGuQWTJ95Gt9kD
         E0dhOvLcnopg+4CPsSwOw9q+N2FYK1rzqaGIL8E4Nc3lINC0M8tlilc47LSjzzr5cdhJ
         Cnz1gPYc48UYwRWFNrs4SXeJuq4RbYYelpIxrgTGr7BEDhLpcIAXmiNBJoxQY7WjHKo/
         Aiy/OCKGZslo41XY4MjrCtzB8sFjdvb0hGfyoEGvAr/wBZbvkF8wmzeLLOJ0kUx940eF
         Pp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794894073; x=1795498873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWsw73b2Vq6u6SCVqNGoE54KH8eOIZ27G7///Mxj4FY=;
        b=1KGJmxmTsmfTlTv9g4jlK9JvB1LatFUN2N4XskeVv5enBwfMiI5V9p+MagFSskHs0g
         RHTHBetTUxqcvNC0P1j7A3okyyuMqw7mdsELAdNPmL4+beijbWs0G/Z8goM9NJ65ZrHt
         FUhnlNp9wwJKSrUcGg82NbOFrJTtgoEd3Q/Ox1tIRCHJAtWtYg0qZCBI1yfBkm7uRTfA
         rp/6S0Phle3SVzwX5mla8c8CTyF4AOLuUZoMezi1b9QzTQLzaCPxTeWDMObQK6w98dEb
         w2cDBhm7LS0ZPTjWzYUVMjteU0ApyW++NrSPmh5ps8x81YymI+hCOYHVy/plBCzJzrLJ
         a6bA==
X-Gm-Message-State: APuU4Z+NoBKuDzzbU/BZAjOWWIX3F9h/oSHONvDB9pcel218n5fV9uWH
	W028145YoF+MpRlshE1mI/cBEZ3U+jLxipaR9KZwFtywSzIyrM3rkNguG6e0G0Hs4tFijAhn+1O
	lQTiDvgNLz0nyZ5pApyyygYsSfUQAkmTkYpnlz31/60g/T+eW5A6mjc6bFagJ2ReSjcBA8nS7xG
	Sv9OqNNm0adzEmCZID/hwurs7M4AcOR1IxH+xsVRA=
X-Gm-Gg: AZFdTZddKZMZ86+pbbhCJKRQmNbLv2nfywk++UqTNdZ++dk07lkjpCmN4k7fWyVcYQm
	D1URL56WMNixjb97a1oTLmICiQLw2Qok9m4keKxK46Ak2ogogR2Wy4IZ8WJ0GHVl7rGhj0gKkdX
	cq09b7mmJxpistng8ZcM/NwpTk6Wntqsc79O89WPM1Uqilva8mrmb4Bu5gqw==
X-Received: by 2002:a05:690c:e286:10b0:8b1:88ad:1fce with SMTP id 00721157ae682-8b4aa299ee7mr45418357b3.42.1794894073269;
        Mon, 16 Nov 2026 21:41:13 -0800 (PST)
X-Received: by 2002:a05:690c:e286:10b0:8b1:88ad:1fce with SMTP id
 00721157ae682-8b4aa299ee7mr45418327b3.42.1794894072911; Mon, 16 Nov 2026
 21:41:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
 <20261116-nvmem-byte-mask-for-split-macaddr-v2-2-96f4a0c08264@oss.qualcomm.com>
 <sashiko-outbox-216112@kernel.org>
In-Reply-To: <sashiko-outbox-216112@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:41:01 +0800
X-Gm-Features: Aa3M54rkrvooSZ5Y2vrydJgYIgHCwWEjMMkKuuek57KX8x5EuwkLlmYvXurjn9I
Message-ID: <CAPTcHHQq3X=DcJY_NtABvrw3PUhsps0X_DH4PjfK7Cq9ExcphA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvmem: core: add byte-mask support for
 non-contiguous cell bytes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: JrHfdICWaoMKEJmO3XFqyzYKtyioixEc
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afbe8f9 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=-ABapGnYS2MAUWs00tMA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: JrHfdICWaoMKEJmO3XFqyzYKtyioixEc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMiBTYWx0ZWRfX8k1Ogy4k0JND
 BRHf4Li4pptpgtTyCuP2d1B5C/k9MIUqIR0XpnQ8+wzMVJYkhf2RGJobQaSA4DH/r9PwiVhP8zK
 7zoVBwXrZ5zb+88lUp85EZI1IjUi0ZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMiBTYWx0ZWRfXxYtNs7sERPWa
 wrmYX1TNwEF+/Lmb+S7KWfjGroMuIIeABkgQDKe0OT5cFlgilRNfepagCYME6LmaLFTy2/Ex1me
 gMCpU3XRji3l/tXz2nLpgfpEKqSZagAS5O5IWuN0D4EOhZlRRKIi6woSdkTq/eAPm4s8Lx8/Ero
 iZPx/y6j0zuKG64wUqnZ45wgOJXimwupROkc3p+xKj0a0O7VxsY2i1CkA0B2YYhbLT5chh+VPRc
 SSMjmRxf9NAN7muqjehkdtdmcsg9O07+ip1APiJbSATqnQXDYvnCg7t9058S3tvPGZTqRsABrld
 epoWDiAokUcOA6ZQ7jSk5u4WlHWH7S3GXAQaxGgATVeWUPHGDIPKJRaHyQu6QtCnZgn60/X8Om0
 u/CrCLnwHtmeNacGYhsgNC9zxSVmF/pgBgnhJ4B22YWUgY3ia4+lHo1xsmOxmcnTT9XBKI9NB/y
 ifJRpf6GCd3bzLN4dOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170022

>
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index 7d4cce8e27424..7e96b84bc4e28 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> [ ... ]
> > @@ -603,12 +645,22 @@ static int nvmem_cell_info_to_nvmem_cell_entry_no=
dup(struct nvmem_device *nvmem,
> >
> >       cell->bit_offset =3D info->bit_offset;
> >       cell->nbits =3D info->nbits;
> > +     cell->byte_mask =3D info->byte_mask;
> >       cell->np =3D info->np;
> >
> > +     if (cell->byte_mask) {
> > +             int rc =3D nvmem_validate_byte_mask(nvmem, info);
> > +
> > +             if (rc)
> > +                     return rc;
> > +     }
> > +
> >       if (cell->nbits) {
> >               cell->bytes =3D DIV_ROUND_UP(cell->nbits + cell->bit_offs=
et,
> >                                          BITS_PER_BYTE);
> >               cell->raw_len =3D ALIGN(cell->bytes, nvmem->word_size);
> > +     } else if (cell->byte_mask) {
> > +             cell->raw_len =3D fls(info->byte_mask);
> >       }
>
> [Severity: Medium]
> Should cell->raw_len be aligned to nvmem->word_size here, as the
> cell->nbits branch and nvmem_validate_byte_mask() do?
>
> Leaving cell->raw_len as fls(info->byte_mask) triggers the
> !IS_ALIGNED(cell->raw_len, nvmem->word_size) check just below whenever
> nvmem->word_size > 1 and fls(info->byte_mask) is not a multiple of
> word_size:
yes, this is a real issue, it will left a misleading log like "cell
eth0-mac raw len 7 unaligned to nvmem word size 4".
And if fixup_dt_cell_info callback set the info->raw_len=EF=BC=8C it will
return EINVAL directly.
Should fix it:  cell->raw_len =3D ALIGN(fls(info->byte_mask), nvmem->word_s=
ize);
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
> }
>
> That logs a false error and, if info->raw_len was set (for example by a
> fixup_dt_cell_info callback), fails cell registration with -EINVAL.
>
yes, this is true, need to apply the above fix.


> [ ... ]
>
> > @@ -829,16 +881,27 @@ int nvmem_add_cells_from_dt(struct nvmem_device *=
nvmem, struct device_node *np)
> [ ... ]
> > +             of_property_read_u32(child, "byte-mask", &info.byte_mask)=
;
> > +
> >               info.np =3D of_node_get(child);
> >
> >               if (nvmem->fixup_dt_cell_info)
> >                       nvmem->fixup_dt_cell_info(nvmem, &info);
> >
> > +             if (info.byte_mask) {
> > +                     ret =3D nvmem_validate_byte_mask(nvmem, &info);
> > +                     if (ret)
> > +                             goto err_free_name;
> > +             }
> > +
> >               ret =3D nvmem_add_one_cell(nvmem, &info);
>
> [Severity: Low]
> This isn't a bug, but nvmem_add_one_cell() ->
> nvmem_cell_info_to_nvmem_cell_entry() ->
> nvmem_cell_info_to_nvmem_cell_entry_nodup() already calls
> nvmem_validate_byte_mask(nvmem, &info), so this check in
> nvmem_add_cells_from_dt() is redundant.
>
Yes, better to delete redundant calling to keep changes clean.

pw-bot: cr

Regards,
Hongmei Xu
