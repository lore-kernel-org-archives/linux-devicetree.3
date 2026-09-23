Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9DA5383E7
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174651; cv=none; b=gI4Igmdu/Bhd+JD5aDa8AtZ+eOG3W6p3p2lRrxad9vfwHbbWSWrBCH6hErM42iwN0/fSzNi/LIpP6yF7FtnK1mrABayNQK1uofvr+7lMzIxXjDs8vkj9t+NRposNhKH0QieHk26iDmitRVIBzRorDaeCHxBUFebIzV8K3JCxW8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174651; c=relaxed/simple;
	bh=T0AABt33CYW34VQbpJtUXdCWr7yi6lEHm/bFAU4TMOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWFzNb6jizjEKXPR0epq4LlTrsCaTG1brCGIMojPRb7rOKZjdwgztpcg4i3zQEHk0otkCIgsx8lqofIB1OqJNC1++NflYCe1E1AXZ96hHarD+YrMVycTzqAN+3V9CIPOjOS3+vPwdhkBkEi2QViGn78WNiMQ9PUxilyrKTTCUxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igjeEXj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yd73gZlT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igjeEXj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yd73gZlT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbaBA3772254
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7oNpOO3lBHD3Lw06XNfDeyesoHD/ioJv1keycQQjI5M=; b=igjeEXj0rpJeR6bO
	Z/+mUdpOYJ2wtX9mdo1x+FasmFa7THP9mj9mHXLrRoXMj8uphYIYu4R22RmW8BdD
	Xdeosr+ppFZe5pfcWd5jo7lowwD5p2RK3w6Nd23FC3QrA2u3TyTgpyi6j8L5qUFd
	TXKQ+ZXAlTJT8jGI0NRqhoggQynOQAH84Eatf3uydRh4pjQtB1G/73Wysx6De5e/
	16SDr7n9Jwk/feBp24WJIF9pJLfziAdUNl419GVV0z4lzNpaN0VqYB18xEF26Q1v
	PF5WBtYjzB/HlpX3p0C0SUjONDkKHf2szp2x+LNp53DJxBHRFSPxx/xAWRJ9JLrV
	Rv6usg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb60xga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:44:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78f4d6af128so314009137.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790174648; x=1790779448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oNpOO3lBHD3Lw06XNfDeyesoHD/ioJv1keycQQjI5M=;
        b=Yd73gZlTcH2chtnaTiwJHBSQbanrdekSTUFu+pZI986tgIngQUHVUWqa2ugoGIWpx8
         vUasFxvc6kkbTznWwxkgNQvidHm3VhjXmi+eXHwqnutyXOoL8oJiBtkrxIb+af1Hbjdx
         STIqRSCo9p08HefO+B8+b6CpOXJGUABb+njxnVaDULqW72e9U+c9zT42wxlSxQahL/EZ
         vAfC6UMGeUYp49KkW2fdFaX0bAufAuJ00uz7dR9yShLHPa7rRrI0x8fQjRsKHR2syUrT
         +e/QSpKhd2OcbcRMy9XLafMcHK7sl2GYt78TJCflJ4n65VOColNuF3BB/cFhmS61dczW
         4H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174648; x=1790779448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oNpOO3lBHD3Lw06XNfDeyesoHD/ioJv1keycQQjI5M=;
        b=N3KOS5nwSDIZaKsE3gSndD6PrOtheGNIcUOA2RxCNPMAF7rDhqJKx/yG0OvBAjyq8J
         sutabBeybm32XYszDzE5g+JyVeTBf8Cv9AEsBJvAQ8itanr1v7jDd/qHEmoxBZoEMs4o
         dZPqG/ECdxW7NuyacD4gygwOnjD7CTSR0ynXFIKr8gmolv+M8rUhcuj5BzeI33P21/iL
         38BJ3BcK6Ez+fcbgkgMpa0uJJH+bGPQDd3QXtQKhCCOGZUyEPN3joNkghNCpwUp6Lstt
         5qQ90zAZXr8Gp9HgEG1QHqBfEPgj5e3yd/XnnAaOwUKPjki2PbNzLw9VwO3V4yVXkPTw
         h09Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWigD1xze2jJ5DT5LlUhFA3RnOhdw4bVcDjYxOOhyb7EbA4baEh7PNnNz0InWtlBCzVAiB96+c7rqV@vger.kernel.org
