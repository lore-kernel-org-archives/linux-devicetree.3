Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D278438838F
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785302006; cv=none; b=WFkjv241JZwZzE/xheFRfo2rGWbgc+XClo9uxbdA/0avs5bqsjOF4b67ea55UXKViBQmWW2d67XEIyrHziQqaRoGnFtK94sl6uaYyCbmJExQ3zK2p+1ySdHrpT8yfvnKEFu9xTTyUIxs35UuJG7pKJiRanM/ghyIDXKA8sXEJUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785302006; c=relaxed/simple;
	bh=BBNFf30a6zOOwX6DRI6zswW8zA+Xhv0sn6eln5S4dUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i44yTIywv4Ig24ooPxcw4L2ZCcYecDKvFIgzWEdUyuOkGGENEddhMcNO6GTIkwJyRlWFBdc80WNbH7+VsOJpDJYyNCY2wBLK7uOLKjU0QEVvBNyK8iOpN8C3wgQTAc6vkMMvDzAOvUsKUV0k5lKrD7i+KC4nEYFX/bJlNSGgatE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQR6Kloe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlSRMTdZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQR6Kloe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlSRMTdZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T4cFFH677560
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVe2ifwgqiouK046xgZmh2KLG6lQsh0oVWKD2qpchlQ=; b=aQR6KloeMgPuMcG0
	Bg+NJsQMtwMXCM0WFDx4j7OCtbQM5qJDeAaYAIR+aP9entl529Dd2cBRNXzctxxk
	/XvRq/sR1s/VjaTA4U5flFVn0HrY6idKPd1jybdq4fxCwitMlBvdHEUvOSxDYptn
	lwk5DUq1GRcD7DB69SGf2KMa8I+O6mqhjQeh8gEaY0fm4qg7J5O0vNKVFI/jXyoT
	l8hBS/iN5/ReM4Ge7KgRVToC2/UFfvjDHfsGyftR1/X3AmNMqBenLqIscwNeNeyE
	QnmJ+Cxz4guf172hYyzFMx6vfiNzKT5mMkXRmDmJoGksvXjtas9IfSvu9G+rZdoe
	M8jw3Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sah1nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:13:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848860def2cso686580b3a.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 22:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785302001; x=1785906801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVe2ifwgqiouK046xgZmh2KLG6lQsh0oVWKD2qpchlQ=;
        b=dlSRMTdZvf/qUj1ClcGJg4l5RXCgt8HyQNQjlaFXBjq783HRtA2xSMI0PIc2/P2emC
         CxNC1kA1rWi3yfQmUXKjdd8RLipqRUO578A/S0y8AfIaCrGxMZAZWtH70y2NaMW+UUqx
         7/0T2d4xfRWAOe/MAVvMz+aKrOLr+yI7E7bVKSpH6pLaMrD8sbCGVjxcE5YIci4qmYM4
         8cNiZfgSX+KtTPXIwnHwT38O8z4klwfHWcO9wHlSP39gnuEZ5/AyHAyhsuCAHTDcMC1t
         6I9podUw3QiT66iKIEwfX591aioBIShjziEmcryBrDBpZr2H2dDPFbY6Y91kCtkce2os
         HWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785302001; x=1785906801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVe2ifwgqiouK046xgZmh2KLG6lQsh0oVWKD2qpchlQ=;
        b=sjIf61LssKlzA8XEe6n1X7Ivi7i4p4GfF3XOnaf2uYsydnmrLCiMhOF+PqTpcmb55M
         hyyQ29ui7jIgU/2dA8uQOzAbg1nvZVPRBGgbPeSk5AjapF5X/E1pb3v5A8SsYgPdJsqp
         WwsRg4/Mmdvo3SjuGMzwpbCnm4lPe0dFh7ybxTw3nL1f5gB3edX01LIMq7CTylsBfZbi
         dnCu7IufERqDMGHQs9QnU50A5bgKUaCoCZ1HUwFPZc4HtRRpMD5PdLDVJaZJ53X1gNyw
         m03DF8UUlMPKX1Y1nDAOCVm4ZDioOqzu8Jtvy7GlE/f/2KfjuHTotuffwreQ81kR6NhE
         MI/g==
X-Forwarded-Encrypted: i=1; AHgh+RoPRnzvsOjnMlzdtidw2vgUuwDZqb1TFpnlvRm/Yl42F/FBSTB2JT3PTz113JHhfmg8RkziH/d0p0A7@vger.kernel.org
X-Gm-Message-State: AOJu0YzpDiH7vdaJAUFe+JhaX4+hOYxZDkS2ao3WGiZlB4ljsaq0We+D
	LGcS9QWEkqCWMVUlozgtqdUm8DnTVNT05SMdv3hG3KSHJOFaL8eYqAqedSwexoHvgPVZVRyfuGM
	eBM5g0GeH0s/prPl7EQIatnPswWe40dXL/w3PMNsxjYwvWHI4HeTm9zqSPNMhQePN
