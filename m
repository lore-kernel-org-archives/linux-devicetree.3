Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAA144BCB0
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995986; cv=none; b=llqcbKjjZ7Y79N6TOcao315MmLxgvr6qB77nclVA+v9qLh16KjSvHJQsbs4XUnXK1KvM6YHaEVxnS6YskJ5KBpoSTNB7FCij08dE+UpXqjEIFzSXSrIWBP/rsccByFJFkC8aPu3uwRzYzHL68Qh8DzwNXOZscGCvg4RscBUQDBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995986; c=relaxed/simple;
	bh=15ANz7Pnj8+6Kls6yqQlZRBM409sR0JXPv5GM0zvrTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMI3ye8ZThGBzglYixwYE+T4wxbLfzXAp9Bu/Yk4YU1Nlw6MzLMoEheaZo5P+IByPZHePxv7FbHLtRq95M2dszS20gOutKkS8i0rxOdN4jS9SfguhFfpcSWi7wqzx7sFszJ9eLyJVWRPcRhrrBFry7GBLyb1W9E+p3Hn3SVzjzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAHBtZAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WiJAEDCb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lAHBtZAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WiJAEDCb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KJs94115125
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RTdcvknL6Wp+U+QrI8TFp2qf
	owIOTbg905V9C8MN6E4=; b=lAHBtZAVloEXdegk2Mt6YCZ6lMrH+L4GiE+tOnQY
	2FTsAGFJIXm93KgNfSm7a0kU3spJm2m4Min2pM11GvDwpNEZ8AD0rqZWONJHP19p
	eGM/MiOL1z4pcvsEVXWtr2hY4ZrnVd508Zc4H/iJW8r6WFOrEQ2Cveq1Dzb75rDS
	9VLLy63IT4l2BTrbPiRmpY4S4vM1o5LnDBu5aCjbszgzxtSj76P+ewXaZ2/wrhmo
	/0wIW8nZCx+6oLuiiwZyEGo2fAz68R2sWj8v3V4Tn3FhXDmsJcz8l3jTBME6t9tg
	v3Zt5C58d6SbCA+CjJvjPicwLJ4KgNSXFYHO7jkrub5edw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940ru7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:39:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e61b38eddso333718585a.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995983; x=1783600783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RTdcvknL6Wp+U+QrI8TFp2qfowIOTbg905V9C8MN6E4=;
        b=WiJAEDCbeaRdJZ0Ppj7xQ2DQ27gqa1WoD78R4mtHNYQaZDrRg58DnofbrxS7eSBBtO
         XfODMToFeIHtWsTtOFlqnKbUZt18wexwyE+5+i9Ra3mE5RGwwVnxGcwtr/Evj2yitA3I
         INMTcY6+ofYHu1W+uWfJy6H+yhZVIk+CjjqjnPVfqF8FOPvy6u7gxbJHnR7AqNopbspE
         G2S6I8AVp4cKKPCnkaWj7phnLRQpKEeVbEnTv0BP4scyK9BGhSWwO3jKKC9xP4fKD8Og
         uDdkueSya2lZIlEBSzEc+K5BRkDcbDk0nOYC3MCy3WkAOspeTkNsWAfucPcSi1SJmGYL
         QqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995983; x=1783600783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTdcvknL6Wp+U+QrI8TFp2qfowIOTbg905V9C8MN6E4=;
        b=nUOrk/S6aN4d2TSyLIJWQLIF4xSZI8C7KE+3Ah0v0Dh9d3b3yfI+K0OkQcKeIlck/c
         fa4Uz+/Ci5GCpdgz/2/B7tcUyUizN4ipiLslTkGDMD2vUPbUfCeyCulf2PlNmXRvMKjU
         7XE6Qq/t0wpRwtTcDj1uc9Zh8GnX9a706q9PMIY70oTzUg3ydoCIGsyz1K+K6PU6HJC6
         i9O/+iTZ3N6lTnwG9WMgejfmUIj04U9Bf00A1KzeK2ecw94io2/5rqjPgcEU8gO//mjC
         fkgGYXqF0MfrtVJFfRV+6wfazjNly8bhh03QZabw8EXk/ZQG1OAyILaxElcIrS31ExG7
         L+0w==
