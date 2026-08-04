Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC42F476051
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866199; cv=none; b=TeQcsQoeF5R2+DUBY/wtezRI/gs1QWGnrHcUuWl9gD5LSYbraZ8d5X/WwA8ffDSD7IX1Ml7EwXKXRkQMlJNfN2tBpqQjY8q6uwMqYjWxGAx3tHraWGVuPPmYfUBmmmA8d9AeP2kRqeyenJGlEPgv7QWXAsfYYXhhwiLLTQbdCQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866199; c=relaxed/simple;
	bh=OuX/C1TtvHCOGmrVIm3mqzAHLgbvc4K8VI0cI+MqO1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9JfCPLt7thFirJF5WtDRfqsXYCRC3qEN/mWL6PtnDXCJN22ni1yJd3o1yXv6lDP1VmaQPI53MlOW012WVbkuVYt9sAqt5ZY8BMAG9SY9p3dQN1Nn6Tq/F2grnaiHtIIYHI8FA6na7ZSGNpv/29Ll7ptlAIj86v0Uz16pLg/kyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enbAM0/+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvB3h3Ff; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enbAM0/+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvB3h3Ff"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfdiA4057214
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 17:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEllbW2amjEC6Fq2iKDcJ/pEbGG9Dwld0bfe6YT1m6Q=; b=enbAM0/+7KAK62OZ
	GdHZhcpSH+V2gELpiyIYQPBNgso4TYVpWNST7F9GpVdmT4YTLPHXmbOwCaLd6+D5
	cObDTUMxCeqHSFTfQpyEBy3jrYEh0OU4Of0TZvPv/Im/53fENkOa/x2U5+r1j+Xi
	izc6FCltOUY0mzWuS5drVnmgQ7RnWGq2g4lNXNTqS/OV1rs1jz3KdSjLytTI8NaQ
	8/PCGCaJUsMJGdifOxLwOVpQzCDD/IOSYq4M7lGVl6gX4rRS1VmF7g20xVho3YVx
	TymT/LTvNS3DO2vGLmiRDfutwBMTLRDhDpVNyJ6WCD4vYi/5jfFpYprAX1Z6kJ7s
	Pr6Ssw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmghf9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 17:56:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso72311a12.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785866194; x=1786470994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEllbW2amjEC6Fq2iKDcJ/pEbGG9Dwld0bfe6YT1m6Q=;
        b=SvB3h3FftsJbWOditUEM4TRb49DIp+Monb7c7O37/GuDV7TaPP2FTY5NDcDgFEFeb3
         lS7onigr+3pi2lys5McgyPS7fHRs0/UlEADHBbNTwLKhaq7DGqapz03OdZyMoNywK4B+
         DbTj6xI4/c1bTWOGC7gHs543Qn7Zv/7HQ93weWphj5wjZ7RSVY3ML96lPeuvaMUesbVD
         kPTmmOzqJN/7uROtpz0HY1ouJ5pmoGUc0ULGg7HUHvEDxsmYuBihyA/XvD2FXnUiddIY
         1LMDAenpYmwAYwYRTevvk26hCr6EjgqayDxzRpVRh+MxfpQt9RjO1ewWVB9hSsMzI4L+
         9A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785866194; x=1786470994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEllbW2amjEC6Fq2iKDcJ/pEbGG9Dwld0bfe6YT1m6Q=;
        b=NVrE3luijmZCj04I4BItVNh5Uo++mNG96yi+C8b3Fm2VacUyaYnHKxj+O0lr7a0gVl
         vlMJhiCUsFhOB52kzOGmGGMeMhrXH90dKEUFgQ4X7Q1ZbfxXHJv/o6fYA/tr7jwOr4EQ
         9ucEFnXyfyYYA5kdCc7VEEQ2gMPZNCiZJhpZ6sm7Hu71gsMXNpEVOd2I6TIF9bXu1erx
         k9cTzAnMWaWvpLOkngi7IEG+m+a+s7IT8nD0BcsTqcUp2w6ayeULvizW4A+ElH+C5sCr
         ZUFmmJdIX8ijeDtC3OKmkKaIgr77Qdr+ONMtgc6keAgR//qfW7WFsT5aOrwHrbSHkfWa
         smQw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9EXo7azXdlz2w//jd+J8jngF3HkP4xWsTIFLtWVKna1T13e0qeeNlPtuBHTrudBdour7wZ1Qzjzc1@vger.kernel.org
