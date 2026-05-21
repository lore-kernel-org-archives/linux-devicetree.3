Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024882DC791
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 20:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779395096; cv=none; b=HjNdyKiy9tUkQfbI+WSwZqQypsCfI1GkbX+4hGy5d2eruhsYav+e26gmrblen4vk/WDpPIEqFVvHkeRR67BdDcWMxH2DijfQBJpuhUqFrJzASeLVRmu7yQKcK9mZWQntsVO0qZLUl+1MdGceR1Y3PcY1zFxqjcUomYjAun5l6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779395096; c=relaxed/simple;
	bh=vPO2GmySY1g58rauJNIBOGRdQrRJRxCSfgbg0PjtyNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aoyf2H0XXmylmcJWcGxyWfNK+QVrr3GX4FHTtLv1U6H+Q5B04HTJ/WnfYLOWFySWg0QByHG0LOQY2B9ubkA8PTxlQya/As5hfUIaEMLpy7wp4pstUYc9E+Hdq0LmCcawXudXxD9FwUX8wsGj6AD23TfgTzRngin+/D6Qo94GfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wq1ZWwGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWr0vRVq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wq1ZWwGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWr0vRVq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGk3me296518
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 20:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uVZRuQgXpH0oQJeuIfFR9OF/
	de+BK41TUpqDLiYGHME=; b=Wq1ZWwGMecMD5NVPKIOYE9ctSizCoksfbiV/DtAR
	ug+x1NAZq3nL1jlGbubQc9CX5Fi1girxaGiwVP4M3OODnbCBN+GXCxq/ODI8uii2
	DjsUhscHCxigu+UUf9GZNyck1zPSlfiDudU9I4V9nPS5lLKxsa3rrXEaRSrFmaYb
	NVNxm9wQdn94izhth8ljAYnR80o7t8jM/LInx72TNX3SCd8UQCz6S+AD37ZCNhrO
	OTCPyAIg6RUg/45c9UrK7leqwwn2SjNQVewKjpM+3hhkbOcxrQg9Mw+jjtuf/Q/M
	qzjiiZifEXm4LZ6DxAsrHxLbgNWipX04YoWus9jT56tj6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1has6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 20:24:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5104b861649so246626041cf.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779395092; x=1779999892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uVZRuQgXpH0oQJeuIfFR9OF/de+BK41TUpqDLiYGHME=;
        b=DWr0vRVq2iHDhwhwhbw8bRBTOD+K+Lm+FpVf8XS1r45Zg2c7YUoIsOm3zlsCCt2f8a
         BgMrCHVsjrZSZQk+N22x+j5QVOFBUJdOx01ngQxpQitKyjCvuwpV1OWqYYymgm4Qx4Ve
         UBJlSZn7MTd27nk49P9oRDKZKHMnPOy8gx4CLR3ZfIP98MjsAvcfvk9vH0vG4/i1zOrO
         MQyvyNQPsjddltfufSVps2XJe7bBHWqb5Pv58UZWvHcUF2e7KJFRuVfQTOEQjySjgE94
         nUmANUPqnqOx9A0xczJsm3NmWJCRhx7/8hfCschkBgWU81OPWIdfI8yCnsIQzqhTxZqb
         noBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779395092; x=1779999892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVZRuQgXpH0oQJeuIfFR9OF/de+BK41TUpqDLiYGHME=;
        b=plR1qW25/MLOeQPEb2VpUNuFnmHWMZhL7k43UeQ/KKbydYzl0Zfrbu18j2uKQLY3kJ
         l49pk+TGUS6ssNeMGeJt+6kX/fPvNQiDUQ8kHA3lfuNQ0ukXEkuRF0IfgkM4SMKmHC/Y
         IFIJoGARm6VOeCAk1KpZE9rMb1FSnDf5E2EAJ23yasE/SDFpdsfPUE5xrrhR7yKh1Amh
         ofeJx/xFOSb2UZMf3Gk06c+4dWEm1Ivt+In5J67hQ4rEJdn3DhRfsKjKwsC8kNEagKV6
         xnMPnTLZYLAnZuCWiPiaaH5yBwt+gdde9kpjM13SssCCEJIiwel2wGohCVNQthPgD+3C
         0wyw==
