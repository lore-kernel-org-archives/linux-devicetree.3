Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FD52ECD3A
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356330; cv=pass; b=D8Oc8hb7bEC9qj+VUEh8jMfll5svI4zijqhzIMLCRXVPzRQ5ZYeOE4qnR4Sst8rWuybSV7XX0pEPViVHs9ScLnYMN4XQowMsHAquXwhMsHXLuZ34he+EyaA7U1G8NGcsVgyy9RhaziPYByjB2/p5G93iVzQmj26to7sKpNbVKlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356330; c=relaxed/simple;
	bh=HNqEUoh31I07ZRwIZuxW6YeXpBoag6XIm1fJD7Hg8ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvNf+D2DzsU04GSAmzRlNa82lwkjnU8RJ+3DVeznhxBXzpPOGTPpyKqJ4PS7DBhyiZVFIq1LEhJaX2iXBJ88w9Dxb0FUuAZAmAzWpgTPnMwKHedI8viEQHmvU+KXONiQFRpAdgq4rtI6isd2bOwYwaJmJat9sNpzDiBuunUhQs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYqeQ/WX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZX+eHPMD; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYqeQ/WX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZX+eHPMD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC38bN1817293
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PkaWfpvZrzJ1zthy/9k/aBIN8VkHKKLsS54lWAJlx6Q=; b=ZYqeQ/WXTZFSMTAH
	fhib3Xm4+WehZg9jC4dVzkpccMum4NwHaB4yWoEXG+RcAMSR8UcVF2KzFcZeQ3Ik
	avfyS+RC7N1XfroBAtWkgC1Pieko6z4BrbsqhLCKtAQ/4NcA6gATj+5Tk9gv34vu
	szehTM/UPgQMCxRSzGe1hSInrx/qVvFM/HuFKGC84eRZ2rLle2JkE7Y3zMTsgaNp
	NT7Wdz4XTQnpPXGx0Vcg8yZVoQ5KUlZpuA3TARrr3MTrp31I73qWn3DeVZkHwy6G
	+Wgu1XFRAoVOt8A3nI9IU6GrZPUlhEB5JTWvApLrrWQ+VWF+N23a2r+7wNmOXoqb
	1YrBpg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9eg6d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:45:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b781542c1so17202961cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774356327; cv=none;
        d=google.com; s=arc-20240605;
        b=bX+wIVfDPkaezMQ1eI4uCek/fgDgkvSSLVfjTEsLu2py9K/ejHC5cdBYkbnrRH1g+H
         MjGi/KxlUj3/b6wfIsHbaAcSghChY3g1PtQ/0AqtknMOTgRLwHT5m1Tx0o/nGT0CAWVy
         x6zlE7q5aP24Jsd+rG9Ucjfr/jT6MK3oW9L/rrY+OO29malZMoiE8quj8mcajCPeMYCL
         kv6RgZ6BlVfkg6tL9GgxJw+mnEQuXVB6JBkgoZd3fdCs4OAXQTFySt3cmXObTLrzwjpk
         8iDSSN4CalO/txVTC283YXC959VisGdYK84QWvRlLoh7+RGNLxfbnbYetzcpoI4voAlH
         JRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PkaWfpvZrzJ1zthy/9k/aBIN8VkHKKLsS54lWAJlx6Q=;
        fh=Dtkatxwuts5DQTfdYod7cbvFCIulcc0GMSveRIVSfn8=;
        b=Z4cjAnx/DMP2EdpqRpmgpyzzA/OzcuhzWgHkOCvmTY30xF8gb2pVUZYxIq7XR5CyJz
         47prMuT5ySvcPqosdj7dSdumOHzLcVVYZBrykRFxQq244APxiqsH2gF/ciS3d3KpL4iP
         62dQrFFp1CzCtLDh9E+Q4VzgdTRuBoE0/BBeppSnx1pPySa+hqUXMYbzCVpbI7OSRQXZ
         vz0eeUcYPem34jAxiDlEgU9w2aK1v/VCBy68xS0CQVx+nUsuwXZGfpR3n2hOqm8WC0r3
         blQ/Fv2Q249DMa+pdL+b+y+VpPGnayrQ0xE18NaFeHcY1ncm6/zQqnxyBembu9T1bif+
         98uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774356327; x=1774961127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkaWfpvZrzJ1zthy/9k/aBIN8VkHKKLsS54lWAJlx6Q=;
        b=ZX+eHPMDl6DIVBa4Turenk20VHq23/+gDGusewPRqXB7mTI7+0JWcvaYC7SAieLstC
         vz6hGQeWvuMZ/o6PYc36g8HJ/n3MuoLuL+7yv9WGTYm3EuHhAKNYlgOIA4PmU7o74EWS
         CQ1kYDE0+zHx70I6wMr7ys73xAQlN9EvJWMjWMbxs+9PVJ4H1offaXp/jsnfuk7BN3Vo
         BZO5fDsW+KYXezY8sG0u9Sh9tRsjvbvRDh38xMzXjZyIgnQQ5xX4xUo0R7G6jNjHBTln
         JViey1Mnb5e2hlsjvhwwnA8KlKRk+rSTRsOq7GbKUGphQgWQCgFhXvKsBoPdVNHNGKcS
         tICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774356327; x=1774961127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PkaWfpvZrzJ1zthy/9k/aBIN8VkHKKLsS54lWAJlx6Q=;
        b=QMsvCuGcUVn8W6IzTAmWuFdE+yRPL5fN/ZubmNQ4FoJRifj4HYOBm389SWt/zct913
         QabdivvRjFPI+pw1doz2dhiZpEvmhrv8DDjyPHus/5CnFSK6LPgV+ERSipTkfX4zh+4K
         KGgiRN4FUEwjl6F59mbOv04Vxip8QqMX4SbVCTxAqJgp5B9Wbc8nRmjxnVZ5bWj531C5
         XtoOCvEgU9Ak8EyJkr7jdS8zTeKwCQfQCKFC0//A8vPfLiy1k8ICTf0o2jTvr4gzkoVV
         nrgdqfhPUulNoKoxqdKfTSAuxUquWDYiPqb6DPociLyF3ImHv+6CeOjmeW2yNUE+l8AL
         Nmyw==
