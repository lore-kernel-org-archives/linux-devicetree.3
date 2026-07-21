Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5812D432BD8
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784618031; cv=none; b=T6SkfXKeIbBYOm267XR0O27cQsPSptBRYCJwZUuwLoTCdrmATK9NYmfqfst5OPwx8VGXJkpO1q9TGjwp3o6Hc8ZODknlRFyThl1+toFBugp7ieKCcTO++SP0abBFidPeOESDi/mIbXw7xDrqAbNi0GvKqFLygkCd+KxUkyyToFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784618031; c=relaxed/simple;
	bh=8dWOdosvHKLasQAClEDlKcz44n6sFg5XGD5Z2XjO3QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFzRva7gO2nK6XVqu1u/uAtUf6qu0JkIOAJ+iq7u9wgtbJsJSgQ8+oNP0roVEXldIFASmbPcWLW6ejnifal99L9ZI9QVeOBIk0qr0qfCd8vzSM0s/3V/z0RDdnQFw9BcFvQSgRkqYUvG1DTil2kmpzBeThyheeJ5DRUtCIhVyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0ByNzyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6X13C3S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0ByNzyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6X13C3S"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L2nADT043236
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0D3MRA4/yCGupOnzbC9cyTj2BB2vCGBPfFPsgDuTflY=; b=D0ByNzyixyygHLHT
	rm8eJFZrBj33FB3MgAXFJv1HGu1BSiRnZ1nzWRUtiSazI6S4fxWE/+PWyPeV3SUY
	MbwLv2Q9HCD60/ZTvaqZUuT/gfrmwGrwnE7tLLXnFF6VjDXJqEAosFeYTce+/XLc
	MmQ2joiT+d9yioMWoyiW7rOc6H2niq5Ju657YxodS97ltJf98BUn8QO2q/t0gBTU
	2T42Rqu5a2vOty6lQt6S2u5ZW4T9H2IoOKgWj3rGZ7Hhqcy/VKF9rtd1QMBoPF4E
	9FIrJhK8A9cK6OfjU95xEEZhc4BBILiH5HRw/DTl2vby3zmN/pOT/XnOfVf4mwnz
	AuifJQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as10s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:13:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc5faecf01so217589155ad.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784618029; x=1785222829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0D3MRA4/yCGupOnzbC9cyTj2BB2vCGBPfFPsgDuTflY=;
        b=A6X13C3S1JK+EpByKjUTyrs1DOlpet08bT+v7nf0VlfBte6OYyFNoWZ6MYKlvoVaWR
         9H4IQYLKd27YJcYxCGPNpWYNu0G+ODDDgSVRMFvzxxlLe6iKBVl8ohZpfLtm2CgNlsq5
         sy4QX9R1ktk9MSv9M9o8qcL0o78tuIj8yw1zHhlVYuLjEkbCzdZEpFiWe6wSAl1hs4r3
         vzegwPjbfWF4P/aJ9SJK17BgR2jK3DkGPd6y3DvgjgPMZsvWHWzrfdi0w4KfFbp0Ed45
         OwVz4YWWMOryDIc0WRXWVbVoQjg1IP5t7uJUeobQrNP/sGpFrnZsGjb1Aa3OeuJP/WVQ
         mmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784618029; x=1785222829;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0D3MRA4/yCGupOnzbC9cyTj2BB2vCGBPfFPsgDuTflY=;
        b=UdDcf6NvvgKROjfsOqjzGMWwJLL800y8Xto3iBf4N8DZtYpP9n+jokJFSQDzuYmsLG
         xgvgu7RFi/qUt+KAlwLnzUaPVvhawrS2ZeIVuIUKKzq4g4nehLiydqDzPwFDfo685zS4
         JDw0nv7c3hK+LwupjOLFGSiAIYLb8iGQjB78tEnaLtSigSZm0hUlLZ97Qw2iY4jYIrcW
         cOskEu/JN7swKjJ+hC/qFDNL5q+FDdyn/V51mADep26Iicbxs3IkYeKLMCXYUlxv4gcg
         Vtd2BM2oXGwAy2hBOo4JGxuVm7fZ2xp/UKv2y4HXDCbDZTkxZEHLWzf8KhcF+nj9Uano
         700g==
X-Forwarded-Encrypted: i=1; AHgh+RrwOonxZh7rR0E/tBfESRbEQortz4/5MGFofRP5doWBWyOlLoOSBp3jzhgqVJJ4uGHk31e+4Q4/zIPV@vger.kernel.org
X-Gm-Message-State: AOJu0YwmEnvZuyCBtOnMlcf8gCIPwl5nAXKqGWCavEZfBgBuGXfpjabu
	70jAiTd6PSqQiwJmERR4yKgm2fxiLllfb9mkNy3taFI8wcHRy4R7gQMPXynLKgC2fm2KphJwpl0
	j5NCDJtUIsE5xXKLzR9kcb3wE7Fk4CF6FFydkOcftWm6jcLxJa0NnFU6l8dViNJSN
