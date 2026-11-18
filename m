Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794992799;
	b=wnnBFya2pKcmUuHlsW73THzWCHc6CjQaWf2HcqSyIuNdBD5eIFKkTxHTuouPCPjjckW4
	 t9U11cv9GPNYKlPmMg853iejI3J0nYJOtN4NRHz+b/y0UyFzkA57COGKr7HkMxrTh4ekr
	 K3KIgvw2ZiItIQu0GV7vl4WTbmnN4Rt7bCV7CzqI7nf2sGXOkaCWa0mS0liud0LsMC0i6
	 Z4HK/BUbRFz3k+2GF423Jz0Zlm1BFMRB9geeVWt3OC7+u4J4p0xovyOjjqt5/EGPVPhPK
	 gd7bw74APLQ5pU07iNSqb0ujG1hqHj6QMCrLA/Odjk4W4Z7zOdudcYq714e5CqKQnBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992799;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
	b=F3knrAIwNEzyL82zJh4eRbsYK2qXykGmjClecqSu/z+Yf1mTsFCo3eA7i4XIcBP6SxSj
	 scUrSBGtYMAg+qpdnYo4MNcycHzpX44/xMHMlZZAz3JT6YCpldGb1FT1Vvg5PBBjPhZAw
	 Q12hc4bXOVJFifieQdIVURnILAA7I6ydrC43MvDA4L7TvBXOvW1jD7q/ArwsKYb5sMpNV
	 VJKpk0ZwfkVxrJCb1P0aXY5U6Ol7iVTKBAATB/wt2IHsFY4MYP6ZjiJdV1KHbsbAVyhGw
	 E/5ErYDtajO/paPz0AvRer26OvFO1yQipTr1nD/qZx1oxJCJ1tTPz4ZJMLr2zSR1YAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jQEr+7rG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC4rkcs0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B0606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 516B0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jQEr+7rG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC4rkcs0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8On3I3371245
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=; b=jQEr+7rGIgiZJfKp
	VCEciYE/FPRyAaOtFBdB15NgY0xL7pVNd+QLUNUY8Do5ZgUP5Z8ICyzJ0gVnhjYj
	BA7axEcR5UrsxJpXMaVd6v1b5R6kzPt5osAaov/Rgsoe13ZZYRarOyqRvw/s6RG2
	gWkIYFgw+uiAmYPOP2a3MyqI5bkPXRrwkpu4RnFt2v7wZ/UrwRqYJ+5f29zmA/dC
	i2lfu1EVpl6O97D/S0INGAa7EdYWB0xruTYHhfnBx+wSOFBg1tRVcn3320pcMaVQ
	826ji3Uho/vhJbJEJgfr6XRcqjfI7vhMS0d2XtDb60H7TmyxUwksNbqN9gA43jte
	/LmqIA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8t6ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:06:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so455930a12.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794992798; cv=none;
        d=google.com; s=arc-20260327;
        b=i1DvMEsyXSu605Bt70XmbvLpPIJx4rcwPmK+eJTDt0BhOTaq3AKsHVdp9vaaHZh4wT
         KCEtHIGKhQN0hAbhuSo5P0fbp/K8tq0U9/cHXdeJbX/cRkeHU5ij0aT24g/QoRM5vJvz
         HuihEEE9efdz3AZCBYMSQZD5eXYtuoa3LIlDtrZcOoqe9vRvc5zlI8HKIL/KV+YN0gZo
         sBLsRL+VxKHnjSCyLkJuK5UN3c9552pdft2Q5pNDVcYJ5GYxcbSFXbAKHP0k8ftuoOzf
         lTRHDv/wg1Bgo+eNw1ZhAlhPneeLvyp5/uElXP3eNd9ewhF9+gY28QuOaVcZR231jjHg
         vm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
        fh=vyJ3SkifVRWP7mMnGmXFbord49km25rh0qqPWZcFvww=;
        b=QEUjvKP+O3RZhSEmU3zQdLkS5vj8FawpPbeywmBDMdrVfNDyYuQQ+j9bd1rLWdYnC+
         6ZAMmSwNwcdQYKuSrEFQ6LMVfo2NA+89kKGzn0f+L6mL1bNxseEc5xNjQdEbz2IlnB4M
         Tv2hklk/0HuCGHi1qI6ebIuqnvzWvtwV7wV6/GbCXtjZknIGbIkpreYr5gC56B53E+Te
         0iRI2PxN6nkFM5kYlOBC2pNnMQeAKlQoHQ8wmMB6QQI+Cd55QcDJijIVA24oTHBVtgdf
         5rQBUIMCx8E4Sv4a8pUm7wtgORGw3Gqlp1OEbYx8lqObeLCirQp8sCJns36yReiB7dZj
         rp7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794992798; x=1795597598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
        b=DC4rkcs0+5yP8/9Ht7U2qTnYIKgOemE78ukoGsPLzcZXRDL9+wrCIQ8yXNi8TvmXdf
         y2ZmpcWdRw+6uTnyOS6anI+Tr4BT4/I6XR29ZkHIirGMRXgwxXylCqpSiuavo/EAg++J
         QWh12aMQNslBcS96Gc5o1mwVzIOa13ndZGdmG3K01x99CalQTSoC3ji1kWDxDyXqtVzp
         9yEaCPQEDDOQeTtKOfQZB9+hvf7f9bcrdUeunq9g/eiMju+f35z8MffdFgxEpgoLcYTx
         1HGRRP8me4pSz0MRm/a/7kVa24GqslH3n0dgPaJyvRJBIdSU+S0Epae/pNZcr6ukJlmK
         8IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992798; x=1795597598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
        b=cEVOhXtZwoB4INMJ5m4L2gbTZlgfkli+/A4kGNaZVZkPzt9M2YTv8HL+dE4u2IPqSJ
         DjWP+qnwzJFMF80LZFhjhuQw0PTiwHo1eLaBx1xamLR1skIPINNKW2t409qZWKwFQvVS
         I+zfN9DBEHpatzVTKre3nQdaxCCOEc59+lFbjeg9C953GUkbFl34N4+UHnlFd80aTq86
         s+DIbLgMe6XWA6JdBLW7stk4FEo12zwjTNqAaXPxb7YqxvWMN54OZi3wsW/tIF5oQ+Zj
         6v1F75v3y4IK06C7zc42cAEBZ18ZVjQpoeZ0y/eOJx3lKXLLSsHbkn/8HlVyiAVLtRu5
         1Rkg==
