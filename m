Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56373ED5A9
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153864; cv=none; b=CC+LPZRRPoTjBapRR9o7l2c2/op1U4dJJB6H+1sHfUxzaa8qsP0CX8kDyVb+OPvqDI2sAnig5kdFrUWGBp4/txZ13oXEM6+CJKOVuk89sA/W7S4OUXCZ3Xv2LOT4GNn3SBmbjZmaPWidO214OdYX0gIXIDg7bgI1+/sgK8P5khM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153864; c=relaxed/simple;
	bh=3gg+UCEeVjs3UJN89XpJE+k4ALwbAA0e4Q3aE7tCYsk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AjiaeiznCgQaGmQuwDkM8Ll/Uk5FSddziNOFvcXlys9RaMHujVMcyB6lf+dBNbq7TLE30GlhS4fnC/HuVcmvPaJLJ++QaP6elkmt3v9E6POSbkg51+xEhLBUg0rKal5Zbd9FG7Asj4VKGBolpS89gaKuyW6eoHMQj8fYfXiKwOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zp96ixLF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRTVtsf1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zp96ixLF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRTVtsf1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AN3Jo151144
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 11:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JnRlnTWGXxyb1HgHFAalzj22t+riOMBzLLstI6x+Uo=; b=Zp96ixLFcPDZ8D4w
	ZUhgkINhacK9H8tgGL5YGvpe4aEFevF7MT87dGI3ECo84BJk55K6+X3LOj1CgdYT
	FQRAOg4wkDPiDotJfoQwz0DTD8DtsxpWsLBtV+1kzHeFI9Pp6htdJ5rnwuPeiILP
	lrVPpJmpg1+IfqBUcwdTHY9d4oihyMp/qg1fzlSzAhJMr486JXFtcOfb8UwWlmRn
	vqDNGbYnvwRZy+wgDUWBpb+rFdwoVFgI5wI8onJ7u0rJzJmi8WJ5J937Wg8IGmE7
	C5f4fHKQ81oykMCgY9is1OyCeFzQ94GRiQmd4EPghAZvCgezouqRnu0NFTS90KYi
	AFCnWg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctsm03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 11:37:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-835423c69ffso451594b3a.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 04:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778153861; x=1778758661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JnRlnTWGXxyb1HgHFAalzj22t+riOMBzLLstI6x+Uo=;
        b=RRTVtsf1a3JgcywwHSDtV25K7SohUQbWlPmMcJux2ERVtTJI/neQTbRzOTV60gSz4O
         DY7rNEIoYkNVAjt/KSDqCzQwXSZORuMi789KPrjBr/S5wKf5gx+MYIykcsn2Y1adbtnr
         ZJ44iaMo7qES1xt//zvAcYmct14ig0iLmPbiZ9u1uyTkfxwEvPdISwP162WL2VLjPDcJ
         tHZ6/kX8D6z8aLHQRREoVQA8kbWoAgF7TEdffSXZTkXaKLfCL0KEDzW9JtAg8r3dZTqM
         QYzFxw3Sw9yKMOclC2JHSRjVmPtrsZsjZOGa1zKy3birIpMxZrEYP9GgqbI6syzUVS0T
         dzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778153861; x=1778758661;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JnRlnTWGXxyb1HgHFAalzj22t+riOMBzLLstI6x+Uo=;
        b=nFjuI2JfcNHQbHzrV5LTVzYxrIvYmWSgMAGZoTLe6TnT3XNMQwhFBoPwD6cSbtIGh5
         KaUtl5H38UiTDTqv5Aur0AGM/m+NQd90ak/yexSwF65wo/Q6l70hmwr+DBjPMbvdr8P6
         33aTPWJf2w3Y+f1HsXGeL9GoPavjYx5UQw/CSVVlu11RIP3TJVQlGr3dnTAKXzwFcijI
         ExO7YCXFs1jekn32hsfFAoIp8NOtylQTdq/fJkfQ2YnFNj3ChzdAoh4hWJ5n4VPMLsiW
         LCB1vNGOxadEmUio/bxokLayrNjS8ZQ38NVcndaYhJ4L90GnuM1MnpzrXI8vFbFSnYlk
         EJ7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9EhPreNrJOaHMr6BkUUyZPYkj8Ryv1Om0V4ukuDj5by4VcGubgkMqKZLdU+9C+XasZ91p83Q65swov@vger.kernel.org
X-Gm-Message-State: AOJu0YyR+R3Qj2DdSli8BcOwaneiGzK91/hpGHJsBoj65Ma35lc3a5Nu
	tesJ54hT3KBdQcST11qCIqtDqx/X74AbQzeoBHaIMLJfyMyiHTynqpx7Vb8lZphuGsGMpLKyxl3
	6jUbzuTofQF2sRD/NUSYKm7l9+tGqbgjk3k0CS5s8w7L7WsS/dF3RqDJJsSJbA83m
