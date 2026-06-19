Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2673F3AB29C
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881968; cv=none; b=lLUn38WNlZ73wN5rkgQ4ZQokK5p7CaoKzEZ0RAnQpJZfC+tlJOd+1T84ufpnL0BfcA/Dqhj1g9bGSMCLPQbzRRUUHN4iZGfOc1ttkN7ZBtcXzqzZTYmKjvsUDl5i953124COco0tGYPnisp3NFgm0921jNDQpncHn77UyV0qT3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881968; c=relaxed/simple;
	bh=GRj1sgqzYGCEgcL3nAikH53kEMjykGRo6DuvwrkeGHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxq//R9XlX6Fas+7gvWFIeH0RurM39KKvLOlNvQbI5LbQV+FmVheZpRFcXSG5S3iC4MPCXTfJ+nkVQqAfrxp00w4wqJIwkZfbb6DO9d8LbKY2KtoZEruyC1fFVXH4dB0+ERg2A/f6p9JepoBujJzZZT7SXe3ZxD1p4fzmMo8NN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEqPUls8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6/20cwe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YEqPUls8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6/20cwe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDCnWA594613
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7yHqNvHf7zsxMoKY4S/aHvIz1bHIGx2ls9sOtVtBQE=; b=YEqPUls8augKfigE
	aqLZFa2egqWqhqKUNoRWF9aU8/R+a6S1y8pX9bWShu5UAFWtG0b8Wb6fNjfhPYIp
	dVqbm4bA8l7Os0XSZx9TmhNoES6pZwe/SkYUGe0Q7PVrOeHZmLRn2vbn9h72z+ZZ
	O08j+NYonIwsw5yYlAY7sZCMSb7+rQIbdlGthqJqmOVXIkgAS5Q/cYOKJCfZUWx2
	PBQPef2J3RVxNnChf1Q0US+07rO5PeL5eRi7KGTuSAlD5lJCeOKax5p6sp1dGYT4
	wyJ43C4uzcUTU8h7Ts6BxKz99Jel+C9XLDg0N2d2mHHacVaBaostBnstVW7tNcgA
	akcPXw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sbqs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:12:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7265c1b71f6so127906137.0
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781881964; x=1782486764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7yHqNvHf7zsxMoKY4S/aHvIz1bHIGx2ls9sOtVtBQE=;
        b=a6/20cwe+P8G1Sr6ZhggdCZbIdjBqNsq3qGR/2wdDWlWLUlvqbdIqtZqeF5tuXO5QS
         cNVSfZDenzm9c3+hUL1ocbWTyH1HHO2Urm2x+dlYKfYLYdiqqJnxuDXyWzyX+4mrHW96
         eg3TiK55d/cOq6SKF1FzvhSUcdPgN4+3T3iKEKQ4iKA3kCcLjTOeNFKQt6B7WMugclAc
         9G3alnkVXEMF5uZ48zGA7vyzPQ2Stf0TxbnZrUJ3Z7djvjWqfdqDLBggWcBUH/VfZZlV
         xhEEBWncmSaMw6+py0CfWHwuAMEN13B4QQLS/ccP+15Y8A6fdM22sbk/I9S9BqEAGqJc
         ys3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781881964; x=1782486764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7yHqNvHf7zsxMoKY4S/aHvIz1bHIGx2ls9sOtVtBQE=;
        b=gO9v7xhZWNmYxSxaL7hIaKEsCZfRq04wXZdIxc7nUnOmsG3eTTZH3Oe1nZQC5tR5eO
         wfTaKOXzBB02zX6KkJ8Kp8eJfavIN8zjQZW+R5BYmikJwwsI/TAScDvXidLoKgN2Jeua
         ABkxNpHbTjLbB56VG83Itde87hLlHDvevfOy2a89AcRxLP0mszOrZv1GAxJeAEk3mkUw
         r6HitlQwq1TbkWjcwqYgbX5LPd9S/xjfhRSz8wZJSSxwqi32Z5o5qiL1RMhC3phoS7Zq
         hke0ImU8Jag1+8zgeb5OE1ekv0J59W3yrLwYksLVTtQE5Bt5ZoABzgCeVGfj8h0NUN3m
         W6Tg==
X-Forwarded-Encrypted: i=1; AFNElJ/TPJUZtVzdfiCrJMNypwOBfMkp+yHqXH+sJbI48FuTmPK+NBeQ2v+KrNXb/utXpItBaIARSMJpUY1U@vger.kernel.org
X-Gm-Message-State: AOJu0YyDCrN9t3A9TXfHsav+Bbq8Jevr5vWd07Qpa6tLr9KOZBRzou7J
	C7cFWusv79Xz5irN/PsmhseWadFWv9z5/xIoV+67m/rCIhQtzJVO+b0zpQYGULgmIyCo8ZnbpNR
	HYFtPpcaNbvGjdeoC9i5sFHW/3OEl5p4Jz9Xn1q/j/W/eue0JXoHN36DTefxEsKW8
