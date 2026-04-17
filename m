Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A95937DEB6
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 22:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776465654; cv=none; b=eCpnjZXlC95Mye+X8dVrSNBxPuxAVNCBqz+xiN7kaBGTUz075tAAbl7Sy6gk2vifOvP4LHzBkPdjs7tjYmEDNKTHniOVfjvW9LkauL43NYjCLz8GIZWqJulE8eSeMGZCd/Skr34xzllRPdlO3xAkrlZlZ9K8BNZoJL8JX9ms1+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776465654; c=relaxed/simple;
	bh=4ACzj62JukNrS5IqRGpOlSv09z3gsRQiFGjKjqmCOJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj8WchnfVljorIPTdxmS62PbP3p6aF0r4tZ16HQQFj24cgE9XQlJo11L2icrn7UiE7e5VplaeWX3TyNo2b5ivFv0nYavSkQ6ofLEDXLPYqUInDuhpMUqLWw3x8PWv8BBdDvXaI/1zTyYgqe0KBDN1jUnMT4pLy3ehqBtYgYitJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1229CIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKlJ3z6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1229CIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKlJ3z6M"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HIS0iN2434113
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 22:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sclcRE1WdVYKamatXGxR8oVabV/AT2ae6fVVjlCcTRw=; b=b1229CIWRoe/9jVd
	X4pOBn+rgsp9hGs7aywt+AgCjhF9P+G6oT94D5XwDIruAIb8CbaTUReCw6CPQc1p
	DBLlP3frbhbys4t62NdlzUyZSY/UAyguh/xtt/wcIB0JQt2M8iDgCISHceZ2G8N2
	jQsVepRfD1n6+KQMensU/FwmkxdfO8wWVAtGAJEDBsffwyaW8SSbuvmouzy74I2U
	Q2wXVd8kJuyhdl2/CMHxWJSKMYutiaA/E7SHSKuWx4RW93r8dYT1jdmknQ836TUC
	3BYos5UFiS+Hi7TV1AzXsgJ1FeGBYkSsRq0Hy4GHbNwUoFCX+OUXeGrRkOdfIl3p
	Gj/YKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkt5mrj5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 22:40:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso26431821cf.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776465650; x=1777070450; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sclcRE1WdVYKamatXGxR8oVabV/AT2ae6fVVjlCcTRw=;
        b=HKlJ3z6M1gJAsidUq+tsZqIU8PbVFWuqJItDkNs4d70D6VFxNFnlNZP1VB5ZmhwYCT
         j3mnrwBJ8lZQH57aA+1Gh1mkeR5f2rohUUeEproe9WHqGxEmDu9DG0qdwZvD3QVewItO
         oNx+8iAtBDwQCu012mG1QHL4nVheq2qxSx/KBaLUrtgzxbCiX0ZJF4TSmL0k0nECTrWi
         q/cwUK2n+ssxZKJwIDSnOnvrxLJv2+jkwRpLMHlejdpiHPVhZWRBkSy4dl6a40DmSTLa
         doPCW5Fh39L/laTMkhWrZY0HBH/ygJvCDXx7pTvohgxJyvJeQLkzCPx6wAsx62BhGE08
         m7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776465650; x=1777070450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sclcRE1WdVYKamatXGxR8oVabV/AT2ae6fVVjlCcTRw=;
        b=OJpKgT239BPL0GhtOL9X55q9C/Qjdkf8XokAjaTKu+0PjlNLWb5JvwTNd3TcFpbt0C
         cUJvVDT8jx7rYSbTlz2hTHvPt1M5VDqRO+tmqfxZNNJsQJy7c8KEg8rCwVgGt9KoKsUe
         cUrI5oKwi/rqpSL91wQOMkuhyZvskCwCd7v9g/H5lsgkFY31ov6cIKxywU5ko+dYn2bk
         vvFQYSLkfp7IBf/1+RFY4+WI/s/mybmfAYzF25Dw3yBLU3hY7Rf/07i5OVrkq3YlwSi7
         E5OlDAv6ltEbE9CVsil0gICd0ruEMQ9/pd7kQrJtV0SE3LEEl7vGIqlggJKyCr54kb3a
         DkeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UsoglYN3FBzCYvy+DmNFt4cv4/hKVVyx7i/0lf/IlwgV4ofn6VS0cmviw+XAlrNMH5gthlxEmCTox@vger.kernel.org
X-Gm-Message-State: AOJu0Yy84fOjhd80WdI/ZCspkqCJWxxFUK0z1TdRJeT/VBHUNRxmYn2d
	2UjHHgGkigAMremDm6LZF/bm4A/YfHz6HQvQUzFCa22r0aegrG4QGucnzxk/BjRz94Z0OgxrTUV
	Ksn94Rlzs5Eg2J8OYjvqJfAgsP51kmf/W7RAE+W5bb3ZD7zPCDZbU460pOzlZAiBj