X-Forwarded-Encrypted: i=1; AJvYcCWVmNbuQaHe+/7uIuP/HmgEvazLF/XXc/Nq5UomxeSfx8TTJ+XfX1GLX9trqjd6jN/JGsCK3BX9cPK6@vger.kernel.org
X-Gm-Message-State: AOJu0YyxfQ+WkKvFqPzCqONvriu/J40lB1XomIEoaCCeIWs5OA1LOz3A
	TNgSKL8ceVNvOW90rkAr2GbDXYOAZZ5F2+H9FkENjCvvFyMUjVtHbe9uUY33q2hqBXT9jp8Z6aI
	NfkgHf8DA81odsep1UBVQ4mgnAKmooPgunxxEZcSEY/cDI9dYkyCpPLaYY0obDGO+1NgwGlFv9Z
	2/K8B8rHnjtOEjTCYHTy3LivZxQTD0n0D3Xk1nmtI=
X-Gm-Gg: ATEYQzxBozHkZC/XYGyT94urzRkf60bXiVieCRj6BVoeulWDVxrzcu5qPVTFMtR0hhI
	+RKYSSGtC/wMxYt3rTqGnOymQCFwR1lBbRZuZUThVr57NnTEM7qx8GGYyV/EBu5URkAmcNFgyPI
	jtmR8+Eb0vrOn+rdBRJOTIxnYA5NHK0zJfyivpFpXLyDafuebAk4OKbalRinl5/AmUym2jmox9i
	DVFOfw=