X-Gm-Message-State: AFuF++lbn0zXqroOem2CKSVLp6Dr3WyxnN4o7KujUNtlyah7relJsoYr
	kJqLb+6k9VeSrGjKKW2dfbsQPEPNL0kjlCjCUvhfZDSRmbMP+qhSAKMwzT+sO6swR16YD0Q5L6n
	UCa/vpoDdirw0XLcLahHl9In41rM3TUVAXCCZPEOQSKGyO1pebas3x//WcQUID64D
X-Gm-Gg: AYBFou0tg8/6LgCOIMCitQ1FBi5+7SBsmD2iGaNlIdCn0Lr3ow++cdD3TS7sh0oolJF
	tZHL3ZfC4rxgH1DITwrH95hZpymjdgIk+fRG8zlGaqxMBMjkr4d3RVujkiW5QH1LxwICQbphzSl
	hvwKMTU/nuZbiCpiGiQrlAzQtHr9p2jmOcusGcukaOR+oPC/kLFfjK1csdh9ksn5vjlDMeM+vEG
	aBQokl3IgEh94HGNZh80JfLLphd4Xy5naafFFMyzsO3W6qGgSxxCNIENeLiPeX/wtY0kLKRiv+t
	y6Fvh6yfPqRL1EFNZ2W4wtmEtVc6S+PHr4U7dX1iFg/mp1lApqyx/mcLjwALewOxV+0LgqNX+Yg
	8/LkkfIt5WUtKc0jJ5qJDZHLsGZT2ScJ0oL3t/i2uJCkToBTAFOcZmAL2N2ibrA==
X-Received: by 2002:a05:6102:50a5:b0:7a1:f7d2:e80f with SMTP id ada2fe7eead31-7ac1ceb5c51mr2175734137.23.1790174648081;
        Wed, 23 Sep 2026 07:44:08 -0700 (PDT)
X-Received: by 2002:a05:6102:50a5:b0:7a1:f7d2:e80f with SMTP id ada2fe7eead31-7ac1ceb5c51mr2175702137.23.1790174647570;
        Wed, 23 Sep 2026 07:44:07 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a913:ba43:96d7:743c? ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486461sm7314339f8f.8.2026.09.23.07.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:44:06 -0700 (PDT)
Message-ID: <e39fbe69-e539-4268-b9f2-4f25a2d51ce3@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:44:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add Qualcomm SPEL powercap driver
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4TXOKdYRrE7PFj6VOZh-K2QsI4dDQBL7
X-Proofpoint-ORIG-GUID: 4TXOKdYRrE7PFj6VOZh-K2QsI4dDQBL7
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3e5b8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6G08FbKcmm3nPJiwURwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX9mGAqWgTYbZb
 3owVUQ5Vu/UGe6YQjYlPCR7k4xUhdAlwrIAy3o6jSldjVTtcp0uZr4WrUG6kV+17CPTt3o+m+VR
 Ux+7U1P4LCDxmagW9+2sEMuVQ7HkUuQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX3kv8H8Wh0Dth
 t7/f+JCI5WIlyrGFLH35TbfCtnFzMJUjtBVA00/t25Bu4BPRnMLpzSXC5stJoQ0/YyObTsSuAXt
 aLnMc5wZT8rhldlcJe3PNipmFbIaAqwFZgiZNy8ryE5o0mWP41lVkqSpri23QdXno8rOggjGgqD
 7mqw5fY4/mRm6UEMHk+M+dueNVkU/7GSHmRKn13QpE+KRcOJsxqUgZvbZFBW36A8gLiDbh8xOvF
 QLvm+ACOLJY5H6wcKvwdX8j5MZ4xX6pl4Y7RwLVd9OiCjkazQ3F40vvsS4hVkojk7lsgWUt4XAM
 CwIDpcEmL/LtPdu/Yjx6/ukC7R3d8lkgjwxZzoRLQt225gSkhyluZr1w10Z2uTbYSGrSaIY3M0o
 FwqV58LrA6PSSmNbtNI3fVp/WklrgCOoP9Nx2ZBKuPnYAPJLMdQgq8XCDEV5YFxmgoMSXr6vCgp
 Id3i0Xl7Cs/zAyhWpAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058


