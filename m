Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F364307B0
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431430; cv=none; b=Ow47UEnUTPPg7eqys6MNKvbzwm5onSVGw8DfaQJb2UpkwwcxPHvo1X5kB78Wa25w+AcOxTHzCywPc7M/f58vAp4VkhaJgiTtSBNvr9HFFQVnp50K1VpTtP3Xu2fIZLfarH8Cd/elU7yVtzGBdjksBuSzrWMGu7N+jzXTnsQGbUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431430; c=relaxed/simple;
	bh=fqTSDQN7nJlREtRO3Fm1yNRF9pzv58xXEuu6JG9X3TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3MIDba1iwtMVG+N/jT/yny0DKdJ7q4vI+PQP9/mOMrfTco0KePnXsLzWumyuGw1khWqSCrVUZ1i6z7msvjs94bxBykQV6qpKjI3zM0yUMIwWSC4ArCipthn/ag9J+OK1EltkqZxQWhVfnZWjOI4vlDHbxgjWXVOanQEuAocFzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBBy/EH4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFioPuR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBBy/EH4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFioPuR+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGX8wH1629353
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ho3uBP1okvITlExnW9igFrl0dofyDrS+e5s1TgETMgA=; b=UBBy/EH4eTWBX0Tn
	AVOdHWoyU8LrVZtHlD3F36nCQV22VwWBBeyg7nrZ1hh2vaKsMF7Ktm68fuv27sBK
	rqVZbzO3Rrs0HZQLRpOKzIdFoXwY36qlcAvwWb+8KyEQWkQVrHXAhaLhtLu1iRmq
	rsatS7DOR4+fhvOOSgehwwSl5MKVoMUQtmNQ8G1vKOADqpsH8fqms+MZQtp5UE8s
	hmKXQWr8vWwikGX8gGkk8GzhAgnymfvCqAfLAEzUb9lxd/zG4hDbAUwIlesf+HH0
	Afi2xQCMeOZgRa4518qxTr9oreC87FbPGdgRnwOqoxPbUySts7nWUgNGcqXCPqrr
	9zqGIQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7q3h3m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:10:25 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81ed0c52d9cso2156987b3.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785431425; x=1786036225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ho3uBP1okvITlExnW9igFrl0dofyDrS+e5s1TgETMgA=;
        b=KFioPuR+OTBw1ntfj7UWuJEmOCwtyrhDol4ZQ6OkxuBvpdKNDBV+gzDx7/JpbJLiz4
         ZdsX1zLXMXSOSh8dKfM9sYCKd33XtDbsU4nial8yL2VyE2VBGmVS/eDcEXaZ7fOebC6j
         Bq/dcoixZJNlIyTkT7skjB1q4uVjGyBgdaNSW0BORbwy/tdm/VnE8HYsxZASu/hs1NRx
         g8za3iwtJ0sokVIRWQju8Z1iEriM4qYznZLUZ6ev4/c7n0EIewu3i9EVpJGuGOMW5wuZ
         3ZLdzoPJdmiZbixK2J4Jsvx3+RrF2Llq/74axF4pSVrJQacktC5aPZDSxUaQqIDr1LS0
         DkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785431425; x=1786036225;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ho3uBP1okvITlExnW9igFrl0dofyDrS+e5s1TgETMgA=;
        b=oUD+8A9VLCKL3cJAogv2JfKeXy2Qw9AFD8P7wnVbmFPQfM8UE0Sr/fE8asc7Asthyp
         GX0JClAEvpY0Gd+7aiUbMcV2gd0ps1NJzrCyxFnoWS4eUAd7Q8WQPsKScrOI/p8nlj/L
         IJxDl4GMhw+k1Y+3qFRDEzqKOTlvtnLv8QMQ98JWiMDDj3O5DnmSECyRKFMQT+MNz1AJ
         nvJNxG8oaZ7tyTgZxb8lozzcF0SQhV0rKPboG6dfRLLe7pvbUWJXivDRsn9UPXCD0itN
         IogfMqquy8li+aNRRSMMptcy4QQVInvGrIk3T9dUcKrth6jPUkDA/XuMO//I7VrPhJul
         gS+g==
X-Forwarded-Encrypted: i=1; AHgh+Rqgqs6Arytrl6QX8cpXRnsNRlLy/reapLNl+hJntCgWEnW+0gRh2otko6G/RZzxI3Ms+tXvGCWW+/rn@vger.kernel.org
X-Gm-Message-State: AOJu0YwsTsvdho3LgbJr4ZWO84sPKZvrbg9DUxZguwFFFK9YMeffxwUy
	HsAAcVJCJ6UiNgVUyPiXZtZumq5PP0wgB+mib42f5LSYCwi7NvCJ+PN7n6vo0J2ivY0UdrdE4vV
	XsJYTz6nrln1392cAeMaBUmVaM/1rI64R6xutbDqSWCISARJXuQIfObpCnzzhj3Iu
