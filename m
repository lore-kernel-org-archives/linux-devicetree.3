Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207BA3B0AD3
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642276; cv=none; b=J9swXLA1Ei4w+vvPBAt2gbkqSdrdsQUfgB1dtZH77RxPJtfUm2NuYQCO+6Cqo9NuqM6DQ55rpQIWbjCAGIzuG0gB160miurjk53D7x/03SRvBrg00LVd36VxyhB/ZxxCQ36/pQrZmOlDUMX4uUev1Iz/9SBgkC7GWqzNIEP3hFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642276; c=relaxed/simple;
	bh=YCfSjGROjEv47qln7WDmdcB8PlZa092d99y2hi/y6lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phV21Cr+93Xuo1saSqzxLMR+8GrdZfqBuaG1s+ZVQyDQK4x+CKuM/Ecw//Kn0+PTinuIyWrprbu83G3cr7kUg9ExS3svM9wOTT4I2GSXlKFBhyvx0k6ih4cZVYQuwV+ryIJPwwxUcm3kDB0vJHTdYjKyF8nPTZLUVH6WaU7m+pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0G8QUaH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNdvZ2SI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0G8QUaH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNdvZ2SI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6551Uir41957488
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 06:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMTybuxZsT1BMMYHZbqITe6tCaMwGKIrBzgFt7cf/oY=; b=N0G8QUaHJb0f/p/j
	m1z9ix02a7ie8Cj3WWckpaT3gg2VLvH4JTd7cY1Ya713zD5mZd1z8yn6kgqiRMvE
	8e2V1DWc8PzrLDnQUh8Qhirg1XraCpDV7jb+ih1OpQEFzRNn1fON7S0p6J/Ub1+Y
	+fJdEa2Zk9Puhj7TuyN1vMFYmExxh2tYPHuCT5w7BQi+xOPN2lk3fyA6JkumJ5MU
	5EGxlo13r7RT41T3eBBMcjgk3As7JEoXQPuyjgZpYwJIuISj+KWrZl/Xc3uyDdwY
	InwDT1gPuHanvkSlaeVPCkPx1JXzfu6dRuVQ9njvFFFjnTkIpR9IFLWxSR/zETW4
	jjnhyA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekckpu9ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 06:51:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso1470091a91.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780642270; x=1781247070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NMTybuxZsT1BMMYHZbqITe6tCaMwGKIrBzgFt7cf/oY=;
        b=gNdvZ2SI4+vxoU9U/ir1T9z+/2T1kN0qmHDIRKXj8UJEYCfM85hhfeHPV4eEaVERmv
         KcbZJHPad0ZnlICsjj1EyYBgMdotQrzln7PM82llozIc/WCxua38M95/m8mnziNTNB3K
         1/U3eWwHs9pEaJtP5BTOJwV4JPrgCc2qcluO+XEQ3nlaIm4kGThM/JGY3ilkec/ch7Dd
         NwCD1k3bTPQ3Bf2T3LOkLlhGFd5rLteopmd75eX6CX4NWPjuZBisyCqUOCBJQaOqEKfO
         mUJqK9TXNgAFUfGaHt3af/wlcyd3dd7DM7h522PKge5jyZnhZRl88Lt8jCBjR94b5DAg
         0Tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780642270; x=1781247070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMTybuxZsT1BMMYHZbqITe6tCaMwGKIrBzgFt7cf/oY=;
        b=qzRQ4CrGeQjBVzMfrImkzir3EdWV1ZwYq4v0KGgoik0WenF/vaEQBsH9tyCqa8Ki4M
         TuE33B5hUE2xlzs+6Bfuz2PjXD2A4dT+41/S8Zv5f961DXDHM4HHZBlKIhU//A8XLfFs
         y0GBOawUlXbPH+o8yi40Ke7fMVdG/fACzbEGZ0TIRV1Ftm5H5CIQRf1Nk6Vgvc3PgJqb
         QVurBdEZ+QEdu1Hk9DoJPIOzPuneX9pXYKg0+uF+X8MMj/IjhgcQa5Cx0c68UwNzqX+N
         LPokaGLUXJFdmCeisNTU7+PX4QHUCcyTjNbAVlI4fXJD3IoxRSoEwWeKw0oC2PnprF1r
         LrEQ==
X-Forwarded-Encrypted: i=1; AFNElJ92UNFLIswlGhLxuE+4oZZPO/alr60zZwNwzVvOCe6Abcqt2SiSA4PwIkplAtR0wn5ln95tFA7d0X7y@vger.kernel.org
X-Gm-Message-State: AOJu0YyNsgRpmm2LiQnn2qesSaZhJoJcH6SAmEGSgwoBtSwNbPB0wd12
	BPIzfDiDcqTVsGoprdH0K62LVd1ERYuHarmIAGJDgjPEV2B4KK9XBfUMcgTqPzPacI5d1/ko2nv
	U8mdwcooibe+swbtpQRfUTiLZjrrr+dm2UlPVlRpLpdk8tuxHFmIYXfzzeEMx2WVk
