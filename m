Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EAC34EF07
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021509; cv=none; b=QYSVfc0A4h6vY4qmblP4UwQajIDEM60t0EFcu4Rsn9iAIWebeEodxdMG5LjeEaDtF+XGLMafeoTrmzQiD4aTO0rrDzV+CEjyIogZ0Oc4MTMb8hystiidDSNvicvnCmmIlOmvqMi/niFa+wbaVz/Z643IHH1r63nPIJ3fzR3J0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021509; c=relaxed/simple;
	bh=uul3wRiEmOsR00PyiUibdnoLoMPLoMMy8WVr0lwTQzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9Iy7DQbkv4X/JNjjBcDYVFDVPJT9lNekYtAQV+N+l9ewxk0XOL3bzE5GK2hG769KQtvNt7lLXsXPpeCTFN+YZITude7/Q6Qpsu0gwb94RXv27Tc0f2fIf8z7W21J1BCA9rEFM0/or/AG1y6smXfv0mVBRgibV8FEuE9shX8RKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeMksnO7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdeC5f0t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeMksnO7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdeC5f0t"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7GCvK1823216
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	01nAsS5A/2O79FKPHOY8FeK/BGeqy20Vd6X3Fcjfps4=; b=JeMksnO79EeE3YYg
	7JmZ1piWnXfV1Acs2UWl0fggmcrRG/WHZHc1bXKsZS1wOqvzYra6u7hyL4OmOIoe
	ViSoHbFD8DGmj/o/CXP8cNb4eWnHCkCP62zXJGRg9Et5aEghxs7c5/IB9hZ6IQtr
	TXRSBDi7NphBL+3+1jd8MPAiC6XlfXvDyEurlFbPDJgnBbzh498Sgk3JRyVPrme/
	icpCBvFVjJ9OCFOQJnXG6R5dkqp6TDuyrBRoZLmbp4ZQbZ4KL7mTbWnc4AMgV6Na
	q4KW5rm5ifq8RC3M0ECmMxuAf9j2fzoeGSNZ5VoLBZOXoTwQbab6YlfXoLwdfDT/
	EhQwxw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rt2k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:05:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so21093896d6.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777021507; x=1777626307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=01nAsS5A/2O79FKPHOY8FeK/BGeqy20Vd6X3Fcjfps4=;
        b=OdeC5f0tMNyg8gmAQ9pcqwE68yLftTBrx63ua/j+p0e+t3jE0w9me5Jr+ayoLTlWub
         E4eCERxr1NQF2F/wcVNwdcMieHfF0fn+BOHOvZZWmO5zMrOpWfGhTVDFQJu9VwL5ycMe
         Tr8/W4gXmCK9eYa1vx1E+ZvvG3wKSSqQgL2pQ1QRbmQbRyul2nKFUNHPP+XiHyS2KVwP
         2lH4je99rUTkUgnZ4bnCQfvOZvfNfPteJamVQ0+cx+4GdHN2sQsvfzHmrFkPWwIJIWi/
         Mde3r9Phye7GECE2uVe3X5APKLOmc0uoBj3TNKz0DyAZw2MQ5+nAIJQnnY//nGRafd70
         WDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021507; x=1777626307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01nAsS5A/2O79FKPHOY8FeK/BGeqy20Vd6X3Fcjfps4=;
        b=Fk380ZN7ic+g1EkhU6EABxkRw1hAHmQKPXugjgR14du/aw3ZI2WdJSjrvbexLJEiJq
         cPuiOh/vo2TP7k+vGY0t4jyWyXfoV9YnQyJ2tdxsljkkQXixytCwjt3GioRRjIsHb+ty
         qRV0lz+Z3fBw4DnDNbOQ5/rmgQtH2D+AwYoFe3bPSfLXxyJWAxXktO5hWlyHmEmTt5NK
         bFHqSgcQ7TFxVuJekAxS6HLfWm2p6RyJTYHYI0HhlCAgLMJn0g3VuWWy3roHj5zrdAyK
         g4beuUay6jU7GBCs2KoEpT9PK6PoeJvfFMLkK5TugOvRRB3PolRfU0VXoJj3Ycjj61h2
         Q4Xw==
