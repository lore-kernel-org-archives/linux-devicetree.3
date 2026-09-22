Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB117E792
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044074; cv=pass; b=D15nace2N0ikHvlACFD6G8kChFcmZF7OptBTFqfYD22y1lVvTPfAdwjMdLbFLWBkQvrDSiVzU4f0F4Xvbk4A1c2hdeIhHk9gVbFGRQc5NwfmktJu/GcVJXmC4BSrSpY5bmzmODTl75CU8pm+grLgbt7tN5vE+RDczu0YlgeaTIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044074; c=relaxed/simple;
	bh=PBXbfQahzQHF90/SugUjFRpwndefBW+lA8M3ETO3A+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4IfMyjuX7RG9s8HhT0FdM3wjol00PDci5QOYMWaJAzFde4P6TTGb9a3wlHtmZMWophWMLJQilN8H09LZMbPsNc93xpTpHRsDYKQMGIm334x/c8dYXa5nA0XF4ezNCCE5Wk9PWXHT7bJNTy9RS5FvuMwHcJZdBgGb89glI8iIHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLfrX6bo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flz4C5ZH; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLfrX6bo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flz4C5ZH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0EnaR3186204
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	efkaFbs0svZ56TfPgzDT0gUFWLrdLk7ZpYECRLU4pQY=; b=TLfrX6bofUWwDPly
	gZXGINGGVO5AQJ68dW/yRmImdb2CAIVPmjQGJ23vtv0HhPL9+RIUmB1Q9jBvA3x8
	JYTfKbItiwZMrcdFD7CEftispj+Mq+rXkfdhiXlwovLmOzK2mCGA8zHwCyEznck1
	4Dibg/4szhdrOg4SHitqYf41JCpMATjNewOwL6AX5LqJSnQSpqkM8aTbXIAdSSOK
	3fuy6FR0zZvvmdZgzuLtjcu+YrrHHU9BcmVdZfyl7ptvVfEwj+xGbTT+aw7N1Jet
	OFD2mH5R+D8zmfSJfO9MTmzaAs1MHHJukNGDn4frOpsAHh4bdde9FpkbuBHbJiq8
	ATgMiQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybgcdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:27:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86b3c58d686so7463746b3a.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044064; cv=none;
        d=google.com; s=arc-20260327;
        b=AOjsLYHM8APOL/NNM5AJDydos1qlFYn9LSyteOlLvjiLA3mSuTlk86g8bJK46NCG2V
         SFiYX0rQd3yMUW1VYqz41WDNWrF+PoUnez9MLLq3pY7bX4e9ZIZaPYJei26hs03+G/Zn
         TD1aU5SzKs1gYJZNy6VA9o0kl0noXqahE+QT/HJbBL57tS9m4jt6ADBrsf0bpo8TRKXT
         uRYJlhlSo9DHWpulJYPC5S2UjlcTKxKGOfp5stkR1/RAGN6Lz2/a/5EhU2QPicV/FkJO
         AkpQIt3+tdmvMqXGH83h8q+eY1oEGWFMdU7/KNYRf7FTLbtT8QGfaZcLberJXwTkR4ws
         Hpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=efkaFbs0svZ56TfPgzDT0gUFWLrdLk7ZpYECRLU4pQY=;
        fh=KSQ7oR1tLOJoJqmEjY/cK1FcJa+yxG0hJymmjKQdR2E=;
        b=d6UA1MDzHaPud5LmsGNAgj1GD7yY3HB94dJJ1SqDZg+FY5AyNKk8pvE1WgP5Sch2UO
         sdOW5jE2JC8aLVPd6WAWoWDp83nX55987gCUFXbgmrj47PTBVBli5N20zGkDirRTzUbr
         JfU5HJMwfLglvAbuQUwSigLO/RL3rH/a+vcgYloqPxLM2LJJaIlmechWTTTMh0GETyEm
         gFhgRCVz0J/oX3N+ZY5pdVymhLfeOu/GdMmL2ExwnmV0wpSmeKY61BWHLFt9ma9MbHEW
         FqsF3BKv0KVWobF/QbjAr25aHN2mJ3f/PddDr9AT9AEiNIL5O7K2hw/Tu9F0iVQsniqD
         iSUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790044064; x=1790648864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efkaFbs0svZ56TfPgzDT0gUFWLrdLk7ZpYECRLU4pQY=;
        b=flz4C5ZHif8HCDvSXcd2+QSWkBhykx+r+It8xSxiWu6oXJ+ZtfoLhjUb9mcaARhDTL
         PJdziTLe3hReuH1nchhiFYFbPwv2zYRz35383kU0D1SK3eFyAJQT0c7eS6xMuZES1wMn
         h8KVUhLbCI+ETqjWPYL+P/75yjM5GUgep4D3Wcs6FevBVeH9+feEvrDbs2JkVgAxOytZ
         N6xs4RMccMjppdIuyN2kQTI4EMapEnSbxFmSYFh//PW/YXOb3nYs/KTCUqioyPZ9SjQ8
         8cDvzhEu/mxP/zbEoxy9A4X2VPNnT0hydL4phKWAgA8HW3D3RbvIHW/cJFUWK8oAt1P0
         caMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044064; x=1790648864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efkaFbs0svZ56TfPgzDT0gUFWLrdLk7ZpYECRLU4pQY=;
        b=oZfM86YxhU2QH776sd9rhdKy37jas2uj+B+0EFLtYrV6nOn+3aHiVKF/U9BR7HB4PX
         morY4N7c1vtV5R7vVjBMnbgwbwj5G8PclXbe70upN8iSx0h54Xj7uS7Ne5cRs9jwli8+
         OG2dM7LOss0dDN+/VBkgMP3rjOzrtrX+/c8ybPRQTeX23uE3/cBikUpkXNOLUKlXe5YU
         sCQm1rlgh2jmWZKsqNwAv8XtwnXWiNcGC1OHOVCPP6uqlNNKHlKkXm49u3vDjtIIBNHI
         Y5WqCvJxlkrmORSR0Ss/l/L92vk7/VVWtht8A8WXsWAB+z76agmxRenOeeI9+YFTTIKO
         AChw==
