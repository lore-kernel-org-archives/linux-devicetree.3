Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A81338236A
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778335578; cv=pass; b=lXhpq+0Cbc6Ko5+Zc8y9pxjttq4xJi1E6Zqo+hqwkGHEWpfQLUyPKohFm3rAu1togSdEpesy86UboI5D2MT4HjpVjAibDeXmLzd8JGJsI1vHVH7u+8HtbB0VAT+D3Oa1cee21y/kCvMw0wC6b4NVroghj3edHt2WOyj3dldLSDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778335578; c=relaxed/simple;
	bh=d82eHsAGq0jz+6V9fpRKfZf4hdPG1JWXvV7+orIeksU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7Abjlhlb6LuRKkrpBUsIO8A/UwR0yFHHg5tmEmICmEjPAN91+mBFSqALTKGruRzBiec2xcgqWfpwVJgcXSzPtRYUTJnexeX/rbG/PR9pd75GP1tQLhBeMMECdfd7vVBVZbMXCj70GxBL2NobA559ORzTrLKK2BrXKpY2rkZw2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4d1snzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nb7Ue4JE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4d1snzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nb7Ue4JE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6493lWbE2821617
	for <devicetree@vger.kernel.org>; Sat, 9 May 2026 14:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GmFpJg0jVZ1QULgW+Nd8ipkGUZ3pKnDpl1tXXyblfL0=; b=P4d1snzjFgR6uVEm
	lzZfI6h2jpZbuBGZRRPXRdVW17kt5NfODrNc0w6504QiaDj0WSFNfRnUSv657h9U
	sJ1QO7s3llUrKagIewwtfE3IVVtH3Ok/Z6RKcJ+9WLhrHBrN54j/2L1G7QKWNmit
	gh7eRbiPWRWKSitHrL2vYZJuKx9xzs/jpTuPflSKp8FKe79GqCAHQRvVGPi/IbJ2
	WYTRQTm2r91EPXcmUVhx5RHGoG52ypVIF75CkpSxTYPgL0m1V6oB4Hc5mGFZgwHy
	E1z2DEY3uBBgfh8nduZvhkHM8IEGZ2fkY+LVQ9yzwIrDn3OPeUt3YnQkuvlQAZML
	WOxYvw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wa9914n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 09 May 2026 14:06:15 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-696906dddbbso3184155eaf.2
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 07:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778335574; cv=none;
        d=google.com; s=arc-20240605;
        b=l0OcNWMM6mp1PBn95SStbypddf+tvBT/5Hvt1Z3deORCe7+y0v+Me9GErDtxGhu5Cz
         KMH4fLwi9U0S3hVczlLo9uIaZURvl217CQuXp+X+mXvB1YWEmNPkkjTgXilZCyItEI44
         YjVqKiaKwBhf5HViLKOqnS6Slh+uMleUMbwKcAm3EVA52sBlBQ6OiGD9L3QiN8e6FZw+
         N6j2spsJqKECQ1nwu8Qt/Im/OO7ooyBsIuCe77IrIiwDiVz5ycydYKhpm7Z5e18WoGXS
         D1/hwY+zE7JrQfxaDd53Nx3995eqY8CRA4EGPO2eSKiWMHORwQN3sQCVXrLFpe6JGlRP
         hQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GmFpJg0jVZ1QULgW+Nd8ipkGUZ3pKnDpl1tXXyblfL0=;
        fh=4XwkeTysqukyGWepOx4oeBgSFP/pXZ557IJCBziuMzM=;
        b=QTIBVsGVs2icylisZ3svhTqSs8DSgfD4ZOfUsv6E7pqbddptTSGktEKr0FVyUIfzUq
         v45PuBttYfOCPL0DvQx37JuiV/Ni627vg/hdI5OkHrk6kon0PdUU3bj20PLM3iYGuY0Q
         Pilams0WtV8peHUbE32JuK/GQkIdkIhWXq9CBHlS1GyrKBouuzeBxawHN63D37BR3J7x
         gHzXDqjRbH2te37ZZhcTnY9NeyQ6XMgceVHTpzC9GPRCYsFV8FGDrrvehaTpyzBxEgn7
         h8Jv/ry/r7K3iCVw0CAGKzVZXl/cGrYcZdOKdSNi7zqoqgOXO1jtunIP5nyhYnvusqoV
         8Acw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778335574; x=1778940374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmFpJg0jVZ1QULgW+Nd8ipkGUZ3pKnDpl1tXXyblfL0=;
        b=Nb7Ue4JEWhova8C0JLVZxmBKPV9E3uOZymYvqOzifL/VIAb08j+FtiwvtP6vYkdLAZ
         EQel2CaGHhn5hgxf6ztDFP7x27ZE242y7GqqAEt4JNAGcIj3sJeSVqWfh86235DCe4b7
         uRTCzVkifwd+c3p4WLfG3486fxZ3kXuzHWVbHFskMbJ8om4RL3Ivlnq84S6BFOi70xnH
         SRhU3XpuJCsK2EpidJ6NTd1vPmgGyJbk2kpk8x6Fi7OaHmUJML2aHPoL7jw0Y1VnURt1
         uqu48B6Uj+WoC2WYn/WFasQM+smyRt2QL874w9Z8op513B001ocCUmgF5es/NIVmkCio
         7/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778335574; x=1778940374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GmFpJg0jVZ1QULgW+Nd8ipkGUZ3pKnDpl1tXXyblfL0=;
        b=lDZdgHGmpfioqdL+qYY4KxzrVpmtXtlzgzpP/wxTY4U9nj8N4urYRuuFImdhPJE1Bv
         5QDKdusjvjwM6WmpqhoNviwR+qJZRxn7Xlp+ztXTesPhi7OICY97Dkm2fQu89xX8jdK5
         SK6vpHuCHO4L7oJlJ4MfZQKX6IGZ50op5OyQmc3Up8vZZNlcN4jIUFl5TNO4vS6eeQ1u
         mG+3ZNzkfDiZWumg05KfEn/0gE7OngRVPG/bIA75V7Ue0CClrlHg6bro8I66BG8jfiEf
         Zso95dFCP6LCgEiImVtdyhkGqnstS6wbE8dBV6uImDrHLjg+fXptF7FoWH2zHNOyrloA
         xCxA==
