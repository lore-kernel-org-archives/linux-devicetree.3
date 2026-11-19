Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068082;
	b=vv8KTMheyH0R+1YNQBJhuCzqoOMvnIbCixeAsbtF1k8KgAk0rlytRvnPvzumVifW8WH7
	 Yq0N1zqJCM8FiRswyh8YIZ65vhraLEPML07blUxKs20kj1KdF+TP9iRAzvshHZ3OuSrJi
	 u+oRF+Jh2SJ6NFY8RZ+AUvP5CPGUC7ik9hEDGSBY1VoKvn3VZutUvfKEe0YnI9ghWvuWB
	 KhD7SpM5cocdEo28ZrQEbRRxaz0APsjRzFoYzhLSLm+jWnqlkEhTmr1zcTpeFiIFh7rEV
	 PIbC9Qj2BePrZBx+jQ+3D6p+nuNRedxzow5YBkxwkgNoxu794N4P+OzNRimNpgVcK2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b9mdqELT8bp82DtRWB4zY8YxriAXXRD64qNezeQDtBo=;
	b=eQMwvrzMNzGOxKA2eFKiQchl0m7qHLM1VxN3LaCxrc9LrwiwNIqTjIRCG6nJkR209RhZ
	 Ovnc+9bdXTZHVrb0xPPRYZh2Oa/yn/DCBjQSWogAXXmHtLWNQkgo8GftgiSWijiLpDHcW
	 TAz7piy3hxIF3PMx8wtjCmhzjQs33WdDjc2VUfdU4MwtgvuquW95WdYayIX7UOlQonGbh
	 iphbBWJJ1Gey8KueoaGlWgfMOTVMID8yEcpe6S103nhShcC8O5flPqbHQd158R/fChBhA
	 HMvhmLmyx+q1p7GahLDPTF6Ilahdbu3jrlDX0Yl46qnoL+MASxUKaIpYf5Bf639ZZVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItsvAUcb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a46Gduku;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2957B606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 06:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2957B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItsvAUcb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a46Gduku
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1Apdb2188478
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 06:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9mdqELT8bp82DtRWB4zY8YxriAXXRD64qNezeQDtBo=; b=ItsvAUcbehLOueLx
	NtDMkFGbr/KYQmliLkfvFRLaLtBhrkU/FvjIXJ8ohurN2X+7W1w+GwLh9ATf4TL5
	T2zXtbHJA6iYE1WKRi58TJP7/oDvwrXJfcXRyZDJ2R90QEiXS8fzUd/fwxtzJ27q
	DcvKtlkQL3845fJIEsSH0gzTrxn3MoOwQC1cCBk2zSmkeCYZbktQ0kpf2Xi4lWZ1
	/4tZB3PjbBIs7t3gtdum6Ixu37ZyRY/E0rWpksPplcn6tSKOMnmIQI5QJ6du7dut
	uuoHoeBH1kkgpBlPh+r3yWi8YAYZxskK0yYv3T+4RCHvP6m4N2MkC2r4haWUHI9G
	8bi8Rg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ejrbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 06:01:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08be1c84so25990155ad.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 22:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795068081; x=1795672881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b9mdqELT8bp82DtRWB4zY8YxriAXXRD64qNezeQDtBo=;
        b=a46Gduku7yvpZUB+WxsxoWR0uQUQIFJzoCyGRK+sBzfjbZbdZUBeCjyoQEn52QqGEU
         6G0YxSu4GCWB62mohOv7FUC0B/1//Yeuo4e1QCw0WRXnwla51a+96vTnmI4SLG+Ql3Ni
         SR/Qc9iaPK0Qdr3nxZ0CbexPEWHGHZ3FLVaeTHz/cP1Rhidfk7JLDoEJgNS9l+/5IEDO
         fObDUxYNpFxR4hRxulfzBgTVQ7VpbN8A83c3W5t38rRCZgSA5vDNByNhJmKKV9F2qoPt
         QoIF2sHj29iMiNTbKlOVMnXBb4Yc7YddrP3mugj0ycbYS4lGFU0JYhC5SIaika9w4XGJ
         NX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795068081; x=1795672881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9mdqELT8bp82DtRWB4zY8YxriAXXRD64qNezeQDtBo=;
        b=fhh0mjgI36qZcn6yixlbbNigT1+qBP3valKZi9jGWBYyz8fJCkwM+DTxlwfztNjnpB
         7AjxcxIKS01Q4N0U2B1/Gg5L2sioH961St5We9cdiMA/03TuceXRSgOzJ1ffK+HD2Np1
         gdri+q3nNksLdAfS9Z/xDpoRJzOYwKt12IEd/nqNlPvlDc7BXb7hLmeRTEjC1I6LfDJ8
         vdfExANJkyiYNTpDW89nksZX4miJHxmcYjec/a3U883RmEHfE8J9a/S1xqzKY+N8Afwf
         IA66cmMsPV8Rh9XZ6NV6iDYftAe8146OpYiuXuDzR/VmVV/CAmqeAfuGXRYlPUf4eg+Z
         Jv/w==
