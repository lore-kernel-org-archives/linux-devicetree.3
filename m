Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC332D6E58
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785436387; cv=none; b=WM6YyzVSYWyhegVkP6Sxyzh4fZJlprWWkxg8TStUVQDbay+WQfNOmAJtqV/6TSP4U7XeO2hvr+zI2QRzeiF2CRkQUYRM9O+O0xDV5J9J4WwaJS6FG97NEppVtsrVOElOeVWLxH62KzN1QkmMUUQX5mqnkCo1cbbibltJGfEkhnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785436387; c=relaxed/simple;
	bh=9GL9zOg1tTAq0eSz/9z4Dmh04tNwFLnMOkIe2M+pKeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X98sF78AAB937LTmR2wg7N/Dl7WLe5hMia+Evs29oP09VnDuZTWeOe6kEYSTFwFp7LKNIfIEtX+OyJzE/XCO4DCPKdq4kKjD/Os099u/MGkB7Y5EXTS7icGJVVWrXDO0rCSnQrjNYRT6IouIfoJIqU9LjsjRnejU0sNIkyiqg+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inHHOty4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXtdYqdL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inHHOty4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eXtdYqdL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWZWL1238421
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahCtsMBdVYMxFMkXHrGydOopNEKYRJCw12sUjfq9kyk=; b=inHHOty4DMOCuK6Z
	RLQlI5eVa+CeBfoemThSmEdZb9GnXmrP/A5N2ZmhETtDROrtYJPhjRDB/Dv8BjZ8
	SxDVuhOnyUrPuMboBG9xYmB2KrlqSs+wIEHQZ5L/YRgo3BAKavjuVXGXy+/THl+M
	x0JdYywKAoCU/BVqidrU9c3sF3QcbhuhlnF2ggJPP+s4g9NGSb27euj6FH/0F1fO
	akGpdU/bQPRrZJwqWIOKMjYwNuAFFDeBMWIbnZXwr/qSkP7T4YzhiSgLVrELjhkP
	2qVAgp4L9HhMX5oR8gcKLnTYSmWcXA7/WZUWpHhIKZUYzvGG0Sf87cpaCPikwyJR
	hd8DLg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n396x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:33:03 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6bb29581so4260017b3.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785436383; x=1786041183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahCtsMBdVYMxFMkXHrGydOopNEKYRJCw12sUjfq9kyk=;
        b=eXtdYqdLGDUYnI6yJQJ5YawFfj+99YBNsuS3dvXIEBGjaCbS+oKhyfTC5QgoNFCVUX
         F3fMPemY1QToV+jO0aIXpbVGpBMV/daKSGOftEO9/a9XY5J+uFOY5h7IX6WtpzwZoePv
         TFGdGiPWwUHlQgYhzL1Hi540s76i0pq0bOd2118B4hnjVfyPHAPGGeju1n3gS3GF1Hxl
         f88Bg22Xv3kxXOO+SaLTQdtu0N4Yfbsqy5taMmYx0xaOoNRGCZt+HQVtPkyvWC+X3qf3
         LhNiWFa5noPQQJfwc/iUClz8+AFtPTCTm29K7hXwD2DnZXFWDLCtIpFh/SHiqIihAhxZ
         JwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785436383; x=1786041183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahCtsMBdVYMxFMkXHrGydOopNEKYRJCw12sUjfq9kyk=;
        b=GCCIK7sWAWD28waLq8FpUz123j4QWFV2GNFZxEk7UeKodw22kOLqub3VFKFxEck+yt
         K5+d/N0ygWqkjYirg0C+tPj8cZ2EvrljcNTYN2JJWgkDFBeorLPFdPKfNNGi9mr9aiGT
         spANHWewo9VzLRUjEgj0OCBE4R7kiqlO+R+SSVtTJ+zs55QjZgs0VjvENpza+6Y6MIVN
         bK9VBtyn/WSERVR7e5g22J+KEEF6qfZ4Dy7ces8kY1Ja7zQSHT8BmjOKQBSRIY9gZUbd
         TLrTUwFrSQGMNP0wgnczT3G+dV+pQ3g585MrFl2cp9veifZQx0FG0a00HGIjB5MrOiJL
         7lFA==