X-Forwarded-Encrypted: i=1; AFNElJ9JsUoKEzjVZ1Fep+TI2JwydNjNt+77Nf3bvJK4ZJA5jiRh7qISl77OtV42szD191UNkxInOyG88CI3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7xBIgw18hmd7L75F9EzW2Io5YBl3mun/67ieXNx7S54Yl/xKP
	/UczNSjvaRN1nABqqQ7Q2xAzEFGHK/1SYwT4kBIkBFYqOUKZrJ5jSohZwKh2iMi+E4ZDRfYywZU
	W3yfRhTgNKbgXm3NG4VqUi+MY2vhLzAsyeIW7oib/Ny802lPayiln8gP9D1mo08Yl0TO6S/gCUw
	WhQ+r1C4ePfG6D5TAPxXtNB9VzCpdRtfpTEwOV108=
X-Gm-Gg: Acq92OEmxerKfVhFT4ZxAoiUPrsodYmjfN/TviTRBzaE4uJ0Dv/uZi4RAzHyXSNFKdt
	kgO+aKovq1DEC2KRZs8aayZ3Z2HxaTIKjiHc5QE0rfoFrIV5q2lJslf2jh8M0aYrJeHkK+oHjjL
	auG3C0e8WSO6NlH0b9NUccCbBL+dLkJjFMFo/XqOH4OKEuEkWBLlMV+M78EkBmanCPOTC8UaZXA
	ZP3x0SO2Il4QhaN8guIkfveiGovfnvsPMQ87oi8i4Cv8YlUI/0=
X-Received: by 2002:a05:6820:220d:b0:692:6030:1189 with SMTP id 006d021491bc7-69998d46f82mr8589333eaf.45.1778335574383;
        Sat, 09 May 2026 07:06:14 -0700 (PDT)
X-Received: by 2002:a05:6820:220d:b0:692:6030:1189 with SMTP id
 006d021491bc7-69998d46f82mr8589306eaf.45.1778335573857; Sat, 09 May 2026
 07:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <_M7wAThdPN69377jGZSjtTkw52TQVFLRr2noYJinHH3dhvPAQhP_1OfeGBltDz3bYydN737y5AbI7GBdn-qh9w==@protonmail.internalid>
 <20260508-camss-isp-ope-v3-12-bb1055274603@oss.qualcomm.com> <c6e3237e-7752-4768-9cdf-3f3e89c1b98c@kernel.org>
