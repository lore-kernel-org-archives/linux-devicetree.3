Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488A3ED12B
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183623; cv=none; b=aBKie8QvqA7Nx5YYKdkAhumpjSvWNMsiehhE8rJxBW2Mo0eGe7zmGZJL4s0WBwtqHp1ChGc9NJoYhPMU7PPjtlQWBUJdxGjotw/oSqFapUUi/8T15lR1NaopjE50zWKTjnEkQhESunJcmuAXkGRjqOc4qy1hpeSmmM72mClr+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183623; c=relaxed/simple;
	bh=VLOrh/DAaupCMyxhjajp1MBq9fo1bIYtFDSr1tCSkgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GlBUp2dsiLzfiS/aN849rN8NVq/wjLYGOi3yx4j1FNvpZgncNYHnQygdHSevYhFGhNFJO9hrj3ZOCcikeaVj9Y5pXhTfHhdPNses6CxlNomql+BcDkYTQZNzJYWfy4R/kBSoGtDlihEnzIN2qY7lJGMQUinFfPrgpQgXnzlf4IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kq5tuOoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAWEz7PL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kq5tuOoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAWEz7PL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EGFiwn030085
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qTILk0FYpIrSpU3X5uT0eqdKq1WJuA5TdSAFh73KXVY=; b=kq5tuOoLQCcA+hVI
	64/KBWDulDLg21o/D8HD099MeyyVsAmviYCTrzjwAep+QRDpyv40ERJtmKWEiGPg
	UrAeDdosmgnjmGL4svF1LT55q/uS2loQO72l2RrRh2Cwbpp79TjzL40yrhlQo+8H
	WldnqFMK+cKbrjYpBNff78IV0cpm8aSiSCyxKJsuacJJ+vM5EJY5pavpNUBdG0r7
	FYN1+8Gwk7cD6U2/Xo/JnSlhF4h0GZiIe0p75VMN5GKCyyL+g9zVManPD7TGYfA8
	MJZl8HQzAJ1QuQzAW3mF7SNmcEH3WUu9f6EYDl8lv2DzS3YCrNKlbLKz2okwK4FB
	35FZvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmhaw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:20:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d97fc02d18so66073485a.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776183620; x=1776788420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTILk0FYpIrSpU3X5uT0eqdKq1WJuA5TdSAFh73KXVY=;
        b=VAWEz7PLyvMGYCjSmJjp6UlrsCCJ8j4K7K9rhlNvVprOwXEO94g2QhJpJvggssG+AN
         0rDp6ZXis0uvSoBNGSHy/7vegbU/jWH/e003tsH6EVnNIYTF1qlWlwrt95T17uuFHjxs
         0eHHDgF17CjCY02Q8k8JZylaa47SpOaES83g6LIaqgIeID8rgg6C1YYf+E1u0UtJmz/O
         vBDLrsDN7FYTVuZetyyK/+6sZ8I2J2EkjNFhVnY0N/j4CtWPEf1ZcLyjwAoVH4r49kMu
         P3TGBUa2kG/4Eq1ZlpuCn/zBjCd2hlCQF1EaeSwehrQ1Ff4yBMbK157dQV7niNMiSdeC
         u/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776183620; x=1776788420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTILk0FYpIrSpU3X5uT0eqdKq1WJuA5TdSAFh73KXVY=;
        b=AX8et+N5m0skvcl13vBx7KVNoO6JgRehFcvbwokyi6QK5+8Dpy+T5SldxowEQf1pex
         3PK+DqWElLCz32R1QKvZ5oKywOSQEGU4tSRuz0LUp+rZa+tBvORqtOci4Pd8Ry34nWMl
         YtbjLEiGjBEa27temScXTgRzLj0HSB9MbFPxMeUAEepIg953KHTI7YHFQh5bmSwNjcGQ
         P9el02x3c4FdWfbLhkx/7wnQ2kGtQ6zKPS9gSMObrjeaVB6iATCHJ5l20kQ+zixyHu7P
         MOUHZ0X1FJkn2puRGqiL4Vvp+BLEn7EFdz4nTn/aF729YzzIUsq6wiTrMid5AZEShPfV
         F0mA==
X-Forwarded-Encrypted: i=1; AFNElJ+DiEuMEWdhCz+t2GNWMT9szAun4V2rj88g/VpYAkCOSwqS7jMwrgkBQd6lFoqmatcdCdQBBi1uH5FR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7SolZHODeozEzMM6AO5zlLFTlhDZgaCFuDBGIu0i0Gb/a3faD
	toKLwLfTc3hfDAd4ESxnoSsJjh9zbec3ymf2OFqW4cXephcPzdc0MK8Fyr8hsfCkt4y4r20bbd8
	Ev2ZmAFetJw/HU/tP2Km/zaAotoac/V/3LL5FE0PzVRayNxgn07j/SdLJTkk8seqh
