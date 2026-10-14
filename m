Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867374E3234
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987427; cv=none; b=A/thhbkkpibaB4wUf0sKqKvE2pFT2BZ4SubUTG2ZCVA0RpWWR7y4eOoyRdiFQbUVbADBnuH1obDuzO+EK/CgWojhfVxGHmk4vqkeU6RU3Xyqvq/M6LP8vAmW+tp5EdjIhDkVbiRsTqeHr3haKu1c/kHidTY7YcXH6P23YtwMaOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987427; c=relaxed/simple;
	bh=bgHFfuc6EdWx8rSax2do4tdHnzY0R4ikfH/Rh1vNpvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qx42vehxtPkFePyt1bUwQQ3ARL8ttRD1pTg570X06Ka5LUA2yJz8oT6adXt2tV59LXIBG969z0GwwFV+ARHBU4XBsabO9gb8/seGUXG4lrMxG9JC9evb+UPLHhVSQOol+rYdv8Hr36BWPcsTeBaYfe7aCeDLYDys48IQukeZCA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbunqgzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+ENacVA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbunqgzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+ENacVA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBVQwQ2515931
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c23MFofHP0klFIrGtzPvfehmbgdnuZ+gVK4BzbRbTsM=; b=jbunqgzc2+ZMmLGg
	qrJcujJBn4ImqbJeT7hSI5C+Wr2JE+nO3OoEothkkYkrghXs4apP/kczkvCoFrdC
	0LVtX6j5mOU8dBHIDrbiuKY0eMeBq0aTaF2BPTRAKzWcRjYiInvllL3tU+4aKelr
	D4P4QWoyyyllQEkrQ9IcAoC+KfPAbkZp186EGQ5AmtkjuVKIOVwjG52iVO6LbVzO
	uVJBfCcgWbA+bBAFyX8L/oUefCG8jSrtlM0ry0VA7V3pTjVYVSzFqWrRDrMai3re
	lpu0RjuJhhE26iQbsR/aZI2ts7JjS2z/yRF/C1bdfHDkBdsnP2WphcQ8T10TySge
	mGL3lw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709xfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:17:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso1761550e0c.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987423; x=1792592223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c23MFofHP0klFIrGtzPvfehmbgdnuZ+gVK4BzbRbTsM=;
        b=j+ENacVArUa//d8J0OOdWcJKiVDHF2uC2MMvho5sFv/2esrppyLJk7F9OlzXx5mQeo
         ktlNFnWHEIBzPvSTt4PysdbAkC5JUV33WsB8dfgro2OA4K7rm4DxbwOe+g5pfE6a5Lxx
         B7qEDPvZLcwxyU3w4poChHpXezPjVe6aohCXssj2FIaPvnLhHs3TboOv3VVpaMzigLy2
         FkfUUTAksKsnQl1QEYd5neQfBhOzetzVqFsl+93jfM9lCJSArxv4z44xYfTZ3yuw6Wj5
         npLb2DIzfHQQEY+8pbrD7oURBA1KFjzgDsbWTPatJw0jqdysA1hYOY/CYvhXdI1CcCxV
         XlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987423; x=1792592223;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c23MFofHP0klFIrGtzPvfehmbgdnuZ+gVK4BzbRbTsM=;
        b=mlyQWgXFkmhAsQlhfKyAOwa+zCJ59KCWYQ1iwqGP8rbr4KHwv2h9PRVf/ZjFLDUKUg
         rI2sneBViIORD7HgbL0iLHg9n33el3U9kOwXj0D54h0T7oQ/2KilB9ajy7flsXoh1xqC
         N4/ZY8BdGQ+C4fX3PFOEE8oDHjWgoN1yJADH0+ZkNFjSi8gjEbBfDhfjorE3Cs3PHmDz
         xXXn+DfuBXuZ44LIVR6tABSHdTIvdrIfUUoAU4MFTmqmUuw8/ASXm6igb/zI4kH1jbrV
         ckFWbimujwhYxhqC232COxFNQ6Cc8ZHk+PlF+DVwjfZba8FyelNwL6Qaj+2gC+ngnv2l
         w4sw==