In-Reply-To: <c6e3237e-7752-4768-9cdf-3f3e89c1b98c@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 9 May 2026 16:06:02 +0200
X-Gm-Features: AVHnY4J70b8rreUf53ZPQ1btVtLptf9VOdg9xnwFOSS7XqprQ5wuTie1UnHzY7o
Message-ID: <CAFEp6-1gEcW+02ndhNLhEZU2iXHuc7dqG4b72zccGyn_PUek2Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] media: uapi: Add CAMSS ISP configuration definition
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE1MyBTYWx0ZWRfX+V1a+CS1rxEO
 TTTekqPHYgbXl664sThZD8mmZYlJ1jHvLQ3XdYre1KBMmGwCNVAuO+5yss/BpB78ygdt5ildNO+
 D/CruULPxVWXVhoisCb9roxy+4fFfCjgo7M6A9N3Ey1EPVzviuXZVfBtJJAtM8ouGCNJU5noCzh
 utGqCWAVJTR8vnLuYxdbtWzD20SQ+xBZIkyGAdVC4XHj2uwAx9bqlTMSjg1UdcnNzl2njndNdhB
 PH1soOE4RQdAn3+q5cCihhAmuBqYImS1BVjOsjYoESgI4XP2AY97/L3bQ5HVJkJNGDBLtyflWuv
 VnagfYV88pNytAyG797y96PVB9QQ2e82ZgWE4xo45HU9s2tqMcs/FCyLQdmTiwgE3R6uEdwOdkA
 DPF/H7YSdhMrDsRbatYFDQ+eITMVwHhH6v48FytK+zHCKL7UDXGM/vOU9EItaVdUWsPYe0EAtkr
 v3JykugvMX1gzldwpGg==
X-Authority-Analysis: v=2.4 cv=HO7z0Itv c=1 sm=1 tr=0 ts=69ff3f57 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ye9SYaDBai-Dv3Fos4IA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: IlrydNnn55uUidIXT-QwP0-fc_fhqcN3
X-Proofpoint-ORIG-GUID: IlrydNnn55uUidIXT-QwP0-fc_fhqcN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090153

Hi Bryan,

