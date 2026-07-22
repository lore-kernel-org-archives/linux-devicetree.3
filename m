Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE0534B662
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727141; cv=none; b=Jb4+Trv/7FvdN6rt1hC1haurRZ4XnAx0Rl4E/D1vcEoF08rV33M+TK0rP5jEEjNModOdx7qAgiozId/FMBWDShNIXg3EG3V3bykftF5puPT6K0iVzxaRt8xXaR41zOr24Y8MSCL+zwmtXSVLTBSDpNWmSfB1vBUwMEjrTsPn+NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727141; c=relaxed/simple;
	bh=RktGundhJN9R0SLU3WyrqWr31ILCwTvQT0mstV61HXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRnNDpD71ECcnVPZTrD1bKxL0FDC5RVk3bX1Xqk8Ml6Z4pMg+pw2ELYIGQycINsE1MWRmUfWaftHS4oVWpc3rOS71GaWjY8gIU/uqlambivDMnN5a5Qnf9aIJ/SWDXq1MaBGOwt4lHeXsIc5JxX+nCiay4r1QjAqsvtoVwNcbeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzHMcUyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnliYjYk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzHMcUyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnliYjYk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1U1J573895
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9Rtz5Hx8VEwlyEsyRkxg/PODfJQhr3wKVDv61v9Knc=; b=kzHMcUyqIKhddl6y
	K6KtXti4j3ypNc1lil2HNeXcXATpf72OGfCk23a69+YrvWhNGvdvd/SjkYMf8mgF
	jtzp+FsurZz4G7wIhoCAOOr3QHOxNutLrs15wB4fSHIYptwPtI1xOCrgkw/MNsIe
	F2IlIuEgiZ3rGn3DSaQgq2aT0N3BL6CunrE5HRJ5+4GkihtcNQeno77bl4P8VGrJ
	4VfLHYvOLYTMnZ/e3+u8mcpkzlOKXTz1bbwu8snjuXmnZMPlB+nSend+UukkG7jR
	KTtPn8EM4V1IQhpKGjHaU5GJSdH/ZWG0BdvDOeVnxDubh2l//CipYeUrdtikmaNq
	3Q8HRA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju22919j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:32:16 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a17dafd042so14532008eaf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727136; x=1785331936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9Rtz5Hx8VEwlyEsyRkxg/PODfJQhr3wKVDv61v9Knc=;
        b=gnliYjYke3pKeCBgoTu7LMId6an+lWjTSn1eDOlxRCtC0XI3ai/QX7TPpPi+BP9jTO
         hxkYTPOTq+AObT6pNW5GsIWZHO+7+fHaFa0OmHODLeEh1FD4pwc4oJjtIIdBT6sUkd0r
         glCm78dVyCLwpQ+PuNXFUhVv9dNq1ZJEX7+Rdx2wC1kI1FRrMKGLJryKI90Cqkr+N38w
         uhe+3Vgqy+OXdzfv3nR6XAMzXKU738VAkVzgtPv/AE3IMjXGC/JsUZKsdpmHyj99IsvL
         1vlQ6J02+TDNjU2qOwPLiKxHM8e/Rk6b3aGusKwcpZk7qlMSEAvkd0j9Jdjxnk+MbsVm
         EsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727136; x=1785331936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9Rtz5Hx8VEwlyEsyRkxg/PODfJQhr3wKVDv61v9Knc=;
        b=GS6RxtMI6Ct7kl/FGpOCbdziT5avrT0m3/oROCbMMkLdbI3WbZTXrYLH5zqHt6ly5X
         BRUAA/2v2UGZHoqSswIDFTaku5eSdaOJrhMfC72U+ZRGBBkW4WBF8HenH2JdovBBviD7
         bTeqBuZ1BzAqv7jdu5LTBo4/GqaaKOWXx5IzBZkHFSGYcAUS1u0XBJ+jKxKRQEE7GBbM
         f+O4j34mzvtzLwIsywdsOGzLt3FaRosPi+YrUeRj9sUjIK1Zfn1gSJ5rNyHpHYMBeugd
         pMXq/Phs92XOTtQLBQ7eexTP5YrimnvdwvUPQtjexWqZiI6e3X8FhXGSXMBYVnT7yi5q
         yifQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWMpbHGwb39hirvAHzYxHvXU5sJ03nwjrqo33RWWoRqcdhZ4BOxHiQ1lQ3ZPieZ71wDKAww7QiTSlG@vger.kernel.org