X-Forwarded-Encrypted: i=1; AHgh+RqWiE7OjOYmX4u1HVttHxW2RVyIh6itvbsAShKFrg7tPPX50/mI6/hIsV3NARtRRXyEpFJ1oATpkOOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyOz5lFzTvKXJoUOUFTxqIAo+cTo9mcFqu2NDVcAui0DJfQl4T3
	+W9vtkKqwQnGDR6rEhVMTamJJVod2NxeLdORSt4TqNv8v0gKSCL9IOMReN8Mt8aTCkHrcFqVDFP
	dy/Zvm4N6tygl1NDW9Na9LDxfbkn4nQL2+NkWtxNhSJoj5oSahdXOR3q66hKrYD6B
X-Gm-Gg: AR+sD10Syq+JY8fiQ4oeARYdXcwQBDFxiyZhYjy6ztAewE7rx1gktSqNJXpSnmdtRBX
	wWzNZWoQ2pL8H6s0ig002MwXAjvfDLEBp9W8W0fa4MF7XfO+dYh5Dvkw0gxOWzOJau2gtCgtvI1
	g/C0qH4QICaim0HdIcqC2YNmwTZp1lyeuT5D6QBzwmlpncd9XkefALVNgwlBPEFkcpNt4YmWvsE
	EV0N+nJVJ8X4cdJQAo0Gqm1CDZP7kbcEMsXoCNcpHLhvUIv18J7ZbPRlQQ6AlN5IqhY5UtwU0te
	a2vKgO0Lp8oDQZrbTY4fMVSjL6bG0nZZyc3FJzVLNECTahnk8f5+AaUKjkgw0ixxXCMKqMl5m17
	19KM8JIcxrNoCtnKx50UVgOMbYemPptMkyPY0e5DclktXv1pwlZio5nXoScbzW/AR
X-Received: by 2002:a05:690c:6210:b0:81d:6af3:b9b8 with SMTP id 00721157ae682-81fb8aec869mr25686587b3.60.1785436383437;
        Thu, 30 Jul 2026 11:33:03 -0700 (PDT)
X-Received: by 2002:a05:690c:6210:b0:81d:6af3:b9b8 with SMTP id 00721157ae682-81fb8aec869mr25686187b3.60.1785436383000;
        Thu, 30 Jul 2026 11:33:03 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8a882f8sm15241967b3.23.2026.07.30.11.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 11:33:02 -0700 (PDT)
Message-ID: <78ed74b8-a810-4253-af7d-65bddd223fd7@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 20:32:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-1-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-1-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b98df cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YquD-R9NUEwuMsMzHaIA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: zduzipfHFLPmBG1fCEpQhDHIslCX6v-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzNyBTYWx0ZWRfX28ZHTmx8X6BT
 x3C1HOQtk5NElm98x9o07xvnF5eX+L5CFsZdtpZxEYOKNcNbZziXnZ6q5lOv5id8bJuof41yJzA
 BADNRiazbYKzDbJHJGU/X4cOLdcSbeeJaJ4zJ35cJILvQIe86K9WhpHXwxYfxYSkLLvY4drPjE1
 7kRJRXQE83++tGHF9b4N1QK0hmhy6+mma5mQIJcmhlAYCorVddhDJqskFouTM8KOZOLpyaX+p3M
 S3T5HUE32GDB1gAP+WBDCv3w4emvBAB3xrXHFYoWJV+mpd7NqHrKxGz0qlcQB9zX4p/rCcMY/g1
 IjzuCNrQt4lgLBrgSdwxceW2+fgWUp5DyDpAr+SGFbYFMCqyqiMLMTxN7bOcH2LUD9DDPPNDH5I
 wtd64W+DuwIXKrSMKdFb4ruOCcerPlLNhEejZtmgEEPvqmG+wSlcvOWndAbigo5vHjS8dWHhoQa
 3T3/1W7E9ZDyKE+yuvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzNyBTYWx0ZWRfX41/POVboIu93
 QenTqEybL260cE1dZO/mxqJIQHnAlJ+UGv7PuAgCvdikb+d5CtXpNKq8QZgnxkeijqZyHhM8uZf
 snrKfti+uCGoB3F3fiWdDiTiBpib8Vk=