X-Received: by 2002:a05:622a:5817:b0:50b:4cae:e376 with SMTP id d75a77b69052e-50b4caef26amr153506151cf.68.1774356326548;
        Tue, 24 Mar 2026 05:45:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5817:b0:50b:4cae:e376 with SMTP id
 d75a77b69052e-50b4caef26amr153505261cf.68.1774356325930; Tue, 24 Mar 2026
 05:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABvJ_xhtx1Ym8qyr6HsLWnkV6_c=V7TpKOYY3L-gKnVDr87rcA@mail.gmail.com>
 <CABvJ_xj+FtKgLN1Ur36ks7OLNWCy9-AotbfhsF6m1H4ycUSznA@mail.gmail.com> <CABvJ_xj6Pa4MBGqF6Y3va1+Ty-8eCUcxbGsRd78HXMnhyQq6=Q@mail.gmail.com>
In-Reply-To: <CABvJ_xj6Pa4MBGqF6Y3va1+Ty-8eCUcxbGsRd78HXMnhyQq6=Q@mail.gmail.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 18:15:14 +0530
X-Gm-Features: AQROBzBuQeBm9SKjL9_kP4jHxFkSrj9INGGjo-3-bOC1RPzhC3XHqCvUKaMaKEU
Message-ID: <CAHuiULC3dY6WeUx8Kni=xAN=-1S7wtXOyUqTn9cJcaTUwzT0zA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] rvtrace: Add trace ramsink driver
To: Vincent Chen <vincent.chen@sifive.com>
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
        Sunil V L <sunilvl@oss.qualcomm.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 1huIMv-KPFc3uB3KHbBeJ7tZWVXs1LFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMSBTYWx0ZWRfX83aESQeF4KhV
 QlE8AYdnAQ/PK/QQ29nn4hNLKLCy49XJgUa81jItkalaa1J0TxnTWl4b77hmLv2cpPfHjowwer9
 Fhn4o7WIXS2Ao8xCWliKDn/UC+I+PZGwlx1sI5csWWJdkM3pneifBfE3wgV16+onn8Ah29saUiW
 mcXgXZflvfz8JYGPbu1BBM704O2F2GcVcMIkel4wXuRJ/jzBb3DXx6PmEWLmZGq1mOv3+bEKUR4
 /UCZpgOZBHTCAPjhv0vbrMT2vvE8zGIB99wxubwQZfQpF6IqlkEnC7/hEjO+lt62jJUGbiKhOT7
 hKJ0F+Icrd6uo8MWt5V0p0Haf94F9MlC8v4y9ccNQhFKZ9xVEaaFstv5eW0Z2yKk1fplYhiN3OJ
 crddJOh8Ifsey4QjZZYoOqs8RGn7XYvN5ndyf7gznbVJA2lx0qdiCha7+rPmS2iN2sbxdLplwnh
 F0XSd1MbvR7WVXKndyw==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c28767 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=uAEZddm7zgEr9Vov43YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: 1huIMv-KPFc3uB3KHbBeJ7tZWVXs1LFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240101

Hi Vincent,

