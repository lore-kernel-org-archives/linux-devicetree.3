Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F7E2459FE
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116339; cv=none; b=D5OPMz6SBAxyZw9TqDG20+UiNA9uc2wUDoHUJ69CatW8boiBgHqChaJj2st/cNknRWsFGGY8OHn79U2htPcbtX1Hi0USbvQKQ4KKg+IqieWIVIyoy0r3ZEv5LmtiO4dssd3gGh3QVBVIp+KHf5iijWqVrLKQNgaktNyoy557iD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116339; c=relaxed/simple;
	bh=gzbW8KMMFoevV9vlfAg1QRwV0zyCbuKY8qtxOknWfbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKOhSEBb7y/EZI572A2PGxVWy1qppGSSsKE9Oz8LjTqmjHt4P17kU/4yPOZtenXZdBQ+FhmBGeDz5RrwvZhCps2N7kLzAU8lQTlTSbALMsfQRKBxo3dym0IOpXtFT3TAsBPXxrRyQCbYSSxoDN6OUIbtDOHtd8TguK08WGVIpO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EyVAvCok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOTDqLGS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EyVAvCok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOTDqLGS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BXNv4183477
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nv8Snsf8/UAmOmTkcOfAhaOs
	FAB/+15iHJCAk2BLzs8=; b=EyVAvCokXtCNoJcAUzl35tCUzCO5cNkWatqeH71Z
	mZvlJXeWXNbr4eRlTpiPH+gf4kMntkYH0gDAQESfeJnAklGwcpbaHQoWwbEBGZ48
	5zG0AevSl/VfXdJ4ckZcA06oWIpMtKKgDN6jkh7oznq/FyxPY093CNQKJFlTg1wO
	3FE0VDtcKmi8GZOXflMEmk1fnTxupottPS2ZttPNvsJFmSGx8+LDKN9Llif8C6py
	6LvYVCB7/3cvIwe2e2djCr3+cp3Ee4zxd4zzUT8ebcanOzKXY2eoBsMVduyEWFS1
	r55Fglmd6iFKJ76ecKx4pGK4aohsJMQlfX1p+sJaZ3KvKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h5kt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:18:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-922ff615c39so360583585a.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782116337; x=1782721137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nv8Snsf8/UAmOmTkcOfAhaOsFAB/+15iHJCAk2BLzs8=;
        b=DOTDqLGS9eH7a61dEmKx9Ut4jGlQffI6IZxZmw9F8l+vBWUEDom/4acmy74GOUZ2UK
         IxJO3pQ2gTQGPO61AtAb9hlwXqb0RpRnsA3fo7zRsVLfBTYWSvCR7lNy+HKAlt35hQzv
         Joq6xgDg4QI+zVWVRqnXgy8aLporcfLusDQgCQjLbXx4eo9nzjQ76yuOTZ1jtp/sK5xu
         lJYNW61cjVmoZNKa/TzWWvjyImf79YbWKdnLw62p68Ojc3V8y5+2jkMxCBuGIY6mHoXM
         CheYsZ8aHX8LaPMyZsLhrMeROGIIi1hWA1dW3M6Du2mC23SsoAGmWKyeKBrtRLD8C6/+
         s0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116337; x=1782721137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nv8Snsf8/UAmOmTkcOfAhaOsFAB/+15iHJCAk2BLzs8=;
        b=R3/eYyUP1Ma8gJCq3f5QidwNcFMvPT3+lSAZVK2lnEkr99FjGKGcKr40sr3jj/5F5A
         G4VcVp1urKtvMLGDFt98V7QM5ZoALOEKFwnP/l8ZLPbMpciO7IwbL/mu9iukcueSilWD
         F5jDEZm5nqpYazcS8dj+YlkSnozOCvE92dceEXhZq9hjyWhWmUrNQ/ePviFWE7yt9144
         icFqzSpNazqaCOKD95BL9orlePFm9Km0YSo1aiWuasD2vWkULYOH8ncmq7DoncNwtnvg
         2uQl0iIQsVDFvY2QPtNG6YwmjNynAr8eWWklN5vn1Hs8EOJmNKMPgILm6XsFMy9PwLLj
         ymHw==
