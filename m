Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F81E0E14
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120060; cv=none; b=DQmnvdDGn5Ry05AfgKdstccb5r6YFoGMaFyw1qmI12fvpiDt0eRR/GQDcy5Sp+wRteOdYFs0qUefXkvaboIioCWssGcVfHMAp91Xst/2TBRrCkQZt0xRsCrI9ane3jSlG9MNpS21lWO5V8w6sH0W5y0XInnK3EOpUW387a5CTaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120060; c=relaxed/simple;
	bh=wx4f3s4Q0YmmrDaI1gSZKZ7xQGorvJMnNLeIPYRBLW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIyz7FMQb9ENGxV3neInohWLi8c6fLSSNbik4XnQDJYfR3B/p/On4CqxkXgLBNM+DyPNqoSf8BEtPwj3t3sYnYxq9+17g+nXl7CDDWK9hIm4Y0kPWu5hLXt1xkebY2xarYtKStUGzBlll0Vtw5/G2zMTp/A1KOixfsdXFnxL/Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQP17MGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAz926sS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQP17MGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAz926sS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324Qxt81551728
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zn0ULxxINqSZTY311BmgCi3uX/AWPrKs6tXmK2YVbzE=; b=pQP17MGBT/fQk5M6
	pCADYGH5IwiUjrQGoP7be9Q6K8RaycbflM1dpsw4ldRrEC2cYQTYYGoozNDzJDGM
	lZfGLXOby2TEPbN/5NVa89aQYruI2jYNtP3eW/LXMJ6iqkOSnRGsFTqF3i0d11JP
	gtbSwIImnuq0GPdrpNSxxi5cWfIYNiL6IBqrimB1xZJhhTe+RoBh53VKuSan64eJ
	pecQCIgne0PrDWrtQIZjMofcqhtegkcbq2tCtFueXoW6DPK8Rqb+qT0rOWBLKdI4
	WSHvXd721MpnlhB0MO+dWTSjdj+35KboymqrOMkXfk+YChhn5/c9rcgP6Y7GT3aW
	1J4elA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9hees317-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:54:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so2697886d6.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775120058; x=1775724858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zn0ULxxINqSZTY311BmgCi3uX/AWPrKs6tXmK2YVbzE=;
        b=QAz926sS0bGnFSr2gaYIOD3OlExlEFE3SPorFljsnvmVqXWI9xnTCUP/IvQd+2GwbO
         W7dG5mcKjr8Ty2ldd/tRiGXlEsFyt6DaOjP3QaejYFgAk+JC78aXQnpXKJjdBiK0s+NF
         cMcIhW0dvm1GSm+xuI2dl0PT1BSoFaWCof596TvMMk4zvxWf+O/wDa2IYTmjTaVcqPLY
         LzcTHRPfPx2bHeY2txpAFSNuYj+GQe/tUH0tteS+njrIVtkhxzBADJkdH7drCS8Zs7bY
         8QVYEWRQevLybx7DVAGI8XpHiGh8mAUj8Pfl59eRUgWFcKfZR6CBlyQ/qIFoT4wH6mbg
         WwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120058; x=1775724858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zn0ULxxINqSZTY311BmgCi3uX/AWPrKs6tXmK2YVbzE=;
        b=JdIW1p/Bvo5FTOpsjiNVMTNE9cfkGOljKybA451VSvPLgHRQeEuC7wbudeDZA7ijYq
         OfjgyjHr8Pbc5/SQEJFjkf9M/DMdSpFslUi8VcwxhetxVsceZxeNB+DqO18MyzNPRQKQ
         2O+KihxpZW8RaNW9QrteXy2FSVJN0/bhJoWrfsXuzgdSeWvu4aPKnfj3OzwnKAuR7fxB
         paCSgV1qNqFw+VlZYHRQjfT/2/NSIK06DxAm8hk76SLnHuv6UVl1aczU9s+fwFuqcmvd
         dR4S7gQrqXwolVhCMQDwvkipIZQeAP9uAAyOFjLCqWDUjriqBy+KYuv6FBg1LO7NRrxs
         tmIg==
