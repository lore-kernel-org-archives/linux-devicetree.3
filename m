Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6113909BD
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262999; cv=none; b=lWX2rFTuuXd3CT1uvrBmKbd2Qtz86ix3GBZd13d/X4M79/ZviQXJNOAgzrDN0U/UQ1QwyRyNkppgXBVeGMWZxjXg1qVHCbaqSrFCjNe4rKJFkl8Jd2sYcKVBxZ9pv3Acgdl5KdOMeY0V7WKcbWCEpecJsWIgHX39H4za6lwHagU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262999; c=relaxed/simple;
	bh=wGjj7ERA7nr4OJjrkafjcBLtU5QBzNDp/qECl2A3LRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbGTEyBhw3b3br7ysynydiBUeoarHR80STw78XKvgD7hiYnzXWiVloACXn8oUhex2dCV0V2Ep8uSx74tVjHLUqOSKVURrXkM1zjyIfFpuZ/X7VMVWRH2gUTYvhlJ5sfkRuzMJT+HarvNkp9DpaDTUC7GdDU0519Xp8Cd/dYfVX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3Qpslx4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+YlCKWA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3Qpslx4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T+YlCKWA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tBYW2291169
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9r2B2oJ4EfStDBIw7yrgfft96NvA4Nk3SOTixfnh3ZA=; b=l3Qpslx48taa11ql
	EKmeq50oHYVGGGtT7AEJjfZ+d8Xy9fk57yOm1EsBjmkzCS2MiEyh+TbsehH01hg8
	Ncguif2pDnOdeyllqM1Z5h2t4fFXWTFml0XznnjvsacNgMgBaDEOYxV3k5BAc1ov
	8Voa4FBcabEOB3G9+xRnlE6NVBkb7THrYJ25qGxya98DakCZrN31ZZLoF7psKZWM
	+W43UZt+lMaR4nJQQ1j/SBX2GyGvT+zHEJ+KxTeV5kNacL5brJx1nSaQMsLObCrR
	b/34SUT89ikWw7ZOVIndrQd4lcRP+I4S1Dw14OnRx9Pf3jBcN/jL9stDT8MrNPZE
	Fzi+lA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70kwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:49:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a04e9d4faso33366716d6.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262995; x=1774867795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9r2B2oJ4EfStDBIw7yrgfft96NvA4Nk3SOTixfnh3ZA=;
        b=T+YlCKWAs4XwtO5QgmG3HHxOJpuHXFt9GrMtYpswMcWoZ7rskTsEdu/52qR6YUZ4PW
         LA6iOxpRAfe/mtfQcdlm9J/6myLF1cAO7tItSGuZQj0pa7WEOAUDlCFX0jIc70JAtW3X
         QtVND3rQjUEa7LXgMhH6GTt2a732eRhvhs/OKdCzRshFhRTYId7lIXjfL/I2NNeVGlP7
         tM3vr2A/+wswy1cSsNPZ4mpC+FN79G7jjA+PhTFsHQa+2k5fniJJtwN15bUQh8gTFDfv
         oUukTl05LFTCBqyWb0x3JuOmWkGKIGRxX3w3W6NkHyBZOldmfr8FeQJYSdsFGhCMzfdl
         rXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262995; x=1774867795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9r2B2oJ4EfStDBIw7yrgfft96NvA4Nk3SOTixfnh3ZA=;
        b=McRl2V7mwqUWuj9918EahRhUaaY0TVyMoqgQb4ap8zVUqEJ6mZ41tnLBtGqebbLcru
         jjm1K3eoU9bToIY8TPH7WdwrXRxqO6E5vtrCUAt0yTB8I55LLmdDKsq0eVMAFSN2DeG6
         cvCTxdklIOWEcJ1vpppxk1nelseRp+XGXLH8P0jRx4ZVjBBFQpaJxlgGy/Ro1yCqLIDk
         dEBgklf+CQWpsELCZ6ZgZCCNhF2HIQm+NFwaxx6pbBJmxknyBstT4tAt5YIZY59ssOkk
         gvac8BrIg+5whzQK2cou2OYD1/kJQhUcUPnO5nKMfDcE/DXKIQ7pS1+2CD0bkqHNVoko
         eKGw==