X-Forwarded-Encrypted: i=1; AFNElJ+dOBbWWAebNzg2WQiMAi03Qaa/EGCDqZCoHwR8QswSQFT4RusrSD0Tz/vQ0xErAy0TdwB1aEfVcIhV@vger.kernel.org
X-Gm-Message-State: AOJu0YzpEmt0lA/uX6k+oj4kQoK7cwGVphq9hIz3prdKQWX/dzf3pWA3
	rOf+scnWLACFGrqr5iVP7w3iK5lHWEcqatEoUK3PD1sCN+KtimB0N9KuvuPzOWxO+yaSOpVLhuy
	8NUo/cAribipngSRlQ/pUmTXmmj3hh1SO4542j8qkqEoWHnbh3KL+7JS/O89IEUcb
X-Gm-Gg: AfdE7cmqCA57MLZpRbb2rW+SUsxFxNqFWL/fT5EQeOQXbySgO6bP9pKH1jUeikx3Jxp
	BuePahG77WSGh8kEgLFO0zKXew4myeS6g+4ReEXBYWp4dj9K/RfVlYj0N1lovi3eqgYtOCP/OXY
	Z29SRBGtM6f7lV/WnAYtkyPdxtoDvqyLqA1X3mP9YY13gpb+VCtxwHpCHphKq1AQbX7d6nPvn1I
	hKJKscP7YFXmTG8uuZnAvjBXjPu7+7dVXJojFxtf5sf06UnO8Il1DYdTu091hd+NjxEZx/lckjx
	iVWQ5CIlzkgTZAk2rYinoR+OF8yj8TaXzuzLNECFMt6dWOXikObEt7OT0j7Ir5b/gRczi9bIhbB
	541KsG4n8il9Shse4mHxNn2IwAWrBl11YSv9KfIEDRmj7zycTV1AB1NlTrQ692+cKo3nHls3wV0
	njkse5JP4L5ZEJ6RplU5axmE9/
X-Received: by 2002:a05:620a:318d:b0:92e:6b16:6a0a with SMTP id af79cd13be357-92e784d1671mr791013185a.40.1782995983523;
        Thu, 02 Jul 2026 05:39:43 -0700 (PDT)
X-Received: by 2002:a05:620a:318d:b0:92e:6b16:6a0a with SMTP id af79cd13be357-92e784d1671mr791007785a.40.1782995983032;
        Thu, 02 Jul 2026 05:39:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37ec294bsm5709091fa.9.2026.07.02.05.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:39:41 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:39:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Message-ID: <ilxihjwdxjbw2nikrks4okxrb5ylgoidsx4ndlyhmkexzapqlx@vtkvfpbhtcjl>
References: <20260702-topic-sm8650-ayaneo-pocket-s2-display-dt-v3-1-e6de68d33f9b@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-topic-sm8650-ayaneo-pocket-s2-display-dt-v3-1-e6de68d33f9b@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXzVV1NFKpO+O3
 fAjPqnivaNRXvrI3GISQyqpfioGon0tpOihAUomdOg5zZw9De+aTHE8vlIHznFUpQHYq61rSNI6
 FsAe9f3ZHPHZgCEtWZ2MYWTPdrQR8BxcYk2WF03SRmOEG0l7IQ+4eH5Mwh30pA8HMl4ba0GStNN
 oKlXn1ka2PmcML9RMCMkNtPAqB/8y8P5daIgyJoCG4vV/047CUxIt2nokVj3FlXsSjv2cpauWWN
 pHmXEPypF+lc0LpbJ11YrM54fkYhBAlLKWDXxNnEGeiLnAJ3FK19EAc/F8eIOggHditGJ7dI4+v
 lJ9FkQmehaqm+9KjNYi8WM4twmqbzJL/WUGHqLrcIRYHAc5/PuZG/nNs6bpKvR/FQW6zVTtmvgF
 HMCE+rHJljsuJvEp672lw+N24b7qoCCBDfpDRH7NgJIeXewG/EOGUTVxS28ClTHdr93+P6KKmW9
 DPQGU3ID3d7XPOcZdeQ==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a465c10 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=-iyMYkqKj0NW7UPWl3cA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: _hXilwFT-dvjgl6KqoB8ihyDL8Tw31ru
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX/epyKU7UaCGz
 6KFm9gpWd1R4Jm+e/rUMnGXwq0bGfB/LwJuJjKMXFFlM0NMywDcjYsTZxydtO7osz2SP/eMliRy
 0BYBBhAnGX5y3QleW6oVcw8b1NjBPao=
