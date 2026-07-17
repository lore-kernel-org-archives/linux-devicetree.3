Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5DC1A9B24
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784248266; cv=none; b=YKlIz2gEdI116RsEL2+vHerR4DYdq5aRlIMMMnR+5SKSxABAyMXcFQGoH944rr+Jex+4oWnHtf7mv80IOJ7CbjKJtmX8ZTzkTX9qTapkQ74mEJu3ZOTnu2II421Nr4wJ1WyTVvP8AhArG+Rb/v6aWrbiTYnQhvhVQxvq8zuK+tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784248266; c=relaxed/simple;
	bh=ytJd3IGSAL1N+rwcJpzr/vFDhEwruTPMalUoBQnrxXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIUb3nw21rk8hHhxUz7mVVZr9KYv9eWqQEQaMZqmpq9gRl0NvkQEPXV5UYDQ3I5dhGipX6mvlMBQ11fOcf7ef1ASXjnXqwWNtRnY9PGhIL15M1uLySSjHDLG0yCMxfBsbHNsZbtTrPk8ta119xt/FMnRDSpfUeUjwI7cQMPwaEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVyJOzoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Miey3vxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVyJOzoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Miey3vxU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIh3Y4179199
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KLhv4uLuj2a0CwkzFlguBw7pHPr92MMB0a10TBLdZz0=; b=XVyJOzoPVLGEGKHk
	0Z58+V3wLWE/gQjodIn+fi2m248drcXqjWT+pAqorhGvlYVBAcMhwQJMQ9pBIcwp
	/EG4KBCaFgdOAJoK21OMH3VHUsMadLsMvTQhRp4u8AFkxpm/ETUnc6RgPm0X+a1a
	0jg8lBMZ3i0mb8iwSY1xPN3vLxTJubyEdtSDRQiJLhR0j5uKu8VWAzam2EMtIdfE
	NonB3MX7vZwb65PD60WwlaRJe7KEfkhH4VVFJfbe6woGqcuvfTgNvemdaMA3LsWT
	Hpl9w85km2Dx3l1ow87/iVr9Fcs5FCUQLlJRMivDZwk64F71Cj/6ZFvof4hZwsSA
	sntTjA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2st1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:31:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so3656863a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784248262; x=1784853062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLhv4uLuj2a0CwkzFlguBw7pHPr92MMB0a10TBLdZz0=;
        b=Miey3vxUv6zQ6J0Haibc7hKwD68G8G9VLkpGEj0ilooVTAmx8slIP4ykQGVslskxEP
         Vefp5xkfp0PTs7HBGln6WwvnXjSG+WJaX45Kzn3V6/Z0MPf971Hg3yHFJKJb8Er24qlz
         X1ridboB0+pG7umPK1rvjAw5NzIG+EX82PEK1qeHzJzH4jhpkZl3jsfwwqzPzk914EA/
         /7oYdC2lLvYE6/Tj181997DGJ/9alojpdjR/h2CxB2CLN7PH4xVSBnPyt0WY+IzlbBhe
         DgZcbr7rh3Is75g2kCHHjOB3s+1+9jSy2v7jI4r/XFRhflL/Jv3/iHP6U8le5Epf/JLj
         Nbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784248262; x=1784853062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLhv4uLuj2a0CwkzFlguBw7pHPr92MMB0a10TBLdZz0=;
        b=nywwa5OxBELjEaOBKXul3QcuX0eAM28wiEk2WhXi4UiR1FHWCKPZ6Wbg/orKiI6/VD
         kwgDycDYxn2YYsy8Sr7qKDKb55ZjcCBqDC6mV+mq4NcRDt6EHR5WXLI5P58bQ0zEVLhx
         +G7B0Z6E/Ou6kw219WbETKJ+LX4WhhACKM4odLi5hqpAVtuW2SZ8d/IKcAq1IN6u2ouV
         Jn1grlAnXSGAyOdcRGubrJpmey0/7d1aZdWeRHRQFD3cVG29krTm6Ko6Z09TdP6jICKI
         qvjyClDe4Iojk6XwpDylJ+8TJy95/k4EklSViHgMHthlTCNw6BtRWH7Dpl3E/EzG6Khy
         vHIA==
X-Forwarded-Encrypted: i=1; AHgh+RqKgzs7XEB7aLM6j0lIIuHHG3p33Mp35ch2Bd0OuKv2uEjbOhTO7tXqEMwq1SDikDf0mO2opxZLIis2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+egxBLfJzqQhbChfVpKcbiLobvw9JPlNyChb/xtnefJPhaUmw
	+/E+eE14iA2wcJPG5sZ3lvhJ5AWVRxQPVEw2S3EVeQ1RdKHnfoUgCl9ugoHplY7hmXw8fJXVyxC
	Iax3jgiONiCD7kQv3feN8KC1uJJjq5CFJjul9NH56tGvGrjkkN0caad5bLDIlkNbc