X-Forwarded-Encrypted: i=1; AKwUvBxKQW0h0frTRW7XV9mZoulBVNZurMt8rts2+AAAoaYeGZ6aPTUI8bxJlhV9EDfEmqTwAhAxRAvVWga5@vger.kernel.org
X-Gm-Message-State: AFuF++kQ0cCzy4YQgThsBzeb2330lDGfCk84EEKfjHhWP+bgm/U6o6FL
	hF1I1P3U+ZsfTE2r09A8Zov7DbWsU2WPAItU608wY8MKqbLibe2hNyswncF2GVZ7xlYL9J53rj6
	EmoE2+neDL3gWLxpo5lPbzQuirhvxkz5n9Lvnhk7AsghYGBvpYjAfzpy5ln4Fs0uThBsLQVYfjG
	E8OJbkopW7781kmZvFPZ+HT0FWMjohz0hH8LBGyxU=
X-Gm-Gg: AYBFou3Cb0k4q3m+poNcGD2kZ9O/5UoCGSigMTsP1iXLrZXypFSC2veGQvSohff6u39
	B1gt5XepHl/6iGCV2xp8oGHcAxBUvMjxlk5SvUoiGkC9ge9dnXur0DIcgvRUAaeW0LsNBLW9p44
	jnyne6iC4YNJVmKwKUHt6RKZdJPp2FaqnEMs+MDxtAeLV9+T6F0JSdWYqbsg==
X-Received: by 2002:a05:6a00:44cc:b0:874:708d:b63d with SMTP id d2e1a72fcca58-874defffedemr19574178b3a.30.1790044064186;
        Mon, 21 Sep 2026 19:27:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:44cc:b0:874:708d:b63d with SMTP id
 d2e1a72fcca58-874defffedemr19574137b3a.30.1790044063638; Mon, 21 Sep 2026
 19:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com> <B7328085242CCEBC+79e771a5-04e6-4265-ab84-6c2848c0aa3c@linux.spacemit.com>
