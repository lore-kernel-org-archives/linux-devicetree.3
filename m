Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC7A3CA487
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160154; cv=none; b=lCYhn74B/LhmDPMiVDjIoTCyKN+B7389vB8c6rMALSj7Ro9TbEUYKfBcEaaRECZMxeNI7XKmrFQOPt3fC7wwtYpT5ww+c6MFdmh1RUlybHv18kzkTzK1wf2GIfCzKcKL/dHMx8nIV8vJw90vRJHt7IsJ1x50eX9afv9DnwcWOE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160154; c=relaxed/simple;
	bh=wuR5JFSajf2hkwoeFulviUjvuO08ypSrDi52MURLwgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjVHuzGOBzmUsIY/7HY7xy29MJ3TxNyaufV7H8PxmfiZTndPR/3gbBrQnZ7VtBix8gkYwq89Uv8REqBtnIIinQl5N4pMiioIXuzMo7pMUJhRXK165eemHcsYQDnV1y8YKoC6KUy0jxvCzCF/d5wfP157x6LXmd61w4Y3OGpDVlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RN4fs6if; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYqI8wFT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN4fs6if";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYqI8wFT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6hfoS2386429
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZiEsYnwchziA2wH1UdtccA4jEIltz7HwL+VNB9wT48=; b=RN4fs6ifLIv6rZsQ
	LoIAJ9rZxdiE/7u9kXiLMwxNmB8F9sODkK7wI2G4oqj2x1OV3Wueyi0HK4G42Y90
	NlKQEgtRFwCKpgCpcBngKB8OKBWlMVSStt+eEBfIrf8JRJ0KQuy7cdTNTonGNi2g
	f5tw7w6POQyJ3MyElq2NHQ1kJREiFhxeEv5JzYWg7bGXC2NZ5JMpJWVdIcDYVzxS
	/+RVVjJ/Jz2XW//wVq0ghOvm7DDFWE8HFNUpbvcv+L1s3FcwAIs+1iBcx8vrXp7A
	o1dGqWtY6BATjb8Xzu1bxudEsBJr7OecdfZzU7FU0NwUgTwSbgJ5kYfYn1jFLdEg
	EyoQXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w25ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:49:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca4966fe6so8756596d6.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160152; x=1776764952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZiEsYnwchziA2wH1UdtccA4jEIltz7HwL+VNB9wT48=;
        b=hYqI8wFTAGRnhFyT5BrIw0KD5RJkqexSv2BzxJwlGc8HVw9mM+Oi/OBodtV7YZT497
         4tk558HQFE5huHFdAOAB4/asGqD8/6JmAmY8cJJl+Tuf2CbKGmcoKierQlaOlR3LUb4D
         SaHHyfG0TyFyBBdd8u/OEJeCRZUmmCVy2Sxi/PPyZmRdhpnn2JDhRlJgImBsSpXYDDIU
         aIzhAl1w63OnX2fioEifhfCII+V2uylFuvcq2f+v94jIZCuVLbSW9KRel83YX5LJitoY
         Kl/Ta+CqhSh1OJYFaUHW+DrD827At5Jx65hXd0NMXwu5cwbn+UI68yM2STGY/UVzAnZU
         /ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160152; x=1776764952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZiEsYnwchziA2wH1UdtccA4jEIltz7HwL+VNB9wT48=;
        b=b8eBKBKAvPBAuZW6wRPyGNnlHJK7YU5ozuKiUhEymugFcxKFC48BS7C2u7wHtNt1pw
         WmIubfaCHY3DhxtSfmEW0gudJbcP4UHroh+oH/ZvkF9IP4rcCVc1NGPYBW7UX3q+QORJ
         jUVsBCveYITzOmiH6L4cB/+Xua9DhySIso2fLd3o60PUpKvQ8ccKfTOoutuKnpcElzLG
         bbsa6LT5Ls4cHv4PU+xDjwhXrrbfDBMJN5BkimD9EO4oS7QtfRSnx6zCAVNwxbAFR6qQ
         JNp+o/2H5dZx7Gja+G5DFW8vIziHxWdBDMtdsnDFk58zmhZbIjwE/jdXEpK/128fpV3h
         Iz+g==
X-Forwarded-Encrypted: i=1; AFNElJ+Qb9u7+lOxvAKLGfIkeg1CB+DyQLmwlLRzUT+RsngcwVw8Q9hY4JioL8Veedz4cCu3dMLokUPHb3PZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy84L2n8wy6IkQ6r73rkbf9tXeRXcF8Y1eqhGmgNkKXUTg4G7oL
	QGnXUVwxAItWF2SIF+J5rbGwqAUjEW5BH4R1IW1sBexSVKN/Ffc+gtRE3HINujlF9wO0ir/ppdk
	xxjlN5vU5AbPbOfhupxkVLVLTEe2YPX43IjVTRVOtlY6PAYil9ajrsskRel+U/lFC
