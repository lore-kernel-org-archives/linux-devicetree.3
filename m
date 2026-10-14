Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F68D494803
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 19:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007574; cv=none; b=Eer61eKZAQUSvsuyL/UxxNy9QRwJo/ByS7Nb5IJK6eN1Gw35MyHf415etSouvCo/CBKLK/jX/LkMNQo0yYu0qGmwmUka/rlta1o8xJLEtefbi5iIBvJBukikDhlu7+SAQk8Ch5wlLarh/mIvoAHMXem4YGtEotruenKrHpTYXGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007574; c=relaxed/simple;
	bh=ReFpRRAgkKoEWbjYXMpmQZT0kUFVcs63CwxVD7BMpAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SihIRxXoNQAJGf4BnmyPzTf4pmjc/NuHpW7DdrAweGAnVgM+9kXiU+GY3wwJOSyh+qOQF0t7L/bcqjhBXRkAbZpN9ikF6sUPJp/7GLdcf8xUKRWt++qtvnNpJefcdfPwQ2R9b3mHQPa86vTWRVPPcxfFKCZzNMCWAC/DMkTScxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqUfeNxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsIjeimn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqUfeNxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsIjeimn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EHRCwE842056
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 19:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcZFLeKS8LbCHuSy15Plp+ehXfZaNLPig+CMGbpTyt8=; b=BqUfeNxk/WSzdUE3
	vl0PdSWOEw0v47QE/lklo92yQJkQAIwDKW/Qeb5beUwZEfqpX4mjWsHI6K3mEhTt
	vJEUAgSi0LqaB8ciRHA0bvm6WeLVyjF0vLCIAbSYQXiigtzLPnuVMyXishzv30eP
	ixHit0zngfExkW79Lo8ql+njNmrVjO/6CCFN7GTJCAT5Ph0LnHDNXdQOGc0jtZjy
	P/FOB9Kj2eRt4RbwKwkv4KOO70Trmm+EQZriClV5JwNAi5DN5VrlH6h7udCUFFW+
	xc8brsaV5lYnL/Ya+YjbsNVZZAdAL8Y5EskIx9HxOwrUNS4D3GMRoMqza2/VcsYw
	hS38mQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wrheg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 19:52:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso155373285a.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792007570; x=1792612370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcZFLeKS8LbCHuSy15Plp+ehXfZaNLPig+CMGbpTyt8=;
        b=JsIjeimnhr/VFMsz0HkGvDcZ8U0q0EO9tP2R5L72T2tyspQjP0Qoj3imoPGhzqIfTj
         JD5igi8yc48Gsz6FooDzQ7o7iYC0OlUPGWmQ0oMfuWsthrFQyb25Haq08JmUoxAWUryJ
         5L7WrIv9qCRGc2A2ufoG+JnCYHx3u0/letmYZSKiZKLj11YQU9OTQ9R+XidhEu9pD6jL
         vClq/t0XnFMZMZSJI3q7Yo/5/J4OFgsZAcbU3hfTra/NobHkeNrfV+81E1ueCBUyxIEv
         FvGNbw3fI3oliyqRL59mfiGyFaX30UXPFGwCDPX0mMURWFi1wWN8ATydNk2o6YplZNHj
         Xgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792007570; x=1792612370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcZFLeKS8LbCHuSy15Plp+ehXfZaNLPig+CMGbpTyt8=;
        b=vwc+38qbtPrC0SVEEOe+y3gFE+vR8chZ/ymMuscS+RyZd82UhE9TBEqVpb8GAkvC9m
         AqRrjR1e9VLorfVap2iPRTuUI3ldfe7K+AneQMzI0f4Mj9QtOE4uoD0qi1KlelLtdM1Z
         TlO9ACOUXqj4XmCexLsaNq0HkRq0W+oR5fCF0k+OZQWqQhILnrI0egihKRrVy9x831KU
         d6FRG5dfVjZUz9zSLY7zS3aTB4dC2WuZnNaV1T0suB8EgeeZftyyWPHH7qzY/TA+XTM+
         VmhQfoOsRrA7LqoIE2KxDRoSncdqycDR0m5qcMVATBUyOHBRrkZz2dxNzhDmcwMgrCzb
         k8MQ==
X-Gm-Message-State: AFq9FYIGuyM9Ph/VzewwIaZCfGVtgCglFLFfmP8PMssHg4qhMeXAJ6bo
	DPC1mfiK31Cmxlq1M+DGkxdEJ9VCN0xZ+Mk6XNky2aKHga5b+bzIX+u1ob+BwQ+3c+fBVDf+/wr
	Q0b4HQ2k//+tdsFcfW7He7HSz6ef2GwT/N5tn/lTmWYhctWB6l3HxFgk2stidHbt+