In-Reply-To: <B7328085242CCEBC+79e771a5-04e6-4265-ab84-6c2848c0aa3c@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 07:57:30 +0530
X-Gm-Features: AcwNN1WQVh60GhXWjN0tWHimbpuIGnpll_is9o_jRl113Lwwea-Ls66qRT80Qqo
Message-ID: <CAHuiULD2JtbzB_XzatuqbJ3WKKaXcCccvVLuyuXbQHpZfpL9_g@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Zane Leung <liangzhen@linux.spacemit.com>
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
        Anup Patel <anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab1e7a7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=lv0vYI88AAAA:8 a=EUspDBNiAAAA:8
 a=u5_W_ptwCWc4fyQ0cBgA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-ORIG-GUID: vVNDi0Ud9bPBVI5PLy_RBIGNBm0R7Tas
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzMiBTYWx0ZWRfXzHvDR+2sPWEy
 iSQBF9e67YEWp6FM96AC5f758K6Hm04cdUicdBfy2iwoeUAId0GEfulAdVvUuL96pplfkM67td+
 zXSyEXlpEe120w6Q32zOW37NQxCdWTntbt9VF61dmk2oOIc8Q7oSDPXa/ft15iDYJClPzeApXq2
 o8aN8gBQUWzeOBQBzlaeMaA4tGtZtC6qLqFvJHPIXrfkFbSK8VkQI4CN3PlQ6hAZZZBA44EnzVS
 CQN4zMOIKKMcTfh3yLPN3tzAxFsNKZfYZorBmgzC+AAz4a3lfjIRougFRbJe2ta9JCYFLI/s3CA
 nARqbt3GXQN3Sd09bFtVPD6l/c77P/q3STH0lwX9+dcqGMIadEisJ5bqRca1ttUoUFcF6YtwnKm
 WAFYLI7xPryb6FqJ3Htk9l2dghayvLc6qNJDwCPU60CfZfagUyPTensKc1mNbg5K8x7hCRSeoWJ
 KH6LF1Vd25+Zo59rEAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzMiBTYWx0ZWRfX34R8xfkKH9li
 So5KhXUaZxy1MG/26uPRa2XZobHswvReo00B4XR7OYxVJkEep0k8h8DhOavR+HxfA7B7iMcysft
 ovulVtZTO0JRGcVbrHKtnozOVukFkog=
X-Proofpoint-GUID: vVNDi0Ud9bPBVI5PLy_RBIGNBm0R7Tas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220032

Hi Zane,
On Sun, Sep 20, 2026 at 4:28=E2=80=AFPM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
>
> On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
> > Add initial implementation of RISC-V E-Trace ramsink driver. The ramsin=
k
> > is defined in the RISC-V Trace Control Interface specification.
> >
> > Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
> >  drivers/hwtracing/gtrace/Kconfig           |  15 +
> >  drivers/hwtracing/gtrace/Makefile          |   1 +
> >  drivers/hwtracing/gtrace/rvtrace-ramsink.c | 320 +++++++++++++++++++++
> >  3 files changed, 336 insertions(+)
> >  create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c
> >
> > diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrac=
e/Kconfig
> > index e3a621b59913..de4a3b533591 100644
> > --- a/drivers/hwtracing/gtrace/Kconfig
> > +++ b/drivers/hwtracing/gtrace/Kconfig
> > @@ -41,3 +41,18 @@ config RVTRACE_ENCODER
> >
> >         To compile this driver as a module, choose M here: the module
> >         will be called rvtrace-encoder.
> > +
> > +config RVTRACE_RAMSINK
> > +     tristate "RISC-V Trace Ramsink driver"
> > +     depends on RVTRACE
> > +     select DMA_SHARED_BUFFER
> > +     default y
> > +     help
> > +       This driver provides support for the RISC-V trace ramsink compo=
nent
> > +       which is defined by the RISC-V Trace Control Interface specific=
ation.
> > +       The ramsink is a trace sink which stores the trace data generat=
ed by
> > +       the upstream components into a system memory buffer. The buffer=
 is