X-Gm-Gg: AeBDiesYdY6U2x/mTSfJVGjMu5nG4WwUKXDMW3POUx7ZXf8NuL+0LXfHpO7ViY+msvX
	TRPmy2Vso/3sKbX7xgOPWDKiOI5MDrsx3Th+sljEH5Shi50s+ibLUFaFpPCMrQVsLmxbOKHlh28
	txa40eXehdVGgZ5boTsmnv7ip53+1+cOUh6ryVfpu3K1HO/kVkZXr+YNRt6Xs2UeSTf/aRAA7X1
	X4hQRpjfS2R+PWIVFnYbMeJCRYYMQssulAvxxPkNtc3unC0arzGu1LuXyzMB/1qZcE1WbrycHuy
	je3oZLSdS5lFnPfSuVcj0kvxyP1dlOU/7pVuv/73yzbwT8a23PV7H3SRFl4ca67b1CZHpdEi+Fm
	bpDFWZFeOtEoVNhsl4w2mL59bhMHIaOXPHKp0IZ+ZIWrmnqEo7gEaNGeTMKe0xcMhHj1KplDPCp
	k4NJS5x5iJuQYDpLknXXuIMSt/
X-Received: by 2002:aa7:88d6:0:b0:82a:6852:559e with SMTP id d2e1a72fcca58-83a5b8d8905mr7194225b3a.12.1778153860788;
        Thu, 07 May 2026 04:37:40 -0700 (PDT)
X-Received: by 2002:aa7:88d6:0:b0:82a:6852:559e with SMTP id d2e1a72fcca58-83a5b8d8905mr7194187b3a.12.1778153860232;
        Thu, 07 May 2026 04:37:40 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d35b3bsm7936426b3a.24.2026.05.07.04.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 04:37:39 -0700 (PDT)
Message-ID: <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
Date: Thu, 7 May 2026 17:07:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
 <20260505-gifted-salamander-of-prowess-5107a6@quoll>
 <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
 <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
 <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
Content-Language: en-US
In-Reply-To: <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc7985 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ivPPdQWlR8-s9s951hMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: mwgrWhqh979WXkOVeCTlFOoS15FMAkf0
X-Proofpoint-ORIG-GUID: mwgrWhqh979WXkOVeCTlFOoS15FMAkf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExNSBTYWx0ZWRfX1uQqbV0kJlv5
 LUc985dLwIAwPlmSpfWlZ2tG14YZX3vHaZ9r48SAhodWqKH8dijEEIZJEizpMgmoQkky7Ink/Zp
 6T4CCHeZjN9k/jgP8MajJcTcSkYjq5pTNb1vWo0hkA5a7ZnhVphE0Gznxn3pysNo0Lbe0xjaTYg
 NLnxbulZrHdUC/8AMzxlXrnjUA257nfTPyfBlny3ERLlmOnD6uMPlqVJBqa7NM8sKUZi7YvJxcy
 swpJwhCUUBd290B3Nw9qBa++T5dXCSc6GHf/AAfPHFm1MyWUvsdj6/HcDJ9RnMkMeNWZfA9k5nQ
 TwlvjOle7ayqrxwVEajyB0MI0xUQiDRz15DWYhsvGgBlTqTYsmyWXHEaoT3eIEru4rSz5912aRi
 9n585A0ZK/0I3Bgdlo3jGMzN9UF4bck9Fj8a5smOPgXfOl+LoX4sVk2xloBgd3jFnxjbWddpjLa
 jNrJkjQiepOVTSKwdmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070115



On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
> On 05/05/2026 15:57, Krishna Kurapati wrote:
>>
>>
>> On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
>>> On 05/05/2026 15:27, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
>>>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>>>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>>>>>
>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>
>>>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
>>>>> compatible. If not, explain what is not compatible.
>>>>>
>>>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>
>>>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
>>>> GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>
>>>> Hence, I didn't use a fallback compatible.
>>>
>>> This still explains nothing. How different clock makes interface for SW
>>> incompatible exactly?
>>>
>> So I went by the naming. AUX vs COM_AUX.
> 
> The naming does not matter. If the clock is called
> "no_one_expects_spanish_inquisition", does that make software
> incompatible? Why would the name itself matter?
> 
>>
>> Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
>> clock-names mentioning "aux" ?
> 
> I don't know, I asked what is different in software interface.
> 

Hi Krzysztof,

  I checked with the hw team here and found out two things.

  1. Shikra is a spinoff of Agatti and its sw interface (clocks used and 
regulators used) is the same as agatti.

  2. I thought we could use qcm2290 as a fallback since the phy register 
init sequence is the same for Talos/Shikra/Agatti. The difference 
between Talos and agatti when checked in the driver was the init load 
settings. I checked with the hw team and they suggested using the init 
load settings which talos was using.

  Hence both these compatibles (qcm2290 and qcs615) cannot be used as 
fallback for Shikra.

Regards,
Krishna,