On Mon, Mar 16, 2026 at 8:50=E2=80=AFAM Vincent Chen <vincent.chen@sifive.c=
om> wrote:
>
> On Fri, Mar 13, 2026 at 5:09=E2=80=AFPM Vincent Chen <vincent.chen@sifive=
.com> wrote:
> >
> > >
> > > Add initial implementation of RISC-V trace ramsink driver. The ramsin=
k
> > > is defined in the RISC-V Trace Control Interface specification.
> > >
> > > Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > > ---
> > >  drivers/hwtracing/rvtrace/Kconfig           |   9 +
> > >  drivers/hwtracing/rvtrace/Makefile          |   1 +
> > >  drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 322 ++++++++++++++++++=
++
> > >  3 files changed, 332 insertions(+)
> > >  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> > >
> > > diff --git a/drivers/hwtracing/rvtrace/Kconfig
> > > b/drivers/hwtracing/rvtrace/Kconfig
> > > index ba35c05f3f54..0577f9acb858 100644
> > > --- a/drivers/hwtracing/rvtrace/Kconfig
> > > +++ b/drivers/hwtracing/rvtrace/Kconfig
> > > @@ -21,3 +21,12 @@ config RVTRACE_ENCODER
> > >   default y
> > >   help
> > >    This driver provides support for RISC-V Trace Encoder component.
> > > +
> > > +config RVTRACE_RAMSINK
> > > + tristate "RISC-V Trace Ramsink driver"
> > > + depends on RVTRACE
> > > + select DMA_SHARED_BUFFER
> > > + default y
> > > + help
> > > +  This driver provides support for Risc-V E-Trace Ramsink
> > > +  component.
> > > diff --git a/drivers/hwtracing/rvtrace/Makefile
> > > b/drivers/hwtracing/rvtrace/Makefile
> > > index f320693a1fc5..122e575da9fb 100644
> > > --- a/drivers/hwtracing/rvtrace/Makefile
> > > +++ b/drivers/hwtracing/rvtrace/Makefile
> > > @@ -3,3 +3,4 @@
> > >  obj-$(CONFIG_RVTRACE) +=3D rvtrace.o
> > >  rvtrace-y :=3D rvtrace-core.o rvtrace-platform.o
> > >  obj-$(CONFIG_RVTRACE_ENCODER) +=3D rvtrace-encoder.o
> > > +obj-$(CONFIG_RVTRACE_RAMSINK) +=3D rvtrace-ramsink.o
> > > diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> > > b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> > > new file mode 100644
> > > index 000000000000..5393423c8f28
> > > --- /dev/null
> > > +++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> > > @@ -0,0 +1,322 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> > > + */
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/rvtrace.h>
> > > +#include <linux/types.h>
> > > +#include <linux/sizes.h>
> > > +
> > > +#define RVTRACE_RAMSINK_STARTLOW_OFF 0x010
> > > +#define RVTRACE_RAMSINK_STARTHIGH_OFF 0x014
> > > +#define RVTRACE_RAMSINK_LIMITLOW_OFF 0x018
> > > +#define RVTRACE_RAMSINK_LIMITHIGH_OFF 0x01c
> > > +#define RVTRACE_RAMSINK_WPLOW_OFF 0x020
> > > +#define RVTRACE_RAMSINK_WPHIGH_OFF 0x024
> > > +#define RVTRACE_RAMSINK_WPLOW_WRAP 0x1
> > > +#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT 0x4
> > > +#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT 0x8
> > > +
> > > +enum rvtrace_ramsink_mode {
> > > + MODE_SRAM,
> > > + MODE_SMEM
> > > +};
> > > +
> > > +struct rvtrace_ramsink_priv {
> > > + size_t size;
> > > + void *va;
> > > + dma_addr_t start;
> > > + dma_addr_t end;
> > > + enum rvtrace_ramsink_mode mode;
> > > + bool stop_on_wrap;
> > > + int mem_acc_width;
> > > +};
> > > +
> > > +struct trace_buf {
> > > + void *base;
> > > + long cur;
> > > + size_t len;
> > > +};
> > > +
> > > +static int rvtrace_ramsink_start(struct rvtrace_component *comp)
> > > +{
> > > + int ret;
> > > + u32 val;
> > > +
> > > + val =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> > > + val |=3D BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> > > + rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> > > + ret =3D rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET=
,
> > > +       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
> > > +       comp->pdata->control_poll_timeout_usecs);
> > > + if (ret)
> > > + dev_err(&comp->dev, "failed to start ramsink.\n");
> > > +
> > > + return ret;
> > > +}
> > > +
> > > +static int rvtrace_ramsink_stop(struct rvtrace_component *comp)
> > > +{
> > > + int ret;
> > > + u32 val;
> > > +
> > > + val =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> > > + val &=3D ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> > > + rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> > > + ret =3D rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET=
,
> > > +       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
> > > +       comp->pdata->control_poll_timeout_usecs);
> > > + if (ret) {
> > > + dev_err(&comp->dev, "failed to stop ramsink.\n");
> > > + return ret;
> > > + }
> > > +
> > > + return rvtrace_comp_poll_empty(comp);
> > > +}
> > > +
> > > +static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_bu=
f
> > > *dst, size_t size)
> > > +{
> > > + int bytes_dst, bytes_src, bytes;
> > > + void *dst_addr, *src_addr;
> > > +
> > > + while (size) {
> > > + src_addr =3D src->base + src->cur;
> > > + dst_addr =3D dst->base + dst->cur;
> > > +
> > > + /* Ensure that there are no OOB memory accesses */
> > > + if (dst->len - dst->cur < size)
> > > + bytes_dst =3D dst->len - dst->cur;
> > > + else
> > > + bytes_dst =3D size;
> > > +
> > > + if (src->len - src->cur < size)
> > > + bytes_src =3D src->len - src->cur;
> > > + else
> > > + bytes_src =3D size;
> > > + bytes =3D bytes_dst < bytes_src ? bytes_dst : bytes_src;
> > > + memcpy(dst_addr, src_addr, bytes);
> > > + dst->cur =3D (dst->cur + bytes) % dst->len;
> > > + src->cur =3D (src->cur + bytes) % src->len;
> > > + size -=3D bytes;
> > > + }
> > > +}
> > > +
> > > +static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component=
 *comp,
