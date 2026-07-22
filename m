Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0295464D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724579; cv=none; b=UkujPmyUKf+Mu6sakLxZ2hEoV6tl8BuCr1e7R731Qdg7w1oCTUBZR3NgnbApAnLP0w9fnv+Sv3+y046QQd2AXM5z+lWGzcbowh/2TKGOwgGThbHoHHaIdJ1c62pmAs0lhhFFQNvyQQ2duePyRuBfqNJebaxGSW1XKAcgsFGbp6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724579; c=relaxed/simple;
	bh=ftl7lQgZVXSeePeURz6F58RiBLIMbdzJLlREmRjgVic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfKOPmmD0Ap2kf1yx4aeir6qP9cco5029nLZzdqAaOIRYhAf2qdnuaop2mRNHPBBShFmQGq1OsRtrmc4wlCEgTWD+q7uzrGHaF4IoABK9pgFDcvEXsHS5SDUhSR0LxSLRAERDp44VlnUpFzOdAxIZ3Iq4X5cA8uApYKpRSV8okM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGMavzPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bv3w1YUs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGMavzPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bv3w1YUs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xMaS412345
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SvpfFh8meIdG+fVyQZge0oBf
	XwOwRl7s2AXihdnNzLk=; b=mGMavzPgc0wmIRd3o+bWadn4O4COHBv64ukLrSVU
	9EF8RB051wNBpvSGO1/5XCORDMoAb5v+HJsr/1dB74ehCoJGsuTiTmzfsR6GizS9
	75DPWLmxCGaaa7sbrGXbNtq4buCkE9Z92FecosUdM//DcvCpMgjR7y0MvVbiz/mi
	wm04LV3nDYsD2HB965u2XMKzkSrBFqIiPRz7B6whDbz+6IZYVNSHUciv3LKsJivJ
	Dtlvn1Rqb4kCcFytxGodARVhsWrbL5DUJjGc8Ecx1nUDztrJDiyBmZ92Do0msR8V
	DLji7A1b+09igrbN2rHq2GI81b2Xi3Ic4e25dh8oqtzBbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdhwdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:49:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c110a3b6aso146880701cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784724576; x=1785329376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SvpfFh8meIdG+fVyQZge0oBfXwOwRl7s2AXihdnNzLk=;
        b=Bv3w1YUsEYDEoXciljbdZVGjTC6hDlAdrbREcGD8dVXlRsj65Gwhk3iPsX075F1H3Y
         wwI8CD41uu8M3LZzAiyARPULB5MBHwfdDFpLjLR7dSOOindAxedKFDM2VhtEN1BhjysB
         EmhqbtQnEp8FehHcV21eLUYwX53FcSKZYFW8XoH1Fn0j+q4YG4AqqyF1JRXQdsyn7l+0
         Blw3CG+OlVRj0OvWWws/Rs7eIqq3TfITVEjVYxcbeCfFMiGy8IMUJte715F84Aqgjy+n
         394JiMYl/yQE7QVCoUBci7nqxEi3IAc+vpfg0CZMC+BUxTiKNC3xlr5KtPI9sK+VSysB
         JeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724576; x=1785329376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvpfFh8meIdG+fVyQZge0oBfXwOwRl7s2AXihdnNzLk=;
        b=kIZOjNXdMVyV69m//aVlEDxdtBOSbOn2gQDz4CDHd7Ff4hBfptd8dQSAXdx3ZmQFMC
         r49UIV27ooUW4Eo6bN5dMzNIx7M3xQ52eExRXp2HPOk1ML9omemfRIaIjXfQXP+0ZrtT
         9UoL7V7O4faDHQ9Igsrx5uxg9Wzyiw4fmstjdhiW3qTdGC/UohjQwbOyjtH3m2E0y/ei
         IjSNLzffFC1tafZtuSU2c26spDgSxbiiJ9wmeFGDEVL27BM1wQGdfyoqvmb5qO/FRKnv
         NAmNSjG5ZmIb3ByYeaFH2FD13DdG7uYpwlAhWyTjaPUBVCgrQIFghbPgSsGyqdty1cXv
         h9BA==
