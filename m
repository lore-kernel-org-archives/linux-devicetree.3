Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AFA1607A4
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776449988; cv=none; b=fsqSPILWa2gCtCGM6EQRV6dGsqa5Wi6mpGLQDIbH8EO0YY4HRDqv3ACoz80o9v9XJUwdaEZkQs9Btk6Rb/uVEm6o+jJsl1lDGwQp0Z09TrvZRXRVjpHzs6a8qtwGZxf+xf/BH4kJzjUF/QrtxJBOoW0hbzvmxNmMkP/zpFyVcCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776449988; c=relaxed/simple;
	bh=+Y/1hph+Mu+w5hL+nWV2EJbB/kkq2DaGW9MdbCp16lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXWZytS7hwkRD+TdS+CGU2EobD7XG3TuAlUlOuO5vWIqf+F0PRA/Wq9SX4CvaNbyV3a5KAJ6eSqZmzvcjIwGL6XNowecnAsPlf7wJXazNuDZngs7IuTHEDeeZv6NLQ5BYxImuoD2X7PlkamfdLFHl4Mgas1glvG4S4Ks+tMZVf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAjtQCRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKXLKvR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAjtQCRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKXLKvR9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HGMDwj3189467
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=isDf/vy7kpIME0B9xxwzgDcl
	RWf8VcVDgop6pAMzdtI=; b=IAjtQCRok6+EkiwQdB1Ykf3Y6DCeROmW6eWodZYT
	KlbzZDatJfVyh7V1jyKYKq6w4IICTAfcuSvwz7Boq4ibNGNJF9zXBALHB0LAN5Y4
	gxRtJ9NGR1d++/d/ndqcmdowm1MdOMQSN6QDCMlR5+afMyf9H0LZEJSfDvJvyAgY
	m5V7jCoMaaEbuOOzFnlXoKIxsncaRJ4kS/OZNWSpZMcGqYYrco6/Atvt/8mS7yL+
	oJdeObrE8FYTan/BdFtw2vyGxhjMEO72YO7HBOCAoG2k2X2tc7AUbp0CnwGCixyw
	wdxzZVUZpeUn3O662cXBHdo5wtukc3XIViAsg0Gnj1ivTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkravgcfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:19:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d63962d83so22897021cf.2
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776449980; x=1777054780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=isDf/vy7kpIME0B9xxwzgDclRWf8VcVDgop6pAMzdtI=;
        b=QKXLKvR9dAIYtGXaFqv/dAp31kSi/bozoFJcC4Rz0SbIwCyF+YHSiqYvl45cvamboo
         NyJ0yxrtTMJGpEZQCNuisq78un2N9RYifSZjR19d7fbEKDHhOVqyFaQhgyIhQ45jdaLz
         gc4OuS3y4Z1g42ckQAhayWaPwcYiRalZmmhJcn3Sc+83Sz3Cqo4l/9bO4tzZe8wTxjS5
         3Ukj6GGDn2iY0TmaNXB7kqkOawqHy09TsFVmWNUiZKjrYkEYDGGHMENt7RgHyzNNpuuk
         DyJbO76+r1iSNeopgIVCbEfjTCZs9ZHO9vLIN9GHAENiPsyYTSFlfLI2WE6rr6EGssoY
         CV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776449980; x=1777054780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isDf/vy7kpIME0B9xxwzgDclRWf8VcVDgop6pAMzdtI=;
        b=eZGGzXcaDCGO/kGuORNy1F59o6INE/8LjwbycmX9uw6bkiJ9am13r3b69SPOKjQBvA
         Lw2ohjD6mSoNSrQxtuFqobrUlw3uWplQCJFw+bRDqK3KJI1w5M7oNCXa3xk16EqBBV5E
         io5FN3yyeSEIBgE5L43DijkVdo/v08TXK6/R4DehPGnz+XNU3HOSyBUas8mY/IXEcaRl
         Bx4s1bV8SRRtT1BICnD3DvbFQHS3mgXVlRi4VllvOd6DWqlS4CW/1jnNws4x4AzjNGRL
         8IsUhQ3iViD6Yw8fJv1Swo9pS9WjXzDI0REKoNiLGloEUtxpWYIb916orv1THqM1d/7K
         kN3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8m0opPmpUhTa2pGctoeT5o3cmbZvkDHEw/WnHMbYQ/TOCdTa5sClrsmJt9Kzhvd2i81/ytBTKbOJIn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz70AyLO2OKg5EKwFEWXri1h+lxLJYc94mfdC2ib6J+xbNqS7H/
	q5n95kLrUIGGVe/OeRZsktRhwGT9BvWiKxjky8ixsnQ8Md9bCkwyDJdK1SxUUkta6z8Z+7Zm/37
	axkWkIWSZxAMdRSD68jZ0cgQ0yMdBXAYyp7IhLdyAScy2r4AEilfSh71VDCwvvzSI