> > > +    struct rvtrace_perf_auxbuf *buf)
> > > +{
> > > + struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev);
> > > + size_t size_wp_end =3D 0, size_start_wp =3D 0;
> > > + struct trace_buf src, dst;
> > > + u32 wp_low, wp_high, trram_ctrl;
> > > + u64 buf_cur_head;
> > > +
> > > + dst.base =3D buf->base;
> > > + dst.len =3D buf->length;
> > > + dst.cur =3D buf->pos;
> > > + src.base =3D priv->va;
> > > + src.len =3D priv->size;
> > > + wp_low =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> > > + wp_high =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF)=
;
> > > + buf_cur_head =3D (u64)(wp_high) << 32 | wp_low;
> > > + trram_ctrl =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_O=
FFSET);
> > > + if (buf_cur_head & 0x1) {
> > > + buf_cur_head &=3D ~RVTRACE_RAMSINK_WPLOW_WRAP;
> > > + rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
> > > + RVTRACE_RAMSINK_WPLOW_OFF);
> > > + rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
> > > + RVTRACE_RAMSINK_WPHIGH_OFF);
> > > + src.cur =3D buf_cur_head - priv->start;
> > > + size_wp_end =3D priv->end - buf_cur_head;
> > > + tbuf_to_pbuf_copy(&src, &dst, size_wp_end);
> > > + }
> >
> > Hi Anup,
> > I have two questions about the handling of the wrap case.
> > 1. If I understand correctly, the perf_aux_event has a flag,
> > PERF_AUX_FLAG_TRUNCATED, which is used to indicate whether data loss
> > has occurred within a record slice. Users can use perf commands such
> > as perf report --stats to determine if the trace log contains the
> > complete history. I notice that this driver currently sets
> > stop_on_wrap=3Dfalse unconditionally, which means the hardware will wra=
p
> > around and overwrite old data when the buffer is full. However, I
> > don't see PERF_AUX_FLAG_TRUNCATED being set when wrap occurs.
> > According to other drivers (e.g., ARM CoreSight ETR)
> > ERF_AUX_FLAG_TRUNCATED should NOT be set in snapshot mode because:
> > a) Data overwrite is expected behavior in snapshot mode,
> > b) Setting TRUNCATED prevents the perf core from re-enabling the event
> > Is the current implementation assuming that this driver only supports s=
napshot?
> >
> > 2. Currently, perf tool snapshot mode requires users to explicitly add
> > the "-S" option to perf record. If this driver only supports snapshot
> > mode, do we consider either:
> > a) Reject non-snapshot mode in rvtrace_setup_aux() with an error
> > message like: "RISC-V TCI requires snapshot mode. Please use: perf
> > record -S ..."
> > or
> > b) Emit a warning when snapshot=3Dfalse is detected: "RISC-V TCI:
> > non-snapshot mode not supported, forcing snapshot mode"
> > This would prevent users from unknowingly losing data when the buffer
> > wraps around in non-snapshot mode.
> > What do you think?
> >
> Hi Anup,
>
> Sorry, I noticed that I had some misunderstanding about snapshot mode,
> so I asked a confusing question in my previous email. At this moment,
> we don't need to support snapshot mode, so we don't need to consider
> PERF_AUX_FLAG_TRUNCATED handling for snapshot mode.
>
> Therefore, my question becomes:
> Do we need to set PERF_AUX_FLAG_TRUNCATED here to notify users that
> some data has been lost when the buffer overflows?

