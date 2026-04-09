Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790803C1416
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733900; cv=none; b=Gzld3sgQTdGrYtEVtlXUUgDInCL8DiGmYsePSkLNV2qGT+bNPoINPAyxQ1f99rWQYOH4YW6Swh2k4qDcfE9Od7Oy+JAUTHupJ0CIhFkrR25zMY4rBntStCRJSOyhEQctm3F1sH4lvrXCkJk8DF/ZUmG3ZmYC6Wsi47E1U5rMF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733900; c=relaxed/simple;
	bh=3rDmcV5qWUl4JdAmVWIS+O1C9Ql3Eqq0UjmbcUVTUgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJUS+Nv/2ce6H+Tsolmsr80LrTkiJ6o+Q11wtRDqRCfk11ipkDwTNaAdOF0vyPUqrUGLQtLs2pDxyVABhyPjPhE7hc8xPmarSWP4Ce2p3CtXXbM4ZNghW3SUPnPYMLjcxtbv4ytW+QZ67mp6ygcAiCJ1BUQxOv4IIn/M4WpvhTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfkQhhwZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKbvUMpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfkQhhwZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bKbvUMpD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394QAlh4107640
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 11:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VbvWrv1pixLKT8Wb+LkDIBnjzAe2JAAbuWntcvWjIk4=; b=HfkQhhwZv4drRbXO
	tB0RRCskseE7C4k1bH8OQQWZYEkdy4xwgRER4T2RLXJhZSYgF3yX9T9QYDsgmcaz
	IYTUy2RU+0Ap7fcLHePtWDDgfM6NQk9gZ7aRgkZNp2BS6pUoHlTUennTG0MkMEpB
	rZbY3ZOjkerf3C8IiiLEnjBc/sw6IBt6YAoqeYdeX0/3oo+BpsYIHUvwwwD74EjH
	w43GcItoQ6W6PbH0P6O3QRPGd1S1u9UQKFNvWQ73rabDHpkTKmj0j7TX56LJpJsB
	+cfBCMv5b2iyof6l/ISjH37ej0E9UTT9KQgQ2kBPoxIdqr3hLAwqQRM/HQssrMyb
	JtPPWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhajkfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 11:24:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b32feb719so1534341cf.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 04:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775733898; x=1776338698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbvWrv1pixLKT8Wb+LkDIBnjzAe2JAAbuWntcvWjIk4=;
        b=bKbvUMpDTDw7DQq1VEWY00Cd0aTd9DC0Eh/EAwFfoPCxdCit6MPEMgFbw7QooNzfpX
         Yg3/5u3Cc8WnN35WPPl3eeDiYpGj90yTpoRUypSwi2fRKPQrHV3IV+MWQBKxmT3OF9hQ
         1GV1GHB2jYDL4NnF79KaTs9PQtJyZDNt9Vwa+zel07gn6t7s8LU2NKArAydVFLj55I8g
         olEvBWtvJaLRPY+AWRCXvA7U2Ggvy/leQu14pGwHaC4JQo4MIoq5SRYIvcXHXH+5UQIU
         goz4Z6TG7O2YqAfmk93an/8yjOzMdvwJac96Cmfw+Uv2bdXiD35YLZojWWiDQwtEcLzN
         nE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775733898; x=1776338698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbvWrv1pixLKT8Wb+LkDIBnjzAe2JAAbuWntcvWjIk4=;
        b=UDv58BJlzomoMo+2ne2b5u54rv/a0r2Sk/mm5EeVlrTsq6D4PhJgS4aCj/fOqcyrY8
         9XREgHzw0E1AQ9+dBnsZpHHxPGZavQ5nUOGhz6FhS3ri/1Saz1I40h7Hm7JFIoB20XRp
         bnARe3Eh7tdgg0iY57iNr2PVVKcr6Ilsh/Lc8WzKSIQaG5aTUJqx/0jaHLkX1pNpEJCd
         efFISq6oLrGKXRRgS/2zSeSwilyK5FJp4niUPuOsZxheOI7yAhPFK2SmI5bpIrqXwrHH
         BmGjpSjztpv34cq4E6cKCjtAIjWU4ihFMuuM4e9fFwZ3AD91Pm7lSTIyCTOXHHVkcHfz
         hGmw==
X-Forwarded-Encrypted: i=1; AJvYcCW7yeGAkcfuD+y9hCdhf1xgqUzAcsnUob41DA3ecKdae8qKwnBk1SO4/323pt2WLd6/cwagvIEV74QO@vger.kernel.org
X-Gm-Message-State: AOJu0YwckikmXrtmBDA1d+wcfC8W7froQt6AItDsaSQISSY+1cnb20rv
	jqpq/ZE6SNIHTam+7d8UGXVBj0V5RVIaKarnNGTTm34XtIduoP8BCMo9jeCeNfMAV5PWug63izt
	V84sjjKT1TBIQ1C5IDauv5DD/W6OsT/1qo7H/mQpEge1cQ2PqA36xjcaHxYzOLtSY