X-Gm-Gg: AeBDiet4r6gSnt2lRgxP2kk697sTvPJr/R5VxZZp73V1QkZJo6yKpQSrofngZG8aqUD
	JhkpIDSpop5aZbvz/E+xN5D7JZVbNbAsex1csRvNvJ3K91iugvEOVL8i0FWmEb26h+1VbxvuHFI
	qjOrH33XMJFj9gaI5RduB6M4AAM+hcyk+T8iD559bEC3h8ovv3JnA7EfGZu3FPcQHCTNUP7L3YZ
	hvkc/0gV67hLw5PAc7UeOIBucN8xOy2iXEX22JAK+5dDeA/Qh6U1lK7Od+NMK8QuNECjwkgB7e8
	kxtYrfAaiN63Kho5xbkyOOmfWZgXJjDQuVTSW4fo25LGMa3zV0Sm0cKiGT0gRqG+7ZyiWuxXLMS
	rS7tJesGPzHUK5LkELEwUYmLkeuaO7uWVYMd01cPLXWuI75mx7luTz9FCP4OJ620+v8axpOfPh9
	9aM5ZxrS8nsm007iqon1LSmq+voWqdcvaSkZdLnI7AQSEGXg==
X-Received: by 2002:ac8:5988:0:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50e36be3545mr58901771cf.17.1776449979518;
        Fri, 17 Apr 2026 11:19:39 -0700 (PDT)
X-Received: by 2002:ac8:5988:0:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50e36be3545mr58901131cf.17.1776449978987;
        Fri, 17 Apr 2026 11:19:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a62sm596839e87.56.2026.04.17.11.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:19:37 -0700 (PDT)
Date: Fri, 17 Apr 2026 21:19:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 02/11] media: iris: Add iris vpu bus support and register
 it with iommu_buses
Message-ID: <7bnl34zyexz4z54fmz6ymax7izfey6nyp7lenhvfp3hkfmhdia@lssovgsnas72>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
 <eqxeib5ci42ox4o7l45yjwgsjwjyhekojiigpxj6s5npjw5cwq@ggbtohqh3pip>
 <5dee6da0-9170-d9e0-5ff7-f8436331c6a9@oss.qualcomm.com>
 <26b71f52-3355-d4e9-f640-007123e3aba2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26b71f52-3355-d4e9-f640-007123e3aba2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4NCBTYWx0ZWRfX0zKyd29+TfG1
 Dj11GduJLpXKF9R9yyohKYWvOO63k5g+MjeThFGrlvtAgXDCxyQKc2q7WwfZNY9ps65UdyF6C3Q
 6wfZer1mIQMkF4QhHXLkeGfaV6gei0rlR4ioJ7IWkGtvEc7WTipwBYBNWcshjdlANyrYztS8JW8
 PmkB1XQsEySGeNUdtBjaNgHG9ZWcTUWZ0uttPe3K9I8JJvJ07mGdTjXghXZ5fDSWBYuWA1Nk5s5
 RmKnaER/FQBlQ7o2HukHJaFiZlkl9wbM70zI9bcXnWRXr869ebAVj2wK06fMsJ0Iq7r6LACDHPK
 bt4ZiNQzfXtyB+WxxKQptwQ4Lcgqf0HpTcg51Q2D+SplTwo1f4topaLPNr7BC0F0vjeZCFoZ36l
 kS0/bVn8HMUmAIUn6Gfgl+X3Yib/Etz0YboKvHw970jP+ZyJ4H5Ejfd/kvtsSt+76CO8k2f3eAC
 iAT1Nry5gns1LsiRIWw==
X-Proofpoint-ORIG-GUID: Xk4fdCYEkIvp9yCmRMHY-CCoj2eBXmIg
X-Authority-Analysis: v=2.4 cv=PIA/P/qC c=1 sm=1 tr=0 ts=69e279bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TwgMmoAUbSKMSTU6PL0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Xk4fdCYEkIvp9yCmRMHY-CCoj2eBXmIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170184

On Fri, Apr 17, 2026 at 08:29:21PM +0530, Vishnu Reddy wrote:
> apologies for re-sending (earlier responses was rejected due to HTML format)

