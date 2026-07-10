Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6883DEFFA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699405; cv=none; b=g23nSqNzZM4pNo4vtd4HKlFJNyR1nkfszMAKlPxtWk01rqyctEJVEEKq1qsViUWVdnMm0HRDXrGEq9OdqUl9SptLJ1Min30W79XOu6vC4KnKQ8aup/Fk+MNFGhrgm48JJWpztyva0FyEFlKSXYMcwmvoRYvW0HZraa9ly0J+TIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699405; c=relaxed/simple;
	bh=e7DCAnD4zqMePx7mlR9J2kZH6Kezcd4NX1x8vpun4C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+n+PT3ZERE4aTk6grBkT2Hnp+Tajb4etgypqiLqJ6iuWKTvUJNB0IlcPE7isD4UKWYt5h9XsfRXO6bZbUZ0cvYPqtcqAFmSXUgOGt2bh5UL7aQcepIw33ooDBrdFNvEbBP5IvlJqof4QqXbpxwV/5RIXQy1INYWPLk3W7055p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrfhNpm2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ShnsW9Qh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrfhNpm2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ShnsW9Qh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEcOu81127533
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qNBbsusWm+Zk0082oioVL0lk
	a3JQOjO15f2DW+3iN/w=; b=XrfhNpm27rY0jJ+iCcxVMi6F50HrE912MByNj+3x
	BC0bZ98BMfvFbv8J3VOXIgkEpcbz35+lE75UJWlupT6095Io/IWwUsWVriE6BOM2
	AxE6vt++sITsl0WY3NKT3iBoio+dpcW2vflQHA7F+gjnIBJqsWFnV6IBJWzh/yu1
	5XGcdDB6o30wxIdZcl67VIwgCEi//Hl10VECrhwXBB1LoR+LlBJXLPEBR3szxy87
	RZrmH5OdR9ou+j9UhrcK3XXNypsdaB3O7BJ3/FNcIpdcin7jy17aGc4TxWqR+2m0
	ymbjqZp+Aqr3P1iY/pK9W9Liqy+54wGijDBw3jV8wcTRHg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte3wq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:03:23 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9ee20bde0so732154a34.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783699402; x=1784304202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qNBbsusWm+Zk0082oioVL0lka3JQOjO15f2DW+3iN/w=;
        b=ShnsW9QhFKXymyKy2+7hHIMu09xsOGbpqMvzuTfJnGuVDP6fqUPndi4gaUb+3c/jaI
         ntJzhhnxwQgII3prb71Q7SZeT98hWa2h6yTd76cxCt2xQ+dyJiyoJquFPaZsOrk9sPDM
         iDCnuuH+xfiz6M7Tn2H9YAjRa4zA7rwjLSvJeUWX8pNuRW9XOpk8JiVm5exr+FjWv10+
         J4GZNstI3pbEBQOWNmWXT+enuRJZukgkj9VdBai3vwMed9dp5AA6zJgbJ9xYtv6jgspg
         bfzHP9fu9ay8ysfbFvUl3zbRkEolAYJPiizBX0yVld5KXkgSoXcVKZsl83g24FEJeoPy
         D+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699402; x=1784304202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNBbsusWm+Zk0082oioVL0lka3JQOjO15f2DW+3iN/w=;
        b=VmFNfMoCknRgGh5KgEv5Y/4pyXs91M42W9GKZ/sU035oXMY140lDL1GajhyWrZOwXh
         opH8jVF3ZViQDxbt/Qpu0dwJnjkXYJsiP7Ci3b612tfAhPdPJ3TrLY5ANKo59cVX0cNY
         66AFThZazznz2J0na63PTSefM7sNcGuTztE8v25rhnt+VjdhLs8hs5WbCUMCk0yHIC49
         k6uR1kd8TX1VdaXLibwOa7VaNIA3YUUO7FhTpiAr0oFmeLhkd7HkeiGmdv0/5alOYM3o
         bUoWttisVnYN4EtxjZA5ZbfU4djxFd+voL/PS3dZzX3zk+EuPyYPUDI7Hvqs9Rv3iowe
         67DQ==
X-Forwarded-Encrypted: i=1; AFNElJ93rfy5y/pwr0f9dbxqPHijuEHHDwgzJrAa7r5esswMpMr9sixK22CAu925KSDUuiUnMfui7cS5SCSf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3u0Xur4yULtONzVKKOPU5ATBpwYPrveq1AZyV2t7w9OQOl5F7
	BoJEFhJf+AiJxkaCwtmnFFKKmvCDDuT8DfYLqiG1Tee7b/tOAxJGwtd2Xf6Npd9jV7Kuv4fn+HL
	DEQdEXb2yqmmG38k1Hq+5UYNJ/mquGtK28n21OiFgAd3Yf3Ei0W1CNkBvQbSvw/HZ
