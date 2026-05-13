Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CB20DD51
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680049; cv=none; b=YtzpNF0isAr/uEMifYjDd8zthd4uzDPyL2eGY1j5tbKyrIWd5MEbIUZsoBQJPSsu4KaUgOQllXPxdnd3X1SrzQIvKyy72h+7AjN7R+wgkdrzwJNMcOPskdrWyg+k4jyY0+wem73wBbXiTAYLkbtSLMrnEasfXBxYqsW5kW2IpCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680049; c=relaxed/simple;
	bh=PFMRWD1DzQUsbBzuHK/L3Y9G3Gpl6I9x5VQNYXCV6uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwEMaNyWQMByuQeKceXgZ6lbgX1jWW9ynU3QLfe43wHX2kPzSSbgbYTeYiI/4AehV3/SpLPEmxd8Z2wWJDvkyismiiEi3SrydfO0hhQb3w9aywEROeLvNfjyKHUqOuIK4+z8c5ttoNTQOgUmwK5JtT1MCuxwclRnqRYgGAyhO28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erl5IoFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiz1A0Sp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erl5IoFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiz1A0Sp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBn8wO3326359
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gF9m9TlU439Pia82PPMay5Pd
	uiP3AVmilaTFV8rnjwc=; b=erl5IoFj7hZmKlle1t2SU1AbF7+yoZbDYxwXbYoc
	WcN7vE88IQs9T5qa0B7guptaUFApBLVZsT+3baHrTtq8jT52vl96uSK/rLCPq0WJ
	lzHUhbyg7lLerNL82KxLoIrVwy1D48aOFoQwRNiqg/kBzTdE8H7tALci44lMt43U
	cv1KUhlTw5oRGwJKGGDXFKbZ+VZg045glNAqNLORKRV2hZclcMDGJsLHSrBXgTWj
	JzNwhukw9hpl1MqT4aEw1WlK2+Kwt7UEuscfcrUffESGFLg9q5vGQZzsCxkI4Klp
	NFVTfMXdMFLeyBiZZFVnDO/s7yUJvJ+r4P+7xHRtKQmSsQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9pqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:47:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6347ed78bfaso2807135137.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680045; x=1779284845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gF9m9TlU439Pia82PPMay5PduiP3AVmilaTFV8rnjwc=;
        b=aiz1A0SpYBEPgKyIaq5jlVTKgN/9Nq4DWrkyt++xyRiKhY5g5Ab5ds8yoWYGVKOnZZ
         bpWqpQ5UV/Bo1EGONL83muKJxrGL7hUaZZ/T1/kuFr7AMtwZ3/wIe7JbujVrJKP9IKSg
         TmwzZYTzCfkLFwiicaI5wvT75tKaodSO9S37adgSrTsqyfQtqBzpLXblc5xdVgturOld
         MSmrDGykRFHJ8fZVXEv9LZPzG4YkJybP0nb41cqYQQWJv0xXK/WCH4D+9u3twh0bV2dG
         8NqgW+5Bi1sICG0+YyreSvde7jhDF/BA0Iwfdakthk3rjBM3pdutum+2J875PcqwYdGQ
         tIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680045; x=1779284845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF9m9TlU439Pia82PPMay5PduiP3AVmilaTFV8rnjwc=;
        b=pt3AKq8PEpei3/siITfn4jsChjqCKKMhE2vl0FFJXlNtzKInoLE7Glb4QoxJcX+Uj1
         RWho0JUA8MNUKAaIXL4o+6dqyCWg+APHEnNJqnh1hkWdMGXq46NwyKeNxuNgO6g6kaU2
         5rkPQWlmkXLo21irBUIEEPmcGzX0ZviAP4DjWtO0CbxgyZLoLV5Bzdku4tk8Duua7jpP
         LU6cjqihZf7B45s1xUo83Xczc8vQ4AIWNeRVmZgkp6dahmyr7CArNfyS91P8Qy10phRj
         NXHpZuuzmYD0MQnnB5XEWhvq6+u96b95R1oCz+735pYBGbkyG1xCa1Vu913IsRreuV9D
         qlQw==
X-Forwarded-Encrypted: i=1; AFNElJ/IsQOauC3vVtDFsJW+rl0IyMbIIe4PEgaFdaWsIDDvpVaGUYvlZKgoK7W5K8XH3/Rl/q3DrfXE4Y2t@vger.kernel.org
X-Gm-Message-State: AOJu0YzRAhfDZR+vXth6OsUONTajsS8DGykMoVpog4V566GTSIaSNje9
	2xRSo5JPQb2RMhI8rezPwIE0JsJ4nOS0DYdflR16sTY9t6pH0eTq66NgoXFx39cQu8b0cxCC9NC
	Yax3pUPUnRRKAtZ4hn0jWJU3YRLMjmZI1J8p3pE6cogDz78AJW9EqGsBhlG4ff4zF
