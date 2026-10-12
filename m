Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C24931F990
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820356; cv=none; b=LxJs4xD+a6xtAwS3CxmBnwzgY58aSp6nzOeD/k4FrJfziDZcE6TbvCiFlKg27IYf4J9gTod67c7DgSQAZXvi60gne/KQjl59dbbiz7b3lAHYqn51LrBczZdgaYXlyTm20Ywfvb/Nz9xONnhYnb3k6NUeouBmnO+AVXLgG1KC0h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820356; c=relaxed/simple;
	bh=BAVulmbfeB4WFKNjWlELp4bbnw2TudrBhLztaBT565I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHC/QY0BJFFToaIQFytPAkervxU3pT6unzLlUerYIGHfo+T/oh0VebGg7kcHkcQOEZ/tkeHBDi9rLqvNN/REreTMSc5kEq76xeC+XKX0D6RY+kcdsxA8Pcedv0zzjlsu7/suwY4asyYQ2qVE3fIhtkVsmVAONV7A8dCSvdqFmSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGaoAsxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bo12ahuf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGaoAsxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bo12ahuf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFekJi3782542
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnkCBBW17Ri5LY3kFYxYgET+/g7jVRj8ss0xDPrWsNw=; b=CGaoAsxSEbglfnaj
	MvnlCyS8J9tjH0a3InFETOfmOgpU0XfJ9rD0Uf44p6mfYiq90Jf8VmsDDVBiHCR1
	CFwogwqjpj7yiezyhfj11VrggL+g1N0dfjJ9/xFA4hwG+DEAZlOx+9uKYiixISDr
	vJCxhRr6fWTEHRr074y9Msr/D6+WjvAsKSVR4ZvUJuDIqGa+paftMElC/k5SEoUl
	WIADcN1ui+Xulzq6MYZmUY3haGftUj50XSyNxubELihm7rwEqgqgTiD0Ym8EVXYv
	2yZcps/BUqP5Qsyhv3lvFjxTd15V0Y7DL4qx7gmNqwns2uqBmEjKQW3b1GjAr+Pf
	DAKQzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j5h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:52:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so27706585a.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820353; x=1792425153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnkCBBW17Ri5LY3kFYxYgET+/g7jVRj8ss0xDPrWsNw=;
        b=bo12ahufEc1DPn98dV+qdnVJU7Z9LxUdnkregrGX0WX0IfBSIdPh2ekw5ZV4onkKrg
         HGbU3SFblCyZhnmc2iqzekrCwlyrq1BBRMmnFm6FGbJjTnKg6GLaCycdOua8Pd0gHRfQ
         1xAgs8/tvHvac5WpUAwhuy5j2as9Zc9FxlcsNZjFrvxzRFLZF71h0o/rcGXTrqJ5mv0M
         byj9JcFqmIHdmS/dm/PonHoNgZT9/Wzzb/yX5MbkfhRMj2/Q+t8AASzF/qiQvrHpy2nc
         /Q+oOpkeuajTdAodzMO4qaeGy5MkUuTpOXcSV0Gc/jTX6FkPwevg8ETSoiFcYSCbyFRE
         2RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820353; x=1792425153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnkCBBW17Ri5LY3kFYxYgET+/g7jVRj8ss0xDPrWsNw=;
        b=ulBzco0IviWzt8vVRsVjCsxWJxCQpfC8nhn2eHpfHvc/emhe5ELGWy7tGQIwqDccpr
         5hfomxzHr3yS5/IUGKwhoThuXZvfKgxLItdyGNWwS0hEFEUg1oWSAFpTjSKjRl0N5R79
         q2HDY3Sz079zNiQHmnxjYmslhWDlOK68pYCUFSJjsc1xEEgGgslPpgcRQVKlaC2QkDv0
         m7fdLNrRLt2IxZUWaO7II3r/ctaZD3uPK1x6LlqFLH/dJh0mRnttlmzppW3ZeJFkkEjw
         J24xsdipEJDCnkHV+e/QMdn10h8dXL+36s7fYsE91gMAUmwgKETkGcw31EoDKBMJBpGM
         CQxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxb+rFjtP/hjy9MDIii+RAt6ovIWuIqhU4H5rW0Dc4NgWeS49mtX3PizW3ahuzU4zrOIhT84QG8rMvq@vger.kernel.org
