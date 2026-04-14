Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7743D34AB
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161739; cv=none; b=erlX++S2UuD0lxapYiviK1hsny0UVLWbm3e2AiZElYPYmbmd0YQln89IP6bEPnoNkqwGbVjrByvZn79brEIObH7K2D+ZoAQ4wy/FfmVktDQKsq8QElQOzIUpUy2cdr9jeo3Uk99mp2JSDeLt61J6l9nOVAMiV1e1FtrvARV/2oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161739; c=relaxed/simple;
	bh=haVjjjJfbw4p/bj2YwUWhOLprsRoHljMqCDD04fK4hY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KP4jvNh5SFZZK8chI1oebPSqZHTanFs2EIvb5YquLba8TYy+7HcM7TSkIIkB+KYb8BaY6zIBzBqhKKgQLlB6mztmxO/NV2ONQPNiMEqWAR+a2jYJ2snmopt/OZn2LHYdkeCKJmsk3EIFIXhft0fa2JUJW8n9/vqzquCAN9uJynE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEE2iNU+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0iXop96; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEE2iNU+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0iXop96"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XfJv3157473
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmI3HB20Mk8H6+sF1ZHDz0ZUrPr/fmSvEjq0l993sDc=; b=TEE2iNU+EESFipYg
	42Kd6w2Qmi137+uobhO87GYF62nUfNHBdTv+urdGqTJgVSQclBxdWdYM8R3iCr5Z
	3UDhRDji13n3GhAc/YaYMg9flpFmq4ciXpIDhnI2HDUz90vuBMCyw2+SSRzoJjkl
	7od1xGF7PLmBiPP27rd0UekQa9R8g28wTTcR+bdHUvXcxZBoHV9WVIlVZ+KK35y4
	4ruaVh0Khesezs2cyvrzZR96/pTIrS2R4IEk+4r1SSv9LNjTlJHVMboa6vFlG5YV
	mMdXXEBu7kIVRKdAY+HgL5I/QBRZo4nH8vOmVEeJNfoA2YqlvuRDelwXtVaeoESj
	4AGd4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ba7yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:15:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b9074bd42so14818651cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776161733; x=1776766533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmI3HB20Mk8H6+sF1ZHDz0ZUrPr/fmSvEjq0l993sDc=;
        b=V0iXop96G5FFbb77fu4lvZ57tqrEPNqx1S0+MQyNrIIMY4J32a9cROJZTSHIpqdLnD
         zE85je1lnNqI810K3ihEb/Nvse71g+tiEUZPvqn0btunuNY5XdRNDQFVN38iM/UPAoFS
         5+ArGviY7Dr6JlXcCHczOZigm6MHdgoKdC3/cmmrgR4OqJxW/ivAa+p8UtCSo8jztLG4
         NJitf5bI8e7RWrBLIMO/YhxABP6Srk7b/SBs1SBz220iqBwZ+3+lJqmsd9qt8R9cVjyo
         iEO3qKumH1we6E9+mcA8SFTP4sRhko3Dk3PvXTtTR+epMMLORZIzhmNw6SzRabq1m37w
         wI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161733; x=1776766533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmI3HB20Mk8H6+sF1ZHDz0ZUrPr/fmSvEjq0l993sDc=;
        b=tSs5qMa3MNPU5FWP9Nem2kgf7Qdsko/DLyvcikxB/7tOORxPqgyRH7NkLdFOlKzeb4
         2P5zLnWObDkkPULuz5OvrEntG8agvvX0UQQV+lp+DSDJQvb0yaIQi3sIawJi/GhTSGya
         FPOJB8Nn+O9uso2vjKOIoukGqxxbJmgOhPBS4SkPC4O66RBPdz4upxac0g5gA15XRF1Q
         9MutNggIkUBa4AWlf0dTbJnA3fryJeTqZCMI5f8vuWLTdVELVCtUsdG8CbQUFBL/OWBr
         YSkqi7E5i1u/opHDWR98NcWMUCS9so2hwFF8mZe5SXh9+j98zJRNqgon42/B38sM7i8t
         tGkg==
