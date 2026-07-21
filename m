Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6003D3321
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653356; cv=none; b=Z76Xun4wv1cjivN1qrl9srN2CC/LJzIeBpObrlqF+gRTQIfL8Nv9bqt3Mv76DLF7kHRIxPJeMHlB/rQ4I/nqnhP3MXsOmY2e4B4q1oaqOrDMJgVeuZyPDE7/LmVbI3cQFNiuen0lY+IfdKs/BxyFVEHeotU5n1gy8KUUX2sQmWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653356; c=relaxed/simple;
	bh=CCLHL/9qXuOIxscGN994AkztuMhg3vqvjAApjxBs4es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PwLCWwMqgFin6lR1z017uAwCPW9UFVBzpiZW+2ok8J5Kw0IqlirtafGYgD9wnlmHBdEfXZvTK0LHHRcBTUGf+goTlqbyWCEybtIHCuu7E+gL+k6OtGfLDXo5ec92f74YxyQQKHqpMESXNasRJFBIz9nqV1l6Co7uMGYjpSXPQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKw4hZvq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUBPj+7J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKw4hZvq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUBPj+7J"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2YZ92063685
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=; b=nKw4hZvqPKgHvaLO
	0PXZnPs1+YwMC7rKfK+6xIHlZP5+I0MoiDqX8w3/yLA4OPu0yE3oit58/iTF1rwW
	6n6TFtsWaLnazF3wYvoYZG/aYTFiLq3Lb4+vZ1MM3R2C4ha3qtCgkxI6qmvTdwwq
	wZQCOCD7v4wQmBGbbSw5Zp4VxOQ8v9p/lWL1Y2UNJ3ERXzHtpCe0H+6PkqUNXuPF
	Xi/jepIHPQWXhIms8iZk6EF8ZBc8tE1bhMxdqGOaE7lR+VgRvJGk3Ksljcvg7XjZ
	vra5jsRPhsqZ0n+HH/8H2svRZImAF+2ZKFfgxzraHof/BjgEy7i7WHIH+QhPuUZb
	22KAIA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as40pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:02:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744c091ec4fso328204137.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784653354; x=1785258154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=FUBPj+7JFrwihz1vgaypZ6247CxSmUEVBP5ZStOC5agjkko68A3o7heIYSC64Ls/q0
         EGrQnjKc4X2omadzbB9XbAAX+aoHv4gyDOjNHI9trUq2PwADvyr4O+bnJdf4pxzPNIak
         /oxm8gtv27oJbNbwspneDPO4y/uUj8ekw2omAOoNg9ZmDJSXmrBjLNkEtRwWNxv9nvQD
         Nx41eWFMiDwUe9afHeDZoQuUZn2TmMs86aF4bPkqj4iAsXzoVaS2bzmML3ZJefVSnJbv
         O+cRru9qv3XmVOXCsqJ3MGnFxKq6BWZZ5JT2RSZNoui6quenExjdKWFUgYs9t7idu+Qt
         7Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784653354; x=1785258154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=sWSAIFa1qk3IAvIO67WMBqarRlW4CYj/SJdeoOso/p6EEA+82W7VyNqKJKpsxSr8YA
         l/NkLU5fzvRZ5fojCzUZx1a8q9m5UCX6IHIAteFd9+FqwhIv5kSNo0n70hVeBB6rtUrO
         +Upxu6Tz0lAoR4VpyMcvRbUjaEUeYu8CHYkvFtFkgrfQsVLJQ7RHcg/mXyfgOxsjhqgp
         6yV27SVIvl2rYFzKxY8kyUDWA46U7UeKMbqWlb4BE3o882SSKbLvzPfFbiLXb/nL2yxH
         WCx5mPFhgnu0be/FQsukULx8uVCSIu4ib0l+yGIPJdX6qOQX9Z93I1kFl9niTMwE5gla
         DcDg==