X-Gm-Message-State: AFq9FYJXxkYC43/yl8EDdfn5oX1pEeHHLWgoaTAn67P4813my2bvME+E
	9kLG48EVkCEEMsQfSz/5N1irkZfbkExZP/ju2I5ATeUsOt0nXYZLyan9pQ8PJ/JQgS77IZdIemP
	jklSW5b4VP1rru5LU22FVXAhXQ2jTOJ0waajcQJaPpxSqgeIA9snprRR2/c+RkYZk
X-Gm-Gg: AYBFou2cD5bzwQxJ4JSnAWrAKibuJWtvRGG/J3/T8uRD4XyBHobrXCLV1461scDE0aJ
	m+GBGhCFO0qeQh5mqVGtV1Zjyt7Nj/roc3MjktIWAx+dw4+Awyou25GqYuJw4eUaiBlbvn1aMll
	veTjrdVePv/fWPZKRLU1AIicdP/Wvd9yok7MAT8o2LH7InlexDziIRMtR77G9x2qsxm8E7lZTy3
	4RVgVV89sS7IBb5ehfGdIk2YJmnt/4F5AQG93U9jERychLvdiT7asl8uUUu+Xw9V9cbwNjOMnMq
	/zrwPHxrv/HA78HiXyiA96s9EaV5VymcsNvSCmd0rvBdDZqZ0vUnJzEPhdXW6wRQOTW8BM9IR7a
	rYkIX3I6DYiwMt+tS5Wb1Cg==
X-Received: by 2002:a05:620a:72cf:10b0:93e:e24b:32e3 with SMTP id af79cd13be357-93ee24c5086mr447408385a.0.1791820353268;
        Mon, 12 Oct 2026 08:52:33 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e24b:32e3 with SMTP id af79cd13be357-93ee24c5086mr447405485a.0.1791820352604;
        Mon, 12 Oct 2026 08:52:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm480313466b.20.2026.10.12.08.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:52:31 -0700 (PDT)
Message-ID: <f2bde571-89d2-40c7-9ff6-c23a56b3dacd@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:52:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/38] arm: dts: qcom: apq8064: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXx44H/+O1s20v
 HORilO6tXMadmp5b2zK5R8BtSsnPq8gGg6yqvVG0OxLUhzawkzAU/zfAdhUcBiJ9eNZUrI4TqlO
 O7rFpFSdWwMktFDFIPkW7hAIKaeqB3fd7NdhN4GUtko70b5+2HY+Bt67O4cCTB93G3Qgw8CiQHx
 Aq5CLPBhH8KSwI2M6RlAsvHjUx8humqb3M0KK+CjytF4OeRq2aWm0PZvsaOyhALaJ8XUc3jvHUe
 F0QUuCREB9pkOz1qcyVyqPBxDj5MCRnmDYZP4p8Q7syr/3e4/I/BC2T1wMYhy1sgmY+7zsWBewD
 XzZUxE1RNlQQGs60kqYAN6cSdJ9tt96Y07LtMFYwuHXIaz0zle5CIbueUIYeHbWR47BlSQtKP22
 AxHeZu2HRc5A8zAesW5IEviWCoBmHab5gfPoaympJu1Th2tujJ+BJdeEK/OVmt1S2QVeHSNLvB9
 xZAesS3OL8iESOQ6Gog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXyTEhK0JHrMET
 O2Fbwmq69G8OvBTNTiuX60NDpXuX0dr8gsXPq1MJPZawGHwW2RBBJE+uoro5Qg/p7wEe9bWQGbS
 hfS+8a8/y1j44VlCjuIcVuymCJGp4V0=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd0242 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=aOV02CK0EVwC807Rud8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: tU4jf-AKs3qdA2-EsvctYpWP-zG8GNoO
X-Proofpoint-GUID: tU4jf-AKs3qdA2-EsvctYpWP-zG8GNoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first one
> or properly indented with tabs. Found/fixed with dtfmt (Devicetree
> Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 98 ++++++++++++------------
>  1 file changed, 49 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 150b5670e13b3..565f98c00b3fb 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -89,7 +89,7 @@ l2: l2-cache {
>  		idle-states {
>  			cpu_spc: cpu-spc {
>  				compatible = "qcom,idle-state-spc",
> -						"arm,idle-state";
> +					     "arm,idle-state";
>  				entry-latency-us = <400>;
>  				exit-latency-us = <900>;
>  				min-residency-us = <3000>;
> @@ -1036,15 +1036,15 @@ gpu: gpu@4300000 {
>  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "kgsl_3d0_irq";
>  			clock-names =
> -			    "core",
> -			    "iface",
> -			    "mem",
> -			    "mem_iface";
> +				"core",

As before, let's add a rule to prohibit `property =\n`

Konrad