X-Gm-Message-State: AOJu0YzTIDIWCRW0rYmvDi+8UCtgVEK8bmfPRLB5i1zAClgPo2RhXoEg
	VgKXbNq4KfnKuz8tn+ujxV8eU1I/xp+C/7w1cfmeQlD3sV5uWB7qCv/RuMpxImzRee6PXQYg8xI
	UXf+biBk7H53tgk+uv/L5zgckXIl/HVnbGiMg0J1vNNcBGIYUKzyakDRPzr1AkYKf
X-Gm-Gg: AR+sD10tBg3hOPpGIyIHxV5eTruc+vjOwhMppk6CSxbTJhszNkQDwVnsByWf13XEtsR
	NPrBeptsGjtbhdzH0ZN7KKHlYGe8Htn+HYQk7D+iv60+F7HDxPAxC8N3cbYly85zaYzW3fpbgCn
	XiTIsLUe7X3O2z0NNsyhr3+gwC2c+rpaPnz3jQST1bIC8++knwuRbXma6U4Jc5oKq/c8m/autoX
	lAKprKrk9r5yKBNfA8odbzsvx9MWOmVAxlt/aOmodeJ13M0iu4k2sg+A6PlDFc0akrIFUIyKdWs
	1pwbe0sZNdWvCn4MkUY378C5rrJuoreksTxdy19IVkz/Xhzh8Hv0XwdiPusptw/EHE/AOWwKKud
	RQhOlDetLba+FlmzYl064Ws7clNRBaI9v
X-Received: by 2002:a05:6820:4b8b:b0:6a1:7846:3c50 with SMTP id 006d021491bc7-6a536877b65mr11760929eaf.42.1784727136119;
        Wed, 22 Jul 2026 06:32:16 -0700 (PDT)
X-Received: by 2002:a05:6820:4b8b:b0:6a1:7846:3c50 with SMTP id 006d021491bc7-6a536877b65mr11760906eaf.42.1784727135627;
        Wed, 22 Jul 2026 06:32:15 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.235.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aa76c19081sm1584946eaf.6.2026.07.22.06.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:32:15 -0700 (PDT)
Message-ID: <b6a3051e-c8c6-4441-b9f4-0ad0d5671bb4@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:02:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/9] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-5-99620e07f505@oss.qualcomm.com>
 <qhb3hy33azdadqqu23drpaca7wel6pr3ibwqaze4i4zf5ltnzj@h32dfogcpkke>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <qhb3hy33azdadqqu23drpaca7wel6pr3ibwqaze4i4zf5ltnzj@h32dfogcpkke>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60c661 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=/HV6WY1oXUpe+KOgORLkYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0R8zvgcmfpDf-ia9WJYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: SXWMOR7HD3WtJHHfOKSLHqw15gkTNuea
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMSBTYWx0ZWRfX9FjowiBOnLcR
 0AVRFyFtMjCNXSoqIMBBhz4jNqPP4oGP5hDrzUjB9VZ6Iqzzaa3RaTLUudEiEqXrbyYTKk2vpFq
 jWtN9Qlmd1wleqhstJ9beK1bgYsn6jQ=
X-Proofpoint-ORIG-GUID: SXWMOR7HD3WtJHHfOKSLHqw15gkTNuea
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMSBTYWx0ZWRfXzxJjtYDUMWj+
 CLpgH+7DdZmfXnD+u6BV2MxFtgUlJrl0RL1jDg+BVv4F4G2Rf29Dbv1czZ1y7oazQ5tqgIBs8P4
 WOvPThe3RJoJJihJNuPW8VtedObBoaBhAkbgbbcQJqIyTWsTfbUb8CUzezWEZgjn6axpqmfiKFn
 PV2zUTgPJ6gqg/rCo3R9ht/WwiIgftcujCLay3ZdjeCAwDjvm8lM4oN6dXIdSw8y1MPFKKVhz68
 HUvpdTAChDipVdKAj2SGo3K2XGUm+CnqXXV8CbV90BugMC5WKspXSGK3Wsi+FhAaO2d9mYSY07s
 84iQtN22b227qyDG2siE+wkqVvB+CyJmmdKp3fWU9Z4ooAl7+60NKG941LvgWtQYiVdgzfT2rGY
 VeJkQEyDSwxu+ZV5uz2PCFRwYdnqbaX/vLba0+qAZST13ESn2DFtQrilN4u/11nnDfQeugikP97
 psAHUSRaEX/gIa5hNQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220131



