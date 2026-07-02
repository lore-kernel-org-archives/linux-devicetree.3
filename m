Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA9426426
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993372; cv=none; b=iJRqvazktj/IKr8W0WeME0Ks7rVH/6QYTFEo1+tHUenKDnW18REBOUADP+4C2WiN7lzSlprtMKpUfO6XSUX93++rkqQn4bnWkW/2rzr1L67nEspjKFXX0756TOmXb4LmtatNyfR6mcPRmPBHUlqlvMn1x8KBi6GBbtC/EzQOUMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993372; c=relaxed/simple;
	bh=nB/zMxB9x6TdcDbMP1nhGGG/kEhO7YibS2cx8eu1P00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLdPhtLrxQwniS/c1Z3l6urp8TApSWbfRl43TWdEgzEC9wl0UgoTPph+pLEpnKpoypoYffpwNUPdgzlJPXHSr9qLUgLokO4x+ktjxt/hz0AopeXdcLqR2ofJ0KWXxhEAaZ6BtTwl0x16veUYy1gRQvmtdQABLYCCw0/G3YhAA8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLYg0owq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCF2lr5I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLYg0owq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCF2lr5I"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628PI5r3009608
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 11:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8rXPAj7Jv6FwojH8z1SXt4q+
	7Q7RDsm6ISneeiOt8LY=; b=bLYg0owqoLkCpZVkzD69fgd0iuzReoP3MvXXOj4A
	ngjIaj9SuGtBPq3ki56VbaziiIeqZCLhPWvN/hCcOiEIVXA32lk0FcfBTeKFPIsn
	5uX1OrrlYXpptg2qPu0y/cMBKP9N9oqw7E8kc48KSQB/opp8rMq7Sm2rup3FeZuq
	BnSl/DCkX/dAhwZRWUzCa5+mcGdBZHbJUvpTAIrfJcgs+zH4QCSOcDwn6WHQDxF6
	N/yEoLMe5mCeObQcVi5Vi3K13varJ1EmWEdVK+g5wwqftrQ+eiSC2wBEVqVLgOUu
	trYfZz/0/flAJHyyety6hoGwkhkfHLbLzp9JpGkDNkEBEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579ruu2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:56:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e663c29f2so62834285a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 04:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782993370; x=1783598170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rXPAj7Jv6FwojH8z1SXt4q+7Q7RDsm6ISneeiOt8LY=;
        b=VCF2lr5IimxYUqTqbBMkMyQw9Zu8DbWuz9UNlI05jjnqS5TqzxrMENm/SUcoJthEuq
         gmRL9035/4F83+/Ut1u3Jt6Jpm7zXevi8STRZwvRlmanO/p5eh926vfAaPAShHyh4VoV
         VWBKlPxnhQAnJ9txuUJrDhnF1TQ8KGh+S8MujqJE5xXtQw2D7KS5LPFD6yg2vfG8N6K0
         071V5qTDMUSnhWEFE7o8lxwxx10pO4AijBhYsdLBknYZP+8XO/y94bt1IK/5zsr3htBC
         JqgdBk1q0DuTvyDPfa2CmJWTWGoWhE/zyjMrSXm0olClQP8lnV1fYYqjBgbE5DFOzygX
         Aapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993370; x=1783598170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rXPAj7Jv6FwojH8z1SXt4q+7Q7RDsm6ISneeiOt8LY=;
        b=BPIxI89ftKKmWgm2FzY8s/IgMPPvIkpFjJOlukkVFjwB5X0FTZm0riEUcDWAhX8sM6
         kPGt0SAd4KmmbohU2K+Q5mzYUONY/FKoXNvRUyMzcJgpL7pvtMbkmv8jxXUWiQrNJwmd
         X6agKAD6ZzsYSqLxgMLqJnonNYExzrArPg9eAsAnQ6SQtKvZDvCbIkcuWaLjkSzmjftY
         MrVBOSHy2N+BC6QJGfHRucLl3t14hR4qElqDka+eJSbRBGeYB/ZaRY50kNNwyB+uBK9o
         +RahEXB0vJtTo/+0FNinSKhLsn3nU1Xs76mkuZUe5G+sFbkU9sG8LaoTBucB+BXi09i1
         KTew==
