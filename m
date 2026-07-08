Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C503624CF
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517423; cv=none; b=qkDkwZe6GeKrG0MD+gS4HsRyKcNYj10I4251Hh5gGk6BPR+pZgIkuViZ95gExPOw7r/xR8p+3bFkbZgfl/CPYXA3vwO3POeK5C62/1185dCX6gLmc+PbHCUwddZch5o1YEt4Sjotn9xu7+wa5IeC8LZxVh5h3tBH/O515hi+DYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517423; c=relaxed/simple;
	bh=cFePTmMUkT3lRt1laLkIkh/dM/PSoWk01lu7/mhTCWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdALlwwl9R1bZ3dDe6cRBXbgpy3AuUtB18QikpPMXi6FTUGKcJxltkWrHHpPQnCM6dEeIdWPj20de/7rna3g4q6sgs0+HzyoxHmzIKE8QMYdowhwCLnniPO/c4H3O5MON6ofh+8MMMTRpQxhAZLRZ81p+9itL84NdokrPyNZNr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+Gsu0hc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Os0OS9Sw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+Gsu0hc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Os0OS9Sw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3QWD2617297
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 13:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9fhac78ZhHdttAnI46BHlBR95LUlCDDTOTw+svQZV90=; b=P+Gsu0hcg9253m10
	riYq1HmnVAjmOR3v2F+KeGp3NNc4yzwGs8koHlQ4SCth+BDB+BYf1b+1WaLzFZjI
	eZz5Ak2iZT0lnzVSB62WE7u6s+S/o7i6Felhyfphx0CiAl8WMEl+KrCwytlcb0wF
	8SmewvAciK/KVOqVEvj5iRGxwxZxEDoKCF2qUuarweb3kdJDy22lzd3F/HHTAdN8
	lY+IuG7GG3Fer3t0y3XPu2AbTp0bSQ/wuA1AiTruD1jqtQqvAL2FRnyScPd6g29d
	+akzyaHl5RYBXsj6KT68oaTi/X9t7jbuDak2u1k/l8U+gptpGIffeHeIQZkqBJWR
	IjWZCQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw9q2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:30:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e86066fc53so14198336d6.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783517420; x=1784122220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9fhac78ZhHdttAnI46BHlBR95LUlCDDTOTw+svQZV90=;
        b=Os0OS9Sw0lHngysAodBfsfcFHKANvlPXJmC8Rug8ZNLy4GYBMb9dfk5WSkeDjONnkN
         Wpy86TdifRBXPZ6co/nfjpNzBhsYxVgaDPRLEgfh3nNYFSBBHoBs/NFervFuNVUnFh2a
         xlgR/pXMEtervn2G/zXcHN+1zmT3N7CHRx+20DeQWRcsqROgbjH8DkbiZ1HFA2rn4P48
         olB/L13GbyGZWQ9R4rC69laPUKm8317bgLUqk/Jd9w9U2SG1gTDmkxztlNz6PDRQ6mwi
         0hglTIN5GBixh4icHaRV9wZQNoaVPK/M5mzEHxtEMSdss58Facrcs70RquMe2t/UAeS/
         kBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517420; x=1784122220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fhac78ZhHdttAnI46BHlBR95LUlCDDTOTw+svQZV90=;
        b=fJLvmpHLYMT5iVX0eMYJ54nJwks24y9tid7ME0cjm8XWfGQvMawz28p1X5vMTpy6Kb
         ZPMFUxU2cwZz3pTuaIL9sfqHKHiPdoShEVer8UDG1GLDye6Qor3ahwlgqQeL04yX2kl1
         5iSNZFdqtGvMDsIGbnPIjbvzxzjbhLRVpYQBL8+DTVyDL3uUyDMRth7jJ/S68Oy4PmAy
         YjjWslZDH5xZSbH2Yh7wO9OcDkcXPaMmYkxNxyP2ZdcSb0TSkd9gvnQ0hvEnO8u+QWVj
         RBjGqbIXxbXJOXvlHa8MgJ68diRTwOsU5XpacEOZIAghZ9s9PUJ312jsdQQJPXLJmjsO
         IkgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwgmtYQFYD0NZDTRHUpNE8kvYuaLcAxk4SeWsIKutco/a5WYE4H9696P4CQGdGUsiWC2mc0ndSnngX@vger.kernel.org
