Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094A33D9DC9
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399792; cv=pass; b=LY57ZOzAvedPhnZzI8Plq4C9NIWxi5NcD5Ak2lv0/zWYi7MxEVXUmY8ITOlDF6vxTDBtNGOc8yl5lPHT3zY0Si+TPZVNsG+lxRtdvx+xsRkFlo3odDX9qjMt7ea1y3VEFCN19rO3tiTvFnTPxPOiL0FSRin/8mXTyr3r6BbIH4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399792; c=relaxed/simple;
	bh=SooN5J43IJM5nWyxbVhpkI8+2GtTtiW/7Dc0/pehAKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHkfdUBssUD7mDhK+ZGJnO+gGTvapV31MfDtS2OpemhX6whH/fbNTpimcJnsovVXmufsh3Lb3BAdggLZVct+8PMtMuWRruD7bDZiINIWAj7irYJalYnT6qPPpWLR880MajO3wKpHmMX1ccWnIgde95UQBeQIHjxOTn5BpLMIFZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDB2l32S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiYHNSV+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDB2l32S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HiYHNSV+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6529UaKt3355445
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 11:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gfkLtAqu3R3WTJ5a9dV0MD9n3KII7DwVLMftGaDRPfg=; b=XDB2l32SzQ9daz68
	lxK5Xb7sg5EPmKGeeUGvcrv/6XXu121X4Ttntxy7hI/bBl7JJF/Up3NSQdbhuGmH
	aljIgYDBEn04ouvnNPxX1ZRbWTTdE5Y8c/V2DEAWLlVVg1cH7wwtGXEMOQvce18m
	RqxZPzFzON2c9Hv5SSzxERsKkqWyRblaqvGnV8qQ3qurhHPXyIJkFniB0Sp4U+zW
	r0ODyUwfxnTwV+eZZw/dvUufH546GrfLnEAZqS2nOn0pyOe+0+nEn8aVUHV/AiVb
	SVBzY1LqZTeoqvUItYFfbyL4+s0buLS8rxAJ9XSI1RE8aYxN/g1vY+Mz4SEu9x9Y
	qC7E4Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehvkx8cgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 11:29:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8cebec24b12so21437756d6.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780399789; cv=none;
        d=google.com; s=arc-20240605;
        b=e0QFOgOZPDYAxMTZ+jej5IS9U1cSdIEZvrXXIXzNnlwA1gg5PU24Ld2dwdPUsDSEyC
         tHI9ETlv2z9Mr6ewc9WpxD1sPmunwpAfHEUPJOPYijkPKUAn5sN5mp26ZAKBQ/ksh0ZF
         eB7BXy5QFzh2GpYcjf2YFqDnBVtZLlYq+pU3jazZLvnuztr6QbhGwSs7Q8r4a2i1OC/f
         DqMAYHFyXBLgOXNcTzG/6Hw4ABU9j29LFGqnd0Hfim/r9uXPDYwABPQ8T70BhvCyOi4q
         0duz82XdgXbzcjSbs6ISwkGz6QwJvPyc+UkMMQdNYk2vuRgMKhOQHz+PLSAhsAX/eX7O
         FeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gfkLtAqu3R3WTJ5a9dV0MD9n3KII7DwVLMftGaDRPfg=;
        fh=kdS74lR49FAvRAu2kLOQXtgCH+vndO/A6845QyBf6C0=;
        b=kDH4K/bmpkC7ZLCeCkPnN+sfPNNEi+ki+6JgI1YCDtSDQipP52Pjdr6ys2KX/P5SEH
         fciEpp2tYjqUVDSVgpqkg2Cqwr5KkMB2JLZkUOdA+0ou8yNFREENuxthbdJTyBxigPqd
         D7KLRbN/5Fh+mQhGSGGLYk4z0gM7plVJsYd3epXxT2/FX6pc19dxj95ASoe73M/hrTL1
         /+XorHusk3JPkiR6+nBJ9Wlpuf31ucQ7+kgEpzMz3ANYN2uueDp4ydKjcck77Mcg1C89
         FPzcZfJZq2JUWojLB5SImx9oKXUQic4tA6lwuEkK/A4cv3K3q9m+MEKeellCxOf67+uI
         NQ1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780399789; x=1781004589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfkLtAqu3R3WTJ5a9dV0MD9n3KII7DwVLMftGaDRPfg=;
        b=HiYHNSV+e+OAyWTDKqucYsj8VbxYAQCTKn9lkdLwFo63xDduHRt7KkXji+HV8syBQo
         bwLQK28/2hmNt0fd2leLvvQ8Ra04+iljSM+XoCL1/MAK293BnBfm++2exIobt1unFokX
         4/pWmcffzFxw7gI1HmdOFnZGhf2Z9sbUD1yh8K4SAiMxU37qypjfw2T+QehfCiYw+hUj
         vk0urlUKEhL9g0tD4otAo1tScUoOTpn81QRFANyROePv1wtsT4uJpWTzt1RXtcfv4CF3
         j5AbXschKzk0Zdmb+qaPZ6c6OeukTf+X7zgsrAPaV68MztZqzGfCqyI3tf04UKT63lfq
         NPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399789; x=1781004589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gfkLtAqu3R3WTJ5a9dV0MD9n3KII7DwVLMftGaDRPfg=;
        b=IzCsoAIuZZdFlkS5EfY91YVF3mqwrVFXuj2WWix+Lt6bAUnueiGxbiLd+cst4+ZX9+
         zaLsp0vNdOrtEkt1RV4+BAojGGAfhuVSu+5WE0yUiAV8ZUkLGrBvu0bEaXhSrEA/x83E
         aW5WLtT42Ct9OBjWNOeDuypIqiA83dlxkN6R71XOAujwz90MzqW+wzCUzyX8FpR/cPpX
         gBDnM1ucjl/C/F/ih8KhNnfmfaK1BztAQcENVaBliqyth67I/pkLgdIECh3utbg+PPMY
         Oek8yO3NYUwCsAajCsOOa+Ju8vT8iQ+Cw1LAHp90uxDAaFJQZJPWEJWQLFJqPsklOAKI
         XlFA==
