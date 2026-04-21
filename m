Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EE43B8D48
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767482; cv=none; b=kJuugy5OlhaGgmfTaJoIlkJzuGMUYB5hpevX7PKcqsSYwCFzOmOmWkIbZEogn5dQU8NE/gzzoyQLtOfeFLcLmOjsk3gQyGs/p40aRi4oGYuDZ/bDBVIkvr6c4G2cSr+ZyW4LJVVfJw0doYghPBPQEwtcIoEBeLrj2BGXTM1C6hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767482; c=relaxed/simple;
	bh=h7FbgsyFeuqdNLe8FGL7E+x79waUgwC1lXW1C3xiiWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJE+eiVRC9VlhyOa4cVjOhRGuP5PdyvMNSP3dAXHU5Ed7kegroFuA3mElwq4Fwv3L0xEET5Y/ujziUncxCKcpK3QICCbTmH5PoxRTz/xFvQD79u9lVZyGKqPyPGmw5SXg3HLX12u/ZJPBrtAKZyefhN++KAuaf7EdtpxQXNDfxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqHqTrWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhmTbr8f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqHqTrWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhmTbr8f"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA3bXW1085766
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A6oOnRd5Wst6V9D8C7RlXM0unucM/oN5j1OUZN66Qw0=; b=VqHqTrWC1ewhUt96
	ZPVmxbCIDLsX/ou30G+8y1c1PGMrVnnZ8PlsBXgVE9yiRTtLQ2rRzXb59E7viMpg
	C/Mwu2JgoHNvgzvZODs5lMt23eGGtUbOjesOALS4rL5aEFqMqSzLiiwax/WglIsu
	4JEmtZhlxlEOTS5QpBQdHi8J2KCphiXwbKvSYwR9nmKvTrMUNbzoR1jHqH9hnPUY
	tdrnZXrzaLr04ItZEy4fUodNQu4odYBT5jSoJ1obGsR38tqkkBDQ+7SR4qalK7oJ
	dBxzh7FcY0PX/dfSOLMR+EHH1CW5EspYW3fLFhh/o+gorOTn/2YlhxxEydmTapAv
	KsxHpg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp75a82yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:31:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89f59c9bd28so5570376d6.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776767475; x=1777372275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6oOnRd5Wst6V9D8C7RlXM0unucM/oN5j1OUZN66Qw0=;
        b=LhmTbr8fljCZbkCjOm5Yw6XlA54bHUTtz0S5ATsJYzSNSgBYHPcGwUQ+3+0FHt6NqD
         k590uK+BlDMfrjt+ho+bA8YZ+k0ugI7XOhroG2BWQAh2J6z6k4ibhr0RSS8qXOuIUwVU
         Z+rtmHxuHudcvbqhVoeFXc4toQVmkqc2fkbAvaKGFo8Vg23m3d8UQ0LifC3Y9f35lu6N
         /5l80LpDs96AzvZ5oJNrwAQoXR0wmiokruGr/nDP7Mq27TdBiLA9PSbbupUAqHTYxypL
         YBc3UuNEkLqb0XyygYomtY4S/hHSa1Wv60mXwJDS0GFpTct4knMBSKpqIjfPEvkE/ywe
         V+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767475; x=1777372275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6oOnRd5Wst6V9D8C7RlXM0unucM/oN5j1OUZN66Qw0=;
        b=WtzMbJhurroUK6rB1FEi0+9njL/ERdsTKDSf9qcGl8Jn8+4AeDgonS88PhO7/MCnMo
         5zJUMlbbdQn6cW5WOkgWp/3RuA/b2ZDZnOS5kWDGRPbH2hbKwFVh6DB0XuPHwVmZTqYx
         vWROCBbus4hLEogvPDgj13nQWMOTdR/ZkvRCdEnwz8zKfx6NuWfAsvHp9AMhdLBGEZh8
         Uske0tG1CN9YNLwGM15GD9Nb912G5HuDhK5vmTnR6roZwroRLLmAfJNV0+uBTNCBG1YK
         tQQXd0jhAft0r8c6Zt1vX6AO5Cq/F6KWzObceTG+MVodgLb2b5PF9u1BsyLwSU5c6S8l
         cyZA==
