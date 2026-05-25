Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF61A383C74
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715353; cv=none; b=AxSaVB111L/TyD9NfE0GqnVVUCeSdVoH34AgTZIX2gBaHg9D3h9/fzhaaPSEPnWPuRuMo5jHtJbhEKBw2QI1xpazfKvPZ4Z28gmqUgLxkzdeA8xoPWngHeHhYg7m6hFTU6a3VWFZt3rxJFyRdI5WaIHwEbqyfRhgtN8nxVxX9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715353; c=relaxed/simple;
	bh=jHcvSbCExWIjtKMV/pU6kDsotLo51wfwXJuDRGLN0fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgPx5lisxEZo4t9zyWTWa9kt1eX9bxwW2FCoPbJ6uzHLjfhB6zaUzjDxm15piRB7R7ZDSb4HOKBfGfH55tKpGRI14vG6Qxbv1Xw+ZfGBUO6yf6xrK4hG4EhwYy/TsBL5cerSnb+cvPNPgoauiyIhpSnSvw6657iiAVN/4knGcUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYL+PzNg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxVc9jFi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYL+PzNg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxVc9jFi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P77bn51851654
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mNLHKeI+fmqdA2wW8OAxLJgnHeG5GiRRwaHW4yuNhU=; b=ZYL+PzNg7sbUtSEA
	xEEf0E84lelx8VBwfN/3jR1IcPBn6G4q0HHjRlvhG07OVO96/sRbFLa2050iz5x3
	4SGLk8JwIU2358zn+sTflirrz35I0LG91P80eSMISNVoB93zFvwmuqQ1d7cPU198
	JyJxOxN41/dyU0T7wE9MGtLKwrVD8kVeMLCdacbHudv3phE2lvbHRkdzslJrAogD
	cBfk46ei7nASqBuRVjqW2WR+xK8TiMX2WTfH/u4Xa7n+OUFx5q/yMps4rmbbtOZ8
	Km5mpZat4+yeIDArRAEING7oI8ILAVgBrXXhqu9/eMZPBY6vGw5m59WBIraPH+wu
	sv0D/A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asxtu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:22:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d1d282deso6066381cf.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715350; x=1780320150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mNLHKeI+fmqdA2wW8OAxLJgnHeG5GiRRwaHW4yuNhU=;
        b=OxVc9jFig6FFphwZBVQVWffkm1OYk3jwa4Xl39OLNDoodADcDGOzRqOVypx3/+Jxh/
         AvO4ZNYhOzl+3CqZQoSxe2P5j4q6OfJJQLd63OogimONbGQJneALm0fqk+QTqTlJN34o
         a3k8gvwQVMYoHWnDxdLwkZS5TBfwUktHRG+qfeQDOs3YkSrJ4vqbSBwOzuYiY8JqOw8I
         Fi4Cdpk1pp7jje3zU2Hc3b2FBuUcU9lBhUTO1APXMUEW8mi1/hBXqiSkw0GiGC67rs7w
         dMlZGYaSkrsdZyNjhmoTWbjCXnzrO/Cy0Heha1Clly9zDMaFT+GC614unbex+/qMJ8Vo
         ZjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715350; x=1780320150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mNLHKeI+fmqdA2wW8OAxLJgnHeG5GiRRwaHW4yuNhU=;
        b=Wf7QApzDuHAbwtLz9pwfAqmR96HeS2LZsX5pksozUIwMcp7rFab+6/NmuTZMnbC5DP
         Y90lslSrXF6M91lTIa2ZAH9tVzTTHxfo1XC/A9T19f2sJjBEsb4foJ5mLye/PHXu3zy5
         gyHdS3cAZ0ECZfDRjW0y6V9cvcqYrL44E/rYE0HJFrypH+2KVwgwijtR51IL8mVF8SVr
         FTACN235O0cHWuTFLamgHJiCUEJ1qB+Rl2ZXinj46l72qh8XT4F173VSCHA1xEb0kUfB
         Z6H0xt04U2G/NTbZEUb7TCrhNl8nQ5b51zMYPLjdwRFZ0sIwcYJ/4OOMLwkOUurkFloq
         FjdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KnpBpxfvT+7UUz23ieuDgPj//3RvEzwYcIiXCHfC+H3+cmsqFgqD5C5p0n1a92bZBuqkfl1dxv6SE@vger.kernel.org