X-Forwarded-Encrypted: i=1; AKwUvByMAOougA+lowJsqddtgy2DU3Mnm20q1nencGPGOD+SVpTp2W8fHeITYZNRJvjxPCUqX7DkM742UBZr@vger.kernel.org
X-Gm-Message-State: AFq9FYI0m7/sYfY7bjZxI5W0r8pnKBdRrRAbGkjcGXhm8AJh/dDaYnGT
	Mle154eEKb0OyaRdkL0jx5GxlN2xkr9b289DtgCRe3lpY4zNLoOHJN7LnP3tCI2kNDZ0LoWOuZR
	cnOoM7NRMLF0K5/27v8H3B2CTES4Gb3uqF4MSmgXZ/0Yrrrl9U85PVl/NWhFTDCNX
X-Gm-Gg: AYBFou2T9zTKqAi496XXLt9e5vty/xSZpTG13nstJ1jrnv/IznhuAKmndxIy0Sxlpj9
	05NvF86CTb9IT2hVHRZj/bWx9JpQgz0nW7T3PLy6aPwlEAUocdN/hTucKR5McSJTogsKs+6FQhx
	VJDQFbvMh+OUefjKbtfIELZzXEQPscAzfLDyXpoX1ITz/MjpQbvgK+IqdZNt8jJtTJWvTKQGCX5
	d6oSkhY0DmopRZS+AC6ptWmcXsrX8UrAKocvFXZh2o/ru9NGF4Y/OhcBjBZSRNS+1j5OVvZUte0
	o7wx8GOznKZxRUujGPvcbVmdjblsery+/I5FDAVQ641uPMl2lTgaFkm+3RPunY7LeTgMv4yxdoc
	G+RJyeG/wR0yLiOb0flN+sn4sP580+uGYWUwuoQc5b7hmZFGONw4+hPccmLMbGDhzVAkyySALvI
	N1DQOJE8Sb149HIV0FJxCMCcrlsmd+dP1xGSGF+AVHy6wUmbmx4SwbffoYo2a1+HS84V8=
X-Received: by 2002:a05:6122:9001:b0:5ce:d56f:efac with SMTP id 71dfb90a1353d-5e91f54fab5mr5102418e0c.21.1791987418613;
        Wed, 14 Oct 2026 07:16:58 -0700 (PDT)
X-Received: by 2002:a05:6122:9001:b0:5ce:d56f:efac with SMTP id 71dfb90a1353d-5e91f54fab5mr5102224e0c.21.1791987413320;
        Wed, 14 Oct 2026 07:16:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae46f0sm721182966b.79.2026.10.14.07.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:16:52 -0700 (PDT)
Message-ID: <46ba46c8-c84e-44d9-8729-9298867b19fd@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:16:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan.gerhold@linaro.org
References: <20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXzz2H7zeaNy31
 LDWHnTCu0Yj3xFh+Is8uRy3R/av6jVdTUJzIX1aPNk8W1JQdRSNIOreX8GNJ0/RQirNyvTBoOOG
 Aq5jAiKlY3YV/96VuKg6CRclfcx/m6Y+E87eQIoER1l7zPMYEGn+rJlcY5OFdxdtWZmpUsR9o9o
 HmeRp0KEviXQq8AJjv4CMG3FZQxzIsGVUF6JZFZ/ypZHekEPTcnTOO1tLvKA6N3PUP7I/Q9dYrj
 ByNpg716szefg0voxaEizStqFNuy4kDDsaIJGb9a/YGiz9ZJhexY7ZF55TmOLNYRkTc6VmMCfy3
 DFdoDINTbNUyuF+CqAb/BqHI79sxFubnhkE3KGJyvvOGe3i/MMfE5EM1k9G/MfZ6ehyC564UkHU
 zi8FwvzN9M3mh8adx2hIqS6n7j9kRZaONEZeAf/t5XttWFNurMpD1qAA98yLZr0kip+nkqEPppb
 ScPoJAFO59aSDL4aYBg==
X-Proofpoint-GUID: N2lH7Ef__Eg2PbwB78G3wM5TzlbXL3RO
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf8ee0 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ISy6eMC9JirD1J4fssoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: N2lH7Ef__Eg2PbwB78G3wM5TzlbXL3RO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX6ePrayEro/ti
 aATjaxB93Vca/lkbNpQVwPczlkpHX8BFgRqUbQAyrOFQdcJcCYTEluY6sqKQDALc4rKXR3tj+nm
 SfrQKm5cxMFP8Ebe6XkSKt2fdd4h+ko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140056

