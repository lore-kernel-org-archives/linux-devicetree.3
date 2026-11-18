Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012835;
	b=XcucK2EPJm+i765SzS5s6geyxYdzM1mx18nztB4EODn6WUCo3syZkSOp6TFOeYeFAYYg
	 LBw1J7PwfZYUOmlm1ikPcwT5cnyjqXKwGx1xMD/cGIlDjuIu9StEwE/5307ra9bG4nFsz
	 sm07qAugeJi+oGT76+lLFqdDRL2kfhiyFJ+guDJQsBZGLStGHVhPKJTTHOtkMwF/JF3kH
	 h5rNOmSj53V8kV9iplYjQnvljqSNXqQG3C3yVGdR6XsQKqqGa2xVrUJ6RC98YEYpIBdOE
	 N+IDm4vyueEgPYREv59hpjpAECT1UFUz3J95vuSWqO6wFrYKfR6CCtU2A2hYLQ62AUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k1kH7IZrsNusLnAkhePMIySDeHiduCMqqpxywd4JIPA=;
	b=vfPXexkzqb9fA3YJZDULmKTpR4vSkBVMuyrqWf0Rq3EjfJrzT20pdGKPa1kg5kn5wE0q
	 a+OtHKZLoIglYMUKfj8ij2RmxF2hf6kvtBPhofcp303LG+ODZ9LLfz8rztefS+azq+0YM
	 eFPniVzdr8ISCQsfuXyrOBlGazyJDiWtLEfDAIN0Oosc679yqcPbKFGyGdQ+oow6mkN4a
	 7kYFKyv3Ja81o3CbsmqUUP2nmeIIjQtttQ2sdUR+sBHGEENMtNRVMj8/fmjbAmWHu0/5q
	 4sl4OCbq5h5WC6fsbDF/SNy2RwLyYHr39nS1yyahoHhZae2utAKNRZqekiBnGqyW9Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=njrfN59q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRRNqUSO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F74606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83F74606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=njrfN59q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRRNqUSO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIEIEUJ1431841
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k1kH7IZrsNusLnAkhePMIySD
	eHiduCMqqpxywd4JIPA=; b=njrfN59qZrD4Pec84gliBknNAXThpWASvdZBIAa6
	X2IMB2U3ScF+gUu3/h7qnsNrRgBg4MPS3PmNLjxMvuKU90KMCOCMouTWLIUv6Bi4
	0wB4DGdO/I4sxNhVc8eIenzGQtgcd7hlX1MzcBveibHClcZ91FqjZGjrxZl32/mx
	LQ+nee6hDGV7kgBxrbeIjyhMrHKgkMT4FsjpeklaqpoQXgY2iQk2vcUmezBfOZEu
	GRs0tCtg5xxiusOk4rsoAH52cffK24y44GwWiY8oyDUxLdkglhLWy89Uck/njCP4
	oKJbjW679jdi/QHhZqh+eblKjBdwG2I4phmXcbMRES0GKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrr31r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:40:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94607500fb0so167863785a.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795012832; x=1795617632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1kH7IZrsNusLnAkhePMIySDeHiduCMqqpxywd4JIPA=;
        b=WRRNqUSOpHOw+6/uRjQvEGsW505h5GbrCTphRbPXUgt1wYQw4FI7XMAKPtu/LdsF8j
         BPlTy0Cwfph88LM/EYROLs6Lqnv1Gt4A8zt+WhD9wGNyPQEum8KP1LbneLalo64MvmKe
         97VQWl1rjptYpTyEvTy58AQk6nrdWyUBDS9wzVcGRayhhxozm6Vmi6DC+NS4CxgmNFpY
         u4yqN5ZYeWw87AvMGUD85ePOHSX80KcPWmeIQZsZJhHoUgTiwNNg7Thh+JMojOgw/cts
         45mz0/V0HqQCLYyxmaASYuVGKUYucj55k4TKmgvcj24tLZ9NCa+wVdYw083kr8n29yxY
         0fEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012832; x=1795617632;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1kH7IZrsNusLnAkhePMIySDeHiduCMqqpxywd4JIPA=;
        b=zOOQ0rf2Joofl1XDy04M6M+8+wQDd4LvPUJ4o5cTSmwfVBoXyDwXwsiwTut/6ypfU0
         47svg1wb/dBlm+d8z7KO40mgq+Qgal9Rr1XgFgiMt+UlGjfDwmnHgU4ayxDqdGe1AChG
         vVHZoWxpeG1jwuqsRgtX2MpO/hDPdU01UeaS6kji+RACu63PJxyQ3aCseyctQHgHBKoU
         MNxRh0Kfo9CT/u/4N1D+DsHopL5uHaydtLTr0IG6CtmdzxhxmLDZrTWIeZ9/GWQa7eas
         rij2faaLba0ksK2IUZWKb2LYZZeGcdHz0ftQWAIgss4qW2ImAYQ9UTZwQau0WQZXm6eR
         2i7g==
