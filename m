Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793822432;
	b=iiA9o2uqlaqkNdayNW35/dZQKlvfZT8mnmmp71YRCUL+cGSK90fmEbosyFZa1cZR1FYP
	 QW+5goN0pnD2vOShBGFQnsc1F0Tnn5ST9uoW7/pAKjOdwRQUSgGH+S+60C+0wbk/GcUhc
	 y1lIMww320nZH6m1U1J4L+u/oY8dguq39zJerO4Bn0JVwgbsYyJXQx9vQnefShtMQufHw
	 VT1V5+bDdonfZRABvRmkogu8qLJFuIpwITdTdl9B2o1hD4wDu9XmQliaNCbnWKFnDDxNp
	 hqftVMvNL9SrzOIO9NFtje4hecin5eOLG+PlJGPEf0mEpWL2HgcuTDdxmgZkWuFcnQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
	b=GJM//PHxN02g4Hj1hz5v34rf2Kv/kjBLlNzIDWpTV+2V4Kaksp2gH+dehk20h2+ahnN4
	 gmx7ZnBi0cU8bj1fev07xkAg4xh0fjKC+cQeNZYkbJOqJjT/VcDFQcVWSuEEIOj8uoQEy
	 XcxdydSmRtHbI9Z53Gt53IcJpkXa8Ejk16yn8tIAFghUHo+IeXttLspJQ8hBNWQf70FUa
	 ZJJoivYQu0oU8uG7M1hXGl/rJkujxeloTPJ4t6n44Lz2R4sSjkdpPlET1KnHK2YcHPf/l
	 hP4gNowEHqZ/kVGdMcQjVsYQS3yYv20N0cIhg2bkEzb6yY1mVRQV4IVOkmi2Q9qm83g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS6L0nCV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOGXj8eA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC227606E804
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 20:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC227606E804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS6L0nCV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOGXj8eA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fik333272712
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 20:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=; b=iS6L0nCVeV1D+aJw
	3qBT1y6cbxTEKXlvzCaWTv0EXABqsQeU8uIJPgQyUTx5G1rjJE5FjpV/6r67W+YJ
	rG8tih0dXx2e8dDa38nx9+6TEkbV1ITN+xIBBhJElVj5rjvz6I5plV2tL0u65qtU
	rFWvV5fBkNENIX7uyj2xUu2FlCOMoT72yUOcAWmNorLtPJm6rIAnJ4TOajEoxjk9
	ztd+hd5HGb8mzWXk4eM0RrUMsBe7Rt/TG+/8ZzhMbVnnJh/tVD8LwHxmi0rq6fS9
	E3iVRCctZNV0gwz9KrCalZWk8LmWqDu6gj80RcgKc4+Q1xO2lNa9jPWK2CwRTlHZ
	78QNsA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnhf9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 20:00:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9440b27c1feso235074385a.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:00:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793822430; cv=none;
        d=google.com; s=arc-20260327;
        b=V+rtKnk6JqpDt+MMmY0uny3X6p4pAt/Hljn6ljBkAgt9tlQDJEuoQsb2q0Q6yU83KA
         ix+XxPZCpjb8IjHfnJBqFlaVdSOIRnXrvB0QQ5G0MiXFayHVnZhgX26zJOiT0wICh1K6
         Tl4GRozv8x5qD2s+zZ4wbKRuPedj936TkyJI8hPCl3nkrwA8MY9QaPGGBQsG7SZ4ICOs
         kba7TgQL7YGK+jS8/sBHAqwvI9USmLAjuNr4y3IqE5hAZcAcMy8OD8NUm1ByvMMy2yRJ
         mkO8NLtB5AWWs2sIkTXCimu4KusQ/kqFTcqMJrSJIR575q+VfMthyhM3OR7IR4jIxU7n
         Nn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
        fh=2zV1JwslTS7SE69lyy2/19jRRPqhw8yq+JocE+dE4U4=;
        b=ncg4XBElKvl+PNwdGvEaYhFLqhQy10w8d96RZYsdmyPe5elxkY3FaJAJjj9NgOWhP0
         8ZPPrXsA1BhzyIajhNZgvJbI5M2LGAy8rB1o3kHSPfeebwifrw/2a4pUPFRdmKAmVMLJ
         VNYL786c3QXjApVx8LqU9g+1pe+gMFUHHp+n22U/2XmGte4ZNbZTEarZYj+I3GGa+Fv4
         leOfOZcN7MmIcaxcyD8Lyy5DgHnOVdLR4oBs3sl93qlt6IHiSLxpcaPYg3XmtC5Rh+ih
         WLl0QU2k9WFcojvCFb3eWBGW5P2u3PPO8Ss6vDw6ucdLcU8Z5r0oWemLHG4uZRaHOzMq
         zm7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793822430; x=1794427230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
        b=gOGXj8eAdcPZpMAVc3Y/x51EpDone1PJFXGzCiCISikFvOF60XawM3MrxChQmUFSAU
         izdACXjrTqwlJXkrJxR8LaoF9jz1bbp7/JDdoMVd6ioVghsLsiXnIobWyFJVEPasI01U
         xPnKuXxOj1YOW8h1pn6Yc6d2UPohZNFO3d04IcporWso+Qu5ZdWjqmEJ6EfNLIEuVxvm
         GKN+eMcpPRvcQ6VLWxLAm42VkrSgi+WVMhCYZH85dkNvz2FNgOOzQnBpsLcklpHiYhz8
         MuiS3rCM/aK6FPFzf10VD57kHI2tPwxXj/vxDFz4Ze9vKTEAvohaeXMCBI23assJQBIw
         R7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822430; x=1794427230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
        b=Xp+6exy8o7G50XLGTuqmR+x+Kp5u8Vk45nCawLeMFQ3fMCMGpa1zIk0JhF1bdMBT6E
         mDysmiKOruLFi/sSUnpYkRkDUT1JS4MJIlaPXCUeiAd7PDb0gSR2KCxcZY283uITc/7I
         YIfXsX6QFiC/TOm3zmZPFD79mDnQ+rV0g+w7Cj/EmiGKmCOEqvz/i3Yi03m/eZapxJbc
         5c+vKmb9U8ZwyVysDJaQiqyXGLCIQH8d0Cnpim+MJlTqgovRXBDuOP/+UJeg4dfxWM5K
         qWxZ3iuCvzpP1RHxDefQGBnpcD5vRTeX9gfy+WcA5616VXu0nzdJtHpq5PvM0MCVWlUq
         MeWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnKng7xb99LI9CjM21fgkL+TcL513zIPD0uFhvf61pj3rvF08N5yyF18+JnCdA8Mx9skHOPb6zic4c@vger.kernel.org