Hi,

On 1-Oct-26 20:10, Daniel Lezcano wrote:
> Add thermal zones for the ThinkPad T14s and describe the board
> temperature sensors exposed through the PMK8550 VADC.
> 
> Add a passive thermal zone for the keyboard area, which is the main
> thermal constraint under sustained load. The EC reports a thermal alert
> at 57.85°C, so use this value as the passive trip point and allow the
> thermal framework to throttle all CPUs and the GPU when the threshold is
> reached. Use a 1000 m°C hysteresis and a 500 ms passive polling interval.
> 
> An earlier approach used staged CPU cluster throttling in an attempt to
> start thermal mitigation before reaching the target temperature. Testing
> did not show a significant improvement compared to throttling all CPUs at
> the EC thermal alert threshold. It also introduced a latency imbalance
> between the different CPU clusters, which could negatively affect
> workloads depending on where tasks are scheduled.
> 
> A more optimal solution would require a significantly more complex,
> system-wide approach, accounting for the workload distribution and the
> available power and thermal headroom across the CPU clusters and other
> devices. Such an approach would also require kernel mechanisms which are
> not currently available. Keep the thermal policy simple here and use a
> single passive trip, which at least ensures that the system is actively
> mitigated before reaching temperatures that could ultimately lead to a
> thermal shutdown.
> 
> The mitigation temperature is derived from the platform behaviour when
> using the balanced power profile available under Windows. A separate
> change will adjust this trip point dynamically according to events
> reported by the embedded controller. Name the trip
> "keyboard-ec-alert" so that the EC driver can identify the corresponding
> trip point in the device tree.
> 
> Also add a 73°C critical trip to shut the system down if the keyboard
> temperature reaches an unsafe level.
> 
> Add a thermal zone for the back cover with a 73°C critical shutdown
> trip.
> 
> Describe the SoC, SMB, SDX, east and west board temperature sensors as
> monitoring-only thermal zones.
> 
> Thermal camera measurements were also used to compare the reported
> temperatures with the physical temperature of the chassis. The measured
> values appear to primarily represent temperatures inside the enclosure
> rather than the user-contact surface temperature. No unsafe external
> surface temperature was observed during these tests, although this should
> not be considered a substitute for formal platform thermal qualification.
> 
> Finally, enable ADC thermal monitoring on the corresponding PMK8550 VADC
> channels used by these thermal zones.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Thank you for your work in this.

> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 75ad74bcb042..5d3a0a5ead68 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -20,6 +20,81 @@ / {
>  	compatible = "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
>  	chassis-type = "laptop";
>  
> +	thermal-zones {

I believe all nodes should be shorted by label, then name which is why
the first node before this was "wcd938x: audio-codec" since "audio-codec"
starts with an a.

So this should be at the end of the global nodes.


> +		soc-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +		};
> +
> +		keyboard-thermal {
> +			critical-action = "shutdown";
> +			polling-delay-passive = <500>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> +
> +			trips {
> +				keyboard_ec_alert: keyboard-ec-alert {
> +					temperature = <57850>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				keyboard-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&keyboard_ec_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		backcover-thermal {
> +			critical-action = "shutdown";
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +
> +			trips {
> +				backcover-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		smb-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
> +		};
> +
> +		sdx-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
> +		};
> +
> +		east-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
> +		};
> +
> +		west-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
> +		};
> +	};
> +
>  	wcd938x: audio-codec {
>  		compatible = "qcom,wcd9385-codec";
>  
> @@ -1612,6 +1687,36 @@ wwan_sw_en: wwan-sw-en-state {
>  	};
>  };
>  
> +&pmk8550_vadc {

Idem, referenced existing nodes should also be sorted
alphabetically, so this should be the first node after
the existing &pmc8380_5_gpios reference.

Regards,

Hans



> +	channel@144 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@145 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@146 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@147 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@148 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@14a {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@14b {
> +		qcom,adc-tm;
> +	};
> +};
> +
>  &usb_1_ss0_hsphy {
>  	vdd-supply = <&vreg_l3j_0p8>;
>  	vdda12-supply = <&vreg_l2j_1p2>;

