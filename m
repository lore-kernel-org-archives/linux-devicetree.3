Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265913C1983
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285434; cv=none; b=bcOAIw2Jz2lxPKL3CZmjLQx6TbPUR5legHxYCaSRLSQtMsDr4J53TXuAXgL+I5+6OlLRBzPgrdAoXsMpeAtyJiOMil6andGwogtbzjW19V/fGu0+dECVEVRBiH9RJClsjxMONrPvQmI6iz34qgpmy+FwiAgWXGd6uzpeSzPjCO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285434; c=relaxed/simple;
	bh=0xrjuv/aZKRXvZGO+yOutwUBY5BUWyj9mpB1PgLj3RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIGQaGndvuwDIiMwWReyZPhDrdniVC8tGgQOqKig/otFVxYkp324E+gX/Rfl0V81C5A++7UXjkJfmczQe8j/LLsApXf4KAK0K6wbs2rwvdBTkG2+RkyHzzZ3ua0QMucp8tKWFNarum8hsQum1fy1gClYlK2+jaS64W48Cp/AkxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsCcVKwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyYh9949; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsCcVKwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyYh9949"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGqw31474715
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3OKEJ0uFZnrqRzk9n3Br7Kh3ZaDNIX3igpiet86aEM=; b=NsCcVKwy7N26I8ad
	oVtpMkqThJmeivWDSg9VsEERFvzHn8IV7P8zucjmL000AuAcgv7sMmdmfRupvH4t
	FCwWnKNOL8emJVH6bo3pyPwGLxDmFF1tEd8LWHHMP2JHyjadSAGHzkm6eMEn/wQp
	ZDNWdrJCVUMYvicgx8lsfP6Wt7ZqFj8vQc9CRPiqMSU2AHO7IsiHg/0ALJF3n5xD
	Hox5q7u2KjalLimXWYdNLo4NhhTEwciqEeDus6ECUSFRKKay4md1Tuuyo/EXEP0T
	ACIpAZJYw5mIZDJ+zryqq4RE4rWLVKdZxMPMjpMOU07guAcmhr49fw+NBQPgLI9f
	TNLISw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8m9c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:03:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b060f42c48so20050055ad.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774285432; x=1774890232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3OKEJ0uFZnrqRzk9n3Br7Kh3ZaDNIX3igpiet86aEM=;
        b=WyYh9949EFpMYiexBiXsKC2reVFKdNunlC3nhvfA28B4BoIKDcG3xuc5DwtL8dxbPC
         HZ5NbV5FGTbBzIbYjXSuWYCGBuDUWqMhWk/wYr95JaDTrVBrQpp6MuN31MlTk/17ql2d
         dmeGmBCMUfn+Ju6lVjQPmBdfivnY2SnTWEMism/veA4nheORpKYsel7ruUdibzhtnSsb
         RbnOImTNdUoPCPtGouQ1uBCsjQiR+r8VjqKimhWm75S5SVXZKHss9W1SocPbZQD+5m6Y
         Qn80TpGieMO+lcc4YDekLf9M+rrIHnPo/iqlrFNAOUavjnoOgCx/e7ZclK2UFQZsZ0WV
         lWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285432; x=1774890232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3OKEJ0uFZnrqRzk9n3Br7Kh3ZaDNIX3igpiet86aEM=;
        b=Vkh1dYIMoTDBFuB9jzo8w9eaZyM3hDnAyz6ieFUsO3fiK/aihwurwYo+LhFvavXbBK
         WFCYV1C4Ydh37ho11ViRQfapZ11SQGrVE+8FpOZd0e1e28hWfllUwhx74f9Ld51ZzhLu
         aLQFqRKNaATuAI5bF6befF4S4O/bRxmdvFflZtYiUoRKCa/PQYn8po+uVAJlkDi80EBF
         ivRV3zds2vGSm/WfjXRuJMTebVZcJGCKCA6U4VnXnyHnM1VFYtE0q417Tpv2w04fDmA6
         /Lp2DXiIxesHuqsuYQgrwA2yp+xUsR26hHD2Rx5iXMYNLntgnu/Jxf1tIMiKZzhceX4F
         RWKw==
X-Forwarded-Encrypted: i=1; AJvYcCXuMusy+6T+POd50+26dNNsV7hIhgQiRG2cRDgysNkmB63dTqn13OyCg3xK218wE78ZDzznJM0T/Vus@vger.kernel.org
X-Gm-Message-State: AOJu0YzIk8Ig82tQTbQJLzGKFDqiLXlWi48r+ss8RONXdjxDYLKOmgQU
	90AOrT/59pe85Q0K4i2ztPmf+MLVusMroodbCHlP1+pzWMBqK4VsWO09KomAgkz9+Cgx7pV3agd
	ZvjussNL+S/Q/4EMpwr5Bakku5DGZP6ndUpUbNcjb745/ksERx+uWHk3iHUiHp5Ml