X-Gm-Message-State: AOJu0YxE8mt+5ZwKST/v0EKUqJaEkwvDl+ks+t9D5dWO4ygAzM9h+333
	C4PDHBV9a1l3txjFoIeLgM1blUN+prPX+btGAOwUHaliH2OXhPe1WleTtU9gUvbQm/Q5+mlgujv
	dJ1Y6yD/loscLJnaUS0VrGBmqz3jf9mVBx2zoKn8TgkeTH+POZQJkAjqxb9laF9xjDSQQXqSx
X-Gm-Gg: AfdE7clqyDUtr2dqin0wwI0yWlP4z7BILUFInGAoBTPjZKpxlNDELKBNMv5ubgXoxKK
	DYhyM0gHj9Fw+Xfus899CqvQ+P92lnsBOEG4YOHikbf5z53mfWYycjUCn+B/cH8oKDzTtoHDzHu
	RjsMrk1PU9VLOOwv6Oe9MHCBbNgzuEwEKBfGanz2gLnor6gz15Gbt6QpCbksizmb9Hhydaqa67t
	NWWuuSmE34gSzOxniB6A1BRfWu1IRKJ6gpO2LZo3Ozwx/ppaRo91QlMhaJqHG3Caug3cFbL05/r
	1O1SadWc1vjcYac1OZw39XE5mauetgJGiurKmnAJpSVOAZrH8sDdz/oAmJNhmK1wkyZrenCWHya
	jE8rDf8VQ3gawVzN1260HdtEaFMDvDQmY1Ve+MfE8OeNvaDwZ0RbTMaICzQ==
X-Received: by 2002:ac8:7e96:0:b0:51b:fdc0:ddee with SMTP id d75a77b69052e-51c7a7722b1mr72523201cf.30.1783517419712;
        Wed, 08 Jul 2026 06:30:19 -0700 (PDT)
X-Received: by 2002:ac8:7e96:0:b0:51b:fdc0:ddee with SMTP id d75a77b69052e-51c7a7722b1mr72522571cf.30.1783517419060;
        Wed, 08 Jul 2026 06:30:19 -0700 (PDT)
Received: from [172.20.10.5] (82-132-212-199.dab.02.net. [82.132.212.199])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0f40d50sm161991545e9.5.2026.07.08.06.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:30:18 -0700 (PDT)
Message-ID: <2fbf3481-0f46-4942-8273-7f6d827c2b15@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:30:16 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay
 for Waveshare WM8960 Audio HAT
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
 <CAFEp6-1VVmF-hrpPf34bFiYGOaa2HU9Pcvupt14MCjvW2-4VAA@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1VVmF-hrpPf34bFiYGOaa2HU9Pcvupt14MCjvW2-4VAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfX82EYZ1BbQyT4
 5FhylxBtRwQVJEk0tm64LAjiaKARZ47tNZmZkpFJmXkmCWOEBmbTfcfw/wkN5D4lyNmoGGt/iON
 6wMQ27MhuKvQ6yJJTwzja6tn9uAJVtE0cTCBedY2QB/E9+gTA4o8wocHx7kn0gUjg8qhQs/puQO
 jpRWJd+YEjj7jk3sWoL9/+ag/uL0fr/kvK69K5iuYU2JGB5wY72GmzyR1bPHF1Vjy9JuCE45bTn
 0YcUiGvE12D9Ne8ZTcwx4aijMuiFRwGhYeRwqVp1WKpfIGJHEE+26vf8SCP40kQDJwnV6GKf2a7
 LP2ZbNpDfg6QFC9LtaSVn84z01jcsr7yHDo6CNcJ50ZjlF89eEQ04utxZUCr+7tzC5Qh71oteZ1
 b/7RMNXITBH4tfmzEyy+z/XBMerg/ov2A6wOBQ81P7EBHtcLKnVDAMX8nuwJjsIYM+ffyZj7XAA
 9jtfmwqS0h3+xGvvVxw==
X-Proofpoint-GUID: p__kzTpLS7gVb7S8hJQ1eNyzEmq_yMIZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfX2jZ1N5q+Dzs0
 fIKct8nyRclBoLyw8hm+chbSj9Czi5htzcOSIgZ26M1IJQs+CTgN6ZtKOcxbAD1yLk4vaXlhWpA
 5XbHl29pM8yW2j7nNSYNrhvB6di+H4A=
X-Proofpoint-ORIG-GUID: p__kzTpLS7gVb7S8hJQ1eNyzEmq_yMIZ
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e50ed cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+oHb8pcatGVxCjskUc2jPA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ME7h6NJbtsD6biSAtVUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080132