X-Forwarded-Encrypted: i=1; AHgh+RojAWVoE4V54kdxwBsoSvUzTWeAU+x8WgbjKi6fvm60XVzplTIpBH6fkHzYgN6oklTb/F7Dmux1GUUq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7nVvJ5RuXoKOuaz3xZVCb0ns7UiBn+TDRoi9Zs+50vYOU9+a
	2y8OUHXqpadpOCEneCF/3KwEj/1thvrilkQjShl7tniazGEJwyAIWRhiPo8vT7FATg4ovTSATmD
	9frtMcs0RkmpjM9N4QhM/9rEuABP4bConhOFY97AJQ0Dkax6K84BeQBTH/7c4l8Jz
X-Gm-Gg: AR+sD10gxsKG6QMT9WoeHcx5Ap/QpWxmn8Ew+cE38Z0sxrM5XOWr5hTQGaLPXuXApp2
	z1fF7ebbDlRXSEIOnQtz8trp1R0Sw50q/dpvBlsWMCkCJl9j2MUWa5OcE1tV4PCsfBGx3KxpBqN
	gxwj0UoMn9rHOW4ENkec40REMUjh8ppFr9pHJfR/IVotbU5uN0zGdVsrL/+7C08D0ZXUkONouM4
	rfKWWufH8RTG+dqXfEDbIW366bP7e4lz0BKKbIokLKnhX09LOWMN7DoT6021n/W089emrlwtl1A
	kIxBq63ZYmY0LFq7wxTxhVm5nrfd+6OEThOP9wvpfIZmcwfcdJUee4zBH1ZnC5fUcOiUL5LBHzR
	YQDztZaTcQcJX5ev8ZVoZPZp8IIfAbl2XciR0+E4QKIGMul6vMvTG647vzNuVFMBRkP0Awatt2S
	5Kuv22ITVFPPyMtg==
X-Received: by 2002:a05:622a:a952:b0:527:6d0b:b00c with SMTP id d75a77b69052e-5276d0bb519mr42601161cf.68.1784724575784;
        Wed, 22 Jul 2026 05:49:35 -0700 (PDT)
X-Received: by 2002:a05:622a:a952:b0:527:6d0b:b00c with SMTP id d75a77b69052e-5276d0bb519mr42600811cf.68.1784724575282;
        Wed, 22 Jul 2026 05:49:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d5458csm4128091fa.29.2026.07.22.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:49:34 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:49:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: qdsp6: Remove unused Q6AFE_MAX_CLK_ID define
Message-ID: <flb5lfpxvh72yyajck3uspn5tb5gdyqqbwyhci6vstzep32fau@tk7qmxjbx7ok>
References: <20260722111655.3558096-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722111655.3558096-1-prasad.kumpatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyNSBTYWx0ZWRfX6pNGo42mxi8n
 hG3c96vwvYeI3WA7KRo71f4m9RNWEtTZ7zVKtY6N8Baa80y0xb+TAedyr6XU7C5+1Hjn40ComcG
 RPkHBuGUifjkp4m+JW0RQsZibC8MZwJYvoyplekfe7Ot0DzYOPW2Bl1ZVAQk8ml4gFP3CiRPbyP
 4mm/8Lz8gkqJ881M0BrTjSUdRT9+ZgNTFu6M6roU6duqmcqbi2k8QnglOghHFCUC3lu8E7FI/7E
 QW9XApckiU7ZoIDkuTy2+MsVfchYizvJk5vwUQEXSjVxBmAk+3T324z1kiqVIH5ZXj88l6dYdU5
 eMXsRzpqchzEqD2ijvq9aUu8tc4wHQCGHiLrDFM53BauN89FTLaVDLyvxGYOorE4bKcHtL5cqs1
 oTMTICQqe/s3qgnii+Bt6UDTaV+ZTptmpp14WIyVmMU6klZtqUUdKPIc+qylRczItLII7YOO7NE
 kk8EvcxHR05sWBVKOhw==
X-Proofpoint-GUID: UXGeLuJB0xVjSjJJIgQ2hjFzZntUlrIq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyNSBTYWx0ZWRfX0vPJpSOBu4r5
 3klbwoNXPMLtWKjNKuEMbHIiW+ep6uO068iuemWxL7pi78BcXA+RPj8fXJQUK6fiNuSnQADrpfy
 4hasCILCC9ZXkG2NXdMRBDfZ7jBKLGo=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a60bc60 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2qMAu7doLNGE-PBth6wA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: UXGeLuJB0xVjSjJJIgQ2hjFzZntUlrIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220125

On Wed, Jul 22, 2026 at 04:46:55PM +0530, Prasad Kumpatla wrote:
> Q6AFE_MAX_CLK_ID is not used anywhere. Remove the unused define.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
