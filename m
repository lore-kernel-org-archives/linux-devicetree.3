Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8E051C331
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165136; cv=none; b=N0T3AhVtQz1y3Uh5KJKA3DiVk4YdOyS4Zd7J2bQKZtK6Te+St7Y0lr1mA+clX9vfC9No/HGha2ilbJ4XAaZCud6k4KQgj8+4hISVk0Z1MFDKNyiHZOmN+bQO7rTjmobuhatA5CUmwUq2iw0SeBPJNXrXbN8ZVCu9jhc23XxDhNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165136; c=relaxed/simple;
	bh=KeQJijXbeWJ5q75Zs8GJ1q08IqjbRPIAs1FLolc2vhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/cefmH9UEsESQ709PnR7TnwCNMDmITS6d52tuM8+LdyeTmWrgq5NMuGLZYtiWm5D4vqhNYB5h9yBOQBoLs2/G9NrF0t3U8IgvYNv3n+OO1noOh4D/xpbHkTWHV9Q87mB0zwBei1VMMZSmDibdoRyIvlAi/TrkM2zAlUdUYgzw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/exiGkk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGQ7Xz/K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/exiGkk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGQ7Xz/K"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbU872637885
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wh5YHy7+aGQY7ISy/0N263Kn
	noD6IwFmv2T0XtNZlp8=; b=b/exiGkkCnugZVS45O97UgZ3S7biMLKxINZYymai
	aiq1zaLCMraxzRE68DvavKCtrSIQOI56vuRh/+AcRWxC4jeqXNUJmdHpbU1j3k/P
	Icdho0PY5lUOxy8zbPaB1kp7ylervrvbHa1zwCoVs27d2wI5JIzAHYBNu/v/4xEa
	W9dh5Bk7TRfl3BON2G//hltRsz+abX8S4zLjJ/ltmxSSHx5yYFGGUbK2fsdIldc4
	Z3U+MXtYYU7v21Nl+C3RYAKZvz5KgyQW5BqmE4BIaiaoQ2rKfLSF2Cm+2eeBheaD
	43ZCsPJYzCHVYVSjMqXiMuPf6NxxMIK8TDlIKCA26bGAwA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqheje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:05:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-334f782d1abso2900632eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165131; x=1790769931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wh5YHy7+aGQY7ISy/0N263KnnoD6IwFmv2T0XtNZlp8=;
        b=VGQ7Xz/KYDUBUdLx0yXC/197kAcZ4hl5sAy0wWxHhTsnjfAxE2/kGD7KNdKXaictiY
         SCv16t9jUNlDp6X9Q0Fqit4mLtDV8UQU63FdMujA66zaIu4XPlJ6z3V+gChxBky6WqLI
         hyPMJR5zTUWpqSFkLnDoXcYl5UuLa+X2sM760bm27ztL7a77ZG0Xd68l/WoeK+6v/NRo
         fMnwAtC8sYjRfWH7XWlTxMJ287ZyXDVebwUmwCSG/JcvFEt0h+j3jCel15rn/WyxoO+s
         sAKN/fmoxRDMj5H8oRtNFSe+5ylILr/icJGrUxHE8KGFU0mLGb7qeg4OA7LI/8k9HGwq
         Zozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165131; x=1790769931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh5YHy7+aGQY7ISy/0N263KnnoD6IwFmv2T0XtNZlp8=;
        b=gMytyQnxSyX1MYRlU+MnFEbVcs22ASJ5wL1w9+8oKu4Y63vsAHQ7YEv/ajHAOCKbx6
         O0gL2XSvkMU1KkLRm25eP6z2MRQNfr3FXpQeUduhSrTJzNfuI4EEjAVZwfLSoeTxw/MZ
         I4sn2kF1qaQQIK41EHEA6sJvNptBCqwJXQDGy73kUScFzxk+bhbqH/a+rM90rSxLPLE+
         BHwvGHCryDPofqeY8mO8/CB0dFicTysRE+cWwTLWIPDdyv6EtRDOZCKlk8/wmo1Rs9lv
         zNqcLD8kxJNDbQrV+dnFutBdhV6NPOcvDewShNJaNJ+Rv3Lr7DXpEXwOrF3rDIQiKqo6
         Ttxw==
X-Forwarded-Encrypted: i=1; AKwUvBxdS3pHKZCmLGbz/RdE9E69ekTmqy/MTux8yFlLwS1GODy1b4aeZtdQCRC6L0RJ4YJhhh5nBMw+p4ae@vger.kernel.org
X-Gm-Message-State: AFuF++mOj15YwJliOVa7NYFYa09F6JkW96+t92+UaF3DvlT+ZheJJ5iw
	YQifGX3RiA4RtHkIAw/47nfcs4bKysgpr8C7cc4fGX5kn9iRT5ZZzprYipCXgn4c5Mpi30yJxb7
	EYkAOZ1y+4zIYALO7LCVP8knkYMP77c9+TAyjlQmqq1OCJei5ttRMq0s+ac+KNsuo