X-Gm-Message-State: AOJu0YwkUGxc3whz+6yN0pZr2FN/dhLFot2bWPuaBPherb5nFxC1vzga
	bOmpQ1oG2tJ4BimVnN97vfKxe1WUbmA4Q/MXkxi+nQUzM5dsICxm6wWw1jldpwQt2bMBV9vOm+O
	lbLNVa/Pu0CzgHzooA60r249Nmt1ICRDgCIIfA8Rl/ARpO2eG8Ja0OKiwnZCvbNJgbdfcOtsR
X-Gm-Gg: Acq92OHe9AEqD+80SEoSf/0/UT0udutfyGFddXSA93Gj/FF+YvADU6470xYMxev82YJ
	++HyC/3FzivfcBBypNNnLhKfSzEWFGuD0FEIw5Km6NM93l9GcyZMCkrJAE62tmfDtNf0kzHTVtc
	3rkpGzeZ8GLIvd7K6gODjHQX9g5+dE8svVF50ZHWUZdln2nqcsZcwOtHwWjoRLIl+IADlY19Fga
	chLab7r1WU0AxSxyacMyFD1LQ3nChqZJT/gC8hhv3Pr1M6wdby7iuNdPTrzqXbH/muJ8wuuq8NW
	Fds1qN92qGJ5wuickp43iBv0K1BbVITjwYHae0f9KadURADXNX93K6FoLAOmzUwV7JHeVZd25jr
	Vg5Z9AEpUSglL/6QSM4G4CfEs0uU5pz2MM8nllm6xdsdLfA==
X-Received: by 2002:a05:622a:18a4:b0:509:219f:8e34 with SMTP id d75a77b69052e-516d43254b8mr133364931cf.0.1779715350095;
        Mon, 25 May 2026 06:22:30 -0700 (PDT)
X-Received: by 2002:a05:622a:18a4:b0:509:219f:8e34 with SMTP id d75a77b69052e-516d43254b8mr133364441cf.0.1779715349591;
        Mon, 25 May 2026 06:22:29 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd50sm391861766b.4.2026.05.25.06.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:22:28 -0700 (PDT)
Message-ID: <0da2d0f1-ce71-4079-8011-cfa501fcd8cd@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:22:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add Display Port audio on Arduino Monza
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNyBTYWx0ZWRfX5ae5z0A/s95b
 0lJnvsUxEzonW4xMHmjuPJmKuez76GumV4SPQsaY4Go6QLfyCzhme6E2ibHKS7AIGHNKsxwKP8s
 XQHeOGbDACpCt/iORAfxVGbBKHWbML+N9UZ3CYrx8lvFN8TbY+xpBV2JuQd0ccjn4lajY9sk60D
 bb/DI5YLtD4Iqx0nRYlvNjuQssZmqMt5O4LJAWmh4YX48IeT1Qb0UTjSfasD4hwl4MiLtaMc/aZ
 ifbIlRxxgvZwcyKWZE1J1TL6MwFYLjZeTlamcJAhJpJSxukDQQOCr+C+y15/pN1L49EF77VWdP7
 w4YudQGozxZkc052KDtMX4WORIBtTy/And6RRmnnUDLhppPcl3vbAfgEYMMfGgtsAsZHpQdBw87
 3EP2sGb9UhFT/zLsgkHc1RN0QNSNwS6PsLHUAY5EKjId8mq12dAyZRmeR8CqltuRxvdOoqPKQIv
 YF5vjUViWYGwPFcTYtw==
X-Proofpoint-ORIG-GUID: wBvqfa1KButL6PuS3ZKTpMfjp5JG4HLh
X-Proofpoint-GUID: wBvqfa1KButL6PuS3ZKTpMfjp5JG4HLh
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a144d16 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=j4Rdc6PrbeIUoIXUaQYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250137

On 5/22/26 12:00 PM, Srinivas Kandagatla wrote:
> Add support for Display port Audio on Arduino VENTUNO-Q board.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> CC: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
