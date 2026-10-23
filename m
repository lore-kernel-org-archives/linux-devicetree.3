Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752192;
	b=2JFQUOUzm9xD4gn6wZF6otunrlnRFMjlpQdCJBSp3fesfgJ5/QRu7voI8o/BdZF7mQWi
	 9yAgm+wRj7jVShv1JCSwQ5D7er+ar0hjQR+pBWX6EOZcNOxdeuqHXo5Zj3Me2VBQg1Soj
	 BGxq1QUHR1NwHIK/yG8QEpxMvEaZ7PJY05HbIxXlxBFdkfLL76OMJ0Mp6ytiW+y9+1LTs
	 f8UkLQCbIRUnUMVGznvB5lMeNpzIakfkv+8qVey0+BCORqwD4bdfdT2ovKtL1CFkCrJgT
	 Kf1QgmgKbPWVd/Q/khwieoRxmh56h1LtQ/V72POoSaGq1/4tWHfnskCzJpmbC+8zpEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5KEIK/6JjGIvmGz3msnqhTqFTFw0tv2iGW6sK39lX3E=;
	b=JJYqgXtoQmSFlWhWvogXRkgPzseZg81WOcxNmXNaJnVY0N7gsqVrBSojyI03FWdh3KlM
	 LamN++zgWsN6O7C33SS3YUvaGrSie6bqzNY+yRwXZrjM/YTLkj0GQw2+OsYDjlni+e/9/
	 3j9C0gORSLcOuBkVE4Be4AU+SFy3MgTaZi7E5sE185SXe2g4pemEQVMhdAjyOnJsiqrJs
	 etJZt+0Qmn27xhLUd1kLnZdt6akpBypRPKCG7IVayFNMW9UCt1ctjyR5SpglaHhOhSKAR
	 v1lXoMPft8OBWur5mW+47EnmTqvQbExD4rr0O36TXXXWIdJ/YQj4OeLizbtcdavKfsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7YBSMr5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kjWwvwTr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F95606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F95606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7YBSMr5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kjWwvwTr
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAATYJ3560796
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5KEIK/6JjGIvmGz3msnqhTqFTFw0tv2iGW6sK39lX3E=; b=V7YBSMr5RwHO2ffw
	5kNW5LiFWviUrW81/B/9Hs8MCoSZlwH9debSqBAfN0rNAM+7TuVDfSXtBxhsKn5e
	a6fnhrL6k590+7ZqBeYoje8UfnhaUYQJ+R17cWDFTva5qrHlzdAucHJ/QbDLs5px
	WCuTaw7sLOgQKAECbMDmmMEo5+ixiuxmvcBvKpyag9lwaKckM635kapymmFYAco8
	lO9bPP8HcjOwdheCwv+8fEmgxze2fAhoJhEO18fhkMI5aktkA2IB/Y5GQgTWhTlN
	mmaaoU05zq2cPJ70eM1Va3GGbALkNxy/3tgYxeZZws7vTK4NPO91mXx0auHBKxya
	6dAblg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpb8ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:43:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so256719785a.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792752190; x=1793356990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KEIK/6JjGIvmGz3msnqhTqFTFw0tv2iGW6sK39lX3E=;
        b=kjWwvwTr57o/Uk5WEHOLYPejQZ+O23CZkaVXfQ/FsDUIrJwfkleGThOH0hzr4QdUxX
         x97JTSmyh3t0NPWVGKZYHjRcWentPzL0uZPE9Gh+c7c8j1Uj/WzVKfiYXxt0Sd7bXYtf
         N1vrnOxhzUphjgjANgPjQ2FpSejgZPODZGxJkut2OPrjSHtk4yRz35Qh02pmvGzeMVZ6
         wLsTeFNC6K3S3k8WYnPXqXQj8ekhmg7rqvIccrnyTwT6LFRElJQ3qRJZ7vw2TzlQ2PqT
         sPv2drdE1vMCPKFibtfDuSHpv5N3Cq0W1hIYlJk+z95vqwiCG+GeSxLz5YmlcQ5SmDxI
         Eeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752190; x=1793356990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KEIK/6JjGIvmGz3msnqhTqFTFw0tv2iGW6sK39lX3E=;
        b=dUvqkMH+ifgsmQgpUR1Sc0jOqV7K1jTn1FcGN5/BF7PpEHyVZe1SZiETq9sUI7138b
         PWKrsMl8DeNNTkb8ceUUAZP+eGz85H1vdN+2CDd+gP73WhNb9H1cd1bxszpwrZs7Hf8w
         yGwYXQm/5n0CaemfcEdF/pgIk6bdSLKh0IPggJqQOFnxQsOI7E1WPzqTqLSVlu553kXn
         xttSbxOiktV4hVl3ISMbRZ+iAbe1S19FBblBOOCmUZOhBGWVdgWak/kBO1lSaH0kUmOz
         v77GAQueEwGP6M/SmY7pBS0aCkBE1pkhBweNf8khDbfnBLDOS+MpDawDquSz8WNPkf4S
         OEPA==