X-Gm-Gg: AYBFou32CpVae254ebfOe4YoYkIS2beGXs1XZQL2FblBjGlc8iEFex9Qq+FsdqNTidb
	v+tihcjjR2zYPcKme8pYHo/bXvg7vkdeR/xbdRV9jF3gL2nD4h7vgM9iO4XAAsKfaWLB3CkvdEk
	qjqZdIrE3n3+TMTWT3hgzlxcPbOJvilXK6vOLU5qh0jMQpCzc6oW9wTOubIJwq7ngYdhheJ4pld
	DdOBx6MGibJZ7KCOxv7OyZ5UgnyjTjBvOv+kBatqwhi1JpVMLN9aKLka355HmFUtYywP3Gzj4DS
	ff50sn3yl0HA1AAREAVNoXK6duD/MbahQux1GwJ8E4zD0KIpgfLvFLYhQHptv+WulTUK405w0JB
	L1z6soprSJ4+lq3PNc8D3FmQP5yP8EYDTcpz/cQaVmA==
X-Received: by 2002:a05:693c:41c1:10b0:33e:84c3:a05b with SMTP id 5a478bee46e88-33e8ddc79bcmr2252958eec.30.1790165130394;
        Wed, 23 Sep 2026 05:05:30 -0700 (PDT)
X-Received: by 2002:a05:693c:41c1:10b0:33e:84c3:a05b with SMTP id 5a478bee46e88-33e8ddc79bcmr2252775eec.30.1790165125074;
        Wed, 23 Sep 2026 05:05:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm7145892eec.28.2026.09.23.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:05:24 -0700 (PDT)
Date: Wed, 23 Sep 2026 20:05:18 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
Message-ID: <arPAftqIgHPYE9Qn@QCOM-aGQu4IUr3Y>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-4-ba2b39f1a843@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-4-ba2b39f1a843@oss.qualcomm.com>
X-Proofpoint-GUID: 572X1WvLvuNZQVbwm2u3Mjk6fqDZnAp9
X-Proofpoint-ORIG-GUID: 572X1WvLvuNZQVbwm2u3Mjk6fqDZnAp9
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3c08b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=w5VJh7DtWAenZCr4fmkA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXyMaTw2R7RnTO
 0tze5BKW8AQB+Rt1LTG7co4Hcjz7nrF4YNEcSOS8LA840/vi+RTpQD6PL4JuLdw2OV5Wt07ByBP
 uKjRQfYdx0Ui+bMHxNeihNP3RJGb+6A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXwg4QsFLc7sdu
 NOOA3ZWUZBiR10cEOJT/SYqUPN3X/6b79GWfngn0sZn1UmR0dqf+g4er+rJKOp7qMht7vMAlF4w
 hG/1wfv7nx2fRRMNnlKVkIkFdOyBAy8t/xvBJBrokbA+2A3EkgiBVfWgg0XLIEctSEV/WOsgy/k
 w7RfX2dRHG/d4dJp+N+RMfc1fdid6dYQaGphb/pw696L/xBX5u26umGivoFnk87/eRc43s0vxfr
 5fw9KpYImJ5QDb0jhWWyUwwArbLtzwma3aS75TobvU0vumGsTqJAbEq/Lba/MVomLd+vGHaG98q
 dgeDff2fFcy5A03OmPNnlz5956WqanjEWPiWl8yBYMA7xpGucFPY72ni2nl39xh4bfv83BgZtiQ
 qKekw2qcOkxHs7vwK6ze0c8fi1xy/7pI8tvD2+Px87jvhgFpwDg76ks8tCN1VjFyU832OL1reMJ
 5rcO2Vp1TXRhUE5PtfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Tue, Sep 22, 2026 at 05:01:10PM +0200, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.