X-Forwarded-Encrypted: i=1; AL+hErFYOcSTpsHqXZVqNfYLhst7jYkgLvNmIQlUTmCjBSCbZXj9JsOcWMxZz/0LWoWQk4j+q2lvz1YhGnMg@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hjwm2QeMPCmBLs3BkBe2hxbmOQpnitJHF+6ANHecNl5e1mNpR
	Y+3XtSkg4fTTVnK02KYcsGJhEkYefTC/TQXXgecpWquoQwMP3CgBLmsIqFOXY2xCMuT2UyzlvqH
	W9KdBfWOYpwHbFxaXxo/P2gQUkCOIgTqMid5yf7EGvCXshF4cFuYTATIMZfcmNTLJk+96ni3R
X-Gm-Gg: AYBFou19VclJb9vK3f7HU1KFOAs8KDkYcY/xWUi+LhbVWKiuVJGiLGgWt1spxUcvz0L
	3DpL48dViu6SQThaKhgDda28H8bpWeupMmI7uPzRBFWwjlRV3ubYdhvuPL1NNsvaMCp2Ta6aXKe
	UnhWwvc+6SqwRZxx02s8DqHXmShv4T5mQV1shlqhegM5wHhjfLmFyhyOQNJIpiY6cZQBqDF45/J
	e9iBHNwcCYOnpDeJZ+CGawMBkNznATTTyMtz+kVln/BGxV1nhmYy0rbROzI7w4/AC2wCS1lCAf9
	7qwrqIzwh6h9hiKQ038m+iWQent7ojf+/C/iJhOF47Nrb2ak4OlbESud2EWCm6BUoHau9HNG5bj
	KQX7enWZIfnAlBiJAo3I9GOmGyInEUZEwcEWv7pUVJgqzPijD7qD3xrcnUHsBpSIoPO88iuwJRw
	UQzvcmX3TfyAED2iYoguFWd9JsJN2Q5wEDe8slrLDgAuIMPdov2MC3nMkGB8B65Q==
X-Received: by 2002:a05:620a:7008:b0:93e:d051:8f19 with SMTP id af79cd13be357-949995b5a85mr502858385a.40.1795012832295;
        Wed, 18 Nov 2026 06:40:32 -0800 (PST)
X-Received: by 2002:a05:620a:7008:b0:93e:d051:8f19 with SMTP id af79cd13be357-949995b5a85mr502851185a.40.1795012831572;
        Wed, 18 Nov 2026 06:40:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6e9c3118sm493511fa.4.2026.11.18.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:40:30 -0800 (PST)
Date: Wed, 18 Nov 2026 16:40:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: talos-lyra-evk: Wire up
 CYPD6129 USB Type-C ports
Message-ID: <upfalnhf67socxciy2h2sol6ljeni4fsijyeaw4z3qrjflen2y@cjhj4heqeofq>
References: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
 <20261116120623.1726089-3-akash.kumar@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116120623.1726089-3-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX/P6VKSF6m+0s
 hm2eE2zFjvZj6fzXBszE2+wAVCjoyT8vR+EkNQQto3MyOIelgjbxFcDpCYjO4UpBmPnlKY+MUNj
 iVl8wN6W+piQz5FlqmxWHC5tACU3wvEslXeEOeUHlkgXfSdfAOz2rGAgnFbbnp7g1teQS3P6Sb9
 JZ7Y8RI2+tlwiTfk4TO3kzBEs2Ir5wy7oHzbvEaCjdjZWo0nYB+qOsVn/lD3ZvIxuv/2iOl5Si5
 vtMV575ww9qGOk5y4sRkaILZrCyjfdKpMLfQJMyeLxrF6YgDXPypK1ROlJbtUaX/hi1TWIzltoZ
 oqgEijGA9/wlKuFcvCC1CbJiTI4YVjDNfCqiZsRNXFzmOOVBMalXf2T7DkNvSBjVxiy9tEc/8w8
 5u3di4q0hPsMuNdmFku4zXFUSYa1yFRakBDjCKl9Ae3QlGK8kyFH9TPL/jXEw0rFsT1v4c0mpMZ
 IKp2r2yssXfSNQczxOw==
X-Proofpoint-GUID: vWO7fOUq84cNK7kjhNHNygdfGfmB5FYB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX/94wYhJLvGaX
 zN5A/om5FPA7Y62EsfAMIRPHsoqCsdxePDhk06vhSdu3ewLTFsKVbtgcnxrktip2MY8awJMBXmo
 ebz1cdMAMoFWsiJiQGZyBza2NrsCgYw=
X-Proofpoint-ORIG-GUID: vWO7fOUq84cNK7kjhNHNygdfGfmB5FYB
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afdb8e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=f8UkOohZt28TqwRtv2gA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180056