X-Gm-Gg: AeBDieuRIOWI8c+Z95gCHmjgVud8SULAnng139b7QNrSjNtdx22ZEnkAe1MmZ8d2I95
	eksjxeHd+6FxgCfZ6/e2xccOkYm1e8mIDhDb3zu9e51lyChDlbGr0cin2hcGcISXdUqVTMHfDdV
	KirqwbeiNZvy6B31mZLDGhFCQ7AshjxNYerdO2omOiiHdnYtwOEIAyEFcsQ6qpwiaZDQZwvUYu1
	F03ouFJODR1pkVD1iL3X3FHMEWyD0DjAXEABqVQIknrb55/zgLU1b6thHwuUFxNBgExYVKhxh+7
	P5svqzS9e0Ojr6jMLOj5rb6bY9n0si5VxrB+UZhALvcHkfFNNEBwUlPlDm4QkolD8c4BLbrqtz6
	6c11osjMo9MoxKtYy69JtCzd66cKHOeFeAjYdvdzEBGo6V1UsfxFiRkTgjSjo0VLWOFXX4aYLFd
	QiOEHnYIUaFS60BXb7V19Htx0FjMUrqih8t4P3wuKMZIgqCQ==
X-Received: by 2002:ac8:5ccb:0:b0:50d:8080:2a7 with SMTP id d75a77b69052e-50e36b8577emr71385531cf.21.1776465650426;
        Fri, 17 Apr 2026 15:40:50 -0700 (PDT)
X-Received: by 2002:ac8:5ccb:0:b0:50d:8080:2a7 with SMTP id d75a77b69052e-50e36b8577emr71385141cf.21.1776465649919;
        Fri, 17 Apr 2026 15:40:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41abceab0sm459069e87.61.2026.04.17.15.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:40:48 -0700 (PDT)
Date: Sat, 18 Apr 2026 01:40:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable primary USB
 controller in host mode
Message-ID: <5l46jjjywvg2gtkrmazswyprj4vqlwbo54jpbnuh7scc6clesg@zxsnca6uzbev>
References: <20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AOj9hFqm c=1 sm=1 tr=0 ts=69e2b6f3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=hYANR6JDRRYnxUl_LGMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Q9tA0bNE8oEhdV1BSvZA1vwsIHQG6YqR
X-Proofpoint-ORIG-GUID: Q9tA0bNE8oEhdV1BSvZA1vwsIHQG6YqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIyOCBTYWx0ZWRfXyJUi7Zeplzgn
 Z2IKdRPKW+4lApxPE9Sk5xqGkWP7I1y89qrVK8AUmrl+Xe4RSmVd+QroQCjUFcqZw5hBoBq7iqI
 wDacGtLt/WXBYcrxadDLgElPKj4eOhpfus+G0lcvA2SAHE3WInPnLJjr9yfQl8wJ7ysqrql6/dG
 s/y1UdFP00XwWi67Mdjnjw9gQLl5RB+HBgrhIVxncDas40VDh4JO5H5zD2qBb80aLFuC8XSTcPx
 FhKH9bQQZA+kGZW0YN1dhzQ2BNVyXJmSR7Q/uZKxp6gQnlO5oTrWSpKyebBhtHd3SIaVV/OHLfG
 ka88XJNv5+t1UmvE155ac8oeB7LcQ3rjsy+FV2aHNDyiO3rgO8cAVJM8m7illvrD01YvdipSR+R
 xKFB8El2Pxf+prQ8Do0AnRbOjuo67dU7khHVFlNOkSKhNHRgiIqo2DFTzrdmfo2QJ58zjikbDk9
 WJXBc5Qt+NuC78EDa3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170228

On Fri, Apr 17, 2026 at 08:50:14PM +0530, Swati Agarwal wrote:
> Enable primary USB controller in host mode on monaco EVK Platform.
> 
> Primary USB controller is connected to a Genesys Logic USB HUB GL3590
> having 4 ports. The ports of hub that are present on lemans EVK standalone
> board are used as follows:-
> 1) port-1 is connected to HD3SS3220 Type-C port controller.
> 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
> for Bluetooth. This port is to be used only if user optionally replaces the
> WiFi card with the NFA765 chip which uses USB for Bluetooth.
> 
> Remaining 2 ports will become functional when the interface plus mezzanine
> board is stacked on top of corekit:
> 
> 3) port-2 is connected to another hub which is present on the mezz through
> which 4 type-A ports are connected.
> 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> connected.
> 
> Primary USB Controller
>           ↓
> GL3590 USB Hub (4 ports)
>     |
>     |-- Port 1 → HD3SS3220 Type‑C Port Controller → USB‑C Connector
>     |
>     |-- Port 2 → Mezzanine USB Hub (when mezz attached)
>     |
>     |-- Port 3 → M.2 B‑Key Slot (when mezz attached)
>     |
>     |-- Port 4 → M.2 E‑Key Slot
>                          (Default: BT via UART;
>                           USB only if NFA765 module is installed)
> 
> Mark the primary USB controller as host only capable and add the HD3SS3220
> Type-C port controller along with Type-c connector for controlling vbus
> supply.
> 
> In hardware, there are dip switches provided to operate between USB1 port 0
> and port 1 for primary Type-C USB controller. By default, switches will be
> off operating at USB0 port. After bootup to HLOS, it will be operated in
> USB1 port.

