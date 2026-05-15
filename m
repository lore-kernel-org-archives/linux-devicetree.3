Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D40C47A0A5
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843761; cv=none; b=qXP8YEyOWfajE0fxHUTftg6EV7G4emx2G0022131ks+RTks8kZxgmeH/KjI6rc1Oz0244wH9kG7la34o2pT5QAf2XWptqUJ0vb1ASlHZoakos7L7o5Au1Qb0oObZMHOwO80Qc95lAGbwSLyNsTm5ELj4gDXLERUcS2npw7ZiKA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843761; c=relaxed/simple;
	bh=Qr0x+XXmA8orVwCAe1zPpQ343isne1YWHZc19uAxi7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXbBv1ukmb/uKjpT05y832aleZpxcyqRurLAsSknB0Xsl/HwVmWmP6vEyxw2S71lDjJFUdU/guZreJuy3nyym+g/ApCt5rlRxfPdoJBoGPzmc8O8fwQCEDS5QGkeXAc0Gji2oy7mGUKWaN7+XQnbX/qV/Wzzf0/HNnOb6IHq4dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbq6+Ui2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzW0da6S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbq6+Ui2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzW0da6S"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Ka2j3513372
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EE0vr/o64+jCrMEIp9Eikn1XzCYaUppIX2M8SUyS5js=; b=gbq6+Ui2EtDkH5hT
	LY2aZeiWsPj0IZucvCcwIGzTyinAR031HyApL+EBmgrFWhneNwsND9OSGAUZvLJZ
	Kgl2+hUU7NZscO3jYjyZOSZzOBKHDpx4ng9d9iQtOzaBdv49Yp3bSLXGJtlC/nf3
	0is9wYOJC32C59F1blPIJq9HWh2d2xDNMNFoAVYysgS6lutdfRF7bH+iKjT1b27v
	kF6y2JqkBHdI7TBnMHNMj57aoNTxBKR74E72Q/A8U+m/i+cytmrAfVad86T0M9Uk
	NNF+XQbFiBa/Ho0LgjXPD7u4GD5M/x4Zk0npgKoUa6KapDVfe8diTdB9dxdntynd
	QOffEw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vb0bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:15:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-634ce585b41so3069126137.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843758; x=1779448558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EE0vr/o64+jCrMEIp9Eikn1XzCYaUppIX2M8SUyS5js=;
        b=bzW0da6SXXSE8I0cGH/6zQp/hcczfkHhsox12Vx5T1tBMeAstUT/3d01ldWyjNlJ/G
         Xt3iFufhvlII5roxDlXRikGkVOfXa0nP5WGDfKJDKgexrLvLhY3Ot7gl1bLKENbIPjaK
         I4D5hNuSxyrgmQzVrSQR3bvzf5ijNiHBw/MNIydXXDna8MSCTOXyG5TOQ7OmbSRKcba3
         xGB5q6DGDZKx3mRJEtb/fwAeATMor6KHHHYKa0slny795HYshGQsBbaHRipFAcRJ2C6P
         aXQ/Xpy9LlMRxPqRoHo0POdPmM9/gqxeS5HCGgSThDAB+gPBnWpA18mk08YyNy5g4q9E
         UYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843758; x=1779448558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EE0vr/o64+jCrMEIp9Eikn1XzCYaUppIX2M8SUyS5js=;
        b=AWJtApL5HbY9xvCHSdNaCA8IR5fiL5wZMTsDlGv+DrgEzGVZcOKXlcn7R3+9G8YLmq
         HYl0C5cqT9fNRnUSuRtPxw4ZLeZhZHwsd799ch9OT9vvxtrHG4mTsqUZF9F/EQwNYERx
         V0yF4eSACWNPQ5+F6uFXMmoRueZAe7WezlP8/PGsIPgV4pEQKYuK9H6Ib7/uAp4CxTpy
         anjxF5YwmRid/oOEMxRNAX/hczg1DfeZY2uQDRjqatoWareDISgLaAnKpdat3haobeA7
         n+ACmYYKkBmaivaXYAOVJl5C2Hyg5ghJzZALgiQjMMJM97DSJCcC+kB8HQHtl+gFVDm0
         1yEg==
X-Forwarded-Encrypted: i=1; AFNElJ+D5xbrIjXK63yoZ14uy/pFbWRiM6i1E2MS5nR51aOwwFOCObAo31HL1TSKrgYBtN+IwAMITaamOePY@vger.kernel.org
X-Gm-Message-State: AOJu0YzPIL27JZgXRqVKkqMs6JFp1BYIbZ3N4hHHt5mB1NoI0hCkRzZm
	aN4oCrd3R8L24KtyiuZde3xDmEIBKa081pJtO7L81BKt0II2K86kE/srIxkWv3DdZ3rVJjBNyR3
	nYAv8THWTVB/JRmT7P5oSiF17QSXNxYN3LnP4epR5Xd5QpOUSs50JGfTBdBDe9k/n