X-Forwarded-Encrypted: i=1; AL+hErE2KPZSOSV3lWd9IsHyxnBKAUqPZGgvsyfJnQhF9hr7b1BqtJ5ojL9G7D1c0FoDRQVEB7G0pWj3OQ37@vger.kernel.org
X-Gm-Message-State: APuU4Z9qYArBKLaX6j9HaLU0PWnm+MjPEGIrDLYe3qHa3Tzlg9O+29EU
	KicSC7gX0uny9JnbykV97e4/dvMVzvdOfVVgLjRPF5IuvHEqxH4tRCnSk343zJTc6pFGe6Ew36r
	h6XhwZmGrtAB9rTEY04sUJ8T4ojvMhaDwHATBoVN4CSZAflpeDHpyFrqSaVVlcaIn5zjKr/jS4N
	oGU3ulaTJzzJy2iUUWfNzFDEqcrlQMer47PV7JXho=
X-Gm-Gg: AZFdTZfIQGNna9XMB5VJRywiRYiz8mqGFMVI2DXPqifUQK84WcrKyreQCsE17z7Y6i1
	8Vwf7UOWy0cV8QLj4IUsyj9xZMFeQ6Ndf8ag77AuHhJNbDUuaSCXQfCcauLAOCVvXaDoy8ZGhJ2
	nkyfey8G98BN/9byrvWPKHDNnZaF/w0p1gTdGEUB3VxWkyNW8zSXKe7w2Ux44=
