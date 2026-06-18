Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FB43F4824
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785253; cv=none; b=IqZRXnMO3Hm4Vrk2x78Qs/6teZqObAhBqI9vAZbB0watawdLHoR2b7h5kX8RzwJRMG5C5RgfjRPkeZt4dh3EJdL+Ugh1S7g6azLGXq6BS3PHlM0m5ixW7ym2S9YbKZkCu/YUHdM2fALEoQMTIoLihzu1SX2NF6IdO/x4yzRmutQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785253; c=relaxed/simple;
	bh=GtplIB74PhHYyP/abkhb2MdhJVPsMdyuoG/lp950Tn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEw7gvQ31EQQORKovSoaJYL6yX/41tmHwuhJ5NftvJUcfFQgjj4D8XYrIO7DftRlfLoqAvA6PvBndHo6XUSgMzF/kfkDADQsIrCOJF8oAFbhhCC5UBsme/VRqzryCaM0nLt51uUdbCzxc5h2A8PHGuW+zhRcS7u9+7qeb78QwEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RyGsABgU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoT+dGSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyGsABgU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WoT+dGSJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAre9k1054879
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNC+MjdPQmYRBJXCHlLJ4FXMLy/ssZcMsCeR5gbt2lQ=; b=RyGsABgUW27Ipza2
	jzyUO7zjzepEd5wwzpJOkds+dUfMfx7iD73wPYnneAcZntBdqoxLZWmgHBxe1E83
	SDhbfDRmt+88clXpen/wvtV93tFYUDuV19LxCmjoh1dn5vEcJKUmspn6dKr1hoW/
	Fdm/1/CsdF+1KDoC1QezGisrBLetDc8VIG66elSfFStl0whIB0CtM3lel/fbBufs
	RsyBup8vktFHAv8MsMdsu5VxIiSAQSOtNUS6muxdW+c+EGBhhcDOUG2xMgwGEsTy
	rR0yfT+OKQxVWGpPbiiWgn2o1s1sCuHYo8AAk0iDAmMBuBh3DsRGGApN38EXtVaf
	1O5YeA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cceg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:20:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c9239a1dccso65015137.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781785251; x=1782390051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNC+MjdPQmYRBJXCHlLJ4FXMLy/ssZcMsCeR5gbt2lQ=;
        b=WoT+dGSJxaqVuRk23KIIJ64NOGm4OOnaCrEnP0enxOsm9dc64ssKwFCZ5O99lsZ7Fi
         uoieSuuvFaAaFZjX3nI53eDGKKpfFtF5zowXcfAhdmWZUhz3k3AOQZW36Asmm+iZ17Fg
         mBMBE4YiPhQNbcwtLnRYY7svjR0O1p+5oemZtuS/Hm/mcVIEKIsWE1lc2fujwO2z24gR
         4dL+JFzNB/vcYc8gT/P4luzGOYmZxcy9eGreddBWwreZFbvv/vmy4HS/7uH3XlXZhOwT
         BP/BVOUpe1ro8Mn4qdzBjALwupC5ynXBb7L/MgHRuF3UPRUkdKgdP/K0fQNzKao+BLIx
         +Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785251; x=1782390051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNC+MjdPQmYRBJXCHlLJ4FXMLy/ssZcMsCeR5gbt2lQ=;
        b=BCKzqRLRHqnd8sPEC9D9ywqRM4iuFTZvk/OkV4v6NCdnxIAMsU8MRAKAWEtVKMK7nO
         aRX/aDhvDHtBixXhMQGjxrxmmIO/ZYsbi0W6vD9vyo2JnoXoCeMy45KztQuYuSpsW6YL
         s/vPlRKt7JsY6oe5hdhDCjd8AzhDMsAv4EkqMPd5fKQi1UfhtaeFqv+Z3Dvbela5/+1l
         OoY3Ka/MVzBXoqhzSBtHp9Ydrec7bXVfSLarSKyGdjf9p6ghJvBqTqKg3F+WnyCSGljr
         5HyblVeLGPP39QpAwNGmTFgZgG5HYzdungCfFHAjvL0+7uX4qc7BpE74+Y3/G0lvl3i0
         RHzw==
X-Forwarded-Encrypted: i=1; AFNElJ9Z19b+VEkr8RInwFA0pusA/uNe90SVkY/JSKpfkQ5jmeaQaj+YA6Gc/PtnFo5yxovS/2gS32mbO5vU@vger.kernel.org
X-Gm-Message-State: AOJu0YyjpkuZbqF3s1QoesxXDh995t+Ibcv0gVgTMN1BBtD15HU02BKX
	twh2lBk2i7ndODKvDxZlkTMbIuij0vArBfq1kDy4yilvTATiJps3E4MQ7PcMiBKYTiHx82t75tV
	p95k/JqbaHtZAiwuQsw25+it7JmQ+xNT5EwEJySn2Bn6GSJyxjhF+STuGLXf+AWMu
