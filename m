Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EEA1632DD
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776771053; cv=pass; b=snF6dREqqifJDp3pkQXavrUzGOmfJb8ICS20+HbCA1lqxl4OuneC94+2P9wumsA7BxJ0GF+aTO7XhPbj/uq8z80khn3oNgb+79ulZjFgcoAvASfxQ6vD44bzH0hCF7Sh3wlMPkN5aOpNGH4D9DyVNC/zXGLhCRTKtpKjGLwEpMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776771053; c=relaxed/simple;
	bh=tegeRdm/Nmm4AnfOyBMKhOyt32CVBvQ7GNl/7f9QvPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7yxU5gzRTqn+MnIm3UjVkAwk8xNLeSwTiJ+FACoYUZkVpxAl1qqh6KxQN3ydOPf7796rU/vWxv9eG7lQrE0hFRo5nXxzkgDlQY/Ul3DI4RXPqFCUVlxM8mZjtgVH2W6JAHCF9NVEbGOtxvwAZvdwjPydYkSftQhOLbpVr6LdXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rf1uwfEh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZhkzBsn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rf1uwfEh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZhkzBsn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA2bna1809111
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 11:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfyfClkGTAri8kKcUTqJ8bVSA067l/hfV0cYnzDpRhI=; b=Rf1uwfEhsmt+ISmI
	zcnh7TDfvmNHHya/6TJMqSGr6dlibLuW4PEzP8bRfKyGD/y7MrnTDKcVU9NlhN6z
	b0DzspN0B+1NHxcACrmSQb/yxUEf9HV6c/YbZ5i348kJVu22856TZN3IE1BOrI1/
	cLMm+ygG1nvPqBkIp0NtKy0AiDw/+R8MstkDsKJcAx7vPDLyrBk1whtD7X0h3oEE
	rx8hJi3qb3qXqNdsiCU8iVhi+2B5azx67YHgOtSB4OSJ9oxHqUIj+o1roEvMRaaq
	w4W/eLmML1bKykUEjIi5VGMya0cH1I7Myp2IkVmpDnO/pWEb8X25goD0oEtFZp4V
	Xf0lNg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp74xr8a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 11:30:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-612d26038fbso1404277137.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776771050; cv=none;
        d=google.com; s=arc-20240605;
        b=cXGyCoPQo75cqQzC/Gm+ZNvUt6qNLITKVo8SQoaplaXggjS7o41mgPo9OD3+rl/od3
         2iCxubiseUkbV1DI4d/prqG6vntQYZibyHOOhnsPhF2X5HBUyUzF0e1lj3Euuqk0jG/J
         vvAMrAmnuS39wYP7h9vEe+NSq0M01iagIYk/d4THpb+jLSgvM00F68ctt8NeyNb4R/JM
         xecWqXKISYtvGxzpD3cOHDVapNZrDogOwZkncVnrjNDPPO64Y6pRm1KDfWIwGIq4mw1m
         zK0qBp2sSprOktC3yAQdW7BE9HzJc1sI8TSaGG/oBuylIwE16JxaDdrgi9zmc+q2NQOj
         Cj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SfyfClkGTAri8kKcUTqJ8bVSA067l/hfV0cYnzDpRhI=;
        fh=JR6oAQMRnwZXLeE0IhazVNjfdgIkpD119xbAiI7fEZI=;
        b=RFsjJX8g+0rNicQvP8+IglGDylHErvXxD39saUp2x0cORoLGmQrKBSBzviX63sbO0c
         rV4pDHLyEQNzGYprsrLVh0ZeU19AEXMyXHogqPHsYFv63+6YtYsJC9ZDQSOQv6wHJjpH
         h2TJ3osYD3YdSU45iq9p9bbXveJNoDsx8/37ngqtyR5GOD7iqfgJiQKA0q2QmePUJF0R
         6Xq+EwBEFPSw2rj435kdVnMpjQfIm6nZGEg9iqHz16JRHy4KjA3nXK3qNIxCMBVEQ8Lc
         8rItR3pk0YmT7SXEHJ5aerFq5RdSJiG4193UmIsvEI1xwBsqlZQ5dPcrKDOyxJGkYO9T
         VFsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776771050; x=1777375850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfyfClkGTAri8kKcUTqJ8bVSA067l/hfV0cYnzDpRhI=;
        b=FZhkzBsnZCtK0m9otAqlRtvfajtUtuhJh9gNfHTTyh74LhNrvjM2T/jZWd/11goLX2
         AYKtK3VLkFOXx0/T4mu2vmCRZX0pmY6GZbYWtM8vJAht/8PyRFmyi//El9SC5henn7nl
         ZaCM3mBg3oFfNrw68iXhN2h2fyqKgSu/Jur1Z5R9hVMD/G9/liaXM+GeyvH/rp4hymul
         jUJVF1Cxi2vj4OSyu8pHJk7ZpPHeekxagRX0CVvZFiZANaN70pjbHNuoY5yVns4btoFl
         +v2lGgJaR2RDYBvPkbgAM78mf0EZ94Cnqo4v4cRwvogeXrVaUE1cfROrqEab6kLgbecN
         KxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776771050; x=1777375850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SfyfClkGTAri8kKcUTqJ8bVSA067l/hfV0cYnzDpRhI=;
        b=q0XbhJeZhgMsZxXqR7JkGh6fzHPHxzEyOshIrWEyqbhloLSljbjEZqHMxIykdTqlZ6
         10EXdTpm1kOQP/5C0DXwqzV7bYj2qhXXF4Md/W/kp5Lu8ZABdkzcPlYfZGQY8RHuflbQ
         ZdsnJi1b8OypvYkdszMe9emq7f30arWkASQLDXuHy1ze2MXXur32bk3RYakCrlBEj5k+
         rmTO9QQS+lRHNoWZK1wa0ZnnJVtsGzND/j4CB3L9JZVy6qxc3KLA8rjJWIhtjO7PNnUU
         0Q9TtI0Ow448eiQP4p+1vVfY6VJuMSUtdMtD8/FYKRKXbr9EJCyeh3J+KbCGgAx1U9Hk
         Yr4w==