X-Gm-Message-State: APuU4Z8EfycytgcLrJ4QqUcv4XkqYHWBn0jQ1NhXvZneUUMelrdejmNj
	ekyo3EmnUY/6ckyVgzUR1RTlTyVXcobgdlhfa/En+8vycEOulrgv8fls9joZR7awJtQM15M1fm6
	2Du+UL+ApdPMkz6wOcT/bTp5NYrJ9Mt3YQX+iPqAwVF8LouAizRi1Qk5Yc2mgTkLgVbTj8/MCzh
	F2GpRnR4q/E4MjgMyyKkMeBnJniYt7uW8KAm7W8KY=
X-Gm-Gg: AYBFou3kxhM4UubBt1Fc3JlBadUwd0wENkRTYYoK8Ne18Lebx/6q8jFUBrxQAqiMRvM
	hUQzZjpPiIrk08WuajTJhkaHh37XyRr3qGWjMZzaXaIDs234+mJcDN93EOmtzl9Bt0C41skHi+1
	RIu+2biyCSDIg3j1coWFih5KtdTuFBYZjSHHmC2/TvIN8hvxAep355Xfv05KeNkx/BZj+TJeF8S
	McYwRTxQ3HL7x6dk6Fv4xUM8liini9yIxvHzz6k1gWSV7LDXDKLxiS4i9cBU3YHVahI8leXoBA=
X-Received: by 2002:a05:620a:472b:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9442171a086mr2894457385a.17.1793822429356;
        Wed, 04 Nov 2026 12:00:29 -0800 (PST)
X-Received: by 2002:a05:620a:472b:b0:93f:1ed3:a9cc with SMTP id
 af79cd13be357-9442171a086mr2894440885a.17.1793822428459; Wed, 04 Nov 2026
 12:00:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
 <20261103-camss-isp-ope-v13-4-c2cbf15a39b1@oss.qualcomm.com> <autlc2AfB8AZfb2H@zed>
