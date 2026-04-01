Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E673E866D
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038874; cv=none; b=UDf8f0M7Wd0abkOTO7Epw4h7NlsyHsm+JCr9JM8xe7xXG4oMoYrbIcRwZS07/EUcaLjTXPjuTm3toR1D4RhXPjR992nJkQBRGnyutY5Qby23M43hfD/g1HZHjqDZwVbs6PVq5LoEDDcoCUK310nj5RUR5zZB0swbycyzJXpXACw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038874; c=relaxed/simple;
	bh=ntImYGAUuNndHflyGt0nJi1gktfiJhPa0rhgtxBQqls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6O5NuQp4sctiWp1auhPfwfjFDAWkYHYnb+GFe+Tf++IliLkeBwjqJZtCymF1tj6oyC+p4RvF+TE61tKwbktuhDO1NBm5v43e5FUzmvpJ+y/5fjc3BG90h+OwlY5wAvgWSlz0owZmjVh9SYJw78sp7k8hiTMNRmJySc8xBwekug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PR0IskKE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBY9yL6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PR0IskKE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBY9yL6U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317IPNK3103964
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xicnXfvbJIl+1tvirj2jRUxdt5mn2YyJxXsD3imbT4A=; b=PR0IskKE3mdbiMUR
	N7rmJJQ768nIozFdFWf/LTTP/RGGf12wZXbcdzWkx1DMU/f5V+O3kM4y8zs921hf
	icTvvR+Un/Cnxdkshq5Wrp/go+w0iUuc4aIxX+5+EQ+uXw11yFxmhgh1+D8EoGMy
	U3Odpw6mlqM9lxCvkQsIJUyEbOYC4g6ivMTX4fnbSwEnPq8HuSTZzbRVHqM3QooF
	9g8x9NqDFrVsOB0IRO/GTbfdvwDcWtypGEPiqokpgKzMKYzubvfkAqbH5rIuvBAr
	x4n09efvhyZ9a3+PBeMEKTUBcjll4dw8oKdN5eKemgJKSs/zYXQ3NUgomYgBg9nG
	TXcoSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js23ucs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:21:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfe29579d5so255847985a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038869; x=1775643669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xicnXfvbJIl+1tvirj2jRUxdt5mn2YyJxXsD3imbT4A=;
        b=RBY9yL6UCf2G9ppi1ij3r4yuvMnaid/L4c4LVpzNfTgDG9/daOMHTv1MXrBzbbKmQ+
         CeWX3nzco7B56DLblN27RZz6NreJW0/fyZXZY0t4n6C72i7GaxHPNNWuusT16TOHB+o5
         9GRxpbx1+l16nKNGizviywSaHLGhlu7ATKx7ouuEhuivRt+Sj0pKdxFQalPBt3fhGxQ+
         S6arKeltt4hJb1CCEhMF/rYsgt0f3giizogtmLRwWbj+8xpb8viK5bbzUmwgcBxTfCpO
         y3h1zkRRM5L4tAHfvQLhFAmpdK927JJBfszx8TTjHuXFTKvEmQtw52pIKeuIgo3wvHmT
         43yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038869; x=1775643669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xicnXfvbJIl+1tvirj2jRUxdt5mn2YyJxXsD3imbT4A=;
        b=iMC/driYnU2/ZzNtbQS5MT3P+SMikbm5+O8qyjMvGlBWIj2WgyKCzfvYco8aDcv1Ky
         JvA7GBMKJQl97cV6lgj8leMhNGmEmcn0ElLjhM3DBuSUFfginAsKaCB23TqLNAUIZ+2S
         OJO2AlyPv4LXPUn5tr7svQ2b18oBfLxCqmMd2R4LKeA8Z67Os5hsSRIDNI2U0P3FLsVi
         dY4dCpPR47hhVL3q8j5Ez554RnCBjeRZJ3vyxaKit90cA4xpzkjjXQloMcKWQDfKj/8c
         2cAJVDR62PUo3P7d761aI2ol1X7iwVN4krf094vmQcPozMcn0jNDPor+pjATo7jEom0E
         jBnA==
X-Forwarded-Encrypted: i=1; AJvYcCVOb9pfyWKSh0HvdBBLLeWL5+bLIYL0eeKsj+8J/gVj26Z4L7rWAV+xYG/2owWGMe++5vs/FzJpbduo@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJn84RS+aqGPpnXE/9njgJAxywHJVzr9Y+OJc8yKwzU4XYjnN
	Qy0Z/J4ByDSUq9uZ1Gt1C6rehTqIV2oRyMElra3eGsfXGaTQgKPACxMZv6YJ7+nK/8d2rgFlMWL
	AUa1O19XSgOyrRpw5rQZnk/TIUgAcKyd5BJGflG5DxAhzBZfBssHPYYZwMqg9fWUd