X-Gm-Gg: AR+sD111RnbvaBu9EC29ePpB0nmS3g0S7TIT1NTfPJIdF/Ge1g4kdU54EzWVOS2WZnw
	P15xyxmp9omMqjunUa16iIorU8OEFN13mWUQcMTdUqOJoPwEA59CcqF49kNsXqXzvr6A1svxBi9
	q15dhibyYCnU8q7JFk2/dvGBAUsqnT9TpJqwo3FUcfdDwk94rKmSjdGl60Y3xOn/PRRn5FFRhVa
	6XXkwUhOewjm717AAsLZfk8jVquYRXjU6Qh194OhGNifhwMzW2ZW5FZpkyDcNCCs0FuzbK44Nsj
	z+B/Hl0ClQhLBfo2T9VFAmzxa2DdOtGm3ONAaeCI4eyLYDxRN9hdzfE1LQypFiWyJPVZNoviXXo
	2tmghMxU0xzMb1vJ070zx1pOGNIMpSS8=
X-Received: by 2002:a17:903:2ec5:b0:2ca:d91e:bfb4 with SMTP id d9443c01a7336-2cf349609admr208058495ad.24.1784618029022;
        Tue, 21 Jul 2026 00:13:49 -0700 (PDT)
X-Received: by 2002:a17:903:2ec5:b0:2ca:d91e:bfb4 with SMTP id d9443c01a7336-2cf349609admr208058215ad.24.1784618028532;
        Tue, 21 Jul 2026 00:13:48 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346d9bd5sm70713285ad.45.2026.07.21.00.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 00:13:47 -0700 (PDT)
Message-ID: <f5b538dd-b350-4eb3-a300-78a02d5e4f1e@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:43:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] Enable sdhc inline crypto engine for kodiak and
 monaco
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3NCBTYWx0ZWRfX9ocvCRA0VUAR
 LRzXkjM69UqnVhLvBmeRrjzmuJ5WJL8hv9ebh+rad7VyKk5rW0oNtq7k+E3oVxPTNvDlsR7NUYa
 MAiXDuapSn7HmUJAqzvVl3bPKDT9KM9H914/GOXDVlETNq0hNo8t78l9CJ010/2MbJnCXsOpJKV
 068n5rAxp7rAcYHdPmTThgSI7wZcjEXCFmgW2r1I9Eh0SQiq9S3g7xj51t57d702sF2u7p4co84
 1YaoapLIhfX3GIzxDa5cGIyizuq/IF8F50dCZLLghipNvXulvSC6mK6Llev+eKj5RjYQMbHluQj
 w6apA/qTnGQsWQz/MDiQc7JvQyTWEOuB9wFm1iszVVWdJp8GrqB0KsPyCPBNDrjt7ADyn95kCXl
 mFqqDveZQtIfZx8FCSPf7/2jDQ6Y3EuWAX2uzE9RSMjYl7JtekEBs8kFYm0petxY8RIqJ6JFVIw
 hUPJWxzZO+16Af76TCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3NCBTYWx0ZWRfX1DiSUjthFH6M
 6kEy7Hsif2fMUBkvDpCyNGgS0EhHNbSLuw2Io9EfjwTunwVZ1lKrnoi7YNp1fOocqNlQ1DMcRoC
 ovOwQmibMNewZC8r5SBdPpovIV18FI0=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f1c2d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d4n2MIuDCtTFDTNuvswA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Ax5g5Iyluk6aYGFs777pbPgi0UrqoTsM
X-Proofpoint-ORIG-GUID: Ax5g5Iyluk6aYGFs777pbPgi0UrqoTsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210074

On 07-07-2026 12:41, Kuldeep Singh wrote:
> The series is combination of below 2 series sent in past. Since, both
> need to be picked together, combine them and send as one series.
> - https://lore.kernel.org/lkml/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/
> - https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/
> 
> Document and wire the SDHCI to ICE relationship on Qualcomm platforms
> where ICE is modelled as a dedicated DT node.
> 
> This series:
> - adds the qcom,ice phandle to the SDHCI binding and enforces the
>   qcom,ice vs embedded-reg modelling rule,
> - enables ICE for kodiak and monaco by wiring SDHC to the dedicated ICE
>   node,
> - adds interface clock and power-domain requirements for the ICE node in
>   affected DTS files.

Konrad/Bjorn, could you please review and let me know for any comments.

-- 
Regards
Kuldeep