X-Gm-Gg: AfdE7clgkZoi3zy2KBY2Aa0UtHCs8jdnlBzRyrrb2rPrGU0o2actDx+bMwABQ9UYTMT
	xQqlD5h++l3igifO/YMe8GqY848JfFoqZnk3Go3mVmhtzt9iGQ82mCoQZRYBzcTWLL4v3dxJcTB
	r2VmxGGorSwKmQIun5zHhxbXRI4r0MdUZL1HvLj054HqIlJV5IOiHnmyisuGnGWbqxU1uA/Xzkp
	YL0pe3/1r5vd1fwOlBuH0padK7o6IIsg5G6W7ojrzUeuyNqRoQ0RaDSTqgSpgWS8aAK95O4reyP
	Z8aHnDuymfAxR6iNUTV/T9XnUiZvK+XQVlAw63oEtuQBjzaR0gLr+fquToztDoPyFdm9Gc4tAy1
	dxJHz3iYekk0JYB8+8LJ5I1LuWuJpGbU/r3w9IPhDf2Lsrad7Y7c9t8SDexTo04Tml54LgpQJ3m
	dl6N70Nld8tvMriB7SZwbw/05Z
X-Received: by 2002:a05:6820:202:b0:6a1:5acb:e954 with SMTP id 006d021491bc7-6a36d972ba9mr8270221eaf.19.1783699401864;
        Fri, 10 Jul 2026 09:03:21 -0700 (PDT)
X-Received: by 2002:a05:6820:202:b0:6a1:5acb:e954 with SMTP id 006d021491bc7-6a36d972ba9mr8270179eaf.19.1783699401281;
        Fri, 10 Jul 2026 09:03:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84bacb22sm9899921fa.38.2026.07.10.09.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:03:19 -0700 (PDT)
Date: Fri, 10 Jul 2026 19:03:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
Message-ID: <b5nydlpsjbvycbhu42wl3tqhprpr7cckz6rv7vo6phxbfdink4@fzp4yrrtalsx>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
 <osurkrrhqgkxtgv6lkose2n7ll5f3ofydl2gnjenogtyxaohvm@7ccuyiaeg2nm>
 <409c36d5-d445-4ce3-aa39-34bcb859f74f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <409c36d5-d445-4ce3-aa39-34bcb859f74f@oss.qualcomm.com>
X-Proofpoint-GUID: dhmvwqNLqMO8MYIEV7Cy1ZX9bQ4gCxRy
X-Proofpoint-ORIG-GUID: dhmvwqNLqMO8MYIEV7Cy1ZX9bQ4gCxRy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE1OSBTYWx0ZWRfXw7c+r6d9J8T2
 jQwIiVVWJj0yLud0BOz2o7EDNPdtyWFtSYLoPw5EmBbUsj62cmxUZXCmJp939JPWQKcGWOF6XF9
 2HQle6Vk6CEJzuYHNY2lkn9oDlwOpnsVqrpzorzxOWAb0opAHoJLq3N2GcIHw+sRL+KKDurKFH1
 aZ/ZZHCLUm5oTlGmrImUjNoTUIduZiLAc1+wp1Gtf7SBiT6XgP0WxJXv7uxvKfq3Ow7MKVI6H4q
 TE2nEbWz63bgYvqLo4s0/qJolc7XCOGasrGVfXNJoz7Ff3wwuCcVFygzw3DznjHb5tKX7r3rLK5
 WCXu/0erwjRFE6uISXF47jYEtvbZimf7FTtXfjZz31mqkkMmY/crfgu7AYQJBfJllqEcdf7viVI
 lN9uIk9gOcgwvkaF3sIAbAh6KKPLuR7dLH4tzLOMb+UhSxMJOqo6qGVxlNufCycW9pR/Ep4lSHK
 6uM/EN7uYsscPBw/5zA==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a5117cb cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vZaFuzaNU0UfsOUG0jcA:9 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE1OSBTYWx0ZWRfX0yMo3H9YS0WX
 xAC8BIjOndiqjjha81xu9NI5xzRkgp834xpRzeXO55SrDcyH8e/Mhz1RK51IptOITktR0vADGu4
 UfciOkbc05TL4Uxmt2t5ZrNkOa2lwa8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100159

On Fri, Jul 10, 2026 at 12:02:46PM +0530, Vikash Garodia wrote:
> 
> 
> On 7/9/2026 6:44 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 06:05:52PM +0530, Vikash Garodia wrote:
> > > Iris platforms use separate context-bank devices for the pixel and
> > > non-pixel domains. Add platform hooks to create and destroy those
> > > subdevices, and wire them up for the affected platforms.
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   drivers/media/platform/qcom/iris/Makefile          |  1 +
> > >   .../platform/qcom/iris/iris_platform_sm8550.c      | 71 ++++++++++++++++++++++
> > >   .../platform/qcom/iris/iris_platform_sm8550.h      | 24 ++------
> > >   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  4 ++
> > >   4 files changed, 80 insertions(+), 20 deletions(-)
> > > 
> > > +const struct iris_context_bank_ops sm8550_cb_ops = {
> > 
> > For a long time I have been asking to fix name prefixes. Now you are
> > adding one more. No. Please write it as a rule of thumb. All new symbols
> > in the iris driver should start with iris_.
> 
> Ack
> 
> > 
> > Moreover, there is nothing sm8550-specific in these hooks. Enable them
> > for all VPU3.x platforms uniformly.
> 
> Good observation, will change this something like below;
> .cb_ops = &vpu3x_cb_ops,

Please see few lines above, that's a bad name.

Also, is there a reason to introduce a separate struct for those
callbacks? Can we fit them into the existing iris_vpu_ops?

> and the callbacks can be added in iris_platform_vpu3x.c

-- 
With best wishes
Dmitry
