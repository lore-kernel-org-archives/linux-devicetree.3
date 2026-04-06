Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675172F7AAB
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775463959; cv=none; b=LkDdOPp2HCJcZ4HY3LZZ+1S1kzrFkCRjoCJStAAOSrtYM3WL3h+HMm/uUIBCEs6ixG8Bl1pO63y1a6Ui/fW3WbqK9OEYlb6POa3hGbtH+JWaJ3UVQsJ8zZEFdS+lXmM5XD27FMwdTsFqYArZz1m+CcD0FHYZZbG7ouQJo0sg+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775463959; c=relaxed/simple;
	bh=tyWK96ZWWKZnO+q9rIXpNByqGHb/OnJPr2cUQ1sKBws=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CEvW0ld5kOLyY07wVEF2a5wE/3TcOnpxUmoyG9RH7RafOd5Sq9eR+XxWwFmIDu5aiD0ITwC8vtLLKTTszgsBuazEGCnqbyXERwqRh2IiXuyBLM9tqmuX+Et+OZoMCmJUJwakS1PCeRx7uHNSjA6HkHooLawLcutUWSKSbLTvT3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsDUwhot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBWL1pLm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsDUwhot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBWL1pLm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Kq2LZ3594801
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 08:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MOrTBocZl5kySfciOGvZUv9NqCenxGWPRnDVcRlP+6o=; b=fsDUwhotpLBuj2kO
	yvZg0S99iJu1Vs4cYJb4qpEMwShEUoeFNqfD0wFjLAZ4kSl++idXi783epGxhVh9
	HoB9+SZTkiHGPysckwkX6uKRBroKreInHUWDa31DQYTksxZyxc7n6RnxjSAsAaor
	IIpoxyDBjyrVzZryCLzvITS/WcX3tJgpis0sdqp19loiXxUdA5ESrfOzCosM8NxA
	tDsGhgqHDS44PJe5NuBIPZkI2FNk724sERoAIZhE0i9bam8JV+Xv6c8x3TuRmGPH
	4IeZTHf+qqSG3+dOyU08E1V7FzxXzIJ0YmneOzPa/+H4E15pK4lYH8qULpzzjgEz
	hhGKwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1ceme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 08:25:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso2555729b3a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775463957; x=1776068757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOrTBocZl5kySfciOGvZUv9NqCenxGWPRnDVcRlP+6o=;
        b=PBWL1pLmmj+Qo61pIwddbDBLOd9sYns/aTvvmTdSpq0l8A8wBHGRhAwESSaq8PU84p
         dr22JbPv2i7KqGt2ZjvX8EFyOvaS3JlmB1DDe9DofFaQsFW7rVvu2CcDNmh8Ih2X9JoR
         xIkAwnyM6XwowcxO06fHrDfdUMi5aG91pXDSc8SqE/w+x6NIaYcM/efhtjwgpmsQ0o56
         GOFlQamlVlaX2gM8OevEk2kwuCdtToFcJ6iukli2xGNNehelKZAaRCEo5hFQMbHiXcbS
         gfZ6B0cDK0Qvp4HuKegqXlAmhZybj+OhgBs7Y8pn+TRU5o1nIN2QVhyZqin4umRvMilg
         lskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775463957; x=1776068757;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOrTBocZl5kySfciOGvZUv9NqCenxGWPRnDVcRlP+6o=;
        b=KjHsbarkV2/CAIEAyWIFFhDvTxVVkxhzs89nAgh9WCyfYFY6QO6CffBPuu+AJ81Sb4
         41rwN+pn8SpbsJ8DoQFeUHXuOOxWRDkCEoEIvLex3XggeM6bBDwVLx4IGJRIUcYgwHwR
         We+0KZ/XAplvBJBVm3NXId0JqBpPpTsWkApr9oKNiveIigG1lJxYJlzIjP8c+BhX894R
         z39u30eysLT0tKlEY+70xl13IkwWEawSZHWtujh7NfhjJPwKmM38AZwTZcwIDKFedFI2
         gLEfAR27OyWHysirNF3EScMg3R71vhpDG0i2ApQNrEPfQdSdy8ZF4Ttqm3jE5doCsqWX
         /faQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3AW+cNFSOKLNiqb2ixjXc2Z7UMbfPXfNzgNBZDB2mvXSaHMAefdGKljPhwAX38CXpvNsNSymWTuNL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6RObZOPARiI3BCQkNsI/bHHOZiaVSnXvyM6JD31RFnavQILFd
	lZQ30/iKde2Z0Kcwb3Mhvm6BvLoOQv3Gjbfcz5iRC6p341xxtGMB79lS9t6TEFDACvgiW5DfN4I
	rGIHAyT1XEPXMk25n1u+3xevjgpZDi8JJK3UmKI8eeca4Sw6rys6KpeUY3XYmsc5F
X-Gm-Gg: AeBDiet5RgJO6ilnVPSSUGKXC72nzBHCn7YX0Q41cx5uxjzOldrSsAedxSmTKtTkEEo
	4mtAq8wsTrx9tbHomQlprG3vs6NtLs1pWEkd+CohYZMgS5FR7TAMdh1eTnDpqZ3FZ3a6oY9zmAu
	zi3tuH/vBn1OEx6aNXX/L/DE6VdVQiMAqIMr+gucYPrRSTdvZ8uPGc+W/I9AV4lPVgkitMKWene
	E8ZDdI1b9iKvZ7QmDb+xqNWPbKj9auelNx+ZScDEJC+x+1PptlD7aEeh+PmQ1m2/COUcRKSAUTb
	7gtvmEOJl65yv14eN2F2b68hACcskBy1DuUD/lt5QVAX3VQqERp0U5ArHLZQItJlIOstJIHLqQm
	czRnzW0RGy4izCBfbRPJdayVcE8eL/lwvgsgkgUSAeiJAgS2MF7M=
