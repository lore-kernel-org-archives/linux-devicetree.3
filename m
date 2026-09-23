Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C9B565108
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192616; cv=none; b=XRpptQogSA/1hlb3YBucjjH7/AGA60eLhnJjSpzwThQE0kTvk3XaX8XPq2VPrdpCRNAd3iGQvsez+hsGII/HZ8KA80pPNkY/BBfH08vPEBZr/cOBlYsX4pD6sHFKnBJ45kGATlz4xlj0aZfenSzyJPCJ/9iA8KSshWMlR3uJ7Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192616; c=relaxed/simple;
	bh=wWKQuvyubDHU/IrhFMArkBmNX23h+O7QmsVELBq/Zqo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qDcI/JTfVHmLASZXUSBJ0NXdeeb6WgSRnDYwQINJu1aEd2nKAhK/JKdaB1VjtE+7i1imu3/CZgm5nA4J7Roixh8fvtEZ+eIu8J5M8LEdXHtWbwjmAvbplDqqTfV87rcqF4Ibr8gyhtKd6IN72C0/Bed7UDwNEHtnho4k3y5+UZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpynfH6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWq4I4yW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpynfH6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWq4I4yW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGThV42470173
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tcK25AN87gEvJkSzvkoezzruWqFJIqdKKxQJr08+SQ=; b=kpynfH6YJ06P3Zj9
	8te25+csNfOqZozEPdNX3QqGDI21WuQjsukQ2nGWBIbw9KF5JkJwgN9UWNKDf+2Y
	bMx3bYF9ww/SW6xGsfbjgMC4fNN2RtCT6PQ3liPmwwGqZzDqG9W/5IBmUFSl3lSE
	SB/KbRMUuYnpLUrUcqn4gUUvBr8XZfxK8iFSFITSISfGiNxKIFSngAlhFJnZMdD7
	7cBOckrFe5wAjKw1fAMfHi5shKrdW53r4i8yFLGrdup17D73BD7x1ZPPUuDyL6na
	RZsgo0BSaiMUacNmLFLYc8CkAsUDBwBusSOB1g2gpNuC2jtluUI5QvXjc6okHgBA
	3foE5Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv1pdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:43:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a8e3cc28e6so172661137.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790192613; x=1790797413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tcK25AN87gEvJkSzvkoezzruWqFJIqdKKxQJr08+SQ=;
        b=IWq4I4yW/VOxRzKa4tB8miDmy6c0eO5Tui9SnA5n2+TX/D+zRNeDWiViQUnj/04rEW
         ek5RRbNvmn9TPNbyZOFyopjq7Z2LO1Ed1jM0y7Z1b03CO558waVa4S49mikZbYWrKVwj
         crBYBDZmmyRU+cGvHaUZWn7YBtTUdqnGUEAk9Hpwz+Pt/kLq6B1M4LlcXiKtP9fpCuu1
         /Rvl6DHEHkrmPGkpovG44Dsd96mwKmuA5THGPx9rsQ6LMP5FlQBGG1LcVzTW7mcZkKo0
         5Ml2EpPag0WhJ3pa6DdndYCegbKkAEMpb46dKJpyF44X67pAGgNnP1tgAUpf5Q0PmGxE
         bgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192613; x=1790797413;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tcK25AN87gEvJkSzvkoezzruWqFJIqdKKxQJr08+SQ=;
        b=vQ/qPFiRpc/UWWsCCSPfkcLP67dUqh7a3hz5QN/fI1hE9f1SqtNPz9AQzPNZLIT1Fr
         mzCv/d5dylKwxsEDVbbN8pRXrDVJ84HzdMZdaTeeXLHOaVWg4CDsQhtuXCLga5HDchnq
         QC3CeYyloXXShxyMVK2xSoZd9uxNHetNDspttwU+u/hq6+V60EB5Yo5FOdmQjBcQCB12
         5eSSXrzYS4UL/ast2rNDRxK4W1NbeIOMbHeZalyUHid4Z+h6oJUaYAZURCIQcYfSEsMc
         suChHSCEQLKQ4fhKtyKpvnHya0LK3RBa745Gbrq4gXrHZqa4SYMLn+a/QTnSSRuyWsUu
         tkbA==
