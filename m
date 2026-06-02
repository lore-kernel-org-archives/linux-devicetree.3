Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1503DA7D0
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399909; cv=pass; b=OzZkcH38OIXNzn17taifXx2tptTN0SgxeSRYX7wRcAmNATDh+1T33KnDC3qx4Rvrwrt2oRQyZwT6y2fa7i85ecyWpaQjZBkG38sedSr9N2PUAQzmcvzBCu1SZCQJAG08OkRQU4c05O8TeC2XCYYNHzAJt+7Er87y2Wzkl2Tm5i0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399909; c=relaxed/simple;
	bh=76TAhfgx1AjEcfoL+99gwjXf8Prp30qVBZolAjrT6l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfWd3PkvCbFXk7rnvX4HcRNRYgbjRQjsRtt8Uv8/+ZkZ/8h7/ps/QF12yjxNIKu6CkQJOFDwqh+PoPIGXvZYzKatNfbtaJHVMyx8ksk30PAmfS1xozlLvRqQP9Wt47n50LaFrucEsOAWpMg+NHtxiYyG9QEdDE8OknVvVaGpqC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNE3kNOw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Twq+J+xn; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNE3kNOw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Twq+J+xn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tiqr1854909
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 11:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mda/j6EyDm1KJxOCvnXRr8yaQnB3DX8BLyXxmxL3WS4=; b=bNE3kNOwED7xSK7J
	m6O8eXrcXo5eN1fFAshvuLkLbxWcveyG5aw6JhhDPuPyzBHfGI+MuJp9f9JjcKeb
	Bjcqv3AWG/2sMgTqM3kOUpLBcv6WuGN8YUO6PcQ0IO4EiieRyfBNC7c5g35wmpmk
	4VxvlIQQsCDtTDOx946YyVhFFJZaFeAlXP6KLfE4obfmZbs9lJZsqNP6bKbiqx24
	uGcaR5DkinrtZuHmyZ+FHtnm592adFXMbhdl2EWlb3LGV9L62oWO2TWW2IFdKBc2
	4s8928U/GOyNRN0m0+HPGOAWJukREG5OigXWR4M8q/n8kGiuwgCEFxzvmdBo5j6N
	LqKcWA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf799b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 11:31:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccdcc89495so109815836d6.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780399904; cv=none;
        d=google.com; s=arc-20240605;
        b=NVnUbXa3oVajEQ/3nr9CacqNnkfZpGbWmHVs/LloOpec/BZ2pZ2j6Yx8hIy2sdRZKr
         1OHPLSqqjpB4Jd6aobk5h8ih+HvUIcB5yDiAhpP0rGIZ4cxhmG1sigvgEt3GLDXY3IjO
         bKdQ/pKpOh1zpmSu7TshFN1djVVcauUOqnhOhfN319jLb7c0pWaYuIPe4qktY9eQm313
         PdWyVZRcZvKhdtUPkzISN1tzwCeoo3B0d0hHARR7+qQh6x1RMYnXNLW2GH2nFcJGqclA
         h07nzbqlO7AP28OrsHvPS7nVfjuToft7uNl0Lc2K3BOjlHS3PIOWlP6G8HAL4N/PK4dn
         xDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mda/j6EyDm1KJxOCvnXRr8yaQnB3DX8BLyXxmxL3WS4=;
        fh=ZDsnCHeaoHE80nxnLX41aTtoJ+50BJLLUthK3BmwrIY=;
        b=LlEipZvXKCvsjX+iTneAUmsBXCMXhBh6+CQU8CSCxfFUQMtMohHwmpO7cngqPT/FDt
         SyP8p9shP8RB03b8kW1FGEOVJyHvt49rNUV4L8ZjeXudKn9p6yP2drxuEVTF7EjPi7N+
         jqCiOKOortUMpQB32OBvLFw+LqAQ0ded0g+7b5M8dsDdviaXYNjOfikxfZN9sq5Ek0nd
         /xJxPzN93kZZUJ1dqiNX9/mR0qoTZ88o42VPZ6BnmY/OyR5VjnBpaDkwRDHX5XEhle17
         WbsuOWyRxTID7cbuht60K1w/wWBXHi92DsSZddfGfcaLi4z2cISLnK4m06mpVYiq44Ge
         tElA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780399904; x=1781004704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mda/j6EyDm1KJxOCvnXRr8yaQnB3DX8BLyXxmxL3WS4=;
        b=Twq+J+xnOPynxpmqaEk7MpHDEqYMmPDbtuFezL6/f12gDZM3qiSip+HR2JU1M0XnqQ
         BQBJB83dhNllv1NsA8UXxvidysxKqYAhpaKUZHbGMmIlO4UgAEOhycW4kzi62AbgoKyb
         8t7Dj2cGHe7H7yTl5+qEqwlkQCy9LtgYrmptyMBO1WI0HQtmMVA0DWOjmK1J7CRohMvj
         ZoIFPHfHurQFI3UfoI2gImlcAuhZuwLNSQ484fu8zF2AcHmyAR1GB4pku+43Fy9t3PI4
         z1/A7JjEyQuJPB/0W/KYPO6SdgKP4YixzXQYmQp2G989viV5aN1mk24bTWf8nBsvh6/e
         jKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399904; x=1781004704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mda/j6EyDm1KJxOCvnXRr8yaQnB3DX8BLyXxmxL3WS4=;
        b=Tvy77BKCOAxpiNrPgRyYlSJjgRKBptH/6es5Fuc8wUZWRj6evVKW9kL8kFsFZktOPv
         hn74TI8Mxf6JlBrqwbjz40W+v5BaKer4Yxh+GUpLV5FhR/ye4+oIhpT/vIVC+p4qixwg
         v794AgrL+KZk4ow81EHQI3shF9osagW9RShOhb0lldXn355t1icJvcFctoMxCKuoTL7r
         iebWZlUn1zV6ZBAXb8bGm8dGWD2n3tg7SuI3YQBE+4ZmShtiYftfk1GQeevEJAIlbM3y
         6jNuUuAJcyUIjkWP9+sipWkWilH4iHO7MbAdiKtv7hZ2dzG42ygaE7BdeFcw/MRfMpPN
         pgwA==
