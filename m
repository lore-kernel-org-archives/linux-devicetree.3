Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CDC3F7E92
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355769; cv=none; b=s46DK8oDR6EHaY7N88rdYRx69OMq+0T6bFS9DqiAGRcWDSMtv+kDgZ+DxchTyRo6/gyKCNxT3oBecMc36h3RwqzzLMAw0jVQ8nym7tT0LDepjecGk4w6RVbsYU7uMDpWXfyXhaIItg9MSifAmbaPSR2cFGhhVr66YVXE8yTr3sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355769; c=relaxed/simple;
	bh=kjtJIQPhYH2cQ2o+skD3gjjGR1zxaLcRezoe9/0zXao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7fz+Rtf15KcXyiZ2FcSjKNPVNvMzgVj6TEGv2sdn5oOrcK9ExA0/rkBcsOwulvdofbkpaKZUjHO178nEWS0yKZCA5hqlvB/7DYIS6SAgQtV8Vimn9H+npbdJo3GqE0IX3pq41kXxuL0+xkmkDCJs8tkpaFoiueF97oe8keyEEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVbe/GZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFachAZu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVbe/GZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFachAZu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OAIWqn1909072
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGeBu2OX7O50NzFcmUWCo5UG5InLHDqjYeoLwXPwQyA=; b=HVbe/GZ9/QeJGaLj
	EzPA7g/PgnIxKZIOvwa+XpTlhyld2+ZxSQMEpnhbizuE6iH2lOPWMMqp8iPWSrIe
	MM/Yz4kxksvDgFcPh+XP/8Ahq+/W4wV1CqvV0tFldJifKmfiCbVPdK5O8p0HiRrt
	ruVNId3+0CecWtCY0EB/GeSlkPLU9Aqqm/6Mkh0Zl+nUmgAYoyDkPjN+30WrUBFG
	xajwqAsanpGWzE1MfLFYy66R3xOoiBn36QMJ9TaN7jm2JDjq6FnRaDi8WfpxEMkY
	o16y7MY+GW6wvJoxFIGKyoktS5wuPJfVdwCr1orthceIAKoQ/n9V//+JdAJ+9w7u
	Z2fLag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awyuf1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:36:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b27636835so50541391cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774355757; x=1774960557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGeBu2OX7O50NzFcmUWCo5UG5InLHDqjYeoLwXPwQyA=;
        b=iFachAZu1gTB37NltxgdqTkN4EFilgxwta1lmuqs9EcO+kWZIq7FD3QOjMVUHuQz5O
         SPgdX4iKDd9z2k1OABDJo0yMb++36W/gTYmIarPL6ZzBkdRKRfuWRJLw5FuNK7G2lsMu
         2PwlmpUwQjjml0ZNZ/qjiNypkyqrxBM3Fyjqc2amGYXBb9ta3gBP82SINCotD+mEHNSX
         DsIk17sAf1gulpwj2rhDob5uWQ7T2aMiiZWb7E4wWLjbMBfbnja89X+o+1qq5AlGB9C1
         ewvAH/4DdE06ALl4PRODsKxp8KRjC+1ClIhSSh4QeJQeqwrM7cTSTRtXkxKha/zngx80
         av8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355757; x=1774960557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGeBu2OX7O50NzFcmUWCo5UG5InLHDqjYeoLwXPwQyA=;
        b=c//Xi+LVlFWLUBEEbsUy52OqgoPuan2ITpee0zKvNJLY9wuWHwxpGhObkq8AxmSzVf
         jkEcRuGfzFTrPcnO5NxGskIpSaK+YgOWYo2pvOjtjq5AerWgZaci8hjrz2JKjKvMHZOZ
         YSXtngxx5P1mQUFTCrNYFwQCkhvEhVldcIJ7Y9OLX6wcBsafBxir2QsD/8nvTGtTUdnG
         Mp4heaBohSfFN6if5BW35eklasRHQ+CqbqpfAMcPSxTgxk5qY13lBdonasGG23cR+71z
         17vfu2VFVc3gSktiEZWNsl8A+gQjhH6loJeNS7rNkr3w1YYxFyDmBdkcgrAOYiX3XSTR
         u9eg==