X-Forwarded-Encrypted: i=1; AFNElJ9USjV/x+AkYWfH/mzrs89cZClyJAZ1nmZ6tL+/qQ6mp7828aeyzgWAGgobL2o3NAC5ajrQ7SbpAkC+@vger.kernel.org
X-Gm-Message-State: AOJu0YxdtzJtvVFzR6pPMcjaj0LaKW0TPLtChSVTjQ5ykJY6OZwXZFz4
	01nusZThFLqV9Xi25YgiERp8HwFtai1V5PRTOxBNT8E4LuCEzQK1GPbknVhCshRo8iWYbwSFMzG
	gqtoKqNHFw01nBrOJI42AJRHRsoPRVRvO/vr5bJEgZCGkpZCmxhGqnQUQ43H4v41f
X-Gm-Gg: Acq92OGBCRW3vyzKQyLCftAQmWoa5CuW66AQ11kx5D0MqorDK9QrbFvGCbbPri1WACP
	qi15LDaTCBOHRmEY9l2vo+4juboL1RsWhYq1Ov7xWG98xdHdHDxXvNsRbwUxWw8Zl99D5yoN8gs
	eTTt9QbvZGtjOZEySiwSbdfXzGJ/y+FIeyx7l9cnZ40OQQYRYwBElNktmj9M2WbTqNdjQqNLScs
	JQUsKHQCF7tz5j9L56NhdPArKgYyFErgRHIXKBB6mykaFc/Z6bXOQn8Xes5h+I8rApx1150RKmL
	a2YtTCMZs9rVQKtYE7PNQh47KBSdAscDoJqkURajSctTruqqv/2HioFw2RcBHXmMmWu3hU5dmrm
	5d8cpXWquk2PiIM4mOoQNe58t9Gl1UxEieGJqq9BU1RTN0HRQ1WXYY3vw9MBquVdqeejPEwr/6H
	5lzaw6ERbLYmb2DnEHyUiZnYiP55fEv37Oj3E=
X-Received: by 2002:a05:622a:5d3:b0:50e:d330:f62d with SMTP id d75a77b69052e-516d43fb5d4mr13701541cf.56.1779395092153;
        Thu, 21 May 2026 13:24:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5d3:b0:50e:d330:f62d with SMTP id d75a77b69052e-516d43fb5d4mr13701151cf.56.1779395091633;
        Thu, 21 May 2026 13:24:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395d9665f78sm209971fa.27.2026.05.21.13.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 13:24:49 -0700 (PDT)
Date: Thu, 21 May 2026 23:24:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/5] dt-bindings: display: Add Synaptics R63455 panel
 support
Message-ID: <2w6cpuzwxht2dv7a3xj57ukuzqa2b77ba2syl2ewdmq5bprczb@g3rm2k7e4l4h>
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
 <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
X-Proofpoint-ORIG-GUID: CES_qKXR3glYLtc5BdfXQiTb4tuo_Gxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIwNSBTYWx0ZWRfX6chdNYxEu5S9
 NWB8soaSsFXxDyihHnu0qZQJQMO8+5xW340041/vQG97h1PsEa0i8JEbnQ62atHpcUrucY5bNwb
 QUfZDpki2CRXOP0eYbE5NJ16DPcrCn8M5AIw/nSg9N8e3nWhlJFR9ZikTnD8bVKqCgPC3vb4Ilv
 mCIeZ9ugF96TjwAtpAJK9mFVUPmD2mhB6z1YEytdXLpQTMuJhi8Iaz1I0UdSftrEejjnwwzC1/+
 bZ2CnYHHT6ko0uhZVwa7h5HK89E3yB0fkBHPbAY/0+Z7SyFny81+A25YM7DNnq1aifzS2ZuV3kg
 eM/l6X4llcz3/PhuwyfsX/Ku44naZpODNh2X/IPwwhEtoKF5vvH0lNUB9IsWHwgF+R974tNl3V2
 HFxGRWljqCFep/0s8tPBzAw87bqM8ZyFjmup1yzKTJBj+jcOUkpCdgL6ere9DbuPiV+I3i70plO
 TThij2kmpt2muYe0EgQ==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f6a14 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=5IMEwuT189ni8Q75ZTYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CES_qKXR3glYLtc5BdfXQiTb4tuo_Gxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210205