On Fri, May 8, 2026 at 11:19=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 07/05/2026 23:49, Loic Poulain wrote:
> > Add the uapi header camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   include/uapi/linux/camss-config.h | 115 +++++++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 115 insertions(+)
> >
> > diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/cam=
ss-config.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..665406969e66927e8bce83a=
faa9a3aae53ba2803
> > --- /dev/null
> > +++ b/include/uapi/linux/camss-config.h
> > @@ -0,0 +1,115 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > +/*
> > + * Qualcomm CAMSS ISP parameters UAPI
> > + *
> > + * Uses the generic V4L2 extensible ISP parameters buffer format defin=
ed in
> > + * <uapi/linux/media/v4l2-isp.h>.
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef _UAPI_LINUX_CAMSS_CONFIG_H
> > +#define _UAPI_LINUX_CAMSS_CONFIG_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/media/v4l2-isp.h>
> > +/**
> > + * enum camss_params_block_type - CAMSS ISP parameter block identifier=
s
> > + *
> > + * Each value identifies one ISP processing block.  The value is place=
d in
> > + * the @type field of &struct v4l2_isp_params_block_header.
> > + */
> > +enum camss_params_block_type {
> > +     CAMSS_PARAMS_WB_GAIN =3D 1,
> > +     CAMSS_PARAMS_CHROMA_ENHAN =3D 2,
> > +     CAMSS_PARAMS_COLOR_CORRECT =3D 3,
> > +     CAMSS_PARAMS_MAX,
> > +};
> > +
> > +/**
> > + * struct camss_params_wb_gain - White Balance gains
> > + *
> > + * @header:   generic block header; @header.type =3D CAMSS_PARAMS_WB_G=
AIN
> > + * @g_gain:   green channel gain (15uQ10)
> > + * @b_gain:   blue channel gain (15uQ10)
> > + * @r_gain:   red channel gain (15uQ10)
> > + */
> > +struct camss_params_wb_gain {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 g_gain;
> > +     __u16 b_gain;
> > +     __u16 r_gain;
> > +     __u16 _pad;
> > +} __aligned(8);
> > +
> > +/**
> > + * struct camss_params_chroma_enhan - RGB to YUV colour matrix
> > + *
> > + * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients a=
re
> > + * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
> > + *
> > + * Luma (Y) row of the matrix:
> > + * @luma_v0:  R-to-Y coefficient (12sQ8, e.g. 0x04d =3D 0.299)
> > + * @luma_v1:  G-to-Y coefficient (12sQ8, e.g. 0x096 =3D 0.587)
> > + * @luma_v2:  B-to-Y coefficient (12sQ8, e.g. 0x01d =3D 0.114)
> > + * @luma_k:   Y output offset    (9s,  0 =3D no offset)
> > + *
> > + * Chroma (Cb) row:
> > + * @coeff_ap: Cb positive coefficient (12sQ8, e.g. 0x0e6 =3D  0.886)
> > + * @coeff_am: Cb negative coefficient (12sQ8, e.g. 0xfb3 =3D -0.338)
> > + * @kcb:      Cb output offset        (11s,   128 =3D +128)
> > + *
> > + * Chroma (Cr) row:
> > + * @coeff_cp: Cr positive coefficient (12sQ8, e.g. 0x0b3 =3D  0.701)
> > + * @coeff_cm: Cr negative coefficient (12sQ8, e.g. 0xfe3 =3D -0.114)
> > + * @coeff_dp: Cr positive coefficient (12sQ8)
> > + * @coeff_dm: Cr negative coefficient (12sQ8)
> > + * @kcr:      Cr output offset        (11s,   128 =3D +128)
> > + *
> > + * @header: generic block header; @header.type =3D CAMSS_PARAMS_CHROMA=
_ENHAN
> > + */
> > +struct camss_params_chroma_enhan {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 luma_v0;
> > +     __u16 luma_v1;
> > +     __u16 luma_v2;
> > +     __u16 luma_k;
> > +     __u16 coeff_ap;
> > +     __u16 coeff_am;
> > +     __u16 coeff_cp;
> > +     __u16 coeff_cm;
> > +     __u16 coeff_dp;
> > +     __u16 coeff_dm;
> > +     __u16 kcb;
> > +     __u16 kcr;
> > +} __aligned(8);
> > +
> > +/**
> > + * struct camss_params_color_correct - colour correction matrix
> > + *
> > + * signed 12-bit fixed-point (Qm)
> > + *
> > + * Out_ch0 (g) =3D A0*G+B0*B+C0*R + K0
> > + * Out_ch1 (b) =3D A1*G+B1*B+C1*R + K1
> > + * Out_ch2 (r) =3D A2*G+B2*B+C2*R + K2
> > + *
> > + * m =3D 0x0 - Coefficients are signed 12sQ7 numbers
> > + * m =3D 0x1 - Coefficients are signed 12sQ8 numbers
> > + * m =3D 0x2 - Coefficients are signed 12sQ9 numbers
> > + * m =3D 0x3 - Coefficients are signed 12sQ10 numbers
> > + */
> > +struct camss_params_color_correct {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 a[3];
> > +     __u16 b[3];
> > +     __u16 c[3];
> > +     __u16 k[3];
> > +     __u16 m;
> > +} __aligned(8);
> > +
> > +#define CAMSS_PARAMS_MAX_PAYLOAD             \
> > +     (sizeof(struct camss_params_wb_gain)    +\
> > +      sizeof(struct camss_params_chroma_enhan)       +\
> > +      sizeof(struct camss_params_color_correct))
> > +
> > +#endif /* _UAPI_LINUX_CAMSS_CONFIG_H */
> >
> > --
> > 2.34.1
> >
>
> I think this should instead be the comprehensive list from HFI I
> published recently.
>
> There's no point in circumscribing it and HFI is way more widely
> available than OPE - so if there are adaptations to be done it should be
> on the OPE side not the HFI/IPE side.

Thanks a lot for pointing this out. Here=E2=80=99s what I plan to do in the
next version, please let me know if this raises any concerns:

- params_wb_gain: I will align this with your version by adding the
missing fields (G/B/R offsets).
On OPE, gains are expressed as 15uQ10, while the HFI uses 12uQ10.
Given the wider integer range in OPE, I=E2=80=99m not sure the full range i=
s
actually needed. Would it be acceptable to keep the extended range
even if it may not be fully used by the HFI, or should we restrict it
to match the HFI limits?

- camss_params_color_correct: This can be fully aligned with your
proposed version.

- camss_params_chroma_enhan: This corresponds to color space
conversion (RGB to YUV). I don=E2=80=99t see an equivalent in the HFI-based
proposal, so I plan to keep the current implementation, while
restructuring it (e.g., using vectors/matrices) to better match the
style of the other parameter blocks.

Regards,
Loic