On Mon, Nov 16, 2026 at 05:36:23PM +0530, Akash Kumar wrote:
> From: Akash Kumar <akakum@qti.qualcomm.com>
> 
> Add the CYPD6129 UCSI PD controller (typec@40) on i2c5 with its two
> USB-C connectors, and route their HS/SS endpoints to usb_1/usb_2's
> dwc3 controllers and the USB QMP PHY. The PD controller, its GPIO86
> interrupt line, and the PM8150 GPIO10 VBUS-enable control are on the
> SoC/SoM card, so they are added to talos-lyra-evk-som.dtsi.
> 
> connector@1 additionally routes its SBU lines through a GPIO-controlled
> SBU mux (onnn,fsusb43l10x) selected by expander0, since connector@1's
> physical Type-C port carries SuperSpeed and SBU while connector@0's
> port is USB-HS-only by hardware design. The SBU mux and its GPIO
> expanders live on the carrier board, so they are added to
> talos-lyra-evk.dts along with the TLMM GPIO64 VBUS boost enable fixed
> regulator that supplies the USB daughter-card connector's VBUS.

Thanks!

> 
> Switch usb_1/usb_2 to dr_mode = "otg" with usb-role-switch so role
> switching is driven by the PD controller, and add the supporting
> USB1_VBUS regulator and pinctrl entries needed by this routing.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
>  2 files changed, 152 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
> index 7d9a08471906..ed3a369dac02 100644
> --- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
> @@ -31,6 +31,16 @@ xo_board_clk: xo-board-clk {
>  			#clock-cells = <0>;
>  		};
>  	};
> +
> +	regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB1_VBUS";
> +		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb1_en>;
> +		pinctrl-names = "default";
> +		enable-active-high;
> +		regulator-always-on;
> +	};
>  };
>  
>  &apps_rsc {
> @@ -179,6 +189,87 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcs615/a612_zap.mbn";
>  };
>  
> +&i2c5 {
> +	typec@40 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x40>;
> +		interrupts-extended = <&tlmm 86 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +		wakeup-source;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		connector@0 {

Does it mean that the connector is present on the SoM? The CYPD might be
a part of the SoM, but I guess that connectors are a part of the carrier
board (and might differ on other carrier boards).

> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port_0_hs: endpoint {
> +						remote-endpoint = <&usb_2_dwc3_hs>;
> +					};
> +				};
> +			};
> +		};
> +
> +		connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port_1_hs: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ccg_typec_con1_ss: endpoint {
> +						remote-endpoint = <&usb_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ccg_typec_con1_sbu: endpoint {
> +						remote-endpoint = <&sbu_mux_in>;
> +					};

This line confirms, please move connector nodes to the carrier board
DTS.

> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pm8150_gpios {
> +	usb1_en: usb1-en-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		output-enable;
> +		power-source = <0>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -229,6 +320,15 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	usb0_intr_state: usb0-intr-state {
> +		pins = "gpio86";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
> @@ -250,6 +350,14 @@ &ufs_mem_phy {
>  	status = "okay";
>  };
>  
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&ucsi_ccg_port_1_hs>;
> +};

These endpoint wiring must go to the EVK DTSI.

> +
>  &usb_1_hsphy {
>  	vdd-supply = <&vreg_l5a>;
>  	vdda-pll-supply = <&vreg_l12a>;
> @@ -258,6 +366,15 @@ &usb_1_hsphy {
>  	status = "okay";
>  };
>  
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +/* HS only */
> +&usb_2_dwc3_hs {
> +	remote-endpoint = <&ucsi_ccg_port_0_hs>;
> +};
> +
>  &usb_2_hsphy {
>  	vdd-supply = <&vreg_l5a>;
>  	vdda-pll-supply = <&vreg_l12a>;
> @@ -279,3 +396,7 @@ &usb_qmpphy_2 {
>  
>  	status = "okay";
>  };
> +
> +&usb_qmpphy_out {
> +	remote-endpoint = <&ccg_typec_con1_ss>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> index d4468e609911..020ce7db4241 100644
> --- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> @@ -4,6 +4,7 @@
>   */
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include "talos-lyra-evk-som.dtsi"
>  
>  / {
> @@ -22,6 +23,30 @@ dp0_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	regulator-vbus-boost-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_vbus_boost_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&tlmm 64 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&vbus_boost_en>;
> +		pinctrl-names = "default";
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	sbu-mux {
> +		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
> +		select-gpios = <&expander0 12 GPIO_ACTIVE_LOW>;

Missing pinctrl.

> +		orientation-switch;
> +
> +		port {
> +			sbu_mux_in: endpoint {
> +				remote-endpoint = <&ccg_typec_con1_sbu>;
> +			};
> +		};
> +	};
>  };
>  
>  &i2c5 {
> @@ -100,16 +125,11 @@ dp_hot_plug_det: dp-hot-plug-det-state {
>  		function = "dp_hot";
>  		bias-disable;
>  	};
> -};
>  
> -&usb_1 {
> -	dr_mode = "peripheral";
> -
> -	status = "okay";
> -};
> -
> -&usb_2 {
> -	dr_mode = "host";
> -
> -	status = "okay";
> +	vbus_boost_en: vbus-boost-en-state {
> +		pins = "gpio64";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
>  };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
