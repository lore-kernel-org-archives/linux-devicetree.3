Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D883B0AF1
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275316; cv=none; b=NA2X9EZCuaSxGyDj90JHgajZlQMQPuwwYMQSUpmxVzvpAwKBwlUgZSEGnLWi/EFP/X5CGNZrE3lOGrwkcEdlSlPRBIPro8eWnmnbG/rXl4WvRyKXn3XicbIRVeB5ZM0ZJn0IjksZCat1bPY6JHirOboKOwmUfJsRtTEzldA9D8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275316; c=relaxed/simple;
	bh=3wO02rT+etgyYRSiGz/84U2TOiC/lwn2tjuSm0oKXC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b2x8mPWWl/eTUd1Apb5ibK8gjRjSvsgMgJTRyMnUmJDI51YATooJfqC1R6jXK6Zm95QC3JKVab9utWuFkYerARcjMKEiI4KOwUeMwKaX+1CYeBTCh4DtPyhQawPg9Pc5rxTBt6ta0iIY3g+yGYSTRJ296WmP+pjWXBkTWEw3H7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArHBTTTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCC1Grf5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArHBTTTq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCC1Grf5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDlVbf3468345
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nm8u98TStTS6sRtU+UYGkC/1U+l7JqkYetDAPw+MLaI=; b=ArHBTTTqRJvc1mHx
	FhuWefhP4ICYLOufDB1D2oWMRB49WvtWkBZhnujGPoxKFKUYw0ThuLbtuV+GXAXk
	KtByuGdosobzpq0+bpNJoVWe3XXFKlt0ttJxky1+8nWewhUX1zkzPIjK2MHqigtv
	Z8nxoeA80yfcj3MU984Huo5YrU0TJhrn1B4i3XR+J0xYvZvm78HeIVjrITvtyPeV
	Dffod1wIPTeWDGggtRaDF56PJLnzuMJG4XCKumlefUBxn5dJxwJmqwx171bcmzys
	7siIOe5stiG0B3VoLbz4UhkACaBXJW6uG4EO15qQiSuuUMO7HTOCWPcbhMYtI7IM
	52cE5Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jghccj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:15:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60276d88541so428817137.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275313; x=1774880113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nm8u98TStTS6sRtU+UYGkC/1U+l7JqkYetDAPw+MLaI=;
        b=NCC1Grf5r3ONpyRkLzsnLJNmExdVZM2IvZzKHZmuV28fNQeK3X0RdjmWaF3evnetal
         VSozyLcJNnEjV+aKj3n0ri629NfuM/IPPYg182p6UPH28XT5ThutprL2XxY6GDDp+vVL
         qjLun9psDk9xGMln5wUdoL7OdJp2tNr95FRGwL5RmOIdlbhxzQQd5EaqhgZ6L+iKJvDw
         N/wLxVLROgPn0npf+1ISSOlG4tIswGbJa57DrO2+slNUHCZzd3crcH8tQXfMIRS2nKAu
         53t8zR+Ju8YGa4WFFhdxZTaQm2OVHYxWD0JWFj8Iw3EFETjgqwKY71Fsyc/BhhEjWmVP
         qegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275313; x=1774880113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nm8u98TStTS6sRtU+UYGkC/1U+l7JqkYetDAPw+MLaI=;
        b=LofUPDbrTy//QMTKAjGlx3XW9E5ZBRzwMP8v43ZpfkWTiKO/+LOSoLILyEb2Q9k+Ot
         OCM7jOadN32vsZWXOQX+P5Akkfs4gYPAyVFFXd5qiAYc9dWCzgSxjDdhMEFl1JwowQFt
         Z2N+TQ416+RyZp8iu7WKojyiRRILCAXS+A+Wjx+llJcRpgIAAxgpApqU/19vMOJCo8pY
         yPhrDefsTSf5adiQVaIIMvWXW9wTGMHKfjaauyM0fk/si9C478F2bER91ebKnTzoVw3m
         PsnDuj75dGewvJKeLE+zJ3xsGU1tzVfxLOMAzNg11qUge5Sj/T222viGCWamoiRFZ4V6
         gzGA==
X-Forwarded-Encrypted: i=1; AJvYcCW1YxDZvy9/6cDkQFprJ79BHDrpr0qwmyBC8++PVluL62iHOYObSPn7XV/fs0AI+qkYwhy1/9h7RIp0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9/5dFXxNQh4rDIIzykWPqT/3JpPf2dgFkPE178A7jVz2nc+V
	1KgfjEJEbb12CIAHr8CrJkfZcCRo1Z3s/uywCAzE0OTJeXPQ+1HX1LmQGevBBYR02lPSf9N4UXq
	UsVkvGEK+NnOoUQLJhNNqjAz2EsQErp98izMT+m0g3bI0FRba7siW7HEUNut28Jir
X-Gm-Gg: ATEYQzxzKV9q7HdMw0Kt91eJ3KuiHFaFV9oCgyu9ZzTcODIuWEb2iPxPx0jmPIpxw4K
	s4hfi5yKrJpjCAQCQJWxtadclgjboi8MLutZ0c6qJ7SuBXFIWkF31gAejQ/oGQFDOAv1lO/0y0E
	GKaleOosNwfmpnagZcN9C4cK/daXAOagAnmdvWr1a/Iob2x6QIj147OOhCkd+TZ6yzRmb+OU9QM
	RR4/MaN5zSCd1O+0qTKLWj337b211BoRjWq8HYYv0qmixTT68t+qcKqIb7WubOIBk32W3dAQHFx
	MbjMgU9h5VeLkLfp7nvV1Fevz4gFkbGQQ8Zv/oThnt8iabDBswRXfGX9t0bhiQE2OMhg54dsuZ7
	786etm1C+e9zQBCW4D7Ll1DkAGMlhkLz9iTvHPFWmZPhcIuP+wU93jC0GS5Ttfq2t4XYOVxuRmI
	lxack=
