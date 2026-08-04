Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5F43E9FF
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849046; cv=none; b=M3cvTvCxbzPUll2TNoeDlpRNMKSh8nag0b/tt8sE5tFRAVB1P5Gtsr1pa0CBw2InKXAohfKk/SBWOQEdvrceeBE9tRk5pFR6P89D9sRF7SKOwE/an8f5dSGoS6y/UKl11AnvOVDBXhZNcksv4GhJEQsS7xzZTKDWtiy3xo374iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849046; c=relaxed/simple;
	bh=gFRH7CXmJkXs0z91+LpyQOy87BWUCJy9mgzdjT6U6EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNJ9TBpwPzA9fmy0SalCVzXxnTkW1zI+2vJT9B1uNTZdIiwR4CoPknhaFEUQxYesJymAK/s7yfBZP8+ZjQQ3G89sJ+vjBDTeb6oyW6W75MBiN44REsUEOa5X2AiRhEHCDwW3Ge3WnfbGSP1JI6p8mbubts3b8WYcVKvadVJFs/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0R7WbgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuX91nlz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0R7WbgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuX91nlz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674D31Rd3693337
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 13:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U92DREcn/XIrZyp1jQCi8J62
	md6LueH/tnK1yoQ59vQ=; b=m0R7WbgPrBmcU10qkAgmdHUYigmldLllqmdhWMWP
	5ErLEM6lhFN90kMkDk/xrOI6a5EFvROFiqzzkaSrf5jyArLWQuJ6xvv1+UAQZF+O
	FJxEuGIBTF2W1dbsZvX7Y+9xZPvkGCpFHOeMU5DtDVVfWKHdyR8VOjyJB4cLFgBQ
	ewhnfTjdYULPyo8AX214VxGhuf1NSr9GOniCm4WnYpUlUHXSC71q97kGCtvYcu71
	jCXZLVGMG8/2MYdkloN+60vtW+s4vDvb3PtEJF7nKMHIW7zmmLwOlU80hfOTRSmL
	TPqCtUHxxijfY4VrY5WAg8HaTxcBDvsU3M2exhddK0u4/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmgg15x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:10:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso95559956d6.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785849043; x=1786453843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U92DREcn/XIrZyp1jQCi8J62md6LueH/tnK1yoQ59vQ=;
        b=EuX91nlzqgxnHvVL7h3DHZ1XKyjCZnUkSslW5oDPT77UuTOl16a9nMLDbYXsu1aOmu
         Fi6S+L8IwAm1zeQICHKa8QSzxFfe3cIiSY99SYsBhoaab22UE5/tqwanVY3sgqVowxiP
         /wfMJH26Eiov4h5EL98Jlx4n1BJb4suQK9pBGKwSB4sWq/o6mi56zOcrFJiyBgbr8usk
         qFwuoCzWxQN1sIIZvzvoty+yMUSdhqfOjxh8wAQBZ9ENBJhQiXSkZLvSK/YHOxa7CpKz
         /xu+zzEE0uC9KCtK1T9YdAzgY9xJ/WtU78rKcOhSQdAgPWpMcyIcrzj1hA9+x+QVSNf4
         slgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785849043; x=1786453843;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U92DREcn/XIrZyp1jQCi8J62md6LueH/tnK1yoQ59vQ=;
        b=ScA0EGc9WLM4jHjC88w2M5iN9cm8qqIy1pHgrWl4p09iRouNtBG8sM0f3OFBsF6/JU
         vVIfh7dD0g0AInfEQ6+cbGBOhH8gMdQlMU/jH9bxTJs4KhbSsuLCYsjeMeXebrhGw/74
         KLnLrBjs34wNc33FaydC1tlRLI6mE7wlBf/UAB5rvPwqFBxfsRze2QR9RftiQVKx91QW
         DHllrkT87RSjYJCptC0bi0LFcl6iWffRKwt0fzik6X/0YLHKa5LQBR+kUHNarPvC6R9N
         FIbBq0u7r2Jvv6N6qqBejIFxzaCfTGfPPu8LELXxiU+TU9s0AaCv8pRK1QgaURaunr8P
         jm0A==
X-Forwarded-Encrypted: i=1; AHgh+Rq1MdIq5izCWarfq/TvlnkE5lR/xUCdNT0X1bBOZZex0bu4UFGOWOsBWUgCVzVwKpEBo5z+qm6MS5qA@vger.kernel.org
X-Gm-Message-State: AOJu0YyA/Im+ydv0kcCPhiR/6N1eqaTPMPev0zEN75m2Caf9cIt59bus
	A+ELk9BNvn6h96mZ7NbeGCNUoCepBXBh+9r+Wp891geAg3gQMqRkN9dxNeGrQI0Zg1o8GcY1jbQ
	Egayk7aQ1vFfkwrmbS8pOtz227uBmgfIVT3YteoxVBI0mBg5keCtQmsXfMznWKZ5x
