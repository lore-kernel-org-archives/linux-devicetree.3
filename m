Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0CB31985D
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607639; cv=none; b=Df09QOpLeTyonYsFIXIFspxGnsTs/Nq/ujMD9946stT1/gW598yXvjDkiVxoBkShRB1yOPc/yCjQZypNx6QD/2VkWIefLPXSzjaFxCPYqWcgtm+akRxedHQbwUNRxdqcdpgBX2s5hyZDk/ULOODBbcRBgSEqOLKq/LEeOV5GaN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607639; c=relaxed/simple;
	bh=noV8GPXQEbh3oPCg7ukPD94RuXQaEsZtIvjBMPtvyHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCPVAEAASQ5XijO1aBSwUHDveA3FR0vrJbu0E9+NQZDj30Z4idn2FLakiJRkT10l+f5Lcml5xmaZR2PC+8yinSG+nLxaKqL0b/xLUmSPJHdfwlpxewkzM59mepPRMoBEu9VieAJ5ENaoRno4XMB6IaT+PQRv74WFHczMVLmyjOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b55Ly0sR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwR6fzUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b55Ly0sR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwR6fzUk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC1Jg3256237
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g9TCzJnPYaTh3bi8cG95ygiFsTbmL4ZOCKU8a2MS7yk=; b=b55Ly0sRBNMtYgld
	Cr8wJrDRhEiXjpF1hQ2Y2CA7yhIlBC84x7vZ0gKuGggvVSecsIdrlkUgtqr25B5Z
	Q1vqUH7JG3r8dLuGK1zJTHvSQtlM4nMNGB4fM88sV3GVeKi/EJqUB4oziwzsUwXP
	o2weY1MQ3mSZl1998lCccGvyfJciGgTKI/4hYDj+VSrwitxKCu3YrgTQaH9zYhtW
	n7Y4KzbNKy3lw/V6ZubwMcqcTLrS2GBESuD6dzS7mCRQ6KEZpr9ks2eIoUrVCoa/
	CvB5uKIKtw0wtGQqe8sTGsdAuO/SUTI6jFswIWssSzUk6ZhypGNqrNxg4M4jT5Qj
	UFdGRg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9bpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:00:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce360a385so9705786d6.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607637; x=1782212437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9TCzJnPYaTh3bi8cG95ygiFsTbmL4ZOCKU8a2MS7yk=;
        b=ZwR6fzUk3xvC4/h0WtEUaV7qR1IOeJ77DhATUzghru7UYpaty/ZAxAV49utJWzA99k
         dOfyTvuqb/KQ2zWADIWyabLRrtnUUYGzI8U06BawfPW8CiQK+/XHoqdE5o8yI+bBwyfp
         34uITLYGIg1odurR0sVGo2ywXOdR+/R00CLJMo8FGA280ZNPnvzCtLbBUsY7sgxU8DIE
         gFTiFqzTxi45ik5mPua7at2xpltA5PYJL7hAs8qj17BQG6oDBUMUU4SpNpAYb+Addvqi
         jOtRsi3heVrgCMThQ5+GuZ5LprXv6jRo26iosV7nHGbFkV6TceeLQDXnMAO/hZKEeR+9
         wfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607637; x=1782212437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9TCzJnPYaTh3bi8cG95ygiFsTbmL4ZOCKU8a2MS7yk=;
        b=WwN8aEOq+MUn4Q5IkOcQU/6iA0NCnDd9bUTrUyzB+jky15Z7p1WnraxdNB48AOkOH0
         DGQervdUeTC59cdh8/d5gx/f7fb9tEG9ikGBmENMm6B9qu1KuKzhLeY4U0CPhlMTe3wK
         XeWzLEvH5/euvnIrudPcEsYu1fMDFsojudlXU9qFXY5taFrKmj/LPclmTBeGpMJWYcIx
         lrl3x/jGWmD3UvsvmJxNpMg6FWCdX3iZJVRICSa05F5se/+nyUrZhMDbHYWAewcHyNbr
         +Zf6muUQmu/locaYxOjJupT+7KpwpQqQRbMbwkhmSp7LGCNzZfGd9RQsFfBLIH1fKXm9
         ITJA==
