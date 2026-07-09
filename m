Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC515383C64
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608870; cv=none; b=DSbg/Ywp0hbl8pcFqVVyEZZPfJxdgfLAWcglclKLBGmHmva73kOjf4y2aMt90EwCq9N2L/kIqOkVkXcLx0bEK+rDh3au2VZol+Qq4s2AZSt403HtovPajbphtA4khxLNnwavWFp3uE2J7o8Vv1nPoh1UeDbQXMx4IBFSHVhpKzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608870; c=relaxed/simple;
	bh=Iad5UADQt9fXiFcZiRSv6DKnb9zI3RyEtPOMI+t/pn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ActRHpRmloJbkUq9UbZP7CnhoHSn+RxrnnbSORTH+di6xV7bqSs0EAbzsgEPleyXrzS/Vmt3lb9dU46jDVFlpY9/5xTy2BmMe8+nHB9r4V7JazrwZY7GR/Cd+Ili/N06CmMCvxqXh+ntsuQFrMpDBTmLM1wQA8j93jpsS320wqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgFK1CrJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxY1x6Ce; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgFK1CrJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxY1x6Ce"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DwPLr2014460
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 14:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZMd5SzYa2JtJsuef3gXqhLim
	tjjWD7XXATJ3fVJWKFY=; b=fgFK1CrJsVkn9+lyI6grWkzihN4jSETSO5v1zhyx
	yJs1ZTq+7KHtpwkUTbuaxhcF3PrJU2srnVT/38qhJ9mzZM1mQ4QjpOepB4feKAhb
	qUCPsOaFsIoCJtlfRnch1AnGKK1yM4fPZZ7L0NHLzFKXA8C32Mq4xZlovyMONOpy
	As1q+d7o8m7GZ4QhEASjtxVGnbHUjp59LzbgeSQo4ZsQoFzzQ+geRApF82v6PJQj
	J5c9kaLgTPyqOhu17GRIOLVfHTARtljnj0obrgas9663NRdQSoTqMvFGSqpoDCT6
	DLVVepZvtOFYWaPqh6A4NGKOmJiJpHkHoVfPC2GrQjWg2Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6mdfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 14:54:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e7c828adso377363137.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608867; x=1784213667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZMd5SzYa2JtJsuef3gXqhLimtjjWD7XXATJ3fVJWKFY=;
        b=kxY1x6CepZIbeBFdl4SJHiJUMZeBfoqaQenmfM/UvsypgAlwrx4xEJwZl4/f/isXex
         QxxN1KMzu3wjA2EkvGcbEWPKuVyOcNSbrkj2qJiWxJKId/QbE1ybVLe+N7RL+6/jby/6
         UveKO6/uL8RKAzReXCAqFn5ISRDnx31X4vfAu8YHReCHSwTDiGFZiT9VKzVCB79VvywC
         Qxug6kBB7wC2dQUT6Vmovu8oAjjPbFyrsnQlZu5Zj43GZptry2CQfnQpDpsU8x8amPay
         Q4g4c0TCgYgtEasAJyueS1Vj0lpva/PNfpFqE6/LwFNkzTYl4HMXuVHg/eeTcoUviNDb
         U2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608867; x=1784213667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZMd5SzYa2JtJsuef3gXqhLimtjjWD7XXATJ3fVJWKFY=;
        b=D+cAawfGAp83uY6Ip1+l25qOmYWf8XM4+GK4t6OY8G8MzwJR+Gpz7MT/z5M4vRoDRP
         xquo76MLQuLsvAsvIMVGNeEokix8Wf7Ae8SexpZiWlc2sb07hJoqCApmhyq8jvZi2ooW
         cwuWovh1Nvma/XMLrgsXsKAHLnvgAjFZ7rcdaDIhfobg+8sNjglbulL4XsMh9poe3bSt
         rw/GTqMCdNO+1fmttcprQOfLDnvr1p9D8xO3fIDSVDQTCQ1BGiiodjwnUia+RshV/qFz
         E8YrHT6PGcPa6Lkx/ZDGLpyoQPboOj+y2rRmNVYRTmU5oPLSXRftKj+66JTsCPoNyFNo
         uHzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqyi0yoviix1rM6CLe64Jm6se3git4FdGwuamERyNkkUuZyNwmzrmKO8FeSX/3sPNiiJO3pgNvWKoV/@vger.kernel.org
X-Gm-Message-State: AOJu0YyhWRu1R4/Zpo6qlfCWW8HirdwAf2NXVqyG2IdNw8Ksc6qy/GEs
	kT4hLCdxjtlGLK4lnN9uZ3j/UWG88zWPp9itYkA3rKSX+vGTgf10SpaNALpLv0YPh1r5cNz1q+C
	YOX8zAhu2UOqG/3RQdYnPAIC3AtZq8SeuBrAF2yMWaG9TzaWWjpNj3PXk/fWpTalb
