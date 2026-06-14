Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5580335BA8
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473512; cv=none; b=bUShMg8SCSoVEnisUnDv1i0dNZFpOStIuvFGHjFUt5MzRlg1+DZzNOZV0YXPXBr9Hp7LybNXO0TrGoxyL52/6iYBEaFVUsV+nx0Go6rIRInQcSVoQg5RUv1I7KKaRcT94moDznqWjKIToDV7q1cRKsNYO7ZSTFwOc5/7HrT8GpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473512; c=relaxed/simple;
	bh=5dt+6MqXiKrj3D2CDAiUhVtJRZipaEavqbORD3dum7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpN1wc8L/m1zn3xvGiy66S5WXA8dC72WB+uh5v63l1XqwmCSygJHug2w3QNd14IPYhrlFO2DCJljHAk1IevQ22SNlrLhmE4mWCob2F6G4vVgMr2N8OcBJ5ufDi7i5sZwaNUqWwcZjH1VavGZ3kKKdVZ7QHFqGh0pR0Vj29MBR8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TviYmSh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZNVCmL/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TviYmSh1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZNVCmL/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELEHGN677883
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jn5ac4uChm1MWfrdldPnTXsvBVQiX9Jc69C3l224ZSA=; b=TviYmSh1hB4nHkzu
	6HGrSrTw/5Cfb8hAQkDnRn7DIHYSeqV9eMC+GQjyEZG8DDuD5lDi6l2sRrOG/QiD
	1OVxpZZ65xuXYmGAWH7vR8jq+1pMpFAQ8Q0W8fAHc4NPypJXrLWO5CHRjgYXvDu0
	FkIV5aWEWgz7zCbkx7UMQ2f1LdL8SxaUhbREX/yP4iUtYEsGJKvD6me94CrUInBX
	xfS4lYC34Gs466eFGP9QDRigasgfG6qyk6cNVWFqHoIXtUJy0tA9rdLU1ux4CoXX
	VPdC+n4vo4ElyBGOUqPCasBpsHZGeZwcR9SyGYHvX0ivv3FNTYQGWrfXz2rTaJ7U
	bXrRJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffmjsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:45:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f7bd027eso751754385a.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781473510; x=1782078310; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jn5ac4uChm1MWfrdldPnTXsvBVQiX9Jc69C3l224ZSA=;
        b=LZNVCmL/D8tFc+J1zewJmzcPth6pybQZqdO7LmWB9oo72ZWDy0FUzAzXodNg6fgVj8
         zM1iPGuoy1ppCSWmCN+Tye//lKqlQXuD9kz4Gujm7noC0QyRWe+14Iof8TKH+9E4+u+5
         feUyrp89QWxKb0vMeNJbxXEPqyqyv8KZTAZFjUc2/hQRqmew++AkUbXfkRk5o6RhtCI3
         ojLMAJimn+8X/HCevKa6vLk20ld6dnF7PSEdaPtFFLJ5wy+oDrqkEB23JC9AGhhS2Ark
         9horVrcL3xs9DwXHE3AvxWp6fNjij5zidG+5LrQZ9Uz5h+ia82zHcaQoAt7bnXXJL/F0
         hTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781473510; x=1782078310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jn5ac4uChm1MWfrdldPnTXsvBVQiX9Jc69C3l224ZSA=;
        b=atKxhJCMAR0E2maCOqv0bTU3nKDouMXsSExFYi3dATj24sXsnY0sR84TIkiRXpALUA
         /DDrKtslKZqBO0YDz6MLVspMxu/SbEI3CWLsxReXYcxkDl0+hG7e37K5qiLxoKDUj7YU
         61B9TRtYhZqvTx/Pvl9CoM2gi05Xk9VduhR9MhceOjJY91ho1BAk+wpBPBxsX7xmkKEd
         EWwZmPXYe/LjoxO4PGABCLVwWSO98yV+D3dkoPT96hgNyf2xLq0KB/QQ4Pt7KSDB4isO
         qrAnupUvd4bTI48m/tOXI0MRtk5Maw/Q+P9O/BEnE118MpGKRL/NADtDz7lm9Is1VPmp
         MqfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1AAgQUC2LrAt5AFWMBNaKhHh3hjXavnlmtsLSib4C5cFvljSiEfqNPkUyyGLL1nSr52Bh8sMsRofF@vger.kernel.org
