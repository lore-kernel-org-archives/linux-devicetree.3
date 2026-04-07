Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718F2374187
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 04:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534983; cv=none; b=MX5uIYz+sUX61qRXIcDgtFOZ7SedTpJziJ2SBqGuu+31cFsqt14jY/iDAuHY+QJ7LLlQai+d9da7QPBLqccPGuDYdPjwlTpw7XFJiQ8cbBWM/3gjaMh68vQD5Jk/Zr89+0WRMscxyJDGYv5GxN33b9ziXvpqsurjcM5BAAmX05k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534983; c=relaxed/simple;
	bh=EvIHw2ewIj4mTh4EQu3rpuiCLWZfjujuPlNXzm4rxGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPaFk6yPMNFQCq8hnuFi7L6yfVqProsjow/sZk/zkGW540a5dRT2myTRsiwtUwhwSoKW50RF1nhHC10WRDWGDNDTbqNeLxD8PFWnaBLnenLpIqZTF0oXdrxerwRFZQoKw0RzIluFgeRQutdwUBkiQdH9dJrSs+2/qomi5VQXxMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXodyB5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQVeje15; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXodyB5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQVeje15"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ7F23536841
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 04:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1PBnRYiMHE9bP8gBrDCBrqQHKpcg5j89FyJ6YAHP68=; b=DXodyB5GNWbqa7rI
	zquYJZH8hdIIYk2xGVEWCHzdnp04LITO+wtlwTFGUU8SAKoxHiHUMts6/E2pYd5p
	jswPG4d+duFtsrws98P7lr9w8xCpjqkXcyDkzZEhiHNyRFN0qRm7q/cAesOi9oU6
	DktKQJBSGGGQzaoWeiBPVV77/jLH9J/tkhCYNvZD4W9BXZXu1YszOj99rsBKfacy
	7Q7dS7t170TZOwTn07iyjfclkBvlmmrQjftPefcZeymxMPJhf/matEZ1mxpglF8Z
	shY64o+HgpPKPG0q+mGLwbIg6Jp8vd3ZW0p7IAy0svEJoA0c5O7gTsfVVeJsnoGK
	jiS/tg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra0xx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:09:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358f058973fso5558503a91.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 21:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775534981; x=1776139781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1PBnRYiMHE9bP8gBrDCBrqQHKpcg5j89FyJ6YAHP68=;
        b=PQVeje15QIjnOeHtwK7zVlgs0SqPJek1ui4WCvwY//3Q0nWuMh5JqZrFojG32Aoa4b
         M9MgOeM4T5OVMxglVD5sBkRJhcl+vpyQNbTbr9mORrWQy3e5n1lSZpewbvZNxq04G5s/
         3dL5/4zNVep69CFIHJIUZUs8NA/b/gglTBS28CY33968v66IcSHnSfJXCRC1hjFynUst
         MpqzMuRWa4aQiKjxzODcNO8W3Aae+lASh4GaumaP3961Puu4PUOcro2/yRlYtxvdbng9
         iWDR0nWxIHDrsKpLqga8TURp/3VE5TG7lsZ8dlAa6WaRafV5iHLYNcDsXaNcUv8fFrDV
         Dfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775534981; x=1776139781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1PBnRYiMHE9bP8gBrDCBrqQHKpcg5j89FyJ6YAHP68=;
        b=oq1CDEYdqDBUzYz88ZJcoxkVDJZlWhfkKkHhp3lcafdUS7WyXEBWNl3W8CYeH2OF0y
         bEludsZknsOsRoE2AM6PUxITBHvztGC7+54v4sBPYDJ12PlBgRodCDTVZpyDwiqcg8i8
         nE1pVJUn4IEuXTMAcjprgeaWB+HAdsbxLSU0BfoaYvdku94sUmiELxnOrnIAroTTU/Nt
         iYm6w3PW/JpaDsZ+8gjvVKV85P9NJMNBueVG/xOiSFSnfenmVwJN73vwvBSQJlp9xk20
         IT92Km7XVUNPHTuNJ9wwKMq6J8R2fHzkQ3FhIB7h4NaunV7Lg24iDTxLvWWaORVnIQAh
         BMPw==
X-Forwarded-Encrypted: i=1; AJvYcCUi71RD7ULWgDrNCpLA1anIyNwZa3oKRIATmHK4rVDyjfofCfvwtLQlUjZ4bTMYO4RSie08mMGsNL6U@vger.kernel.org
X-Gm-Message-State: AOJu0YxUpFC8xGotRpOE1/R4OfvljhrzxCsVKJ4byWKPYx5jhRD9QNim
	JqZ1LeQ/PeJkXxFgRaY/GqZwaDfRKk8MkpVfmmxbNrlUyqpCEj6EJkYbdiBQz/NrtpmAfLlyJEO
	bL4rN6BjBpq+l/Je8Fb2TV1OOetzOqeSmuHlsjdKJTxjX0CSuBNM5mBMR7a6AXOPh
