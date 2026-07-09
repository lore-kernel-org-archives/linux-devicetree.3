Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2C240B371
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593913; cv=none; b=hxWlrd9hkTB8ASEofAIymgDfVyHIn/lUYrNwUGBQ4Ip3Xs6y8MACaNK1JnKJF+9vHsR+bQrLAOKVVe01EXP0MNbUahx4E+lOh9uJmTswWgBMZyvDuWICgPjmhhK2jYDCS2rV6buG20rgXz1lnGE0jamSDYzn3Y6XylmRc3rl0i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593913; c=relaxed/simple;
	bh=QD3manX5WJLWHwklT44Bd7vdgJYfsMpFHVdu5gZjIIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M7jTYxa77w4mVKJEN2YiT1Q2HCd2NXigJRD3C3hEiF3CgixSRWMmCxMM4FDooLBYwlfK+CKqsWJwbPYW3yaawGBxwJNSuO9frKpJilfwiQg3DFWqoVKftJk3bZfNgyKAbxizSXH2Iy6konXGBTg8KfYMya9eGEIJFci4wESWWwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYS7QpqN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeneMEE6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYS7QpqN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeneMEE6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AhrA01579424
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 10:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TukoVQ0gaDRj7ld7E34mbrss1dmlhmyy144jGx/Q9fc=; b=SYS7QpqNi0NA1j7q
	9icx9AKADrt8J+HVynauUN4NPfaAvw6XreQSsGDrx3StTaPlQaRUQLUhzMkHICzn
	nja7mE1etjXlot8x+lpWTmxBkRsV+ENUVFFNBXQRwOkXvQdGLgb3UFeH/khMB+Ue
	G6yTQSVBHQuTi8E7SIHjILpIQdSg0YJCn8gLGogaCGPTMKHRl2UnDxzN4aAE10T/
	i+87tdF6gX6MHyfFA9VQUceGWF8r0t+AlKi+kSPqnmqy5skc9NnSNEXuAqaOCmk7
	ynYaymiz22+PWRJvQjQ6FD0gg1SE3CyH9+I6G/hsH1x6NM2ecR3gUe8EnE2kF4cD
	ivamhg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418hnan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:45:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e21552dso33434485a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783593906; x=1784198706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TukoVQ0gaDRj7ld7E34mbrss1dmlhmyy144jGx/Q9fc=;
        b=WeneMEE6z2DlNxYeGWMRBQcygnOzgc4JXcCIhNemYy0c5ykymDNPvHm79tOAcx2iGY
         A4vGV9g88HSPh1mDhMpN31x4ISaVIBVXAXJMKJWz5nwrkQxgBB14QC1ejz9sqG5CtbFE
         ZBWuxbrgZ/UtDIDzpDqEtuiEa4lfsinrysDw1Vab8FJ+OH8Xg+c+0Mn/V9bv+nU2e1YY
         VnRDHrCCAu3cc/EwQULoHYncyx4WPWaRq+NrknuqnSMJ6iLeIPqwsSnCOdm08RQG4vNT
         AdVw4h4yjzOlFd3sB102cV7aYLkTAFbtZMh5hzkEblrID0VIho3I7zIm/WqkqEM3Xs4J
         6lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593906; x=1784198706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TukoVQ0gaDRj7ld7E34mbrss1dmlhmyy144jGx/Q9fc=;
        b=mYD5rVSN6Ke3WRJXVY/UbYiQ0Luu8/2hTEmPrPmA3Arig77v8L6aybDxJNV9GYg9Ub
         RbiVhv/MlxmCppaE89YoF5VXtmAYAWCzkKa0dCgBGfC/KUrpipaSglUqD1dPdjhfiP3F
         Qsrk5PX4Kk68jDxYY4BMuPMz6QUz+WKg44/XzLVQ0C/hhoHce3nZf3lzra0sKbWanWrM
         +pyV9v5xpBsEUpcOiXRS0gqvihLlE/Hcg1yLiaG1VrvAvKu7UiXVi6ZYLPH9gxo+QPM3
         grzB3PnGCDfmHRg9vI5R8O9antbo0sdx6WmeHUKK6EaoAswBJClB35mbBXdV6Gz+s/UH
         /faQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9UfuW8zevfqjGmC96jXpDLgRGZAkudr08are23xvK9aZS99wdFIrhtYAGxPRtbnoYLo1jlDKp6Ndz@vger.kernel.org