X-Forwarded-Encrypted: i=1; AHgh+Rqgk77rpXmtB4r8mKsCRkA4R+rsPQH4N80+QaXqHfXm5bGOpMN/cI68YzeWHEZI0QAHOrtDkbcS/DWM@vger.kernel.org
X-Gm-Message-State: AOJu0YxJzvVW+zDzg2PVb11Gq9Wl42Uu7MRh6EerOsAFPA/lNcrXWyVe
	dAtW14RRh0sIsRLb75vg8FF4DmszSRxio1PLUTIf13V+eRylU05B2uI2walT7X3p4JtpW9JWWfl
	XUw9Ko+EivsWPClwJ/2RcBKHlHBW7UswrLcBeBg8g7XB8zxXcM4Y1/YGnRAvOkjKc
X-Gm-Gg: AR+sD12s2/jNsbofMtkpeQ+iBzh/WqTVLUmrfQrZJApjocUE/EsgEkhcr+wnOn/8guE
	uMkwX6fV2HKs6QdSYyzXvb2ssHlDEf9M6FLoBkQIAehD8OPItwEBcDA1BXolKBpKuOvmIVesZ8j
	EtSskfn5A6JKxzHCYqwR2RGTGmSyY6PxFxMWEMGuvpYFZX7I5uShimhQROXV90NCD8CBPDu1hhB
	Ov0Tyudx/I6H4QqdQ6vgYdhYZr72nVGP8Mw+iKV/KO3ri1SAYohW00e/0hhiXof0G5+Nd57oDFS
	5BG5ioQ/AqCbcEaiduG8QO8l3t/BqQfA97IqHNtW2LKzYnp54eIVJ91dF1CMzp2+yLYCbtdek5n
	rDWEQJXWhoaD4x3neVgyPBb2/
X-Received: by 2002:a05:6102:5486:b0:727:36b9:dee with SMTP id ada2fe7eead31-74abc95465cmr744385137.8.1784653353621;
        Tue, 21 Jul 2026 10:02:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5486:b0:727:36b9:dee with SMTP id ada2fe7eead31-74abc95465cmr744339137.8.1784653353120;
        Tue, 21 Jul 2026 10:02:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a78260sm1445266b.6.2026.07.21.10.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 10:02:32 -0700 (PDT)
Message-ID: <e32b2f59-4fc5-4c81-8a89-24ad132c10ac@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 19:02:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-5-a507f4a1e537@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-5-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3OSBTYWx0ZWRfXwpZLCdJb/Ja+
 kG02F6r0DdVPvt99C09S2bdhXZeHztlMnNBAZZjE68eD7rx/g8XLKfprLvb8M9E8UoAz8C/tI6n
 7Vg8DEvRtqj3a/CoG83rr9Gf+Emwb3XerdiYOmXGnROFJxTuQfOB4FRJEHFIWuYXnh6yDTPIYo6
 Yc1xPmfoTtISAL7EBFrbFZ85a2+Pd3xm+/km6MykY82OMeWfNTOiBxPYz3LL7Ogfp7BYCn8Bhb1
 LNrdOVSeMiysbuOHer1NB2w45ioZACXvRYY1lwqelESWbHWx/kTfm7yuB8I4XKtQSyHfcyjTzdb
 R3GHIO/z1x5Z8muLKiOq88DvUQbnlAPc7fkZUf3YbuuSXkSylkFN0PEaIadIEKLBFODXxJsAOQx
 uWi25b0cxtI08fkIJCY5VqrltNuUaIQ2kZNLzomUR2DwKrDp/eipg3zQOiRf2eHWuQ93IYPlBo3
 VTmnWY1h8ItlRhSeM0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3OSBTYWx0ZWRfX6lm3e1RwT2NW
 5mLWLgt3fsMCO2+3XAFetZ26D4gjSH6XqsmDDMb03jpRxxfyPIZTwZT7j5gOEEQTYS1fB1332G3
 5GYIvva57EcVet80qMk9oZHczU9YODo=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5fa62a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zxsgVq_BHBy1SaPP9u4A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: shJILM4sPsu9UJ0RFyL3DyE_LbbNWsLE
X-Proofpoint-ORIG-GUID: shJILM4sPsu9UJ0RFyL3DyE_LbbNWsLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210179

On 7/21/26 5:31 PM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