X-Gm-Gg: AR+sD10TuYnj3oC77SrRwiZcKa+d9/rNSxNna14wSD/S8myPWw00UZHQmkbEjWssiB3
	CfP78UpvQlQ3+NZlM3gaP5nwppKuwo46rxuhf9Kj2qYR3DCb93ZuT4VirZ0m4ZvfOeM9K3EAyZ7
	8uPGOtiOj798hES6jrqqXictzckA0mPnPwRYT8h4rhecsb5idsVBepcBLemNjlZsJqIWJCplNc+
	s+mb46cgG7m2fQWAwhPmjGFzXnzBSgQIS3Bz75p10vVlbzfjpHyCMN0VcEe24g/H91dp+4fORRa
	+3cf1zyg8iB7JxB2K3Dc9RG8fjwMMBR5y+JQDh6nYr2mpMccx4tIYr5gDP2Kkga8JPDGB/hJJKd
	EjMj/wsUR38bFmMT/gAcIDKB0sqXcApW010+U4FZQumMd1ScwZpbLRM1maODeh0dk
X-Received: by 2002:a05:690c:7342:b0:81e:8b2c:a7f0 with SMTP id 00721157ae682-81fb89ce3ffmr24564867b3.10.1785431425531;
        Thu, 30 Jul 2026 10:10:25 -0700 (PDT)
X-Received: by 2002:a05:690c:7342:b0:81e:8b2c:a7f0 with SMTP id 00721157ae682-81fb89ce3ffmr24564627b3.10.1785431425081;
        Thu, 30 Jul 2026 10:10:25 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8a8feb5sm13764387b3.31.2026.07.30.10.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:10:24 -0700 (PDT)
Message-ID: <0f56d22d-437d-409a-852f-9fbf4e303284@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:10:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
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
        manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-9-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-9-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfX7h+Vn6vT69QP
 yXbV4vUPSpq3F3GXN9afCmrF1UI39n4naFYU3SDtn6w40EcMeJPHmOVzRnoLJHyQHDPkU/N0/rp
 uiS4RPbELOt8QsCGEPDVY1sCv13zIphvNKRFNgCRcdvrixArfeZRIbFcqBIeIpaK+So05f/kqnL
 mRxGbo1+9bFaNImYa0v6xaiEY7kDDzdrzYPzucWnaDivaFxJHx/l5J7/V+W1jttN3tcut+540sm
 IBRYjmJRKv+RqKwwL9tndJ8ZGrx52vIrurx3f0fvBz0ivCrszC6AAlCJzc/TR6YGC9w9o6pmRUu
 YtdWj3UMCjPN6dDmWXhjElQ4XHi2+zTq0uIjuq1ym0SjaixWgvrgp0GjUb3VLL1WEJOkjUdcWvz
 l+7s/t8rfrF4vez16kd3vsYBye3G3s97THVfaSZdg0piNZFkLja9ACXw/mfMcD53EBvc1jFBexE
 a6mV4peNi220YC3Yz6A==
X-Proofpoint-GUID: zVoeS-qHy_IyTp-ZlfZDdw_U2OGIrxoN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfX9jKzKoh5NP/Q
 1lw2yMnTUetu8cp7qt8d0vji/MGWxJNeDMjEww+NZdyDWN3R/hPoaZmds0qJ4VN11TByySxJlDW
 NWZBsNkkBi/cUhjcYgsF1Rg6t/o3i64=
X-Proofpoint-ORIG-GUID: zVoeS-qHy_IyTp-ZlfZDdw_U2OGIrxoN
X-Authority-Analysis: v=2.4 cv=WuQb99fv c=1 sm=1 tr=0 ts=6a6b8582 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vpmf1welhrwVHoobIegA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300128

On 7/27/26 16:22, Gaurav Kohli wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in hamoa.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>   arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++++++++++++
>   2 files changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 9fa86bb6438e..a146be1cb5fb 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -1684,4 +1684,36 @@ trip-point0 {
>   			};
>   		};
>   	};
> +
> +	nsp0-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp1-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp2-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp3-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};

 From thermal-zones.yaml:

	...

	required:
	  - temperature
	  - hysteresis
	  - type

	...