In-Reply-To: <autlc2AfB8AZfb2H@zed>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:00:16 +0100
X-Gm-Features: AclHuK9N33CIyZcbZ2UGvyj25S6IIKINlhYmXcHoaT0FNmanaG6JsRfW5JzTXZ4
Message-ID: <CAFEp6-1qs-HmxYWcombWxyuPRACg5cQVrJs47rwrP8AL6xDrEQ@mail.gmail.com>
Subject: Re: [PATCH v13 4/9] media: uapi: Add CAMSS ISP configuration definition
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfXzuq/wA9uPyPa
 +aEcDfohmaEPnErrVLEC6kjnJUuRkTGzkEFWWchj12cVYMoGTxSYEMu+M05FQ1A0nmNoNot1Aoo
 sNZCNkGvUov/aWL1hPo89jv5YQHedpBgucLnjdRoViG9gCxV6HytdeTCee7UIdZ/dDogAp2IQAY
 EYDvlgue2Bk0zG2Ifpo4Ciuro09TPo6o22qDXhoqz0W76iFgaQN5BsCLcz1S7TK53y5fw+qPeua
 FDEHa5JHLPKtTkNbZX4ie7td79ZmiLjwRgBWvb2hemtMVdVMWYhmoM0FzQocZWtZ9Y++rCodvk8
 HccYp85ltQSaAGGaW4OBuqSV32KDvzoJrXLZhPFvPNwNAq3TeLSD7MQw9yY/Ph4rjSxzq69jBtV
 GeiTy2gl3Q8JRKcdqyqV/ITosyTIYnVo6Sj43SGzEzjrHZUHCgZbmhIQf2moQE2WzM5NkobdEAz
 a6LL351B0r23h+m1zvw==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aeb8ede cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=IEpJfH1-mEoR4trvuzYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: CQ66mIuAKUGbb79oKL6H43r4of-lUpzq
X-Proofpoint-GUID: CQ66mIuAKUGbb79oKL6H43r4of-lUpzq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX4ac2FuHMQFpN
 I24ao76yO8sRljjqhuza5OqylqayxhSaMMI2+s6+XRJP/MD8UJfEcFJoo5Lmpjv0G56En9XPtA0
 nVOiiL3ONwEgARMfEbgRRndUohpzFcE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040079

Hi Jacopo,

On Wed, Nov 4, 2026 at 6:05=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Loic
>
> On Tue, Nov 03, 2026 at 09:05:48PM +0100, Loic Poulain wrote:
> > Add the uapi header qcom-camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > The block type enum is shared across CAMSS ISPs so that userspace only
> > has to deal with a single set of block identifiers.
> >
> > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  include/uapi/linux/qcom-camss-config.h | 217 +++++++++++++++++++++++++=
++++++++
> >  1 file changed, 217 insertions(+)
> >
> > diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linu=
x/qcom-camss-config.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..543c1682f8aed3b07d7085f=
54a24eb632ea190a8
> > --- /dev/null
> > +++ b/include/uapi/linux/qcom-camss-config.h
>
> We have (kind of) recently introduced include/uapi/linux/media
>
> This file should probably be:
> include/uapi/linux/media/qcom/camss-config.h

Thanks for pointing this out. I'll move it according to your suggestion.

Regards,
Loic