X-Gm-Gg: ATEYQzyzVH671U3pBrs0wKoKWkZz28c+7pn0O1KmcA5l3uNhLisGreoq8om9pDY/Fz4
	SB/Ued22YuXdpE3/5oZaUX7rI0UsPQV7U1Vnz/7/ISTAkklCP1RkN8EoAnXQ5D/AtfsXsVuZ1Wx
	gTsfA3UFyrm66AkZVTCb/r3h7jwYKBEiId57uiPA3E4qCXgj7spfO4QjV0ovG2zfKU7muX6kbjm
	oHyEXJNMp32PU/idZ3IvRSqdzEt9pc5VN/Iud1MbidPgLlJ8ZKbcdMTQXVhZyaXlnSiigTSg6ln
	H1rvegPeq/E6vCmxMSYFzxLbDr9hqDzNQGwXDpEgs9ty/h3ElIAMojigdkgTRX10SNEfrQx99Ku
	vZyx2gD/hSZnmtuEloxu4NcFeVfAMOAG4ev+h0+gdO+GpMk4=
X-Received: by 2002:a17:902:d4d0:b0:2b0:6f21:8270 with SMTP id d9443c01a7336-2b082774324mr82819955ad.5.1774285431559;
        Mon, 23 Mar 2026 10:03:51 -0700 (PDT)
X-Received: by 2002:a17:902:d4d0:b0:2b0:6f21:8270 with SMTP id d9443c01a7336-2b082774324mr82819685ad.5.1774285430949;
        Mon, 23 Mar 2026 10:03:50 -0700 (PDT)
Received: from [192.168.0.9] ([49.204.25.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083688ca4sm152745085ad.67.2026.03.23.10.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:03:50 -0700 (PDT)
Message-ID: <0a44b9ea-9f2d-496e-8915-45186433dc1e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 22:33:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add model string
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
 <rdglzhmncexfcvec5hyenj7jx3m5hsphjlxsaeq2zhi4z4arml@bjeqghbbaoa2>
 <64f43d77-7c09-453e-8d7b-b4e0e5f05598@oss.qualcomm.com>
 <gmeo7kiryfh3qxspzidpwknxgmxqeqr6on2glrjj4tioh6apv5@p6rxe3jw2rkm>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <gmeo7kiryfh3qxspzidpwknxgmxqeqr6on2glrjj4tioh6apv5@p6rxe3jw2rkm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNiBTYWx0ZWRfX+yipYLRypBBt
 9r+P5G1ba8UG7EFs6+hnrQ8HIUpjW/oD1luPV/iH/DSfAl+Jhy5ptzWWzqLRKIhX+iL1mUC0Juo
 v0pIAKARTpe2iA7hXmCIWKci3CeeYnLPM4D+sJJTHmch8DMZkX8d+FelHdJOPsLLNvkV9jfBRgP
 l2mwce9x6ge54FbVzwAA1xIcIKag5Bsk+Ey1+b3yzJkV82eruVjJjMeTpucQ7HuAj9k72v0jtiA
 mvl0HqCyE2QG9FgG3i0TNKVVWAjU05SrOR3TdmMVuZxfDil3WHNsdQn7ux7T3MyrJEfKA6fo227
 TlpjV1uAMDnOSZ0QfH9w2ncigNThNYX+DxopUw6eA/OIM4Nnk7nURmUvibw2hcUfY09jQGVycb/
 K2TPiU89NnPAumbeTANTXOGOSo6Z7HRKFNeSpoF/O2yWa7+4gSk0kQsWgfXBTJZNgmYvwKGdMEn
 Cn+DvOcOO4oiFsAhQ9A==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c17278 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=bm6Oh/fWkYYflUit1XJm0A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4yEt4WWgJWksLT0UfGEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ws6bgZN_YlXj_M694b7SncVPRLCLIm0b
X-Proofpoint-GUID: ws6bgZN_YlXj_M694b7SncVPRLCLIm0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230126

Hello Dmitry,

On 3/13/2026 11:23 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 02:09:58PM +0530, Umang Chheda wrote:
>> Hello Dmitry,
>>
>> On 3/10/2026 2:07 AM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 09, 2026 at 05:49:35PM +0530, Umang Chheda wrote:
>>>> The RB3 Gen2 Industrial mezzanine DT file lacks a "model" property,
>>>> resulting in the hardware always being reported as the "Robotics RB3gen2".
>>>> This prevents applications and user-space tooling from distinguishing
>>>> the Industrial mezzanine Kit from other RB3Gen2 variants.
>>>>
>>>> To ensure consistent identification across all RB3 Gen2 mezzanines,
>>>> add the appropriate model string.
>>>>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>>  .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>> index 619a42b5ef48..7d6e425dae89 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>> @@ -8,6 +8,10 @@
>>>>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>>>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>>>
>>>> +&{/} {
>>>> +	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Industrial Mezzanine";
>>> So, what happens if I combine Industrial and Vision mezzanines?
>> H/W does not support to connect both Industrial and vision mezzanine at same time - only single mezzanine can be
>>
>> connected at a given point in time - hence probably the above scenario would never occur.
> Industrial mezzanine has all LS and HS connectors, so it is possible to
> stack Vision mezz on top of the industrial one.

I re-checked - from f/w side as well multiple DTSO selection is not supported - and at a single point in time only single mezz can be selected
considering above point - is it okay to have this patch ? I believe it would be good to have model string in the DTSO file added.
Kindly share your views

Thanks,
Umang
>