X-Forwarded-Encrypted: i=1; AFNElJ8kGW/zTAOwJarx5Nf4TbLYUxB3sr/RY5mT9h/Ykgl6ef8W427LEwN8dObWgMfKAXp93CBjXub4sOpT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ILkllUZvsNhpagkVcH4pQxlFSBoPbR6/OyXdFC7YsXQQtGIn
	xWniV0ntKVG8xV7OLNA/7PxSashTr4CFRUd2HbiVVDAXExH6xeEU6DWGTZPQ31QGrf6W+hVhsTb
	v5NZdO+zVYA00HJs183RqiakwyoMGGbt3ZGSrAzxRkBMnO/ikaJFG30cdbTakZ+rkPfgpfmaUvd
	bhy/W3BSqCEVzxo9Qm5Zeoj9CNo6vwsypUnkTCSm0=
X-Gm-Gg: AeBDieuWL+YBdMMHwfM+S/C9GCZxhbEOXrbVN3TlVNroFJWSiXWYovZPLd7zl6Nhbgp
	BDdHzLS/6o/yuZwapn+n5MevynhFuudkvNjzTUnQwUOOww+FQnn5W5LNTXv2OYR6eelTKghq2ZZ
	erq4dzlf6HKhZYUbHrIzSNoU3zOajJfmp5Xm1L6y/F9w4OCakMjpYB9r0Ca3XYsl+6INJrpZba0
	Q4+uJAOGb2mraTB5Q==
X-Received: by 2002:a05:6102:2c0c:b0:612:13af:f5e9 with SMTP id ada2fe7eead31-616f7945bafmr8886401137.29.1776771049999;
        Tue, 21 Apr 2026 04:30:49 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0c:b0:612:13af:f5e9 with SMTP id
 ada2fe7eead31-616f7945bafmr8886358137.29.1776771049398; Tue, 21 Apr 2026
 04:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
 <20260225062448.4027948-8-anup.patel@oss.qualcomm.com> <aeC2gUsXGy3mr8Zo@EricL-ThinkPadX1-TW>