X-Forwarded-Encrypted: i=1; AL+hErGo7RPPrXFUYEOtLq2vIXZhZKtiM9j0I1wwbeiBTbAFDnIJQQvkE5L4KFwHVEXsOiQH2IgbGQYlu9i6@vger.kernel.org
X-Gm-Message-State: APuU4Z8g5LRsK9Z7ZZIntIvp1Rh6/9iKijCSsYx43rNrP7B23fS0Fze4
	qBSR6b2z0zxwOEk0cCtohipPkK5PKojyldpQRygEDsfpC2xzcJvOhfvhxM5Hm9ZigEIKRzSosoj
	zKcZgeL2aMiT4J/r43GKuQkx2lg8hMnLEbz8F3GlEolwxGP31GxTays29dRaAq4rr
X-Gm-Gg: AZFdTZdNvGzFqzY9wtVmFhlH4n07sacHhspAl+VE9mTgt+8fpXtmEF5T97YhpyqNvfC
	6ohTmzCjdjr5tQb2RGIf9LN9q3hfjA7P41Pf2X75FhtQ4JuOe01Jf1/lAw+1Xjy+qOrvuFtK2Hm
	9xkLIM7eLcz+u7VDp8slvI40DmYxRvErar20h8ElzGYlkFpUG++bBahOKJVtMBVo8AdMW0r9rMt
	r9o2UJtjQByASbJ+TWCM7UwHjAymysfoAcrAVBtnDI+k0MviJIo0oAfM5QQdVHe5jqe1hK5rwUs
	l9EZA4DmouP91RhuLRoxcKeJRiM5pOX1R9SXBcgYP/43Jjbxq0UWIeZcAYmKdNP4/avqRJCOkK0
	9IRzUPEQyDjRldvZJwcvX31HrT7rqeh68wBWa8YFthme2XQx0iCTjcvvHsqs5yiMnl5+R76uJTG
	RV8RGSSWvbwR8zWxAD+NmB7ydphVjYXD47CbaRrzw=
X-Received: by 2002:a17:903:18b:b0:2ef:ee74:792 with SMTP id d9443c01a7336-2eff75395fcmr47398865ad.41.1795068080555;
        Wed, 18 Nov 2026 22:01:20 -0800 (PST)
X-Received: by 2002:a17:903:18b:b0:2ef:ee74:792 with SMTP id d9443c01a7336-2eff75395fcmr47398415ad.41.1795068079912;
        Wed, 18 Nov 2026 22:01:19 -0800 (PST)
