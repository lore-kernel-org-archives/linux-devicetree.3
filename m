Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9372C08DC
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678987; cv=none; b=G3XL342084g+M96XV9z1RDIvqApQAt9i7aqEEQH97ZFFlE29FpYAb5RbRNwEs6lnKx/pzPP61ZHgh+vzD/pNyJ7X1Mm6Kzx4HjInSiJXVHt24IOnnZCeqFmp2PWQQ5eMzkL7SsGo9gToStnC1fVaAsHMB5NUASYBr2tdk73nE2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678987; c=relaxed/simple;
	bh=h9cHbTVyfhhkh4MZ7cuH7Nx1qQBZMTByeT7Av+06L84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRvaREuBCDuNibKYAgB18K2+IYguDvwg0PUycBudzxxYNSZ0XHEuAyy+FNNYqc4WaLXPfLuFnSFNLLEUuYCxTKSL/8YOpJkIW0gzQVUpOUpkG3zoSdh9k0f8q3JWDP+Hk9m3paWd5l4LR+URJXgknTnv7vAuz+4Sz/L/wzo0/DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQda1NVv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9yB+trx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQda1NVv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9yB+trx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jhLZ3007619
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GLjjvr/kpXFgzi3+oKZJpIGO
	I2o5W4/4aQXjO084tiA=; b=mQda1NVv5KwohwetVTbmGEfBIO+FzlXUzEeFfL+f
	MEuzjd2Rrxsq+j+0AIeZFf9hHP+93At7QqGJp+QctIZLHltNXqNP7AmUPAm8KWRO
	3Yt6dy4fNJtvozMCrpbtRt3jHwZstumctAZKPXD8fnd8ttnnTV+buWUU584RfYQj
	XiRA6VbTeZhFNy/TUx/K8njvSD9N2t7v76pzMY3Xzb9OwSFYBCX0yVIFX1CQbYTF
	5NxSYt7oAhC1NU2Z5A4uk9TWqaDM2OEL6mxB3wVR16q8xNSIBtyNSCncDnKCutqs
	2PSAYJP8kqDbA0Z+x8u1xCD8OAFvWw4aPMKRLL/EN1l36Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0gs4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:29:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf01172bso8175621cf.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778678985; x=1779283785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GLjjvr/kpXFgzi3+oKZJpIGOI2o5W4/4aQXjO084tiA=;
        b=U9yB+trxkHXewzO3I8DqdswE/03NjPgFg8UfYm9E3KaJhzVeRrcFoHd6vzbb5RYpMG
         QgWhLFPKuWO4ajvuOzcGuAt02EXLkPVZtnAT2BMMnXTyttsqMuwSX13VtvvYfm6I83Pk
         x64Ts8i/WTvdNuB26mnVF3WvbpDb/EN0NMxrICvp66GUKd747KsMPAO3p4/EZjn5y8hp
         Rq+MqSUWCHsIbjp1I3HJNAkHu+E9BpoMXGZ99J7wq449VnnXxsmaIV4Ik7hW1RqimcTX
         fzFY+UjKFzbU6VLrGrLfn/4ZI2edRoRWarFT55wMLdAzemZCy4vvj/Pp0o2heNQpB3sL
         HUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678985; x=1779283785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLjjvr/kpXFgzi3+oKZJpIGOI2o5W4/4aQXjO084tiA=;
        b=PKvGBdmZ1Aecyyu/gccpVob1UA4GDdy+6iyvQe/1YgI+lnQhZCslqdO3ZCiku1CU/d
         bp+n59Z6c8hefGQglbkIdw4uRAJK9zGJUCjXhDsBmKDBPgD1H3NRfWJBe8leHa193t9z
         rgxBm2jP+vMJImI9CTmxxPLfNyV2Xe8Z6a13Aq4IlPo1VMCPfNvvjvz4u/gJQZW6K05w
         uSc0EpJEP3hVtbeIF9lIoNSYrenNyBFbUFH8+hc7ED6p6gX6oiBjy8K6InIuoA8xrFsN
         mTtVDL3W8Qv8LCKEzMftaQZIN3fvOq3QJEOIu1sJYvebN9w8m7sRbh+UOdEI/NH0nDWg
         p+Ig==
X-Forwarded-Encrypted: i=1; AFNElJ/reFfCqd5cWhp9TpD0rgIOY5g0Q8975k1TudCQOdLny6Doku/syENookr99fOSXmrXLpjrYjXdVLdb@vger.kernel.org
X-Gm-Message-State: AOJu0YwCR4XwE6x/Amhn8jDb5NqsqI2xaeN+gPxBvTyVCB42AXV3RP/X
	hwG9+KoFxjKg1TWjTKNKb9iNlj5EZo49NkFRRpDbhNG0vQP0Zc9LaxMGrqhY/FJvcUs4CxHUe6W
	IVK6FCHv9Agotdwm5yRCupRerA62OMsoEP0tybsEakkcT72gjEj/oy0LFZVan/azS