X-Proofpoint-ORIG-GUID: zduzipfHFLPmBG1fCEpQhDHIslCX6v-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300137


Hi Gaurav,


On 7/27/26 16:22, Gaurav Kohli wrote:
> Document the optional #cooling-cells property for Qualcomm PAS
> remoteproc nodes so they can be used as thermal cooling devices via
> the QMI Thermal Mitigation Device (TMD) interface.
> 
> Qualcomm remote processors expose TMD endpoints that support thermal
> throttling through firmware. The cooling-device specifier uses 3 cells:
> 
>    <&phandle device_id min_state max_state>
> 
> where device_id selects the TMD endpoint (for example PA, modem, or
> CDSP software mitigation), with constants defined in:
> include/dt-bindings/thermal/qcom,pas.h
> 
> Example usage in a thermal zone:
> 
>    cooling-maps {
>        map0 {
>            trip = <&cpu_alert>;
>            cooling-device = <&remoteproc_cdsp
>                             QCOM_TMD_CDSP_SW
>                             0 THERMAL_NO_LIMIT>;
>        };
>    };
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>   .../bindings/remoteproc/qcom,pas-common.yaml         |  9 +++++++++
>   MAINTAINERS                                          |  1 +
>   include/dt-bindings/thermal/qcom,pas.h               | 20 ++++++++++++++++++++
>   3 files changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 11faf655f530..f75cab6b4ed9 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -77,6 +77,15 @@ properties:
>         channels and devices related to the ADSP.
>       unevaluatedProperties: false
>   
> +  '#cooling-cells':
> +    description: |
> +      Cooling device with three cells:
> +        Cell 0: Cooling device id as defined in
> +                include/dt-bindings/thermal/qcom,pas.h
> +        Cell 1: Minimum cooling state
> +        Cell 2: Maximum cooling state
> +    const: 3

I'm not sure it is necessary to re-explain what is the property format 
as it is already described in thermal-cooling-devices.yaml

Other than that:

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

>     glink-edge:
>       $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>       description:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dcffe9fc54f6..3f1e2bbf7099 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3423,6 +3423,7 @@ F:	drivers/watchdog/gunyah_wdt.c
>   F:	include/dt-bindings/arm/qcom,ids.h
>   F:	include/dt-bindings/firmware/qcom,scm.h
>   F:	include/dt-bindings/soc/qcom*
> +F:	include/dt-bindings/thermal/qcom,pas.h
>   F:	include/linux/firmware/qcom
>   F:	include/linux/soc/qcom/
>   F:	include/soc/qcom/
> diff --git a/include/dt-bindings/thermal/qcom,pas.h b/include/dt-bindings/thermal/qcom,pas.h
> new file mode 100644
> index 000000000000..f603bddef9a8
> --- /dev/null
> +++ b/include/dt-bindings/thermal/qcom,pas.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Qualcomm PAS remoteproc cooling device indices
> + *
> + * These indices are used in device tree cooling-maps to reference
> + * specific TMD devices provided by PAS-managed remote processors via QMI.
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#ifndef _DT_BINDINGS_THERMAL_QCOM_PAS_H
> +#define _DT_BINDINGS_THERMAL_QCOM_PAS_H
> +
> +/* CDSP thermal mitigation device id */
> +#define QCOM_TMD_CDSP_SW	0
> +
> +/* Modem thermal mitigation device id */
> +#define QCOM_TMD_PA	0
> +#define QCOM_TMD_MODEM	1
> +
> +#endif /* _DT_BINDINGS_THERMAL_QCOM_PAS_H */
> 