X-Forwarded-Encrypted: i=1; AFNElJ+9/jXzNXi5/IDKXIZP+dZkzTw4N7Kwe65xf+ph+SnfY2A2ScommyI8EE5kD7q4BaNLngKxJxQ8+tU5@vger.kernel.org
X-Gm-Message-State: AOJu0YzHttHCT0S1VTZxHckMaoTXR/cLO04c8DSsHaxzxlYvr73AU3lB
	2bDVuBNk8WxcVtq17Wu6ZK48aTKro6REhPK/LiqhiiplHUNKoD9yF6DWwjNQKdS0uYcNAaDS00n
	phF47yQALdfPEhmQlkMyCCYpiqs3q7vAWB0qSItT0UZVJUEvMgkYHDN5w4bu0JHnm
X-Gm-Gg: AfdE7ckPOmEuc3roOfGBG7p0GtXTR7IYXgfP2Rm5liFzM/zD+nBq01MofbEaZ2QXAox
	N0WIk5KMt1N+o7rLYfOnpEE9/k7Mwz5dcStDGqlY0eRqAZ+YGv/v2tJdWNoveFGcPqeskZBa4fd
	8WBbchnAZ9S/mTQ06GQErLWj6wdSwgBWHCEIugLPPxVDwS+DfqkXf7ifMVnGLVq9DnYmmnbNW7T
	Ft78kFG9aJ/EEr5k5bFb157mDMsKyey8Tv9iOxqw6bp6C99zsFdCl09GFcsesnmcyIL03E3b4Hh
	SR1NgKJMhRgoAUFu7yGzeaP30DBFU0NLun0dMkNiA3zxclQ8yUN9gEiRlDB+W80UnvFuqjhKm/q
	OYeGauZrKCFaAJ/zjfIpj9Q==
X-Received: by 2002:a05:620a:468a:b0:911:e11e:dc0d with SMTP id af79cd13be357-9208c71d126mr1714218085a.24.1782116336355;
        Mon, 22 Jun 2026 01:18:56 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:911:e11e:dc0d with SMTP id af79cd13be357-9208c71d126mr1714212785a.24.1782116335426;
        Mon, 22 Jun 2026 01:18:55 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7ba08sm277432825e9.11.2026.06.22.01.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:18:54 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:18:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Message-ID: <erlfxo4gcvuaakuggrgroniiwofdrocgtje32idibknj7kb42g@pdh7fo4x6ief>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
 <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MSBTYWx0ZWRfX7YG6HA1S2PHa
 Pr4Azz5eVB3TT8I1Aa6qholOzBdz8W8EpQvo+WlIgOhwJZiHLrWYh3ikmzthT5eSHM2X79HWEG7
 Fm+kPdXRzzwgdOa0IubjHDOBZsWt6juI0TeTabV8aXstcXHvxSWuW3Dx5F0+dG1vrm7p2tj1s8i
 tqx2neLQVNHgEddjVkZHiobP0IYNSeElwXpnKN3dPUm4mySuLCuSauGbLSDbcD5xwug4/HTUpWe
 OT/vc1xH8gtReWKygKAZkl/h+UYbBwOlhU+aPMkYUTM3kuI9Lb25/SGSspA5uiL0EhQc43FdZ1L
 6b+ReoXbJW8y0faQ54QLeMg/MmDuOoKMVNVXl6RQO4Qg5t4YN8r5ZQF5AkHh7dGgaLbHcGm1eL4
 6M9I9D5pJj7zm3lQ9dt3MNb3CBMHTO3gC8UeWKVteslnUa/geIaDdXJlBK7/QlU4Y9Fa4fe03bJ
 owHXePl/8WCTlEjUKUw==