X-Forwarded-Encrypted: i=1; AJvYcCUWRhg+igP54FYNZuCwZAAS/JEXxifCbGeSHQGmkVg4Bfj4SYXAkkMsEGNuMVOIOX3PxND7+7iFwEaz@vger.kernel.org
X-Gm-Message-State: AOJu0YzpmUA/dPpxRl0ZXnY0qNP6I5wmvBNcwC53ZEeJFVu63sd1/Lpx
	zUghy3NVLdyyw6KCXA2ZdHy+gVEKT7mTX2zFowY1512NsHpN0jnKGm2H4Hvw1Uk78gmzObClUoO
	9pWJikvYekFYNIJrrO+4dUp4iess/0SvMTTPvtZI6giUf1ByjOQT07BLblbZckDsK
X-Gm-Gg: ATEYQzyHmGfsO8mXqhWG6chf6RlB48WNKhE3c/927EDiiQ6qyrxBgwe5t9tvRB8VijU
	NwNsbhTCGL8MRt0RpjllY4HSkHDWL5TA44w0feD7nCPQwrXhOb7djTV5s20Pf0oK23m6g9UvgQc
	sMOjg4MyboLBlqRJlIU60tIhKtG7pvRVmSw3U+2EC5ZQckgHNPLnsFoVniN2yNtn+8/tPez69hW
	EivTu7OfPP4tYCx1iGanq8idgZ8p6JSyKvA6tEqfH9L7qBYI8B+7JNFsSmfbnMK4O3AOHlWjLt1
	gO3th7xRyE6nSF4rIyoRqNpoXcakkoo0P0bxZ5wvTjhoypsEZjSNtWUpvjkmYfsaQUDttGPXD0U
	ascLXZv0yoejnPQJViH3mpxcgv4wtEoSNpH4ttT/+Hr0CN5QoWpLGRGjpCNiAnyf9T69qCgVR7j
	F55qs=
X-Received: by 2002:a05:6214:27c9:b0:89a:4449:ac0f with SMTP id 6a1803df08f44-89c85a4d900mr144852216d6.4.1774262995470;
        Mon, 23 Mar 2026 03:49:55 -0700 (PDT)
X-Received: by 2002:a05:6214:27c9:b0:89a:4449:ac0f with SMTP id 6a1803df08f44-89c85a4d900mr144851996d6.4.1774262995099;
        Mon, 23 Mar 2026 03:49:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de0b2sm479337766b.34.2026.03.23.03.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:49:54 -0700 (PDT)
Message-ID: <925fc96f-5e33-4ac7-9595-277a6ce3fff9@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:49:52 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
 <20260321-asteroids-v1-3-4b902901cb49@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260321-asteroids-v1-3-4b902901cb49@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c11ad4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sYhY2sMgwC2GqzHfdbUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 0qIZo5v9OtvhrnKchr2Gg-3VWfMVpLU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX00w7Frcsbufl
 nN/FzSvpHFc8HYc3ASYXy7fAxVOrQd5PF47JBOL2NopWCXRs+w4DmXghyd+6VdteH86a/Mg25Pm
 LGj7ptYvHxG9eaEKsFJoyWwwza1wKgNCOow4xNQo9JibxTN72bcuGaJFFIkgGdq6mJC0u/Lyc47
 q6RQFyS8FYmfTWYljCSL96ZLJ6xREt2U3LWkPw06EmviLGt35aw+QPLshKTdcvUmXM6aLavkEaS
 pNQlSkmn+mVYGT4WcJ6KYhZq7ZkYsJwB9LJwfN8zbBzIeejxIMiLtyst1o87z/SkNsubSM6Gv8X
 COs2o9fQDR8bIHwayaLmA3SoqYlS5IfSBl8b7UMgj1urcTMAlLBboWJcRGhzILKSMSh3g63C6FW
 1pLbJsZKuTyECHZchemmnKyzD0+/zjBIrQ7DorM1DYNteQvIUQ/bdgjP37q4P3I0a/tlF3DGNHE
 y3JVIdItjrfD0TeN3GA==
X-Proofpoint-GUID: 0qIZo5v9OtvhrnKchr2Gg-3VWfMVpLU2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083

On 3/21/26 6:00 PM, Alexander Koskovich wrote:
> Add a devicetree for the Nothing Phone (3a) smartphone, which is based
> on the Milos/SM7635 SoC.
> 
> Supported functionality as of this initial submission:
> * Camera flash/torch LED
> * Debug UART
> * Glyph LEDs (AW20036)
> * PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
> * Assistant Key, Power Button, Volume Keys
> * Regulators (PM7550, PM8550VS, PMR735B)
> * Remoteprocs (ADSP, CDSP, MPSS, WPSS)
> * USB (USB2 + FSA4480)
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +&usb_1 {
> +	dr_mode = "otg";

This is already the default (if unspecified)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
