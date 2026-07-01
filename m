Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6843EF0DC
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782897927; cv=none; b=DNA77WXa0K4dzqBLnQJ+HbQ18yGrDvLsRBzeFpSAC5K+QUC6kUn0bofHQRxgceNZHhAV3ZQ7+y+QJDHeNgBKxoiH8dZ7UoVTAik+reb1ODfdi902JksntKVAKdE/G8EY+iUuVeCImOiisYk3xSbK2iXTmgST5n8Go6ll5BlHn1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782897927; c=relaxed/simple;
	bh=mrZJL0wWuiBiYZaLKVduTJdGQVMOqrorjV68LoyJ6uA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RH+8R3/CgjEbMtJmOuvhMRv4tpnpv4g0qtl9bmGftMLuNFjK7VT8Zv3am86sEgXP0ADTd3sxuKVMGLztwmWO/cQ6ZtE+JnnPuxpJWPmvg/TagNJNKpTXnb1sRJHBqpDiWmPDtEq6cI3dKIEIr+Fiea9gqPPZYzaAA2ofafzzvdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX+PgbEy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OuEr57O1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AX+PgbEy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OuEr57O1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GLED489279
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 09:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4oM/c+Ilwmkiwi8yamCajo3c+lZrBmHM5pAIIsPN0Jw=; b=AX+PgbEy+fWhvRrN
	CYcu5+4NKk7khAXp8M4ypaxPZTiVM3e01J+ps9xiTeTCAwmRnuPKWi5grTkJVTiE
	adWCwGu2E/k4K//sLbmkagCrdwKnRRpssKAZwaywPD8mlcRGlnY+RzMZqDijm/Jq
	Wa3MgRqvV63HL03YqRhv7uBbYicO+gwcnZgxMl7k9fU7+PHSqO+ZDo6zdM2sfrer
	qdLJXU0+i6v5WeOxg2s0pjhdknXSw59cS2h3hhpY30bH3PwTHXWmidhjxF1oi8m3
	qWTX82Uq9ml+eiA9gLI5hNUOguekqJjkxZzhIrpfl8IYK52KrARsidYfK3aDSeBS
	q7Gnbw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0auymv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:25:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca53c486f2so6100075ad.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 02:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782897923; x=1783502723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4oM/c+Ilwmkiwi8yamCajo3c+lZrBmHM5pAIIsPN0Jw=;
        b=OuEr57O1GGdzjxOTZegQUP1J+8mNMvB6fgA2gzaZSHt1vRCpjjB7O3mb/i/pITUaBx
         gtipaGeocXzWBggRkXqd40vnQJYew4tBG6SFzc7aBEduRb2X/r6kaEAq5c8CgTjPpvrd
         L7ZxxQKzCM7wGKd/PbAdUeXgZDe49MypH8Q/1NCZBkjbHA8t4yxHIjOqUD8XwuEpwc/8
         WwI4SqIkw7AhLXSUJnbu/towS8D08y/R5IuaM6jUduy4WrBEj8ogyniKmEawDjgAGw5m
         TJF4RIxDGqXQvYSAF0PoLqB3NHTbEqAXWq5AVIcsIv7lkfoekf3FI05f7pXQNoLLj3rA
         igVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782897923; x=1783502723;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4oM/c+Ilwmkiwi8yamCajo3c+lZrBmHM5pAIIsPN0Jw=;
        b=aqy8qVmcxwcDJYo5OzY+fbuRsX+g9ve04aBMhYkpmgzul1oEJ3v8i38TtUTyTLRs75
         nJIgGKkF0PCykVpwCk7WI84CdCEEs/kXVqtqxiju9TI76TQQUee5PxF5jppI/hyNRwof
         6SDQJsq4935sI9Wdbu3rs4iuAuGs+KPPZs9cXuA8RpBOAS/MMxWvIB6fy0lqGgenHEMv
         ixjUKs3wJcSy+0yevOtLYUFjAKk1cytFucY1saLLR1hvLSXNVs9GHBA2xO+zJxS3jRry
         BzwbzTLoPZV+gxWJvjgsqn2k0Rpc1th/FwhFn5s5ZYuZPNCxIqZHlcn3qshEiCDCm1mI
         Ya3g==
