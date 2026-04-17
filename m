Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D4D3B8954
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423980; cv=none; b=umREi1to9wQwiHXt0/IiZeoloM2zpij1VDfMb6+rlgpvvgzQ3mUiGUi4lL4j/AJThbMJS40Dj0y87Hq7YR6vBGML9dqiN8acDtkpXTYxMRjZ76yuo9VCDCoDBOJ5+9gMcMJEj4KLM2if8GDk9xgptMETeYI/qaFDchSfVSYQy9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423980; c=relaxed/simple;
	bh=gjp214fa0vDqtp2MIeTwFh6cFLkjHcWFV2eE2F+rGpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgaufgG0lat1Kh80bMVrYjjtK7AE+8K+WEO0medd1NNOneHCjc5OxQuk7nIcTYKtEJa0su489ik//J7ZXHfsG/gdtcwFWZo1xBtmL9ntkymVKqVEDmCHOYzKH3iiPo+pD7ZycF9IfRTJJEQ5dIESkfrIA3gmy4O0x+t4gG2T/A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbLJq39r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUkDHP1x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbLJq39r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUkDHP1x"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8nssS3100250
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4ixaJYpWyXs0N5c5hlaCDJ1tgjucLUVDje4oD//Jiw=; b=fbLJq39rXjZu1k9E
	fmL5++/HztL1OrhflZnUN00HemA56HmJ5k0Cfvv2E9BwdkpaPbmAoEhTLJO1puaf
	wYRHu2H2U0Qna1ctpxRUDff3RbruQ6nQA8CRQjdAb0fMHzL9edojLELrzugarRsw
	S7nRf0WImd/ceysRcx4o1toOEgnaPOUj9j3KzG2FKTExZnTWiR0XQwJGINT/cFq2
	kvNKaEq44G+E1xJwW399UJC1+cFJv73iX3IF1Mv2Yx9DVMwbNi6i2a2DVueVfLty
	CLQiwvG1K0YVLYS8H6MHovpUdoWnYvMhR59HDrhZ5cghL9KF5CynFlkMxNJ5e/0e
	5hKSBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu0hug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:06:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso4883421cf.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 04:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776423976; x=1777028776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q4ixaJYpWyXs0N5c5hlaCDJ1tgjucLUVDje4oD//Jiw=;
        b=MUkDHP1xb8WkGwJxQHy5LHnfU0mPoYsVxZPCoLkS3YQCvWc6vheMeizqCHHGb2RtZz
         riOUecVVbLntybC68RFbYljhI8qUV1ce9A24cvn3n0teBkzK3536WHgkCOBsCBww29ek
         syc7SHnZs7NxnH5mBQRQh+I5ioH79vUV2RFgDlCFoZBNf620d3c+wDP2aUlKdF9upmJL
         EMd3BmrugtizfmZ1lcZUw/SSS58b9DGboSg9MSXgNqQXmzcOXJdudCVFWZVyY+pyNWNF
         fuy0TcVlKQup073BJx1E4xSX4R0PKnzT5XnPOfocTpRUijVAvBRgLOLPKhN960XQffom
         7l8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776423976; x=1777028776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4ixaJYpWyXs0N5c5hlaCDJ1tgjucLUVDje4oD//Jiw=;
        b=JPrmE+h2wVg+e3U8EzlzpJh65Ojtq4ygAz0f9rcD1Pr0Xt7PHt0ZxNaoTEEXkP+BJ6
         qVV01KnSDXPea+DudfAJys0fTBnMwJkV0EsARFUF5gdWrYaP1CTtYxKV6PP9Gdxv3iCp
         S17ct7X5FxU5MIiYAtIXmll9SEIO119t4UPA33JAy8Tz2A11JV2Oy7VB2Cvh4Le58Y0j
         HLfd3MrM7HPnEj37Y3DqN3Q3K/fCpIMf1skT/3Xio/X+aQms+c5+jrpaNiuaxvLP6onl
         NBMIEEJ9ZXsiSEHJTQH83bCcejSu7fXq7azsyenzeTe+V64WY7KfCnKsxs2NXg83ciVY
         x4pQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FrOmL6tF7r3vIzGWTU1q9/Y28fhhFD1MHEsBzieS5QgkSh8D7CbT087I/u8r4bTHBso2WKn2WFFZX@vger.kernel.org
X-Gm-Message-State: AOJu0YwjCLQ0JrAs/hvPlLkwfF1gGQKOr9uW7cNSe1fdiqpNnmox+whT
	JNNt3ue734mmxu1DZJK6bWVrLSA/Df+V+GswzCorM0fdaCcwF7lx+AocUJm7/y/XVkoyied5kd5
	vidBR7aVh2fCNcF9aloO00UbVoMOkmt3afyeI51qLcCqWIV7XKLUNMetvnFLw9OLu
