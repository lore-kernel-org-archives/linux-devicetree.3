Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41FE3191D6
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435658; cv=none; b=NRgNg3C4WDnOMbJ6eTZj3bR8UcwfSDf7Qb6kmSnYrOXeLvtal9OHUz2QcDy4f7jHCXWLpxEhldVSRyqTbVQ8zhFXaU8ZkEcrSxl8TBNx4S+njrS9+8AOD7/LYzCgPDLZ927Y97NRh+uICYlaymJDECTQ781RTE7DB7dok8H5FAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435658; c=relaxed/simple;
	bh=kbB/eBRZgg8WpEohJaYOhBTmcXDJ4/L3JhRiQEfaGtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnpgY7ygBoWc3m02/g/o2+wFbdaQJ45Z8hwu6LSFWMeZ4/sFHWTAPWH3QgIPQh8kZiht6koZMjGjOpHhyaEbsdgL9iuVnvUw4nyBqK/O8ALoqmCkNdJK5ngFwADdnkbYc2nkzG5Veb78rpoKLNoxYLHa6iQCaqHnagrl9c4dg14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0NaCsYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHQ2DEgD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0NaCsYi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHQ2DEgD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9OPI3741081
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 14:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnL8n0Rge/PLupFS9hJ3iC3ksta3Fq+O1fWOUkKJBYc=; b=p0NaCsYiWC2KqUWR
	XSBHszC+Ja+g2ZwIFWFp9g/5FUjNwtQge9XqWfGw6sW30HCuKbAVoLt6Zy+QWHP3
	ftQZh+j4LdrRwvXnqWqSmC6ffC3xGv149tGagUZ+kTHCUgN2WJwb9bnOI0Dn1zjL
	NWG+IOy3dukl+KbAcIIsdjUICVoSAB2LM/O0zkRnw30JEX1i64BDnjW0381vjvq8
	QUYatQAS9+jYcCJ3+QU1kNE/TYSSrO4DN1MQxpYOOmMf+yCw0cfk28xYDTRKD2E8
	XEt12NOYzcWGIwnZBq6BGVxpHUrUhbvKSomzQuJUaSTz7/tpDIwCsr98Lb2dLwUo
	MmeSEA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9aa17r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 14:47:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73850dfc198so1014836137.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783435655; x=1784040455; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KnL8n0Rge/PLupFS9hJ3iC3ksta3Fq+O1fWOUkKJBYc=;
        b=gHQ2DEgD/1mICNUSLDCoCnmDKKM/yaG0CKh9zMk/HOJcRn6NR/rkszhcw1g1kD5E1o
         9si2PUPL10zuL0T0MsVTOq+NsWEWn8rjdGPK7vX0ViUW2BE//kfyhIdjMOJ6E93AF6HI
         9EDe75u0O6nxSSomQ9uRa7KJwZNs77E80mGe4IsymzHhKN25lti0nz71mkgoq+Vh3Bu2
         eKXFAyTAXZcZNDHk0/OAK8DNTT/AKoO3rjRX0zhdS1YkkybovswsSbELYCxI6zJ8D7Dw
         RQb0j/pRjw1hU+EpmkcMoNLjysuPITCvOaydH6+11Wj3OK4FSuj3NgeWU1G7cU12rDAP
         1y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435655; x=1784040455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnL8n0Rge/PLupFS9hJ3iC3ksta3Fq+O1fWOUkKJBYc=;
        b=pu0JJr0U89sMkDMpM383ya2dFFQz8b9MmYoYFSXHsdn7Sc2aIherMnWxJZ5j8USgSj
         glPxieLTTM9KqjD6jfcsgEb1EMC+Bv3yj/sXxA3eRltJmdbmj4GXN+HGlTc5AUtS/WRw
         N+6vzT7Z15DC29YGO138yLApdYDsLriWp71yn/ZnAVEywx8JQdg1xnvivxuU0GSliv5C
         kVhhjwgBmtPkBp1XW95vVFXyLq0/sA9x0yGpWT2YLuNWQa17PuaEwak7oi0yTKorFs/P
         uO+T0blgmgZrK5GzbbOVqQTWrq1SAv3Lf84h60+xSzNchFoh/TI49jw8rSis9yfMV334
         Oqhw==