X-Gm-Gg: AfdE7clyr5MhGvfWG5lnw1ZaOLU8jhEE6t3w6Z8cOHsIzabzaw92qXPda2AoNO11f1n
	CGRRvHcmcQ/MLBZUbZOm6YhprSLugIXWqA8WAUhZFp8gVtI/DWU2P5npnW/IBi74T2/hsaxBBDJ
	amKqZTMon4qRw5q5oAlaEVxdQvp9TH7KJESDQT4P5TAXtdDsfrbG51FDus+OfEhI1kGxK8+MhF0
	vUshUzEJjSExryufiHCd09kBZwIElxpKb4aEwblmlTCTB/KnP5WIH3E+dnWOewZV/8+Zf5Nzmtf
	S63EOlcMYmUyMXKnRWw4VoC2AOBeTvbh9xIIz4I8Gww/UkBSbiXYJoQkck/8r1u8f+cHnZZechf
	UdZj0tcpptwV90edkFfqHyCUv9CDzwrJxY1E=
X-Received: by 2002:a05:6102:a4d:b0:633:7c8:37aa with SMTP id ada2fe7eead31-72a010296bbmr1121381137.2.1781881964364;
        Fri, 19 Jun 2026 08:12:44 -0700 (PDT)
X-Received: by 2002:a05:6102:a4d:b0:633:7c8:37aa with SMTP id ada2fe7eead31-72a010296bbmr1121367137.2.1781881963829;
        Fri, 19 Jun 2026 08:12:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696fbcbb9d8sm946703a12.13.2026.06.19.08.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:12:42 -0700 (PDT)
Message-ID: <044c0fa3-4793-4907-9058-347263511232@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:12:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
 <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
 <5baeeeed-7c18-46f7-82a3-5bb299ba05ef@kernel.org>
 <42ba6ac7-306a-419f-96b6-3427c51ef567@oss.qualcomm.com>
 <9ed7c714-07c1-48de-8d27-cbe24356c606@kernel.org>
 <34586ed6-4f78-490f-a916-baf7657cca7a@oss.qualcomm.com>
 <xw7f24rvxhkfntui4jjswyyabb5be4cbkfgh7fico6vlhfvf5b@d4axfyz6gds5>
 <0947e485-4619-43a3-a127-5b887780190b@oss.qualcomm.com>
 <5vfu3h66pelbhzyfqnagxg2j6r5mn7jupx3nmewt2zsggfa6sj@ttqr775cybxa>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5vfu3h66pelbhzyfqnagxg2j6r5mn7jupx3nmewt2zsggfa6sj@ttqr775cybxa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ePpMXu0EHAev4-TIY3VfuJhCx2WMFIfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfX8D2auW8/Dm4E
 N3DCgIAiF4dX1Nb0bKm3Z20vVksprCh4+a/FwmW0NuQ/U2FzrYafYEnuAlq9iZNYzW9nXYNaYaP
 T/EqSWe+MovnV8srGCprMfNo7APxJiHndxlY+o4+cyCEEYVfUimVemTgTWby5h3rhOXBTS+EsK9
 O0qSosDIGF/MmYXNjw4Mx2zA4QUMbouoAhR/5VD/KpSvYGidzOVoUCwq6dwlz5/3B1p7/Rn94VS
 9R6l+WefgfGQu4P2NVLXLDwCi2F4Nty7EVCmi3IS6UhXIzfxmhSFab/2Bp0sqZjH3Tjw6IYJq93
 G0qjKBZeCyKeXK722InjoFeH14ST0l4W2mpBHonPRvNBs6+uwO+tDjA2ehT95BhcZ8ka/Vm5e48
 b/T2mLhhrwblnKIbh59aLnWmehsuf0kp8hqVjL0jRhpkGq2Bn//3RsP1tUI61X9bOhw7LElmzwi
 z0mSTgzE1bpJZGM8xMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfXzNMBBGK4dVwB
 OH/BYbS05DqEpEy5rEjZ5M4aFP276jm+Dl3gn9Z6hsPYht8lFisD3dPps+La7LAvuHlw5ZINpGA
 wmeUU15A/58TcuJF8I5gR75Cl+/z/o4=
X-Proofpoint-ORIG-GUID: ePpMXu0EHAev4-TIY3VfuJhCx2WMFIfQ
X-Authority-Analysis: v=2.4 cv=KbzidwYD c=1 sm=1 tr=0 ts=6a355c6d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OOGWXGrbggnT5pNHG1IA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190144