X-Gm-Gg: AeBDiesGLZ3DrHg35AkKbBToiUM5oAxL1DvN1+pXLkZrW9ruUY5yKg9FdHVO0yU95la
	sXzz5ASyTXBq+sLB0YDQS/aM5v67J395FpXK+fXeYzSJB7km5GX1IXn96JT2UdQL44C9ZJdymwd
	x0eJ23/UQmpNwjc1gG0Zph6IRMVvFdeZFF1TcdHQ3J+35bFJjY3fO8l4Zi8APZyJnQl8oDFjHiV
	QUHH6N+KZu/c8Hmj1m4KG3PvM3livrK2Fq/57uN+DVfwPMIuY3ume58L4W7mF3KTanM2jaRqNGY
	FDCsylo7UgbkYZbdgOWneq534Xbz3wW0ccHmkmjD3eX214PkwhExkTY7/ptsclcu1FkqJjxOaYn
	N4iG7MhXNljovts0XiEsr1erD6Np2qFRUm47733H9XlXCwyuOlnzQH9bA2aKhq0+BCQwSZg7KBb
	o3NB0=
X-Received: by 2002:a05:622a:60c:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d62c8442bmr243322341cf.3.1775733897836;
        Thu, 09 Apr 2026 04:24:57 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d62c8442bmr243322061cf.3.1775733897321;
        Thu, 09 Apr 2026 04:24:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c3csm745695766b.29.2026.04.09.04.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 04:24:55 -0700 (PDT)
Message-ID: <e69a2478-fa18-4322-b3f3-a6e2b5a54e1f@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 13:24:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-5-d0c7f447ee73@axon.com>
 <4359bb07-d848-4b77-b1a9-f1c6f53caa10@oss.qualcomm.com>
 <20260409112309.vaibvwsmfdjardvy@linaro>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409112309.vaibvwsmfdjardvy@linaro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L_VqG5iH32E3TiiUhNrKTHu_la1GcLNT
X-Proofpoint-GUID: L_VqG5iH32E3TiiUhNrKTHu_la1GcLNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEwMiBTYWx0ZWRfX/yORI1h71ePU
 bTw+tAb0HRJpOrCW/KN2QugYIssbvwxW3Q2eF4zThGur61Gh8iijOIP5IXOq4Vz0XcrrzR8IMZz
 YDbLSFfDr3TIPCxjwX/DPFgIrfFkkoxP1WdnpQu/6Cao8CVFwfuFPPRORLBRekUJ9b/ktPTKD6u
 dIWrSiZRYBr+WFjjLisEj1gEBacLmdxH+X03zBI6SrwLHCIwqC5unNjQ6Y52TAbD1E/+RFdv+eC
 7AJJBU5L39ei5zMy497UdmOk44uIu0URDmVgC1f69+ISNP9mC7X/XjLCJespkWaXXcVf+kF2w7C
 MNPPdRcbm5fIQ5BWBsrhz0fg1Dpv2IM29A7W6joHNNCmN87em7K/sFiSdtKXRiPhaPCa+CvFV7H
 fuONiiRhPncaNFmm+IV4R9LeMNYXHWipR7gtYKMq4GjCMAZH4kLcMiVk7hKz4zMlyZb+lOSBHOI
 1/SJbA4b0O+ozLoLTjg==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d78c8a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h77gEMGJAAAA:8 a=fZ3KsY-qWbNI7JLrVigA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090102

On 4/9/26 1:23 PM, Joe Sandom wrote:
> On Wed, Apr 08, 2026 at 11:57:18AM +0200, Konrad Dybcio wrote:
>> On 4/7/26 5:46 PM, Joe Sandom via B4 Relay wrote:
>>> From: Joe Sandom <jsandom@axon.com>

[...]

>>> +	can@0 {
>>> +		compatible = "microchip,mcp2518fd";
>>> +		reg = <0>;
>>> +		interrupts-extended = <&tlmm 55 IRQ_TYPE_LEVEL_LOW>;
>>> +		clocks = <&clk40m>;
>>> +		spi-max-frequency = <10000000>;
>>> +		vdd-supply = <&vreg_l14b_3p2>;
>>> +		xceiver-supply = <&vreg_l14b_3p2>;
>>
>> It may be that for this chip to actually be able to communiate with devices
>> on the bus, you need to set the new 'microchip,xstbyen' property
>>
>> see:
>>
>> https://urldefense.com/v3/__https://lore.kernel.org/linux-arm-msm/20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com/__;!!K76kBA!3JvIWVouSl6ZkbxojAFYUus-8UPRvjrHx0qENKOyIIBpZ9knecOfH0NCBAr8ESxNXg2H6982UXqs_8QyR_k9NuKnmA$ 
>>
> Good to know. Confirmed that it will be needed.
> Happy to provide a follow-up patch once the above series lands if that
> works for you?

Sure thing, thanks for confirming!

Konrad