X-Received: by 2002:a05:6a00:c92:b0:82c:d6d3:3197 with SMTP id d2e1a72fcca58-82d0daadb73mr12018079b3a.23.1775463956926;
        Mon, 06 Apr 2026 01:25:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:c92:b0:82c:d6d3:3197 with SMTP id d2e1a72fcca58-82d0daadb73mr12018025b3a.23.1775463956288;
        Mon, 06 Apr 2026 01:25:56 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm16753198b3a.26.2026.04.06.01.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 01:25:55 -0700 (PDT)
Message-ID: <89d95bae-01d3-44b8-b3b6-5e70074d272e@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 13:55:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
 <873e8ad2-50cd-4c09-9a51-20ad745fe8dc@oss.qualcomm.com>
 <2b71dd68-ff35-411e-905d-3ffa2ea3efe4@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2b71dd68-ff35-411e-905d-3ffa2ea3efe4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nizo_-qj4nr4UUdW_tYvaNI9JscSUXKe
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d36e15 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=qoNIJ1LOUDDmZ2oDbzIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: Nizo_-qj4nr4UUdW_tYvaNI9JscSUXKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA4MSBTYWx0ZWRfXw+DNq8D1f5vY
 o9rWKcY5FrKd474REPzcdxYQncnIfztLM94qSeCU3lnONMK1Nqm2y0WT3uwZCzZmTyzTXyl+ttl
 5yQ1DMJTNi2mgkCDwX0jWZD8FWtJ4cqnFcLZaTBsWaGPexM3CV9rHrO8xLHT0NSQC5jTkMEQg6Q
 KQm0cInk2qXVQ0tlAv2/EltvFBTZcYqblL1U3AaDHVP2ifYVMuMHB2A9slLVMnqyY8ETwRX5vcw
 JfgeZvBGoAivtNSl5Q+q3rojq3N9WviHKilrczs/55T+3AgHBsCfXu+ZQBtO1JmHEXdYRUvRDM3
 00CSMlhaQ4isQ0WX600R2OD3SWeqIT2txeb2T9TizWBdsEY4DPDLBdy69J2DHagj/L31VUi68UL
 THJ7lcGKky9c3NnoqqoVOoSLtOpQP4BppaEGWnyekpMgbG439BgtECwYTk0CDEyis4lbSo88yAc
 hziEs6usTvuD073E3cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060081

Hi Krzysztof,

May I request your review on this commit once again. Hopefully I have resolved
the issues pointed out in the previous version of this commit.

Thank you very much,
Harshal

On 3/31/2026 3:10 PM, Harshal Dev wrote:
> Hi Kuldeep,
> 
> On 3/24/2026 4:16 PM, Kuldeep Singh wrote:
>>
>> On 3/23/2026 2:47 PM, Harshal Dev wrote:
>>> The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
>>> power-domain and iface clock. Without enabling the iface clock and the
>>> associated power-domain the ICE hardware cannot function correctly and
>>> leads to unclocked hardware accesses being observed during probe.
>>>
>>> Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
>>> power-domain and iface clock for new devices (Eliza and Milos) introduced
>>> in the current release (7.0) with yet-to-stabilize ABI, while preserving
>>> backward compatibility for older devices.
>>>
>>> Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
>>> Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
>>>  1 file changed, 34 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> index 876bf90ed96e..ccb6b8dd8e11 100644
>>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> @@ -30,6 +30,16 @@ properties:
>>>      maxItems: 1
>>>  
>>>    clocks:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: core
>>> +      - const: iface
>>> +
>>> +  power-domains:
>>>      maxItems: 1
>>>  
>>>    operating-points-v2: true
>>> @@ -44,6 +54,25 @@ required:
>>>  
>>>  additionalProperties: false
>>>  
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,eliza-inline-crypto-engine
>>> +              - qcom,milos-inline-crypto-engine
>>> +
>>> +    then:
>>> +      required:
>>> +        - power-domains
>>> +        - clock-names
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 2
>>> +        clock-names:
>>> +          minItems: 2
>>> +
>>
>> Hi Krzysztof,
>>
>> As motive here is to enforce 2 clocks for upcoming targets and keep
>> minItems as 1 for already merged ones for ensuring backward
>> compatibility. Can we do like below?
>>
>> allOf:
>>   - if:
>>       not:
>>         properties:
>>           compatible:
>>             contains:
>>               enum:
>>                 - qcom,kaanapali-inline-crypto-engine
>>                 - qcom,qcs8300-inline-crypto-engine
>>                 - qcom,sa8775p-inline-crypto-engine
>>                 - qcom,sc7180-inline-crypto-engine
>>                 - qcom,sc7280-inline-crypto-engine
>>                 - qcom,sm8450-inline-crypto-engine
>>                 - qcom,sm8550-inline-crypto-engine
>>                 - qcom,sm8650-inline-crypto-engine
>>                 - qcom,sm8750-inline-crypto-engine
>>
>>     then:
>>       required:
>>         - power-domains
>>         - clock-names
>>       properties:
>>         clocks:
>>           minItems: 2
>>         clock-names:
>>           minItems: 2
>>
>> This will ensure for every new target addition, default clock count is
>> enforced as 2 default.
>> Please share your thoughts as well.
>>
> 
> I don't really have any particular objections to this proposal, but I can
> see that other bindings where the need for an additional clock was realized
> later on use a similar pattern as this patchset does:
> https://elixir.bootlin.com/linux/v7.0-rc2/source/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> 
> I'll wait for Krzysztof to take a final call on this.
> 
> Regards,
> Harshal
> 