X-Gm-Gg: AeBDiesLzfYWR+t7+eCj6Xc+FDQYK20q+zoDgiuPasWf3/i99DmxEtCbZOiTwoxEwv1
	Sj6suWPSAJmFL9kdavCASHbeyedxPJocrQqg2K7AurdKNdSYpN8UUWSMXlo5igP7jk6FRSV9AUi
	Qip10fJxam9YPy4GU0e9BjoVGRE1Bs/0U7WsD8MiO3A0qhhMZLLNVSqGkmNOfwrT4kSf5nEpeCw
	D/Csmb3ay4Emq23yRayuTP5z9ahreCiWg7hZZq2Jz75jsC6xSIq9ANNjhtUFZX2J/G2zo6b9rJm
	XaFK9spROsP7o46ywJSoxS2ENnCgHOkGfyjXStxyCxCcM5g6xM+kzoaATCWcX85zBkE7Z3JCYr8
	Jt2nn1Te74G49sK0TMGr1Gyf/Ii+Zgj40jjE64pKtCtqmxCvH3+WhasjrqQn4B/hGGvOgt920et
	X7Uobnja8WBQuR2A==
X-Received: by 2002:a05:620a:471f:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8ddcffa143amr1838827385a.8.1776183620286;
        Tue, 14 Apr 2026 09:20:20 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8ddcffa143amr1838820385a.8.1776183619621;
        Tue, 14 Apr 2026 09:20:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec2bsm3136532a12.5.2026.04.14.09.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 09:20:17 -0700 (PDT)
Message-ID: <9cf3b035-79c0-4e9b-8ab6-a81f8d27728f@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 18:20:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
 <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE1MyBTYWx0ZWRfX8rKBZ/2v8YKV
 WwB1/3//2MsUEizc0dTTXP6uUOCPIsYPI/ri4vgZUFWT0BEhf/loTQMwrxJ2tS598/foBluH3X3
 6OfI/HOrJIpviDvMFp4rhPMNkQfZXNdRYTAU/+/hARNQpGD6igT7nc83HILlKJUC8+ct+W9KAuH
 MDcs5FELuXcB0x3HrQ4vDWiJ1+Hwl1fUiGfDL853Zm1OOmCS1RYG+Xug5ErM5g63JvO6QIz0Ruz
 pq2rAz5pCNKMWS1m0S9pI6mA2H25peOpcmqmizm4YnQRSEz96EeCqCEE27ZKb+LC4zICjKU6E1k
 2mg3SQ6qgdpnI1Np9MIlHdG525wow6jE1lUxFUBLB6IfeOHexBHEPZLCdQUpbR0YmXZLGZ7onCt
 e1yYBU83ym/yD+1rQf++IaameZ+a6Vc64bqljki94kXCPLdNgAYSnyH14BchsXtFIFHiNRlvCpD
 qga3SqstJ+OGpn1m1jQ==
X-Proofpoint-ORIG-GUID: JYel3gKztNFyBM-BeCjL2QEKCWvhMk0G
X-Proofpoint-GUID: JYel3gKztNFyBM-BeCjL2QEKCWvhMk0G
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de6945 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=u2dJk7Tg5QFwAKt5hE8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140153

On 4/14/26 6:08 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 02, 2026 at 04:22:53PM +0530, Anup Kulkarni wrote:
>> Few CAN controllers, part of RTSS sub-system on LeMans, route
>> their RX signal through a I2C GPIO expander at address 0x3b.
>> RTSS subsystem is an MCU like sub-system on LeMans with independent
>> booting capability through OSPI interface and supports peripherals like
>> RGMII, CAN-FD, UART, I2C, SPI etc.
>>
>> Describe this hardware wiring by configuring the expander GPIO 4 pin as
>> hog with output-high, asserting the selected line during boot.
> 
> Missing platform name in the subject.
> 
>>
>> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> index a1ef4eba2a20..b8371bdf9933 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> @@ -615,6 +615,13 @@ expander3: gpio@3b {
>>  		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
>>  		pinctrl-0 = <&expander3_int>;
>>  		pinctrl-names = "default";
>> +
>> +		rtss-can-sel-hog {
> 
> Why is it being described as a hog rather than a pinctrl used by the
> CAN device?

My understanding is that the CAN bus is managed by SAIL ("RTSS")

Konrad