X-Forwarded-Encrypted: i=1; AHgh+RrVtWUo0mOmJAth0r3Gkjdrt7zBqzzUMWKY9CFfXecKBR9SJxEyG2fQUdv6mn/wdz7THhaUZWI3Utb+@vger.kernel.org
X-Gm-Message-State: AOJu0YyA/JQyEyKXFkNmn1W7bCxP/iHnAVtCYlC9i3u6dHkVteCyjIyQ
	FK3NziqKwrNNR5XH0q9AONl2Na7Dcrh475xZGDfZ+V3yppeKN0o8bz4PHPGQBk35q/8wn8aKo9q
	VfC9lx7e5ZlrhoxDwJ6h3WXFVN97v+C7f7QuGToV0kC3f6dLvyvGwtRz++8brchc/3rBbIbSj
X-Gm-Gg: AfdE7clUApmsUB/38m5x3fy2hs4H63LocfnuyYnLvGH7PeRGiuytiz95l+b4HnU/u5Z
	8caYDQcEb1wQOPNhgl/oFdz0JLuvSNksWPxr+LRi+xvdCP/1CORS7NFJj/9FkFmjytpyfoSri8p
	V/YOTD1hzWCjXjVejYZ45A6ArZ1VJ9xMsypqcCcOHAaZWuopHzYeBCF1ljMYUhnBU5ptLzqngPy
	7GbiH8LF1hQfJXf4Sgjs4eoWb4kQaCkUgxlIjQE4bO4Z2sJk/8jG9qXfqk9e+D++ph+djqPEKZg
	IaXKK/tgIyeiUNvME3bonZ0jjcu+vxKnuKJ4f4wW31pVlB3PSrFRPrlJRJ5qvHVYyhyVGO0/2JV
	MEqTladuxydQveDRgjdNI/DQHwFGg+XcjwkmypYzF
X-Received: by 2002:a17:903:4688:b0:2c9:99a2:d108 with SMTP id d9443c01a7336-2ca7e8b53f8mr11354285ad.37.1782897922745;
        Wed, 01 Jul 2026 02:25:22 -0700 (PDT)
X-Received: by 2002:a17:903:4688:b0:2c9:99a2:d108 with SMTP id d9443c01a7336-2ca7e8b53f8mr11353945ad.37.1782897922220;
        Wed, 01 Jul 2026 02:25:22 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c82810sm28865905ad.28.2026.07.01.02.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:25:21 -0700 (PDT)
Message-ID: <25a71fc7-6eaf-4a6f-b511-26e1827ddc7a@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:55:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
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
 <f46b78cb-cee7-46ea-985c-6fb1c2f21071@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f46b78cb-cee7-46ea-985c-6fb1c2f21071@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44dd03 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ni_s6_Wbm9bTVVOsB1UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JryQ4ewzBfJNrlgGDvMEYcn6hGMkmQh1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5NiBTYWx0ZWRfX3FX4oM290IvB
 rUfoNCe0zLoo6Cvur56q0TH5fLzVkeNr8ClYb7fQyqjExh/XI67SjRZVoxqwBeBw7eSgTAvpTTy
 SRucp5hs4jmxnpXw6odG6GKn+RGOhBE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5NiBTYWx0ZWRfX6RRToZAlL4Ez
 OZDF6uZKiXDHenNllQPyi5G4kIogm3bShWrg2b4fnTTXAveqqZ4WmrWkAT2NUAPF8hhkt2cDC8o
 pRqIj8D+jMyUERBu5vmDx/Rb0/jhq2uxqToqqlNTqZt+9mrcwuVXls7UMyDuGZHcJupVlht8wvt
 Wo1Uy4G6pIq9LwE3mshoasInImkljnV3QNy2cjW0Y084pz1JinTK047qeDVacVfcyB90MFkI759
 fzGChPT597rstIkWsz35UtYpF8MXHqYw4wjugYOpXWEbfI0ZYxhL7FL/0RwitoCZYQosT8XJCHm
 ciE1hFs/uP38dGp2z8XQZiIpphRnQr+pEM9CW7SSKpVrvc67W0aNBLLTxO8FAiGM5JmMhytsdu5
 BtbrkFmrR7gcy7RpTMxKvyk9uDdxNZtJK8okOj1JLpr3Ahvw1YpQyBA3iG6O2e8e5CCcYPH/QjW
 st6u870om0tMUh+/A1w==
X-Proofpoint-GUID: JryQ4ewzBfJNrlgGDvMEYcn6hGMkmQh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010096

Hi Dmitry,