X-Forwarded-Encrypted: i=1; AFNElJ/QPTWdhjmcQFnUmcgVzdxXHBVbqwPpWDrG+hMeIKVi/tnqbOx/EXtfmhAkptT/1YjsIgFrxBdFuFin@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNITFqBbZ6W4pW4YpscB0OTgzC/Efo3bUGNlM44cPWRzVwI6h
	wtcfrLzoiEzQj+7gEvS9XkDsdZhAA41BwANhLLGuxHyWMbKJIpAmHRVrC/TzjbquHORO+VKtBtl
	0reIT90vFhSgV9GIKo/h/ps9vAEIDWrJ0y7YWXlDTC3kPdZLrNuJi2xKoRi5Es+Ws
X-Gm-Gg: AeBDiesqdL6nOLNHUPaN8Mh0TZgfy/OSUCdkWJVadgRYCAmWdgmgLR4eiCXZZHcgmcW
	6OjS9v3yQrszdyzI7ZngEXSl+0VsecXQejLzvMZeLw4hR2buNLdHiWIq2m4du4pehEyBP43zVZZ
	5Bfsu6f+K0F7PYsuBhh22eVa6L/xvn38NkF33g/sz0HFVgDkSFJWU8j5vAcYq1quUR3TmZye2mh
	CCBxaqCVcBwFrKyt3NzuKShMj9XS9iRDhG5Y85LzrlcSAR6shIFi6wGmDiPBbPMdhZq6cpjv3c3
	dcA/k/58rA/eF7JGutcyewMQJ0GhPH+oHr8pmyZqipFIkFzmRkBZITGEAE/HdoASvDX98D+P8NF
	BlIxYWtmbwIuZ1h2y2tgBYN2/8YT/Q8SWOwnuK5fIo6nvvej1VoCgVvNod0sBYr+USQ1iREVXMh
	hz44Aeq4vXpBLqJA==
X-Received: by 2002:ad4:4eab:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8b028181327mr340259986d6.7.1777021506982;
        Fri, 24 Apr 2026 02:05:06 -0700 (PDT)
X-Received: by 2002:ad4:4eab:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8b028181327mr340259646d6.7.1777021506586;
        Fri, 24 Apr 2026 02:05:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba44e5749d9sm766040566b.0.2026.04.24.02.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:05:05 -0700 (PDT)
Message-ID: <d1234f98-95c7-473a-b9ff-aca4a9f9a9ff@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:05:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add TRNG node
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb3244 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VQnp4Hrt9dpzAY_ZiikA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: y1O2pmp0NhXVUrlSHsCbTLhvsvIA3bzc
X-Proofpoint-GUID: y1O2pmp0NhXVUrlSHsCbTLhvsvIA3bzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA4MyBTYWx0ZWRfXwMaMhP5f2cC8
 ZE00v6BFqhb5/jvjmmbfn2fT6K0C2Hb0K7yc2zYbdv6HToj8ztpUcuX5wNM6sEr/pdVbSgxv5om
 tCdKT/4en++zKH3UNROfeiwFYJg+64yBdB7RVahCg3Jz3/NgndRkjNhclRlr3AW61cWCK9IzjIu
 lzYDKe2BowKLMSR4o/w4/mXELCpjdr6D/1h/aF4XJ/AG2MDoemfrzaBn8oeW1FO2lk5HT/auc5h
 lWD+LIwwjNkepX3KTNHVFCeUaZHJcLr6Z4LfiA/3g9IOGKSFKQOp9uBxdeUrOtlxntAX0Oh7oZT
 7ywQFS6pjPnLIP43wzLJSYik8PSp6SnhWoaZZtBF0g2EaD9BQhi/BMLQncO80XszUkD+8rvjLTw
 DGPDB4KqIkcoR4vaayigy3+JuDb2jT+YuMwJ9zX1uP49E2GWRhEWF2CgxSeivLlmyV9KPIgBmra
 c858DxsJonuYPzeMZwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240083

On 4/23/26 3:25 PM, Kuldeep Singh wrote:
> Add the kaanpali nodes for the True Random Number Generator (TRNG).
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