Ugh.

> 
> On 4/17/2026 8:22 PM, Vishnu Reddy wrote:
> > On 4/14/2026 8:44 PM, Dmitry Baryshkov wrote:
> > > On Tue, Apr 14, 2026 at 10:29:58AM +0530, Vishnu Reddy wrote:
> > > > From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> > > > 
> > > > Add a dedicated iris VPU bus type and register it into the iommu_buses
> > > > list. Iris devices require their own bus so that each device can run its
> > > > own dma_configure() logic.
> > > This really tells nothing, unless one has full context about the Iris
> > > needs. Start by describing the issue (that the device needs to have
> > > multiple devices talking to describe IOMMUs / VAs for several hardware
> > > functions), then continue by describing what is needed from the IOMMU
> > > subsys.
> > 
> > This series handles firmware device which do not require multiple
> > devices part.
> > given this device need for specific IOMMU configuration, I'll update the
> > description
> > accordingly.
> > 
> > > > Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> > > > Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> > > > ---
> > > >   drivers/iommu/iommu.c                           |  4 ++++
> > > >   drivers/media/platform/qcom/iris/Makefile       |  4 ++++
> > > >   drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
> > > >   include/linux/iris_vpu_bus.h                    | 13 ++++++++++
> > > How are you supposed to merge this? Through IOMMU tree? Through venus
> > > tree? Can we add one single bus to the IOMMU code and use it for Iris,
> > > Venus, FastRPC, host1x and all other device drivers which require
> > > per-device DMA configuration?
> > 
> > Separating out the bus definition and the Iris driver handling would
> > provide a
> > cleaner merge path.

Then why wasn't it done from the ground up?

> > 
> > > Your colleagues from the FastRPC team posted a very similar code few
> > > weeks ago and got exactly the same feedback. Is there a reason why your
> > > teams don't sync on the IOMMU parts at all?
> > 
> > I would admit that I missed to review that, thank you for bringing that
> > discussion.
> > FastRPC patches generalizes the handling for host1x, FastRPC and the
> > same can be
> > extended for Iris. I have left few comments there.
> > 
> > > >   4 files changed, 53 insertions(+)
> > > > 
> > > > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > > > index 61c12ba78206..d8ed6ef70ecd 100644
> > > > --- a/drivers/iommu/iommu.c
> > > > +++ b/drivers/iommu/iommu.c
> > > > @@ -13,6 +13,7 @@
> > > >   #include <linux/bug.h>
> > > >   #include <linux/types.h>
> > > >   #include <linux/init.h>
> > > > +#include <linux/iris_vpu_bus.h>
> > > >   #include <linux/export.h>
> > > >   #include <linux/slab.h>
> > > >   #include <linux/errno.h>
> > > > @@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
> > > >   #ifdef CONFIG_CDX_BUS
> > > >   	&cdx_bus_type,
> > > >   #endif
> > > > +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
> > > > +	&iris_vpu_bus_type,
> > > > +#endif
> > > >   };
> > > >   /*
> > > > diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> > > > index 2abbd3aeb4af..6f4052b98491 100644
> > > > --- a/drivers/media/platform/qcom/iris/Makefile
> > > > +++ b/drivers/media/platform/qcom/iris/Makefile
> > > > @@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
> > > >   endif
> > > >   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> > > > +
> > > > +ifdef CONFIG_VIDEO_QCOM_IRIS
> > > > +obj-y += iris_vpu_bus.o
> > > > +endif
> > > > diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> > > > new file mode 100644
> > > > index 000000000000..b51bb4b82b0e
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> > > > @@ -0,0 +1,32 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> > > > + */
> > > > +
> > > > +#include <linux/device.h>
> > > > +#include <linux/of_device.h>
> > > > +
> > > > +#include "iris_platform_common.h"
> > > > +
> > > > +static int iris_vpu_bus_dma_configure(struct device *dev)
> > > > +{
> > > > +	const u32 *f_id = dev_get_drvdata(dev);
> > > > +
> > > > +	if (!f_id)
> > > > +		return -ENODEV;
> > > > +
> > > > +	return of_dma_configure_id(dev, dev->parent->of_node, true, f_id);
> > > I think it was discussed that this is not enough. Some of devices need
> > > multiple function IDs.
> > 
> > In this glymur series we are following the legacy way of handling IOMMUs
> > and does not
> > require multi map.

Why can't we land the version that has multiple entries? It's as if the
teams are totally not in sync. The corresponding version is in works, it
has been implemented, etc.

-- 
With best wishes
Dmitry