X-Forwarded-Encrypted: i=1; AFNElJ9H7E6xI3WOIGfEWn0RejJQloBhTgQ3axvg7IUxC47VbmIY0hPtBSwsuapzjAlX/elnzQPDe2DXek39@vger.kernel.org
X-Gm-Message-State: AOJu0YwFw2c8IfhifOrhNLEtFXRfMuEqwwgCxDR/P9dZ/GajnaEAQ29j
	CgdH9B98angcXPmrTfhw/kJjUQOVuWrMVub9pMYW3KJyVi3raBMXDBxb33hhQk8PFB9JI5buSLl
	beIKcHhwG8IXCrqoM3De6SCSZnOtGQbSYyGLzMY4a2r8iw2GyShGqdnzPeD97mKELZSz/y60QPA
	kWHDSuXNUsrJIN474Nc+wyzZDbI0ObaFFXQBEtHVM=
X-Gm-Gg: Acq92OEDPl1yG4ekMKmg0CqB1T0F3m4NLiSXQZz6QvYie3cOTFBptkPs+S0OKm4MspX
	5HX/D8MK+A0qD8NL18w8U1bfbBJ1VfM9vCNvfq/uRPbj6sDaUHmlIrV+vCy6Wq+tucLViRjErXg
	XQnrR91MZegFAIS4G8czJuibYbnRdROggjw/UgNQf/WVo15CCu1HDsu2q8rkf/9IzF4kw7h3XIV
	sUrsQQx0UyuAAIY2g==