X-Proofpoint-GUID: _hXilwFT-dvjgl6KqoB8ihyDL8Tw31ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133

On Thu, Jul 02, 2026 at 11:33:16AM +0200, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Depends on follwing bindings, all reviewed:
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v7-1-16edddda9951@linaro.org/
> - https://lore.kernel.org/all/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org/
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org/
> ---
> Changes in v3:
> - renamed backlight label and node as "backlight"
> - reordered pinctrl properties
> - added regulator-boot-on to display regulators
> - Link to v2: https://patch.msgid.link/20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org
> 
> Changes in v2:
> - Update for bindings changes
> - Remove empty line
> - Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
> ---
>  .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 244 +++++++++++++++++++++
>  1 file changed, 244 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 0dc994f4e48d..56818fc9edbf 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> @@ -220,6 +220,23 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
>  		pinctrl-names = "default";
>  	};
>  
> +	sy7758_vdd33_reg: sy7758-vdd33-regulator {

Heh. regulator-foo-bar would have been a preferred form, but i see that
the existing one doesn't follow the pattern already. But then your chunk
is incorrectly sorted.

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "sy7758_vdd33";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +
> +		gpios = <&tlmm 163 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vph_pwr>;
> +
> +		pinctrl-0 = <&sy7758_vdd33>;
> +		pinctrl-names = "default";
> +	};
> +
>  	sound {
>  		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
>  		model = "SM8650-APS2";
> @@ -986,6 +1003,14 @@ gpu7_active: trip-active {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {

&gpu_zap_shader { firmware-name = ".../"; };

> +		firmware-name = "qcom/sm8650/ayaneo/ps2/gen70900_zap.mbn";
> +	};
> +};
> +
>  &i2c3 {
>  	clock-frequency = <100000>;
>  
> @@ -1016,6 +1041,30 @@ wcd_usbss_sbu_mux: endpoint {
>  	};
>  };
>  
> +&i2c4 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		compatible = "goodix,gt911";
> +		reg = <0x5d>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <162 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios = <&tlmm 161 GPIO_ACTIVE_HIGH>;
> +		VDDIO-supply = <&vreg_l14b_3p2>;
> +		AVDD28-supply = <&vreg_l14b_3p2>;
> +
> +		touchscreen-size-x = <1440>;
> +		touchscreen-size-y = <2560>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts_reset_default>, <&ts_irq_default>;
> +	};
> +};
> +
>  &i2c6 {
>  	clock-frequency = <100000>;
>  
> @@ -1053,6 +1102,51 @@ redriver_ss_in: endpoint {
>  	};
>  };
>  
> +&i2c9 {
> +	status = "okay";
> +
> +	/* Screen power */
> +	regulator@3e {
> +		compatible = "sgmicro,sgm3804";
> +		reg = <0x3e>;
> +
> +		pinctrl-0 = <&sgm3804_default>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vph_pwr>;
> +
> +		sgm3804_pos: pos {
> +			regulator-name = "panel-avdd-pos";
> +			regulator-min-microvolt = <5200000>;
> +			regulator-max-microvolt = <5200000>;
> +			regulator-active-discharge = <1>;
> +			regulator-boot-on;
> +			enable-gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		sgm3804_neg: neg {
> +			regulator-name = "panel-avdd-neg";
> +			regulator-min-microvolt = <5200000>;
> +			regulator-max-microvolt = <5200000>;
> +			regulator-active-discharge = <1>;
> +			regulator-boot-on;
> +			enable-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	/* Backlight */
> +	backlight: backlight@2e {
> +		compatible = "silergy,sy7758";
> +		reg = <0x2e>;
> +
> +		pinctrl-0 = <&sy7758_default>;
> +		pinctrl-names = "default";
> +
> +		vdd-supply = <&sy7758_vdd33_reg>;
> +		enable-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
>  &iris {
>  	status = "okay";
>  };
> @@ -1065,6 +1159,93 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3i_1p2>;
> +
> +	qcom,master-dsi;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +
> +	status = "okay";
> +
> +	panel@0 {
> +		status = "okay";
> +		compatible = "ayaneo,wt0630-2k", "renesas,r63419";
> +		reg = <0>;
> +
> +		pinctrl-0 = <&disp0_reset_n_active>;
> +		pinctrl-1 = <&disp0_reset_n_suspend>;
> +		pinctrl-names = "default", "sleep";
> +
> +		vddio-supply = <&vreg_l12b_1p8>;
> +		vdd-supply = <&vreg_l11b_1p2>;
> +		vsp-supply = <&sgm3804_pos>;
> +		vsn-supply = <&sgm3804_neg>;
> +		vci-supply = <&vreg_l13b_3p0>;
> +
> +		backlight = <&backlight>;
> +
> +		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +
> +		rotation = <90>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				panel0_in_0: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@1{
> +				reg = <1>;
> +				panel0_in_1: endpoint {
> +					remote-endpoint = <&mdss_dsi1_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel0_in_0>;
> +
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1i_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi1 {
> +	vdda-supply = <&vreg_l3i_1p2>;
> +
> +	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> +
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi1_out {
> +	remote-endpoint = <&panel0_in_1>;
> +
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi1_phy {
> +	vdds-supply = <&vreg_l1i_0p88>;
> +
> +	status = "okay";
> +};

DSI is after DP

> +
>  &mdss_dp0 {
>  	status = "okay";
>  };
> @@ -1390,6 +1571,20 @@ sw-ctrl-pins {
>  		};
>  	};
>  
> +	disp0_reset_n_active: disp0-reset-n-active-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  	fan_pwr_pins: fan-pwr-state {
>  		pins = "gpio125";
>  		function = "gpio";
> @@ -1411,6 +1606,20 @@ fan_int: fan-int-state {
>  		bias-pull-up;
>  	};
>  
> +	mdp_vsync_active: mdp-vsync-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync_suspend: mdp-vsync-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  	upd720201_avdd33: upd720201-avdd33-state {
>  		pins = "gpio123";
>  		function = "gpio";
> @@ -1440,6 +1649,13 @@ gamepad_pwr_en: gamepad-pwr-en-active-state {
>  		output-high;
>  	};
>  
> +	sgm3804_default: sgm3804-default-state {
> +		pins = "gpio58", "gpio59";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
>  	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
>  		pins = "gpio77";
>  		function = "gpio";
> @@ -1454,6 +1670,34 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
>  		bias-disable;
>  	};
>  
> +	sy7758_default: sy7758-default-state {
> +		pins = "gpio164";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	sy7758_vdd33: sy7758-vdd33-state {
> +		pins = "gpio163";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	ts_irq_default: ts-irq-active-state {
> +		pins = "gpio162";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	ts_reset_default: ts-reset-active-state {
> +		pins = "gpio161";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +	};
> +
>  	wcd_default: wcd-reset-n-active-state {
>  		pins = "gpio107";
>  		function = "gpio";
> 
> ---
> base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
> change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
> prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7:v5
> prerequisite-patch-id: 901a0948e1afbb03ff78a063d4f66c17665588ef
> prerequisite-patch-id: 5ca959a92d05c86ae7a77400d5c4c9bb8bb214f4
> prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25:v5
> prerequisite-patch-id: dd1c5acff71bcfe0730472051c0a5c7c339e2116
> prerequisite-patch-id: 30e1bf23756ac7de0e29e4c30e7c9737366cf856
> prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f:v8
> prerequisite-patch-id: 53130195c1df5886a953f3eb1ffea6e5b32257ec
> prerequisite-patch-id: 016545217702b15d67b3ac48392c2978fc04b000
> 
> Best regards,
> --  
> Neil Armstrong <neil.armstrong@linaro.org>
> 

-- 
With best wishes
Dmitry
