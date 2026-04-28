Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293D3D6666
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369152; cv=none; b=VG4/lCnYiFziatJIzzE6UnDMKkjgSeYn9wDlzVjLdwmZBcj/FwWAaabXFj27wWBN+eFvyOrsU35kX6tmdk+KQolDPcL2arBWyWJzt54OrH7ZwoM2liU1bfZhppaWo0hxxwvH2rsj12QshhN3Ph0rRNPDjHSvjhXb3vGHft0pEGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369152; c=relaxed/simple;
	bh=NYZZRu9Vmp57UxGErdMBcdJZAKKcxfcjb13kgumPZAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEp4RL0K7xOSN/fhZUIBb7NtxCok5RdDhyKz6DAwjg9LS2GzFKW97YlWHvWk7I7ddjCc1WUk9i2kD56EFsFXrLLkUexIqY/cFjyTHQBVVC3iqEpyJRWfke9a2I9xDugM+kFcsGsoPAVgq+1UhBGyNbW2B5qXQyfGcI2uFgssMW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tq1QeJja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpLQbo16; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tq1QeJja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpLQbo16"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S8ek693123758
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXoJY4FuJSbe8J5EY9XQhH3+vH7oWu4r6aoUqSiDQTA=; b=Tq1QeJjamUCx6Xat
	Fp+tdEAukEt4cXbO+91oRqPYUeoq6+Ye9eSQTh9dTo4PAXPSqZEIizlXLMdEYw0l
	hucCk1hEIAewhslcRHmFVOsShBnbXvkUTFp5sxt5GIRSar0cVapdqBE9ZeJjuA1e
	YIXLwM3zLNvgYNTLePP0SyN0PyNEEhGLOLPEzNpd/y+MAs8hvYFGu0be9h619HRe
	IWcyoOx14VGQ+OMuTxMgcJi4o6HZePKdM7gU4Jjp2djBpqZ+7Mb5FbiVpAZebsT2
	7mtRI/sqi71qNY/aDSX/bvjRnwAh2V9YdzxDbS+C4Nnvkx6NNmbIu1S+sP9lqPSl
	OQUKpg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgmvt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:39:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso105395561cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777369148; x=1777973948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXoJY4FuJSbe8J5EY9XQhH3+vH7oWu4r6aoUqSiDQTA=;
        b=fpLQbo16XwSN5pyjLto6aF20oolVxgXbh9ANGmNh2CGwX4aMpK96lIRHXowNTy4xKb
         8INQslpvVWwU5TsRqFu3FnKLU52r+npYMq4yJGEJOIMxsHXNXJRlG3dbwMAiYcUgEv+3
         fwbe02ZnGK3EsokdI7tjTML2c7iAVsYubudJ6TvT1DGcH8t6f2e1eNTu+cJcGfZiXaXH
         cDV3ks6iWpcXaJL6klAdcZ18pJ88mg5NnLW2buth5IJr2uwN7F1Ab6R7uL8hWIoH/+a5
         TY+hG5qwrBhhvgJTIbN4tnwU4J84W+UiZStDovF+oFB1n9s7SzxldosLtS/zHcZ5NOdk
         rSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369148; x=1777973948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXoJY4FuJSbe8J5EY9XQhH3+vH7oWu4r6aoUqSiDQTA=;
        b=gI5BMzDy2tCFzFNh5Aa/0F7nazrk8NsKYGHlvSVjUngfAKj1RPIM1wr6uIC8ZR3QOr
         PT1m2+vvsGDjGMMhLBmguIAOV6cJ2IsP87VPEatRinFG3x9wllMBFJGoxLB75344syas
         ztzimVxwlt1KfH4C40oHBuQF1a7MhqkrkWR6oywLuq7pVtD9vuvfw34k8B5byISvAt5c
         DXMMMrFL5M4alPS+QpPFwOm37uKis+UphqYcQYUcFQe+N4Ky3uSSTPEGdHFo7vQlaw5E
         mx2XIqTehYqje/74bmsl7PkmOcQMqZJa/LxmX5xmayBTw5mcHGDm4IB3Qir6efzarYEJ
         Ya1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+F0XQi00ftdQ5j8kjNua9eNyNP8spwE1tuBYaW7Y7UX4AJqPceuXxLNDLdRUgmonPISy3H5pcFlnz6@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmqCCm9B2jR5sQDQReg68ecDqYN/7ylJ0zGudNMJ7Lv+JfE8e
	MbXNwMyjNZkra35mN6VGHjmMYgGRJ1+nQhKumtE7ljaZwfKnrAx4mXGOAfuYUuS9p3YenYlej2p
	2DnSTXfoc2Ckn0svh+u6qidqIyOXd9SEx8mioYSv+eupBncBpJ6/7cTbyPkqtcd++
