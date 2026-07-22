Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A107352016
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727864; cv=none; b=BBFgnd9cZWnnqjUSm1hXSUefPhrISQ4GJsvIhSgf3rhUaWXXOwjYbz9gxe+DvUQXqdhq1vhrIhon34iTXMH+Ke2Of65Mnvp0IzwRiiOkJiRIfw2EaxnQl+aVpkJ2gQQDcYSUDttdTGgxcciRCy88E8GNvun5VFlrkDnmlUpOlLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727864; c=relaxed/simple;
	bh=JFtJ6zkpzpjWERBTY3MFeh2brvW3XChrGsQfXeCZzW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrLhxW1dUgQACZTUmKFwxnBZ6nehDN2enq0XBsiJ+bxubHYRMYZPT2g3KYiJq4DMRCK52okyCU9KZWnr0+rfKyf4a0hukWagsvhmgL7TN2oECiFf7tWriXSLXFPvrVyrTDNUgQ8SqMXys4+QGMVx3BxrAoNL/zRDKw8QR5zmzRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pismn3qJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abRZ1Oys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pismn3qJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abRZ1Oys"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWjWN860767
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GIYdoPwmlp7SGGM3Zke7zv5s
	UTlikc1HJ43uNZXOXg0=; b=Pismn3qJPSfTO0BiitkZhgBvnpO3ySI2znI+O3ZV
	Ov3IyKoKlZumsAOUsdIKT4xFm0Eg15T5GjXaI6xf+22/7z4HgV+ojKmiHTvWqsrP
	zrwxvHY/3stUpZ/uVvgsMPufeuYKJTesqIfcpLZ7B/3eJiS4Xoqn/YKK93R7MeHc
	33coLoq+RliTOVxCrdMi3Y4MKZAHBvAH1xAh+FbniqUBWqpLD7XJl0RfNeKi9QdD
	E/RkPm3qgoWpVZtwgKzmCPiD3M+vIo/ziiG2fe+gv7x6A+BupKHFdEppwEsBgqQ1
	uzB3nlbwfO9VoixGtzXCDoRnB4r3TLMyvtKtqy7KO6C1rg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn2cvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:44:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso159746431cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727858; x=1785332658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GIYdoPwmlp7SGGM3Zke7zv5sUTlikc1HJ43uNZXOXg0=;
        b=abRZ1OysdcDVGVaXTfcn0wdnac6bh1u1gDhoIyd5t+ZAB/4tJXoeURExh5O0fRSupO
         SpdICiV7TIFqFCuKHWshSoMOS7bDiSZYdt60k0qTe3eQJB1RTAsae24LHBJwXjOK1Spt
         sFqGTxh92GjmmHQw16bB4BL7hTvBAaGmBinHIFUU74Www2uRaQOCVcf/ZgwFesV+WRBq
         oFvNXyyUlXn1mFXAAjxD/usZGG4fsmkPnlwOybJn5FVbRgLhMa3nIOu9pgLmLzb3xOiy
         QMW9uNEbOSIibsO/bGH43sf84XZKTX1GPL3gcjhKeQhngiSjphxIMDKpoheHgtJ5lBwE
         X2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727858; x=1785332658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIYdoPwmlp7SGGM3Zke7zv5sUTlikc1HJ43uNZXOXg0=;
        b=D6MYjHdmenpC5i4tj3ZkamOfhZ1Y7Y9aLeOhPhTWq2LU9FZ3zZHFPz9tGjlmEOQuea
         qZ6bnNjiAYYgaLxJ2srNb2Qg5OIudgIwX+nLoeWsqt707y8K1d8tne3VngtbpvzZH0Ps
         FoZ8h9wL60LXPeNhfJdeVTLe+KEVH5l4aLqzkq1uCoxQYhQ1uRIip455twx/EtMlko2X
         Rm91/3uVaLGifLRDgYMUuZYheyvwvJ89pseqnqrZmsSllHz15YqGwP1zEPBmz5ihQQfe
         9N6jP9xIdLd4Uj4+wDxIxIMvdCzdimFyLCU2qgcT+yMTnjiFDE6ltTinV5YVHV6pbVuQ
         j9Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1GtRChIftjl3vQ5H48mZeel/jO0JR8yguTeIK34gl+Beb0bIynYGDUH8SKBIgI8RwK0uS9AmYVALT@vger.kernel.org
X-Gm-Message-State: AOJu0YzQgUaRCNtTB7v9ep2T0XV43nptoHB2fT4M0YEIb8Ky1Zf4KW4m
	C4Y/3BM7Tg6pvjnJMKD/mH3ddWdkptgBTPSYkvw2ahxV6hq25UxY0cR7mFx1VR2M66EpMoXm8dX
	ZKslbnHhtH5GsfWqFdfIDZ9aLPt2gmA4a+ovniANVOeFEb5H5MaXK2upC/aa9zV7Z