>
> > @@ -0,0 +1,217 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > +/*
> > + * Qualcomm CAMSS ISP Driver - Userspace API
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> > +#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/media/v4l2-isp.h>
> > +
> > +/**
> > + * enum camss_params_block_type - CAMSS ISP parameter block identifier=
s
> > + *
> > + * Each value identifies one ISP processing block.  The value is place=
d in
> > + * the @type field of &struct v4l2_isp_block_header.
> > + *
> > + * @CAMSS_PARAMS_WB_GAIN: white balance gains and offsets (CLC_WB),
> > + *   &struct camss_params_wb_gain
> > + * @CAMSS_PARAMS_CHROMA_ENHAN: RGB to YUV colour transfer matrix
> > + *   (CLC_CHROMA_ENHAN), &struct camss_params_chroma_enhan
> > + * @CAMSS_PARAMS_COLOR_CORRECT: colour correction matrix (CLC_CC),
> > + *   &struct camss_params_color_correct
> > + * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT)=
,
> > + *   &struct camss_params_gamma
> > + */
> > +enum camss_params_block_type {
> > +     CAMSS_PARAMS_WB_GAIN =3D 1,
> > +     CAMSS_PARAMS_CHROMA_ENHAN =3D 2,
> > +     CAMSS_PARAMS_COLOR_CORRECT =3D 3,
> > +     CAMSS_PARAMS_GAMMA =3D 4,
> > +};
> > +
> > +/* Number of entries in each gamma channel LUT. */
> > +#define CAMSS_GAMMA_LUT_SIZE 256
> > +
> > +/**
> > + * struct camss_params_wb_gain - White Balance gains
> > + *
> > + * Implements the CLC_WB pipeline module.  The pipeline applies three
> > + * sequential operations per channel::
> > + *
> > + *   1. Subtract sub-offset (black-level subtraction)
> > + *   2. Multiply by gain    (colour balance)
> > + *   3. Add add-offset      (output pedestal)
> > + *
> > + * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
> > + * are 16-bit unsigned, normalised to full input scale (65535 =3D 1.0)
> > + *
> > + * @header:   block header; @header.type =3D CAMSS_PARAMS_WB_GAIN
> > + * @g_gain:   green channel gain (15uQ10, 1024 =3D 1.0)
> > + * @b_gain:   blue  channel gain (15uQ10, 1024 =3D 1.0)
> > + * @r_gain:   red   channel gain (15uQ10, 1024 =3D 1.0)
> > + * @g_sub:    green sub-offset, subtracted before gain (16u)
> > + * @b_sub:    blue  sub-offset, subtracted before gain (16u)
> > + * @r_sub:    red   sub-offset, subtracted before gain (16u)
> > + * @g_add:    green add-offset, added after gain (16u)
> > + * @b_add:    blue  add-offset, added after gain (16u)
> > + * @r_add:    red   add-offset, added after gain (16u)
> > + * @_pad:     padding for 64-bit alignment, must be zero
> > + */
> > +struct camss_params_wb_gain {
> > +     struct v4l2_isp_block_header header;
> > +     __u16 g_gain;
> > +     __u16 b_gain;
> > +     __u16 r_gain;
> > +     __u16 g_sub;
> > +     __u16 b_sub;
> > +     __u16 r_sub;
> > +     __u16 g_add;
> > +     __u16 b_add;
> > +     __u16 r_add;
> > +     __u16 _pad[3];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct camss_params_chroma_enhan - RGB to YUV colour transfer matri=
x
> > + *
> > + * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients a=
re
> > + * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
> > + *
> > + * RGB2Y - Luma (Y) coefficients::
> > + *
> > + *   Y =3D v0 * R + v1 * G + v2 * B
> > + *
> > + * RGB2Cb - Chroma (Cb) coefficients::
> > + *
> > + *   Cb =3D a x ((B - G) + b(R - G)) + KCb
> > + *   with:
> > + *     a =3D ap, when (B-G) + b(R-G) > 0; a =3D am, when (B-G) + b(R-G=
) =E2=89=A4 0;
> > + *     b =3D bp when (R-G) > 0; b =3D bm when (R-G) =E2=89=A4 0
> > + *
> > + * RGB2Cr - Chroma (Cr) coefficients::
> > + *
> > + *   Cr =3D c x ((R - G) + d(B - G)) + KCr
> > + *   with:
> > + *     c =3D cp, when (R-G) + d(B-G) > 0; c =3D cm, when (R-G) + d(B-G=
) =E2=89=A4 0
> > + *     d =3D dp when (B-G) > 0; d =3D dm when (B-G) =E2=89=A4 0
> > + *
> > + * @header:   generic block header; @header.type =3D CAMSS_PARAMS_CHRO=
MA_ENHAN
> > + * @luma_v0:  R-to-Y coefficient (12sQ8)
> > + * @luma_v1:  G-to-Y coefficient (12sQ8)
> > + * @luma_v2:  B-to-Y coefficient (12sQ8)
> > + * @luma_k:   Y output offset    (9s,  0 =3D no offset)
> > + * @coeff_ap: Cb positive coefficient (12sQ8)
> > + * @coeff_am: Cb negative coefficient (12sQ8)
> > + * @coeff_bp: Cb positive coefficient (12sQ8)
> > + * @coeff_bm: Cb negative coefficient (12sQ8)
> > + * @coeff_cp: Cr positive coefficient (12sQ8)
> > + * @coeff_cm: Cr negative coefficient (12sQ8)
> > + * @coeff_dp: Cr positive coefficient (12sQ8)
> > + * @coeff_dm: Cr negative coefficient (12sQ8)
> > + * @kcb:      Cb output offset        (11s)
> > + * @kcr:      Cr output offset        (11s)
> > + * @_pad:     padding for 64-bit alignment, must be zero
> > + */
> > +struct camss_params_chroma_enhan {
> > +     struct v4l2_isp_block_header header;
> > +     __s16 luma_v0;
> > +     __s16 luma_v1;
> > +     __s16 luma_v2;
> > +     __s16 luma_k;
> > +     __s16 coeff_ap;
> > +     __s16 coeff_am;
> > +     __s16 coeff_bp;
> > +     __s16 coeff_bm;
> > +     __s16 coeff_cp;
> > +     __s16 coeff_cm;
> > +     __s16 coeff_dp;
> > +     __s16 coeff_dm;
> > +     __s16 kcb;
> > +     __s16 kcr;
> > +     __u16 _pad[2];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct camss_params_color_correct - colour correction matrix
> > + *
> > + * Implements the CLC_CC pipeline module.  The matrix computes::
> > + *
> > + *   Out_ch0 (G) =3D a0*G + b0*B + c0*R + k0
> > + *   Out_ch1 (B) =3D a1*G + b1*B + c1*R + k1
> > + *   Out_ch2 (R) =3D a2*G + b2*B + c2*R + k2
> > + *
> > + * The @qfactor member selects the fixed-point format of all coefficie=
nts::
> > + *
> > + *   0 =3D 12sQ7  (range ~-16.0 .. +15.992)
> > + *   1 =3D 12sQ8  (range  ~-8.0 ..  +7.996)
> > + *   2 =3D 12sQ9  (range  ~-4.0 ..  +3.998)
> > + *   3 =3D 12sQ10 (range  ~-2.0 ..  +1.999)
> > + *
> > + * @header:  block header; @header.type =3D CAMSS_PARAMS_COLOR_CORRECT
> > + * @a:       G-input coefficients per output channel (12s;
> > + *           a[0]=3DOut_G, a[1]=3DOut_B, a[2]=3DOut_R)
> > + * @b:       B-input coefficients (12s)
> > + * @c:       R-input coefficients (12s)
> > + * @k:       per-output-channel offsets (typically 9s effective)
> > + * @qfactor: Q-format selector (2u), see above
> > + * @_pad:    padding for 64-bit alignment, must be zero
> > + */
> > +struct camss_params_color_correct {
> > +     struct v4l2_isp_block_header header;
> > +     __s16 a[3];
> > +     __s16 b[3];
> > +     __s16 c[3];
> > +     __s16 k[3];
> > +     __u16 qfactor;
> > +     __u16 _pad[3];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct camss_params_gamma - per-channel gamma correction curves
> > + *
> > + * Implements the CLC_GLUT pipeline module, applied in the RGB domain.=
  It
> > + * holds one independent lookup table per colour channel. Each table i=
s a
> > + * direct (not segmented) map of input level to output level.
> > + *
> > + * Each table has @CAMSS_GAMMA_LUT_SIZE (256) entries of 16-bit unsign=
ed
> > + * output. The number of significant output bits follows the width of =
the
> > + * engine's internal bus; the upper bits are ignored by the hardware.
> > + *
> > + * The module maps a 12-bit input to an 8-bit output: the top 8 input =
bits
> > + * index the table and the low 4 bits are used to linearly interpolate
> > + * between adjacent entries. Entry i therefore represents the output f=
or
> > + * input level i/255 of full scale.
> > + * Output range: 0x00 =3D black, 0xFF =3D white.
> > + *
> > + * How to fill a curve (same on all three channels for pure luminance
> > + * gamma; different curves per channel additionally shift colour balan=
ce)::
> > + *
> > + *   Identity (pass-through, gamma 1.0):
> > + *     lut[i] =3D i;                                // i =3D 0..255
> > + *
> > + *   Encode with gamma g (e.g. sRGB-like, g =3D 2.2):
> > + *     lut[i] =3D round(pow(i / 255.0, 1.0 / g) * 255.0);
> > + *
> > + * @header:  block header; @header.type =3D CAMSS_PARAMS_GAMMA
> > + * @glut:    green channel gamma curve
> > + * @blut:    blue  channel gamma curve
> > + * @rlut:    red   channel gamma curve
> > + */
> > +struct camss_params_gamma {
> > +     struct v4l2_isp_block_header header;
> > +     __u16 glut[CAMSS_GAMMA_LUT_SIZE];
> > +     __u16 blut[CAMSS_GAMMA_LUT_SIZE];
> > +     __u16 rlut[CAMSS_GAMMA_LUT_SIZE];
> > +} __attribute__((aligned(8)));
> > +
> > +#define CAMSS_PARAMS_OPE_MAX_PAYLOAD         \
> > +     (sizeof(struct camss_params_wb_gain)    +\
> > +      sizeof(struct camss_params_chroma_enhan)       +\
> > +      sizeof(struct camss_params_color_correct)      +\
> > +      sizeof(struct camss_params_gamma))
> > +
> > +#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
> >
> > --
> > 2.34.1
> >
> >