X-Forwarded-Encrypted: i=1; AKwUvBwqpd+/FiTbEG7Lm7xZoIHXK/5IuQGTnvRTbQutBpiBPgu891tzdlqwF4C2wV24eGR1Ew40ncXgwhY3@vger.kernel.org
X-Gm-Message-State: AFq9FYLxjuIEt2ZDgxGZMqM5AvxXFWU3CD84L3YVe6Bf0NXo1vdbqzXp
	LD8IwEznZ9WTDKWeQ6BjxziwSLqeXF9qNOVWm5LV08vlrpeQNOhlZb6oIOXK+ZkzJMGopz6c4cx
	Gn1P2owTEfPaFHsAAKrEcSoyryTM5bHCfByjnRxhllcxQQtKf7RBmCOSkBnyhBkw6cPiccbCQ
X-Gm-Gg: AYBFou0gABJs/1OxrcpEBbp2tQHGKvQQ2CjAs6NUwIoYeU8YkG92IrnT+RG7R+FrHBb
	rN4JNd5cXoIXMSOr2jDvi+hxYk1gCAYScRCwvXMoneGfi/cLONJKjoFuB6HHJGQyY5I6RbXfK17
	bdPkxxYSm/9WCEEoyf90pkFq6dj5d3qsLXmA58SCG8jt/OxTXRz7pL6on39c9XvmDI3KYMzuNok
	7dxvW9yRxuA/oS0aeAE4K+OJ9m3cOd7z0RyKIt6+WjM8vz1ZEG5uYIk42fYxMHHsdmHZT2V3Ytg
	VFUT9qrAjK5qQgoeVsVnDNqQNwEx7lMLWflVSdPOOtS1q2y0lk/Gi2jdh430LKIBnan0t7xLTZv
	5G40DjLDDGg0t4c+9ELtjCTxrOLYnXx68eJo6BL2I9wcab5H6GkKM9NpjVeJmnQ==
X-Received: by 2002:a05:620a:4449:b0:93f:34c9:924d with SMTP id af79cd13be357-93f6f9549d2mr262708385a.35.1792752189902;
        Fri, 23 Oct 2026 03:43:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:93f:34c9:924d with SMTP id af79cd13be357-93f6f9549d2mr262705085a.35.1792752189333;
        Fri, 23 Oct 2026 03:43:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21034d740sm72635615e9.4.2026.10.23.03.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:43:08 -0700 (PDT)
Message-ID: <6c186b10-1247-4f82-86e8-3c42cbb925c9@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:43:07 +0200
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
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
 <atsmQqSOuqp1LKw8@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <atsmQqSOuqp1LKw8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfX9A6umJGPlVXd
 3kgKk0KQQ11c3LnrfyDufABZn+TmD9RVqAU70v1TOsAFu+jWQhxY8WGaGa5JWa9nVCsHL3vrK5I
 aXyf7zARxS9dCDJCAI4xiy1d+6O9N70=
X-Proofpoint-GUID: VZY_6K58ENBxeiC9bqthnxI5cGdoaEHc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfXy7gWuUpqtvqs
 61zBdDny5p/46tUvFORUE2n/CY6vKpfBlmgBiQnrlxBJQYxDff2soaaklg+oK6vIz4ndi7KfRiY
 ucR+xHcwKPr2JKBBBa0PdClzkMgpI2X5PdsfjvNxy1SL26TruE1YPCPUdjFLD4ysZZKzN+aQxXS
 50PNR6JtvTkLj0MGUL8qVj6bgIC1k7Peh4ttr8rbRQMfjnjap3+8iubwse5Mb4h8vc4Ti1hRZzp
 M73Spj/Sj9JZhoiYeIZq8uEbttU/DB3KchH2U02W2UQo8T6aYz1JvYWuRgCt9tybHeGNty/zhAw
 50GZBBJu9HP7xlu/8tY+oZW8EzkJPFNDUiGjnnTM+eaDoXIv4RZU0x1reYD9ilsQE/XYXsH9Y5O
 muv5x61olvODgEb4wUIIGqvu/g/t/z6wIBGIToppqEltZ+Rm+BMSyg/7n2BAcDgk1541VpSCPK5
 AZwSE4aCWJ8qCuA6jwQ==