X-Forwarded-Encrypted: i=1; AFNElJ8bY5434zVf8U/x+phr3KzGvdXSjtHXROgRfeNlShaEhJz1ff+bmJDYDKjeoZOEJkZ5e2ovBwLCS/sj@vger.kernel.org
X-Gm-Message-State: AOJu0YyAlEdLNbVSpSgVlizoE7XNQ+hmsFQwN+xHh0MtstZABDDLMz36
	XWim9uALjrQcR0tfOiEC12o61u06KBmWASTc72fUrYleB18z5p6QUN/3M79iIOBRykBRJYmTBl3
	5t8hd8gjs+GuKms9O3AG6/tenQFcXvhTf2IrF04kP5eujLqcJMUXpe0ZWp7O7EbHWYL+Q14x6
X-Gm-Gg: AeBDievo86mzTDhcMCLuifRWNk2ynAbbhDpQBX/yPcvH5NKysuIM88WWhcGDmrAqE1R
	s94JhUQtL1PRi46V4/jmP+Vxn7DkqTKchoRCliBzfc9KQXSO/rd0RSOUr7mLQ/NVYSO+gqxPeFc
	LfuhzhPT1B22A8Gylof3x8lCeRqflFCwhSQssIImU2U9aqnOw63BhJY/JVBq5XSTt/xb8YWnqER
	X1BsBdKe3XrOC+8x4pBPe0WHRb1zn9INwfp92eDIKHrUoUQv6ifCTkHmIhHghaTzNEBemqxzRPO
	YRNFO96H6AUiMyyksKNBn37h7W+Tixx5hUQ7bTI+B/B/jdYfsXf14C5FIxhaybfyoikfV+bUUuv
	jdzsUiiQTir4zLehyuf4jkWeXKp4mLffurz2RNcnNXF73SPTYYVEuMWnECnSHW6xke+aTDpwoNn
	ftmLl0K6eSDUItjw==
X-Received: by 2002:ac8:5949:0:b0:50d:714d:e966 with SMTP id d75a77b69052e-50dd57f6e28mr168877471cf.0.1776161733136;
        Tue, 14 Apr 2026 03:15:33 -0700 (PDT)
X-Received: by 2002:ac8:5949:0:b0:50d:714d:e966 with SMTP id d75a77b69052e-50dd57f6e28mr168877241cf.0.1776161732724;
        Tue, 14 Apr 2026 03:15:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671fcb831f1sm179629a12.11.2026.04.14.03.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:15:31 -0700 (PDT)
Message-ID: <48afaa9f-006f-4b1f-b847-099bbc73a0c1@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:15:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: kaanapali: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-5-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-5-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NiBTYWx0ZWRfX00qrR6HfJYP6
 4uHwT20uu4fjYEWzkLjjOVAo0nXte+VHNsvrYR9DYAmzBhIB6HlaqGLp7ZAzpVuRlo3AyaZ8hpr
 C24NaT6lP5ajf4UVbtTo4J4GjanqTKkCGHsnWTxN4W+7Op+i9FL3RlclV4vAm9GFomLeSGdhgHo
 wl+UpQyYGX/fJoBgusV7pYzQMQzAw2doKVoeVkj0ZyyixNFWhSjGMAXioWT7xY+NxWEBDu2mrT2
 HUj7LcssHEh4y5ddK4+nitHf+GmlRGBBZvLzRZdVQn25N8SWUAUetoB8GF3s3B+xG95bXzoOeKg
 JpST97+FkQt6dpqyRJKRN8dr+rxnmTmWSAJ2N7w+rAfla3+qeW5PxsZ6BH95Et6sGx8jE0lKNEp
 NdxVCvOY8ev8hLDIaZAjx5lEod/x7UOOqLXAVO+blRSwKrs9qRquWudYrHkJji3SqkSBegO4NZb
 QpnKpcfTpsDLBZqQnjg==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de13c5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PZpb7m4AnjRGDnRZipMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: R28JvHq4Acy7hAL94Kg25x_jWTOLjhO7
X-Proofpoint-GUID: R28JvHq4Acy7hAL94Kg25x_jWTOLjhO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140096

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM nodes in the kaanapali device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
