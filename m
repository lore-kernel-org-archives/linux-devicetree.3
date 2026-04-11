Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2F63859DC
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775917784; cv=none; b=hYBIwgSDzMPbc9BrN8oXxxeC6KTJDBu2FqnLz6ZQHeqB704W2aL0ZhPzRD6MOB1EY0W01LksF4MwwstQD8n7EgIeIcFchOifUKPtzyS0Hi2k5JBMQ1bAezW5tQBYAsu7wulitc1TyJzLS0MRo+zOFGnTsJnF7+doSALDCXioMKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775917784; c=relaxed/simple;
	bh=Jp0swHFgx2dDuKj5uQCkFn0HPhUYSE6en+odL3eBmsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyO1wZ01PQcsHB0vHYmsTzy1jnsQJcVVu/U4rsu/REr+d5WP+V/QGMcqRBboAMb3cEUNFyvADyGAyJjz5SHL76V/GcuBvswfxBVduBgFMAsi/TlFAwO6iDPwlD/O4hsQ/8WDepr/vbiFJE/TqM3LBX64hsTy1KlCV+vFdCwpesI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoJcnSy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1IpVrcb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoJcnSy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1IpVrcb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4BUA3653263
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WMMUcaWnBIsA9vjwklqQ+6RW
	X/KVqflcSXLhj8DIcSQ=; b=KoJcnSy5gvMQ74GHToqcUdYzDzrcE8UV2q1/iyfr
	Jerk7NlANQUqwhT8weRlbS/Fi7qXhCDifueNrA4QlOM+d7tOZfA5c75CthFQFXHR
	qHvz89ayrPIEJk/00g7eIJAu2ND2cSFEvfDJ8u0BfxDKDJFdiyamo1o8dcfaOQib
	8Vv06kwlID3wXUbN3x8x3jUepI3kGRpQtk66mvzbCH5cqIEscGMV0iW1/9bemNC2
	2Ct4a1jr8H0r0UbaiZ0vl7b9LtTINqwhaMJ4dau3w1rqAdmNLbNn+IuO6YasQyPR
	V2CV90VaQPkKIg1ihQp6YYHrPQ2JRlwStCdjkIenKXWgCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2b8u4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:29:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d984c74a8so71156671cf.1
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775917778; x=1776522578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WMMUcaWnBIsA9vjwklqQ+6RWX/KVqflcSXLhj8DIcSQ=;
        b=d1IpVrcbWJ6Htft7sNvuna9jotzzQYMgB1iw5HHE8WN9mDCzyXE6TrQow3TTOGHHA9
         p2h+Fvh0eSEuNJKVQhIHHbTM2i/6nE+QFrUL8N0L4iWq+PNHVLNeg9KfF6VWkP0Rubfy
         d/4xs/iXCGwy5jIMNLVUY6Bpl3sal50UxiH6AvS+fjVqZSLLHU7HPyvgPeTkOmdzBRkM
         FkuqCZTbzECxbwpqLPmpsk62ZCoh0wwyOjCXIj03HwLTBRiteMgB53Fz/tKbj4F2Xv0H
         gShepL7tgHe13xx4uFvvnKFVPcjZpHBSojDYsHUmPOSgzBRnoSf5o/WyPsbycse9HVQF
         ROXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775917778; x=1776522578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMMUcaWnBIsA9vjwklqQ+6RWX/KVqflcSXLhj8DIcSQ=;
        b=ag7SFQV5cCFeUrzcAqwEao6qDkWSi2NZTuhbb4MVjiUUTl4Wcy5PfnIjyYR9XhUwDu
         zg6hqd3rGi4r+Cit2DiFClsVdhxnuirAsBYZNiL+rqNaNvP3QFVP/+m8eA1ZalhME6he
         qkFy+V7tVLPNgJAbEeeHxZLKx5Y2p60jFW1goXRu9f6mq9xhQJp+cgPi2qYQCO3MXMPI
         ZXnekUo3MWM48tpWSnsIWZHV/KCz2QY1yXViO36WeO0cRABil1C3orgr4Il4TXKSvF8D
         HGvVJfNHQG6mKA1OKNqgSe57QUJye2rYLftZYIi9cR3qAXvuJFB8MyVOuzQMMpKvCPjy
         BjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFMYF+1yCsBM3M0fiSrEQr0vFODt27J8AMIKta4xflFx0CxajbKQqKgoPIwEW7DP8S9IW5mG1NaXQK@vger.kernel.org
X-Gm-Message-State: AOJu0YxmliT7+YM4Ann9uhdX+avciWF7zs8Jzy7uHCEt28PoActgfGDb
	tSNEWLfogNKJrZmyu67QReGRIWGpjr+LHw6j5c60UgYf1qE8R4M7qyypZe6FcqeJ7mV/Y2Ahu9A
	EXLYlqzLSkkmAzI7SRb9hJvMiEmpRxw5wAuZ6GLlwd1NdXgSvrC1xHPFloFp3TMKS
X-Gm-Gg: AeBDietnrkh+5QpWjvSGOWBF1mSoXrOl+QE/Exs2c1EXbF95rEZHsg1upsWyzq0C/jh
	ycdR1uL56bYmbDGmM+Ddutwm/HAkKqxBM7NBEQp3aqhERFoNwzaxmLnFPc/FGQnkCYioHz4jP5G
	EfVLDbmpmYchPHfjYc6lNdI5Wh8HRWVC2HHonD9aQSvkwNDWj4MVtLPoYBnKSjMYZBM8TWh2Z+D
	nUA9gR//3kbfQ0ql0cJOxIkWMFscjl5tE+eraL5lRpmgcfIizMDvyp2902PseIVSwXhts7pN21B
	F8Q2vEDulwc8smTkGZxMxl1FKWW0+zyT+9SnNthuwrY49I7r/qV+9CIsrOu1/PtUrrHgBjQ10m1
	TVXhi1Bsu3FcuQEnlwsnH+DRc/QmzNZlvD+lBgsW8ot6GKn4C6y9m2HGeSJ3l/Ylwxc/lkRJEtk
	NROZtrfxetSbnJeYXdft7PVJCT06OpA+RCudc=
