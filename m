Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCB43A5426
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554880; cv=none; b=d3QY2rmCpon5JL0L9R+ja91bQkkmqkcLzyKUIihcBR/UQG60UfELqymG9tL7nt0k6KUsFPx35b9aYQ8cPLUez221K1H2+NBq9x7DEyzthklgoHS2J23O92bnzosmJfliJuLpK96fcFMoJNw/AFL0MYta+bpanzKLom4qYNsVkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554880; c=relaxed/simple;
	bh=93uIw0/MrYoNmOw9Ysz5g5mAxL7ROFJwLCr6FumrCOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qE6aKt/T/Ld1WmXq6vAIc0RCc9N84VfDvptSI9BngygCJ852fFjnz0Qo3wl529t8v5tg0438+Zf2hZTpTOSllQu6/xvtstW9gl+OG6hHchecjnc7CJ3lLOihczwCFh4cVYWiQ5qkC1iBcMP9wsmTiM1Z3qMnp+MkLgC4oIhgjdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSi9XMk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UookPONF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSi9XMk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UookPONF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376ckgx3402500
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 09:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aNdOLb1kVbddgmRukReC1NXMi8K6aXQSmUkxoMsRfU=; b=lSi9XMk4U+ExtEXO
	O+U7UmT1eN2IrsYIyuVml3b0hOv3YoFeigaMh2U07U30aUp7Yoys95At6KpA4m8p
	zfJxdIAf76bEQrtiBviVLNA3odlxjtUQK1oiBvs46lfSBoghUoa5E8GzF3tOO5TQ
	cOI4EvvIS9DO0YjBhVJSS3R/3R0JAIxgYeLb+MDEbwYzChxLC25jv6om9+fC50BI
	7rp1G7Haj3t149Otb+hXUn5G2LaBM8HYue0YwHUyy3NFoiPbSMHzI9Zl5GRv5w8f
	8TnkO9xZFakniqp4R3pbqrO6lGvjZL4QK7krF/GkdFqlBqru+b1+1eSSctWsDgbo
	N6iMPw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrht3bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:41:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f548d0872so16400766d6.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554877; x=1776159677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aNdOLb1kVbddgmRukReC1NXMi8K6aXQSmUkxoMsRfU=;
        b=UookPONF+w9HkxA4FZnMp3PbM+MIhRx45cgnDqUnU7W3VdhygWojEphk4Eoj9vBpB2
         nDDBFlzRu2Zet6i8LIMcuS/jAwYNyBEbZ9YNK2pX7wOHwBMQSQZqWLQEmh9e2Y0mUACF
         ssYwHwPFoKm14ipVroaRtNS4lsg+dYWcnrYIu29EWTD3CC9xvbFyML02pD8t2A94fPf3
         1bgiNmsB7MNKWzejBbdzpRJqNwq8rHQ3xq3p8nfUAiwSgSfQtDNecktL2fh6T2gaCl/d
         z7Db14yNMm/5gRhbc4YnyDDhzT9xYFOBauPptysRSL2v6W7MBSZn9OOrVvGtkCAoAjXr
         E0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554877; x=1776159677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aNdOLb1kVbddgmRukReC1NXMi8K6aXQSmUkxoMsRfU=;
        b=M58D1hKYmzn3mladOXv7zBkz9RA9eGtONl4odq+fAg+HJCZ6CUN1ue8Tro8cDzA46K
         /Gw+JpgpDWehAqo+y36jebh6tR5SnsMtQPJrvisl7txsGjZRhPCEboiqJsi8b5T7yM04
         KX0nrAkW0HuxgGuLwRaPgJNVt08cWnpEGjqZg96o4oyuobbszLNYAUhPk8CVfPH+2TV/
         WQPfoLR5+xCYZ5qm2QLYr/HJI3XH+f4G/4quEUwY1o08FvbVesS0TraLqNmbxTJ4pGTu
         o/kUWRDLj5YGQiq8Mu1Fz5AeqqnBirPe921offSJ/0uamPO8LlM9dEIZQPM4Y1yomDGF
         kuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCe9Mf87gYo9Mxa4EEaWUivg6pBmY8VHFhHnnCqAnylKY6EH5pwm7asS15B4gBcVzr6sL72t3DDG0I@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkkvfqvB8X0UMbP9JabJdb92rgf5AeJqcAqZtvDbF57qapThM
	jUKLH3iwpS+j5VU6hfAMLOP0AyX2qHuGWnq2BSwcOzUUd47p0W+BXvZfG85O1FDN0WmpO0gizh2
	Aaxw2jt8Gn99OSgUv+TLB4fylUZQ3BzIVkV7kA7stD033glaspNNuUA3QqD4JAGNc
