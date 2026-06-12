Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFDA301719
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250775; cv=none; b=A3T1SdvezKjRmprX4H7CdrULkkk/HeAzBlB0u4rF4pAg+5C7Re7VkdWolq22d7XJwweyn8syqxI3Id3fOvM9L3vf5HDGopCmkPqPQDG99yODCAr8U2mRx7xTYCxjx8f1Y8Awr/LxBEeeHEV1e5S/pAB7EelsVrk4T02P/O7dLOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250775; c=relaxed/simple;
	bh=faC12sv3c6kFcjuY77PQydFLEz1zEBfxyaEYpaOekkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKu0HKGxecYYbERkTWpa/fZtr8MxcrgVbK9l8f3GTKSAk7i3ZcjW3vzCPDyRcOTPfxsU1kUZs+FT/cbqXBXFuzmPr+utLRYCzpSh1/2GKU+EWi0YrQ587fCRdUqDN0syLqNXBMx04NEl0SOGiYNSVplsEcYblkR9r6OkZEkkBoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1hhYGfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpA2uVLO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1hhYGfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NpA2uVLO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39LSQ2495825
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a49osnQfcj9w4HVmREpyuKU5kKi7D4S5O5AvEnVyiYc=; b=N1hhYGfN087nnCv2
	g6jnyIm89Onb8pnui3FDoJwzyXV8i1yUTW2A+TIpu/JqbZzJr2Y2N4STUktdt7YB
	BcubpqAvkKHe1LeZLegVNM3iP8Maiwk4zLRQMQSlvX8S3OXfv5nkY9Govh16drzh
	BJwN16xnLKG7LkFDp0u+NTI3eiRhLIhYBXNJDCQ2aXJYncx+Vj48bS/XWBx9TPwR
	uwSSRiGo2JJ0+goixJIPCza7uTtBptCmygBk9NdhPB+qXt2pjgmHC/GZT4wQQ1Ue
	0JrX8Fk1LEFHfu0VqT4/WAh8j1jHao9u6cecBE7lEeRLCZ1s6MK7qVvKzGRZR+ro
	0x6PJA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7jprh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:52:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428419982eso767675b3a.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250770; x=1781855570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a49osnQfcj9w4HVmREpyuKU5kKi7D4S5O5AvEnVyiYc=;
        b=NpA2uVLOmkAO/3nrBkyRly2jCsx9nObLiZkFjMAUUZjBHY7InlI63lzUDGJA9he/l2
         W4QCnfXpjUDqsnrRV9UerlyeqsVTMp3Vo4RAYkIG7kmruyq9dczItYVCwQsy1WWUzIMZ
         uWjEmJGK0dlcoAw+lfNEotXLU8gZr8DnNWIJC9L1uNAMctw+a+xXd7h7lTJtnuFvq/SN
         QMKKZMq0GLJC/7MzjwOmGnlt0ZNonB4Ubo08n9jEH05hHhW/SLH1eodHXmxcweKIrStU
         AO4W7rAVZdZbSy7JcKMYgbMB3G4mNj87AsYzbJS2Iy4lbLVGUaXB1Mb0yWueNikGBHro
         ZvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250770; x=1781855570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a49osnQfcj9w4HVmREpyuKU5kKi7D4S5O5AvEnVyiYc=;
        b=jyjEh32KYjwXHeHKKX2l0hYLpRRqHYCnpavW0om3IK4dIk3lbtLy+mkNgLAp/0Xbu8
         jiVaq9tbpnE16RMWJkW/CLXTJVLIM2j/IGknac8o+PLboTX/oaOypbhsSMC7xkckSri8
         IUbAJFkTto/GDQJbfMSqTaPTRopwovROv2Mw0+wVhQpuQbh+neB1p7dM2uzURce8bfSg
         85vvwLNbeyUNn4C3hDiTK+8hE2UUyoqL92Gc7TbzAZzauJNtrkLuqftRC6CrTRcPOn8E
         Ws5NZmOznafRbUCEybu4Yle6a7Wo/L1SeVJI7bnhTzkc1Dt2VjTdz45BvcYrg1DBU0xN
         1TLA==
X-Forwarded-Encrypted: i=1; AFNElJ8xxlRdqSVbt7cd9+aCjyTQA4KB69a6qrdB82ATC7AJy7BHnYR7bPCgwwQi/8K3c4pO6UdXzOxn3DEM@vger.kernel.org
X-Gm-Message-State: AOJu0YxntN1pjAs1G62akScWDIiM6oIs53juFGFCJL9+8ohvsI2Q/NMK
	R/iDeWp6j0ZpuktLN1NG8r4PzHMp+AhQFB5R9umwNWuqAJzS9YHDjZoAzFWebiJaOVrsewbJxUT
	fn1Q484205kXmBrBzB4d5JBtbGaQSFqha1ez/mqXIrOm6wyYBuw7mFXqPlUJW5jth
X-Gm-Gg: Acq92OEI1KEbwKIyOfcIhN5SQWBVjq0naO/m6LMimwCzPKs4uc1OwP0bUrrkIMVFgPI
	rU7LmZSYoP3wVRWdzpjb6Ob9ebwbwlvkTuY3HXqxl5eY9U65k5W011JEJWh8HIcf1IeC+OFl8OT
	DNtMjkoqQViVUpuguGGUaxHH9ksJ8uszVpNwE/xSl61BHiUSx1flYlgtM0sRymvOJG7dwdk8ytv
	fvM+jWLUCyx5Rruyd9NoeFxC0GJzerobEs6yUKwG0nbWstz5UHviRFOzEKE9/ccKlrYUTEi6TEj
	SOpRIk0RhfsDgu3T9BS59UMHtqCWG5wUZtrilYpm2Cqi/OWWC9A7DX4mUzR2HjSJXUwHs01Dowt
	xM5nf+QIHlxJFpXshLIQg/PEaezVp/fTdQMrVCHqoHgzcXUNd5VEeRcbl+j3xQkw=