X-Proofpoint-ORIG-GUID: zU4qEebxHpGmzzTr-8hA_L95ISKsWhYO
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a38eff1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TaceBGDFNAfD8QJXew4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MSBTYWx0ZWRfX5o3dEhyEC3DG
 05+OTg9iYM/+amSlkuNC6Vn08BIVkQ5JUtaO2lVrR5D1yeFvLE3Fta9JArgpYdiuBqwZKVnvY3E
 ICT/GL2sucHybnVev81Ts3F02YlHpIw=
X-Proofpoint-GUID: zU4qEebxHpGmzzTr-8hA_L95ISKsWhYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220081

On 26-06-20 21:50:42, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>   - internal eDP panel (samsung,atna33xc20)
>   - 2x USB Type-C with DisplayPort alt-mode and USB
>   - chassis HDMI output
>   - chassis USB-A host port (usb_mp multiport controller)
>   - internal eUSB2 host with the Elan fingerprint reader
>   - NVMe SSD on PCIe5
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - audio playback and capture
> 
> The HDMI jack is driven by a power-only DisplayPort-to-HDMI LSPCON on
> the usb_2 combo-PHY DP lanes rather than being a third USB-C port; HPD
> is on gpio126. The LSPCON is on an I/O sub-board with no I2C/AUX control
> path, so it is modelled with the generic simple-bridge "parade,ps185hdm"
> compatible used by the in-tree x1e80100 HDMI-bridge boards (the exact
> bridge part is unconfirmed) and it needs CONFIG_DRM_SIMPLE_BRIDGE.
> 
> The &gpu/&gmu enable, the audio nodes and &remoteproc_soccp opt into
> glymur.dtsi SoC nodes that are still in-flight; those series are
> declared as prerequisites in the cover letter.
> 
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-4-8
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 977 +++++++++++++++++++++
>  2 files changed, 978 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f33c4e2f09c..b10629808b76 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  
>  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> new file mode 100644
> index 000000000000..795940a99946
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> @@ -0,0 +1,977 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +
> +#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
> +#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
> +#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
> +#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
> +#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +

[...]

> +
> +&usb_0 {
> +	status = "okay";
> +};
> +
> +&usb_0_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_0_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;

No redriver ?

> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l3f_e0_0p91>;
> +	refgen-supply = <&vreg_l2f_e0_0p94>;
> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in1>;
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;

No redriver ?

> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l1h_e0_0p94>;
> +	refgen-supply = <&vreg_l2f_e0_0p94>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in1>;
> +};
> +
> +/*
> + * usb_2 is not exposed as a connector; its combo-PHY's DP lanes drive the
> + * chassis HDMI bridge (see hdmi-bridge).
> + */
> +&usb_2 {
> +	maximum-speed = "high-speed";
> +
> +	phys = <&usb_2_hsphy>;
> +	phy-names = "usb2-phy";
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l3f_e0_0p91>;
> +	refgen-supply = <&vreg_l2f_e0_0p94>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			usb_2_qmpphy_out_dp: endpoint@0 {
> +				reg = <0>;
> +
> +				data-lanes = <3 2 1 0>;
> +				remote-endpoint = <&hdmi_bridge_in>;
> +			};
> +		};
> +	};
> +};
> +
> +/* Internal USB2 host for the Elan fingerprint reader (usb 04f3:0ca8). */
> +&usb_hs {
> +	status = "okay";
> +};
> +
> +&usb_hs_phy {
> +	vdd-supply = <&vreg_l2h_e0_0p88>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +

No redriver ?

> +	status = "okay";
> +};
> +
> +/*
> + * Multiport USB host: port 0 is the chassis USB-A port; port 1 is an
> + * internal USB HID device.
> + */
> +&usb_mp {
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy0 {
> +	vdd-supply = <&vreg_l2h_e0_0p88>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy1 {
> +	vdd-supply = <&vreg_l2h_e0_0p88>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l2h_e0_0p88>;
> +	refgen-supply = <&vreg_l4f_e1_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy1 {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l2h_e0_0p88>;
> +	refgen-supply = <&vreg_l4f_e1_1p2>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.50.1
> 