Hi Rafael,

More qcom powercap drivers will come in the future. After discussing 
internally we agreed I can maintain them, if you are ok with that.

I'm wondering if it would make sense to create a qcom directory under 
powercap in order to group those drivers under the same maintainer 
umbrella (and perhaps do the same grouping for other drivers?)


On 7/2/26 19:22, Manaf Meethalavalappu Pallikunhi wrote:
> This patch series introduces support for Qualcomm's SPEL (SoC Power
> and Electrical Limits) hardware, which provides power monitoring and
> limiting capabilities for various power domains in Qualcomm SoCs.
> 
> The SPEL hardware enables:
> - Real-time energy consumption monitoring across multiple power domains
> - Hardware-enforced power limits with configurable time windows
> - Support for up to 4 power limits (PL1-PL4) per domain
> - Hierarchical power domain organization (SYS -> SOC -> subsystems)
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through standard sysfs interfaces. This allows userspace
> applications and thermal management daemons to monitor energy consumption
> and configure power limits for optimal power/performance balance.
> 
> This series introduces a new power/limits directory for power limit
> controller bindings. The power-limit-controller.yaml schema is added to
> MAINTAINERS under "QUALCOMM SPEL POWERCAP DRIVER" in patch 2/X alongside
> the SPEL device specific binding, as this is its primary use case.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
> Changes in v3:
> - Created common power-limit-controller schema under power/limits and described
>    power-limit-controller device common capabilities.(Krzysztof)
> - Created SoC-specific qcom,glymur-spel.yaml file instead of generic one and updated
>    description and commit.(Krzysztof)
> - Used FIELD_MODIFY() macro at different places.(Konrad)
> - Updated glymur specific domain info table.(Konrad)
> - Updated all for-loops iterator declaration to C99 style.(Konrad)
> - Fixed use-after-free bugs.(Sashiko)
> - Corrected time_unit documention to reflect the logic.(Sashiko)
> - Link to v2: https://lore.kernel.org/r/20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com
> 
> Changes in v2:
> - Fixed DT issues: corrected unit-address mismatch and made compatible
>    platform-specific.(Konrad/Krzysztof)
> - Cleaned up bitfield handling: switched to GENMASK, FIELD_* macros.(Konrad)
> - Converted hex values to lowercase and simplified array definitions.(Konrad)
> - used devm_platform_ioremap_resource_byname().(Konrad)
> - Refactored data structures: merged domain data into spel_domain_info
>    and removed hardcoded limits using ARRAY_SIZE().(Daniel)
> - Added bounds checks (TIME_WINDOW_MAX) and fixed time window RMW
>    handling (preserving reserved bits + firmware notify).(Sashiko)
> - Resolved use-after-free, replaced allocation strategy, and
>    added proper cleanup in .release().(Sashiko)
> - Updated time window calculation logic.
> - Removed cyclic dependency, improved validation logic, and aligned
>    naming consistency.(Daniel)
> - Link to v1: https://lore.kernel.org/r/20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com
> 
> ---
> Manaf Meethalavalappu Pallikunhi (4):
>        dt-bindings: power: Add common power limit controller schema
>        dt-bindings: power: limits: Describe Qualcomm SPEL hardware
>        powercap: qcom: Add SPEL powercap driver
>        arm64: dts: qcom: glymur: Enable SPEL powercap driver
> 
>   .../power/limits/power-limit-controller.yaml       |  34 +
>   .../bindings/power/limits/qcom,glymur-spel.yaml    |  61 ++
>   MAINTAINERS                                        |   8 +
>   arch/arm64/boot/dts/qcom/glymur.dtsi               |  10 +
>   drivers/powercap/Kconfig                           |  13 +
>   drivers/powercap/Makefile                          |   1 +
>   drivers/powercap/qcom_spel.c                       | 803 +++++++++++++++++++++
>   7 files changed, 930 insertions(+)
> ---
> base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
> change-id: 20260702-qcom_spel_driver_upstream-909d37c8d8e8
> 
> Best regards,