On Thu, May 21, 2026 at 10:46:06PM +0800, Jun Nie wrote:
> Add support for the dual-panel system found in the virtual reality device.
> This system consists of two physical 2160x2160 panels, each connected via
> a MIPI DSI interface. The backlight is managed through DSI link.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../bindings/display/panel/synaptics,r63455.yaml   | 125 +++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
> new file mode 100644
> index 0000000000000..a94b355ed9557
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/synaptics,r63455.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics R63455 based dual 2160x2160 MIPI-DSI Panel
> +
> +maintainers:
> +  - Jun Nie <jun.nie@linaro.org>
> +
> +description:
> +  Synaptics R63455 is a Virtual Reality Display Driver and VR Bridge, used in
> +  pair in Headset devices. The Virtual Reality Display complex is composed of
> +  two strictly identical display panels, each driven by its own DSI interface
> +  but forms a single virtual display for the human eye perception and thus
> +  requires a strict synchronization of the two display panel content update.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - sharp,ls026b3sa06
> +        - boe,vs026c4m-n52-6000
> +      - const: synaptics,r63455
> +
> +  reset-gpios:
> +    maxItems: 2
> +    description: 2 reset pins for 2 physical panels
> +
> +  left-pos-supply:
> +    description: Positive 5.7V supply for left panel

So, is the R63455 driving both panels or are there two panels, each
having R63455 controller? What if somebody gets a single Sharp panel and
wants to use it in their device? How will it match these bindings?

> +
> +  right-pos-supply:
> +    description: Positive 5.7V supply for right panel
> +
> +  left-neg-supply:
> +    description: Negative 5.7V supply for left panel
> +
> +  right-neg-supply:
> +    description: Negative 5.7V supply for right panel
> +
> +  left-backlight-supply:
> +    description: Backlight 21V supply for left panel
> +
> +  right-backlight-supply:
> +    description: Backlight 21V supply for right panel
> +
> +  vdda-supply:
> +    description: core 1.8V supply for panels
> +
> +  ports: $ref: /schemas/graph.yaml#/properties/ports
> +
> +required:
> +  - compatible
> +  - reset-gpios
> +  - left-pos-supply
> +  - left-neg-supply
> +  - right-pos-supply
> +  - right-neg-supply
> +  - left-backlight-supply
> +  - right-backlight-supply
> +  - vdda-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    &mdss_dsi0 {

Please drop the MDSS specifics, there should be one (or two) DSI busses,
driving your panels. The rests are details which are not necessary for
the example.

> +        vdda-supply = <&vreg_l3i_1p2>;
> +        status = "okay";
> +
> +        qcom,dual-dsi-mode;
> +        qcom,master-dsi;
> +
> +        panel: panel@0 {
> +            compatible = "sharp,ls026b3sa06", "synaptics,r63455";
> +            reg = <0>;
> +
> +            reset-gpios = <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>,
> +                          <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> +
> +            left-pos-supply = <&vpos_left>;
> +            left-neg-supply = <&vneg_left>;
> +            right-pos-supply = <&vpos_right>;
> +            right-neg-supply = <&vneg_right>;
> +            left-backlight-supply = <&backlight_left>;
> +            right-backlight-supply = <&backlight_right>;
> +
> +            vdda-supply = <&vreg_l12b_1p8>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    panel0_in: endpoint {
> +                        remote-endpoint = <&mdss_dsi0_out>;

What is mdss_dsi0_out?

> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    panel1_in: endpoint {
> +                        remote-endpoint = <&mdss_dsi1_out>;
> +                    };
> +                };
> +            };
> +    };
> +
> +    &mdss_dsi0_out {
> +            remote-endpoint = <&panel0_in>;
> +            data-lanes = <0 1 2>;
> +    };
> +
> +    &mdss_dsi1_out {
> +            remote-endpoint = <&panel1_in>;
> +            data-lanes = <0 1 2>;
> +    };
> +...
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