X-Forwarded-Encrypted: i=1; AFNElJ87xtBEenMaag61TONR9kS6x0OzykWL+l1oxhyZ5bSj7egKATe8n7XXPdnUsciIqdt4Q2tfT5hAkE0C@vger.kernel.org
X-Gm-Message-State: AOJu0YyVA3lgvpKGFFzhbeI+hD/ZVzGNIrd6Pvo0fFLm1i41tyclDlIG
	qbF8DRa/DYH1uCLoU/CkSQloDElgBQQ7grQNMp6jTOFuAnd9Eic61kEyH2Dm0GjyPKZQ6dtHXrR
	974yyfEuMwaKACPsDySPHiISuWZ6DFLCsfCR2vYyBQsJ0rGYeoxAEAlj15wz1MSSop+zxtJK2
X-Gm-Gg: AfdE7cl7kPtLqbaGcRCuNsf9qW7J1NiuBHLzhZG+HyIYt4wGVIV/pin89Vndwyt8WDo
	oOh+Jj7WVTS/OutR3k4M+4yyFZyh8JpSgPgdSDHD4kkjtMabdLe2fKg8WYpNcCe2e5McJlkU8P/
	7jvQumN060NhO6WZL7t/amCfayyPnYnM5TtcPc+Ub1+tPDrUQm/z7XLDhHvCBVeg9beCicSQVt6
	GmHIpW5eVTMGXAYYrZuQVUZhoiPpkySWncQfPGpgzBCyFhwQ+YDGeHRX1jZuLd0elWjdzcrVWgs
	nmrDvMIZPCdUvWR4Dx1ecqZgdlHgUqsI1LjMNCoVr046z1aftaO8xNo/D4SRBg7M9461ULZJcQt
	9cNBNH7+4KxO9KvkPD05YIJD5sw7iqdE8xgn+rjDVA3QwxgHYPPPE6WeqvAkVE65KzpxFslKyMb
	MM0oyBwgKcWWP325LdqE+Q0ZyR
X-Received: by 2002:a05:620a:2b97:b0:92a:f74f:904 with SMTP id af79cd13be357-92e696af821mr1226287185a.1.1782993369613;
        Thu, 02 Jul 2026 04:56:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2b97:b0:92a:f74f:904 with SMTP id af79cd13be357-92e696af821mr1226283885a.1.1782993369079;
        Thu, 02 Jul 2026 04:56:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dc064sm613173e87.62.2026.07.02.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:56:08 -0700 (PDT)
Date: Thu, 2 Jul 2026 14:56:06 +0300
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
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/11] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
Message-ID: <zjvb6i3rahc2kwojxrg4cwaqtddcho2nj3sfcr63xkkrm7tdd2@2yl6rxb7rtcb>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-10-f911ac92720c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-shikra-dt-m1-v5-10-f911ac92720c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX0Ntd/RqA6bZK
 WvE+g9AYHe/2PJeYTmCEz0LtNuZ2yXdKIZKSCDC9Lm72RBpb8X/8JFN9dP+/opAxC1vgs0dEsPF
 x3oC2PUt8gJw4gES1drkPA79EX7lAiGtBG7+lzJ4ZFwS/dtyfklzaB1KHYmruAJKN7rF9eeCb+N
 0/gwRoxYs2gGqVe1FqJTZcdrCHp+fnhMU85p+yJjY4yR55QYP/0ymQoSzb+zmLUIRcMb0tZ1I+v
 PUjD3hYX4NrhFvIs3g5DbfzgGodxfbNd1UyFxMUIuXKqJc5fM8FJwyMKNb9EQYaj/XQO29LnLp5
 lfR9kQ3C0RQ3zwJzAGYqMBwFnY0kMz70bOl5sJjXii6yIFNYu1OjLNxHJWwVYnVlXrsrexGtFS7
 7w7hI/EA0qPp3NWNsEYYDd/Vdgs/pXEkxRU1Z6uWYvqSlk+pXtvoPUb3y7yGJHPDSJWxyaSXSYK
 uu5Ft/C5/8ZU+EDCmrA==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a4651da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kGXCqVC9NZuRQAUF07cA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 9hH4JtYSB6i_6h0c8BbUVjmN5kqw_wLr
