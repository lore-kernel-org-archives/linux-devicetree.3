Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF833B27D9
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 18:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782758422; cv=none; b=tFPo5IM3GtgBGfDccvU/IpW9bb3WmzlUEWMsJf5afFCRL3ylU3FhbmTgkUkBP1R8sb6PFpX+fKbRY9jRYWzEcUiP/HPuTG4RxuiJrKqAULMFGWyRQz+SnVpPoA8Xe8RfPM+0qSb/GaIXyLrnhjK3Kb8d1O6MEZ22w+ag2d49Ay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782758422; c=relaxed/simple;
	bh=q5tOmL4fQXLf6rF97LL5TTgbz0UYUqEg5tRWbsqLlfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nltqnFXcWJL8OO4BiBc6d5DJvGC5J4ugxXXBtCYnG+OMkM+zjQda3fH2i/0rN33N4S2Izc1RhGpTmX3P51+PLZ5Q49GUVNOQ14pbPY4zhTt5jC2ZJHVMhYseMtTXFytao2rCGU4ErOnVKsB0Yy/RL2b880YcNi5xBgLYBl6YvlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPCtJUpy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cpTh0FQd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPCtJUpy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cpTh0FQd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TITBah3765008
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 18:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CffFp0WhGRj+vqvsuwqU3TnnmViodZOWqRxtTaxYu+Y=; b=LPCtJUpylBlNWhDv
	0fxXRaARpZMPwhKF2iYU4JQJPrVJ4CHxfUSHbsGlRYH7GA8iUEc/OPHgQYnHK1fh
	6RLWWHzuDVzHZ7KFJNM8LqB6jiZm89AdLX85iQTgaCdin098Q4mfyUcJPxUuFPl3
	aSajWkgso+hCNB2cZvPakgLxy+VsKmVM1Zz0X7de3gAyD/H3UiQ+sJi4BY/5Fznb
	VcIHb6dtwr3PAdWbWjraUV704k1U5tGziQrbzycM7GloVacTvb2KplJAB9EiHT+O
	ij+6fqEX8nmmDpiFssuBthRdCrTZDcq6wGCozkeIBPl4NLFanW/DczUgf/oAfqdf
	DGm80A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cr1pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 18:40:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c1f6c5559so4000668eec.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782758419; x=1783363219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CffFp0WhGRj+vqvsuwqU3TnnmViodZOWqRxtTaxYu+Y=;
        b=cpTh0FQdl+gPsh2IrSXHUBpvu+zm9DPBJJ7BDu7udPKQqh25Z1WpQet9/PqKTpBYoL
         OrKT8J1p4fqlfMcev6lZBoYVOeRan/dwdsoUE+EXTGerspQ4rjSjS/+mfnA1DSwZAM2N
         5RY3W8U5cIsRtaxGB1nXrdRZYTi3GVxtLl6iDWumJb2aZDCwDYIgfQKyeeQAyOMrCS+h
         z8H7hLmYqOVnmj1fPp/extOH4pGucXye2zkqZc1ZWBSCUA4x+qM0b6Oi1n1nLh6nOQri
         CMQpu7DLlyge+tEqR+5UpTbD5ye0x3pzus5Q2iYSmMoUnB9TU5YbG7+FsySwUh6IrgAL
         /FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782758419; x=1783363219;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CffFp0WhGRj+vqvsuwqU3TnnmViodZOWqRxtTaxYu+Y=;
        b=idP3iH7pV/72MBbj3E+5dLiUObJ5G9DgbKp/KDKcL0GE8WfoBp99+CvMd0RZoSqcOL
         7Ud37IPf5EzCye9eKxPbeVH/0EmwuG3r9qYTI4yaJw3GekxdryjUwtEi3lUGhQ6jzMI6
         VOdbf4Zg2cLMLwri4aJVdpE+CYCUFxu50jGgN3t6BSK0uaxgGIkkxC/7ctW4aAs6fcRc
         HNm5hNte1Bnwao+O66fZ7ZgIVZ0S0ny6YP274O34Sl+3ToVlcscy01QBSyEIP17wpE/2
         vxrcxkkcns9mmj7d/Hfx7SAOYd0Rju37P1BbMfk6rItKdHLf5FimMO5wHcLeOhPLRaEq
         rjYw==