X-Gm-Message-State: AOJu0YwRUBpm+y+3a5uvRPyl0n41sd+u7BB+NSsC+OxzlaWPksrxfJEP
	GNjj0+1ewST1Nwra7wULX2SAnKpY/wAXWz/vQjQiadiiZ+B0Tb/SHDIq+EB+SaFl3pB9SqXWdEB
	NRbtDAejOLrdBtt8vZYdjieaEZiC02ewCWTAOMdul+HtKdhBoktsmcNEssj4WoyaU
X-Gm-Gg: Acq92OGm2Bed7qDw1G+bbk5nabxW3f+OZ4rjvzgK4y6P42iCFulO414Sth5rvulD4ch
	kY5EbOhbhhJ1mtvHsbOkJQKQ/lEZrbuK3Wvdxi7OHTp0QTB3SgEjZBnSteYj/VDgcEEycROeqj9
	UIfalYjZyHjMi0WMfteRt2m/ULKl90lV0Kk6q319IoMM0K3RSrsxa/ETbK3d0CUABcXxLNd5S9R
	M455CbwgHp3ASdj2x2h4k5Li2t1LgDv5zeJMQW/HFuixHkP7HjqS9qQWVRhOkvQ2wDqTHSGHVOU
	aezYPuPxhWdLC0rmL1JkcEIrx4Sjr6rO/eIM8TojZ0+6xPq70+ppa6WbVbD30AZdKD28DWVwPP/
	rHKJqLxJZpw8YMp+Z9SMPkIHDcePbfndGB066sHLu6nQirpyvLFkyv81wVThzSjdPVRzRGom+PI
	G0Obx4AzVxnIpzG12hmImR/LmQX9lap8AEjx8=
X-Received: by 2002:a05:620a:2888:b0:90e:6dd4:5d6d with SMTP id af79cd13be357-917efcb1645mr1373577885a.10.1781473509011;
        Sun, 14 Jun 2026 14:45:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2888:b0:90e:6dd4:5d6d with SMTP id af79cd13be357-917efcb1645mr1373571185a.10.1781473508410;
        Sun, 14 Jun 2026 14:45:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-399313e9385sm17503081fa.7.2026.06.14.14.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:45:05 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:45:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Message-ID: <ry5y452gxtnjdzux32saufyvolrkvudlaldmwxdvkcqgrkmaxn@53ikkvwsazkw>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
 <20260613-shikra_adc_support-v1-3-57d5e6c7f47d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260613-shikra_adc_support-v1-3-57d5e6c7f47d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2f20e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=W1BDsSXQsNOK9CrRnycA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HXRRknLXjQXktr0z0N3dbkeIy6swHa3W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIzMSBTYWx0ZWRfX5ZNA1Gixfrp1
 Byq7kBBU5Oo9le1EVICad0cHeaQcaBsPsxBOgFgbd8an0VAfcWY2BC4GELUmnZp0XIOfvdF2kSW
 AOqGwVokCQ42mVcc5srLzX7PB4tY0pE=
X-Proofpoint-GUID: HXRRknLXjQXktr0z0N3dbkeIy6swHa3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIzMSBTYWx0ZWRfXz7RVc2Zp9IMQ
 sqwaEmsG1LW8OJfbkcIhjM+SQ0sLo80lH9iHmJgnmkLEYin51v8LqxFL5pAzOyR3AhdpN1tCAIy
 2EDajI9eRLJOnXxmNkmyoghjnCPm8KOT8JEsS+PuUIDAltaX2heDgS4M1O4kFeMJS5YVDZ4W4QV
 17YUz1CHsT8QDhHGQ3dwLFxZnwpJCB0yBcpa4e+ROGpv+0IeqJ8XmSytbh3WDqFfmP7tqJzDZve
 BdPfxNyG69OCGIBgbxsfUuAHGLqGaNBmijSA6tG2aZ46f8Ju7b6e2oWMF9D9rFdP/wX2K/7bYBJ
 9k8R3LqrhFfLLXU/lU+72bOZu68xgVC2aTyr0I5V4nqLhEQ832F5pwGCwPPRNDbN5QI1gvldklm
 F/+qoyfTewIkLSB4+x5NoRxqzoHbiSxwr8fZNMQtYdhieaKDqI+deSR501Wt8QGVT3dIGr/seZR
 X5GfFzo5VJAEJcVFh7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140231