X-Forwarded-Encrypted: i=1; AHgh+RrCBJMbI3wR8uqsKxfCedNEy4vZ9fra3WxQBI6J5/WNlw8+VOdC94SEPxCkoky6j9zjbrGDvknd/+Dr@vger.kernel.org
X-Gm-Message-State: AOJu0YxXUjOc7Lqivk5LAcdewLgR1MdgOcegSfsIaqmFHwyHcekViMcK
	rnraHXXOuhDJRHhADGOZB2eqG1Qdv36wmugY1bSUjL1D6joH4cIULhgto7QlnfVnZhOGQlWi1rq
	zi3leowtUU82HkeSdsoMWI1yLCEVMWkX9Kb21KDuKu4bMu/Nxj0/XQLRqS4SWhxeZ
X-Gm-Gg: AfdE7cl8ViFf6KN8DvGpABJ04q7SPYofwQKtuWwUR5K993dwcbIwYO1jGfKpHUm9uPW
	8j+bADuNd3vsKXifDueTi9GkbuESxZ2JKOBaBBuJq5QoJV+HAlHbHHgMoNVZG543zhhIqEUdFR7
	jWfCj+h8Fj1VbZnU7gfhIohJ8cipgZlBsMkV8NcEAChDmKaWsNQ2LrIn4N2Gep0TTMjwNygYbCo
	wrb0qvAZUKV+eej9FII8mHOzldlObzmVZZDwcTn1f00rG06t1U1Rh7kLrPhWX6h1mxDtwT96eWm
	ksWZLhvfLn07Q3fGcos/gRzDdw1l2XSJTRLc9stLLEGIVAVgkjRHIf2eXs674FjkLaJ+EysfUzy
	1lwvAAVXpj+DLa4D08p8WXLA+5oJbDkhqakxA2rlyib7TzXmsIXcQoLxY03QlBVsjWjqpdS53xi
	UQT2lIywmuu1ltxbw/SiszjH7J
X-Received: by 2002:a05:6102:6448:b0:726:cd42:d023 with SMTP id ada2fe7eead31-744b7a8eb73mr3208844137.11.1783435654827;
        Tue, 07 Jul 2026 07:47:34 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:726:cd42:d023 with SMTP id ada2fe7eead31-744b7a8eb73mr3208733137.11.1783435652469;
        Tue, 07 Jul 2026 07:47:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad35edfsm29360981fa.13.2026.07.07.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:31 -0700 (PDT)
Date: Tue, 7 Jul 2026 17:47:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <n2qzqh7xbyth543qzhufvmqctjqeqzjtn7w67u77meau63vpar@a7ossfgoctqo>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
 <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