> > +       then copied to the perf AUX buffer when tracing using the perf =
tool.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called rvtrace-ramsink.
> > diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtra=
ce/Makefile
> > index 10a74f852115..3e0c68d1b632 100644
> > --- a/drivers/hwtracing/gtrace/Makefile
> > +++ b/drivers/hwtracing/gtrace/Makefile
> > @@ -5,3 +5,4 @@ gtrace-y :=3D gtrace-core.o
> >
> >  obj-$(CONFIG_RVTRACE) +=3D rvtrace-platform.o
> >  obj-$(CONFIG_RVTRACE_ENCODER) +=3D rvtrace-encoder.o
> > +obj-$(CONFIG_RVTRACE_RAMSINK) +=3D rvtrace-ramsink.o
> > diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtra=
cing/gtrace/rvtrace-ramsink.c
> > new file mode 100644
> > index 000000000000..7ed25cf364a7
> > --- /dev/null
> > +++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
> > @@ -0,0 +1,320 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/gtrace.h>
> > +#include <linux/types.h>
> > +#include <linux/sizes.h>
> > +#include <uapi/linux/perf_event.h>
> > +#include "rvtrace.h"
> > +
> > +#define RVTRACE_RAMSINK_STARTLOW_OFF         0x010
> > +#define RVTRACE_RAMSINK_STARTHIGH_OFF                0x014
> > +#define RVTRACE_RAMSINK_LIMITLOW_OFF         0x018
> > +#define RVTRACE_RAMSINK_LIMITHIGH_OFF                0x01c
> > +#define RVTRACE_RAMSINK_WPLOW_OFF            0x020
> > +#define RVTRACE_RAMSINK_WPHIGH_OFF           0x024
> > +#define RVTRACE_RAMSINK_WPLOW_WRAP           0x1
> > +#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT              0x4
> > +#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT  0x8
> > +
> > +enum rvtrace_ramsink_mode {
> > +     MODE_SRAM,
> > +     MODE_SMEM
> > +};
> > +
> > +struct rvtrace_ramsink_priv {
> > +     size_t size;
> > +     void *va;
> > +     dma_addr_t start;
> > +     dma_addr_t end;
> > +     enum rvtrace_ramsink_mode mode;
> > +     bool stop_on_wrap;
> > +     int mem_acc_width;
> > +     u64 prev_wp;
> > +};
> > +
> > +struct trace_buf {
> > +     void *base;
> > +     size_t cur;
> > +     size_t len;
> > +};
> > +
> > +static int rvtrace_ramsink_start(struct gtrace_component *comp)
> > +{
> > +     int ret;
> > +
> > +     ret =3D gtrace_enable_component(comp);
> > +     if (ret)
> > +             dev_err(&comp->dev, "failed to start ramsink.\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static int rvtrace_ramsink_stop(struct gtrace_component *comp)
> > +{
> > +     int ret;
> > +
> > +     ret =3D gtrace_disable_component(comp);
> > +     if (ret) {
> > +             dev_err(&comp->dev, "failed to stop ramsink.\n");
> > +             return ret;
> > +     }
> > +
> > +     return rvtrace_comp_poll_empty(comp);
> > +}
> > +
> > +static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf =
*dst, size_t size)
> > +{
> > +     int bytes_dst, bytes_src, bytes;
> > +     void *dst_addr, *src_addr;
> > +
> > +     /* If destination cannot hold entire source buffer then write onl=
y the latest data. */
> > +     if (dst->len < size) {
> > +             src->cur =3D (src->cur + size - dst->len) % src->len;
> > +             size =3D dst->len;
> > +     }
> > +
> > +     while (size) {
> > +             src_addr =3D src->base + src->cur;
> > +             dst_addr =3D dst->base + dst->cur;
> > +
> > +             /* Ensure that there are no OOB memory accesses */
> > +             if (dst->len - dst->cur < size)
> > +                     bytes_dst =3D dst->len - dst->cur;
> > +             else
> > +                     bytes_dst =3D size;
> > +
> > +             if (src->len - src->cur < size)
> > +                     bytes_src =3D src->len - src->cur;
> > +             else
> > +                     bytes_src =3D size;
> > +             bytes =3D bytes_dst < bytes_src ? bytes_dst : bytes_src;
> > +             memcpy(dst_addr, src_addr, bytes);
> > +             dst->cur =3D (dst->cur + bytes) % dst->len;
> > +             src->cur =3D (src->cur + bytes) % src->len;
> > +             size -=3D bytes;
> > +     }
> > +}
> > +
> > +static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *c=
omp,
> > +                                         struct gtrace_perf_auxbuf *bu=
f,
> > +                                         u64 *format)
> > +{
> > +     struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev)=
;
> > +     struct trace_buf src, dst;
> > +     u32 wp_low, wp_high;
> > +     size_t bytes =3D 0;
> > +     bool wrap;
> > +     u64 wp;
> > +
> > +     dst.base =3D buf->base;
> > +     dst.len =3D buf->length;
> > +     dst.cur =3D buf->pos;
> > +     src.base =3D priv->va;
> > +     src.len =3D priv->size;
> > +     wp_low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> > +     wp_high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF=
);
> > +     wp =3D (u64)(wp_high) << 32 | wp_low;
> > +     wrap =3D wp & RVTRACE_RAMSINK_WPLOW_WRAP;
> > +     wp &=3D ~RVTRACE_RAMSINK_WPLOW_WRAP;
> > +     if (wrap) {
> > +             gtrace_write32(comp->pdata, lower_32_bits(priv->start),
> > +                             RVTRACE_RAMSINK_WPLOW_OFF);
> > +             gtrace_write32(comp->pdata, upper_32_bits(priv->start),
> > +                             RVTRACE_RAMSINK_WPHIGH_OFF);
> > +             src.cur =3D wp - priv->start;
> > +             priv->prev_wp =3D priv->start;
> > +             /*
> > +              * There is no way to tell if trRamWp wrapped around more=
 than once. As a
> > +              * result priv->prev_wp can't be used and the entire buff=
er must be copied
> > +              * even though some data might be duplicated.
> > +              */
> > +             bytes =3D priv->size;
> > +     } else {
> > +             src.cur =3D  priv->prev_wp - priv->start;
> > +             bytes =3D wp - priv->prev_wp;
> > +             priv->prev_wp =3D wp;
> > +     }
> > +
> > +     tbuf_to_pbuf_copy(&src, &dst, bytes);
> > +     dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
> > +     *format =3D PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
> > +     return bytes;
> > +}
> > +
> > +static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
> > +                                  struct rvtrace_ramsink_priv *priv)
> > +{
> > +     struct device *pdev =3D comp->pdata->dev;
> > +     u64 start_min, limit_max, end;
> > +     u32 low, high;
> > +     int ret;
> > +
> > +     /* Probe min and max values for start and limit registers */
> > +     gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> > +     gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF=
);
> > +     start_min =3D (u64)(high) << 32 | low;
> > +
> > +     gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_=
OFF);
> > +     gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH=
_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF=
);
> > +     limit_max =3D (u64)(high) << 32 | low;
> > +
> > +     /* Set DMA mask based on the maximum allowed limit address */
> > +     ret =3D dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_=
max)));
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->va =3D dma_alloc_coherent(pdev, priv->size, &priv->start, G=
FP_KERNEL);
> > +     if (!priv->va)
> > +             return -ENOMEM;
> > +
> > +     priv->end =3D priv->start + priv->size;
> > +     priv->prev_wp =3D priv->start;
> > +     if (priv->end <=3D start_min || priv->start >=3D limit_max) {
> > +             dma_free_coherent(pdev, priv->size, priv->va, priv->start=
);
> > +             dev_err(&comp->dev, "DMA memory not addressable by device=
\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* Setup ram sink start addresses */
> > +     if (priv->start < start_min) {
> > +             dev_warn(&comp->dev, "Ramsink start address updated from =
%pad to %pad\n",
> > +                      &priv->start, &start_min);
> > +             priv->va +=3D start_min - priv->start;
> > +             priv->start =3D start_min;
> > +     }
> > +
> > +     gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_R=
AMSINK_STARTLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_R=
AMSINK_STARTHIGH_OFF);
> > +     gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_R=
AMSINK_WPLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_R=
AMSINK_WPHIGH_OFF);
> > +     /* Setup ram sink limit addresses */
> > +     if (priv->end > limit_max) {
> > +             dev_warn(&comp->dev, "Ramsink limit address updated from =
%pad to %pad\n",
> > +                      &priv->end, &limit_max);
> > +             priv->end =3D limit_max;
> > +             priv->size =3D priv->end - priv->start;
> > +     }
> > +
> > +     /* Limit address needs to be set to end - mem_access_width to avo=
id overflow */
> > +     end =3D priv->end - priv->mem_acc_width;
> > +     gtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_L=
IMITLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_L=
IMITHIGH_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF=
);
> > +     end =3D (u64)(high) << 32 | low;
> > +     if (end !=3D (priv->end - 4)) {
> > +             dev_warn(&comp->dev, "Ramsink limit address updated from =
%pad to %pad\n",
> > +                      &priv->end, &end);
> > +             priv->end =3D end;
> > +             priv->size =3D priv->end - priv->start;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int rvtrace_ramsink_setup(struct gtrace_component *comp)
> > +{
> > +     struct rvtrace_ramsink_priv *priv;
> > +     u32 trram_ctrl;
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     /* Derive RAM sink memory size based on component implementation =
ID */
> > +     switch (comp->pdata->impid) {
> > +     default:
> > +             priv->size =3D SZ_1M;
> > +             priv->mode =3D MODE_SMEM;
> > +             priv->stop_on_wrap =3D false;
> > +             priv->mem_acc_width =3D 4;
> > +             break;
> > +     }
> > +
>
> I think `trram_ctrl` should not be written during the `probe`. We may mod=
ify `rvtrace_ramsink_priv`
>
> through sysfs or perf events.
I think we can set stop_on_wrap later but mode must be set during prob.e
>
> > +     trram_ctrl =3D gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_=
OFFSET);
> > +     trram_ctrl |=3D priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
> > +     gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OF=
FSET);
> > +     trram_ctrl =3D gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_=
OFFSET);
> > +     dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_=
CTRL_MODE_SHIFT) & 0x1 ?
> > +              "SMEM" : "SRAM");
> > +
> > +     trram_ctrl |=3D priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WR=
AP_SHIFT;
> > +     gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OF=
FSET);
> > +
> > +     ret =3D rvtrace_ramsink_setup_buf(comp, priv);
> > +     if (!ret)
> > +             dev_set_drvdata(&comp->dev, priv);
> > +
> > +     return ret;
> > +}
> > +
> > +static void rvtrace_ramsink_cleanup(struct gtrace_component *comp)
> > +{
> > +     struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev)=
;
> > +
> > +     dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->s=
tart);
> > +}
> > +
> > +static int rvtrace_ramsink_probe(struct gtrace_component *comp)
> > +{
> > +     int ret;
> > +
> > +     ret =3D rvtrace_ramsink_setup(comp);
> > +     if (ret)
> > +             return dev_err_probe(&comp->dev, ret, "failed to setup ra=
msink.\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static void rvtrace_ramsink_remove(struct gtrace_component *comp)
> > +{
> > +     rvtrace_ramsink_cleanup(comp);
> > +}
> > +
> > +static const struct gtrace_component_id rvtrace_ramsink_ids[] =3D {
> > +     { .type =3D GTRACE_RVTRACE_RAMSINK,
> > +       .version =3D rvtrace_component_mkversion(1, 0), },
> > +     {},
> > +};
> > +
> > +static struct gtrace_driver rvtrace_ramsink_driver =3D {
> > +     .id_table =3D rvtrace_ramsink_ids,
> > +     .copyto_auxbuf =3D rvtrace_ramsink_copyto_auxbuf,
> > +     .stop =3D rvtrace_ramsink_stop,
> > +     .start =3D rvtrace_ramsink_start,
> > +     .probe =3D rvtrace_ramsink_probe,
> > +     .remove =3D rvtrace_ramsink_remove,
> > +     .driver =3D {
> > +             .name =3D "rvtrace-ramsink",
> > +     },
> > +};
> > +
> > +static int __init rvtrace_ramsink_init(void)
> > +{
> > +     return gtrace_register_driver(&rvtrace_ramsink_driver);
> > +}
> > +
> > +static void __exit rvtrace_ramsink_exit(void)
> > +{
> > +     gtrace_unregister_driver(&rvtrace_ramsink_driver);
> > +}
> > +
> > +module_init(rvtrace_ramsink_init);
> > +module_exit(rvtrace_ramsink_exit);
> > +
> > +/* Module information */
> > +MODULE_AUTHOR("Mayuresh Chitale");
> > +MODULE_DESCRIPTION("RISC-V E-Trace Ramsink Driver");
> > +MODULE_LICENSE("GPL");
