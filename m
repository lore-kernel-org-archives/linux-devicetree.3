Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ECA361DA9
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478157; cv=none; b=D7UZLUbF0jAeSPL0oUIHou6S6+msNlbWXu2lisId5+5s9gzNceLqkJI7QCfjxhJjqY8kJSpiy6IHsL/PU4uOad9cve5PvDTtY9Nz4mHlo0PSI6puUf9fWnCPO/iOUJn46C+hJOjgQWGek/9YrYiZ2eutH/29yzth/tH9z0vfwTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478157; c=relaxed/simple;
	bh=tvrYn5wX1UnORDJ7FWyP+7p9fMUkHJi6cXF4SbQKZ38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0Jc5LVX8VkSCFz8qfyd8nKxa3cv97DZ5DlDhozn4OUWkiSFqM58rDk1X7BLyySeoBdno3NsD1orSf+O5ppWnpJ0jqIeqgSdFZq8mdy38takQuRpUqp/nWDwELhxS2wea8nI6g0TPhKJEmxRipvgho/MKwb49wVPStyLhecd29A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIkislgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSha3qkk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIkislgW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSha3qkk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4v3aU3259388
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F4w8brG0L6gKtlFJJHYc8QCc452g7vG2q2FYJlGrt7U=; b=dIkislgW/YQBtUpm
	I2LX60GScJ9+66xqDJymVWCRKf4itp5fVPp1iFfsz9PMG10TNnkUTh0f2cL9koLa
	TPCqn1dqWpfiQmBP/DpaRotvDGyuykaN3FCarjR09jUdjBPDQVAlKBWqT71DC26M
	VrUW0HY6nkaOciatISZsQI8Cwt1Esk/ND1p3yv54S9TzxRZUyzhz5cncaebZw79u
	/1HvHQZxQwLQ0cFnx2Lb8rRFcj1CAsK9AR+M1GDStpVzy5ndcYfziSYG0TpBrOAf
	gxC7a7q7mmLTWxk2yvrQvUNnEGSbCcVIv/9lcWk78kcxHrGDPHR9aoeZi/8qsAZ7
	/+yr/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0b08es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:09:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e6d253330so662792a91.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478153; x=1786082953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F4w8brG0L6gKtlFJJHYc8QCc452g7vG2q2FYJlGrt7U=;
        b=eSha3qkkkg/WvXhl692HbClQVGEsjDz18QToVqg1Ej4GNegg4NO7OvYTHTwo1bj9yR
         a36/51GXtbVcGbOVw/Az6uNHWB3NZH1OFLzw7EJDwglFafbJ2Qq1Ui8dFlHMUK+AzBOz
         TjiMRDWaIY30DsPz+4vQ6VaGVOUIRWiV28fPLcJPKJGVQ3U/6h60j2hRpuN/UaAB+nE+
         CT2Uj9w3+vjyywdFuKQQYgPMVp2H/Y1pkv5sk4Ek1pX//yKA/i4Sa63cTC9hTKHSf+Al
         2zlvVllTlkWYbXlaXY8gR6vNQpsPLNIYoLVitpkwwxhzBpXI0LkYSL7VHztQocbEL6MK
         WkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478153; x=1786082953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4w8brG0L6gKtlFJJHYc8QCc452g7vG2q2FYJlGrt7U=;
        b=rQccNWXa/eBn727LRy20IMcqV2aoiO2MmtmFquDaXhQGOLp4ReaCOLKnk8VwWiEWux
         gG7I3crEvsLuoJP8QEzu09MU9iNVdI++s4nnwUQOQdlXxO7AoPQs5hpmQBgUD8Z2ha4l
         FwWjRKgNOHMWWc5D0ppyvl0vyuliDWZvxsz/n0weO5r6BKOZU7eq7tuRZkdqFc/4KeDV
         uK0fPaQWNkT+cf3MGPiFioS1C48IsOfJZSeyTSviRC1bLL7pGdr7HtY3VuZn6kNvv4tK
         oUKOj0wl5WJIgoR3W6UCCSzp8RHn6tDn9E4h0V24wJKfmVZQnbwqAft+lQmgCr3+2hs6
         P+7w==
X-Forwarded-Encrypted: i=1; AHgh+Rr/gMnKx+Ssjzr+uYgk1FjfBpqrdJ4oMaURQKlQKAED8k6PeEGjJMzM/spi/z9CtClID6hKcN04dY62@vger.kernel.org
X-Gm-Message-State: AOJu0YyAHO8n17Cv+919OqkF6kEl/ZEpoocnI3THtf3Nr9mLnrAMzBRv
	jeVCzlwrWYszbvAe2puj0KLA2eWXthz31gYRBDv9KoAgHj58RT1w6DfVti6HO8DofPYcOLTUSW6
	fqU1EqPojVvDiWMVjj6AiFxuMSHw1PFzCXWP7p6JaJe+lyHioGCtc2vCptY3zLazY
