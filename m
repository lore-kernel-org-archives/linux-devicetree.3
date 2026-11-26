Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660334;
	b=2W4R+IgDQVgqMyXG/3Ku3stv2Oof6i87DIQtfej/rdKCdtqFjt/+kezL4Sh9I0k2++8T
	 TADqR0HBsacX7y1/2KSegzUBQl3FRJoQMQtXD8kXExCNPfS6Jy08GzEwWGnWsZxON0P5z
	 90wizb2p5f8iguVtIgyBOC/jOuKEa/IrTf4nA3fiM8y2U39u65pqgYfd0wwSOptgnE38p
	 t3KZXDkWla2QbZyK7akcqsEizAYccORedpTC5vIkuT/dcSBWnx6ThPslH7LnSYBtgYqmS
	 Z1ilCKlSdGIeF2h5/diVnVM9bsbWa8nqpQAhTgSOwPHS1cpMHV1pxHmQbqnRfKcsUXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=;
	b=eLtxhoFIX7NFjiSFwILf7KK2A0O4lnpRCFHajqTf4Ljmhjvx+Ag1XCssKUD1EFKnP0Fn
	 UY9Cdp+c7skV0QW/ZFcau9a9XdcRC6ACBEr3TM7NYMsp+fOHmXGTimXN97h6+3wlcYQsM
	 qmCU3Y0+MBUdc9Ie9Bic8RSqTM66lxFanFFP4r7vMC6RGAIagUUjf40pw/daYUQNmlcxI
	 tVPphm8e2INyBRGy1v8PO1E19o53Dc0pZcuvKjzdsLz5CKPY4xe79JA5xeLiMVO8SL6y2
	 UXr6sRUYr/HhamwrQ9SbIIN7AQfao7pwNRWrR9uO+D9NpXeLOb8jEFyCJYd6JRcASYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WfoWGa1S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmpriTNG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C7606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WfoWGa1S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmpriTNG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAnVj1357574
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=; b=WfoWGa1Sw1GOI+hC
	/OSurM9Nx3Asa/NFMQzIld1qGMqXtwTO1Ie+/LNl+oZKTZhW4crNOLM36shmCzP4
	U2yiq+itKTY5YG6Dt7FlWA4hZ6exYClmrloeqCgyDqOj58iiIHhP5rCIyPXrWo1X
	3o9T0PfABWUNnSp9pfEfM1l++97bsrCRBXw5jNvqjXGCXZPVAIf9sQdLN/oLMe4j
	VoZx0QR3YTcwBOfk54I6FjQ0LiiK+M759XFcARvzGa/mF7xcoHhI8wB/h8Ul+Lkr
	E+MZ4/9jfFi6SJ8gwJWCB3pzTkNpOvwd7iVXDazcPskXpULhD41CAp0uxaVsBvWN
	BXDbAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxtut2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:32:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9212b76b1f9so82910956d6.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795660332; x=1796265132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=;
        b=fmpriTNGu7wJbjqw+78BabtcKRmoMeNKNh8AiMDD/1DlB3xHs1ZvM3ImKtWly+3aW5
         BJ6i/IEpiI6nCVcuG37Ay7/naMqeFF9H+Lq733I+qlHfHTTYkTAeDrILlvvClZiEsSTP
         EFQNVyfCGjSeK7YxAxQLQBzhzj/5WeLC6KcnitnM9Qd0gIqIk+ucTCLiLR9vM4MMBdgK
         mg1z4c9Dsq9r+IEbdCBTnPUCg1/RXGK0FtZOHkKqcL2hHDB2PqztXHt6gAm9f4JbJymd
         ajcIpTgGekXgKjdri97lecbb7O37qjyXXoE5UNY2cmha635jtpfzMT3Z5/TsxXWpMJyl
         2jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660332; x=1796265132;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=;
        b=Dq5pSzdMh2YNtkgOtrCculbW2g8mblZ63WhWHGLE80NxFVUovp/8gsuuC2pvP23uSu
         er+FIQZeBIlc/FEUPNQdYzMkfD3BaBfmwQ4kpU7fmbk0RgAy0wtuOv2OQjZ1vQDo/wf0
         onkSgAyHh0iGw7rxlDae0GiIn9F5CqCYRUgaU+CAlD879TOobLDxnx8B0axBoOI+ur8K
         XphBGrXIE5suM2hcFaozqDmUVyU2cbmBpY5sI/CEe8XTLilFJ569losFoqgorsp/5aLZ
         E50awkMiqEd5JnT39Tl2rgdNFjeYCdWgQYqKRxUIwOwxkyYSuAo7FF4ZJafXSWd/armZ
         +nzQ==
X-Forwarded-Encrypted: i=1; AL+hErELXA9Vcsqn7EQjODBEcaSu+I6lV9qfaP1kraM5LLXoTwF8zbiOxua4Bl7iM0SdmfGS9QgnnAhvCDd6@vger.kernel.org
X-Gm-Message-State: APuU4Z/ldtf1SRhGuqs+81ZicIIRbm5dN3CrDfk+WMcEA6E/Ildc6/LY
	2SVicJkPhEbT3LLIloVk+o+n8TgSl4JVxDjao4C+E34uwgsqnFcRFY5v/4M8vTnbh3WiI71pVSl
	mOY8RUW7QPd8Fo3B10wK0HSbIFWHebTM92QxpalHYIm9xnsFCTCmkSjbwugfjZLfY
X-Gm-Gg: AZFdTZdM67fsY8fGL+dE+faHcL3SLmCnSeKP0WS6a7iMqwtgEGW2vrf5CbCA31oNZP6
	nMYfqxoRLVOAivTRlf0zsaEJK5z7IOVfTguqWA7254EoRPEtiZaXU0SBggQBQ+azhEYpAayc+k7
	/RojKE/GHb7dAkMYhjLlJlAXjNelX6vQkFdnsX2py0PwocSQNuniFIChiDHGdu+4jSzRnBJO5tn
	Q0tpiRjwWsFL/6oKMLgxVA53NIJww79WOWCluUL7i8g1ZXSDX8DVlWNShgPkR6PVXCM2sbedJq8
	WJYGav7m0FVA+H1IkYYgfAbqUunxn/3X0XGf4qer2RRNTUxz7eQ1HhmG0wOOVfXZzXNPg/nXRah
	rk8KeIKVo3RhHaibomZGrWaecPssiemqPotWzkC4en4PfGYOeQdghft7wtfGDwF/IbRyRRRX47R
	rOBtMS/itI6ljVP/NLr2Bfkg5aoZiHla1QO8Q=
X-Received: by 2002:a05:6214:3f89:b0:921:3c14:a08e with SMTP id 6a1803df08f44-9213c14c1cbmr332066196d6.15.1795660331811;
        Wed, 25 Nov 2026 18:32:11 -0800 (PST)
X-Received: by 2002:a05:6214:3f89:b0:921:3c14:a08e with SMTP id 6a1803df08f44-9213c14c1cbmr332065816d6.15.1795660331250;
        Wed, 25 Nov 2026 18:32:11 -0800 (PST)
Received: from [10.38.247.193] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213479655asm178017406d6.4.2026.11.25.18.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 18:32:10 -0800 (PST)
Message-ID: <86390ae2-8c33-443b-9730-ebaf4db1b968@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:32:02 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 23/23] arm64: dts: qcom: eliza-evk-imx577-camera: Add
 DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-23-8ff2a11835f6@oss.qualcomm.com>
 <38bdcad3-2c2f-4e55-9a3e-17047b9f486f@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <38bdcad3-2c2f-4e55-9a3e-17047b9f486f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3eD5lgiz2gyq9j-Ml7Cn5KqIomubrAtD
X-Proofpoint-ORIG-GUID: 3eD5lgiz2gyq9j-Ml7Cn5KqIomubrAtD
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b079a2c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=cvRs29UJe7UXO2q9YXUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwOCBTYWx0ZWRfXw6ag7pQ8zJ0v
 XZvVhWQjKlgdjpIsVsTP07kUOTowiulONA7LTfQ4aQ/Bk3c5gHGXQfkNfHPr4221GoFvuoI0LQN
 zTWRUF8iVaLm6BFovK+HSbcpzLZLIojfC566A1amLpRL1LCffKrLyFXkf9CHqNMM+opNXItqlcl
 1n17N//ggOW6SETgKIjwe9QWeTAaxzNem6TXhgmmkPAQsOMwIfyUYkgc5w+sYARgqw16prtSQnV
 gbttJ2+uLXfNZ6YD+nUuAy515ewsDVFxzp6uLrjIDo/qNemTMJ+c0Cr9ly7avvS1Qt1+tY32DHH
 6/Kbx8+Vfxc2GiC4grHt9pVV3R26zxAwAhGJ/uQ7tYJ1w35Y8t5xVYHZzev47Pjag1f7957l/2T
 TaNnwy2OwX1U4rvYwoX2xpNmAVdAel3ekJRU55Nc7ICEAeNldq3LwfDAGqOPyFs6V3J/vtNj9CQ
 T7uhQ2qbrphFwZ9ScqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwOCBTYWx0ZWRfX7vo8ma/GYwtj
 /BW6+s9Sq/gkMX0PNEyWU6ijjb4MrlHoy8jV0GtQrFVAm6j//tc8Wwomq4dbTSPxn7cLK+bbEB4
 N/a1RJ3ib5Q9I0znD+8N8wzjsyNST+Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260008



On 11/25/2026 9:25 PM, Vladimir Zapolskiy wrote:
> On 11/14/26 13:29, Wenmeng Liu wrote:
>> Add an overlay for optional IMX577 integration on the Eliza CQS EVK,
>> shared by the eMMC and UFS variants. The sensor is on CCI0 I2C bus 0,
>> uses MCLK0 with its reset on GPIO8 and connects to CSIPHY0 over CSI-2.
>> The overlay enables CAMSS, CSIPHY0 and CCI0.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |  4 +
>>   .../boot/dts/qcom/eliza-evk-imx577-camera.dtso     | 85 ++++++++++++ 
>> ++++++++++
>>   2 files changed, 89 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/ 
>> qcom/Makefile
>> index 
>> 64d2cfdb89c89f1c6eb0085e2bf5877ff980dbc4..a9374c54dd514f53b7aa97f5581c99cb6e75697d 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -16,6 +16,10 @@ dtb-$(CONFIG_ARCH_QCOM)    += apq8096sg-db820c.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += apq8096-ifc6640.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-emmc.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-ufs.dtb
>> +eliza-cqs-evk-emmc-imx577-camera-dtbs := eliza-cqs-evk-emmc.dtb 
>> eliza-evk-imx577-camera.dtbo
>> +eliza-cqs-evk-ufs-imx577-camera-dtbs := eliza-cqs-evk-ufs.dtb eliza- 
>> evk-imx577-camera.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-emmc-imx577-camera.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-ufs-imx577-camera.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += eliza-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += glymur-asus-zenbook-a14-ux3407na.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += glymur-asus-zenbook-a16-ux3607oa.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso b/ 
>> arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..08f2e3c62dbdaf23a2f6ca69a5c392054cb1c225
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/media/video-interfaces.h>
>> +
>> +&camss {
>> +    status = "okay";
>> +};
>> +
>> +&camss_csiphy0_in_port {
>> +    camss_csiphy0_inep: endpoint {
>> +        data-lanes = <1 2 3 4>;
>> +        remote-endpoint = <&csiphy0_out_ep>;
>> +    };
>> +};
>> +
>> +&cci0 {
>> +    status = "okay";
>> +};
>> +
>> +&cci0_i2c0 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    camera@1a {
>> +        compatible = "sony,imx577";
>> +        reg = <0x1a>;
>> +
>> +        reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
>> +        pinctrl-0 = <&cam_mclk0_default &cam0_reset_default>;
>> +        pinctrl-names = "default";
>> +
>> +        clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK0_CLK>;
>> +        assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK0_CLK>;
>> +        assigned-clock-rates = <24000000>;
>> +
>> +        dovdd-supply = <&vreg_l7b>;
>> +
>> +        port {
>> +            imx577_out_ep: endpoint {
>> +                data-lanes = <1 2 3 4>;
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                remote-endpoint = <&csiphy0_in_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&csiphy0 {
>> +    vdda-0p9-supply = <&vreg_l2b>;
>> +    vdda-1p2-supply = <&vreg_l4b>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&csiphy0_in_port {
>> +    csiphy0_in_ep: endpoint {
>> +        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +        clock-lanes = <0>;
> 
> Here 'clock-lanes' should be dropped, it shall be implied, and I belive
> it is.
> 

You're right, I'll drop it in next version.

Thanks,
Wenmeng

>> +        data-lanes = <1 2 3 4>;
>> +        remote-endpoint = <&imx577_out_ep>;
>> +    };
>> +};
>> +
>> +&csiphy0_out_port {
>> +    csiphy0_out_ep: endpoint {
>> +        remote-endpoint = <&camss_csiphy0_inep>;
>> +    };
>> +};
>> +
>> +&tlmm {
>> +    cam0_reset_default: cam0-reset-default-state {
>> +        pins = "gpio8";
>> +        function = "gpio";
>> +        drive-strength = <2>;
>> +        bias-disable;
>> +    };
>> +};
>>
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 