X-Gm-Gg: Acq92OGARZIuSEZPsybhwPXBdRX+QDZuUi3VgFQSEytQabw5WvJ9mkuDPqWv9dJQror
	uLag1FC5BqCyUiSFHMyjylnPu8lMbxj5636YL6nZgBNvmP1ETytKHZTwOhciqo+iEpsWxDwUlPk
	Znfk9QPmvGSTaMgWRheri+bo7dySSumu+TXvhHneyTm3TqoU/ftmnH3clfWmFNBtjU88Vm78/yp
	IULYq7k82Ajk1lYHVonzqBhZVGq44T4+c+aIS2pGZ0xuVS9CXYU9wMVLBalQ422EaFlz+h+a3SL
	PE644DdAA1PkKIiUhoyRJ4iej6krIohlKJFWr1phHcUx3s1jwH/zVNOihPUuKoupdKdO7CWy0Ee
	lMP6ZH1MKKmFBfJsZX//uvvArpZ2n10qQH/kT4pRVsJmzgx5vas5IU6GBz8VgwmVMtDn/HVT7pr
	kEh15gciGeOgmNh3Ly+TCtEsv5ugcw7VMxAX0=
X-Received: by 2002:a05:6102:1512:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-637a6c28831mr1286299137.2.1778680045491;
        Wed, 13 May 2026 06:47:25 -0700 (PDT)
X-Received: by 2002:a05:6102:1512:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-637a6c28831mr1286271137.2.1778680044935;
        Wed, 13 May 2026 06:47:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b225sm4025242e87.83.2026.05.13.06.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:47:23 -0700 (PDT)
Date: Wed, 13 May 2026 16:47:20 +0300
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
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Message-ID: <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
X-Proofpoint-GUID: BzjXyGjht2XvkY_Q0gkJziwZ1lqndu7I
X-Proofpoint-ORIG-GUID: BzjXyGjht2XvkY_Q0gkJziwZ1lqndu7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfX7UuQytS5ZKRv
 m9ObaV3PdEB04ePrbuZ7VNh3W4oIDYldeKrfKgJ3NGDBTAVykWrD6A3oerAmAnZFKZemiMC+0nl
 iquoRvWF6Zq/LTfQjKYZPVKnRzulrkUK/ewtB289cwTUHKAwqIWOLK49thPXOCOKJpCYpQlhM4B
 2HJk22DzVJis0fpOxPJtf6/PSTb7cDJEt7lx6UZlEFrk5djMXvr8xEBqLj9konxn3WFA4i71rXW
 vPnP+xX3DmG5iS/RZToyQmN4JYAxnNeQSihzY6O2LC9/Q/1GiJvCW0d+PwrT5Rl4iptZnWD4D7t
 O2+H/Dfo0J7mnNMlf6X2YAZnZzZmtB9mUIIfbdG9x/eF9G9IQYe3HcvAHtxvNs7xo0FY3jAYghv
 YytjH6n69yZXb4jZb9ULVT9VwqB+bCW2eXooaUEh1RYDKa68ZhoznM5pkIjcHen5Jza/a/3hrwq
 DEgOT1bkaJ/6DAr5uzQ==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a0480ee cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=T-6Eqvt1JYRBjGg4ocMA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142

On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
> >> The current clock and power domain enum names are too generic. Rename
> >> them with a vcodec prefix to make the names more meaningful and to easily
> >> accommodate vcodec1 enums for the secondary core for glymur platform.
> >>
> >> No functional changes intended.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
> >>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
> >>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
> >>  .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
> >>  .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
> >>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
> >>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
> >>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
> >>  8 files changed, 67 insertions(+), 63 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> index 55ff6137d9a9..30e9d4d288c6 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
> >>  extern const struct iris_platform_data sm8750_data;
> >>  
> >>  enum platform_clk_type {
> >> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> >> +	IRIS_AXI_VCODEC_CLK,
> >>  	IRIS_CTRL_CLK,
> >>  	IRIS_AHB_CLK,
> >> -	IRIS_HW_CLK,
> >> -	IRIS_HW_AHB_CLK,
> >> -	IRIS_AXI1_CLK,
> >> +	IRIS_VCODEC_CLK,
> >> +	IRIS_VCODEC_AHB_CLK,
> >> +	IRIS_AXI_CTRL_CLK,
> > Why AXI_CTRL is better than AXI1?
> 
> Glymur has 3 AXI clocks: axi_vcodec0, axi_ctrl, and axi_vcodec1. Using
> positional names like AXI0/AXI1/AXI2 doesn't convey their purpose, whereas
> naming them as AXI_VCODEC_CLK, AXI_CTRL_CLK makes the intent clearer,
> especially when platforms differ in the number of AXI clocks they expose.

=> commit message

> 
> >
> >>  	IRIS_CTRL_FREERUN_CLK,
> >> -	IRIS_HW_FREERUN_CLK,
> >> +	IRIS_VCODEC_FREERUN_CLK,
> > Can we at least group them too?
> >
> >>  	IRIS_BSE_HW_CLK,
> > Is BSE a core or a codec clock?

Unanswered

> >
> >>  	IRIS_VPP0_HW_CLK,
> >>  	IRIS_VPP1_HW_CLK,
> >> @@ -206,7 +206,7 @@ struct icc_vote_data {
> >>  
> >>  enum platform_pm_domain_type {
> >>  	IRIS_CTRL_POWER_DOMAIN,
> >> -	IRIS_HW_POWER_DOMAIN,
> >> +	IRIS_VCODEC_POWER_DOMAIN,
> >>  	IRIS_VPP0_HW_POWER_DOMAIN,
> >>  	IRIS_VPP1_HW_POWER_DOMAIN,
> >>  	IRIS_APV_HW_POWER_DOMAIN,

-- 
With best wishes
Dmitry