On 7/22/2026 4:41 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 11:59:02AM +0530, Gaurav Kohli wrote:
>> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
>> when it reaches high temperatures in kodiak.
>>
>> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
>> for modem when it reaches to 95°C.
>>
>> Add polling-delay-passive so the governor periodically evaluates
>> the zone during passive cooling and steps up cooling levels when
>> temperature stabilizes below the next trip.
>>
>> Since the remoteproc_mpss node doesn't exist on non modem boards, the
>> cooling-maps that reference it cause DT compilation errors. To fix that
>> remove inherited mdmss cooling-map nodes.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi               | 134 ++++++++++++++++++++-
>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  29 +++++
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   1 +
>>   .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  29 +++++
>>   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  29 +++++
>>   .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   |  29 +++++
>>   .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  29 +++++
>>   .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  28 +++++
>>   8 files changed, 304 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 7e73348fe0d0..df5099023b77 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -30,6 +30,7 @@
>>   #include <dt-bindings/sound/qcom,lpass.h>
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>   #include <dt-bindings/sound/qcom,q6asm.h>
>> +#include <dt-bindings/thermal/qcom,qmi-tmd.h>
>>   #include <dt-bindings/thermal/thermal.h>
>>   
>>   / {
>> @@ -3431,6 +3432,8 @@ remoteproc_mpss: remoteproc@4080000 {
>>   			qcom,smem-states = <&modem_smp2p_out 0>;
>>   			qcom,smem-state-names = "stop";
>>   
>> +			#cooling-cells = <3>;
>> +
>>   			status = "disabled";
>>   
>>   			glink-edge {
>> @@ -4803,6 +4806,8 @@ remoteproc_cdsp: remoteproc@a300000 {
>>   			qcom,smem-states = <&cdsp_smp2p_out 0>;
>>   			qcom,smem-state-names = "stop";
>>   
>> +			#cooling-cells = <3>;
>> +
>>   			status = "disabled";
>>   
>>   			glink-edge {
>> @@ -4922,6 +4927,7 @@ compute-cb@14 {
>>   					};
>>   				};
>>   			};
>> +
> 
> Extra empty line.

thanks for review, will update this.

> 
>>   		};
>>   
>>   		usb_1: usb@a600000 {
>> @@ -7732,6 +7738,8 @@ map0 {
>>   		};
>>   
>>   		nspss0-thermal {
>> +			polling-delay-passive = <200>;
>> +
>>   			thermal-sensors = <&tsens1 3>;
>>   
>>   			trips {
>> @@ -7741,15 +7749,31 @@ nspss0_alert0: trip-point0 {
>>   					type = "hot";
>>   				};
>>   
>> +				nspss0_alert1: trip-point1 {
>> +					temperature = <100000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
>> +
>>   				nspss0_crit: nspss0-crit {
>>   					temperature = <110000>;
>>   					hysteresis = <0>;
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&nspss0_alert1>;
>> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>>   		};
>>   
>>   		nspss1-thermal {
>> +			polling-delay-passive = <200>;
>> +
>>   			thermal-sensors = <&tsens1 4>;
>>   
>>   			trips {
>> @@ -7759,12 +7783,26 @@ nspss1_alert0: trip-point0 {
>>   					type = "hot";
>>   				};
>>   
>> +				nspss1_alert1: trip-point1 {
>> +					temperature = <100000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
>> +
>>   				nspss1_crit: nspss1-crit {
>>   					temperature = <110000>;
>>   					hysteresis = <0>;
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&nspss1_alert1>;
>> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>>   		};
>>   
>>   		video-thermal {
>> @@ -7803,7 +7841,9 @@ ddr_crit: ddr-crit {
>>   			};
>>   		};
>>   
>> -		mdmss0-thermal {
>> +		mdmss0_thermal: mdmss0-thermal {
>> +			polling-delay-passive = <200>;
>> +
>>   			thermal-sensors = <&tsens1 7>;
>>   
>>   			trips {
>> @@ -7813,15 +7853,37 @@ mdmss0_alert0: trip-point0 {
>>   					type = "hot";
>>   				};
>>   
>> +				mdmss0_alert1: trip-point1 {
>> +					temperature = <95000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>>   				mdmss0_crit: mdmss0-crit {
>>   					temperature = <110000>;
>>   					hysteresis = <0>;
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&mdmss0_alert1>;
>> +					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +
>> +				map1 {
>> +					trip = <&mdmss0_alert1>;
>> +					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>>   		};
>>   
>> -		mdmss1-thermal {
>> +		mdmss1_thermal: mdmss1-thermal {
>> +			polling-delay-passive = <200>;
>> +
>>   			thermal-sensors = <&tsens1 8>;
>>   
>>   			trips {
>> @@ -7831,15 +7893,37 @@ mdmss1_alert0: trip-point0 {
>>   					type = "hot";
>>   				};
>>   
>> +				mdmss1_alert1: trip-point1 {
>> +					temperature = <95000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>>   				mdmss1_crit: mdmss1-crit {
>>   					temperature = <110000>;
>>   					hysteresis = <0>;
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&mdmss1_alert1>;
>> +					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +
>> +				map1 {
>> +					trip = <&mdmss1_alert1>;
>> +					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>>   		};
>>   
>> -		mdmss2-thermal {
>> +		mdmss2_thermal: mdmss2-thermal {
>> +			polling-delay-passive = <200>;
>> +
>>   			thermal-sensors = <&tsens1 9>;
>>   
>>   			trips {
>> @@ -7849,15 +7933,37 @@ mdmss2_alert0: trip-point0 {
>>   					type = "hot";
>>   				};
>>   
>> +				mdmss2_alert1: trip-point1 {
>> +					temperature = <95000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>>   				mdmss2_crit: mdmss2-crit {
>>   					temperature = <110000>;
>>   					hysteresis = <0>;
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&mdmss2_alert1>;
>> +					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +
>> +				map1 {
>> +					trip = <&mdmss2_alert1>;
>> +					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>>   		};
>>   
>> -		mdmss3-thermal {
>> +		mdmss3_thermal: mdmss3-thermal {
>> +			polling-delay-passive = <200>;
>> +
>>   			thermal-sensors = <&tsens1 10>;
>>   
>>   			trips {
>> @@ -7867,12 +7973,32 @@ mdmss3_alert0: trip-point0 {
>>   					type = "hot";
>>   				};
>>   
>> +				mdmss3_alert1: trip-point1 {
>> +					temperature = <95000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>>   				mdmss3_crit: mdmss3-crit {
>>   					temperature = <110000>;
>>   					hysteresis = <0>;
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&mdmss3_alert1>;
>> +					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +
>> +				map1 {
>> +					trip = <&mdmss3_alert1>;
>> +					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>>   		};
>>   
>>   		camera0-thermal {
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> index 82ebd88f9aba..befd3f908ce5 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> @@ -24,6 +24,35 @@
>>   /delete-node/ &adsp_mem;
>>   /delete-node/ &cdsp_mem;
>>   /delete-node/ &ipa_fw_mem;
>> +
>> +&mdmss0_thermal {
>> +	cooling-maps {
>> +		/delete-node/ map0;
>> +		/delete-node/ map1;
>> +	};
>> +};
>> +
>> +&mdmss1_thermal {
>> +	cooling-maps {
>> +		/delete-node/ map0;
>> +		/delete-node/ map1;
>> +	};
>> +};
>> +
>> +&mdmss2_thermal {
>> +	cooling-maps {
>> +		/delete-node/ map0;
>> +		/delete-node/ map1;
>> +	};
>> +};
>> +
>> +&mdmss3_thermal {
>> +	cooling-maps {
>> +		/delete-node/ map0;
>> +		/delete-node/ map1;
>> +	};
>> +};
> 
> This is out of place. If you want to remove maps, remove them directly
> by label, rather than deleting them through a path under a thermal node.

thanks for this suggestion, will use label.

> 
>> +
>>   /delete-node/ &mpss_mem;
>>   /delete-node/ &remoteproc_mpss;
>>   /delete-node/ &remoteproc_wpss;
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index e9a932c90d14..48751bc2265d 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -25,6 +25,7 @@
>>   /delete-node/ &rmtfs_mem;
>>   /delete-node/ &adsp_mem;
>>   /delete-node/ &cdsp_mem;
>> +
> 
> Why?

looks like by mistake this got added, will fix this.
> 
>>   /delete-node/ &video_mem;
>>   /delete-node/ &wlan_ce_mem;
>>   /delete-node/ &wpss_mem;
> 