X-Gm-Message-State: AOJu0YzctsFUFSTH2KIOuRZE4+2qyG6NEnDNB0CDm2OE0PvFfGFShOdC
	ZBlqztjIsCAq27zLxN4R3fH1zRe/hLsIGzEYRtB9ph4r2psVwuqjpz/Edm1BMy0pTzkRC37/LLq
	LPoj1knLIU7/YE2iB6Jjeivk/RH/TC7qjOsZ7XrRe89WTVmSnAVSuR//7SNBEc9zp
X-Gm-Gg: AR+sD12aIaec1Ka6Zd4RLe/tqGKaQbBR2NAiaQjpTHdw8BArLzESGsCkZmcOGioSuRg
	K4s15ipKe0OwZnDT5vnsdKVHpUdiG72eCpq9VWigi4pWZoK+55F5sc8DvTkKv33RbU8TxI9MxA3
	dUF1ekeRS8D/e7OEiJFXJYePFFuuB+F8/4lbGskbkGrEP/xoyOikAaBX1R1FB+rpcLdlgaccj7Q
	Hx8w0RtM0epuzt1qqwU5ulTVumm2TSKo3YCgMxmZua6Wxp5uQtAsXNgwOVepDXRYTJtVNMzMjda
	4lGS1gOLnC5Fkjn6fRH0RMinHw/cZxRe+6+WnFBKy3PNHKK81xoAa9hC+lwuk10jbEnImpbgDpS
	lV5pGB3vzbetxuHMWbr3XJoq5Vg==
X-Received: by 2002:a05:6a21:a38c:b0:3bf:a681:a262 with SMTP id adf61e73a8af0-3cb8603af5dmr461191637.38.1785866194519;
        Tue, 04 Aug 2026 10:56:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:a38c:b0:3bf:a681:a262 with SMTP id adf61e73a8af0-3cb8603af5dmr461155637.38.1785866194119;
        Tue, 04 Aug 2026 10:56:34 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.27.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be99sm12915825eec.15.2026.08.04.10.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:56:33 -0700 (PDT)
Message-ID: <89e7b084-2afa-4841-85ec-51707a6defc8@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 23:26:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add Graphics clock controller support on
 Qualcomm Maili SoC
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
 <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NSBTYWx0ZWRfX4Um2Dzh+Xjts
 2EK4kXW5U4XuYil3DhKIHCJYqtFRUprQjKPLq/biGRNDVA0nD14akM/9b+VAlVQCve9Pqdik7aR
 m0wCb1Hv5Us/Ekqk3d5ZSKvM9qs3wO7gPQjHfPmGOoe1r6oEN4RzpERQiuL4eN1oY3z4h9G+XWa
 lw4UAUtcT1sLCvPBFiXSGLqYQOuJD1iWKafKd+Pgj81dVWmc4ZtHZ638I94QP6NEq60VGl8OMK2
 BLqhqUh7u5oRfEjz6VTpkRuwIYFchi934wmN29L/BXUB/Y8zSlRPrZBkke93YTIsLihY9D1VRyn
 Pu4r8NEGH2dnkqh3wfRnQOn5TuYs3C/v203SxNnxaX37MpvcucwaitPAGRdhuT+vtJAh5QHZ8sG
 9FgNUELpZcdPjY5fFCMNyuKYxCA9j1y19WZpwNpZiifdCWL4rYsrsZebBKezcOHaIh5hwdyt4TL
 6V5CQDSGeWaUMt5q7hw==
X-Proofpoint-GUID: yCVI9Jmw18pJ5K9s63MrMGEnYNpyc-vh
X-Proofpoint-ORIG-GUID: yCVI9Jmw18pJ5K9s63MrMGEnYNpyc-vh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NSBTYWx0ZWRfX234ptKtCa9Cm
 eUhHhxhC43ZDQsd6VwytH/skqtVsUEknlUd7IPIbuBF4MGSIZJUqvKwlw9gzwHsDHjlcpKKg6zY
 umv//+ZcIwO6USZ8sK2PTc3vrrY9wos=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a7227d3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=oJgQA1a84MxBYcMfCYBOLQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fCNx6FN-KcjCUQZW59UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040145



On 8/1/2026 12:42 AM, Jagadeesh Kona wrote:
> Maili gpucc is a derivative of Hawi gpucc with pll0 configuration change.
> Hence, reuse the Hawi graphics clock controller and extend it for Qualcomm
> Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-hawi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