X-Gm-Gg: AeBDiesjv949oHMVlX2qTNwbKi+foswR/L9wZ8MOnRX90c2OqbfBud3me2Ty/voUbfV
	ysu3l0QuBd35jY24+evzwL4wk3l1BiAkv0qgLu1So0BEWK777ta/axzWv1Ohf0cCJYA7040eTkZ
	b9gP9/y0CM6pQql0gHY/WvwQZZrfdjIFpQE24YFgBHy9wp7BetxVCmQ9Ijwu5PmRzfVAhApLLSt
	mRPUz1+kxTK167lbIQFBeYGC+7YBgwfggl6yIjueyOkUvX6pCPMJf8TzFpPc9hXfy9djY2QGa6i
	9FP0Nk4013GNgFOAkdgCqAJfCuni4VDwEDyokh/NYldOdw7qnHOyNo4sjecpCTVfP+qX3CQSpSi
	jWVnunF+oEDW+oy+A2nHTuTcXTMCfBiBZz8cZbXUgBR+k/c13WQ==
X-Received: by 2002:a05:6a20:9144:b0:39c:4af6:4309 with SMTP id adf61e73a8af0-39f2ee00378mr16706176637.12.1775534980694;
        Mon, 06 Apr 2026 21:09:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:9144:b0:39c:4af6:4309 with SMTP id adf61e73a8af0-39f2ee00378mr16706057637.12.1775534978399;
        Mon, 06 Apr 2026 21:09:38 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c659bedesm13411678a12.30.2026.04.06.21.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 21:09:38 -0700 (PDT)
Message-ID: <27cddc5f-888d-4f80-94dd-fb650f4985ea@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 09:39:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
 <5a606f7d-6665-4b0c-bbbe-32538b2315b6@oss.qualcomm.com>
 <95face24-deaf-47c4-935d-0b48b5141371@kernel.org>
 <09fb6efd-646b-4d0d-a0f3-9f6ce4b38442@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <09fb6efd-646b-4d0d-a0f3-9f6ce4b38442@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VaInZqoT6DtJjujgPwzzCivfotgveGoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzNiBTYWx0ZWRfX9dYY2b69Sa7A
 EZhifyyzSFVAVwYLjSXInGpngA6JgctpKmR8+6dLD/Ej04ZaYJ1116W+TG5rMtuGXEBSQJ8XaQd
 N5in5PXRY7DYxCSFeu6VCiZPp8Wc0A1ifS/lCS9UFWHXmAYdrJIYCKvh1p9U5FrVieSKP0XvDXx
 7edYnR7b+JGBKJJHOL8t52DIERwXq9F/stqUVvro1jAvqVqVuzBiVSmmDCQFnc6sRdmn8sFhRK+
 0q4AdmrISp7P8+qlWcZ7cRIzd+7XVGPsNX33gHevamXIJ1xtUzQHvQF+pgZYbmqFgDocRbDl+pQ
 0sSBmEbzTE8QMnW4wA3cmEgxIFwpf0IBZKW2SiIq4XQVHqaYgqSlsTxFv1RBh8od6oJE896/iz7
 wZw83t91aHM4xb7FURdH/9omMUqB54BnzQ0E2LuchqDM6t1kUDrjJa6BGPVtUEIRlc4EwMCn3Ik
 EfFnHRrznJ62QVhTHiA==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d48385 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1nfJcm5jcH8UclV2M8MA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: VaInZqoT6DtJjujgPwzzCivfotgveGoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070036

On 07-04-2026 07:53, Baochen Qiang wrote:
> 
> 
> On 4/4/2026 1:23 PM, Krzysztof Kozlowski wrote:
>> On 03/04/2026 11:13, Baochen Qiang wrote:
>>>>
>>>>   .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
>>>>   drivers/net/wireless/ath/ath12k/ahb.c              | 36 +++++----
>>>>   drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
>>>>   drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
>>>>   drivers/net/wireless/ath/ath12k/core.h             |  1 +
>>>>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
>>>>   drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
>>>>   drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
>>>>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
>>>>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
>>>>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 93 +++++++++++++++++++++-
>>>>   11 files changed, 231 insertions(+), 21 deletions(-)
>>>> ---
>>>> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
>>>> change-id: 20260331-ath12k-ipq5424-cddb63a46a97
>>>>
>>>
>>> only nit in patch 2/6, so for patches 2-6/6:
>>>
>>> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>>
>> It does not work like this. Replying to cover letter causes that all
>> patches will get it. Provide detailed review and response to each email
>> in such case.
> 
> Got it, thank you!

will address the nit in patch 2/6.
As intended in next version, will have your Reviewed-by tag for patches
2-6/6.