X-Gm-Gg: AeBDieu8g+vp44pKytP9w18WAD0251GBw9e3gzquypTE4X6QvrBYIOnx7M7/GuoBFCN
	A+hKjLfCCVHRU/clJ/PyXtQxOaQL4QtimEGHWtdRe1kMT+zqKQosOBee9c4KoGSZEgcbQCT5CRl
	eeQ0ed5Oj1h42u0UE4ZQaGsdCjaWB+//zjqXU5yfZ3U8qKsec+BwlhgYb/SdVMPAnqYgXPyO9aZ
	9RqaAw6tV1snkyIGTglIDzhIhCnpWr9it70o3PLgTXw1gV8hfgX/xwP2CsvbnxqCWROZ3GJL+fG
	HMGaHYfKJ665m6JIK26HtwICakYwFkoTa/y2yqJZH+QbwTJKO8CxcRMxNWL45Jh15RU+iE+VgqG
	w1txT8TYoBvaz2DjbHbjlAt4jDbZVLMGO3aenudboRdImgs/2kVk+a8lmyHZBYoE0YI6rLwhbuO
	PrJNp/m4Dg+JOIbw==
X-Received: by 2002:a05:620a:2844:b0:8f1:d4de:57aa with SMTP id af79cd13be357-8f7b28fd1aemr253468785a.1.1777369148318;
        Tue, 28 Apr 2026 02:39:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2844:b0:8f1:d4de:57aa with SMTP id af79cd13be357-8f7b28fd1aemr253467185a.1.1777369147830;
        Tue, 28 Apr 2026 02:39:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67ccc30sm534549a12.1.2026.04.28.02.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:39:07 -0700 (PDT)
Message-ID: <e0736f90-4fd3-4d92-a19d-9f2c2ca363fd@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:39:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Shikra IoT
 variants
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
 <20260428-shikra-socid-v1-1-6ff16bad5ea2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-shikra-socid-v1-1-6ff16bad5ea2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4NCBTYWx0ZWRfX8rTxrx+1zNAK
 unOxqP/cTUCd5s6MvmXfdZmOQWt2qqJh/M9Dx2D7sr4H0jqEKy7nEyJMvMdKFU3ypFgtprVxc4P
 iE/xZoJJ+AMkvb5nz5l3ZmPEq5e02QEiVwvI/r2Bd7HiF1p6LjHB9dhT1XarE1rHsOUDdtOVbBr
 vLaJ8aNAD0HM+r/zUwgerzBo56kDH109b3SKqaCIdbU5Lipppppk4f0CBlLGMyFnOnq0U9p+MTu
 AbIHa1/WYDxKTT7ARLtfRX97DEdz7BqfaZFCFvUDI27+KtN0ERm3cDdqdzvF2kg++OYSPtYWi6p
 DujWQpYR/eRHCtm8qp0qZHY1c38jbwYlvRC8Xkyq+XLUe7Lz+nx2AZjRBkqKCSBdipsvj16JyjU
 c3sAAPA9T1vmfa2Sk7/8cT2MtCtq1H/XH8GLRXMVvS6we9DcfieQLm0Z5xkW/7kO3iBGwdO2BEk
 cp+fD2TKutLaeBZTGZw==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69f0803d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nWrQU3d5iJvTSWghx0cA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: gNmjy-UA_FPZk2GrJq7uL2zSZAnz-dgS
X-Proofpoint-ORIG-GUID: gNmjy-UA_FPZk2GrJq7uL2zSZAnz-dgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280084



On 4/28/26 11:17 AM, Komal Bajaj wrote:
> Document the IDs used by Shikra SoC IoT variants:
> - CQ2390M: Shikra Retail with modem
> - CQ2390S: Shikra Retail without modem
> - IQ2390S: Shikra Industrial without modem
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