X-Gm-Gg: AeBDietNsMcu2A66YynRWdHDyuhMW8edjKVQZe9Xefa9G37iOGQIGm9hKroLSP4b7SH
	/hi6lSt9ywnvuqz6yTFbgjkSRoCIZvIZgjcQv7pm2zPAsFrQODwaeby9u/6NhMzxxvm9c1oXAll
	YrxerU4tmdXyFDHTy3yHac86dzE2B3v/mcsd1n6G5kNS7V43OnYKV9iTrrRGmqKkNvLaBFwN5B9
	8bVkOma3BlF8jF8AQPjizv0dVInV4oId8SwUkboNQJs1h1CXaXdl6scQUHN0U8PUzcbDfI+rNAQ
	ccFF5A2pPbNg8SSbdP7rHYWkj5+vwDcP6s0dLi+Xsyri0e/nvPcWqvXedZcmDi/VSnOSX8bSgSp
	UeVqjregteNCtALWQId8iZqicaPSMhHh1Ai/TJQYnaucKhJgzs5XTZwV9jwWDkOvPs+P9cAJ0ri
	zvKEE=
X-Received: by 2002:a05:622a:5f05:b0:50d:9138:3322 with SMTP id d75a77b69052e-50d91383a55mr55395191cf.7.1775554877634;
        Tue, 07 Apr 2026 02:41:17 -0700 (PDT)
X-Received: by 2002:a05:622a:5f05:b0:50d:9138:3322 with SMTP id d75a77b69052e-50d91383a55mr55394931cf.7.1775554877176;
        Tue, 07 Apr 2026 02:41:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c31sm540646266b.37.2026.04.07.02.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:41:16 -0700 (PDT)
Message-ID: <63c62004-a6f7-455f-8dff-fc0139c00fb5@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:41:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm8650: Correct and complete DP
 address spaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-6-34f4024c65dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-6-34f4024c65dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OSBTYWx0ZWRfX/iJrJ05iRN1K
 d0gsdlAyNlXxF2WTxbmx3kkROSe0gEgZqjxo2gg9FJkoWvAM9dcpE488ry+A0QpDucWvCtaS5is
 qU9sSaN6bF+LpIvKuOHi41lsrmUvVYIeNKf0oMLglpNaT2tvHnDkLIvrVVHnPUwIzc7LpCK34Mn
 6n830bM1XOP41XSDawjKTzT7/HOZrm8MNdh5VrTgCPAYPqb6E9XNZdB1dth8qTEvAELNJzCDBoL
 8bORQwJELpdIJDkU9AP0Jhwp9vhSsETYRk9jSAID7H2G9aBiZ8wK5jdMcBTmzuJjzf8jwOCxIZp
 0Zd9lSiULNvdiA9e0A41LtAa720cy2cqFDV+0kPaxWg60/DDyxFThJpuHvefPTU91SSW0+U9jYH
 dlPWDA0GXpceSMDrX/qAk/5FIH5RRirb5+elzaDxISdcV4CZ3jyz+UtSgzaxlXCI6alJHN3lSz4
 CFlEEfEewi8S88pyBpA==
X-Proofpoint-GUID: gVOqO7kHIpg6sOzXL04q-1L7RO3uoq3d
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d4d13e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kR4CFCDnwyPe45QzH1wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: gVOqO7kHIpg6sOzXL04q-1L7RO3uoq3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070089

On 4/5/26 4:34 PM, Krzysztof Kozlowski wrote:
> DisplayPort block on Qualcomm SM8650 has few too short address space
> ranges and misses four more spaces.  Complete the hardware description,
> which in the future might be important for full feature support.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