X-Received: by 2002:a17:90b:4f8d:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3b3d076318emr2219652a91.9.1794992797751;
        Wed, 18 Nov 2026 01:06:37 -0800 (PST)
X-Received: by 2002:a17:90b:4f8d:b0:3ab:884b:659e with SMTP id
 98e67ed59e1d1-3b3d076318emr2219621a91.9.1794992797338; Wed, 18 Nov 2026
 01:06:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com> <20261110042537.2080084-1-leo.liang@sifive.com>
In-Reply-To: <20261110042537.2080084-1-leo.liang@sifive.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 14:36:24 +0530
X-Gm-Features: AclHuK-GdskchP5Xrbb0NCv-oMN98LztdY-OpT_0E2NBif8hi8IPaY8eKX1Y_Og
Message-ID: <CAHuiULD76iax9hkrLM1eR2DC1ut5UkzSeBpVTWfGwKpVTcRw4A@mail.gmail.com>
Subject: Re: [PATCH v6 06/14] gtrace: Add RISC-V Trace encoder driver
To: Leo Yu-Chi Liang <leo.liang@sifive.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd6a9e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pFyQfRViAAAA:8 a=55nkOtszvzLBgXWOk3cA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: JB_Pd76jQoO2IE7A--phqMLnWHM4MV1-
X-Proofpoint-ORIG-GUID: JB_Pd76jQoO2IE7A--phqMLnWHM4MV1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX+in/Z0zlFPzq
 oH3LDh7MX3Fsp6i9GSySxpp+DV5IR7v3PzCh+T63PVPXuZ59T85D9p1TmFMr1kmM4VnP4PGfBAt
 MhwQMhzrVg7MYsS/26dqyYib0OQFJ3eFdx1Uo33muqRNHJ60r2Fs3BGUcXRdyeurAyr6dgvEDAw
 qYqwsxdqKDkudsJKQi1x+hqk8/YarmwX092TgJpMn0a0DCzAAg1pi52enLtoKlgcqziNoE+G7u0
 jb9qvtX0sIPt3tAJUWPh0fR85++tB8KgofJRraA5aTRmFTFFIbLZqgmxu+OfjhP4giN28/83tEe
 ZE5IlgEqsJJl1tD4N83xtW8SBhtKpMYSw1ols4i8e7iKSThm9nVNFPHGaTcWyGjrXSIF7ziBFgu
 MAYMJBG2RGtuin4qrb4E9QcC+FBmT3d+x2kf6Ez7sEs/5+sBkcQ6ytQtNaSzocBiD6MSSt1gBVU
 0UgmuhgA6sXvgIDDR8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfXzVpJTLIhicAG
 zH6FOtfQDejys86Vx/gs01Lcg24dx5bT75Cpop+bTqa1J/Ncz2rXOmlw4POuS8rj+4jFMcwagxD
 ijtAwAtoCv7F2YnaOLddkxtgXG75lhU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180036

Hi Leo,

On Tue, Nov 10, 2026 at 9:55=E2=80=AFAM Leo Yu-Chi Liang <leo.liang@sifive.=
com> wrote:
>
> Hi Mayuresh,
>
> On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> > +     if (!priv->srcbits) {
> > +             dev_warn(&comp->dev, "cpu %d trace will not carry source =
id\n",
> > +                      pdata->bound_cpu);
> > +             val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSE=
T);
> > +             val |=3D BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
> > +             gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET)=
;
> > +     }
> > +     dev_set_drvdata(&comp->dev, priv);
> > +     return 0;
> > +}
>
> On a system with many harts it is hard to tell which encoders probed
> successfully. Today the only messages come from failures, and the
> gtrace_component device names (encoder-N) do not show the CPU or the DT
> node. How about a single dev_dbg() (or dev_info()) here giving the bound
> CPU and the source ID width, e.g.:
>
>         dev_dbg(&comp->dev, "%pfwP: cpu %d, srcbits %u\n",
>                 dev_fwnode(pdata->dev), pdata->bound_cpu, priv->srcbits);
Ok. Will add it in v7.
>
> Thanks,
> Leo
