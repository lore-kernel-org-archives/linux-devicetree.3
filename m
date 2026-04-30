Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAD52E401
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777528693; cv=none; b=F7iLd93QshwUnZ7fp+EbLXEKdvUa/0I4jh6W6FfsBfrflZLvjLcYEGGF2RrHnXjy9ujx4LfiK1/St+njKazKAiz3wP+7ZnkWdW0iA7ZPlbov4l5ayBCgb/4nLpcze0OPB3wyeo6ty85+fwZgdm+Mr3MpyZ69+Q3LQsuhgRTmPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777528693; c=relaxed/simple;
	bh=t9cXcyt0z2yHmYkZ44DNTIYbLWTfQIg1ta0VpGKMTk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOZfvOWUzf1bPX4p3Vg+AuXY9SQhSKtUiM/slFBiPqJmKK987G0PhK7v1CDk1ps4OAyuqGK8Y6264VmtTOLyvbNbrnLfP7kEduL0WSUh/OXTVlKY78dEzryDEn2s7SDeDobbs2x4srDtCCaOqu6/poWUm9x2n/CGzSrkcU+ZkOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOkdvvqF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ytz3YwLv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOkdvvqF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ytz3YwLv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TKbIA3255367
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N42TpL/Mv5cDad7xtlaN8zH2kvLnL6Ebp9znzF+M56I=; b=jOkdvvqFmg96sXkc
	yrcRaa5hLhfTvR7HWeapM3Gdcy0Xj3Q0+FgakOlknczAuXiCIwYt1b3RYqSZkj94
	BHovbkGEAoQJFlESWJXS7Vro3dZrKHAER4wC7hsv/ZTeX+nT4/H0vUdyWHbIJQN7
	c+zSCva5zBJRn24elNsQ18GMG9Cwl+PCb4xIjpWDFvFGtlGaaeV3NmHLpA6iDYIz
	XdC7DplIfrkeNYDChZXCUz2EasOdd4YG1X4VtpU5OtAvVQji1EGoe0s2UsijscHy
	ymALlauFqa9AiGPXJiBUc8aEyUIc57oh4AAPACfr9Dd1aKRxhCSaV1O1Y3Dd4uWE
	tW0TOg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71jgtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:58:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adc527eaf5so5079355ad.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 22:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777528691; x=1778133491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N42TpL/Mv5cDad7xtlaN8zH2kvLnL6Ebp9znzF+M56I=;
        b=Ytz3YwLvu2IROgnfnbmQ7VU6I1LWLcgtklkgM/rmf+bX7DfpTuLpcQvf5NQDf5dlce
         xQsJHQItvNJH8vZFzGhj9kQ1I8JL8fsu9onzUDRf8bZD52iWl7/Mk39BbBOt/1U+DZG3
         qRpRZN8dSfsIFYDaedm7W7P9TCs2enyu39UQXhPdMBszA0fDITB+BZG/S8bH5Dnnej2d
         q2U8FoRVMJB7ARgNZ19/n88s2KMhhtAHG0Q4OOAauRB+yMSSaLwgiKcuBySNNjBid5kK
         OtgOn2RRKAt45lBHjq/Y958Gt6NbyCzZtuO/mjjPyCYT0BhSzOW+dhJZQ0wVxvNiN3kS
         qpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777528691; x=1778133491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N42TpL/Mv5cDad7xtlaN8zH2kvLnL6Ebp9znzF+M56I=;
        b=RmmlGiVdrK9CRNWDZ8EjyKvZNcCrdngo1n23azZRXr7caRLY2dSS46WwXkAQyWceAP
         AzuuNLsGf/F+tC+WQxwTO8I26KQltue1Jjn9C+aO7h/Pum2aZl/JYX4Hyn2/pVkS10WC
         4JMHou9oUp4W2vIsNhb+Y3pCU+nVLUpvFAB4D66fw8qjVq62Y4WQi45nZwXGGtF52t1/
         4GAnQSphpN3obLjYhmL12iglL/s9ZwdUw4/wZIFE9Fu/WsPHWg5rZC1VJcAZ8tFl3XFl
         R2s2l8KL56zPLMWlUWqnylMiZjWqsiqIU27U3MuzgI1OCR7ABFakI7dcDfmFDLV4sbQl
         a+rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/t3/ZvSGnfnz7JEf2mvfmoQWUpwGRUQXKAsU/6M+nI0i0Y/NLu6RDjsJ1q2TdSM7kgpv7but4E71QA@vger.kernel.org