X-Received: by 2002:a05:622a:1c1a:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-50dd5a80217mr111475931cf.5.1775917778323;
        Sat, 11 Apr 2026 07:29:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1c1a:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-50dd5a80217mr111475481cf.5.1775917777868;
        Sat, 11 Apr 2026 07:29:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee1242sm1427404e87.38.2026.04.11.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:29:36 -0700 (PDT)
Date: Sat, 11 Apr 2026 17:29:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Message-ID: <iehnmrqwnfm2n2isx6txi7yczvtedjbyfnfrxsppp5644zkuxa@5al75ezk7ds2>
References: <20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz>
 <20260411-pixel3-camera-v2-1-41b889abb14c@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-pixel3-camera-v2-1-41b889abb14c@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEyMyBTYWx0ZWRfX8+w+yW9+g389
 YNlAo81hHWHjarS4ojpbT55AqiPf86FbSuSl5kpH7qUgioVdG85AkoFjx4VYUu4n1z64Wu2s41B
 zOU2lW6CfE+xoNf4SfQYMBY6FZF0ckLGdRvlT3EriiYpox631B3wk0dynlW8mpzOdau3/A4Fbgj
 NmwLDWaY2tgVmxWehlUyK9Xz7CtJdIbcINga2ApmCyemS7vcBNws+ETsEKyPJBiDd29/lvV9bRm
 ANxVXkGW2fVPpdKumu+xA5iI8fmfV3KXiLUTi62JL1NPRkeAORiVGnnok2i3Gf8Xv2JrQBaUsoX
 4fdaEnGT8ec3YIpnSpDsLzQ0qfYC0icywKAlG7VweAUdVo0FF2GE1IH8M6iGk/5EFWaXg6RYkC9
 E8HixSrkcGMQNngekFK28mbKgqDmogz91Mnuyxh9SiShljEo9khGuTDtrQMfB2K0AAKE+ZCimyc
 LGltkgLHZYByU16YWjw==
X-Proofpoint-GUID: v-x4RQEQtqkoV2lXrZOgsnlCHlA_D3vd
X-Proofpoint-ORIG-GUID: v-x4RQEQtqkoV2lXrZOgsnlCHlA_D3vd
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69da5ad3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=9tYL9O_8TpaW5Exp2vwA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110123

On Sat, Apr 11, 2026 at 12:12:02PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Both sensors are connected via CSIPHY1 and controlled over CCI I2C1,
> using MCLK2 as the clock source. Describe the camera nodes and
> associated resources in the device tree.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 187 ++++++++++++++++++++-
>  1 file changed, 186 insertions(+), 1 deletion(-)
> 
> @@ -319,6 +362,12 @@ vreg_l28a_3p0: ldo28 {
>  			 */
>  			regulator-always-on;
>  		};
> +
> +		cam_vio_1p8:

No need for extra labels.

> +		vreg_lvs1_1p8: lvs1 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
>  	};
>  
>  	regulators-1 {
> @@ -351,6 +400,45 @@ vreg_s3c_0p6: smps3 {
>  	};
>  };
>  
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l26a_1p2>;
> +
> +	vdda-csi0-supply = <&vdda_mipi_csi0_0p9>;
> +	vdda-csi1-supply = <&vdda_mipi_csi1_0p9>;
> +	vdda-csi2-supply = <&vdda_mipi_csi2_0p9>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +			camss_endpoint1: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&cam_aux_front_endpoint>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg = <2>;
> +			camss_endpoint2: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&cam_front_endpoint>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci0_sleep {
> +	/* bus has external pull-up, don't pull down */
> +	bias-disable;
> +};
> +
>  &cci {
>  	status = "okay";
>  };
> @@ -358,7 +446,72 @@ &cci {
>  &cci_i2c1 {
>  	/* actuator @0c */
>  
> -	/* front camera, imx355 @1a */
> +	front_cam: camera@10 {
> +		compatible = "sony,imx355";
> +		reg = <0x10>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		/*
> +		 * The sensor can accept a 24 MHz clock, but 19.2 MHz has
> +		 * better driver compatibility.
> +		 */
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&camera_front_avdd>;
> +		dvdd-supply = <&vreg_s3a_1p35>;
> +		dovdd-supply = <&cam_vio_1p8>;
> +
> +		/* MCLK2 pin (gpio15) is claimed by the aux sensor */

Can we require it from the camss node then?

> +		pinctrl-0 = <&cam_front_reset_default_pin>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;
> +
> +		port {
> +			cam_front_endpoint: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <360000000>;
> +				remote-endpoint = <&camss_endpoint2>;
> +			};
> +		};
> +	};
> +
> +	front_aux_cam: camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		/*
> +		 * The sensor can accept a 24 MHz clock, but 19.2 MHz has
> +		 * better driver compatibility.
> +		 */
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&camera_front_aux_avdd>;
> +		dvdd-supply = <&vreg_s3a_1p35>;
> +		dovdd-supply = <&cam_vio_1p8>;
> +
> +		pinctrl-0 = <&cam_mclk2_default &cam_front_aux_reset_default_pin>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;
> +
> +		port {
> +			cam_aux_front_endpoint: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <360000000>;
> +				remote-endpoint = <&camss_endpoint1>;
> +			};
> +		};
> +	};
>  
>  	/* eeprom @50, at24 driver says 8K */
>  };
-- 
With best wishes
Dmitry