> 
> Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
> its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
> ports are wired on this board, so describe two usb-c-connector
> children and cross-link their HS and SS endpoints to the dwc3 HS
> endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
> controllers therefore run in OTG mode with usb-role-switch.
> 
> USB_2 has no Type-C connector, so it is configured as a fixed host
> port. Its VBUS is supplied by a fixed regulator gated by
> pmau0102_h gpio3, kept always-on since nothing switches it at
> runtime.
> 
> Assisted-by: LLM
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 309 ++++++++++++++++++++++++
>  1 file changed, 309 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 09ee525764ef9a65aa17648097038687e61a5122..ee1525b37b381120d80a76d7b8e20ab2edeca6c3 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  #include "nord-embedded.dtsi"
> @@ -53,6 +54,124 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>  			clock-div = <2>;
>  		};
>  	};
> +
> +	vreg_per_3p3: regulator-per-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_per_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	usb2_vbus: regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb2_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pmau0102_h_gpios 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	usb2-connector {
> +		compatible = "usb-a-connector";
> +		label = "USB-2-Type-A";
> +		power-role = "source";
> +
> +		vbus-supply = <&usb2_vbus>;
> +
> +		port {
> +			usb2_con_hs: endpoint {
> +				remote-endpoint = <&usb_2_dwc3_hs>;
> +			};
> +		};
> +	};
> +
> +	vreg_wcn_3p3: regulator-wcn-3p3 {

Nah, it (and the following WCN regulators) doesn't belong to this patch.

Shawn

> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_wcn_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_wcn_core_vl_0p95";
> +		regulator-min-microvolt = <950000>;
> +		regulator-max-microvolt = <950000>;
> +		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_wcn_core_vm_1p35";
> +		regulator-min-microvolt = <1350000>;
> +		regulator-max-microvolt = <1350000>;
> +		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_wcn_core_vh_1p95";
> +		regulator-min-microvolt = <1950000>;
> +		regulator-max-microvolt = <1950000>;
> +		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&vreg_wcn_3p3>;
> +		vddio-supply = <&vreg_s3a_1p8>;
> +		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
> +		vdddig-supply = <&vreg_wcn_core_vl_0p95>;
> +		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
> +		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -366,6 +485,121 @@ vreg_l3l_1p8: ldo3 {
>  	};
>  };
>  
> +&i2c9 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	usb0_repeater: redriver@43 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x43>;
> +		#phy-cells = <0>;
> +		vdd1v8-supply = <&vreg_l3l_1p8>;
> +		vdd3v3-supply = <&vreg_per_3p3>;
> +		reset-gpios = <&pmau0102_i_gpios 9 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	usb2_repeater: redriver@47 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x47>;
> +		#phy-cells = <0>;
> +		vdd1v8-supply = <&vreg_l3l_1p8>;
> +		vdd3v3-supply = <&vreg_per_3p3>;
> +		reset-gpios = <&pmau0102_l_gpios 3 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	usb1_repeater: redriver@4f {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x4f>;
> +		#phy-cells = <0>;
> +		vdd1v8-supply = <&vreg_l3l_1p8>;
> +		vdd3v3-supply = <&vreg_per_3p3>;
> +		reset-gpios = <&pmau0102_i_gpios 10 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	typec@50 {
> +		compatible = "onnn,fusb15201";
> +		reg = <0x50>;
> +		interrupts-extended = <&pmau0102_i_gpios 8 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&usb_pd_int_default>;
> +		pinctrl-names = "default";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			label = "USB-C0";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_0_con_hs: endpoint {
> +						remote-endpoint = <&usb_0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_0_con_ss: endpoint {
> +						remote-endpoint = <&usb_0_qmpphy_usb_ss_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			label = "USB-C1";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_con_hs: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_1_con_ss: endpoint {
> +						remote-endpoint = <&usb_1_qmpphy_usb_ss_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pmau0102_i_gpios {
> +	usb_pd_int_default: usb-pd-int-state {
> +		pins = "gpio8";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		power-source = <0>;
> +	};
> +};
> +
>  &qupv3_0 {
>  	firmware-name = "qcom/nord/qupv3fw.elf";
>  
> @@ -440,3 +674,78 @@ &ufs_mem_phy {
>  
>  	status = "okay";
>  };
> +
> +&usb_0 {
> +	status = "okay";
> +};
> +
> +&usb_0_dwc3_hs {
> +	remote-endpoint = <&usb_0_con_hs>;
> +};
> +
> +&usb_0_hsphy {
> +	vdd-supply = <&vreg_l1h_0p9>;
> +	vdda12-supply = <&vreg_l2h_1p2>;
> +
> +	phys = <&usb0_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy {
> +	vdda-phy-supply = <&vreg_l2k_0p9>;
> +	vdda-pll-supply = <&vreg_l2h_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy_usb_ss_out {
> +	remote-endpoint = <&usb_0_con_ss>;
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&usb_1_con_hs>;
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l1h_0p9>;
> +	vdda12-supply = <&vreg_l2h_1p2>;
> +
> +	phys = <&usb1_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l2k_0p9>;
> +	vdda-pll-supply = <&vreg_l2h_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy_usb_ss_out {
> +	remote-endpoint = <&usb_1_con_ss>;
> +};
> +
> +&usb_2 {
> +	dr_mode = "host";
> +
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3_hs {
> +	remote-endpoint = <&usb2_con_hs>;
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l1h_0p9>;
> +	vdda12-supply = <&vreg_l2h_1p2>;
> +
> +	phys = <&usb2_repeater>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.47.3
> 