X-Gm-Message-State: AOJu0YzJPPm8eX/9XRBLE+CxMSIHd1DerMNE7dFFEr9oZhFzXcB0eLBX
	5EJWAlQSz+qzUc04JJAWuw8ijQE73kU9RImEbgpZ0+farv9zwoozrw4L2pVYc6L7QNhMd2OdLs9
	/7lz04dXK070vo5VoAhShFrhbJJ6jB/DWxxRyREmXcPXuGpv5gbDtrbzNQ+ClSCay
X-Gm-Gg: AeBDiev1nZXoeI2qopKAisTzsv2CDK8GE6pAR8WLTqPy45k9TsGQRoECdg12Twi4+st
	DPXUArbU3DMCPO2K8OfIO1F7PLtozEREdhZE0pNa5AlC+hUDvly7RCQZRpujkSrWXq1DuzaVt6S
	wv2DvRnmeJJw/Dix7Z8e62zcMd/G/4zGjzLWVMvRy4V3yGejoQte5Xetf3rk4hCcxf6/scAh+P0
	qmmISz8qHL6qtPxJdsLI/alGYIxpf9GwOVD033VOUWzaKyLkbG2064gqwX0RKUfv4z9Jle0kd9V
	F1U+9YQoun7AaHA5SDH21F+/CXKkUZhEn284N2m9nQDE0KICf8M9ZTMCwUADvj7J4zob3PBgXny
	GLP32tSH9V3MIFgbtxt1HJdQ0QiOhOOoMG7XSUw8+Xd4Yl8cicAFDQoJqAFgU64q1
X-Received: by 2002:a17:903:1248:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2b9a24ea28bmr15442405ad.32.1777528690746;
        Wed, 29 Apr 2026 22:58:10 -0700 (PDT)
X-Received: by 2002:a17:903:1248:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2b9a24ea28bmr15442195ad.32.1777528690235;
        Wed, 29 Apr 2026 22:58:10 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879e08bsm40357295ad.30.2026.04.29.22.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 22:58:09 -0700 (PDT)
Message-ID: <d007856c-e853-4ce4-a9dd-3b4de2531cd4@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 11:28:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Enable CAMCC driver on Qualcomm
 Glymur SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-4-0c3fd1977869@oss.qualcomm.com>
 <f9148fc8-31ca-4400-a12e-630c80db020b@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <f9148fc8-31ca-4400-a12e-630c80db020b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ddSWtCm-Yhq4GiZPhHxO8bm40Fa9-SCT
X-Proofpoint-ORIG-GUID: ddSWtCm-Yhq4GiZPhHxO8bm40Fa9-SCT
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f2ef73 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_KhGAaAYyJUefK6zY6QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA1NiBTYWx0ZWRfXxcyFsCaLsYnM
 OApepj7dHJrdwQyoIKFKXR4+HRpy89dVAejIHBymKuyBOk60Xw8F/jqN8+yZPyNa6A8p1QgebUm
 BTAtQzKjiFIlAwGY3E9KPl6vZUWWz4I/yTrptQWC7ZTVymVW/hO3BJk/svHQBHXSukobZCZ3w/W
 dQ6CnU0AbSbhD6r6IZSwKgoP9HhLsjp7FPUaDMC5Xc1CcPYFlwXJ+KOn4F8ao2hp66DQdXZ+c+W
 Tyg3U5bmz4LZzkyfZLlHSPbbToaVV8VfiH4+uSw4ZYfvB0wT8kE2mGQPUWFPUTCKlAO/CkuP/Nm
 3e6ZIQWunWj7r9iKL6OPjJFdmtCwwZzU8EK9byBVsm2PUrRIkIdMn46QaSr1ICMCa5CPKuE+O4u
 gJvDtmxUHtmeotIbfzuxscV++KakdKk3/iVN8tnQdX2bHmsolR9x9QhETRNT8pmjPdaOJ6o/JhC
 lzgwwbmmGtcQHbo2huQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300056



On 4/29/2026 8:52 PM, Krzysztof Kozlowski wrote:
> On 29/04/2026 16:14, Jagadeesh Kona wrote:
>> Enable camera clock controller driver for camera functionality on
>> Qualcomm Glymur-CRD and similar other platforms with Glymur SoC.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
> 
> This change should be dropped instead. I am removing all Qualcomm clock
> controllers from defconfig.
> 

Sure, will drop this change and update it as m in Kconfig itself and post
v3.

Thanks,
Jagadeesh
