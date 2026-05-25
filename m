Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06233DD86F
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701467; cv=none; b=dJcFhJTVrbOzVR7lUJ8ZdA6TenbSRWq/cMdPBjtM+hhGOPelGHqFPBXEpUSzJxqu11CFKfz25aVsdslHwpoW+cW8uymPzkyASxVlscrv6bx9OzQO1K1meNOFfUvQHsg+ggJYntfu+NzFPQJeKFBuQZUer3K/MctlvSazPXUrpHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701467; c=relaxed/simple;
	bh=k+fY++PE2rWS+jJjLhQF/dDzwqh/Oycm18WykG0LBxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jl823KR833QCGtuL7ZlUXwQxw8v6MmLWl87X/vE4aKdLi9VNGOVrXdBSvUk7h2NH7qYeJEiFLPzIWQQhGgaqKWxyEw+TpA0M3WSdT9VPZcXlc4br4+uaNgxPq8QX6yRI7/ZnI7mAuEP8WLUP7/hWALC2UOBMbjMH0aj82McaZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnoWcp6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKH9iMoF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnoWcp6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKH9iMoF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P81r801844577
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HgrxcaB25cP3jmddVo55Rq3g
	x001+kwOlv+X3ajyHx0=; b=VnoWcp6fCIFjYnB20LzfnoTs5c2RIkD42P3ZC/Z0
	AoUn0EYpgskuxaJ12gYSiRA6snJanw0PRo0lW3o4nD46Ns8TgnOB7sQ0TG8RojZW
	27Z5OWktjmu6eOULwvOekGwQOrAZgSaYYM4AV5tEch+z+9wuld7rcXFwK6ap6Zx7
	PeLRYAstzmgWmUVvJKc5nIQ88F/Y9FKo1uzN6N+l4+WTK7vX9KTp1y50+aFdZw9r
	U5vM1XX3X8cwxh+5douU984t9agQ6vXzsXgBsQH42Ccsxf/6wDctoLcSy+0/wWJ7
	QfbfvuY50R5jM9CKAS45oErZqkGSpvsKuV0bVtCsrsaFVQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5gft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:31:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6314d30fcd2so2398611137.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701464; x=1780306264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgrxcaB25cP3jmddVo55Rq3gx001+kwOlv+X3ajyHx0=;
        b=PKH9iMoFr/OjrPlP80eGGSl9+1pMcQnQIFkjX8f1V2JI/f8trMCJdRI7srvbZoFryO
         KlNRoryAxNQ40+259W2cc/Jb3wzvKd1/yO7Am6MEiGYGbTMmOAhkjID+5DrNBvXZ3xZW
         z+IHKiadUridRVYvBiCu/U69ec8gSXdxE3RhC8kPERyIOKNbHCU2JMJ2R+XIW7DANKTd
         RNJZMpDumY0UilebfrRkAU8i1WJtsA2x84VNJP2kv03fy88rRDxlrEBZRXNDzQhdqFZT
         IPqNZCoKUHEpJvGGbdLKT2r88ikoYoK7t9J5y58wv7doO1MDTnf7YLCLQJZjfhALrDML
         TBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701464; x=1780306264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgrxcaB25cP3jmddVo55Rq3gx001+kwOlv+X3ajyHx0=;
        b=sYwukpeuXWUgoh8d0UO7Llje7HC4QSfJfgTa2mHosDiFJ++5xs/bivrVCBnlECfhXi
         blfUbGSoWHynDbNADo3qDBUqOAP2saoYpjNRF2yPFUWjMQpO6F2KHlDOwZUhhOdxaDpF
         TJLRx07dby2MvVUOD3l6iKGptok/zix1TI6Uyeioi1skShf0cvtTqgYnHUn55hNFKESn
         za8A+TGSOkiIKlejtxSZBqIzP7dyhQS7pdQl1UpgA1UOut88XvbjlTSxoPrR5GWmLo6Q
         aQYdG3O/k5tq/VvnbXTXYggsalgfJIwlVHIIlZpJ8Fz0YBWEy5xTEp8quO993ikBQw83
         4RyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EwZy1o6Qa26qBuG+2+Sg55iGkld5+7ec5NA098EV02L5CdLwug79L2Y0KqgdsxVs4CynmxXwElCVs@vger.kernel.org
X-Gm-Message-State: AOJu0YxQHBVtH8k31gu5C4UZbLr3CNUte8xk46pcMjWzajSVDq3QMWqI
	YrV/RGdN3bXIr3ANbRmPbiKy5ptwG3J18QjuHNKaaRmbAShnA1GAgzYFUN5UP+hIkXsIu/cQJuQ
	nn9/p9vf6XyK5q4s/NCcGwFmT0nYQlc2i91y4uhOHOkIXxkZftfzHSn80YiDCPUpYrZEYE367Ze
	0=
X-Gm-Gg: Acq92OE7aZW9wUBSBrKj+B8J4VLYR0bbzAsjjbKTxC3Fs7mJAZaS4AyjZDBo7I0hFhC
	aZgE+kBksKBOH/E8TCwp/1ZdDtaaQCSskPhGfPe3NGEFsM6EPCbfS7WNwegEU2Jm5VBymnl9vGv
	Z6CKb6qshlpMPUEAA+6x9/oVQx14T1KYgSa+cItNLta8anCg1d3y5Lts2ECWXLmtNd6BBEqMiW2
	31c8AJf6VK/83A8pYUw98hbrs2edOPbNjaZiJIzmuZs2BaK7Z+ppFGoJEKGDchT267xqeVFerkD
	vBxpXXafswmHOXa92LlPobiJFtNg/bjW1kVnu66lvGCY2yKrPfP4jZ9YYbkBWY20gIRCVoLlqsR
	+8K5zryygDIeGXoPRxKQ/liBosIXinB/fs4wulqo9rdsfWAP+IMfFS33hln3gE0MqJC9zObY0MW
	X5MxJHCUPa5uIhjtps94DwtRfkSwZ0g7RtR30=