X-Forwarded-Encrypted: i=1; AFNElJ8baIAHQYuu7gBqqTFxXyyCaGAK5yY7yl9Lbl+q3GZR9WCxQU5Gy1+QM4hJOZ093DnuUGqVR6yU0ZRy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+JuVPEWFmcBe2xF9GH8n/sOtKRrg/ZW8cyRI9lQh0hYNGl3n
	n2CeU+m03LQYi908S6H3M8GMsd1+HDjVCqxmMUxOaMsn9e/8TWayzjnnSofxjVFso3d3Arz6XRy
	HSm7q+CruxE74bao7bxhlvEOQWmOiGbYEqR8Ll5Wy3Pqn+Ms6UyMsz51el0pBoSfwRlwMI9zkWR
	s6a9B2k0Dl6nYmr120oMxmasr1VkrG9/TmDCbGeqk=
X-Gm-Gg: Acq92OHiCFutPgu1QJ/s7L1Zdz4LitDCOBw7Gbmgw3X0s0PI6iVwOvQ1J3z9E8g08Gg
	bVkL9sOss0MJRPMkI44qJHCWnSjgXUR3uM0cHRa3VmNaCp+cmuY4XrmXNMQQQzty7WsjZhC6O6P
	4Tt26PNC7Juq/lrqlmgHMzD3mw7Z9pcF+mjUPUsDVNaRYRCFIDKL/7SC8JowyoxS00IfuCTYGMn
	7PGzZM/aTLoFNC8SA==
X-Received: by 2002:a05:6214:c6b:b0:89c:806c:93 with SMTP id 6a1803df08f44-8ccefd8d38cmr259361246d6.30.1780399789231;
        Tue, 02 Jun 2026 04:29:49 -0700 (PDT)
X-Received: by 2002:a05:6214:c6b:b0:89c:806c:93 with SMTP id
 6a1803df08f44-8ccefd8d38cmr259360756d6.30.1780399788759; Tue, 02 Jun 2026
 04:29:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-6-anup.patel@oss.qualcomm.com> <ahCkjH-sGnGLHpG-@curiosity>