X-Gm-Gg: AR+sD11eJ9yi6rv9on9wCw07uGItK9YHEv+cEjqIt48CXlNAOEpkNRGoFk3QNq54hJk
	J/9xsxjyrXsJxoBevSQ4peNeIGq7DqZUYBFw/SCFbjqJPuqQ56+R1aygMKcn7ZGvmIVb2a0xWzx
	dkRNPKHKZsxxx12hsPI7+sPO+CjY6dSj/rpcGnlge8tpxE1XgmDJ1Ss8TElr3ZiUO4b/q+u4O7D
	NL0jicIAxyvmuj+bA0U3DcH7oswAG+18DTvNyi+UvFH+hhgE/uSMU7dR1pABQiqVu+gg//Iy8uc
	Zg7vc67uMdMuxxzu2Gyzudf459GoLZU1AXsLrPhEZONLyWM8iSW0a0KbCGUXec/EVodSgs4o4ND
	gL5albtZGXVFU80FimYhaL8IIXF6TZ20hNhnFm3GfeCrzvNpS3MQc2qUOmwXVyIc3tJFrfSntVM
	rWZ6xK7CTmS2vfeA==
X-Received: by 2002:ac8:7d0c:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-5213c201a70mr211249491cf.34.1784727858391;
        Wed, 22 Jul 2026 06:44:18 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-5213c201a70mr211249091cf.34.1784727857758;
        Wed, 22 Jul 2026 06:44:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f4a728sm482968e87.75.2026.07.22.06.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:44:16 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:44:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Message-ID: <b2pbwtqd5mf5d3sbbadx3e5o3ohys4mmjv5dxc3grycuuqjvgg@rh5veftljlrt>
References: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
 <20260719-lvds-support-v1-1-1f1aca3213ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-lvds-support-v1-1-1f1aca3213ba@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60c933 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=hb4hLJ562k5UIXpG1yUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: wA5Ag3tBgM49PbpP2gIqVlFb3UQghigr
X-Proofpoint-ORIG-GUID: wA5Ag3tBgM49PbpP2gIqVlFb3UQghigr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX16V8qLrm6noM
 f3SftCeGkr+R4gUWARFbCUZD6UmJdTQ4jZwWxE1Nd6LcZiMpgc2hpTrftntaQcDORazwJdl5gLk
 u0blqjLjzZiCQpuxbxH7ghtRVB2J/5s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX129EGCf/sO4G
 vq7WlKuCtXa1QYAZkzeXmNg5tTgVwaSzwMYTbummzmID18RWl78thDCU8PzJ/EaFQURwFinwKBl
 Vsx41oyJvgrCi3gZWPuzltOYIl7KEa1G4R9bdyWeCr4/DG1qQ8sUFnCMcxqs1NEE9xs4s6f//W+
 UmenaPAQc/ET4Dvh26IGrBLoxwtRh+U0OmeOsX64s6zMN5+SwxV2nno50oVq+ifTi9MjJOjfuAz
 AwbdJfzLBQ4XEHz8BzXiFY+XSA/olHLiNLWDGpseF5w5BO6/bgCYTH+0P0OSEe1hol4Clbu2mqx
 IMLV9GVXrcVgYwD/gyCKS7lhIypjxdpVKEcWY5W6s7h9gTuuufzW630c7hc3Iqie+vOME2Lx1nz
 uXt6e+QJxt+m18205G91ozDIEKCh3UCP1S1L0lWv399X0oYr/sBdMxU+CdfxC4yDBukQtE8Sb2r
 HAt+DKDdfTb6GLUTjeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

On Sun, Jul 19, 2026 at 11:35:06PM +0530, Vishnu Saini wrote:
> The Lemans EVK IFP mezzanine supports LVDS display output using the
> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> VESA-24 mapping.
> 
> Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
> a panel-lvds node describing the 476x268mm 1080p panel timing, and
> an LCD display bias regulator supplied through the GPIO expander.
> DSI power is provided by vreg_s4a.
> 
> The overlay is built as a composite DTB combining the base
> lemans-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   4 +
>  .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 127 +++++++++++++++++++++
>  2 files changed, 131 insertions(+)
> 
> +	model = "Qualcomm Technologies, Inc. Lemans-evk Mezzanine Lvds";

EVK, LVDS.

> +
> +	panel_lvds: panel-lvds {
> +		compatible = "boe,dv215fhm-r01", "panel-lvds";

Thinking about it, does your panel have EDID? Is it readable from the
device via the I2C bus?

My major concern is that if the user changes the LVDS panel, they'd need
a new DTBO.

Would it make sense to implement EDID-based handling (like it's done in
panel-edp)?

> +		data-mapping = "vesa-24";
> +		width-mm = <476>;
> +		height-mm = <268>;
> +		power-supply = <&lcd_disp_bias>;
> +		status = "okay";
> +
> +		panel-timing {
> +			clock-frequency = <148500000>;
> +			hactive = <1920>;
> +			vactive = <1080>;
> +			hfront-porch = <88>;
> +			hback-porch = <148>;
> +			hsync-len = <44>;
> +			vfront-porch = <4>;
> +			vback-porch = <36>;
> +			vsync-len = <5>;
> +			de-active = <1>;
> +		};

[..]

> +
> +&i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&qup_i2c1_default>;
> +	status = "okay";

Empty lines before the status property (here and later).

> +

-- 
With best wishes
Dmitry