X-Gm-Message-State: AOJu0YyYCzH+klaWGQzzVz/R1ddeq6aXAdY/IIB8k/BDt65WHBWEiGMA
	+GFVXroTHL5Cj0u5U14n/GKoX4XhVNfN4jCNfEw+aady4GRfZDNSk60/1lqVfSUKgshcI1jkzXN
	+DJ6QdY5wvfmg8C+4W2gPbFMrgb+5Sx/NKBC4lS4ZdMF3wc3v5kpXRsHTXX0hdW7B
X-Gm-Gg: AfdE7cmodz48jGXBMLsyoFiCI+hcJllui6aVxE7nf7YKLsU4fBodfyNeWVNOg46qomZ
	zNrX5fBPbXcHIw2SeDf5WYRk+fb1u4k8PMbmgIFQ3Lx8KHy5VvLA8Tij6REHcTSCMVd6oII8PKH
	0QI7IRHAtisTIYuXuqLm/7JOdNTt5TuAw5qncwj0pzqQS+/63F0/mG1dIFs2OFV65SLsaXJY0rt
	JpCy0jEVAX+mwVFHSjY8iqc+ehpZgIGvmuT776XO8Q4r1NMyS2o3yJ97yuUkeByXAbroiFSYvkp
	q/udkDcEazXcN64l7Jg/f5R7IB/LjvXJ7un6m4VdDfxGwmOjSRaCN4jFfQE88N9WpLVu7C8lGKg
	DTC1VtFcXCBaO9yDqgo/iLx4FfAA8E80D50M=
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr276071985a.0.1783593906114;
        Thu, 09 Jul 2026 03:45:06 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr276067685a.0.1783593905690;
        Thu, 09 Jul 2026 03:45:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada05d72sm465024266b.53.2026.07.09.03.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:45:04 -0700 (PDT)
Message-ID: <89a2537b-ed04-4444-aa1d-698b0f998fc8@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:45:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: common: Register reset controller only
 when resets are present
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f7bb3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMyBTYWx0ZWRfXwTwNPb6mYzGO
 3raw2cdJ7wOlE7IApEJrAsGbCDerk9OYzFSlRT3QD/KCnE2VRQVa2nMwwvBH92r3XZpqe+4jKOS
 DnKG5gNw+vMG1QwPJM8cVZpyqBUDbKHbBXVpqPzfgf3fQFEU25TRNFayHGOZHqwkcD1UvI6YpbG
 CY+DQu0trIgMxBX7xPYCY0JHTYAJcW5/fBCRpMCqzGaCenCxGvxWcef951jzSc40cvU+FeCziuz
 5n89VKkhhiOnRjosEDm0loFwJwCViSWjo1RawP+cWw016undI4VR4PDogOON8HIlU12byb8bkL0
 fc4OoNTKF9s5kSSy6O8xryvGV87FYmIW8LMoxH+D4A6Te3ZuxPGGd8Gql6DLhFI34GENyWlA5De
 K+KTsJAA8Fqbd8opU8ysO8SIWXgOXJp22vTNGXM015FFhHUvduy6si/4PJv5K1Jzkil7CSl/406
 MI1ZriykHWsduAkghrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMyBTYWx0ZWRfXyAEsP/qsWSUv
 va09Z08pDSQP83GMlO1FgGdYAPoCUFS160IKlXAitA6a+HJ/v4smbAhFRNGNLgIfHujt6YmJkph
 aMRdJjwhOE3AmIZRAAb6bBky10OiutU=
X-Proofpoint-GUID: OKxvmqK1l_V94zlcRuJOzJHZNdFRN3Gh
X-Proofpoint-ORIG-GUID: OKxvmqK1l_V94zlcRuJOzJHZNdFRN3Gh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090103

On 7/8/26 8:25 PM, Imran Shaik wrote:
> Some clock controller descriptors do not define resets. Avoid registering
> a reset controller in such cases by checking desc->num_resets.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