X-Forwarded-Encrypted: i=1; AJvYcCXiYn2x8cIeLSOVu5Q64ddSU/DNwi8GwSHTY6/hXK3mzovpHJasaMYRKCAxcygt+aN66xOykunNj2DW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/xOH7HpOlJcxMHM6bklP+PMsk5CX87yxQrb4Y3Fd3Bx4XoFrI
	OoIXEfoIeF7qhGKZ5S2Eh79w90zVv1gMmIXgI3hrY4JxBXU9Q8UFmytH6PtT/0u2mwmrL68cDzg
	d1MUeAxJh2SdsXRu/NPEkoiwbjrP+B20MKi6Fj6zFrcSGLf8HDhQUJdFEtMFRqz/W
X-Gm-Gg: ATEYQzwjG4cu1EQp+zXSZVXrMwsSxsbd4IHlOLj7nbGCoO2R7XmRzxLS8wWmkIx6NWL
	hKoy2B2e4owTJcHJjMAT8JymSxIFCB0rj5JNPmJQjg8Jub9bsleQTV98FxNkwifXjfX7MDsmfDp
	BlIWbvUDjzFVZ6P8c1Wfi3STY41j2eOGndvzajmdAUim69MTfvCoApNhLOwbYUUXGXJ/LwQYZwS
	1a+RktdfmXqqMXDPpvfF1l0IKbkst+MNXSVSiy1ThKGWykX7UA7Cl1Ff113t8rSg12xjtBH0qWv
	HqVspMnmtjkAbn6ERjL9Pb1fqOmEP74BIoyaHC2B/MtYVC5DKt3fyJrqmOY1GKBVCmE40nqtrrl
	KhIJd7yOIOmidhMRHI1b/SAnLcpH2ICFjdiYQwJ2UE3ujFgwCQV/07uiBZ83xl/D8XbBd2NO3BT
	0cpdM=
X-Received: by 2002:ac8:5f47:0:b0:501:4767:a6f with SMTP id d75a77b69052e-50b37439490mr175805931cf.3.1774355756917;
        Tue, 24 Mar 2026 05:35:56 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:501:4767:a6f with SMTP id d75a77b69052e-50b37439490mr175805571cf.3.1774355756338;
        Tue, 24 Mar 2026 05:35:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983e4e9b65sm532130066b.31.2026.03.24.05.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:35:55 -0700 (PDT)
Message-ID: <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 13:35:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMCBTYWx0ZWRfXxW2z4gcCH22C
 48ted84WhPTpFZitJhvV5KhZX7cqLcyGXsiwKTDoJG2U+wOnzs9gKDYy+66q1CmXNWdMwjRj7eD
 8/8iXi5nhx0SKjBBVihbGP5psxMySsuylg0B6BuVj9vJFaGuecdJK7NqchLDmE9U8PZjNINQady
 yg2rEyy4IdlYHhKr8Sg6od/4+K7TgoXf1B6a63SRYCuN3Nm+I8pKZKD29dey0BfL8bizoru6d8e
 I1XSeQjQ0tT42ebXB961+AQ71gfl8nCBblVSE9JXdYza6anYoJN7Wzc4x7gX5Cs6jKQcgKg0Ew5
 nq569M+ewSE61vJJKWqIkLUz6P9z6O3+a27FUTVhuA++Ltjnp/nyjrcMAnPJYcd8TQ2o0Z61X8T
 CbKbdjQlbU7wnO5uJIT7PtBy6yv97v82D7dr9WaJF8PgU7N5kOVagTNkewqM6qrWZ+vmXml/NFO
 XQYZU2X5g84kMuholcQ==
X-Proofpoint-ORIG-GUID: x_OAWqAMjY-7a72BVI9QndAhRsaLV1UQ
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c28537 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=ePn0xV2wtYfU2OeEI88A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: x_OAWqAMjY-7a72BVI9QndAhRsaLV1UQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240100

On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> This contains everything common between the AYN QCS8550 devices. It will
> be included by device specific dts'.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

[...]

> +	sound {
> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		pinctrl-0 = <&lpi_i2s3_active>;
> +		pinctrl-names = "default";
> +
> +		model = "AYN-Odin2";

Is this enough of a distinction? Do you need to make any changes to the
one with a HDMI bridge to get HDMI audio?

Konrad
