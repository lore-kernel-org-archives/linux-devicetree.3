Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F663B442F
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985578; cv=none; b=ZtIq9SnLQwM06/CC3RgoIKcW7342DvNHEq/Os7MxGCbnZzstEhgqVPkx2ZEkCN5PW0r6Ji6/zjrjJD1g++o8Rj7+EGKanz/kbq7kngGE3glhbJbUe23OK/KSJNyAJ7Y7P+AxORDyID8iIfXanTkcrmXanIM0iA671ADufy1ZBAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985578; c=relaxed/simple;
	bh=3kTg9Clc/kX5YvhhLRAxEwnOc1O63N2NGMZM12Uz9RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljRQIZwW0/BNNAoQy0+QbV6TFFpDKvX8GiijEBshGkDpG8SMfn8uu/8Ql91hdG7RstJv8/FYD9yNq/bNbyxVm+BaUW+ZBcVZBSkKzodfDZWyREFHYCyKhjP7cvv2w3vJYBThr/NKHzg3hKpHzUXnD+qMO2Fb3vzYLWNflz9v/zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrXvNMbS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yea7G4ld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrXvNMbS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yea7G4ld"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628SEvd3049491
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zVZnNLH/u8ARJd8RUcFAIiRiGptznjc10KJ4uCgQGko=; b=mrXvNMbSGTLffYn/
	aU6P1GhRv0C8U6e5JL/bUqxKPs61VcMDYXeJQo7RIvUqjgwiMbPMNXO8yqK92fjj
	BuFgQS7M2nGdUiKOdJ73dH9fKCFxQvPWLoqpIG+Q2zfzKznollhoDphiwBe8nWcB
	upgFOj1uIkCm2rDwz1ufHT7IM7ixf2AYVdFls5N7S0VRFoXeCuiuwHH1Y7Wa+B88
	lPCJz1xtqe32M4I2UoJ6KIK3s5eh62pFdFYvJZxX2lq/IvD4frwUNrl4EfvT4qNx
	3YzYI3rrueYPHsQpA7lqG5nahR74BKAkTA0IbTLrVl+6r7YyQCY868zm27lFS9Ot
	vG0IoQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541v2ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:46:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847ac21582cso1908914b3a.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985575; x=1783590375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zVZnNLH/u8ARJd8RUcFAIiRiGptznjc10KJ4uCgQGko=;
        b=Yea7G4ldrVEYt2ANUUsaT9aLSkjW/CcejQrA3VB62sq+tnV27U+h0j5UroAbqHrtOx
         pCtbvQj11goG47H3pCSk48Maq8GdUZrSvqZ+m7n1xFNMVFNYFlsqiFm7DK58FvNlfJKi
         nkoeFRYIY5JV9OItQN4trgfMDYJeMT5qNoeAdIsRvwmsXSCvdL+1fj5yNQVeX05zwy5j
         LC5NKzzy1bGkY9LWfGxEUl63pFi3IsAIIYNwYiVIA4EsSXEfzydV6uPikeUpd1AttV5C
         utMxfqexTZf1eleN5b71ROjPWvYoAKws/h7DF0Cs2mxyYhQ6psP0eDNzfm7IIi8QzEyn
         WHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985575; x=1783590375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVZnNLH/u8ARJd8RUcFAIiRiGptznjc10KJ4uCgQGko=;
        b=K9fUNOgWbephjkMz3TxV2mya6EPXHth/VGvfCc+77FHZnic/mpqulAC1XkJprIda2Z
         c1/WwBrud23CBgtzQ8AqamVxw8nuZtQ+chplrSicJ4mnslnh2TyUeJN4CWLDocQ/o8y3
         TXZOhzPoCQ8w+h9KA5ZId2mFMgn7tYimIXcOlacqBS+bB1MtaC2zsvCfhNmmqS37jj65
         WKWXsUmPqEdMFov5Xry+FYMafxS1n9Lix3iMYUPZmKUHyHLT72mTEm1LcK1nBvqNGdOH
         JKRmGGQr0Yyw+hcI0ZuqgPJmObQKpBPkUr0XXShDRJOilju/sTKMmIeU9qmSb8Bs0oRk
         2XxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq10JVVH5+0bwt3X5WFy59f1yBB6HGMRPAVHadcIINtsHMf+/0SAmn/WHA8YqDzMVhaVvyWVa5DOf3o@vger.kernel.org
X-Gm-Message-State: AOJu0YxYSwlvhLP7vQxQRqz7+nxpMOoDiIlBq9lOGziSLZfZ5f5jfMGc
	JbB47A+Uo433XYRRZwqf/DQ2fbWoQVTAFGfseamfKS8UuNtiXhx7BodbczFj0+1wxkjDu+G7Q+r
	apERAYoT/9euFq/qz/iRllnlObFvuh3pk3wZKC2qzqKZSpJO4u8FUmJh/u+EqrKW0