X-Received: by 2002:a05:6102:3910:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-602aec08323mr2913981137.3.1774275313430;
        Mon, 23 Mar 2026 07:15:13 -0700 (PDT)
X-Received: by 2002:a05:6102:3910:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-602aec08323mr2913972137.3.1774275312891;
        Mon, 23 Mar 2026 07:15:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de1d6sm506417366b.30.2026.03.23.07.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:15:12 -0700 (PDT)
Message-ID: <3aaf273a-c7da-4740-a68a-49f5d2f5309f@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:15:09 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <20260227105055.2364348-3-monish.chunara@oss.qualcomm.com>
 <2ra2apfephjl2au6wel25gbxoxyvohf2ysq4yzaufp3xb7mtoi@g5p6asbk2fqe>
 <aaWdjuqvhpJb1oSX@hu-mchunara-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aaWdjuqvhpJb1oSX@hu-mchunara-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aAR3jhs8PxU_8gF47DZ_wW2HhrXfFRrm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMCBTYWx0ZWRfX1mRvX176zm7/
 be3iM0m3oj9wglDbjSZO1TGv191f2xbhsw+6SQptkQ23jz+0Lc4fm81hrf5523Mx+yB7Em1zo8i
 W3UERgRVS4FOF1EoGRITAPj2q6WtTaSP6oWZ5zEs73S0wFHNDplgHwviLLHrFuVManFeXV1KooB
 yQqRUBDoMMO94Io3XmOC4iQUwW4xPdG8/rUegQUmHagtEW/ZZhYwHY5eDVvrmgPwYXlI/dgLayD
 XuyquGOm18j/+bkCUZADJ3W5P72VgAm2zrGP//3qnROUbh4BE8e+fTDpjp/mWc9Sbw6h4i4Bh1K
 P7ZQxXR052QL5zWOSRy43GK3V1HCu95ATTdToQI+Lux1HVN4l71zy/QWVuBWeQBNAK/tPMj6zAE
 1ARwcwbLR4c95aVzmW5PHlKsvNhBUI0LBarCC6V3qP8IcicneYHKk4iLg4rW+SYatIVA2c6NH4q
 I84VJQAKooCel3Bezvw==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c14af2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=D5RQfsWzn7_MDrZrBkkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: aAR3jhs8PxU_8gF47DZ_wW2HhrXfFRrm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230110

On 3/2/26 3:24 PM, Monish Chunara wrote:
> On Fri, Feb 27, 2026 at 10:03:10PM +0200, Dmitry Baryshkov wrote:
>> On Fri, Feb 27, 2026 at 04:20:54PM +0530, Monish Chunara wrote:
>>> The monaco EVK board supports either eMMC or SD-card, but only one
>>> can be active at a time.
>>>
>>> Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
>>> to support SD Card for storage via a device tree overlay. This allows
>>> eMMC support to be enabled through a separate overlay when required.
>>>
>>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/Makefile             |  4 ++
>>>  .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
>>>  2 files changed, 76 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index 317af937d038..c86242a1631d 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -46,6 +46,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>>> +
>>> +monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
>>> +dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
>>> +
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>>> new file mode 100644
>>> index 000000000000..a0bc5c47d40b
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>>> @@ -0,0 +1,72 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +
>>> +/ {
>>> +        vmmc_sdc: regulator-dummy {
>>
>> No dummy regulators, please.
> 
> ACK, these will be renamed as per the schematic. Since these are direct supplies
> on hardware, used fixed-regulator configuration.
> 
>>
>>> +                compatible = "regulator-fixed";
>>> +
>>> +                regulator-name = "vmmc_sdc";
>>> +                regulator-min-microvolt = <2950000>;
>>> +                regulator-max-microvolt = <2950000>;
>>> +        };
>>> +
>>> +        vreg_sdc: regulator-sdc {
>>> +		compatible = "regulator-gpio";
>>> +
>>> +		regulator-name = "vreg_sdc";
>>> +		regulator-type = "voltage";
>>> +		regulator-min-microvolt = <1800000>;
>>> +		regulator-max-microvolt = <2950000>;
>>> +
>>> +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
>>> +		states = <1800000 1>, <2950000 0>;
>>> +
>>> +		startup-delay-us = <100>;
>>> +        };
>>> +};
>>> +
>>> +&sdhc_1 {
>>> +	vmmc-supply = <&vmmc_sdc>;
>>> +	vqmmc-supply = <&vreg_sdc>;
>>> +
>>> +	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
>>> +	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
>>> +	pinctrl-names = "default", "sleep";
>>> +
>>> +	cap-sd-highspeed;
>>> +	no-1-8-v;
>>> +
>>> +	bus-width = <4>;
>>> +	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
>>> +	no-mmc;
>>> +	no-sdio;
>>> +
>>> +	status = "okay";
>>> +};
>>> +
>>> +&sdhc1_opp_table {
>>
>> Why? Is it specific to the device or to the chip? In the latter case,
>> please define a separate table in the monaco.dtsi and switch to it here.
>>
> 
> As per the previous review, it was suggested to use an existing table. But yes,
> this is specific to the Host controller and the corresponding voltage corners on
> the chip and can be defined as a separate entity for SD card use-case.

The SDC programming guide I have access to does not seem to have bene
updated for any recent chips. Are you sure these different corners are
*actually* valid? The clock-side documentation doesn't mention that

Konrad