X-Forwarded-Encrypted: i=1; AHgh+RrAfAt8f51Pc9Y4eOGxUKEE5/R3vyULQn7m2iX7d0H70iCS+3Dy0sDoJU9403JW/f3xs09Oy3gnKmQc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2aMjPOSdpxjcAlzXW4gJkgjgPgLF0duvLM6kURkqV4YxI4a5G
	KTCAHFLgT4ISx2wkPWSbwwxTHuBqrbjKOipjqB99daZbBZkGM+l9GjR4rIOFJS03kedjID/8aOl
	3riXm+snZRpS/wpIzTGZ3lpMAZlp4LlzMsvCQbDTUiOVE4FmeBsOi1JhrXFHSRyFV
X-Gm-Gg: AfdE7cnuSkwbKCjE/pY1VerUEmlE8PGlQmbuDlM1zniHkLs1ji/LMnPK32nDThTkzZy
	wp62blmbA5uFVmwDYXbu+0MpwqoQ4/2A58tg6Gl3rXQMxtX5Jg3dp2alH/MAmgOi0PXC42zfQG8
	vN6DJzoGNWSNs1Xkizwoh9KL3w7muIYn9tHND6GW5OED+2q6yqhXcfdd3b79g87aipZ5r7MxnhH
	zZzj9RfyOA+qoQGQUThiXyW90tEF51Qxz8PkT5XUMYDNIM4CR8onOGdJFjKn67vECxhmluq12v7
	LxIFyKIb059zsLvkkP8f8nEcfoPmJpbAi0ur3yDTewYYNLSn0WFG4XDPYIJEbxO6tdkeBoKYhk3
	MfrV/mtKjP9nay2R8KySZmNs/pi41KZaOGg==
X-Received: by 2002:a05:7301:6190:20b0:30c:116b:42a9 with SMTP id 5a478bee46e88-30ee1489a13mr269157eec.26.1782758419292;
        Mon, 29 Jun 2026 11:40:19 -0700 (PDT)
X-Received: by 2002:a05:7301:6190:20b0:30c:116b:42a9 with SMTP id 5a478bee46e88-30ee1489a13mr269143eec.26.1782758418783;
        Mon, 29 Jun 2026 11:40:18 -0700 (PDT)
Received: from [10.91.118.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee316bf4dsm128143eec.17.2026.06.29.11.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 11:40:18 -0700 (PDT)
Message-ID: <4e438b43-33d2-4cde-a5a6-67e7f8c53787@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 00:10:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
 <3ac0279b-105c-403a-90e8-822c28a6dcfc@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3ac0279b-105c-403a-90e8-822c28a6dcfc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE1NiBTYWx0ZWRfX2b/R2+1XmEcB
 vEcEpmB6WPWjY8lQE5ZQD93ykEOPMPA3sVQna6fEu2fYb7qxrm8VdGNd+uDwli9zLttiVsAvgfD
 4zDdNO8VKBQDPTwGb4x7Y3C2PJBHx8qD7JBlGkUtQzihBf2ONar2T+QvUXeyvsEcUYo0RXImyij
 R3QmKsjzCo1NrjUjSerGIobAV0oFVtAqZkhyRHHXUCJedi1tfmDzcfE0VV0ZqQ56XZOh1srdd/7
 OFM5d+A265FW6afUmEEYNi9EgsL5F3SmF1uvuOOSvPHqCg/uVonzvxOw5U2fP31vmAIzFQXvvXl
 e5LVOxUNAgxat6kVC2cg0oiGF6zTABcKzEy8TDm9AGk50dQYjaeYIUV3LCx3Ly0C4RKGtxDV3tq
 U9GCHY5A1jdGDnCjL/y/pUA7bt3c6xAevkHVvL+oSFM82FC1AKZ2ADEfE5zrOo/7xNg+ekppElv
 PIFwmYoAQjDkyBfIAOw==
X-Proofpoint-ORIG-GUID: t8TUZuAMyA_Ka76uyKUvL7lk4VXEpfqr
X-Proofpoint-GUID: t8TUZuAMyA_Ka76uyKUvL7lk4VXEpfqr
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a42bc14 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=l0uZIx2wMuzZ-h4bkHoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE1NiBTYWx0ZWRfX4/z/hYrVlgq8
 Tn+wZGcqxiRTmVgDW+HX2jbr17JcSv/SL0+7Bj/9UWymAzFCEUpsjW3b9Tnsneo2LXMQ/x1TStJ
 SVQZlznWhisVnVtwORAg/gLaPNPGXo8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290156

On 6/29/2026 2:16 PM, Konrad Dybcio wrote:
> On 6/28/26 8:23 PM, Akhil P Oommen wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Drop the sign-offs that don't apply (presumably applied as part
> of shuffling around the handlers of the patch in the in-flight
> tree OR missing c-d-b)

Ack. Thanks.

-Akhil.

> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