Yes, I will add this in the next version.

>
>
> Thanks,
> Vincent Chen
>
> > Thanks,
> > Vincent Chen
> > > +
> > > + src.cur =3D 0;
> > > + size_start_wp =3D buf_cur_head - priv->start;
> > > + tbuf_to_pbuf_copy(&src, &dst, size_start_wp);
> > > + dev_dbg(&comp->dev, "Copied %zu bytes\n", size_wp_end + size_start_=
wp);
> > > + return (size_wp_end + size_start_wp);
> > > +}
> > > +
> > > +static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
> > > +     struct rvtrace_ramsink_priv *priv)
> > > +{
> > > + struct device *pdev =3D comp->pdata->dev;
> > > + u64 start_min, limit_max, end;
> > > + u32 low, high;
> > > + int ret;
> > > +
> > > + /* Probe min and max values for start and limit registers */
> > > + rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> > > + rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> > > + low =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> > > + high =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF)=
;
> > > + start_min =3D (u64)(high) << 32 | low;
> > > +
> > > + rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_O=
FF);
> > > + rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_=
OFF);
> > > + low =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> > > + high =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF)=
;
> > > + limit_max =3D (u64)(high) << 32 | low;
> > > +
> > > + /* Set DMA mask based on the maximum allowed limit address */
> > > + ret =3D dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_ma=
x)));
> > > + if (ret)
> > > + return ret;
> > > +
> > > + priv->va =3D dma_alloc_coherent(pdev, priv->size, &priv->start, GFP=
_KERNEL);
> > > + if (!priv->va)
> > > + return -ENOMEM;
> > > +
> > > + priv->end =3D priv->start + priv->size;
> > > + if (priv->end <=3D start_min || priv->start >=3D limit_max) {
> > > + dma_free_coherent(pdev, priv->size, priv->va, priv->start);
> > > + dev_err(&comp->dev, "DMA memory not addressable by device\n");
> > > + return -EINVAL;
> > > + }
> > > +
> > > + /* Setup ram sink start addresses */
> > > + if (priv->start < start_min) {
> > > + dev_warn(&comp->dev, "Ramsink start address updated from %pad to %p=
ad\n",
> > > + &priv->start, &start_min);
> > > + priv->va +=3D start_min - priv->start;
> > > + priv->start =3D start_min;
> > > + }
> > > +
> > > + rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
> > > RVTRACE_RAMSINK_STARTLOW_OFF);
> > > + rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
> > > RVTRACE_RAMSINK_STARTHIGH_OFF);
> > > + rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
> > > RVTRACE_RAMSINK_WPLOW_OFF);
> > > + rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
> > > RVTRACE_RAMSINK_WPHIGH_OFF);
> > > + /* Setup ram sink limit addresses */
> > > + if (priv->end > limit_max) {
> > > + dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %p=
ad\n",
> > > + &priv->end, &limit_max);
> > > + priv->end =3D limit_max;
> > > + priv->size =3D priv->end - priv->start;
> > > + }
> > > +
> > > + /* Limit address needs to be set to end - mem_access_width to avoid
> > > overflow */
> > > + end =3D priv->end - priv->mem_acc_width;
> > > + rvtrace_write32(comp->pdata, lower_32_bits(end),
> > > RVTRACE_RAMSINK_LIMITLOW_OFF);
> > > + rvtrace_write32(comp->pdata, upper_32_bits(end),
> > > RVTRACE_RAMSINK_LIMITHIGH_OFF);
> > > + low =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> > > + high =3D rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF)=
;
> > > + end =3D (u64)(high) << 32 | low;
> > > + if (end !=3D (priv->end - 4)) {
> > > + dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %p=
ad\n",
> > > + &priv->end, &end);
> > > + priv->end =3D end;
> > > + priv->size =3D priv->end - priv->start;
> > > + }
> > > +
> > > + return 0;
> > > +}
> > > +
> > > +static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
> > > +{
> > > + struct rvtrace_ramsink_priv *priv;
> > > + u32 trram_ctrl;
> > > + int ret;
> > > +
> > > + priv =3D devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
> > > + if (!priv)
> > > + return -ENOMEM;
> > > +
> > > + /* Derive RAM sink memory size based on component implementation ID=
 */
> > > + switch (comp->pdata->impid) {
> > > + default:
> > > + priv->size =3D SZ_1M;
> > > + priv->mode =3D MODE_SMEM;
> > > + priv->stop_on_wrap =3D false;
> > > + priv->mem_acc_width =3D 4;
> > > + break;
> > > + }
> > > +
> > > + trram_ctrl =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_O=
FFSET);
> > > + trram_ctrl |=3D priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
> > > + rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFF=
SET);
> > > + trram_ctrl =3D rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_O=
FFSET);
> > > + dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >>
> > > RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ?
> > > + "SMEM" : "SRAM");
> > > +
> > > + trram_ctrl |=3D priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP=
_SHIFT;
> > > + rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFF=
SET);
> > > +
> > > + ret =3D rvtrace_ramsink_setup_buf(comp, priv);
> > > + if (!ret)
> > > + dev_set_drvdata(&comp->dev, priv);
> > > +
> > > + return ret;
> > > +}
> > > +
> > > +static void rvtrace_ramsink_cleanup(struct rvtrace_component *comp)
> > > +{
> > > + struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev);
> > > +
> > > + dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->sta=
rt);
> > > +}
> > > +
> > > +static int rvtrace_ramsink_probe(struct rvtrace_component *comp)
> > > +{
> > > + int ret;
> > > +
> > > + ret =3D rvtrace_ramsink_setup(comp);
> > > + if (ret)
> > > + return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n")=
;
> > > +
> > > + ret =3D rvtrace_enable_component(comp->pdata);
> > > + if (ret)
> > > + return dev_err_probe(&comp->dev, ret, "failed to enable ramsink.\n"=
);
> > > +
> > > + return ret;
> > > +}
> > > +
> > > +static void rvtrace_ramsink_remove(struct rvtrace_component *comp)
> > > +{
> > > + int ret;
> > > +
> > > + ret =3D rvtrace_disable_component(comp->pdata);
> > > + if (ret)
> > > + dev_err(&comp->dev, "failed to disable ramsink.\n");
> > > +
> > > + rvtrace_ramsink_cleanup(comp);
> > > +}
> > > +
> > > +static struct rvtrace_component_id rvtrace_ramsink_ids[] =3D {
> > > + { .type =3D RVTRACE_COMPONENT_TYPE_RAMSINK,
> > > +  .version =3D rvtrace_component_mkversion(1, 0), },
> > > + {},
> > > +};
> > > +
> > > +static struct rvtrace_driver rvtrace_ramsink_driver =3D {
> > > + .id_table =3D rvtrace_ramsink_ids,
> > > + .copyto_auxbuf =3D rvtrace_ramsink_copyto_auxbuf,
> > > + .stop =3D rvtrace_ramsink_stop,
> > > + .start =3D rvtrace_ramsink_start,
> > > + .probe =3D rvtrace_ramsink_probe,
> > > + .remove =3D rvtrace_ramsink_remove,
> > > + .driver =3D {
> > > + .name =3D "rvtrace-ramsink",
> > > + },
> > > +};
> > > +
> > > +static int __init rvtrace_ramsink_init(void)
> > > +{
> > > + return rvtrace_register_driver(&rvtrace_ramsink_driver);
> > > +}
> > > +
> > > +static void __exit rvtrace_ramsink_exit(void)
> > > +{
> > > + rvtrace_unregister_driver(&rvtrace_ramsink_driver);
> > > +}
> > > +
> > > +module_init(rvtrace_ramsink_init);
> > > +module_exit(rvtrace_ramsink_exit);
> > > +
> > > +/* Module information */
> > > +MODULE_AUTHOR("Mayuresh Chitale");
> > > +MODULE_DESCRIPTION("RISC-V Trace Ramsink Driver");
> > > +MODULE_LICENSE("GPL");