X-Forwarded-Encrypted: i=1; AKwUvBxb3XPMh1ybd+eKPMsa7ffJ6WX4/1Geerm/tHtx3qeKbjrXl8dGmK8Kn4Tvf+Okti1+MLY1kHkK/auH@vger.kernel.org
X-Gm-Message-State: AFuF++nQ9L5Lc79rR6NLYNBZL/3MOyc2JP+IL++rpNKPXyKX1AUCdsG5
	m/lKr0rVU2+4s6+WfzPSPQtXPNfMj5AhOnauxYzXwjb1UbD+9Sb7ONEhzOjAlALdtlOTmXQ8A3E
	3UfA3mn2J/zLWXp2IFZ+ugsxBRZ3TrfZvu4NDG/VNlGP1DpteL+k8UWe/k+UFbjWA
X-Gm-Gg: AYBFou39DNyp7prBSoJDd2yo/cy/x2S1qqJkx7cg9MGXHwpMxdZoA0oHlba+5lH0gge
	rxwXR6iCdwRnyL9T7FKixV8XDFG8OUVpgFUW1zgdPLR5D5O6rzdKfUtYPtj2qk1RNHkfljPvy18
	wz7h9rZtIduyseo1irFNVJEEEhdkV2iZxul5vtaot0G8VZTjE628QGI/5a5fXrsCgR51zWl56C5
	4BiSZYDWrOimP02cGKszqdqXBP17S9mRdtoyzs6TU9LtkhBpYWPNxa75vaXT1v/t7+kzkoEaalB
	HpvehfmWVObzWsya3ydUz5gIu7ZSCUfA4FRcmy5oxX1IP738rX6sfhMiWDsjT0xOba2G0tesslU
	YmFJ9ocHyqCOnr9Cs9T0+WW6o32YP/KJxZv0qFwbkUHTJJouf0S1vLryVs4+0HUbSLdyyAzmg7+
	hJKJCyZZyNVZ1jKngH6mTbs/rO+LJE6ofr0y/DcNISFOr8pmU/x5uKvfCXB5RJkZlAmMc=
X-Received: by 2002:a05:6102:83ce:10b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7af1f40bbddmr147534137.34.1790192613085;
        Wed, 23 Sep 2026 12:43:33 -0700 (PDT)
X-Received: by 2002:a05:6102:83ce:10b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7af1f40bbddmr147521137.34.1790192612673;
        Wed, 23 Sep 2026 12:43:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a8fadsm2311498a12.24.2026.09.23.12.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 12:43:30 -0700 (PDT)
Message-ID: <067c2405-575d-44bb-8301-9c8dbd00febe@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 21:43:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
 <339deca4-8b35-4fb2-bc1d-adf471f94d06@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <339deca4-8b35-4fb2-bc1d-adf471f94d06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3OCBTYWx0ZWRfX+ktmh0ny2P1r
 Mdz4yBbMxf67drDBeX95t3yX84xr/NcA7PkuMi1M8iXkPGKYLhH3tc0dceDJODCL255AMAKmpeA
 ZJZOEj6nl8JaiYtMXVengmZ3ZQmbT3Ig3JYXp78WxST98CTJJi+SkARzo4vp0iSfjyZ2ENnbmJR
 bdTYbqElUix3h7y5g9Phmj6XFeDhnTsma3GD+lcuKxVfjH9Bbz03+lhBgUDoyXiDzdoW20s1lUl
 E4RDqinq1iKsJkobpljMNjlQ53pyA1t6IthS0OhE/OblPQOOB1xk+SiD6KqRDSDQYc05r6V56Oi
 KQzkVOqBkKYrtHYpW3HB6TGYnHyB2dItbfsGIvoPJlC9gpMcz/ygdTjDpaPC0mpiTOOYTOsidQS
 CxS648Z6BYswPJprDUVRtNqMj0bl+vzZrX8zZ80heJcPhXcjNbp/nOIOqmyV1cXGQkwWwzTUSAL
 XZ6+TwlDAW71RuWFy4w==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab42be6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3JiuneIwTK63PGPfPcMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: t3NCHRsN7Cm0tcWC-GVFGwj7yyfrODnt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3OCBTYWx0ZWRfXzGzzgkNmmyyy
 +tlNNSazZ6bsus7V4RmuFcBenuyX/k4+eln1RbzGw2lJ3NGT9heXL8yZLF3uawJ+FRCJeHPiZ5W
 ImnIK/P8GYs+wN9IF7WrkBzszeHWKHU=
X-Proofpoint-ORIG-GUID: t3NCHRsN7Cm0tcWC-GVFGwj7yyfrODnt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230078

Hi all,