X-Received: by 2002:a05:6214:408:b0:8ac:a91c:c8d with SMTP id 6a1803df08f44-8cebf469960mr51143546d6.14.1780399904153;
        Tue, 02 Jun 2026 04:31:44 -0700 (PDT)
X-Received: by 2002:a05:6214:408:b0:8ac:a91c:c8d with SMTP id
 6a1803df08f44-8cebf469960mr51142956d6.14.1780399903677; Tue, 02 Jun 2026
 04:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-11-anup.patel@oss.qualcomm.com> <a56d974c-64c2-450e-8668-f987de64468b@intel.com>
In-Reply-To: <a56d974c-64c2-450e-8668-f987de64468b@intel.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 17:01:31 +0530
X-Gm-Features: AVHnY4IKT6gwN_NhQ_Tbfeb8vUpJWfrBiHQzMe6WPUfF3CZMEfaVOhAAY8SepWk
Message-ID: <CAHuiULCzUNkXTSwcHHUDFXM-oU=_gpCeTNM+VAHdwZP47Xw4qw@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] perf tools: Add RISC-V trace PMU record capabilities
To: Adrian Hunter <adrian.hunter@intel.com>
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
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nutty Liu <nutty.liu@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1ebf21 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8
 a=66weK1n04nU2DmxxcLEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: -nuxEDC6dLnLM-_sElGsQuY04Xna2U-h
X-Proofpoint-ORIG-GUID: -nuxEDC6dLnLM-_sElGsQuY04Xna2U-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDExMCBTYWx0ZWRfX0Gu3YOjjJVHX
 tBu9YEONOgbfWqW/JynPibeqqHV93cniUiso4LI+dtc3p9EiNE3Tur+Ln1cJiN1X53ABPtTOmBu
 FYcKwUMuotbCI2En95kXtFxccF7mOnqjQDV/FNJKmviZTEfScZgAPVUVQb5nWvcNOM89jPsbuwJ
 8Fzmdugl/heJEaJpZz7pnAjwjhxHNNBFdeaALGMNjdhY100w9Ejzxijo07Q0l/+RRuBgHfeHJmE
 Z2KOG/BjniCxlf3sRZ6repmMQqQ/TOhLxWc3/IHTCuQQ6ZnSARTMvDxrlDZ4SFpugXwbkfi0Fwe
 yY3iqyGhdwxDt6SxbCqQ0U0Z+4aj4Rd/aubeZCOhdfDMELxVMT3vSsCXNbAuIvW6LVPt1htRFpo
 i55tcSmFIcNwZ71Qn61HSp6hYDqzEfjPmGWMvQwaLv6xJgq0zfr1RcGTyc8e/VJjmnG0bnWJd5u
 IkF588tBtOjUUdVyJow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020110

Hi Adrian,

On Wed, May 20, 2026 at 5:00=E2=80=AFPM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> On 29/04/2026 15:51, Anup Patel wrote:
> > From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> >
> > Introduce the required auxiliary API functions allowing the perf core
> > to interact with RISC-V trace perf driver.
> >
> > Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>
> A few minor comments, otherwise:
>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