X-Gm-Gg: AYBFou1hVeN8evoGt2n/j3z3d8znUEIEgyvg6yE5Mr0VwXg5EtWFb+kM1PJMp3+8XQ7
	6FBK3YAiSC+pmwYGCJiOdNBlIB7p2xP3z7zC/JuX/eLjuFGIHvLOPwKVk/corU3V+1iovOSeu6Z
	isIgnjZbcLEuWdtgKeyDd0se6gWd0UpdmQOixarywAVQtubwA2hKtdpA5yH2Gh3QRC8DkY6mm+h
	wtF9kTRMFzfm6Ybyqd9g5xKX/w7fzF8b3UsghuYMTLqHj86WKv7XU/QRaex6ELd7qq5Jm31gE1y
	lZbg2HN3yWWzBpRW7s8RI+b3OU0URG1YD4yPxlmQ+fb/j43H47Gx0nOdGXnfamL9udbiYrjLAp2
	zjmI1GmlCL/0XPBr5ZX4sC5QVxGtKAZrJ9mtkEwiXIClRBY8MfnCu8Hh6/SQC/A==
X-Received: by 2002:a05:620a:450c:b0:93c:66da:ee12 with SMTP id af79cd13be357-93ebd1ba9dcmr2766271185a.19.1792007570426;
        Wed, 14 Oct 2026 12:52:50 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:93c:66da:ee12 with SMTP id af79cd13be357-93ebd1ba9dcmr2766267785a.19.1792007569945;
        Wed, 14 Oct 2026 12:52:49 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd66c5e6sm10626005e9.2.2026.10.14.12.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:52:49 -0700 (PDT)
Message-ID: <6496e610-03c1-4d7e-9061-34c05aa7f356@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:52:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <sashiko-outbox-171811@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-171811@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3OSBTYWx0ZWRfX+aGeefinNM9R
 ul01NzEuXD/zKmzkiOJyzTRGad11q6cIg3yucbLoT27sZwe6sWLTVkrt3vj8Q40mT+qbmW6HNEU
 OSzQas44jSJRxtYJveWYcNXglqpunm4=
X-Proofpoint-ORIG-GUID: EVzrebJlYMGcxpHYwP5a7Yy5Zo6icitH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3OSBTYWx0ZWRfX5xL9HaHZ/7M6
 CZ4xqrgej7G0GsIL3pMx3d1vDRnuGG39iqybYNd3iDtN/yQ8UGe3QWNDerK9rFo4GSG9y/oBbLW
 E7VieXmIZVG31W05gvmTexgWriK/USGIjgzGIL6v/OWM4PP2Zqfl8JN/o20b4IOA49W7fRO80SE
 e5+WgPfxb+F1lX5/LVfazq/2GenM5bXKLhgsZMx8s97F8tHmkbX1UKsE0TyPczx9agqzMw10mA2
 lF+5cmlcRWr6ekt/tdfDOMkgDRpW1z3ii8JSPoj441tnAR3VC/MlmBwuddXGYP/tazuWrE/FUwb
 CghZOJeaxQlOIADsecfUiNHH3fBsQalY3hDd7OnHKEqLkTc5qAz7kekl5LIuIMtlHyFv5gM//Xv
 Wrlb1ApiP1+KRugbJUwBPS5sClXh6n6fcnX4TczgBU58/k0fgm1sxseYUs7CurQOlhwA67Zn/cD
 fJOzl50Zfbn2oroe3iw==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6acfdd93 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RCLMfyQtFAjoeX1RJPwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EVzrebJlYMGcxpHYwP5a7Yy5Zo6icitH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140079

On 10/14/26 21:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dts: missing #thermal-sensor-cells causes thermal zone registration failure
> --
> 
> commit fd5ef96fe4a4a5f82c85c0157e689c00a5a97d30
> Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
> 
> Add thermal zones for the ThinkPad T14s and describe the board
> temperature sensors exposed through the PMK8550 VADC.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> index 0bee2a3d6e7a9..9586421553442 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> @@ -502,6 +502,81 @@ platform {
>>   			};
>>   		};
>>   	};
>> +
>> +	thermal-zones {
>> +		backcover-thermal {
>> +			critical-action = "shutdown";
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> 
> [Severity: High]
> Does this setup cause thermal zone registration to fail at boot?
> 
> During boot, the thermal framework resolves the thermal-sensors phandle using
> of_parse_phandle_with_args(), which expects the target node to have a
> #thermal-sensor-cells property.
> 
> Since the target pmk8550_vadc node lacks the #thermal-sensor-cells property,
> will the device tree parser return -EINVAL, causing thermal_of_zone_register()
> to abort registration for all these newly added thermal zones?
> 
> [ ... ]
> 
>> @@ -1285,6 +1360,36 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
>>   	};
>>   };
>>   
>> +&pmk8550_vadc {
>> +	channel@144 {
>> +		qcom,adc-tm;
>> +	};
> 
> [Severity: High]
> Should this override block include `#thermal-sensor-cells = <1>;`?
> 
> Adding the missing property here would allow the thermal framework to
> successfully parse and register the thermal zones.

False positive:

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/tree/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi?h=for-next#n291