On 23-Sep-26 21:07, johannes.goede@oss.qualcomm.com wrote:
> Hi all,
> 
> On 22-Sep-26 20:18, Daniel Lezcano wrote:
>> Add the thermal zones for the ThinkPad T14s and describe the board
>> temperature sensors exposed through the PMK8550 VADC.
>>
>> The keyboard area is the main thermal constraint under sustained CPU
>> load. Add a passive thermal zone for it and progressively throttle the
>> three CPU groups as the temperature approaches the 53°C limit. The
>> groups are activated at 49°C, 51°C and 53°C respectively, with a
>> 1000 m°C hysteresis and a 500 ms passive polling interval.
>>
>> The cooling maps limit each CPU cooling device to state 6, which
>> corresponds to approximately 1.9 GHz. Testing showed that the system can
>> sustain the workload with all three CPU clusters capped at this
>> frequency while maintaining the expected performance, making it a
>> suitable upper cooling state for thermal regulation.
>>
>> Several configurations were evaluated while tuning the keyboard zone.
>> Using a single 53°C trip for all CPUs allowed the temperature to rise
>> quickly but resulted in a stable operating point around 54.3°C, about
>> 1.3°C above the intended limit. Introducing staged cooling before the
>> target significantly reduced the thermal overshoot. A 49/51/53°C
>> configuration kept the steady-state temperature close to 53°C, while a
>> later 49.5/51.5/53°C configuration improved the heating response but
>> shifted the equilibrium slightly above the target. Based on these
>> results, keep the earlier 49/51/53°C staging.
>>
>> Also add a passive back-cover thermal zone which uses the GPU as a
>> cooling device at 64°C, together with a 73°C critical shutdown trip.
>>
>> Describe the remaining SMB, SDX, east and west board temperature
>> sensors as monitoring-only thermal zones, and enable ADC thermal
>> monitoring on the corresponding PMK8550 VADC channels.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 142 ++++++++++++++++++
>>  1 file changed, 142 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> index 5cc6a63d1ef6..9407868864ad 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> 
> I just noticed that you're adding the thermal-zones here.
> 
> This should go to x1e78100-lenovo-thinkpad-t14s.dtsi note
> the extra 'i' at the end, so that the thermal-zones will
> also be used on the oled model.

And when building with this patch I get a bunch of DTC warnings
that the pmk8550_vadc node is missing a:

	#thermal-sensor-cells = <1>;

line.

Interestingly enough this line is there in pmk8550.dtsi and
parts of hamoa-pmics.dtsi seems to just be duplication of
pmk8550.dtsi, which we really should fix.

Regards,
 
Hans




>> @@ -10,6 +10,117 @@ / {
>>  	compatible = "lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
>>  		     "qcom,x1e78100", "qcom,x1e80100";
>>  
>> +	thermal-zones {
>> +		soc-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
>> +		};
>> +
>> +		keyboard-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <500>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
>> +
>> +			trips {
>> +
>> +				keyboard_alert0: trip-point0 {
>> +					temperature = <49000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				keyboard_alert1: trip-point1 {
>> +					temperature = <51000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				keyboard_alert2: trip-point2 {
>> +					temperature = <53000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				keyboard-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&keyboard_alert0>;
>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu1 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu2 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu3 THERMAL_NO_LIMIT 6>;
>> +				};
>> +
>> +				map1 {
>> +					trip = <&keyboard_alert1>;
>> +					cooling-device = <&cpu4 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu5 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu6 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu7 THERMAL_NO_LIMIT 6>;
>> +				};
>> +
>> +				map2 {
>> +					trip = <&keyboard_alert2>;
>> +					cooling-device = <&cpu8 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu9 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu10 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu11 THERMAL_NO_LIMIT 6>;
>> +
>> +				};
>> +			};
>> +		};
>> +
>> +		backcover-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <400>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
>> +
>> +			trips {
>> +				backcover_alert0: trip-point0 {
>> +					temperature = <64000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				backcover-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&backcover_alert0>;
>> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>> +		};
>> +
>> +		smb-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
>> +		};
>> +
>> +		sdx-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
>> +		};
>> +
>> +		east-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
>> +		};
>> +
>> +		west-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
>> +		};
>> +	};
>> +
>>  	backlight: backlight {
>>  		compatible = "pwm-backlight";
>>  		pwms = <&pmk8550_pwm 0 4266537>;
>> @@ -35,6 +146,7 @@ vreg_edp_bl: regulator-edp-bl {
>>  
>>  		regulator-boot-on;
>>  	};
>> +
>>  };
>>  
>>  &panel {
>> @@ -58,3 +170,33 @@ edp_bl_pwm: edp-bl-pwm-state {
>>  &pmk8550_pwm {
>>  	status = "okay";
>>  };
>> +
>> +&pmk8550_vadc {
>> +	channel@144 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@145 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@146 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@147 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@148 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@14a {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@14b {
>> +		qcom,adc-tm;
>> +	};
>> +};
> 