In-Reply-To: <aeC2gUsXGy3mr8Zo@EricL-ThinkPadX1-TW>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 17:00:38 +0530
X-Gm-Features: AQROBzAzB1SRNvgAHb8DkuScNSSb-OWB59vUo6c4qYRo5uDOFc6K9P1QJuENMmc
Message-ID: <CAHuiULDgaFDeGrguAHU6bxEQxHvny8EqrQf0X5hqJm9JhFoiVA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] rvtrace: Add trace ramsink driver
To: Eric Lin <eric.lin@sifive.com>
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
        Liang Kan <kan.liang@linux.intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Vq8Txe2n c=1 sm=1 tr=0 ts=69e75fea cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=t8-Lfm66UKvC4ahEoX4A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: tAsF31ZdJ0_tLp5Hp9oxZcHNTyxsN24t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDExMyBTYWx0ZWRfXxE0do35cajyK
 ReOYmC+UTtwSETqMqZaCX4ba8IHvI3D9y+V5QBY88Hr8PIHtcUY/IJusgr1tMdejPDSiMlJSkW9
 iH7zbqZv1CovLLKyPHCyAesMRSQu7ylnTZB9/L3VG1uqTj7DbvPzplzKYWnFtOZSJ1NveszsiV6
 HI8B5M1si81wkZ0hjfhXhruUeqnnDQSNQgSRh5cGB2YW8vo7qvJ2vgEEyAgryDvHp3QyZgTg6Oj
 g0ys8ZBSdAjPGDv900/WGirGzDnNScl73BvTaTluVPnAFTW+MS+JDYVZ03B66dPQraPp/bMyu/t
 NGUQHxje+wRHw1V4JuCXmjaGeoNCX+CQn5bXSC7VG0/CbXKsT7KuVpIX6SFS6uGJZLiZe876O78
 3cBj/lRUdL2N5R7T+DVwTh8kSnDSpsGnfa//LIRFvgdfNMZBPo5vsPJa1yHcPOrAipuZeunhBo9
 kMQiE3E2YLh9vlMCqOw==
X-Proofpoint-ORIG-GUID: tAsF31ZdJ0_tLp5Hp9oxZcHNTyxsN24t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210113

Hi Eric,