On 7/8/26 1:33 PM, Loic Poulain wrote:
> Hi Srini,
> 
> On Tue, Jul 7, 2026 at 6:37 PM Srinivas Kandagatla
> <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>
>> Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
>> 40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
>> the WM8960 codec on I2C0, and the corresponding I2S1 playback and
>> capture DAI links to the sound card.
> 
> Looks like this hat also features a button on P11 (gpio85)?
> So it would be good to extend gpio-keys in that overlay.
> In that context, maybe assigning KEY_NEXTSONG or KEY_PLAYPAUSE?
> 

good point, We could add this, interestingly Rpi does nothing with this.
Will add this in v2 as PLAYPAUSE button.


--srini
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>  ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
>>  2 files changed, 104 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 5a1c56cf98f6..27cce61893ad 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -59,6 +59,10 @@ dtb-$(CONFIG_ARCH_QCOM)      += mahua-crd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)        += milos-fairphone-fp6.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)        += milos-nothing-asteroids.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)        += monaco-arduino-monza.dtb
>> +
>> +monaco-arduino-monza-waveshare-wm8960-audio-hat-dtbs   := monaco-arduino-monza.dtb monaco-arduino-monza-waveshare-wm8960-audio-hat.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)        += monaco-arduino-monza-waveshare-wm8960-audio-hat.dtb
>> +
>>  dtb-$(CONFIG_ARCH_QCOM)        += monaco-evk.dtb
>>
>>  monaco-evk-camera-imx577-dtbs  := monaco-evk.dtb monaco-evk-camera-imx577.dtbo
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
>> new file mode 100644
>> index 000000000000..cf7b6a220bab
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * Device tree overlay for the Waveshare WM8960 Audio HAT connected to the
>> + * Arduino Monza 40-pin JHAT connector.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> +
>> +&{/} {
>> +       /* on board fixed crystal */
>> +       wm8960_mclk: wm8960-mclk {
>> +               compatible = "fixed-clock";
>> +               clock-frequency = <12288000>;
>> +               #clock-cells = <0>;
>> +       };
>> +};
>> +
>> +&i2c0 {
>> +       clock-frequency = <400000>;
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +
>> +       wm8960: audio-codec@1a {
>> +               compatible = "wlf,wm8960";
>> +               reg = <0x1a>;
>> +               clocks = <&wm8960_mclk>;
>> +               clock-names = "mclk";
>> +               AVDD-supply = <&vdc_3v3>;
>> +               SPKVDD1-supply = <&vdc_5v>;
>> +               SPKVDD2-supply = <&vdc_5v>;
>> +               #sound-dai-cells = <0>;
>> +       };
>> +};
>> +
>> +&lpass_tlmm {
>> +       lpi_i2s1_active: lpi-i2s1-active-state {
>> +               clk-pins {
>> +                       pins = "gpio6";
>> +                       function = "i2s1_clk";
>> +                       drive-strength = <8>;
>> +                       bias-disable;
>> +               };
>> +
>> +               ws-pins {
>> +                       pins = "gpio7";
>> +                       function = "i2s1_ws";
>> +                       drive-strength = <8>;
>> +                       bias-disable;
>> +               };
>> +
>> +               data-pins {
>> +                       pins = "gpio8", "gpio9";
>> +                       function = "i2s1_data";
>> +                       drive-strength = <8>;
>> +                       bias-disable;
>> +               };
>> +       };
>> +};
>> +
>> +&sound {
>> +       pinctrl-0 = <&quad_mi2s_active>, <&quad_mclk_active>, <&lpi_i2s4_active>,
>> +                   <&lpi_i2s1_active>;
>> +
>> +       i2s1-playback-dai-link {
>> +               link-name = "JHAT Analog Playback";
>> +
>> +               codec {
>> +                       sound-dai = <&wm8960>;
>> +               };
>> +
>> +               cpu {
>> +                       sound-dai = <&q6apmbedai LPI_MI2S_RX_1>;
>> +               };
>> +
>> +               platform {
>> +                       sound-dai = <&q6apm>;
>> +               };
>> +       };
>> +
>> +       i2s1-capture-dai-link {
>> +               link-name = "JHAT Analog Capture";
>> +
>> +               codec {
>> +                       sound-dai = <&wm8960>;
>> +               };
>> +
>> +               cpu {
>> +                       sound-dai = <&q6apmbedai LPI_MI2S_TX_1>;
>> +               };
>> +
>> +               platform {
>> +                       sound-dai = <&q6apm>;
>> +               };
>> +       };
>> +};
>> --
>> 2.53.0
>>