X-Received: by 2002:a05:6102:b0b:b0:631:2d7a:b18a with SMTP id ada2fe7eead31-67c87061884mr6061502137.31.1779701463998;
        Mon, 25 May 2026 02:31:03 -0700 (PDT)
X-Received: by 2002:a05:6102:b0b:b0:631:2d7a:b18a with SMTP id ada2fe7eead31-67c87061884mr6061469137.31.1779701463453;
        Mon, 25 May 2026 02:31:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf2bdfsm2506932e87.58.2026.05.25.02.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:31:02 -0700 (PDT)
Date: Mon, 25 May 2026 12:31:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <ysiddu@qti.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: Re: [PATCH 14/16] arm64: dts: qcom: shikra: Enable BT support on EVK
 boards
Message-ID: <rbu5oub4uc4rubdlfth7undrirlyfwbnst5clgyvm63fde3tcw@fulet3k3a4sf>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-14-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-shikra-dt-m1-v1-14-f51a9838dbaa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a1416d8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vyf168emxLr5CmuOD0AA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NiBTYWx0ZWRfX+zjVIOF55YTX
 YT6CUnECdsZ/EV9Y+35yXVJAZxGCaLOsGWUgDvSh2lf6rWxONPfENN6Lq4SJVfcYWCWiBZGxiNH
 0KuYpG3RjZPWLvJmXbW2TdhWa8pR2w9zOx60YuYd/q1t5MIH1J4EsSD7JRi5bTAz8xvDcH9MQzw
 dknJfeRfh+PeUx4KPbwrZEdeTP9N2Eq/NmpyXP9IZqa5EGWyIjTwhKHjyTlzLlblK3nVO8RPgH/
 zBORMBaz9FLaCkn/qmtDsoUA0zhBLOlIibMsHu1JZhymurp/erhv/oPv3Osmm26Jn1olPiwUfTs
 u3zaO9LfNyb4nWONq7L+pIOLbA9AHe+wW7tbsisD4miWNNzNwtuaM+DkCQxdO0E+koAZr41Z+vY
 NMwrDd7T+q8+W+p9JLZKTCDvghMT2ZQvaogQmkkjzXB7g6P9j6i3OGUwh/EeP5T1S63lk/vic0b
 85B5GMJWWsbpVN89FZg==
X-Proofpoint-ORIG-GUID: O90KCc2K6jgceAZTdNNsNaSodMUWzi3y
X-Proofpoint-GUID: O90KCc2K6jgceAZTdNNsNaSodMUWzi3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250096

On Mon, May 25, 2026 at 01:19:18AM +0530, Komal Bajaj wrote:
> From: Yepuri Siddu <ysiddu@qti.qualcomm.com>
> 
> Enable uart8 and add WCN3988 Bluetooth node with board-specific regulator
> supplies across CQM, CQS and IQS Shikra EVK boards.
> 
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        |  7 +++++++
>  4 files changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index b112b21b1d79..259032bd20af 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -16,6 +16,7 @@ / {
>  	aliases {
>  		mmc0 = &sdhc_1;
>  		serial0 = &uart0;
> +		serial1 = &uart8;
>  	};
>  
>  	chosen {
> @@ -57,3 +58,14 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&uart8 {
> +	status = "okay";
> +
> +	bluetooth {
> +		vddio-supply = <&pm4125_l7>;
> +		vddxo-supply = <&pm4125_l13>;
> +		vddrf-supply = <&pm4125_l10>;
> +		vddch0-supply = <&pm4125_l22>;

Use the modern (PMU) bindings. Also please add WiFi.

> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index e62ba5aef71f..142cc8da53ce 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -16,6 +16,7 @@ / {
>  	aliases {
>  		mmc0 = &sdhc_1;
>  		serial0 = &uart0;
> +		serial1 = &uart8;
>  	};
>  
>  	chosen {
> @@ -57,3 +58,14 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&uart8 {
> +	status = "okay";
> +
> +	bluetooth {
> +		vddio-supply = <&pm4125_l7>;
> +		vddxo-supply = <&pm4125_l13>;
> +		vddrf-supply = <&pm4125_l10>;
> +		vddch0-supply = <&pm4125_l22>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 727809430fd1..9bf52030bcc5 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -16,11 +16,20 @@ / {
>  	aliases {
>  		mmc0 = &sdhc_1;
>  		serial0 = &uart0;
> +		serial1 = &uart8;
>  	};
>  
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	vreg_bt_3p3_dummy: regulator-bt-3p3-dummy {
> +		compatible = "regulator-fixed";
> +		regulator-name = "bt_3p3_dummy";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &remoteproc_cdsp {
> @@ -57,3 +66,14 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&uart8 {
> +	status = "okay";
> +
> +	bluetooth {
> +		vddio-supply = <&pm8150_s4>;
> +		vddxo-supply = <&pm8150_l12>;
> +		vddrf-supply = <&pm8150_l8>;
> +		vddch0-supply = <&vreg_bt_3p3_dummy>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 124d0f05538d..73681bf0e3ea 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1753,6 +1753,13 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  				pinctrl-names = "default";
>  
>  				status = "disabled";
> +
> +				bluetooth {
> +					compatible = "qcom,wcn3988-bt";

No, it's not a part of the SoC. Move it to the board files.

> +					enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +					max-speed = <3200000>;
> +				};
> +
>  			};
>  
>  			i2c9: i2c@4aa4000 {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