X-Gm-Gg: AfdE7clrOIlhn8GyiLp3fZWyfb0TewZqv+QIztmkl8PNEyYyAPez1mnjQjyBrg5aEbX
	+bWtKscS1n7CQiGtwTe3EVU5qZtNKRSH8fV3n7F5ETRVuMx2rMfQrnvsIL2TvvF9rStJAutLMtv
	A1yoW+PSXCxRtBc3za9060CkloP4HGZm3KZ18pLInKI4eTdBOKM3KBOnJMlxg20c7UGR/pwY30K
	tsOSDSjZ8DgbUJRTxnYjHsM32TT4393fND1k5tsyfBs8RViogM5qQTwZDhrppeT8XnCmAO80w9v
	uOmQ0Lt9/VYEE+iHdm5EN/FEQfl2elxpzFVRMY7BST1a3PyTt0UdVieu4OBpRyoWg/tELWgVzce
	uIuBvKdyLNry6oiNOQhnCQO8ciUgOyCjkN3tjZFpq
X-Received: by 2002:a05:6a00:a1f:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-847c0a03e2fmr5163656b3a.58.1782985574712;
        Thu, 02 Jul 2026 02:46:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1f:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-847c0a03e2fmr5163621b3a.58.1782985573855;
        Thu, 02 Jul 2026 02:46:13 -0700 (PDT)
Received: from [192.168.1.6] ([182.77.29.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb97d96fsm1104140b3a.40.2026.07.02.02.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:46:13 -0700 (PDT)
Message-ID: <0261818a-0aef-49ca-9884-ffbcf2968b22@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:16:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
 <20260610112607.62D8F1F00898@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260610112607.62D8F1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 58J_ZRmZm6Nm47ednf6xn08xFThiLxcC
X-Proofpoint-ORIG-GUID: 58J_ZRmZm6Nm47ednf6xn08xFThiLxcC
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a463367 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=1qKOYMtCOh3zOq8T1Y2cZw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E98MCR8XraImtk7OjrgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMCBTYWx0ZWRfX/J8+PgLbyi1n
 s2qGxIlJGQNXGSY27gSD9aiXOe6GhFN1cut5fk+pC9Ctgeg9VgW3br6KVZ4dPna+llOTqsgqXZZ
 9J1kY/82WUXIJzpgmytYy1WVUs83geXKzIXHgyQg1vb5gA/KJpsKuf7olCukXbLEvBKif9eGmk9
 IZbwW8MfFpu2kq1VkNvrbZwSlPELOI0KAb1OzyHi01XWwm7JqPdXveie6+eYfJ9KT2FT/t+ARSj
 fNMjJY0WGkmft8Y2SnwP1yilyRyES3aH/XuJCHu0KhcapD2G45QWuSfWGMm5uFxg0xFWcQ00VTw
 KnktLClRVZ01kTugyhQu3AIuKqvOivbT1f/bu+LIWpAe3hsOaWmUrbJzr71W06TBmFzGe8VIgnH
 6LbBah4P76LcMi73SooCINfVZlJ8IKIMd7MhrlQeaigrzvxQ6Em3Vqp4qQhUNP0RSF8oLHVo2Ss
 kCOobNXnQOzft8gem2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMCBTYWx0ZWRfXzi9mpBZbcLP/
 DCarkguSvywRMJMX2cO1SkhmvU7ctn2m42dBABV6JCtpQPlESN3NL7XTq8+bHDWTDIf9EeJlNSM
 FZvwra+5Dniy1P3si2R6WHO9bJHEYjQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020100



On 6/10/2026 4:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing `resets` hardware reset property for the `sdhc_2` node
> --
> 
> commit 3328d962d23c195e0ded6a5fa736fc357bc968ef
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add SD Card support for Glymur SoC
> 
> This commit adds support for the SD card on the Glymur SoC and enables
> the required pinctrl configurations.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 20b49af7298e9..0989fe39e7ef7 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> [ ... ]
>> @@ -3927,6 +3927,57 @@ lpass_ag_noc: interconnect@7e40000 {
>>  			#interconnect-cells = <2>;
>>  		};
>>  
>> +		sdhc_2: mmc@8804000 {
>> +			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
>> +
> 
> [Severity: Medium]
> Should this node include the resets = <&gcc GCC_SDCC2_BCR>; property?
> 
> The SDHCI-MSM driver typically uses the core_reset (fetched via the resets
> device tree property) to explicitly reset the SDHC hardware block during probe,
> ensuring it is in a clean and known state.
> 
> Although the driver requests the reset as optional, omitting it means the
> kernel cannot reset the controller. Could this lead to unpredictable controller
> behavior or probe failures if the bootloader leaves the block in an
> inconsistent state?
> 

Updated in v2 : https://lore.kernel.org/all/20260702094056.3755467-1-mchunara@oss.qualcomm.com/

Thanks and Regards,
Monish