X-Gm-Gg: AR+sD12wt/Mr4BeIEokx96N5n9ELE8uGWmQyS/VurgZ/8bM0DeJ0jeG16vj5gu0OKq6
	cmzLf7XmkCiuYKZQoPPeq4WMwPxzLH/XJ97y+IiBU+zISAYSb3lOXvU8l80oWYg+YPiGXRSKu3X
	yFcFuVbXse4LT/cHKEaqrm+K3A3hrxpdx3LX4In23zq35aPTjgHyHul845OMzFIn6/GCJTJSUfF
	2naVLwyISU/WlY7PjJI8igUN/TToVkcssTcV3RV3wb6ObDM3BN33MS6u4l8niEy0wNST4MT1gYf
	crACCVNZqqkutGVjeNh6GYMv1mcNTC2WxvPd9+LDLAcT9fMusI0UyctaBoRlBp1M1pzKMg4+AUl
	SEkvZWgdTERj+kgzrAIIeLPRAsMuJQKWl3o9ILe0m1pxbhRmiW13PHToEoT9o+cRlRyRyVw==
X-Received: by 2002:a17:90b:2d87:b0:38e:7f22:f674 with SMTP id 98e67ed59e1d1-38fb2b7a1demr458740a91.11.1785478153007;
        Thu, 30 Jul 2026 23:09:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2d87:b0:38e:7f22:f674 with SMTP id 98e67ed59e1d1-38fb2b7a1demr458713a91.11.1785478152449;
        Thu, 30 Jul 2026 23:09:12 -0700 (PDT)
Received: from [10.133.33.15] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb29ca1f7sm225091a91.6.2026.07.30.23.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:09:12 -0700 (PDT)
Message-ID: <714d2d25-a37b-4529-8a21-74669af62b18@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:09:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] dt-bindings: mmc: sdhci-msm: Document the Maili
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>, krzk+dt@kernel.org,
        robh@kernel.org, ulfh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260720215645.1464901-1-nitin.rawat@oss.qualcomm.com>
 <92179b39-a6fb-4210-b41b-424f128c1b05@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <92179b39-a6fb-4210-b41b-424f128c1b05@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX8kbSN5PCjlwh
 nL39vbOnU7PbiF+rhNUDjLVe9lsivw2WqzByLO5Yxkx4sh5X8kX6mcmsWa2xamWk9ZFRGHrYc/0
 kr3Ii+npeomvETQ4ecnAnBbM3U8F298=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX7tXlNOoSE0Fi
 VFSGhzE0omQodZ2XJaXl814b8Cp/8KlFZGtpJ3WsKwYmR1HpTYJs0ldkBC2YZKnL4dH8b/gqccs
 fAoESM4PlJrg1kcgWdMQaRXHoeFy2Ff3V6DqUd5dIcVt6GgVRP24VK4prOd5Xs3MOBlX9Xz5K+S
 L8kD5vX0A/hPw326v5ntrsq2LcgMD/bLF3WetlKcMu4U8BkRXmfoMFscIx9zVD9iOuOA7mbEY2H
 C/w/9ylgcuYGisUjF/jlxMb9hUdAypomfAZk8z/a0yF+Z3yH7peRkDyl9o7GA30it3+zzZuop6S
 kd6RsVWIiZdWqWLHW0sMjFCnkGEr1uz3kCTYCrJcggkLuMLNvhej29B27o6Gih5lsWLNpEFt4Ga
 LmhyUANJgo6qGwrS4yt22NDfDU/YGB1EoiZpeEZ5tolSrMIp6IABWN7shk6kdDbw4H3FkNVRWZ0
 5ShM33TQkN82wG7peRg==
X-Proofpoint-GUID: wE3GmswIHtV_9EhkJqUj-TF8EsR8PI4A
X-Proofpoint-ORIG-GUID: wE3GmswIHtV_9EhkJqUj-TF8EsR8PI4A
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6c3c09 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wqKslviXCvpl4bgw-KgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310040



On 7/21/2026 4:39 PM, Krzysztof Kozlowski wrote:
> On 20/07/2026 23:56, Nitin Rawat wrote:
>> Document the compatible for SDHCI on Qualcomm Maili SoC.
>>
>> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> ---
> 
> 
> Please postpone posting anything from Maili, because there is no DTS
> available and previous Kaanapali, Glymur, Maili and Hawi postings
> without DTS came with easy to spot issues if DTS was available.
> Contributor did not spot them even though they had DTS internally. I
> cannot spot them, because DTS is not available to me easily.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof，

This patch has passed the dtb check on the Maili device tree.

Thanks,
Jingyi