Thanks, I will address the comments below in the next version.
>
> > ---
> >  tools/perf/arch/riscv/util/Build      |   1 +
> >  tools/perf/arch/riscv/util/auxtrace.c | 219 ++++++++++++++++++++++++++
> >  tools/perf/util/auxtrace.c            |   1 +
> >  tools/perf/util/auxtrace.h            |   1 +
> >  tools/perf/util/rvtrace.h             |  18 +++
> >  5 files changed, 240 insertions(+)
> >  create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
> >  create mode 100644 tools/perf/util/rvtrace.h
> >
> > diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/u=
til/Build
> > index 2328fb9a30a3..e07d5525ece6 100644
> > --- a/tools/perf/arch/riscv/util/Build
> > +++ b/tools/perf/arch/riscv/util/Build
> > @@ -1 +1,2 @@
> >  perf-util-y +=3D header.o
> > +perf-util-y +=3D auxtrace.o
> > diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/ri=
scv/util/auxtrace.c
> > new file mode 100644
> > index 000000000000..5293ece2147d
> > --- /dev/null
> > +++ b/tools/perf/arch/riscv/util/auxtrace.c
> > @@ -0,0 +1,219 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Risc-V E-Trace support
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/types.h>
> > +#include <linux/bitops.h>
> > +#include <linux/log2.h>
> > +#include <linux/zalloc.h>
> > +#include <errno.h>
> > +#include <time.h>
> > +
> > +#include <internal/lib.h>
> > +#include "../../../util/auxtrace.h"
> > +#include "../../../util/cpumap.h"
> > +#include "../../../util/debug.h"
> > +#include "../../../util/event.h"
> > +#include "../../../util/evlist.h"
> > +#include "../../../util/evsel.h"
> > +#include "../../../util/rvtrace.h"
> > +#include "../../../util/pmu.h"
> > +#include "../../../util/record.h"
> > +#include "../../../util/session.h"
> > +#include "../../../util/tsc.h"
>
> tsc.h not needed if rdtsc() is dropped
>
> > +
> > +#define RVTRACE_PMU_NAME "rvtrace"
> > +#define KiB(x) ((x) * 1024)
> > +#define MiB(x) ((x) * 1024 * 1024)
> > +
> > +struct rvtrace_recording {
> > +     struct auxtrace_record  itr;
> > +     struct perf_pmu *rvtrace_pmu;
> > +     struct evlist *evlist;
> > +};
> > +
> > +static size_t rvtrace_info_priv_size(struct auxtrace_record *itr __may=
be_unused,
> > +                                  struct evlist *evlist __maybe_unused=
)
> > +{
> > +     return RVTRACE_AUXTRACE_PRIV_SIZE;
> > +}
> > +
> > +static int rvtrace_info_fill(struct auxtrace_record *itr, struct perf_=
session *session,
> > +                          struct perf_record_auxtrace_info *auxtrace_i=
nfo, size_t priv_size)
> > +{
> > +     struct rvtrace_recording *ptr =3D container_of(itr, struct rvtrac=
e_recording, itr);
> > +     struct perf_pmu *rvtrace_pmu =3D ptr->rvtrace_pmu;
> > +
> > +     if (priv_size !=3D RVTRACE_AUXTRACE_PRIV_SIZE)
> > +             return -EINVAL;
> > +
> > +     if (!session->evlist->core.nr_mmaps)
> > +             return -EINVAL;
>
> This check is not needed
>
> > +
> > +     auxtrace_info->type =3D PERF_AUXTRACE_RISCV_TRACE;
> > +     auxtrace_info->priv[0] =3D rvtrace_pmu->type;
> > +
> > +     return 0;
> > +}
> > +
> > +static int rvtrace_set_auxtrace_mmap_page(struct record_opts *opts)
> > +{
> > +     bool privileged =3D perf_event_paranoid_check(-1);
> > +
> > +     if (!opts->full_auxtrace)
> > +             return 0;
> > +
> > +     if (opts->full_auxtrace && !opts->auxtrace_mmap_pages) {
> > +             if (privileged) {
> > +                     opts->auxtrace_mmap_pages =3D MiB(16) / page_size=
;
> > +             } else {
> > +                     opts->auxtrace_mmap_pages =3D KiB(128) / page_siz=
e;
> > +                     if (opts->mmap_pages =3D=3D UINT_MAX)
> > +                             opts->mmap_pages =3D KiB(256) / page_size=
;
> > +             }
> > +     }
> > +
> > +     /* Validate auxtrace_mmap_pages */
> > +     if (opts->auxtrace_mmap_pages) {
> > +             size_t sz =3D opts->auxtrace_mmap_pages * (size_t)page_si=
ze;
> > +             size_t min_sz =3D KiB(8);
> > +
> > +             if (sz < min_sz || !is_power_of_2(sz)) {
> > +                     pr_err("Invalid mmap size : must be at least %zuK=
iB and a power of 2\n",
> > +                            min_sz / 1024);
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int rvtrace_recording_options(struct auxtrace_record *itr, stru=
ct evlist *evlist,
> > +                                  struct record_opts *opts)
> > +{
> > +     struct rvtrace_recording *ptr =3D container_of(itr, struct rvtrac=
e_recording, itr);
> > +     struct perf_pmu *rvtrace_pmu =3D ptr->rvtrace_pmu;
> > +     struct evsel *evsel, *rvtrace_evsel =3D NULL;
> > +     struct evsel *tracking_evsel;
> > +     int err;
> > +
> > +     ptr->evlist =3D evlist;
> > +     evlist__for_each_entry(evlist, evsel) {
> > +             if (evsel->core.attr.type =3D=3D rvtrace_pmu->type) {
> > +                     if (rvtrace_evsel) {
> > +                             pr_err("There may be only one " RVTRACE_P=
MU_NAME "x event\n");
>
> Should "x event\n" be just " event\n"
>
> > +                             return -EINVAL;
> > +                     }
> > +                     evsel->core.attr.freq =3D 0;
> > +                     evsel->core.attr.sample_period =3D 1;
> > +                     evsel->needs_auxtrace_mmap =3D true;
> > +                     rvtrace_evsel =3D evsel;
> > +                     opts->full_auxtrace =3D true;
> > +             }
> > +     }
> > +
> > +     err =3D rvtrace_set_auxtrace_mmap_page(opts);
> > +     if (err)
> > +             return err;
> > +     /*
> > +      * To obtain the auxtrace buffer file descriptor, the auxtrace ev=
ent
> > +      * must come first.
> > +      */
> > +     evlist__to_front(evlist, rvtrace_evsel);
> > +     evsel__set_sample_bit(rvtrace_evsel, TIME);
> > +
> > +     /* Add dummy event to keep tracking */
> > +     err =3D parse_event(evlist, "dummy:u");
> > +     if (err)
> > +             return err;
> > +
> > +     tracking_evsel =3D evlist__last(evlist);
> > +     evlist__set_tracking_event(evlist, tracking_evsel);
> > +
> > +     tracking_evsel->core.attr.freq =3D 0;
> > +     tracking_evsel->core.attr.sample_period =3D 1;
> > +     evsel__set_sample_bit(tracking_evsel, TIME);
> > +
> > +     return 0;
> > +}
> > +
> > +static u64 rvtrace_reference(struct auxtrace_record *itr __maybe_unuse=
d)
> > +{
> > +     return rdtsc();
>
> rdtsc() is 0 (weak fn) for riscv, and does not make sense,
> so just return 0.
>
> > +}
> > +
> > +static void rvtrace_recording_free(struct auxtrace_record *itr)
> > +{
> > +     struct rvtrace_recording *ptr =3D
> > +                     container_of(itr, struct rvtrace_recording, itr);
>
> Does not need line wrap
>
> > +
> > +     free(ptr);
> > +}
> > +
> > +static struct auxtrace_record *rvtrace_recording_init(int *err, struct=
 perf_pmu *rvtrace_pmu)
> > +{
> > +     struct rvtrace_recording *ptr;
> > +
> > +     if (!rvtrace_pmu) {
> > +             *err =3D -ENODEV;
> > +             return NULL;
> > +     }
> > +
> > +     ptr =3D zalloc(sizeof(*ptr));
> > +     if (!ptr) {
> > +             *err =3D -ENOMEM;
> > +             return NULL;
> > +     }
> > +
> > +     ptr->rvtrace_pmu =3D rvtrace_pmu;
> > +     ptr->itr.recording_options =3D rvtrace_recording_options;
> > +     ptr->itr.info_priv_size =3D rvtrace_info_priv_size;
> > +     ptr->itr.info_fill =3D rvtrace_info_fill;
> > +     ptr->itr.free =3D rvtrace_recording_free;
> > +     ptr->itr.reference =3D rvtrace_reference;
> > +     ptr->itr.read_finish =3D auxtrace_record__read_finish;
> > +     ptr->itr.alignment =3D 0;
> > +
> > +     *err =3D 0;
> > +     return &ptr->itr;
> > +}
> > +
> > +static struct perf_pmu *find_pmu_for_event(struct perf_pmu **pmus,
> > +                                        int pmu_nr, struct evsel *evse=
l)
> > +{
> > +     int i;
> > +
> > +     if (!pmus)
> > +             return NULL;
> > +
> > +     for (i =3D 0; i < pmu_nr; i++) {
> > +             if (evsel->core.attr.type =3D=3D pmus[i]->type)
> > +                     return pmus[i];
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +struct auxtrace_record *auxtrace_record__init(struct evlist *evlist, i=
nt *err)
> > +{
> > +     struct perf_pmu *rvtrace_pmu =3D NULL;
> > +     struct perf_pmu *found_pmu =3D NULL;
> > +     struct evsel *evsel;
> > +
> > +     if (!evlist)
> > +             return NULL;
> > +
> > +     rvtrace_pmu =3D perf_pmus__find(RVTRACE_PMU_NAME);
> > +     evlist__for_each_entry(evlist, evsel) {
> > +             if (rvtrace_pmu && !found_pmu)
> > +                     found_pmu =3D find_pmu_for_event(&rvtrace_pmu, 1,=
 evsel);
> > +     }
> > +
> > +     if (found_pmu)
> > +             return rvtrace_recording_init(err, rvtrace_pmu);
> > +
> > +     *err =3D 0;
> > +     return NULL;
> > +}
> > diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
> > index a224687ffbc1..944a43d48739 100644
> > --- a/tools/perf/util/auxtrace.c
> > +++ b/tools/perf/util/auxtrace.c
> > @@ -1411,6 +1411,7 @@ int perf_event__process_auxtrace_info(const struc=
t perf_tool *tool __maybe_unuse
> >       case PERF_AUXTRACE_VPA_DTL:
> >               err =3D powerpc_vpadtl_process_auxtrace_info(event, sessi=
on);
> >               break;
> > +     case PERF_AUXTRACE_RISCV_TRACE:
> >       case PERF_AUXTRACE_UNKNOWN:
> >       default:
> >               return -EINVAL;
> > diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
> > index 6947f3f284c0..4f4714c1b53f 100644
> > --- a/tools/perf/util/auxtrace.h
> > +++ b/tools/perf/util/auxtrace.h
> > @@ -46,6 +46,7 @@ enum auxtrace_type {
> >       PERF_AUXTRACE_S390_CPUMSF,
> >       PERF_AUXTRACE_HISI_PTT,
> >       PERF_AUXTRACE_VPA_DTL,
> > +     PERF_AUXTRACE_RISCV_TRACE,
> >  };
> >
> >  enum itrace_period_type {
> > diff --git a/tools/perf/util/rvtrace.h b/tools/perf/util/rvtrace.h
> > new file mode 100644
> > index 000000000000..24b32947fb4c
> > --- /dev/null
> > +++ b/tools/perf/util/rvtrace.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> > + * Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > + */
> > +
> > +#ifndef INCLUDE__UTIL_PERF_RVTRACE_H__
> > +#define INCLUDE__UTIL_PERF_RVTRACE_H__
> > +
> > +#include "debug.h"
> > +#include "auxtrace.h"
> > +#include "util/event.h"
> > +#include "util/session.h"
> > +#include <linux/bits.h>
> > +
> > +#define RVTRACE_AUXTRACE_PRIV_SIZE   sizeof(u64)
> > +
> > +#endif
>