On Sat, Jun 13, 2026 at 01:39:23PM +0530, Jishnu Prakash wrote:
> Add ADC channels for system thermistors, used for thermal mitigation.
> Add ADC thermal bridge nodes for pa/quiet/msm thermistors. Enable temperature
> alarm nodes for PM4125 and PM8005. Add thermal zones for temp-alarm devices
> and system thermistors exposed as thermal bridge nodes.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 184 +++++++++++++++++++++++++++
>  1 file changed, 184 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> index dc3861489f64..c6c09d773abe 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
>  #include "shikra.dtsi"
> @@ -27,9 +28,184 @@ key-volume-up {
>  			linux,can-disable;
>  		};
>  	};
> +
> +	pm4125_msm_therm_bridge: pm4125-msm-therm-bridge {

Generic node names, please. See, how other platforms name them.

> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	pm4125_pa_therm_bridge: pm4125-pa-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	pm4125_quiet_therm_bridge: pm4125-quiet-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	thermal-zones {
> +		pm4125-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm4125_tz>;

This should be a part of the pm4125.dtsi

> +
> +			trips {
> +				pm4125_trip0: trip0 {
> +					temperature = <105000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pm4125_trip1: trip1 {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				pm4125_trip2: trip2 {
> +					temperature = <155000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pm8005-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm8005_tz>;

pm8005.dtsi

> +
> +			trips {
> +				pm8005_trip0: trip0 {
> +					temperature = <105000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pm8005_trip1: trip1 {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pm8005_trip2: trip2 {
> +					temperature = <145000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		sys-1-thermal {
> +			polling-delay-passive = <2000>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm4125_pa_therm_bridge>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";

Passive cooling at 125°C sounds very strange. Especially without any
cooling device attached.

> +				};
> +			};
> +		};
> +
> +		sys-2-thermal {
> +			polling-delay-passive = <2000>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm4125_quiet_therm_bridge>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		sys-3-thermal {
> +			polling-delay-passive = <2000>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm4125_msm_therm_bridge>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pm4125_adc {
> +	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
> +	pinctrl-names = "default";
> +	status = "okay";

Empty line before status.

> +
> +	channel@4d {
> +		reg = <ADC5_AMUX_THM1_100K_PU>;
> +		label = "pa_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@4e {
> +		reg = <ADC5_AMUX_THM2_100K_PU>;
> +		label = "quiet_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@4f {
> +		reg = <ADC5_AMUX_THM3_100K_PU>;
> +		label = "msm_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@54 {
> +		reg = <ADC5_GPIO3_100K_PU>;
> +		label = "chgr_skin";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@55 {
> +		reg = <ADC5_GPIO4_100K_PU>;
> +		label = "gnss_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +	};
>  };
>  
>  &pm4125_gpios {
> +	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
> +		pins = "gpio5";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		bias-high-impedance;
> +	};
> +
> +	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
> +		pins = "gpio6";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		bias-high-impedance;
> +	};
> +
>  	vol_up_n: vol-up-n-state {
>  		pins = "gpio9";
>  		function = PMIC_GPIO_FUNC_NORMAL;
> @@ -45,10 +221,18 @@ &pm4125_resin {
>  	status = "okay";
>  };
>  
> +&pm4125_tz {
> +	status = "okay";
> +};
> +
>  &pm8005_regulators {
>  	status = "disabled";
>  };
>  
> +&pm8005_tz {
> +	status = "okay";
> +};
> +
>  &rpm_requests {
>  	regulators {
>  		compatible = "qcom,rpm-pm2250-regulators";
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