X-Gm-Gg: AeBDievy8Ax006/xwMC1NQmKPbGk+4ekRGqaqE7o1guIHRGqYU+7m8yOxkyrWXQ48FE
	Gxi2Emt4C2keJyWNKgmTHWTuAaHjct98DpQG9KmPzE3LjCFydFG8nHeCzRiLOcZDRYEalHAo70a
	iKcuG5RczWWoZZj05/mzPzm+2PS5BlI3D6Lhvl/R3DWbTXyFcpZuDQGp079vCaNvzKrdRjjhtZK
	+v6e/Bek4Zj/VRlgTRoxoY2ZKS4CcAqDXVl6K+3MgUIKFmrDB5/5mp6Y6YyNz2Ko6RMOiVALfmc
	mwr94MsWIrOvmm54GcivLmJfa15HO6TysGJCxk1GRa9iZ3dETfpPX2r62OFYuc9SnKYHF8a8tzj
	AOQeucisQ5rHz6cTrutsyC6nBUIztNsNj8M1jT+UR2i+kkPQ4ktOfZBPUgbM6yx9DOQgkN39fIm
	HmWuaO9MqEXZuE+w==
X-Received: by 2002:a05:622a:15ca:b0:50b:5286:f756 with SMTP id d75a77b69052e-50e36c51b96mr19278461cf.6.1776423976095;
        Fri, 17 Apr 2026 04:06:16 -0700 (PDT)
X-Received: by 2002:a05:622a:15ca:b0:50b:5286:f756 with SMTP id d75a77b69052e-50e36c51b96mr19277961cf.6.1776423975524;
        Fri, 17 Apr 2026 04:06:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455043cdbsm43146566b.46.2026.04.17.04.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 04:06:14 -0700 (PDT)
Message-ID: <82e0d347-9ac9-497c-bc67-0db9206c5dd2@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 13:06:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
 <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
 <653fc8bb-295f-4f1d-b9ac-a33e0d8a933b@oss.qualcomm.com>
 <b8f781b0-f7ba-407e-8603-ca504535a894@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b8f781b0-f7ba-407e-8603-ca504535a894@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e21429 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PHqvf1VCJBkSuYI76_kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 1mgjS4fauz09i7k-CLTcYRG9Z5hbi_Ro
X-Proofpoint-ORIG-GUID: 1mgjS4fauz09i7k-CLTcYRG9Z5hbi_Ro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDExMCBTYWx0ZWRfXzGf9PO539bx7
 nsE0yT3ohi/6dYlbbMA/7e28DNxi7aLv0QTLhaT8qkbPBfNKVZvJ/odg4DaJ2b5VQLRqA6ZvApx
 1LRcF/0I24Q+bqsDno9ulyFwGvMh8WTnU0UtknVlzOwLQAAZGB6mw2dYpvFi5cMEI2dceIeY/Un
 f/EicQ3S9wgS9H2fAbF1P/cERMq99PloxI9ShuAicU6//bQmi5I/hEFVDfZw938IqtBXqmq8mCI
 jnSuEQoQ4roZf4psO0D449Uksu34TwIsS+SrB5jgXUZnGi3kqwMeKSnjkUxfH4BCMpIRHKbdUgA
 Q/pHV6ixhqbVFHb94yj1Z+r6IS3WDbKJDIOOPcM/YqsXTIXF42k+ApXFoGOSijJbDh+tcRrJrSj
 5zK+6s8nvcDIFcQAZEe9+omct+TDZo+5m1lI0dXbxu0Wbt/6fAk2340/WhI85LosMPEWhxp2n30
 ZHnGg0uJmEkxhIk4AAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170110

On 4/17/26 11:22 AM, Harshal Dev wrote:
> Hi,
> 
> On 4/16/2026 7:10 PM, Konrad Dybcio wrote:
>> On 4/16/26 3:07 PM, Harshal Dev wrote:
>>> On Glymur, there is a crypto engine IP block similar to the ones found on
>>> SM8x50 platforms.
>>>
>>> Describe the crypto engine and its BAM.
>>>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> index f23cf81ddb77..e8c796f2c572 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> @@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
>>>  			status = "disabled";
>>>  		};
>>>  
>>> +		cryptobam: dma-controller@1dc4000 {
>>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>>> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
>>> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>>> +			#dma-cells = <1>;
>>> +			iommus = <&apps_smmu 0x480 0x0>,
>>> +				 <&apps_smmu 0x481 0x0>;
>>
>> It seems like these aren't the right SIDs on this platform.. Have you
>> tested this patch on hw?
> 
> Thanks a lot for catching this Konrad. The correct SID pairs are <0x80 0x0> and <0x81 0x0>.
> (I hope I don't need to pad them?)

No, you don't

> 
> Unfortunately, I could only validate driver probe on my limited ramdisk environment:
> 
> [    4.583802] qcrypto 1dfa000.crypto: Crypto device found, version 5.9.1
> 
> I was waiting for Wenjia to run the full crypto user-space test suite once. I'll update the
> SIDs and wait for a Tested-by from him.

Thanks

I think you should be able to get some life out of the crypto engine
via CONFIG_EXPERT=y && CONFIG_CRYPTO_SELFTESTS=y (which btw +Hans
mentioned reports a failure on Hamoa)

Konrad