X-Gm-Gg: Acq92OF4NJL72BFNi1SHGRZHLleUtQbEbleF7sQgUoQ0Xj6XJ2fB++0go0nTip6t9/k
	31BqXPuvLZN7VC/NsLJqXW2iI/jnxfKl3rElyavu7jZTm2FBugtn84tVxOaqEQq09wWdwtTr5Ie
	wF4/4bGi254G5U4YDJc3Gfi7tIdYJg3xt28RmO2KjNlwrKNuCSoHyEw7uhSkTeuhj0mGLjPUG4w
	ZoPLSzR2rADkg4X70tJtyovNXR0lEf6H3yYwEkr1E8tmSrNslqxNbuPf7w7Xspm+n4sp9np2rui
	yV4XpLA/oFWT+3qKtT/DvZkqKFkXt1pZgKZHAEndJWsntVmlUq9v+YGxEjlF5BuObSXK7S5CwNs
	dpKhcgghP+QvqGvVpSd+p6AhcRaOjWY6p9S6fY1SHKCrMSM8xpvO8ZirhiFrnsl/R0drY+EJx6M
	5y
X-Received: by 2002:a17:90a:e70f:b0:368:6a6e:94dd with SMTP id 98e67ed59e1d1-370f0f43e7dmr2694454a91.24.1780642269804;
        Thu, 04 Jun 2026 23:51:09 -0700 (PDT)
X-Received: by 2002:a17:90a:e70f:b0:368:6a6e:94dd with SMTP id 98e67ed59e1d1-370f0f43e7dmr2694418a91.24.1780642269340;
        Thu, 04 Jun 2026 23:51:09 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f90sm6819699a91.6.2026.06.04.23.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 23:51:08 -0700 (PDT)
Message-ID: <d24238d5-7b71-40e6-b6dd-c2f1aa150d77@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 12:21:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] regulator: dt-bindings: qcom,sdm845-refgen-regulator:
 Document IPQ9650
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-1-55e2afa5ff64@oss.qualcomm.com>
 <b8758150-00a8-4d6e-bd2d-c1985d70ceac@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <b8758150-00a8-4d6e-bd2d-c1985d70ceac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T6MpYVna1VO5iQ289q6iuZ_416kQBpb7
X-Proofpoint-ORIG-GUID: T6MpYVna1VO5iQ289q6iuZ_416kQBpb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA2MyBTYWx0ZWRfX8zoK5qKh0VeW
 g7sX1cd4fE81Apsme/WMsH3+Qs6597v/EfatdivoH7iX/Sk3p1h3IGYYq9BWdKkZZCm97Qg+ugR
 pMQcqcb5hfLJClem7gMBOKPEXOz/2EdUfRFxe35dXPqK2vbTjWS5RAdUrerbEq4l1Nyg/wyGYTA
 6i8MXkRdaDx1rovM33gzO0HyWv/LhSceMCcTZQ3PRbm73A8fFpmJ5s8QNoVWaULJEr8WY4NuVEF
 1dXHNTbz36dKl8xR0Q2T4c7cOLqTMZCDOs/4FoOzFGUBxxbbgnQSthkU5WMm48xjWSblLeYilW3
 9FZgUEXVbzzmPffPiEOcA02mnQp2wePcCieUOSgwekM9WFtG0Mk42Wb8av8yNvGbL6w+Ynb95+o
 dUFAgnDJ/syfX57m7sa+PbAaWNEmnbE8C6XkaqantmmGVEoklnVerAYCWtA27BNWJ0vZaCt+QbV
 eaXcfir2MDpaNNEx1cg==
X-Authority-Analysis: v=2.4 cv=H9jrBeYi c=1 sm=1 tr=0 ts=6a2271de cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uTq8weK-lZKwlp8NyDYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050063


On 6/4/2026 8:42 PM, Krzysztof Kozlowski wrote:
> On 02/06/2026 11:21, Kathiravan Thirumoorthy wrote:
>> IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
>> USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
>> REFGEN clocks to be enabled explicitly.
>>
>> Document the IPQ9650 compatible and the required clocks for it.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../regulator/qcom,sdm845-refgen-regulator.yaml     | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
>> index 40f9223d4c27..2686569ca060 100644
>> --- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
>> +++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
>> @@ -16,6 +16,16 @@ description:
>>   allOf:
>>     - $ref: regulator.yaml#
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,ipq9650-refgen-regulator
>> +    then:
>> +      required:
>> +        - clocks
>> +        - clock-names
> Entire allOF block goes to the end, see example-schema.

Since the allOf already at the top of the file, I just added under it. 
Let me move it to the end.

>
>> +
>>   properties:
>>     compatible:
>>       oneOf:
>> @@ -29,6 +39,7 @@ properties:
>>   
>>         - items:
>>             - enum:
>> +              - qcom,ipq9650-refgen-regulator
>>                 - qcom,qcs8300-refgen-regulator
>>                 - qcom,sa8775p-refgen-regulator
>>                 - qcom,sc7280-refgen-regulator
>> @@ -45,6 +56,16 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  clocks:
>> +    items:
>> +      - description: Core reference clock
>> +      - description: AHB interface clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: hclk
> You just added clocks to each variant, which is not explained in commit
> msg. And it would be a separate commit anyway. Probably you wanted to
> add proper constraints (:false).

Ack, will make the change to define the clock and clock-names only for 
IPQ9650 compatible under the allOf block.

>
>
> Best regards,
> Krzysztof