X-Forwarded-Encrypted: i=1; AFNElJ+vAEu1efAK1D9FkQ3CqBtEKS4ReNTQy+MdbmoRNhAHwHLVHH0t5FHvg5L6EuPAKH10AtYOk4ZD3H1s@vger.kernel.org
X-Gm-Message-State: AOJu0YwUb5wYWo6TnOOVdDFhnqMZFH9yaW/t0YsF7c+HSFR4wcfJ/1CP
	MC8d/DRCuk5MxUcZWZzevbut/tG53yoaD9p6MKakDlgSG7WKspT9xLp+F3CkmF3EWBtW5dHet7w
	Eqbui8giWkKJON9w8I1UJbBm5TcN6722xT4y8ogZBYD1xqOSiU6O7xourKSqKmJmi
X-Gm-Gg: Acq92OFfVcjndIHbGVuyx+nLAd/c/m1pEHq8mqM/dxyNa0FV0JQQ0piVaE/au5wT0a2
	Cw/2OrlIHCcNwyJ6lMmgPIzaTybdNzdUWg6FhEK9QXBdQ2NjEhgQfiNQN2VLWJT/0NsO0RCvzQr
	FzFQ5xN/ruAA4PRPWI9d9zKWfyqDjBn3HxDzIMnHzdyYQMVY1dY7TIGJCdhEblcTh9pTTX+0vL5
	LaTsHW/oueoYxkNUWNGoYlYnYRUIWebRrdPEWdaVUiYQTFFkAiYDqd3GwADXFHg+tcXpGHRtmA+
	DtVmv/tJ/I2QTQs7Ysc5Kde2p9UfmNHw30xWUM2W9vEg/WJCM3LMA/k5n8kR3VE+I8O7QAc5b8V
	ZyxgXGsNPqDpg+s0qP4qgxrAGdWnLxTd8LdZ7pF7LklMpdA==
X-Received: by 2002:a05:620a:ac04:b0:918:588c:d095 with SMTP id af79cd13be357-918588cd103mr1082013485a.8.1781607636994;
        Tue, 16 Jun 2026 04:00:36 -0700 (PDT)
X-Received: by 2002:a05:620a:ac04:b0:918:588c:d095 with SMTP id af79cd13be357-918588cd103mr1082007285a.8.1781607636521;
        Tue, 16 Jun 2026 04:00:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16915dsm3484068e87.19.2026.06.16.04.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:00:35 -0700 (PDT)
Message-ID: <0355cf52-b9ca-443e-88e7-2e7457e4b576@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:00:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfXz4r8B4ZgfGRo
 SbRDlE/vRn8lhJhGb8ZUMB1s+6/ErFFpw1atN8ruISXwWY877wdjXgQi1z0RntOaBUoawBnRdcg
 MPVGdQ6dlqkhXbuGj7DD202r4CtfhgQ=
X-Proofpoint-GUID: iVbE4pzyiT2rst_-NdoETo-f11KtCJdA
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a312cd5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ESxSkoLR2Ta5atZaLGwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: iVbE4pzyiT2rst_-NdoETo-f11KtCJdA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX47ZJ7+w77E6q
 OoQgX+Ae5aT72Wk40Llvhkb7XxwNh0gIv+JnL1cZzH+FdhwXJbIM4f/4x9RreZIImXlxXbXh9R7
 rqE2SLQ25AJl6Od7GjUC4zws8ORMFelbHi83Ek1i8S4uAjLutKX8lJvmAg2jS/5aHqA4U1JEh8z
 pyC9IhIbe/z3SXxdR2DE55JoIu1NhKm38KmQGydcCNg+1C96Hn1y299xblxGa689AWsEhoC3tot
 hz11Gw3D6lg7pydH9oTkaWlk1x9yoe9ropHpHaVqmjSgSW2fxjA99+BwsbCU5SkpIocX6j2TH+O
 6cUR9ngqH7/xyEGabm3nAXkRrwmh/T7L7bY3pB7ktHqNiLqXc1JZ0ydgt7qmEj3tMBj/C8cPubV
 nqyRbESFuHuYfcqHDAQqw0bjVF1gENIIQKdPWTA6ZXtkfSJLJ9MiqKYStCjYV2LqE/vaCNd1K59
 rjj87yPptAA2hg8KPgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160111

On 5/26/26 7:12 AM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add SoC-level device tree include for SA8797P, an automotive variant
> of the Nord SoC family. The dtsi covers:
> 
>  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
>    for SMC-based firmware communication channels
>  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with UART controllers
>    using SCMI power and performance domains via scmi11
>  - UFS host controller with SCMI power domain via scmi3
> 
> Also introduce scmi-common.dtsi providing the firmware-level SCMI
> channel nodes shared across SCMI based SoCs.

"across SoCs with GearVM firmware that utilize SCMI for resource
management"

Is the scmi-common.dtsi actually any common? Are e.g. the interrupt
numbers going to be stable?

Konrad