X-Gm-Gg: AfdE7cnyuVXhYKTdt3yZRcdtEhnDOwl0mzJ8/cHY5oGR7AXvMnwRwgAaDzJSIxtM1w2
	ttFMUX0IlFdO+U1appJNQCZ/MNb5Cfwn5DimCxF9kKFYZeRfkP9TZrThgXkvcjN7Fc94LYu6RR3
	vCVZbz2+9iSpogE4z+HGR3PDYWe+TclMQ/FCYem3giPdMUm87SPl35MXs9dva/qNiqYGCG7lnp5
	Xwrqd0/yac7tWqQGyqPoBcHqPrdjOla5nzKgP6sXSxFMjgGE3Tr26hqFY1cZOPRZWRZi1kTTkAy
	6OnPyTXjo5q84GuDn//q6wXppUPe/iB8udX/WLx34wC5gl1zVPWlB2N457/4MQpyA7al1fJtABL
	03sHTF+8nTMU4xHH+qsN4FUM3t/oAzsiNB/3tVuAfypOqWBDa34WqcGwHfB/jStO/rv0X
X-Received: by 2002:a05:6a20:cc0b:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c3ad7ac045mr262466637.27.1784248261592;
        Thu, 16 Jul 2026 17:31:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc0b:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c3ad7ac045mr262407637.27.1784248260974;
        Thu, 16 Jul 2026 17:31:00 -0700 (PDT)
Received: from [192.168.1.7] ([122.177.244.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519de26a5sm37551a12.22.2026.07.16.17.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:31:00 -0700 (PDT)
Message-ID: <3763d264-e958-4a2a-ad7b-204e6af37655@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 06:00:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Enable USB controllers on Shikra
 IQS platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
 <20260716-shikra-usb-dt-v3-v3-4-13f73a0571bb@oss.qualcomm.com>
 <606db992-446c-4601-805a-d86d0fb74110@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <606db992-446c-4601-805a-d86d0fb74110@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8XO6ARyB71QAMrzu4MrynBLEAV0OYR5X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAwMyBTYWx0ZWRfX+mjV+l4vh0X4
 wrRy9Arube9+gEqUV//lkxDUoczylBmEajIlIww5jGfklNkcTI4t85bue7ECYGCTCsfHVMYWMie
 vRnDabmpYP3fMDW8bU//ItGm6vOhaXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAwMyBTYWx0ZWRfX0TzsDjG/xgO9
 JghBNS0tpZzN9c9pHtz2QY1xfI0iTgxFzWqrZg8uedzC9yilObu+qTMme2OomHIghc7SnJxsjBs
 5xhBtjoPcS2WXh/yLulHOHQHz5DBB+44bCCb0BLPGOp+U3jW+TNiBj83sNGWYHOe4R4eFAqSwJ6
 4x6MW5cTPrp75Elx5siUs9LF9RIkb8Ym0Zad8aS6xkFmZ7Qs1T9zUmCJJzPvFI3VcKoH9TYxb9x
 iuh1yennNbCq3IbZ3Ns7s9GyaDmgYyOlraW57FB8hE6jCFmika2V4az7PoVOQg0OijpLlkBA1xJ
 eRVLaGTXMWbX8ws8niAIR9O9dkf1rlWIKtapbP6mQgMG81+NWdc9Z1ghfaljYk7lBIVksVf3oD5
 3LZyoHAFf6fl/SORLSSGb4jXML56j0yrIbA8iIqSiOsZzy/UQc6FwmyRhHMG3jX0aljERDz3DN3
 kNp6LxvUFNuBz0hlErQ==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a5977c6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=HtVcTGqVJrL9f/+MTxaKuA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KWuMA8URoD_tUPs-JecA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 8XO6ARyB71QAMrzu4MrynBLEAV0OYR5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170003



On 7/16/2026 11:10 PM, Konrad Dybcio wrote:
> On 7/16/26 6:29 PM, Krishna Kurapati wrote:
>> Enable both usb controllers in device mode on Shikra IQS platform.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 35 +++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> index 3003a47bd759..2d4e34ec3b82 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> @@ -38,3 +38,38 @@ &sdhc_1 {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&usb_1 {
>> +	dr_mode = "peripheral";
> 
> Why does this one have to be peripheral if the other boards are otg?
> 

Actually I missed adding dr_mode as peripheral for other boards. I put 
in commit message that I want them to work in device mode but missed 
adding dr_mode property. Since the default behavior is peripheral mode, 
i saw no functional issue while testing. Shall I send v2 with either 
removing dr mode here in iqs or adding it in cqs/cqm ?

> [...]
> 
>> +&usb_2 {
>> +	dr_mode = "peripheral";
>> +
>> +	status = "okay";
> 
> And why do the other boards lack the secondary USB?
As mentioned in cover letter, on pure upstream build, I validated both 
controllers on iqs platform and only primary controller on cqs/cqm 
platform on a remote access setup.

Regards,
Krishna,
