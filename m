Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCD349482E
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179597; cv=none; b=YHk3pFRxiGR4fkgCBQtUO5LxJK42kBXJOxTESC07U7ZBLkstcW1CPgyKFAPd4DJdcU0EB5mBqbARRzY0Jqfiqbd7bFdjO4vXcQ37FZ6O1TCTRQ9oRuDPXmDq9Dk5iprOIKCKiS1RwGupRctWeQbcEF4AkWJlm/Kcp1QxnVtKFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179597; c=relaxed/simple;
	bh=7RgeHwPYtMaSqi/p1KuO9xl5tU58oXts3DwvC8M1/GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4DGW9LfNtfEVv9PRZ2FAM/IZZJ5OzOmN+3B82AG3pxr/5G1se58QiXRjn1aVV4nr+ZNbEAHIabUxFkRVU9Eai+gph/VSmGW4nQar0PojIPbLlDduw2/rg4Dbl4MrkntjOX5+YVbKjmytY3+5zGfO7PtCHjDfPcqDGWkc27fGhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNjJZzh0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhWD8bKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNjJZzh0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhWD8bKp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbXr62443386
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/yCfoa8mb4CzHVcBi7sX7PexllZZB5Dkv2WxLFeVoY=; b=jNjJZzh04fJERPl+
	tRbkqSodlHUB41rjwFfkJyTZXPmBULgi6MBWQXIzCRGQY7ZRyc/1hbZBxchE9AM9
	COclNPuL7tk7b+9N8UP/7Y19X/UcLx1JkQTGvmPnTtWyrkOuH/5/yZCu3nOcVqv0
	Mdp73GrnCud/66qF/DG26T2LuU34Nh8GRSWEc/SxIZxwast8WNhGq0/irskxeYXr
	oJ4MDx5VVWv6GYGhvaH0N7mYaQKrV2NcPibcbGarIgPwRRBg1H4yXIgHy0x2yiUn
	e+SZGbCZNEeMQlI3pcyeiefRRWhdBCRxwW3dylDF0WgSPsJLjd8N58ve1rVKVLmN
	bLKHSA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7hr1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:06:34 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97ea2f5863cso16906241.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179593; x=1790784393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/yCfoa8mb4CzHVcBi7sX7PexllZZB5Dkv2WxLFeVoY=;
        b=bhWD8bKp81YOPhyhw+j9PWLbEFyCJmHou7YxV3Y820oPcVHtK+m1PCRe5ZhAUEGQRA
         CcBntZpLQVzBCA44Qb7nshf44u12vXA+e8q8mFSje827iRGy2aYrG6cvyC8r/vXGeVqp
         rxDQr43yd0XnI6WM8OSMWXJPsFxIGdONG7De7eybygk8oUb/2IigMgfZClHQbkDXmWH6
         wmdW7S4I7KxbLmNnKyL5Pq7CtV0kLoPGh2zyw/+odgDl5ukIvLNDhCTs4iAqFqpTk8Aj
         HXojcbEVIlpyRZffYTbg7x6u1IslJznUVaGHKbtepmCAUvmtjUGGuxf8h7eixRCmSOgW
         +qaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179593; x=1790784393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/yCfoa8mb4CzHVcBi7sX7PexllZZB5Dkv2WxLFeVoY=;
        b=1IghMSlSeZ7P0ivEUJkQbprGXs/2JBc81gAiQKvEl8rq879keegl+hQ7LY62WmGP1q
         RcGy5Fa4+bPKgBytNbKEWmt6mvTcsOFAIu/5NFhNLkWo29Phr+BONecsuAE9p0rjWUFH
         p/OLTL8G1T/UjrTrC46EVYwPPUJDe093YlMR74xYJ3QLGpDolBJutkbY516xDWw7zd31
         IypSfpsolhi7Uj97fkIEkSPwZrhS2eDJl2bONEOTvZUJQwfrD7k/omlqW+Rykgsph6xi
         MNfmmksVQcCtkBiuXEF0dlXwzLDVTx9p1lwdUgVt0KLRbN5SaLHGKqTb4j+xPW9SL7lP
         AtQA==