In-Reply-To: <ahCkjH-sGnGLHpG-@curiosity>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 16:59:36 +0530
X-Gm-Features: AVHnY4IPvjpxjhX4kMF8xfCjcDhv0xi6uud59IHB2ghj0dRQmrdcUVsc6DXwyiU
Message-ID: <CAHuiULB4PKngzUYg65gj3k+OeKnUXL6NQQmwm3697Uq3Fijknw@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] rvtrace: Add trace encoder driver
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: LBukppCGTUkQnpXxW_oWkNMvdu-N2hFN
X-Authority-Analysis: v=2.4 cv=GYknWwXL c=1 sm=1 tr=0 ts=6a1ebead cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Wa9ct739lkgR9Ah4pj4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: LBukppCGTUkQnpXxW_oWkNMvdu-N2hFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEwOSBTYWx0ZWRfX5AtVXr8dLArY
 34Kcm+AODNUKaZJ/llwN57BCiuU77oaGUNTz/KlRt4n2TCQznc/uUyacdDaIbvEAJZ795TMIbuP
 2p2hH38wiRm5tWq1JoOEJ8Tf3NwIV1IYYR680o8kw4BlFGBRShmz+KRS/yvWYlO+GFusjNT2cL8
 +9wbbHxfaU4gLB+PPslxX1Wwro5YqGkKeclkUBatgHf1sAILT4Y2+BUeQbrX4PQ7p6KMGoc8Qi+
 1IrNTMptz43/zef78ZPFWwEjEXLOwMRwR75XXWTOyDMTddSjVMyly73UDUhxWl+DM5UuX7E4fCs
 bNZNSErChOuXiK5yTCT4gie3CTeHxhNkhkYuf8LHk/+5LgMa1KDcf8Zt1QWC9xrCgXlApyfQmMx
 04RK/puBGLLve+ShygoNtRqWwWjjLSlzfuWt6ouLHrBjk08hJ6YazAbEJqo6XdETtEWqX4KPX28
 lMQruJww4MI6eBMX06g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020109

Hi Sergey,

On Sat, May 23, 2026 at 12:16=E2=80=AFAM Sergey Matyukevich <geomatsi@gmail=
.com> wrote:
>
> Hi,
>
> > From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> >
> > Add initial implementation of RISC-V trace encoder driver. The encoder
> > is defined in the RISC-V Trace Control Interface specification.
> >
> > Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
> >  drivers/hwtracing/rvtrace/Kconfig           |   7 ++
> >  drivers/hwtracing/rvtrace/Makefile          |   1 +
> >  drivers/hwtracing/rvtrace/rvtrace-encoder.c | 130 ++++++++++++++++++++
> >  3 files changed, 138 insertions(+)
> >  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c
>
> ...
>
> > +static int rvtrace_encoder_start(struct rvtrace_component *comp)
> > +{
> > +     int ret;
> > +     u32 val;
> > +
> > +     val =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET=
);
> > +     val |=3D BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> > +     rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> > +     ret =3D rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFS=
ET,
> > +                            RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
> > +                            comp->pdata->control_poll_timeout_usecs);
>
> IIUC the code fragment above duplicates 'rvtrace_enable_component' from
> rvtrace-core.c.
>
> > +     if (ret) {
> > +             dev_err(&comp->dev, "failed to enable encoder.\n");
> > +             return ret;
> > +     }
> > +
> > +     /* set mode */
> > +     val =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET=
);
> > +     val |=3D (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONE=
NT_CTRL_INSTMODE_SHIFT);
> > +     rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> > +
> > +     val =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET=
);
> > +     val |=3D BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> > +     rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> > +     ret =3D rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFS=
ET,
> > +                            RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
> > +                            comp->pdata->control_poll_timeout_usecs);
> > +     if (ret)
> > +             dev_err(&comp->dev, "failed to enable tracing.\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static int rvtrace_encoder_stop(struct rvtrace_component *comp)
> > +{
> > +     int ret;
> > +     u32 val;
> > +
> > +     val =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET=
);
> > +     val &=3D ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> > +     rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> > +     ret =3D rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFS=
ET,
> > +                            RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
> > +                            comp->pdata->control_poll_timeout_usecs);
> > +     if (ret) {
> > +             dev_err(&comp->dev, "failed to stop tracing.\n");
> > +             return ret;
> > +     }
> > +
> > +     val =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET=
);
> > +     val &=3D ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> > +     rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> > +     ret =3D rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFS=
ET,
> > +                            RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
> > +                            comp->pdata->control_poll_timeout_usecs);
>
> IIUC the code fragment above duplicates 'rvtrace_disable_component' from
> rvtrace-core.c.
>
I will replace both of these with calls to the respective core functions.
> > +     if (ret) {
> > +             dev_err(&comp->dev, "failed to disable encoder.\n");
> > +             return ret;
> > +     }
> > +
> > +     return rvtrace_comp_poll_empty(comp);
> > +}
>
> Regards,
> Sergey