X-Gm-Gg: AfdE7cn34zbDCfhJKEfTJYKuGN7kNz2ZL195hSfDAbqWX+UZcG16WyszL2vi3AhEbrl
	Eij2wghAET7DpirmSTQIPufap5a7WUujkWDhVujepOaka9qIkFH4EYKUw5B12OeqT2B9vaWYWyr
	joZ96LHw23epsN6kcGVgvMo4OhH17u0A0KSnMAxawCnrdQ9JucAgl9k/fABqzyUPZuJp01P4PtM
	L/ewo6STQkSOC5tKyaynFEja9c7xgsEWy/pT610FMFXfDNnM1Iy0nTAWVdzdZGXRrQwbqqHgdF8
	4ufgBQ9NomrPOagKyx3M2O2rqMkO7x+lq2zTurqJUveTn9RoKCTeenMWJUdFepRl44em9VRV68R
	RL9c/ci5FEKcw4abazBpjrEqdjySJiSFWmJVUfQcxoN9RrPUdhs6WFmFpE1GP0X3mIijOiynBN7
	pvNrb1G07Z7OAtS3hfLMOT5qa/
X-Received: by 2002:a05:6102:5cc1:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-744e03d0408mr4194097137.22.1783608866718;
        Thu, 09 Jul 2026 07:54:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc1:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-744e03d0408mr4194057137.22.1783608866193;
        Thu, 09 Jul 2026 07:54:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b017c29961sm500429e87.29.2026.07.09.07.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:54:25 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:54:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NyBTYWx0ZWRfX9fZFACuj1OpR
 /zgHoPm4LxUUeT1wu9OVtZB4Kb9Z1hMjckQfn+bUKuGFCUpBdQh83rDwQ2RMBWSgtxa8mR4S8/U
 y9Zqx2mTWVDMMO+8LM0d7tr5NVN1p/o=
X-Proofpoint-GUID: kQaSfqvQzYjyFZfJ61bTEecgKltRxVTS
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4fb623 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=9jRdOu3wAAAA:8 a=pGLkceISAAAA:8 a=gTY0VpHTFMgWGwS8g40A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-ORIG-GUID: kQaSfqvQzYjyFZfJ61bTEecgKltRxVTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NyBTYWx0ZWRfX3OiYlZacJezP
 rzGLaNnFmp8vTiJbbe4c0vVHspSuEm/a35WB0BU9KjW9Em2vG89J35O4g2anStwGMlUHCak9F/I
 tm4gmWDm35u5nWjp9li22YdNV2KQabeDv0aVv1DPzj6nY4m8tX0XULx1APg/t0Tksv2shnIOJom
 jdNRKxKzF7A4M6Tn26sbFrTmsYrxKgIROV3BYQy6yWdS1vt9tjNPg2kJ56Jsx5ueSeI2N+c3FAb
 w4G/pIgtJovYTKWsr0JjOTcd9U/NAWmK0s7oLw13m/1G2Q2WSvvaqTiAbjiCA93FVOOQhBZRMhz
 IHDdq/Q88OZRLZfu2JrCW8v7NtNPlHamzx9KC/5H1sEka7AAJilUuBjQ2NmU6xZmuXwnbd8fVAP
 FVwKAi0uAxVkG5Wsf5j4U9akhBudGBIrxEp18JPzOJpDtIsYrYJwOHlhG5rGAowmwen0ys7Djm4
 md+NUU1cURDJ13fCghA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090147

On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> >> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> >>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> >>>> In order to associate the SID used by LPAC to it's own domain and
> >>>> context bank we need a separate node on the DTS.
> >>> Can we use iommu-map instead of adding a new device using the same
> >>> addresses? You provide zero explanations, but it seems like you are
> >>> trying to separate a part of the GPU into a separate device, but it's
> >>> unnecessary.
> >>
> >> What I was trying to say is that we need to map sid0 and sid1 to different
> >> context banks.
> >>
> >> From what I recall, so long as we use the same dt node, the iommu drivert
> >> provides no way of doing this.
> >>
> >> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> >> and secure.
> >>
> >> The address on the lpac device doesn't really matter. I have very limted
> >> knowledge of DTSs but I think we could just leave it out altogether?
> > 
> > I think, you were poined to the Glymur Iris patches. Another option is
> > the QDA driver being submitted too. Both ot them use iommu-map to
> > describe the same usecase - a set of SIDs which are used by the device
> > but which should not be a part of the defaut set. With it in place you
> > don't need to have separate qcom,lpac devices, no additional properties,
> > etc. 
> > 
> > I'd recommend following the same approach.
> 
> iiuc, the conclusion in this recent thread is to use child nodes for a
> similar case:
> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/

Let me check internally.

> 
> -Akhil
> 
> > 
> >>
> >>>
> >>>> Add the code to look up that node on initialization.
> >>>>
> >>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> >>>> ---
> >>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
> >>>>   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
> >>>>   2 files changed, 21 insertions(+), 1 deletion(-)
> >>>>
> >>
> >> Best regards,
> >> -- 
> >> Anna Maniscalco <anna.maniscalco2000@gmail.com>
> >>
> > 
> 

-- 
With best wishes
Dmitry