On Thu, Apr 16, 2026 at 3:44=E2=80=AFPM Eric Lin <eric.lin@sifive.com> wrot=
e:
>
> On Wed, Feb 25, 2026 at 11:54:43AM +0530, Anup Patel wrote:
>
> Hi Anup,
>
> > From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> >
> > Add initial implementation of RISC-V trace ramsink driver. The ramsink
> > is defined in the RISC-V Trace Control Interface specification.
> >
> > Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
> >  drivers/hwtracing/rvtrace/Kconfig           |   9 +
> >  drivers/hwtracing/rvtrace/Makefile          |   1 +
> >  drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 322 ++++++++++++++++++++
> >  3 files changed, 332 insertions(+)
> >  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> >
> > diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtr=
ace/Kconfig
> > index ba35c05f3f54..0577f9acb858 100644
> > --- a/drivers/hwtracing/rvtrace/Kconfig
> > +++ b/drivers/hwtracing/rvtrace/Kconfig
> > @@ -21,3 +21,12 @@ config RVTRACE_ENCODER
> >       default y
> >       help
> >         This driver provides support for RISC-V Trace Encoder component=
.
> > +
> > +config RVTRACE_RAMSINK
> > +     tristate "RISC-V Trace Ramsink driver"
> > +     depends on RVTRACE
> > +     select DMA_SHARED_BUFFER
> > +     default y
> > +     help
> > +       This driver provides support for Risc-V E-Trace Ramsink
> > +       component.
> > diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvt=
race/Makefile
> > index f320693a1fc5..122e575da9fb 100644
> > --- a/drivers/hwtracing/rvtrace/Makefile
> > +++ b/drivers/hwtracing/rvtrace/Makefile
> > @@ -3,3 +3,4 @@
> >  obj-$(CONFIG_RVTRACE) +=3D rvtrace.o
> >  rvtrace-y :=3D rvtrace-core.o rvtrace-platform.o
> >  obj-$(CONFIG_RVTRACE_ENCODER) +=3D rvtrace-encoder.o
> > +obj-$(CONFIG_RVTRACE_RAMSINK) +=3D rvtrace-ramsink.o
> > diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtr=
acing/rvtrace/rvtrace-ramsink.c
> > new file mode 100644
> > index 000000000000..5393423c8f28
> > --- /dev/null
> > +++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> > @@ -0,0 +1,322 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/rvtrace.h>
> > +#include <linux/types.h>
> > +#include <linux/sizes.h>
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
> > +};
> > +
> > +struct trace_buf {
> > +     void *base;
> > +     long cur;
> > +     size_t len;
> > +};
> > +
> > +static int rvtrace_ramsink_start(struct rvtrace_component *comp)
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
> > +     if (ret)
> > +             dev_err(&comp->dev, "failed to start ramsink.\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static int rvtrace_ramsink_stop(struct rvtrace_component *comp)
> > +{
> > +     int ret;
> > +     u32 val;
> > +
> > +     val =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET=
);
> > +     val &=3D ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> > +     rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> > +     ret =3D rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFS=
ET,
> > +                            RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
> > +                            comp->pdata->control_poll_timeout_usecs);
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
> > +static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *=
comp,
> > +                                         struct rvtrace_perf_auxbuf *b=
uf)
> > +{
> > +     struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev)=
;
> > +     size_t size_wp_end =3D 0, size_start_wp =3D 0;
> > +     struct trace_buf src, dst;
> > +     u32 wp_low, wp_high, trram_ctrl;
> > +     u64 buf_cur_head;
> > +
> > +     dst.base =3D buf->base;
> > +     dst.len =3D buf->length;
> > +     dst.cur =3D buf->pos;
> > +     src.base =3D priv->va;
> > +     src.len =3D priv->size;
> > +     wp_low =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF)=
;
> > +     wp_high =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OF=
F);
> > +     buf_cur_head =3D (u64)(wp_high) << 32 | wp_low;
> > +     trram_ctrl =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL=
_OFFSET);
>
> The trram_ctrl is not used. I think we should remove it.
>
Yes.
> > +     if (buf_cur_head & 0x1) {
> > +             buf_cur_head &=3D ~RVTRACE_RAMSINK_WPLOW_WRAP;
> > +             rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
> > +                             RVTRACE_RAMSINK_WPLOW_OFF);
> > +             rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
> > +                             RVTRACE_RAMSINK_WPHIGH_OFF);
> > +             src.cur =3D buf_cur_head - priv->start;
> > +             size_wp_end =3D priv->end - buf_cur_head;
> > +             tbuf_to_pbuf_copy(&src, &dst, size_wp_end);
> > +     }
> > +
> > +     src.cur =3D 0;
> > +     size_start_wp =3D buf_cur_head - priv->start;
> > +     tbuf_to_pbuf_copy(&src, &dst, size_start_wp);
> > +     dev_dbg(&comp->dev, "Copied %zu bytes\n", size_wp_end + size_star=
t_wp);
>
> Currently, rvtrace_ramsink_copyto_auxbuf() only resets the RAM sink
> Write Pointer (WP) if a trace buffer wrap has occurred. If no wrap
> occurs, it copies the trace data from the buffer's start address to
> the current WP, but the WP is not reset to buffer's start address.
>
> This causes an issue during process context switches. When a traced
> program is context-switched out, the trace data is copied to the
> perf AUX buffer. If the WP is not reset at this point, the next
> time the program is scheduled and subsequently switched out, the
> function will once again copy from the start of the buffer up to the
> new WP. This unintentionally re-copies the old trace data from the
> previous scheduled slice.
>
Yes. I will fix in the next version.
> Regards,
> Eric Lin
>
> > +     return (size_wp_end + size_start_wp);
> > +}
> > +
> > +static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
> > +                                  struct rvtrace_ramsink_priv *priv)
> > +{
> > +     struct device *pdev =3D comp->pdata->dev;
> > +     u64 start_min, limit_max, end;
> > +     u32 low, high;
> > +     int ret;
> > +
> > +     /* Probe min and max values for start and limit registers */
> > +     rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> > +     rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> > +     low =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF)=
;
> > +     high =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OF=
F);
> > +     start_min =3D (u64)(high) << 32 | low;
> > +
> > +     rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW=
_OFF);
> > +     rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIG=
H_OFF);
> > +     low =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF)=
;
> > +     high =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OF=
F);
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
> > +     rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_=
RAMSINK_STARTLOW_OFF);
> > +     rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_=
RAMSINK_STARTHIGH_OFF);
> > +     rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_=
RAMSINK_WPLOW_OFF);
> > +     rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_=
RAMSINK_WPHIGH_OFF);
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
> > +     rvtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_=
LIMITLOW_OFF);
> > +     rvtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_=
LIMITHIGH_OFF);
> > +     low =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF)=
;
> > +     high =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OF=
F);
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
> > +static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
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
> > +     trram_ctrl =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL=
_OFFSET);
> > +     trram_ctrl |=3D priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
> > +     rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_O=
FFSET);
> > +     trram_ctrl =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL=
_OFFSET);
> > +     dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_=
CTRL_MODE_SHIFT) & 0x1 ?
> > +              "SMEM" : "SRAM");
> > +
> > +     trram_ctrl |=3D priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WR=
AP_SHIFT;
> > +     rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_O=
FFSET);
> > +
> > +     ret =3D rvtrace_ramsink_setup_buf(comp, priv);
> > +     if (!ret)
> > +             dev_set_drvdata(&comp->dev, priv);
> > +
> > +     return ret;
> > +}
> > +
> > +static void rvtrace_ramsink_cleanup(struct rvtrace_component *comp)
> > +{
> > +     struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev)=
;
> > +
> > +     dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->s=
tart);
> > +}
> > +
> > +static int rvtrace_ramsink_probe(struct rvtrace_component *comp)
> > +{
> > +     int ret;
> > +
> > +     ret =3D rvtrace_ramsink_setup(comp);
> > +     if (ret)
> > +             return dev_err_probe(&comp->dev, ret, "failed to setup ra=
msink.\n");
> > +
> > +     ret =3D rvtrace_enable_component(comp->pdata);
> > +     if (ret)
> > +             return dev_err_probe(&comp->dev, ret, "failed to enable r=
amsink.\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static void rvtrace_ramsink_remove(struct rvtrace_component *comp)
> > +{
> > +     int ret;
> > +
> > +     ret =3D rvtrace_disable_component(comp->pdata);
> > +     if (ret)
> > +             dev_err(&comp->dev, "failed to disable ramsink.\n");
> > +
> > +     rvtrace_ramsink_cleanup(comp);
> > +}
> > +
> > +static struct rvtrace_component_id rvtrace_ramsink_ids[] =3D {
> > +     { .type =3D RVTRACE_COMPONENT_TYPE_RAMSINK,
> > +       .version =3D rvtrace_component_mkversion(1, 0), },
> > +     {},
> > +};
> > +
> > +static struct rvtrace_driver rvtrace_ramsink_driver =3D {
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
> > +     return rvtrace_register_driver(&rvtrace_ramsink_driver);
> > +}
> > +
> > +static void __exit rvtrace_ramsink_exit(void)
> > +{
> > +     rvtrace_unregister_driver(&rvtrace_ramsink_driver);
> > +}
> > +
> > +module_init(rvtrace_ramsink_init);
> > +module_exit(rvtrace_ramsink_exit);
> > +
> > +/* Module information */
> > +MODULE_AUTHOR("Mayuresh Chitale");
> > +MODULE_DESCRIPTION("RISC-V Trace Ramsink Driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.43.0
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