X-Forwarded-Encrypted: i=1; AFNElJ9FvhAD4pbvc9IXDIDIiKO9nARJwt8+YyW7Xs+V0zA41q3Q0tGn/njoc4oT3WYT6ui6OSH2kgUuwfdU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1aR+MOCoOFcwDUmKeV9inBGYFcKNnayXwJ8c7GHamTA05Wb9u
	UMSqeXP2pJodvlXyy3VcQ3xdPWxRu6W3dbzkouf5CQwCU/bxyz6i6dCU6t7ErdKpnCM8CldDX+b
	FZIU1iZdUUG5DJ+XGu/OxH19BiEtMpxH4ldl9xURtxUpOpPhZuYVvpNBNk6Xa4kW4
X-Gm-Gg: AeBDiesLa8eUuEQIo9TGG7KPzIj334WvPGyiC7JykO3q6eJDYy7i0SAyy6KIaph6BXZ
	KPyVLrbCxrBgJvQkqM5apooIixrniVbBl9dFOMlO0JNnecTDXxABOW3RJvoYpySh2i38kE/xXJ4
	dtWNewH7kBWG+9JTm24y4BqEF1r5RlfuhGp6Rve1F1HuicAahPGTrIV+wTfqh7TAW4Xwh6WdfCV
	Fro1w7nbBeRgnFABzZUhDzO9sPXAgijENxl0FwL4Fmv6mutjwcGap88ilG1q8mM+EaJ89xjAN5e
	uRecNUCs3be1H2UvG97Z0OvucUmZiL9xMBEJ/A7xb+2o21uw47BwzYve6yaUnYyVbTmBJVmbmGm
	t2e9QT9vVEMUlZPJWQ1axWdVIiAOQfjAD5sxq/eDlhxSqk/fCJC7PXw9JHsFVIeqvGYwWEmjh/F
	VkvYVMIpDn4GPelA==
X-Received: by 2002:ad4:5b85:0:b0:8ac:b9e7:a95d with SMTP id 6a1803df08f44-8b0281482dcmr190384036d6.6.1776767474632;
        Tue, 21 Apr 2026 03:31:14 -0700 (PDT)
X-Received: by 2002:ad4:5b85:0:b0:8ac:b9e7:a95d with SMTP id 6a1803df08f44-8b0281482dcmr190383756d6.6.1776767474161;
        Tue, 21 Apr 2026 03:31:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdd2b8sm436152166b.25.2026.04.21.03.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 03:31:13 -0700 (PDT)
Message-ID: <ac62c20b-09ba-4d56-9167-b06d8c0bce0a@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:31:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add fan
 controller and thermal cooling
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
References: <20260421101954.411698-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421101954.411698-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dd459RJt3Qz4cwVQJYlKKIOTvJvi50dc
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=69e751f3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nXfpn2_iCm603CShNoEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: dd459RJt3Qz4cwVQJYlKKIOTvJvi50dc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwMyBTYWx0ZWRfX4B2ChHQNnQRZ
 HLQe/1qnt/EX+wfgrEI6WjCJBERq4l8sh2t2I04BTueyq/FznRsJh09QPhZiOGzXKHLcwRDgfrm
 3a5r2GpL3m2Ksi+a/3q/3VGgFJUNIJ8npUdDZDfclOiSEXXGtQMrZS+bINmL5X3UvH4Ui6HH2gm
 vox1yevQYQT87WpTo4rQtNqzCWyFrVDmqE2klm7j3rB8ApdXrY29xJQnovR+9RkBLwDCKuHIuDn
 quMQnPum3AmMo/JfmAtnIXrIoyBau76ftUQaTGEweBzeuKxjQwn2x7QDQmQ2zEAtxsPIoLV2a1F
 Dzz7lioifajpAHS1+YCEHD5dkROlZM+xvcUJAS3KcUSdyv0yd24IEsn4F0MbeJicWbwRf/nWJdH
 oY9ymVQOMw2LqmsKsiRhKHQW+w9ou3Sun+XNmwM503RE2h5nn8pJxzUw3v1BOCXd5I96OfKM+hz
 Bvui+OxGKRE8u/4agSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210103

On 4/21/26 12:19 PM, Loic Poulain wrote:
> Enable the CCI1 bus and add support for the Microchip EMC2305 fan
> controller on the Monaco Arduino Monza board. The controller is
> virtually implemented by the onboard MCU.
> 
> Add a new active trip point to the cpuss0 thermal zone and
> associate it with onboard fan cooling. The CPU subsystem sensor is
> used as the thermal reference until support for a more appropriate
> onboard/skin sensor becomes available (via spmi-adc5-gen3).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae..2d790f726d56 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/pwm/pwm.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
>  #include "monaco.dtsi"
> @@ -155,6 +156,26 @@ vreg_nvme: regulator-3p3-m2 {
>  	};
>  };
>  
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {

Fun, surely there were no other I2C hosts left! :D

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