X-Gm-Gg: Acq92OGDHtlyXKdh+kq69trtLzq/WdZRMPs4EouQcVYF0Fe3YaNHMaSCK5+HxelIuju
	B2pYYuqY7e+ggJWLjbcYg6t6EcPXCuG+B3Z1ZPwmXq8lNKgnxc6yJzfl+iUIjBl+j+02e7NcExa
	BltrQeF1Nch3dWl0V8ex0yCpIeb3qhzuuAA4AV047o/0WxLiiaJTsS9wJ8P9s+wpjAMWsSEJ+iQ
	32ebDjMQGcZ3ULRqhgwaVZrtukgarQD1oAxFyRBUHUaZuju72ItLHvhZmR/dLLm9GW+lm12h4Vi
	B7OaLZbT2Wm9BJeMEDBOClq924g2B0taX6QYYzCG46Hwh0vc/abm0H3msXmYtFAhMi/g1csUlAR
	Ngn5BUS+K+KvTnUj2um3lcHxoVGcD1nQuw1VasReWM1u3jE58WdJ0YtdL9afow9Xya7ubK2ydzf
	1huXaFNRrfjmxw+3L6AYqkfqi7lxxeoMS8N74=
X-Received: by 2002:ac8:5902:0:b0:50f:c65f:a4fb with SMTP id d75a77b69052e-5162fdcffd9mr40708671cf.11.1778678984520;
        Wed, 13 May 2026 06:29:44 -0700 (PDT)
X-Received: by 2002:ac8:5902:0:b0:50f:c65f:a4fb with SMTP id d75a77b69052e-5162fdcffd9mr40708201cf.11.1778678983983;
        Wed, 13 May 2026 06:29:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18ef9sm40493991fa.8.2026.05.13.06.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:29:42 -0700 (PDT)
Date: Wed, 13 May 2026 16:29:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/14] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Message-ID: <kdbo5d2wibjfnchfw7xn3wcgcp5r6ff7pw3ibkpbqzjgfhkovp@v4er4hdiytks>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
 <35zfskmyogpazxy7wsw2jg36fvpnnc7hng23j4heq2jy5ookai@q7d2vl7nn7ck>
 <fc188af5-ec7e-bebb-2654-62312d79e60f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc188af5-ec7e-bebb-2654-62312d79e60f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzOCBTYWx0ZWRfX+CWekJuBFLrA
 LolQgO4a8AbaDUrjB3fHNWMBLfBAfv4UtYijWNKL5yZBBgJofTqythMny+cg/VcqSyZR6OT0y7U
 3pD7KSBhb/o7RmKYX7mImEDIGS6rrpo/8hYOiL0Zj4YAqT6AGu/gs6A70LGSxAorT9weNUeLU9e
 BXtojb3JrfC+FislTTkomnNhsvZi0lYWrgSmFgDx706mo9TOBu20Ohj6ztoRrCZYbuunguZgMqL
 v7FT0tJEQ03g+a80ItXHFOB6ASz7yFi5ctJAPFek7su4KiDLsf0o4LQ0w/E9bIHf7kz6FUTJJaN
 rnAw5cVRXOc7KbxCvud1/fDG+7l7t7x2wuanpDqdcCwgQWG2cNqKUlHYNIw+PUyYe0Yk3m2fsSU
 sOv6gXcw44DbDEn936kEwQiwf/OxX5Ox1NJPg5XZGI9h/u+SHdui7whnjPLp2Ppk7B794N4qBaJ
 EopDfB8P0gsA0xUPt7A==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a047cc9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MFmcrfekO-K-MGbKrFsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6U2xbqu-cNpAYf2DIJE2UxR6mFXyla77
X-Proofpoint-GUID: 6U2xbqu-cNpAYf2DIJE2UxR6mFXyla77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130138

On Sat, May 09, 2026 at 10:34:15PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 12:52 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:53AM +0530, Vishnu Reddy wrote:
> >> The common schema defines minItems and maxItems for clocks, power-domains,
> >> and iommus. This suggests that the number of these resources can vary,
> >> while in reality they are fixed constraints per platform.
> > It really doesn't. It provides common definitions, while individual
> > platform schemas tighten those.
> 
> If a new platform requires more resources than the current maxItems listed in
> the common-schema (e.g.,Glymur due to its dual vcodec core design), we need
> to keep bumping maxItems in the common schema every time a new platform exceeds
> the previous limit. That makes the common schema a moving target driven by
> platform specific.
> 
> I am fine with increasing maxItems in the common schema instead of removing.
> I can set it to a reasonable value (for example, up to 20) so that it
> accommodates future platforms without frequent changes. Anyway, each platform
> schema must define fixed constraints, since clocks and power-domains are
> mandatory per platform.
> 
> Could you please let me know which one you would prefer going forward?

Just touch venus-common when new platform requires bigger lists.

> 
> >> Remove these constraints from the common schema. Each platform specific
> >> schema already defines its own exact fixed constraints for these
> >> properties. Additionally, remove these from the required list and update
> >> all schemas that reference this common schema.
> >>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> @@ -64,10 +44,7 @@ properties:
> >>  
> >>  required:
> >>    - reg
> >> -  - clocks
> >> -  - clock-names
> >>    - interrupts
> >>    - memory-region
> >> -  - power-domains
> > Do we expect the platforms with Venus / Iris not having either clocks or
> > power domains.
> 
> All Venus / Iris platforms have clocks and power-domains. These removed from here
> and added in each platform schema.

This is a sign that this is wrong.

> 
> >>  
> >>  additionalProperties: true
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry
