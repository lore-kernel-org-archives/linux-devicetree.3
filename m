Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68912352C52
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730493; cv=none; b=lr8sg4H/t82HFxbvlhEaDoTgSk/iTOwlvUkxSMR29irXsP0a7j3Q+8on6uO+7rizYffs4vap9XKF84V3mjgSc1bqOOtrrgtTEmUJiUebaLnC8ei228NaPfl0WOg7j6bsvsQb0u80pahP//ILuLCweB4bFde/+YB9AsHdSdfjAvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730493; c=relaxed/simple;
	bh=Bq5JxmM2ATw+jC5PkN78dIYvyr7OSaJ+wBoWkgB/pmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlEp1m+yWp08CLxaz/mDIvj1ycNUGiaui9qMCecQdqvBGJ6HXq5Z8YCTyhEMyp8KVXdQIdDjfKWOPgLu8yn/RBT4culHEy0TWXQukQ69SoMYe2EJxN7PWEsvsYv22jX9n59s/MxhOAcTvhfNN178LGwocdZJa0TM0WIxPTzIfVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INzYJgpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgqNTOBl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INzYJgpF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgqNTOBl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4n12646947
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIVU6P4VYTSnD8r2ghOco7OpX+x7/XaQf8n6G5cWtwA=; b=INzYJgpF+O8Og3B6
	z0H938EDIuxpBCm8TQAGFrSY/RhptvpFmBtLjDDKZHlXAwe4AVUqcOZFDf3nuryH
	1O26WdsmEYNsAhtDa5rPobbeTquWX6njyPUXfy+dbIh5QPSLH8uxQYIKUocxZ1rf
	QKJKEqmMSk9uIVEb+4/P0Covx3PZUCXCKMLQ6RrrL/rb1nZV09O/SeYz37XYt3gI
	yIiAnCeWrWKaPaPea4Oxe2Nyv0zxlLktOmF0IKHo1SqvTl7Hkx6yUYxdwaYlkBcF
	fH/RWn//w6pobD57fcjzKB+jIQbrpa1ZjP00MAXznrCLtYVEwm8GO/p/1swQwrj0
	DgA0bg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trw79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:54:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84531eaf8a8so4714255b3a.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730491; x=1783335291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZIVU6P4VYTSnD8r2ghOco7OpX+x7/XaQf8n6G5cWtwA=;
        b=cgqNTOBlP1hpfO29/eR/o+pMmKeB2VRZeQ+MOms1g152HHInbD/qFnzFPguhHFCl89
         jXEPORZPhwrs7nPYmxQUqVPrUZ13bljrA0JkRdaTvxcun7ZFmf60IyQu14Gkojm0BFVZ
         btNED4ZV3z0udMYMPj2a6QO7Ov8oGkJ5kLvpjsyZwr4Fn4rlb2bsGH7wRMAywj0p+54T
         8Gj3S+08dlVu+uG3u9txlyjA4HO9NsmWEBFzF6w3fRB57E66oFH19eVLRP5O5skMfDGH
         oAH9bM97ijjj+V3fPyxTcgikbo4pWR8CFb4B/Tn/t0JXh66JsCzm7ZaAAxzN2KMRTroS
         jZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730491; x=1783335291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIVU6P4VYTSnD8r2ghOco7OpX+x7/XaQf8n6G5cWtwA=;
        b=ksIgZWTCJW6bh963f19IzzeG7Gv0++HZFHjezY1G18VRTLR2YYTYRDntWyVCWrEfvs
         Au234LIg2CciFv5hSqKjxRcvfoxa39B4Gh8yjbUPQhUQ2KxuzC8nUkTyO/nOizgt9/ne
         3ridiE4lxjoe6hpWCo0CT55wcqTYqXLkx3ETh3iR6BNMtG/RW0PNhHpX51+RxJn8xoVd
         om+UxneAtW5kxT1u1dPL2/40yqU+kWSjXErwUwtbn4zDfPHh6wGxJYG5asptM/h4fWXF
         fKFhrrViGItGU32yKCf+untod3tJnMtNKvPMYwFt+7ms/BS54c7djgTINi1nHu0G9xT6
         9vug==
X-Forwarded-Encrypted: i=1; AHgh+RrmKwMqErinmDO/3YY3wO8PCiiXxCTylDvumxV+a+LqiZnKmqDV0Xor75C30QR5XQIr+GB3hZaqv/gx@vger.kernel.org
X-Gm-Message-State: AOJu0YxFwFFjZy09sct3PQTjtXKtMhJij+nzFnp58txAjIDZWC0GxzNz
	J5UtcssRUVlZSMq7DzQN68fqzi0Ck2hUgf9KaSMOFpJAiI/hxxG8Qk6oFyXUCVSF9LJkNjc1dAL
	sO48G0Wwx9qceFmB10tZKxcrziU7goHfaxci855Fx3TiPug8ho9+J1HgB3ge5Rf4u
X-Gm-Gg: AfdE7cncWCtS6cdHc2B4grR1yJX2nuRiKK+n9v0k1IxcQH3Hk1h80GNuhhkxcQ8fCat
	+wA3NqX+gkmOKpf4ZtlB6/reMg66seh5OZyKqD5aKUwQRNYScSTwF860bOw4B9GUU6f/D4UPNzl
	C4jAv2olqn5ioyW+Tnyd/1dhDI7Cm3aCSDsZZ1ihPq/sk1l2dTsf2dgLs6B+J86LeTNbWUIa25Z
	ug+RyXAy72m8w136r6ULH3Migaa1QrOGXaO4eb2vcrAIB60bhKQZiqTNbIl3jrUSho+9ULjgMJa
	p1vC7tcnvlxt9t3i/9ybuhqcNe1s7VRtsKpCy9PgUwt6kw28WGeYYuiRcHTwOgZ/kmPABqFCNx2
	FN/CbvFxlTx7tHWIlWfkfg1OIIYNHZC2nnjymS2A7
X-Received: by 2002:a05:6a00:6c88:b0:845:d111:c68f with SMTP id d2e1a72fcca58-845d111d3f3mr8346126b3a.1.1782730490895;
        Mon, 29 Jun 2026 03:54:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c88:b0:845:d111:c68f with SMTP id d2e1a72fcca58-845d111d3f3mr8346100b3a.1.1782730490354;
        Mon, 29 Jun 2026 03:54:50 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84781063884sm2108200b3a.24.2026.06.29.03.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:54:49 -0700 (PDT)
Message-ID: <f46b78cb-cee7-46ea-985c-6fb1c2f21071@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:24:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
 <ypic3vctnnci7mkv4bg62n5xsgzpd4e3mam5kt2nvt7dxzyim4@zdzpup6uydtl>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <ypic3vctnnci7mkv4bg62n5xsgzpd4e3mam5kt2nvt7dxzyim4@zdzpup6uydtl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX2pFYmRg575TA
 K2JKGA03FezJuPYQ/oMFpfKYmXH6wZqU0kJfPlemvx4rlAx/O0nQaiA1FKkBDKAC9hLU2Fgnv3b
 C8JWliX85f/pS2vteqFFZGrx3U+62n6Qc84Isn/OvywKZj/92rdFSZEaaBMBqh14xbE8ViDvs5N
 Q2rHDJw0JxppVIeGj0mx0zE51Pbe8I2a9qOD/QVfUmP9OGdGUUnQ+BcMPN7lIQWafUcb+piradM
 CPVZ3t8Y0+kfU07XMrYs+iANTJz/Zj6MsQ7LzlfRab731lQLdkkEeWzq7os6WfuFFswF56tJ3hu
 gF/DmXnADptHdqi5etm+ldqrZhn07bMDyddPSX6e6w9+gIM3va/hIW4ZZEdbktI20NXRObk7zdN
 ZHzI+IPPYmoDYElLqfBsZX9WA3KSwwB5QiHmMxwzvYNxbcyIe7OfssUKRl6mAuPTdLriyTKnYLU
 0tfxLp3RURY1YofyrRA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a424efb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ygE_Ldiqm4PXnjN6XKYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX0sSVMqB15V77
 QQO+tWxongPwlEuhO19HSIMZsSlZafdH+YsAI+rx8iB3LgE0IH6I9N78ZUb1FBneND/59ePGOrN
 NqGt8KxBODeP5XfBDwWJkPn4CJ9MjWM=
X-Proofpoint-ORIG-GUID: imdyJ1KBdt9CsmoJYpl9lcV80Hi1b10d
X-Proofpoint-GUID: imdyJ1KBdt9CsmoJYpl9lcV80Hi1b10d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

Hi Dmitry,

On 6/28/2026 6:00 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
>> board and add the DLC0697 MIPI DSI display panel node.
>> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
>> for DSI PHY PLL stability.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++++++++++++++++
>>   1 file changed, 104 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 683b5245923b..c9ea093cd8ca 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,18 @@ chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   
>> +	lcd_bias: regulator-lcd-bias {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "lcd_bias";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		vin-supply = <&pm4125_l17>;
>> +		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-0 = <&lcd_bias_en>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>>   	wcn3988-pmu {
>>   		compatible = "qcom,wcn3988-pmu";
>>   
>> @@ -60,6 +72,52 @@ vreg_pmu_ch1: ldo4 {
>>   	};
>>   };
>>   
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&pm4125_l5>;
>> +	status = "okay";
> Empty lines before the status property, please.

Ack, will update.


>> +
>> +	panel@0 {
>> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
>> +		reg = <0>;
>> +
>> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>> +
>> +		vddi-supply = <&pm4125_l15>;
>> +		avdd-supply = <&lcd_bias>;
>> +		avee-supply = <&lcd_bias>;
> AVEE is typically the negative / ground supply. How can it be supplied
> by the same regulator as AVDD?

Ack , I will update this using two seperate regulator-fixed nodes, 
vreg_disp_p and vreg_disp_n

as defined in schematics.

Thanks for pointing out.

>> +
>> +		pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
>> +		pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
>> +		pinctrl-names = "default", "sleep";
>> +
>> +		port {
>> +			panel_in: endpoint {
>> +				remote-endpoint = <&mdss_dsi0_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss_dsi0_out {
>> +	remote-endpoint = <&panel_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&mdss_dsi0_phy {
>> +	status = "okay";
>> +};
>> +
>> +&pm4125_l5 {
>> +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
>> +	regulator-min-microvolt = <1232000>;
>> +	regulator-max-microvolt = <1232000>;
>> +	regulator-allow-set-load;
>> +};
>> +
>>   &remoteproc_cdsp {
>>   	firmware-name = "qcom/shikra/cdsp.mbn";
>>   
>> @@ -116,3 +174,49 @@ &wifi {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&tlmm {
>> +	lcd_bias_en: lcd-bias-en-state {
>> +		pins = "gpio151";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	panel_bl_en: panel-bl-en-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
> I think, recent recommendation is to sort these entries by the pin
> number.

Ack, will update.


>> +	};
>> +
>> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +		output-low;
>> +	};
>> +
>> +	panel_rst_n: panel-rst-n-state {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
>> +
>> +	panel_rst_n_suspend: panel-rst-n-suspend-state {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +
>> +	panel_te_pin: panel-te-pin-state {
>> +		pins = "gpio86";
>> +		function = "mdp_vsync_p";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +};
>>
>> -- 
>> 2.34.1
>>