Received: from [10.133.33.7] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62db225sm24829555ad.72.2026.11.18.22.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 22:01:19 -0800 (PST)
Message-ID: <e55aef9f-daad-4ca8-adea-27edb4d2f991@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 14:01:15 +0800
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: maili-mtp: Add WCN7850 Bluetooth
 support
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
 <20261118-wlan-bt-v1-2-18bb1b059a17@oss.qualcomm.com>
 <9d2bdf05-cfa8-4493-aff3-2d424aaebe77@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <9d2bdf05-cfa8-4493-aff3-2d424aaebe77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMyBTYWx0ZWRfX5Fp2SFaqonkS
 tebrCAbEhs23wnmb/AYxXlLrKnbz3cZsieW6EmoGbyAlJzc95/Wio61UzZFeLda06AVcF7cAUmG
 /W93JW6iFSbRXgQwqBvRXLqMaRQ0Epe1YLIwGERtvu2klG0oyj8Un2ZOZCU+JXlXHyj7/KigEb6
 71pXU3o7ubGYZ2QhJZYxx0J9OnViFV6wVu50qWSWuI5yqXYplrnSq6br9IwqmnhvGjt9d3+iWwg
 7qn5ENvKVG+5gqLVGxAY1OdybuCCwx8vaiY89AyzmDF8taRusIVKKQK9e9MuiUoKrLo8jBQD+xf
 nlp5CtcwmBOhkiSZdzROke3vb9Iwgd58VVR1mOCTaV4EKnibE+1kcjC49HvN1St32VNWg+dCdAx
 MxFNbxrIhQJOYZnzQNPy5qzxV36tjUtNwcS+sdNt9iGWZLRn9v6d1HdMwbvNnd/5CibVmuigPCP
 BLApnP24r6sH272BgXQ==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afe90b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tdOc5_MkPlBmSZ2az6cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 4L1X9N_tVInLwLoI8vvXuIwSgkSI--vY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMyBTYWx0ZWRfX8ByuIcrxqSJ3
 mwqbFAThlsn+npXWoKetKQD+AhhO4/cxjDjK3c3Fdc70hQrk+ZDM1mlyN4sGSAfFr5PogPlOvdJ
 KT1CaAQAQonadiOUwOvHtkmuSGkV530=
X-Proofpoint-GUID: 4L1X9N_tVInLwLoI8vvXuIwSgkSI--vY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190023



On 11/19/2026 1:43 PM, Jingyi Wang wrote:
> 
> 
> On 11/18/2026 11:33 AM, Yijie Yang wrote:
>> Enable WCN785x Bluetooth on Maili MTP board.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/maili-mtp.dts | 35 ++++++++++++++++++++++++ 
>> +++++++++-
>>   1 file changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/ 
>> dts/qcom/maili-mtp.dts
>> index a3c2016eb9053..49fccc43c9828 100644
>> --- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> @@ -146,9 +146,10 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
>>       wcn7850-pmu {
>>           compatible = "qcom,wcn7850-pmu";
>> -        pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
>> +        pinctrl-0 = <&bt_default>, <&wlan_en>, <&sw_ctrl_default>;
>>           pinctrl-names = "default";
>> +        bt-enable-gpios = <&pmh0104_c_e0_gpios 6 GPIO_ACTIVE_HIGH>;
>>           wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
>>           vdd-supply = <&vreg_s1j_0p8>;
>> @@ -178,6 +179,10 @@ vreg_pmu_wlmx_0p85: ldo3 {
>>                   regulator-name = "vreg_pmu_wlmx_0p85";
>>               };
>> +            vreg_pmu_btcmx_0p85: ldo4 {
>> +                regulator-name = "vreg_pmu_btcmx_0p85";
>> +            };
>> +
>>               vreg_pmu_rfa_0p8: ldo5 {
>>                   regulator-name = "vreg_pmu_rfa_0p8";
>>               };
>> @@ -872,6 +877,16 @@ led-1 {
>>   };
>>   &pmh0104_c_e0_gpios {
>> +    bt_default: bt-default-state {
>> +        pins = "gpio6";
>> +        function = "normal";
>> +        input-disable;
>> +        output-enable;
>> +        output-low;
>> +        bias-disable;
>> +        power-source = <1>;
>> +    };
>> +
>>       wlan_en: wlan-en-state {
>>           pins = "gpio7";
>>           function = "normal";
>> @@ -996,6 +1011,24 @@ sw_ctrl_default: sw-ctrl-default-state {
>>       };
>>   };
>> +&uart18 {
>> +    status = "okay";
>> +
>> +    bluetooth {
>> +        compatible = "qcom,wcn7850-bt";
>> +
>> +        vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +        vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +        vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +        vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +        vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +        vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +        vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>> +
>> +        max-speed = <3200000>;
>> +    };
>> +};
>> +
> 
> uart7 < uart18

In strict alphabetical order, uart18 should come before uart7.

> 
> Thanks,
> Jingyi
> 
>>   &uart7 {
>>       status = "okay";
>>   };
>>
> 

-- 
Best Regards,
Yijie

