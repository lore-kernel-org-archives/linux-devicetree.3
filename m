Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA0A393DF5
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080552; cv=none; b=NnEfPCEw7MIiJipoh2ctG8YywjzKA42/VZu2ZhyPj/92F4CQwPPZqO5XHeTg52YLBA/6OVnJ41X+H+Yl2kv7i6x6r3w/YaGuV0e5E1uOnqJQ+ZuvgMHSxpblc+y361oax6qZ+T1axIeMbcA09C0mQ42W+K198U+SL6/ZVqCHZb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080552; c=relaxed/simple;
	bh=RhXRCgMNScIf77wnkS151xUmWJL1ppbZupG/e8th0Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2943Nx3cz26Q088Vq1PFGCHSBbgQlZtxYn5vo7xevt2/QzpBIJ3mMYxxBj4k1oYA4EBxzxVDHhUK32vW3Ez/N10Bb/ubvztI3waYEIINIrNx1c4EkcpfEh/TIj88us7NWOAOpGGpZTJYmhW1Ee4Je2rTqjm7P0cIwcZ3s0v3DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/VwO3gu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a76mmv1j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/VwO3gu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a76mmv1j"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646BU1Bi2581484
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 15:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/4qDhc3xqA5oi78owxsgPypqoMvOhzYxv2FjuGz/0A=; b=n/VwO3guoR+gbKM1
	vb0fnDr6mJk5eh7Iu4Pb2rehc1/6B0SVyZwPzmokdVjmrT8XUkkGo1LD2LUHZ04Q
	tG22UnrMqoEzNOZApoH3mapGqv5Hwee9CyqQpytgakTfwbG0E+whoET0gqlMKs3s
	mO4SRSIPPrKdkw7EbeZRx3Ux744J6zKBgWNIqNq1/QTcrvDfBQ8+NCukHkeiGaIT
	kTCgHg/Gxc0+jtAASUiSJaDqXNiCYxQTu1P8B6VDmSyD/TRPbwHzl5OjVx1oSLlr
	dLOwLeqlm3Wa3ldEbRcqqdmHu5amea0mG1rREAEc3q+ePIZY7VH0yw+/+5839/Md
	Oly30Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyyvw26km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 15:15:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so963278a91.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778080548; x=1778685348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/4qDhc3xqA5oi78owxsgPypqoMvOhzYxv2FjuGz/0A=;
        b=a76mmv1jqYRv5tEMLtRZgwP+sEyFnT7uag5eD3+TVweFMbOY0KF+rsNiRNHpBrJdqS
         0gpwXmiqj+M0RZqMTbsQYILISJxR4cgkZw+t7bQ8tn2Ys34RtklFZhu2dDEzLKaetXnh
         9OZ4+EtlRQekqgbNVJ1Wb3SXTaGmbWo+O9RGpRZ+95Ti7ZeqpAIePL0cqA7ZGHnjRN7r
         INehhDIqrWhIOE1pjnUZSusm06H1U7Ew9ATFpm1CBucCqkPwGWK+7v/10JOl2aNNK0wx
         5cOIqqUsHsG051Bl+/JvufEKcjAVu6TM6w1zfEw2ocwXdFRnrqrwY7wfufeXMMPO2d6n
         3qNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080548; x=1778685348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/4qDhc3xqA5oi78owxsgPypqoMvOhzYxv2FjuGz/0A=;
        b=bIQQtJw3u0De3YkmaoeuDAJCdg0PzF9GCUkbvRnTIFa90J+bSXfAXyQOcjoNeLwtg1
         hpGcNbqfMmT0pqnT7lUZClq9O8XF1+3iZsBNaZmGwc56452rk2dlfDG7iSS1lNap15dW
         k+m49eX6y/YmbVHAkt8aPaqWowaMiUJKXczEK+mwygobWBAX0OU1ekpHMgvmkhPDq6IU
         oA5hF/2yR2YkWD1Z7oFUyj5w88wjqfwlucPNlkGyXg6Klm4tgbD1EVNnhqdEo6M5hPCa
         amX3e3L7zhDYhgf2sx7zzTn4rjqUwdRPUZu02lQnZdfkX3H4DcvO644o/Diy0XjCz8dm
         UcqA==
X-Forwarded-Encrypted: i=1; AFNElJ/PcXJPAk4BuuW8xSvszf5vTNDetHjyBlKAQ8dcokmmONutOjanbhIBNJQVejuPeuv3FYKcDWGa8UjJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8/ghqZluYKCDAwq++defvi9sQxzJcS+CrEd/gEl5zThO6tWj9
	8eo3/jVsml9xIU0oxyngZJB8j3v3T2ngqnmcVp4QxZRPZq7GfRDQPHkyKZRoGGxUbM17KZKPJdS
	lu4DLtvtCiArSjd/hSd5Y/Py/77zChLbCSvTK3ySG1Bz7lOSzpAMPqtBMqYa4TFW5