X-Proofpoint-GUID: FMitfk1TEo_VH19Fa6HiKPAidpq2osPy
X-Proofpoint-ORIG-GUID: FMitfk1TEo_VH19Fa6HiKPAidpq2osPy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE0MyBTYWx0ZWRfXwEX37BwhCuaX
 Vg5ssfVoMJW17Ue8W+ER7ClywiKqdWW+aB4/cx2wFw5k1TDXInZGJpsoTeKHW6Wdt5dOlR/7OPs
 zc5D3Xp+kCb1ZJzGWrQB5I0PtEZMIH0=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d1187 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gfVf64230eWH3T0bUGYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0MyBTYWx0ZWRfX9Rw3fbbSJ20N
 NJtLTM6TGmYz5ztXQRYlkuABf9lalqxybO/AE71KHis7bdTKNiOyMYuNmIkWGOYkgXf9DjhEA0y
 Q1lQQ5/lSrUNcG9M4R/1gEHs2DUCXGvSfW8t9q33rWQGnOaaYqypFv6OWuTqjrjMC8iROIl69qn
 M65d/V4nm0Gu4P10KxPBWoL0W+oS4epexKD/lXzkvols8zoMVTR0CSFlIINR/bGDrVcDQWhWPcV
 mshUMfsRZ42qRmM4ITlFMthiLPEcij9ZQZEzF51YqOI2dA1aL/ClfC6j+oghVwB2QCXja6PkLnq
 wqSr00JEErB80+9/FolV4WQiLoQfwjVr7f3GjW1XcR3plAPLVgUeFMCPXzgAgxPMlbA9phtyd8j
 QjrBxm+aAgMoZA7oAcczn2ntK1H/4oFfOR/UDeeUXCrl9fCk2858qPI+Nxa6MrM1zBVZGKZl8TM
 6cVPOIlPuZu1GBXfgZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070143

On Tue, Jul 07, 2026 at 04:47:07PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Dmitry,
> 
> On 7/7/2026 4:32 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> >> Hi Vlad,
> >>
> >> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
> >> <snip>
> >>>>
> >>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
> >>>> QCOM_ICC_TAG_ACTIVE_ONLY
> >>>> +                             &config_noc SLAVE_CAMERA_CFG
> >>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
> >>>> +                            <&mmss_noc MASTER_CAMNOC_HF
> >>>> QCOM_ICC_TAG_ALWAYS
> >>>> +                             &mc_virt SLAVE_EBI_CH0
> >>>> QCOM_ICC_TAG_ALWAYS>,
> >>>> +                            <&mmss_noc MASTER_CAMNOC_SF
> >>>> QCOM_ICC_TAG_ALWAYS
> >>>> +                             &mc_virt SLAVE_EBI_CH0
> >>>> QCOM_ICC_TAG_ALWAYS>;
> >>>> +            interconnect-names = "cpu-cfg",
> >>>> +                                 "hf-mnoc",
> >>>> +                                 "sf-mnoc";
> >>>
> >>> This is the topic, which may raise a disagreement, but I'll repeat my
> >>> position about the need to remove all "CAMSS bus" specific resources from
> >>> the device node, they are found and should be allocated on parent's side.
> >>
> >> The interconnect has functionality to handle bw requests from different
> >> clients.
> >>
> >> Yes the best will be to have camss interconnect, so jpeg and other hw's to
> >> vote
> >>
> >> on that (actually it is possible in icc framework) but what is the benefit
> >> of moving
> >>
> >> those to camss? Is it not better to create camss icc. I understand
> > 
> > Please fix your email client and stop inserting extra empty lines.
> Apologies for that. Some Thunderbird settings were missing on my side, i hope now is fine...> 
> >>
> >> you want them to be on parent side. But how to vote on bw? Most of the time
> >> it
> > 
> > If the driver actually votes on those, I think, it should be fine. This
> > patchset seemed to add bandwidth voting, but then it dropped all the
> > votes in the last commit.
> > 
> >>
> >> depends on the jpeg encoder configuration based on resolution format etc. to
> >> set properly average bw.
> >>
> >> So i dont see how that can be done with not explicit dependency on jpeg with
> >> camss and some exported
> >>
> >> API's which we discussed with Bryan they are preferable.
> > 
> > Interconnects should be fine to be referenced here. Especially, if JPEG
> > has its own port to those busses (hint, commit message).
> > 
> > As I wrote, I see a bigger issue with the clocks. You need to have some
> > API to vote on them (and then let camss driver aggregate those votes in
> > a platform-specific manner).
> Can we use icc-clk framework to vote on them. I think even today there may be some issues in camss
> for the clock voting.

Please discuss it with the Camera team, working on the camss
improvements.

-- 
With best wishes
Dmitry