X-Gm-Gg: AR+sD1362QNuxyCECxJYRvbn6ffaJnlCT1Iqqhf3noAfNQ4F2RP4b1i8kQslqDleyhw
	pXMw15bb2j9idAVyOSWpBcIiZdqvqU3yZ81VIwRWa4UrWuyfftYcMadswEWmqVj16nO/+xEVYsT
	Xli2/1itlW4R040Vpx5+aXQ+dGHfyeiTvuek9IPumahSeYFe+J9RAtTmRarS0mL/sJcmb034paL
	yexAM0F/zJSlN0ZJEXlKbp4nnegNS4y/JGjimCO0UbDohZN6hO7gERAksOHLmlAaiQkNwxnzXUi
	e9qa8WehysdmpKrILbMRUdaCAFWC5Fnpdvt+oQw6K+nKpU/y1ojg9Vk8Vrd5l9Y2+XqQ9gj80MO
	K1nciCwXys2cB8TviHmttSvMWBd8=
X-Received: by 2002:a05:622a:181d:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-52b5666c0ebmr256188411cf.8.1785849042619;
        Tue, 04 Aug 2026 06:10:42 -0700 (PDT)
X-Received: by 2002:a05:622a:181d:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-52b5666c0ebmr256187501cf.8.1785849042073;
        Tue, 04 Aug 2026 06:10:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4e7edd06sm82496911cf.2.2026.08.04.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:10:40 -0700 (PDT)
Date: Tue, 4 Aug 2026 18:40:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v14 3/9] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Message-ID: <20260804131029.ol3zk5sbyfcmzh5t@hu-mojha-hyd.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-3-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803124442.krqtw6si4ujsnuul@hu-mojha-hyd.qualcomm.com>
 <de961a11-71ab-4642-9ced-5b97f47d7110@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de961a11-71ab-4642-9ced-5b97f47d7110@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwNCBTYWx0ZWRfX+8Cpxi+CZc4U
 Z5ba7AQPP+AZ+sdOebHNK4pDtxbbkLwfGBMV8jqygBSInh9wqec3P36Ia7lGtSMrKnx6dpJ2Zdy
 0pJlTPHF+R73wZI9WibUFywtouIV6k4rDDeJ3AzKGa4UdGu6fU1yXBkbYpA8t0azApn2tP0feIC
 9Euxb14ZUWc2QFD4NxJ5nIrpl1YGTbuWZbu7SakoWJw4KHwQuapp1xtLRJeJ81joHpQBNNN4wPB
 +KQkcZTvA4xR+t6SX8NhQcooxbOmkGCPwa39OLUDssCOGcT8v0C53nUf7IFEAlZFKmDnPq9Fom/
 ELhrBTGfcfD5ZQ2uuvNqzHuhYr4v5ODilQOqhNslMncgMNAq2+cNhiJkXmiv2nzTwZ6kAyFBAzt
 lUKjuhrAwdqOx239X57m99Nnv23wTHYcRuC2vd0h5Ogba6WXWWb3/8XSinUnSuEUGVsOtAux1+s
 K3zB/PKSbrHTBb89muw==
X-Proofpoint-GUID: ndRmf-e2HFc8RYAwROItsCunaDc4VPv1
X-Proofpoint-ORIG-GUID: ndRmf-e2HFc8RYAwROItsCunaDc4VPv1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwNCBTYWx0ZWRfXzt7baEsBBZ9A
 WQAWNv2/a6Aoyz+vY5mmt+mGD7k5qE8uwWzWBAYZa5nYmHyXd823qFAb9T5aMgxgf0WJZvj2ZYE
 p9gnHoaSvkI+udpvJ2guff6BN18SYDY=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a71e4d3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f5OQM1LZqQncRT56GpgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040104

On Tue, Aug 04, 2026 at 04:49:17PM +0530, Vignesh Viswanathan wrote:
> 
> 
> On 8/3/2026 6:14 PM, Mukesh Ojha wrote:
> > On Mon, Aug 03, 2026 at 04:16:09PM +0530, Varadarajan Narayanan wrote:
> >> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> >>
> >> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
> >> SoCs support secure Peripheral Image Loading (PIL).
> >>
> >> Secure PIL image is signed firmware image which only trusted software such
> >> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
> >> Peripheral Authentication Service (PAS) request to TZ to authenticate and
> >> load the PIL images.
> >>
> >> In order to avoid overloading the existing WCSS driver or PAS driver, we
> >> came up with this new PAS based IPQ WCSS driver.
> > 
> > Can you tell why you need another driver if you are using the same PAS
> > method and it is using more of everything what PAS already
> > supports ?
> > 
> 
> Hi Mukesh,
> 
> We just use pas_auth_and_reset and pas_shutdown APIs and do not need
> the entire framework provided by the PAS driver for IPQ WCSS.

But you are using qcom_mdt_load() in wcss_sec_load(), which internally will
call pas_init and memset SMCs.

> 
> Also, feedback from Bjorn in [1] was to have separate driver
> instead of overloading existing WCSS driver.

That's a very old thread, 5 years is a long time. We can still revisit why
you need a separate driver. If you already have all the stuff required to
be a PAS driver, why not use that?

> 
> [1] https://lore.kernel.org/all/YFK1VpP74rQH2Z72@builder.lan/
>

-Mukesh