X-Gm-Gg: AeBDiev+37oLorJ+Ksx4wNtjH+yxbzudTNt/sCDlwVhIEsrGjQApu7QAUrEIEJcyfXf
	kLJHmFAgUuyplWmlf2kamv2HeeceaITNP46tw+GjjiydHibvZUAQIDJCIDIuwws5PSoXoNT6559
	wpOJmVfKQ8IuYjaFfo0jjjEiMQV2kduq2Q/UF5+3tE10BPf3qP5ADwAFrrFOY2UoH9qaO52Izju
	lA8ofHkvka7qB39e1ED2/TjGcQimLLXJKZxvi6OA54SUXbk/OykdsHh5nxXf3h0SnqTyX43zhAD
	68u0AFUpT+vqQLasi82hcH92GyXJg+Lf5c3jkqCz4IDFjuVy3H9houV9ft8VEfebanu2BftTtqm
	JFvyR4/x5NfLBOgCueWRb616ztIOsQ5kHFbR9PtvRmjN3Jk+88GQyBw6uyeXn556q
X-Received: by 2002:a17:90a:e7d1:b0:35f:bc9f:e1b6 with SMTP id 98e67ed59e1d1-365a96b6eb6mr2734381a91.1.1778080547448;
        Wed, 06 May 2026 08:15:47 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d1:b0:35f:bc9f:e1b6 with SMTP id 98e67ed59e1d1-365a96b6eb6mr2734310a91.1.1778080546676;
        Wed, 06 May 2026 08:15:46 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4f70e8asm4011790a91.11.2026.05.06.08.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:15:46 -0700 (PDT)
Message-ID: <734e8ad0-54e0-4fcd-a3b4-8e99fb521ea1@oss.qualcomm.com>
Date: Wed, 6 May 2026 20:45:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] media: iris: Add power sequence for Glymur
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-10-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-10-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYCNIQRf c=1 sm=1 tr=0 ts=69fb5b24 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4ZKAssT4AknkAVwkBooA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1MCBTYWx0ZWRfXy3qPfnU7AXop
 GkWfXQRUGlu7CZZrw6DN5AfvxkgCp3J+4KicNXjPXSOe0TuFK0drmZ7K//yjnQ0+J3ilv9ZKd/k
 n/dETLtruZZt4by5Zuhrn8S55XZiHQLZwsd0ZaeBz+U4RnAYEQj0iK5u+RN8uh0lf5i3FWqDNnu
 Of1KFmRQCZE8KaTW74Qo4MimCbO+Wgx1lYeeMzaNe9Bxq9+8z/FyO+orlVjgdWUp0mv1JOUl6Np
 ZVEU4dll+FOIwfIVw/b2SUfqAKYoExzTIwMHHf89hg/mmFQL8kJFuxLklNqWhxY91SO1Zl+1g2S
 sOFiU03q9I3fWTiu2a8pzB5hpV9N4BfQiecZ/is8h/cok/HGfrLCPjEm2zp09m2+nsa5JRp8v7w
 VuImK8GB3SWP0jOsu3E2DgDasSxuj/WFRUBwbPJk9DAwunC0Pe5OwlkqF7itdBGSk05M3ZPm1YX
 8RuDs4Tx0blf6JM7POA==
X-Proofpoint-ORIG-GUID: 55YyRmnkPffG9WFCDkWDxDVaYgMcjd6k
X-Proofpoint-GUID: 55YyRmnkPffG9WFCDkWDxDVaYgMcjd6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060150



On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> Glymur has a secondary video codec core (vcodec1), equivalent to the
> primary core (vcodec0), but with independent power domains, clocks,
> and reset lines. Reuse the existing code wherever possible and add
> power sequence for vcodec1.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |   4 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 137 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>   .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
>   4 files changed, 149 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 7d59e6364e9d..8995136ad29e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -61,6 +61,9 @@ enum platform_clk_type {
>   	IRIS_VPP0_HW_CLK,
>   	IRIS_VPP1_HW_CLK,
>   	IRIS_APV_HW_CLK,
> +	IRIS_AXI_VCODEC1_CLK,
> +	IRIS_VCODEC1_CLK,
> +	IRIS_VCODEC1_FREERUN_CLK,
>   };
>   
>   struct platform_clk_data {
> @@ -210,6 +213,7 @@ enum platform_pm_domain_type {
>   	IRIS_VPP0_HW_POWER_DOMAIN,
>   	IRIS_VPP1_HW_POWER_DOMAIN,
>   	IRIS_APV_HW_POWER_DOMAIN,
> +	IRIS_VCODEC1_POWER_DOMAIN,
>   };
>   
>   struct platform_pd_data {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 13fbb21c2182..0d0a239f9feb 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -27,6 +27,16 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>   	return pwr_status ? false : true;
>   }
>   
> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
> +{
> +	u32 value, pwr_status;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> +	pwr_status = value & BIT(4);

define these bits position

#define VCODEC0_POWER_STATUS BIT(1)
#define VCODEC1_POWER_STATUS BIT(4)

with this,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