X-Gm-Gg: Acq92OEhWgDRoQUFc/WH1JRaSRbRH7mBxWiph1hG2bBnHfllCYORfGLZ68Zi0oTQSoV
	2JszvWYVNEyjMsrLv6sAFE9G+G2rOhynOa+0+ur/CpJ/U39gjawLQYSM9uK2qbKs6p6yekUwKj4
	YVJcIY0Fc80aP1/RDeXge10kiHeLTsHpdqqRcbbO7D0lqjdUYJyVsxi99dTdJFFj+C2oamElvjl
	YsNfoC9Vx8SSnFhyCA8a+SqAi4GOfexFNE7k9JwdWlWdCO4GFDBnSXkBAVfuOj/cwf90z8d2xQ8
	554MXC0NCDYMzpHAfsEbFLxaENqwjXuqsbLim/YflWdsGyYhxq+0QImGdvW1o1AwhTcyRWYKGmm
	q0ebmqJ5hzBryY7NhXVAwhC3SrVSSeysQnHwXIEXhq3GEyCo3KvtFp2pgHwkvwJBF3cEP39++pr
	Cy6SrPMxTKWPlwp5lhEXX90pinVuqmXBhIacpIwVVjvbd4YjViJ7jrlmgJAHLXYMaRyd0bFT0Xn
	B8=
X-Received: by 2002:a05:6102:6047:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-63a3d93b6edmr1486996137.13.1778843758460;
        Fri, 15 May 2026 04:15:58 -0700 (PDT)
X-Received: by 2002:a05:6102:6047:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-63a3d93b6edmr1486953137.13.1778843758006;
        Fri, 15 May 2026 04:15:58 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c6:df5c:d8ed:c370:3eee:b864? (2001-14bb-c6-df5c-d8ed-c370-3eee-b864.rev.dnainternet.fi. [2001:14bb:c6:df5c:d8ed:c370:3eee:b864])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8c8415sm14755861fa.11.2026.05.15.04.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:15:56 -0700 (PDT)
Message-ID: <10f2cd7b-4f87-4581-8065-3c140ee473c1@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:15:55 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
 <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
 <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
 <574a1ab4-293e-4daf-bad5-8dd886a8178b@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <574a1ab4-293e-4daf-bad5-8dd886a8178b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNCBTYWx0ZWRfX/n9mgucwc/So
 vXZTV1fMxF4bzfNR0eMMlbMYXDeOfTVLfPvdeIgZDOhTEWKN9j4JRJTi5FtpEGKsSs1PEgzaMXG
 n6GZ4jdwuMUxyMtj1FpvgPOGFVzQcXees5pmPKGQOmtRDyt07xRTzU0uXkMsJic2WpqphXJIDGv
 je36yVrPoLRH7WXhDEPfjxwX1/C+6USccfI9PmyrEi/t6U0yXBqcp/CO7DuY+M9JNDF12RvlJ90
 pFVs20mYO+r36eAEbcHarwGDRk1KlqC0+jr+srzWfExrVnyEg9l1UtBpn8y6/BmdkkQC4rxVhFu
 whp89qXZArhE7NZ6+doBTqMM+BFMw0f7C6Y3Jx4Ox3IJBmKEAslRkolmwzjPx2zzKLbYLKQET2R
 M9GkKCKzSTeGmWJelZ4IZPcAZHYcgt2Mdn4tgxkF5kZgtOVVtp6XhJluADdxQ213NTBQ9OO4y0b
 T65/KESPVTus7fk1naA==
X-Proofpoint-GUID: V0coa00xur1gT36Oyd_K0lrJY7l-M-2a
X-Proofpoint-ORIG-GUID: V0coa00xur1gT36Oyd_K0lrJY7l-M-2a
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a07006f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8ydOt6MEuqIVUQlor14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150114

On 15/05/2026 14:13, Konrad Dybcio wrote:
> On 5/15/26 1:09 PM, Dmitry Baryshkov wrote:
>> On 15/05/2026 14:03, Konrad Dybcio wrote:
>>> On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
>>>> On 15/05/2026 14:00, Konrad Dybcio wrote:
>>>>> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>>>>>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>>>>>> C630 isn't stable enough. For example it might reset if display device
>>>>>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>>>>>> value to make C630 work in stable way.
>>>>>>
>>>>>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>>>>>     1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>> index e41200839dbe..e6c67016552a 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>>>>>         status = "okay";
>>>>>>     };
>>>>>>     +&cluster_sleep_0 {
>>>>>> +    arm,psci-suspend-param = <0x41003244>;
>>>>>> +};
>>>>>
>>>>> Is it better if you do hack in a
>>>>>
>>>>> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
>>>>
>>>> Any clarification? Then I can try hacking it in.
>>>
>>> This will send a message to AOSS to intrusct it to prevent CX from
>>> collapsing
>>
>> This sounds like a dirty hack. I think, hacking psci-suspend-param is a lesser evil.
> 
> Yes, that dirty hack is supposed to help us understand why this is an issue
> in the first place. Especially since it only came around at some point
> (although I suppose you're not really happy with spending a day bisecting
> when exactly)

A similar patch has, I think, always been in any laptop tree targeting 
c630. It could having been a disablement of sync state, a removal of 
cluster sleep or something similar.

> 
>> I know that we should spend time on understanding, what should vote on CX instead, but having the issue only on C630 doesn't really help. Maybe it will go away once I can sort out the gcc / dispcc / mdss issue on SDM845 & SM8150.
> 
> If it's a "not enough votes" type issue, it can vary from device to
> device, from unit to unit, depending on your luck in the silicon
> lottery
> 
> Konrad


-- 
With best wishes
Dmitry