X-Gm-Gg: AR+sD113IPRFF1lx5hlE5ayPxnSTf+ARzh540EGNp+1VKCEStA8gPq+mtJ5ocNTRw0t
	FGzOcqDijjDZDDwwjCBbxqja2YDmCGf6dtj7h1wSUEcozRdOGDv3WPrbYKhMZUhdOmPtDDiUIRY
	lJ1obLl/2WgbTqyh4bEMoQw7aCpN/mcaTS7kbVgLF52f0fRW6MKtpHSjI9VHe+EQwwP+wOXsTb6
	0ek5btC7EY1DyqgdGSZRWSyRY12sHdyBQTyRT++8lOY9qkJlCn9mx2Ee2jbPeCmosqliVYNIjqN
	ovWgG52UhjMRAoEiezzIptRxi4xY44eb65RN4t05qP5twenul1Eoiih6rUTH+bSXKRiLf9F3/Pd
	PWTpGjT0FPB1O3xZNM/l1/HBUhccwGFVwSXTY6P0iZRpatp4okupAN/vSZx5ZhCkKyMdi
X-Received: by 2002:a05:6a00:ad1:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-84e931ecd79mr5215877b3a.4.1785302001024;
        Tue, 28 Jul 2026 22:13:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad1:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-84e931ecd79mr5215863b3a.4.1785302000625;
        Tue, 28 Jul 2026 22:13:20 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea037446csm751099b3a.50.2026.07.28.22.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 22:13:20 -0700 (PDT)
Message-ID: <40f21498-a982-4dd8-a7a4-36da8e647a77@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 10:43:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
 <20260723-usb-shikra-dt-v4-v5-2-5b69d9eb0888@oss.qualcomm.com>
 <1dbdd44d-070b-4abc-a79f-3cde09de7d74@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <1dbdd44d-070b-4abc-a79f-3cde09de7d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sya7UPlgLIA6mcX1ov6WhyKQ4jlaGANw
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a698bf1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VKVeDSocINzl8ZdAJoIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: sya7UPlgLIA6mcX1ov6WhyKQ4jlaGANw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAzOSBTYWx0ZWRfX75JGHRM8Pu2y
 AjQpMPoL/N4UbLPdHPSD9MyRbwFhnZaSehiu30kC5RKsXms3tDAwTUb3b9T0Xw+/Z9639yQKpmL
 K4wZ9KAEQV/ehu6u3nZ+uZvo2dq5W+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAzOSBTYWx0ZWRfX/4hi2QxlNbWM
 IlfMKezrFbTsOlotcQ7RGEUzW9euRgszPXzBIxChjdmU+/3YuaAbSOzHn0hNlqfhNefv7g8wq0j
 j3HGfxUTXiYhih81LABzsNMN12wPko8p4FwFKnXWg/oZwgEo2UycyoOD8mViMX5OHjTJNjqsLVg
 iU57l05bi+25IzC4EzYi0TGDKKF6IWilCUkjXEuluiQNbDq8kCJFyPrjmy0i2X8Z6he0Nriglg0
 kpSvk+NJ9ysfoved/5n/JO6FAFTymjugcochj2FPHCZG/XOd0KP2YaMHumB6WOqNppkpWr6/4XC
 IuZjLZP/JaDjIdtRpA6WYMZrdWTVUfHW23JOos4tpqpR27PAT/wrV73ZQnKxZM8wzM7rdfEyx9l
 i/JlxJnkTdx+pqWEgZs5L86Del6eRMC+jwKMig+Cva8N8+dAvBbMq73BcaB5hpVwM9hRgQG5cfz
 6ombWoAvP9jZxcqZ/JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290039



On 7/27/2026 8:09 PM, Konrad Dybcio wrote:
> On 7/23/26 12:33 PM, Krishna Kurapati wrote:
>> On Shikra CQS platform, usb-role-switch is handled by PM4125 on primary
>> Type-C port and Cypress PD controller CYPD6129 on second Type-C port.
>>
>> Since those changes are not yet present, enabling both USB controllers
>> in device mode.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index b3f19a64d7ae..006e24a62f5c 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -38,3 +38,38 @@ &sdhc_1 {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&usb_1 {
>> +	dr_mode = "peripheral";
>> +
>> +	status = "okay";
>> +};
> 
> $ rg shikra-evk.dtsi arch
> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> 9:#include "shikra-evk.dtsi"
> 
> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> 9:#include "shikra-evk.dtsi"
> 
> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> 9:#include "shikra-evk.dtsi"
> 
> I think I asked either in private or in public, don't remember at this
> point, just enable these controller once. They are all the same board
> with the chip and PMICs swapped. Override just the supplies in the final
> DTS files.
> 
Hi Konrad,

Shall I enable all platforms in one patch or in separate patches.

Reason why I am asking is if I enable controller and phys on cqs 
platform in patch -2, then cqm and iqs will have controller enabled, but 
not phys causing inconsistency in those platforms if only the patch-2 
would be applied.

Regards,
Krishna,