X-Forwarded-Encrypted: i=1; AJvYcCVkuW00yGKKTmOfs6/VHTdYWUvaMXx91nSYjl0/nIoZAIOLnwRTTHLFAcDU02oB1HRu0AqfFRuOmDxp@vger.kernel.org
X-Gm-Message-State: AOJu0YzByqEFV8JlucAbi4YbCVAcjFmK16e5KuDBxF17fPpYO8EtSAvv
	6t/JYFa9m3zXE9NT7KvhWKJsNx1oAXdL5/yioWBbosQBeBsi+Yc8bwUCbwBN115f2X823uRM+fx
	yIL5gG4RcNcd6qRP3keNd5A2BlXTdQUHLCPtQ20AcXjzqjuB70NKCFDQyOtcR1OFV
X-Gm-Gg: ATEYQzwFKj25xgpTPJSnCdMWf2vZ0HKekXLy6NlFiPnaSwB2BV6VC3Nm7oZsqnwgyua
	xbfEvaLIIfbeZeOcXNu3dR/68DqxN2IpzupMtCONf89OVxXvV2IU+ofKK2gYBb3ck2c7y1IsL5O
	hASJM3kOJqA0Q5jgxdZA1LpfKd6WgjYlcA9VOruj9iz6beigr0pcYNTfCSzdN2laCxwqrOj7h41
	u4afsc9K/XCQl5nCWZSFHDwkjPMl06+OgFDZ48k0ohj09H88za017eYl3KKUmHMvHyjx5sjOcL0
	5a/M0yReIO2fEfqtTGfQnk13OdcAXIv9R0sbLvAjqMS87qO0SW6yx+o6eVU7AzSgBVD3bxWLLpp
	2Pk8jsKEnFUSLb0DbyPs9k7m1O4NiW6GG1dy3DRFNKlThr5lrwRExChJ1wfFa66Oj21PVst+WYu
	+80Jw=
X-Received: by 2002:a05:6214:627:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a433f48ddcmr75645466d6.0.1775120058040;
        Thu, 02 Apr 2026 01:54:18 -0700 (PDT)
X-Received: by 2002:a05:6214:627:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a433f48ddcmr75645156d6.0.1775120057621;
        Thu, 02 Apr 2026 01:54:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028995sm67009966b.57.2026.04.02.01.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:54:16 -0700 (PDT)
Message-ID: <4e06e9db-e805-4505-b9ee-636bca9a00e4@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:54:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Fix ICE reg size
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
 <20260402-ice_dt_reg_fix-v1-1-74e4c2129238@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-1-74e4c2129238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8BRXpr6sj7ki_hY88Lskw9PFwGbPTpJs
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce2ebb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZzotxUy_a8Dv8lCBXmsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 8BRXpr6sj7ki_hY88Lskw9PFwGbPTpJs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OSBTYWx0ZWRfXwAC9lsq25fVL
 PSBCIeoRZ804Z8m6GIUfWXBN1zwj+4rDMQRNbzvfMqWVSYS7GaFiGykdmH7i8RF/+IOfkh5qVby
 7zX5szvkd6QHP0+aF6gTzNiTMYDMqrnfkr8cb47zwhoMUK74QmriLUnseH3roegMQ56fK+2ssnI
 5WPw/f/VvLNnsgKFvVMMxt48yr35ha28nILluUFyOOVuWlKgCiQzMIDkma0cIYH42Ju2TLYXMlw
 vmRYYemFxWpn5+man3jw1lOqMBJoJFW6oB0hpHyR2wrtMRTagRDF99uUft2T62jVT6BqQ3Od7U5
 di7hGguUp/fS59nCtUjoqISS2TfqowA6yuLEfo1DgJwkyOv11VloW3T2U91rDowSnLY2U3WMdAa
 AVBMI1SxnxGb33yN5pXEMFgrwqBUvN9AEEk3SIA6nekirTgnX4P9lb447AC3UJVn8TZ3ukvd7vb
 kOXetri1A5hPZaEp3SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020079

On 4/1/26 8:35 PM, Kuldeep Singh wrote:
> The ICE register region on Kodiak is currently defined as 0x8000 bytes.
> According to the hardware specification, the correct register size is
> 0x18000.
> 
> Update the ICE node reg property to match the hardware.
> 
> Fixes: dfd5ee7b34bb ("arm64: dts: qcom: sc7280: Add inline crypto engine")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