X-Received: by 2002:a05:6a00:35cc:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-8434cdac1dbmr2028647b3a.19.1781250770195;
        Fri, 12 Jun 2026 00:52:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:35cc:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-8434cdac1dbmr2028614b3a.19.1781250769717;
        Fri, 12 Jun 2026 00:52:49 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9df57sm1393519b3a.7.2026.06.12.00.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:52:49 -0700 (PDT)
Message-ID: <787c6ee5-e7e0-4884-9efc-b7b4692f1877@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 13:22:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
 <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
 <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
 <ohijjcszynmoocjarid7mo7nbtd2dqcdvqrbnzb7anjytw5m56@nguadudsz7qg>
 <a7952e7d-468e-4ad4-8d95-f6bfe9305170@oss.qualcomm.com>
 <epxrpj52vst4zjigsn6ghaiajyzkwdtji2dvgrf7euag4indvf@wzhhy7wtuhhi>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <epxrpj52vst4zjigsn6ghaiajyzkwdtji2dvgrf7euag4indvf@wzhhy7wtuhhi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kF4IlFRAN6UfcTSeCmgkhUi-kWlCl20t
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2bbad2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xnaJPCCZ8mv5B4GoDGgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX/ipCEf0DKjOr
 A83GXNeizejaNk9osQyRTIwTmvwTqOue0hHWdmjX+gfQitKtoJzs6FXRt0x8qwe+mya0biNxohm
 bHa5VrTWMKE87Gv1qudD2evePP68HjqZPtHBADxFW68b1yI9ZFg+ohgEGPfiYdt+KinsmQL+uGE
 Ho38du88ZBrx1ysdw3ziOOcdI3h1kN8tjLfZN9MV94gsBQbk13Epl5ARIdYsKTrQ2eU78tTE5H4
 6gu3oZ7Oxc2C9paB2XBAjZLT2X3UsGgBIWvcFGAepleCJItvIigMgdbzxtt4/Hb1kCwONF66xvR
 bYvSdd+gglsWJ8g6NZWN+2C32+qgc9KXg799fpbRgEZWi2mSYRZ0iFyaaMEybXLMQrzTIa5VSBO
 rmaqaZv8MeqVDLmygmDYeTx9PUffZCEr1PMege5TW+e3rj11hz4Haq71Konk6Qo6pYAN77GYn5+
 kRRWQFE+NjLPOW66VRA==
X-Proofpoint-ORIG-GUID: kF4IlFRAN6UfcTSeCmgkhUi-kWlCl20t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfXzVpBb0sumW/z
 XzlLGxb8I7CAhWM7e8Gq6gfdosIPwBW95ITXSZ/IM4nAHAuTo2szKLe7gOUv3p/gOp4kScb/Y/F
 LuoC7MU5MOS4F6ocYU0h8DHXcn3Ix0s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069


On 6/12/2026 12:54 PM, Dmitry Baryshkov wrote:
> On Fri, Jun 12, 2026 at 12:13:04PM +0530, Kathiravan Thirumoorthy wrote:
>> On 6/12/2026 11:44 AM, Dmitry Baryshkov wrote:
>>> On Fri, Jun 12, 2026 at 08:22:02AM +0530, Kathiravan Thirumoorthy wrote:
>>>> On 6/12/2026 1:52 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
>>>>>> On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
>>>>>>>> The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
>>>>>>>> 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
>>>>>>>> supply.
>>>>>>>>
>>>>>>>> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
>>>>>>>> refgen regulator supply.
>>>>>>>>
>>>>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>>>>>>>>      1 file changed, 220 insertions(+)
>>>>>>>>
>>>>>>>> @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
>>>>>>>>      	"vdda-phy", "vdda-pll",
>>>>>>>>      };
>>>>>>>> +static const char * const ipq9650_qmp_phy_vreg_l[] = {
>>>>>>>> +	"refgen",
>>>>>>>> +};
>>>>>>> Now vdda-phy / vdda-pll supplies?
>>>>>> Cross checked with HW team again. Along with refgen, there is a on-chip LDO
>>>>>> which supplies fixed voltage to the PHYs. It is enabled upon system power on
>>>>>> and no SW intervention is required.
>>>>> What is it being powered by? MX? CX?
>>>> It is driven by CX.
>>> I assume that there is no CX collapse on IPQ9650? Is CX not scaling on
>>> this chip. Please provide some details on the commit message.
>> That's right. No CX collapse on IPQ9650. Let me rewrite the commit message
>> as below. Hope its okay.
>>
>> --
>>
>> Add support for the IPQ9650 platform, which includes three Gen3 x2 PCIe
>> controllers and two Gen3 x1 PCIe controllers. The PHY instances require the
>> on-chip refgen supply.
>>
>> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations along with the
>> refgen regulator supply. Note that an on-chip LDO, driven by the SoC CX,
>> supplies the PHY voltages without requiring software control. Note that CX
>> power collapse is not supported on IPQ9650.
> ...neither CX power collapse nor rail scaling...
>
> LGTM.

Thanks much. Have sent V2. Please have a look.

>
>