X-Gm-Gg: AfdE7clk9X8Gsfm/kanLYjuxVmgPgbMYQG3CQRc9zL9U4VDFmYC6sySXbSV5yy+eDzW
	iscnNabtPi3vHjinYrAaGGj4T6fQ5qqXBNlFlfJpbOgsRS98QChKFmtzr2uMKlPPYENm2OW3hfe
	Is2TCQ7vTEe3JGhZVaIJYyBrV7HGC3uCvmNMhJBzMTCQfrM5SWyzxp9E5uEIwCBKC5gaSFH11VQ
	qFIsjw3TueMlX0jtw8x8QsHBHz4zwMo1/4qiX4qKUREkrubMTymGXcOeDi7gOtdRvC/HTz6pdxH
	qXb8xyg1J7iYq4m/FPDwwOelQJ9R17TxcW66t9UgIPbdlnpgrvZYWj0GxfcsKQCibGB//v+hgau
	UgvYAQbD7w5phayCLJDa9aqIon/5Lxc3hgac=
X-Received: by 2002:a05:6102:4bc9:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-727c9ceb5bcmr670264137.1.1781785250884;
        Thu, 18 Jun 2026 05:20:50 -0700 (PDT)
X-Received: by 2002:a05:6102:4bc9:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-727c9ceb5bcmr670248137.1.1781785250503;
        Thu, 18 Jun 2026 05:20:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-695b46f7f39sm1418286a12.27.2026.06.18.05.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:20:49 -0700 (PDT)
Message-ID: <b5287c07-24b1-4011-9805-529f6f51c22f@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:20:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
 <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
 <0debc1fb-f6ae-44c6-aa87-d5ef3e39b47d@oss.qualcomm.com>
 <b4794e93-0fd3-4559-9ecd-02d679bd06b5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b4794e93-0fd3-4559-9ecd-02d679bd06b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExNCBTYWx0ZWRfXwWXeRIQUvuH+
 GQeCgtL5YR0YmWfYrZNTV86oopJviiDbeRQj+c0jsk4ly+K0hvPfKh2670JzelJM7sflqTU2wYp
 oPlnpV5q2BYKlKD2hKGR2s4ObnIRRcfqcRVX/yXg9TjmY7bO9K4g2VvT4NRYEZg+RPv7EwRj8+i
 v5tQj50Zxdbiprwxi0BHJPQYEDCaxFR+ZfhkPXawBecOJ8Sx+ZHwVsih71dh+i7OCpfPA1jjXdy
 566FC9dbaTvAcuRmIpRuGfimwHOmetH+/Et8ICjmvaayjl/LCL1hXIDMSf0GkE7HjJ8POWfa9Nb
 zwSUc9ZLT4IXCAtyYC24YlqGp6HqUPfyLvGxeUlnCRvEHEObQ4fQ+zWa9FRD/dM0bhbPF030Hmr
 daWAqVlgCcdpwSUuNoq2BKqu//3zjDFlx9NAPIvuqWf50uFHI75/shzyLUp+tDsxg0FFvV2dnQB
 o2Plb9AmgzjZU94JgGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExNCBTYWx0ZWRfX11Vti7IDRlPu
 Xv5Z7ngDz3HTLY5ybwi98Eb2Qp2gHNTbErn+Pcny6KVIy7KqHx+YQOgtLeTFbr7BTcDYMSkLMHO
 X9kq97K64p3KkVK7tLCeROyoSUm0Sn4=
X-Proofpoint-GUID: 53uRt6k_hmzIbLlkxGtBOUpg8V2iU8bw
X-Proofpoint-ORIG-GUID: 53uRt6k_hmzIbLlkxGtBOUpg8V2iU8bw
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33e2a3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=i0djx3qMVQoBlMXpResA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180114

On 6/18/26 1:58 PM, Harshal Dev wrote:
> Hi Bjorn,
> 
> On 6/9/2026 12:06 PM, Harshal Dev wrote:
>> Hello Bjorn,
>>
>> On 5/18/2026 2:06 PM, Harshal Dev wrote:
>>> Hi Bjorn,
>>>
>>> On 4/24/2026 2:05 PM, Harshal Dev wrote:
>>>> Glymur has a True Random Number Generator, add the node with the correct
>>>> compatible set.
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index f23cf81ddb77..64bbd5691229 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>>>>  			status = "disabled";
>>>>  		};
>>>>  
>>>> +		rng: rng@10c3000 {
>>>> +			compatible = "qcom,glymur-trng", "qcom,trng";
>>>> +			reg = <0x0 0x010c3000 0x0 0x1000>;
>>>> +		};
>>>> +
>>>>  		tcsr_mutex: hwlock@1f40000 {
>>>>  			compatible = "qcom,tcsr-mutex";
>>>>  			reg = <0x0 0x01f40000 0x0 0x20000>;
>>>>
>>>
>>> A gentle reminder to pick this patch for the 7.2 merge window.
>>>
>>
>> Another reminder to pick this patch up in-case you've missed it.
>>
> 
> Gentle reminder.

Bjorn and I were both out at the time, after we returned it was too
late to accept new patches.

Currently we're halfway through the merge window (where Torvalds
receives pull requests to create 7.2-rc1 out of), during which
contributions are not accepted. They will resume in ~1.5wk after
7.2-rc1 is tagged, targetting 7.3

Konrad