On 6/29/2026 4:24 PM, Arpit Saini wrote:
> Hi Dmitry,
>
> On 6/28/2026 6:00 PM, Dmitry Baryshkov wrote:
>> On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>
>>> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
>>> board and add the DLC0697 MIPI DSI display panel node.
>>> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
>>> for DSI PHY PLL stability.
>>>
>>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 
>>> ++++++++++++++++++++++++++++
>>>   1 file changed, 104 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts 
>>> b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>>> index 683b5245923b..c9ea093cd8ca 100644
>>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>>> @@ -23,6 +23,18 @@ chosen {
>>>           stdout-path = "serial0:115200n8";
>>>       };
>>>   +    lcd_bias: regulator-lcd-bias {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "lcd_bias";
>>> +        regulator-min-microvolt = <3300000>;
>>> +        regulator-max-microvolt = <3300000>;
>>> +        vin-supply = <&pm4125_l17>;
>>> +        gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
>>> +        enable-active-high;
>>> +        pinctrl-0 = <&lcd_bias_en>;
>>> +        pinctrl-names = "default";
>>> +    };
>>> +
>>>       wcn3988-pmu {
>>>           compatible = "qcom,wcn3988-pmu";
>>>   @@ -60,6 +72,52 @@ vreg_pmu_ch1: ldo4 {
>>>       };
>>>   };
>>>   +&mdss {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&mdss_dsi0 {
>>> +    vdda-supply = <&pm4125_l5>;
>>> +    status = "okay";
>> Empty lines before the status property, please.
>
> Ack, will update.
>
>
>>> +
>>> +    panel@0 {
>>> +        compatible = "dlc,dlc0697", "ilitek,ili7807s";
>>> +        reg = <0>;
>>> +
>>> +        reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>>> +
>>> +        vddi-supply = <&pm4125_l15>;
>>> +        avdd-supply = <&lcd_bias>;
>>> +        avee-supply = <&lcd_bias>;
>> AVEE is typically the negative / ground supply. How can it be supplied
>> by the same regulator as AVDD?
>
> Ack , I will update this using two seperate regulator-fixed nodes, 
> vreg_disp_p and vreg_disp_n
>
> as defined in schematics.
>
> Thanks for pointing out.
>
In LCD Display Bias driver , it takes vin from vph_pwr along with LCD 
Bias enable (GPIO 151 controlled supply) and it outputs two signals 
vreg_disp_p as (+5.5v)

and vreg_disp_n as (-5.5v). I will update the dts as per this.

Thanks

Arpit


>>> +
>>> +        pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
>>> +        pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
>>> +        pinctrl-names = "default", "sleep";
>>> +
>>> +        port {
>>> +            panel_in: endpoint {
>>> +                remote-endpoint = <&mdss_dsi0_out>;
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +&mdss_dsi0_out {
>>> +    remote-endpoint = <&panel_in>;
>>> +    data-lanes = <0 1 2 3>;
>>> +};
>>> +
>>> +&mdss_dsi0_phy {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&pm4125_l5 {
>>> +    /* DSI VDDA - must be at NOM voltage for PHY PLL lock */
>>> +    regulator-min-microvolt = <1232000>;
>>> +    regulator-max-microvolt = <1232000>;
>>> +    regulator-allow-set-load;
>>> +};
>>> +
>>>   &remoteproc_cdsp {
>>>       firmware-name = "qcom/shikra/cdsp.mbn";
>>>   @@ -116,3 +174,49 @@ &wifi {
>>>         status = "okay";
>>>   };
>>> +
>>> +&tlmm {
>>> +    lcd_bias_en: lcd-bias-en-state {
>>> +        pins = "gpio151";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-disable;
>>> +    };
>>> +
>>> +    panel_bl_en: panel-bl-en-state {
>>> +        pins = "gpio91";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-disable;
>>> +        output-high;
>> I think, recent recommendation is to sort these entries by the pin
>> number.
>
> Ack, will update.
>
>
>>> +    };
>>> +
>>> +    panel_bl_en_suspend: panel-bl-en-suspend-state {
>>> +        pins = "gpio91";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-pull-down;
>>> +        output-low;
>>> +    };
>>> +
>>> +    panel_rst_n: panel-rst-n-state {
>>> +        pins = "gpio3";
>>> +        function = "gpio";
>>> +        drive-strength = <8>;
>>> +        bias-disable;
>>> +    };
>>> +
>>> +    panel_rst_n_suspend: panel-rst-n-suspend-state {
>>> +        pins = "gpio3";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-pull-down;
>>> +    };
>>> +
>>> +    panel_te_pin: panel-te-pin-state {
>>> +        pins = "gpio86";
>>> +        function = "mdp_vsync_p";
>>> +        drive-strength = <2>;
>>> +        bias-pull-down;
>>> +    };
>>> +};
>>>
>>> -- 
>>> 2.34.1
>>>