Why did you choose this configuration?

> Added support in the software for both HS and SS switches as
> usb1_hs_sel_switch and usb1_ss_sel_switch to avoid manually changing the
> dip switch position for USB1 port to function. Also, added usb1_hub_reset
> pin for USB1 hub to get detected after bootup as USB1 hub will be in
> inactive state before bootup.

Nit: imperative language, please.

> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/monaco-evk-common.dtsi      | 173 +++++++++++++++++-
>  1 file changed, 172 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
> index 12c847c03757..6316a8270f57 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
> @@ -23,6 +23,37 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	connector-1 {
> +		compatible = "usb-c-connector";
> +		label = "USB1-Type-C";
> +		data-role = "host";
> +		power-role = "source";
> +
> +		vbus-supply = <&usb1_vbus>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				usb1_con_hs_ep: endpoint {
> +					remote-endpoint = <&usb_hub_2_1>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb1_con_ss_ep: endpoint {
> +					remote-endpoint = <&hd3ss3220_1_in_ep>;
> +				};
> +
> +			};
> +		};
> +	};
> +
>  	connector-2 {
>  		compatible = "gpio-usb-b-connector", "usb-b-connector";
>  		label = "micro-USB";
> @@ -77,6 +108,15 @@ dp1_connector_in: endpoint {
>  		};
>  	};
>  
> +	usb1_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb1_vbus";
> +		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +	};
> +
>  	usb2_vbus: regulator-usb2-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "usb2_vbus";
> @@ -445,6 +485,39 @@ lt8713sx_dp1_out: endpoint {
>  			};
>  		};
>  	};
> +
> +	usb-typec@47 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x47>;
> +
> +		interrupts-extended = <&tlmm 45 IRQ_TYPE_EDGE_FALLING>;
> +
> +		id-gpios = <&tlmm 13 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&usb1_id>, <&usb1_intr>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hd3ss3220_1_in_ep: endpoint {
> +					remote-endpoint = <&usb1_con_ss_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				hd3ss3220_1_out_ep: endpoint {
> +					remote-endpoint = <&usb_hub_3_1>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &i2c1 {
> @@ -556,6 +629,13 @@ expander5: gpio@3d {
>  		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-0 = <&expander5_int>;
>  		pinctrl-names = "default";
> +
> +		gpio5-hog {
> +			gpio-hog;
> +			gpios = <5 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "usb1_ss_sel_switch";
> +		};
>  	};
>  
>  	expander6: gpio@3e {
> @@ -742,6 +822,28 @@ expander5_int: expander5-int-state {
>  		bias-pull-up;
>  	};
>  
> +	usb1_hub_reset: usb1-hub-reset-state {
> +		pins = "gpio7";
> +		function = "gpio";
> +		output-enable;
> +		output-high;
> +		bias-disable;
> +	};
> +
> +	usb1_id: usb1-id-state {
> +		pins = "gpio13";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
> +
> +	usb1_hs_sel_switch: usb1-hs-sel-switch-state {
> +		pins = "gpio14";
> +		function = "gpio";
> +		output-enable;
> +		output-high;
> +		bias-disable;
> +	};

Why do you use gpio-hog for SS switch, but then you use pinctrl for HS
switch?

> +
>  	expander1_int: expander1-int-state {
>  		pins = "gpio16";
>  		function = "gpio";
> @@ -784,6 +886,12 @@ expander3_int: expander3-int-state {
>  		bias-pull-up;
>  	};
>  
> +	usb1_intr: usb1-intr-state {
> +		pins = "gpio45";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
> +
>  	expander6_int:  expander6-int-state {
>  		pins = "gpio52";
>  		function = "gpio";
> @@ -863,9 +971,72 @@ &ufs_mem_phy {
>  };
>  
>  &usb_1 {
> -	dr_mode = "peripheral";
> +	dr_mode = "host";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb1_hub_reset &usb1_hs_sel_switch>;
>  
>  	status = "okay";
> +
> +	usb_hub_2_x: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <1>;
> +
> +		peer-hub = <&usb_hub_3_x>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb_hub_2_1: endpoint {
> +					remote-endpoint = <&usb1_con_hs_ep>;
> +				};
> +			};
> +
> +			/*
> +			 * Port-4 is connected to M.2 E key connector on corekit.
> +			 */
> +			port@4 {
> +				reg = <4>;
> +
> +				usb_hub_2_4: endpoint {
> +				};
> +			};
> +		};
> +	};
> +
> +	usb_hub_3_x: hub@2 {
> +		compatible = "usb5e3,625";
> +		reg = <2>;
> +
> +		peer-hub = <&usb_hub_2_x>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb_hub_3_1: endpoint {
> +					remote-endpoint = <&hd3ss3220_1_out_ep>;
> +				};
> +			};
> +
> +			port@4 {
> +				reg = <4>;
> +
> +				usb_hub_3_4: endpoint {
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &usb_1_hsphy {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