X-Proofpoint-ORIG-GUID: VZY_6K58ENBxeiC9bqthnxI5cGdoaEHc
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb3a3f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=6LTyHckwlz_E6bxlvKMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230041

On 10/23/26 11:17, Stephan Gerhold wrote:
> On Fri, Oct 23, 2026 at 10:38:27AM +0200, Daniel Lezcano wrote:
>> The ThinkPad T14s needs thermal mitigation under sustained workloads to
>> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
>> monitoring is not yet supported, so use the board temperature sensors
>> exposed through the PMK8550 VADC to provide mitigation now.
>>
>> Describe the sensors near DRAM, the fan/heatpipe, the GPU and CPU PMICs,
>> the charger, the WWAN area and the USB-C ports. The DRAM-area sensor faces
>> the keyboard, while the fan/heatpipe-area sensor faces the back cover.
>> These are internal board measurements rather than direct measurements of
>> the user-contact surfaces.
>>
>> Use the heatpipe-area sensor for passive mitigation at 57.85 degrees
>> Celsius, derived from observed platform behaviour with the Windows
>> balanced power profile. Map the passive trip to all CPUs and the GPU,
>> with 1 degree Celsius hysteresis and a 500 ms passive polling interval.
>> Name the trip "backcover-ec-alert" so that the planned EC support can
>> locate and adjust it.
>>
>> An earlier approach using staged CPU-cluster throttling did not show a
>> significant improvement and introduced a latency imbalance between CPU
>> clusters. Keep a single passive trip to provide timely mitigation.
>>
>> Add 73 degree Celsius critical shutdown trips for the DRAM-area and
>> heatpipe-area sensors. Retain these baseline thresholds pending
>> sensor-specific hardware validation. The reported Windows DRAM threshold
>> of 115 degrees Celsius has not been established to apply to these VADC
>> measurements and does not justify changing the shutdown thresholds.
>>
>> Thermal camera measurements indicate that the readings primarily reflect
>> internal temperatures rather than chassis surface temperatures. No unsafe
>> external surface temperature was observed during those tests, but they do
>> not establish qualified critical limits for the internal sensors.
>>
>> Expose the remaining sensors as monitoring-only zones and enable ADC
>> threshold monitoring on the corresponding PMK8550 VADC channels.
>>
>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Link: https://patch.msgid.link/20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 112 ++++++++++++++++++
>>   1 file changed, 112 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> index 75ad74bcb042..21f4569068e1 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> @@ -502,6 +502,88 @@ platform {
>>   			};
>>   		};
>>   	};
>> +
>> +	thermal-zones {
>> +		/* Sensor near DRAM, facing the keyboard. */
>> +		dram-thermal {
>> +			critical-action = "shutdown";
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
>> +
>> +			trips {
>> +				dram-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		/* Sensor near the GPU PMICs. */
>> +		gpu-pmic-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
>> +		};
>> +
>> +		/* Sensor near the fan/heatpipe, facing the back cover. */
>> +		heatpipe-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <500>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
>> +
>> +			trips {
>> +				backcover_ec_alert: backcover-ec-alert {
>> +					temperature = <57850>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				heatpipe-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&backcover_ec_alert>;
>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>> +		};
>> +
>> +		/* Sensor in the WWAN area. */
>> +		wwan-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
>> +		};
>> +
>> +		/* Sensor in the charger area. */
>> +		charger-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
>> +		};
>> +
>> +		/* Sensor near the CPU PMICs. */
>> +		cpu-pmic-thermal {
> 
> I'm a bit confused by the node order here. It's not ordered by the
> thermal sensor (SYS_THERMx) like in x1e80100-crd.dts, but it's not
> ordered alphabetically either. Or is it still the old order from the
> previous revision?
> 
> I think I'd personally prefer ordering by SYS_THERMx, but alphabetical
> order would be our typical rule.

Oh, yes I changed the name but forgot to reorder alphabetically :(

> 
> Anyway, for the changes itself:
> 
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> 
> Thanks for fixing the names!
> Stephan