X-Gm-Gg: ATEYQzyP0W4JEtLfhZ7YkCfONgvvDV+/0Kwh3KR4nuBhaRIMtQWi+tPTcEUI04K74Go
	ODoDQ3bwYaz9OARr8V9f/v1ap7r/cmp/blAjw+iESCZFURJX+80S8H7crWjQGkLb6m0/f3FhXor
	NYAgE79XdPsk41ORQNsVfoxbjOpPsphe3s1UXV6xx1oDBddZN/nZHERMgmX+bRZRiARL7Gtbh+i
	HfUmcjLU+aiASsWEg4lYXJG+IN8lkbq0OkzPl8ZpwGTaXsir9aNS0NW6SfB0RiniZu3FITTFTaw
	z6G6jf/O43CtgsBilnrZs1znpNWkV6YS1nbBHkEwGYx6kf2ujtLIcPmbR10jBR8XdIRDhQb7y5q
	kSN12ArJHh/uusr37R1tm8UxLmdbxMQfGwinX6WowHFdtZ6gsvPgBkobDTCzsQnMRX+CF1m+pBG
	wGnRg=
X-Received: by 2002:a05:620a:4156:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8d1b5c29d80mr354280985a.6.1775038869032;
        Wed, 01 Apr 2026 03:21:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4156:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8d1b5c29d80mr354277185a.6.1775038868582;
        Wed, 01 Apr 2026 03:21:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c07ab1634sm2476185a12.16.2026.04.01.03.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:21:06 -0700 (PDT)
Message-ID: <52685536-6b77-497b-aa48-621a82da2a0e@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:21:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] i2c: qcom-geni: Support multi-owner controllers in
 GPI mode
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, Frank.Li@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        linmq006@gmail.com, quic_jseerapu@quicinc.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: krzysztof.kozlowski@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260331114742.2896317-1-mukesh.savaliya@oss.qualcomm.com>
 <20260331114742.2896317-5-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331114742.2896317-5-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ur7saZcYnpQoHtav2PMwl2-OGivyNbEs
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccf196 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1VLNcVKysphvfcDyL1cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NCBTYWx0ZWRfXyuHe5qkn65gk
 czDQPQFWnYT33EjWLWESsagLg2smm/I7lEnVp839LVuD3wZqFI7J9PE0KzOMOR6G7uZWJNLTaky
 ETkCcFW+IG83kSLAaNcm51wEjfF63X2AUuDBTeNhYQKEyhVnPyiKIMclAdSN+xC3KRonk8em2I1
 UvZ5ZJuRowDoxVZeD+5zuA+yCooZZdVe/tykwtuNJPOlU4rPPy/IQ7ofSKMAH3gMo137HdJuVAn
 WIvfbZ6XCx2592bLlRo4V41CNCfsKFBKpRFn7cVozcY4E4TPAsEWc5VhC1eeInUyUPyQeo2gyXA
 tBWpUAd0cHp5qbg4QcfmGkeQ7k0XFad9of7SscXE4wiE2Nf4GAb42lSPZDC+T7kNXrM6A2NSMDK
 VyaAl3inFjeQcmsLh9WJv1zhcpRgfHjf3rEQyvUvZPUWhFagfOzK2t44CVJNLQch4E5KGwNYFV3
 4bnYMkpF3ySXnTVCvig==
X-Proofpoint-GUID: ur7saZcYnpQoHtav2PMwl2-OGivyNbEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010094

On 3/31/26 1:47 PM, Mukesh Kumar Savaliya wrote:
> Some platforms use a QUP-based I2C controller in a configuration where the
> controller is shared with another system processor. In this setup the
> operating system must not assume exclusive ownership of the controller or
> its associated pins.
> 
> Add support for enabling multi-owner operation when DeviceTree specifies
> qcom,qup-multi-owner. When enabled, mark the underlying serial engine as
> shared so the common GENI resource handling avoids selecting the "sleep"
> pinctrl state, which could disrupt transfers initiated by the other
> processor.
> 
> For GPI mode transfers, request lock/unlock TRE sequencing from the GPI
> driver by setting a single lock_action selector per message, emitting lock
> before the first message and unlock after the last message (handling the
> single-message case as well). This serializes access to the shared
> controller without requiring message-position flags to be passed into the
> DMA engine layer.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---

[...]

> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,qup-multi-owner")) {
> +		/*
> +		 * Multi-owner controller configuration: the controller may be
> +		 * used by another system processor. Mark the SE as shared so
> +		 * common GENI resource handling can avoid pin state changes
> +		 * that would disrupt the other user.
> +		 */

I don't find this comment very useful given we have kerneldoc for that
property and the behavior you described impacts another file

[...]

> +		if (gi2c->se.multi_owner)
> +			dev_err_probe(dev, -EINVAL, "I2C sharing not supported in non GSI mode\n");

return dev_err_probe()

Konrad