X-Forwarded-Encrypted: i=1; AKwUvBxx3u3Yg3cg3vuOT19FSa1reCbYodIjy72mOHDrBr+FtpTgvzadz7sMbbjRLH8+xGkxHJdirh5lnDFV@vger.kernel.org
X-Gm-Message-State: AFuF++nJsNwSyAzYfJjnMDGi8SZbc7shP4TppxqeaXCRVRY8mkm+zXsv
	0nudD1wjCjIJ9kW8Ijjeq3pcnkCdyJUpgVeNDWEimtMyVyDdV7PSgGRYXdttbC/Iwr3C/ooNUSV
	U6muIWEYeDX2HNb/KzHB5669FdMet6l+E5t8tH7oSwhM3skIT6JmJCOiW+qtMfCZk
X-Gm-Gg: AYBFou21UO3lW4uYCcw/vFkoXz81xJuLXeJM+J/Zcz6/jyvoma04kTNhMxX0UVisfgx
	8jWGzx01Y3oz1n/plcOTzN/d8KGUpcBmgsGNGO44fWsXs2ax/vKKxyl3T/Jps2GZHuyW7pjSIm/
	X/tdsq7nJRFafGoIKYQLMA/l+wrlyIpPLJhaQxm5yZ7AM62Mcwp1OuESyHa4lEa8Nvxd73ZiL/B
	4cBqwtNePf3qEwpLwxHxNXNOZ8SnNu3KYp2ESpJXlhtBYASZtV+D+2TmyVt6dpbxn7MOLeGReQF
	HEaVZ2Yk0SLczGk6QzoS5LSPfPO0GAcgRvshtIrxxz6w13WXC9J5KXVk8efvXlDf9RjbtqGUe+F
	U8wa3qAc13RUHSEqTJG0hzA==
X-Received: by 2002:a05:6102:3c8d:b0:7ae:544d:b50b with SMTP id ada2fe7eead31-7ae544dcb90mr1032927137.3.1790179591926;
        Wed, 23 Sep 2026 09:06:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3c8d:b0:7ae:544d:b50b with SMTP id ada2fe7eead31-7ae544dcb90mr1032853137.3.1790179591382;
        Wed, 23 Sep 2026 09:06:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6dcf0dsm154081966b.61.2026.09.23.09.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:06:30 -0700 (PDT)
Message-ID: <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:06:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: Add initial Valve
 Deckard devicetree
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
 <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WDdhEWDD_tRlh2AL54eh5k5OaM_OtZXF
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3f90a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XKDLSxsrZXX4fVXGSQYA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX0j6JkjIeNl1A
 GzefPG8KRqVJhl2I3FilxeDD0YwuYRM3Awr6jzl3eF2FAqxXY+DQ3G/pHj49gA0+3BpjRgSU2JA
 PkrDWLBrOUzJMk2vBQ1vyyv0gulnqGh2Ms33EJWlRNsJ9VVAthQPk4Z4I5rUMj+QRLeB67mXKHl
 Mg2vUlyOP7DvUv5ItH/g93p8MukJiLPIQQ1weaOpEtjT6xH2OHedfWXy2kbwkFVBiBjCSInmiVs
 XXRKxbapaFgDWc4zi9MEr1kbPWeeJuC3JsSz4CFpbqADuVCSATn8UZSu92KD/CojfNxzlNPVS9+
 YruwWrj08FwDq6tST4uqg12Vp9pDCqXDIHD/Ce3MA4RJAuvk29TZbcVUS5Ia/6NWh/AkeuU233F
 jKAY7SdSMJXrJW9HobauIOCaAI0rpqtYZFbzdpiv1i1I2plG71EteX85hqfex3z1gqUrPHV+3wW
 IZaIZC34Qo96JJx2FcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX58C9KxE5IQb+
 Yq/l/zVjatWeOGhNBucHCZ/jZbkiwlVVAv7j+U/Ca1ZXdM+98edn68TBuwCceB00nzgTRHIw68T
 9pL7FlqSemo0BHrkniYUuwEgOc2BaE0=
X-Proofpoint-GUID: WDdhEWDD_tRlh2AL54eh5k5OaM_OtZXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230064

On 9/23/26 2:16 PM, Neil Armstrong wrote:
> Add an initial DeviceTree for the Valve "Steam Frame"
> codename Deckard. The Steam Frame is a virtual reality headset
> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

[...]

> +/ {
> +	model = "Valve Deckard";
> +	compatible = "valve,deckard", "qcom,sm8650";

Sorry I missed this before, but you likely want

chassis-type = "spectacles";

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