X-Proofpoint-ORIG-GUID: 9hH4JtYSB6i_6h0c8BbUVjmN5kqw_wLr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX5Q1FCDM/UnPv
 Bw3nUMiEvVxlPpXC36iswj2gQKPwMRUS58FwrdIN72Qj8Lets6JdwBF8Wq4UaRsNA1IxfJik8F9
 rK79LYvtC7hRZqE9oMa1dOebbV5LyDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020123

On Thu, Jul 02, 2026 at 03:20:52PM +0530, Komal Bajaj wrote:
> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
> EVK boards using the WCN3988 combo chip.
> 
> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
> board-specific regulator supplies across CQM, CQS and IQS Shikra
> EVK boards.
> 
> For WiFi, enable per-board with the appropriate PMIC supply
> connections and calibration variant selection.

This is obvious from the patch itself. Don't repeat patch contents, say
something useful.

> 
> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 +++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 +++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 61 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 26 ++++++++++++
>  4 files changed, 123 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index b112b21b1d79..c9409ab0a3f1 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -16,11 +16,19 @@ / {
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
> +	wcn3988-pmu {
> +		vddio-supply = <&pm4125_l7>;
> +		vddxo-supply = <&pm4125_l13>;
> +		vddrf-supply = <&pm4125_l10>;
> +		vddch0-supply = <&pm4125_l22>;
> +	};

Is the WiFI/BT chip a part of common schematics or not? Why do you
define power supplies here, while the chip itself is defined in a common
file?

>  };
>  
>  &remoteproc_cdsp {
> @@ -57,3 +65,13 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&uart8 {
> +	status = "okay";
> +};

Same question.

> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> index d0c48bad704c..4b7be09eb5a5 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -3,13 +3,74 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> +/ {
> +	wcn3988-pmu {
> +		compatible = "qcom,wcn3988-pmu";
> +
> +		pinctrl-0 = <&sw_ctrl_default>;
> +		pinctrl-names = "default";
> +
> +		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +		regulators {
> +			vreg_pmu_io: ldo0 {
> +				regulator-name = "vreg_pmu_io";
> +			};
> +
> +			vreg_pmu_xo: ldo1 {
> +				regulator-name = "vreg_pmu_xo";
> +			};
> +
> +			vreg_pmu_rf: ldo2 {
> +				regulator-name = "vreg_pmu_rf";
> +			};
> +
> +			vreg_pmu_ch0: ldo3 {
> +				regulator-name = "vreg_pmu_ch0";
> +			};
> +
> +			vreg_pmu_ch1: ldo4 {
> +				regulator-name = "vreg_pmu_ch1";
> +			};
> +		};
> +	};
> +};
> +
>  &qupv3_0 {
>  	firmware-name = "qcom/shikra/qupv3fw.elf";
>  
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	sw_ctrl_default: sw-ctrl-default-state {
> +		pins = "gpio88";
> +		function = "gpio";
> +		bias-pull-down;
> +	};
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
>  
> +&uart8 {
> +	bluetooth {
> +		compatible = "qcom,wcn3988-bt";
> +		max-speed = <3200000>;
> +
> +		vddio-supply = <&vreg_pmu_io>;
> +		vddxo-supply = <&vreg_pmu_xo>;
> +		vddrf-supply = <&vreg_pmu_rf>;
> +		vddch0-supply = <&vreg_pmu_ch0>;
> +	};
> +};
> +
> +&wifi {
> +	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
> +	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
> +	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
> +
> +	qcom,calibration-variant = "Shikra_EVK";
> +	firmware-name = "shikra";
> +};

-- 
With best wishes
Dmitry