X-Gm-Gg: AeBDietN6qXoRmGJaZ9pDKgDnY2RZL7tbWmqIwX+XghGeWF6pU5P0gRtDMF9Mz6d2LK
	61zCTEmrUqYsYcoC76Pjsn2t6BXr+8NJkU8lSpm+SwjAOgkBD3iR7TpoP1qP3nW+dU3m3pHIIiW
	sydddHjUZSEVlpcDzAJuekSqNOcQ6USqNmfRnkA62OPHyPQiHB/F42KROQGA2J+Yy9ueakPAzQ1
	ySiQBovWRUShsP/+05MAp62Y3iIE/KcoOt+xsnHC+GKYhRQgMO8wW6erMY7Yv7XjT6wGtCA9s2P
	10TMBT3pGsMaeqoG73DAD8RXUGjxDioxJQY7q4RPOoR14kH5cT25ifzkrlNx+8ooIXawLKMdds5
	oPPHAgKSRU501X1rubaLiO5RaBK1uPN8kqDVoI//QpAktd7eNhAtme3sHnubZoNmjwzQb9EI7OJ
	pfxasrKKCZc3+l+Q==
X-Received: by 2002:a05:6214:21ea:b0:89a:5129:510f with SMTP id 6a1803df08f44-8ac85f82b45mr181121346d6.0.1776160151851;
        Tue, 14 Apr 2026 02:49:11 -0700 (PDT)
X-Received: by 2002:a05:6214:21ea:b0:89a:5129:510f with SMTP id 6a1803df08f44-8ac85f82b45mr181121026d6.0.1776160151365;
        Tue, 14 Apr 2026 02:49:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a44sm386708566b.52.2026.04.14.02.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:49:10 -0700 (PDT)
Message-ID: <1de1a366-a325-428e-9dcc-1333bb85ed82@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:49:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] media: iris: Add power sequence for Glymur
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y4nHHOke4wzaO8eC6Sh0bPw3MH81aA9Q
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de0d98 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wrwf7AeaGIUVrLbmntoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfXx9Po2wopplpW
 Um27Kxj0Xav6z4PumvpCmHZQYRFuvLxEd7z5X8gbZmF4vZtxjP3MSESquJ2hUw6vQgYasO2Kv0k
 En/EjTqpZqgZQ+ZGtbdCPVU6jgrAXMCOSJxQph7lxFaTIQgVKkgPEVCxICfQbej8FCZfYBrvnl5
 ECtBBVnBqhxKTVSwDhxZjKhIjmB/A61JcL0v5OEuOvPWzWbQIlIA/G1f91VXulQZ6nbhgd3ZDVF
 3zSIFSuoRaOgNO0t5jqxFdrAMrzEKWqXituNy2wIK3wCJUOAE7WQ8MO74Z69vjyo517otQN3r4J
 qy31C01BFfSrcBag6mQ/KPsac8wQBcZVQwhbsK4tdgU7n6rr7iZKdA+14XxQpzy+uA/pNSVlLLI
 IkVWqn3TaBVU13rDkrtrxF9scmXmJNU/SUyJAcinpOC8mjS2jvA5Aozj7C702YsGzmOWS5DPXBi
 8zR/XsiuW/iSQ4LhqQQ==
X-Proofpoint-GUID: Y4nHHOke4wzaO8eC6Sh0bPw3MH81aA9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140091

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> Add power sequence hooks for controller, vcodec and vcodec1. reuse the
> existing code where ever is possible. add vcodec1 power on and off code
> separately which has different power domains and clocks.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   9 ++
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 123 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
>  4 files changed, 140 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 30e9d4d288c6..e3c1aff770dd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -61,6 +61,9 @@ enum platform_clk_type {
>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
>  	IRIS_APV_HW_CLK,
> +	IRIS_AXI_VCODEC1_CLK,
> +	IRIS_VCODEC1_CLK,
> +	IRIS_VCODEC1_FREERUN_CLK,
>  };
>  
>  struct platform_clk_data {
> @@ -208,6 +211,12 @@ enum platform_pm_domain_type {
>  	IRIS_CTRL_POWER_DOMAIN,
>  	IRIS_VCODEC_POWER_DOMAIN,
>  	IRIS_VPP0_HW_POWER_DOMAIN,
> +	/*
> +	 * On Glymur, vcodec1 power domain is at the same index in pd_devs[]
> +	 * as IRIS_VPP0_HW_POWER_DOMAIN. Alias it so that the Glymur power
> +	 * domain table is indexed correctly.
> +	 */
> +	IRIS_VCODEC1_POWER_DOMAIN = IRIS_VPP0_HW_POWER_DOMAIN,

This feels really fragile..

[...]

> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
> +{
> +	u32 value, pwr_status;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> +	pwr_status = value & BIT(4);
> +
> +	return pwr_status ? false : true;

return !pwr_status

Konrad