On 6/12/26 10:00 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 03:36:20PM +0200, Konrad Dybcio wrote:
>> On 5/17/26 9:16 PM, Dmitry Baryshkov wrote:
>>> On Fri, May 15, 2026 at 09:06:21PM +0530, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 5/14/2026 8:07 PM, Krzysztof Kozlowski wrote:
>>>>> On 14/05/2026 08:22, Krishna Kurapati wrote:
>>>>>>
>>>>>>
>>>>>> On 5/14/2026 12:26 AM, Krzysztof Kozlowski wrote:
>>>>>>> On 07/05/2026 13:37, Krishna Kurapati wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On 05/05/2026 15:57, Krishna Kurapati wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>> On 05/05/2026 15:27, Krishna Kurapati wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>>>>>>>>>>>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>>>>>>>>>>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>       .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>>>>>>>>>>>>>       1 file changed, 2 insertions(+)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
>>>>>>>>>>>>> compatible. If not, explain what is not compatible.
>>>>>>>>>>>>>
>>>>>>>>>>>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>>>>>>>>>
>>>>>>>>>>>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
>>>>>>>>>>>> GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>>>>>>>>>
>>>>>>>>>>>> Hence, I didn't use a fallback compatible.
>>>>>>>>>>>
>>>>>>>>>>> This still explains nothing. How different clock makes interface for SW
>>>>>>>>>>> incompatible exactly?
>>>>>>>>>>>
>>>>>>>>>> So I went by the naming. AUX vs COM_AUX.
>>>>>>>>>
>>>>>>>>> The naming does not matter. If the clock is called
>>>>>>>>> "no_one_expects_spanish_inquisition", does that make software
>>>>>>>>> incompatible? Why would the name itself matter?
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
>>>>>>>>>> clock-names mentioning "aux" ?
>>>>>>>>>
>>>>>>>>> I don't know, I asked what is different in software interface.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Krzysztof,
>>>>>>>>
>>>>>>>>     I checked with the hw team here and found out two things.
>>>>>>>>
>>>>>>>>     1. Shikra is a spinoff of Agatti and its sw interface (clocks used and
>>>>>>>> regulators used) is the same as agatti.
>>>>>>>>
>>>>>>>>     2. I thought we could use qcm2290 as a fallback since the phy register
>>>>>>>> init sequence is the same for Talos/Shikra/Agatti. The difference
>>>>>>>> between Talos and agatti when checked in the driver was the init load
>>>>>>>> settings. I checked with the hw team and they suggested using the init
>>>>>>>> load settings which talos was using.
>>>>>>>>
>>>>>>>>     Hence both these compatibles (qcm2290 and qcs615) cannot be used as
>>>>>>>> fallback for Shikra.
>>>>>>>
>>>>>>> Then I do not understand why you are using qcs615_usb3phy_cfg for
>>>>>>> Shikra. You say that the initialization is different, but you use
>>>>>>> exactly the same initialization. So in a meaning of compatibility
>>>>>>> between hardware for Devicetree they are compatible.
>>>>>>>
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>>    There are 3 things:
>>>>>>
>>>>>> 1. Clocks used:
>>>>>> -> Talos supports AUX Clock since it supports DP over USB.
>>>>>> -> Agatti and Shikra use COM_AUX clock since they dont support DP over USB.
>>>>>>
>>>>>> 2. Phy register Init sequence - same for all 3 targets
>>>>>>
>>>>>> 3. Regulator init load:
>>>>>> -> Different for both Talos and Agatti
>>>>>> -> Recommendation is to use Talos regulator load values.
>>>>>>
>>>>>> SW interface wise, shikra is comaptible with agatti. If we use agatti as
>>>>>> fallback, we would end up using the platform data of Agatti where the
>>>>>> regulator init load is not suitable for Shikra. Hence not using Agatti
>>>>>> as fallback.
>>>>>>
>>>>>> Coming to driver changes, I used qcs615_cfg because it has required phy
>>>>>> register sequence and regulator init load as needed by shikra.
>>>>>
>>>>> So is it compatible with QCS615? If not, then something is incomplete or
>>>>> confusing. The driver uses the same software interface.
>>>>>
>>>> Sorry for the confusion. The Talos compatible represents the USB/DP PHY with
>>>> aux clock input, while Shikra is a USB-only PHY with com_aux input clock, so
>>>> the two PHYs are not compatible with each other.
>>>
>>> According to the memory map, there is an (unused) DP registers part
>>> right after the QMP USB3 PHY. So, sofware-wise it is compatible to
>>> Talos. Having the different clock input means different integration of
>>> the block rather than the differences in the hardware block.
>>>
>>> So, the block should be compatible to qcom,qcs615-qmp-usb3-dp-phy
>>
>> It should still carry its own compatible though, to let the driver
>> disallow powering up the DP part
> 
> Why? The DP part is there, in the PHY, pretty much like it's present on
> most of USBC platforms. I assume it can be powered on.  There is no
> point in it though as there is no DP controller (nor DP pins).

I wouldn't bet too much on that sub-block being fully silicon-validated
given its of no use as there isn't a DPTX onboard..

Konrad
