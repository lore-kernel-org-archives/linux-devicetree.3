Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420983;
	b=UqFjPZ5ZoSW0ZX1xmePFo9EDts9K5Tmt48QWZvMRMIR7utvBJ/jMj3vhK+wt4iszXJEg
	 kT9+C69Qkp/kTQ49qu8CEthPK/WUW7tgM5P31UBJVEvozCX3AC76d0i1fmP/Dd6b439O8
	 +/dqvhhJHe4D76O9wyPFJyvVpE7QILcgcIwVFwMpC7tsxeW5eW0ErjSbMxKninHzVrZqU
	 3HVYs09P8NK0Zufp68o8+jJDA9/ECBuNk7PoP5Q+YWG6afNr2F2grik89Ucb4KKEGN033
	 +rBYGm+9v3rkiYUZqr0Ky+TEo02n5e1Eyifw+ZE9p+QvAA3ENH/AB8YKq/XUW77DMZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=REvih3wAsG/3Y8nmSLavA6sFWJivHfgQW3aPqY6xVOc=;
	b=v0vpmNP938Va8dAdc56PwNZGDJpiXza4nfzmscErQqVOxJK9O0wOFyXt2PWwatA/efoN
	 psHS0UbgtGkoPrdhR4KF1vpE63f5PAfx9P66D/ipyKDUXzLM1KZJrd6k2CK8MXS1NHQhm
	 w3TwM9fhTlG6TRpZ2GOtdrqf/uXXShDrnoDtL4+hZTgiFcTCM90gc1AOM38zHVZ6VIk3d
	 MU/586+j3Vtef/jyjNXJbPQ3ndGtG/0CzcmFO8RPq9M9P25wUGb6O7AZOZjGJNIOHyOwB
	 CCXCEYcK0Jux3Ecjd4qNCxlYTKqDdOhO3YrKNY4urZHbL3UllgWSVJPkR1c/mXtDMVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glISu5jm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxdoGSFM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386DF606A327
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386DF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glISu5jm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxdoGSFM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtG7u2705717
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=REvih3wAsG/3Y8nmSLavA6sF
	WJivHfgQW3aPqY6xVOc=; b=glISu5jmcoB4td6nZz5qG/2jm/qi4dD5Rm/9nSsa
	/I0Gl1GenJw0gJ0xFGG58LM2hwKHwHJYnsp1mOl7Imy5Wmr5+Sj3759L7ygtlwP1
	kKiIHi/sWbDtQz/DNgL9bnNJlOQWYwZQYUTix+NhFXbkDl5d7MLlNPku/BSlpKHw
	vvEvz8erB0bQP5V+CVfQIbrJ2ChUzhYDQE6SqVkGCRNGt3tQ577rEL1GABb3rc0u
	Y9OgQkxts7fON1oYYDRihHuGEGPb0E4ER1zYUCcXE+Lj027hU0I/ksXWRSH0XyCw
	8/DYX8de6VRdE7t1U0ztcqK+WKh8V2VGqOFG6HLzkXNJBg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0g64x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:16:21 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eae356241fso864466e0c.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420981; x=1795025781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=REvih3wAsG/3Y8nmSLavA6sFWJivHfgQW3aPqY6xVOc=;
        b=jxdoGSFMo5dMG5F8OrpLY8cboUuWxPPH4IcP0j4Epbuuta1Y/xvD1wgVgoDK9nxaPU
         uAiTvKYB1Yze2W4Q3XzttzXt8civZCLL8uk7JhrcrxDSJPjufvx4nVLlby8SPusgEf7f
         m0t60DdPraE02MXfzj/WaI+hMiExc+fG+vR3ibokNBMV78wx77s2Zt/erX3xZEeleHX5
         XFPS4SzQiQuzqvAoU1wFiLnAy5AWgSctjwRJrW+khohjkKUQ2+KAujWnywVl/Tjxpp6b
         RszV92Sjz/AlNNe9fNLJOfCWODecy2GYqt3GZBB1LlVU4wvDu8Br60JrJXoEFO3PGCcB
         VnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420981; x=1795025781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REvih3wAsG/3Y8nmSLavA6sFWJivHfgQW3aPqY6xVOc=;
        b=eT26HPbOewQpqQ7u4TOHFQnjBV/Hprp+a3axInp/H2XrXhNB4CsLlvgrA0jphcyu7h
         EeQgpEcPer4RUcub6aGCHGPk4XdtolDUwRBVxumXZBjrUGLz3CIpyGhglafuVuNUECub
         LC67v1IenCluz7MDWKV+R4f1hdVYetUE9O26mP7c/QjBtmW5d2rh/Fk3yC1gP+B/qirq
         xU48NY5m50nuY513lhvZhH2xCWcVpBIpZirQUa0SsPUx44639Ikb8tRVul+IQsb4oV2x
         hlAbEDzH0GaXft7X2BX9iuy6wPIPZJpbhB4p1lbewg7d1hGfX4RoDEOqIrdD475GfeF/
         F4oA==
X-Forwarded-Encrypted: i=1; AL+hErHw3Fcs9AqT85gEPAS2toSWkkhkOSr/lJXJv8BHZDTC/NeoR+2BOcReKhOgmd2y4Ea3INBRakYnzcI3@vger.kernel.org
X-Gm-Message-State: APuU4Z+FZItDFB/yNso+oM+hdtysUkS998uJ+jO80r35WCFElcr5sxKa
	aoIHJmLUVwtom/xCzmxKxAYmbp46BjOZI+nkWzWM2vvfpUnVQKkiazHivmWfb336G1MNUskmPcU
	KjlKpGuPqSDqHeuQj36qXtQa7tunAnwl55FRarR5ccF6zZndJ/CaJ913OSb+zaeJe
X-Gm-Gg: AYBFou3gpp8E+h/p+YCoHOf1u/C9lWdeDC/QLdKuHi9NffR4MxyKMCbSnDkRSHsnMUY
	Is91mA8M+AH8M7ofOVaZn/iLTcXG/2qPg2asXbLUwKO+hhGnVLgEpnN9SCYscTUF/uhZyzw0A8G
	OLrPSkRTgJXHMHw5Q8c6wemVrrKg8+3GQk6zOoRrPAxYIbx4stmxp/olAh1DjGhvIwU9UsFvy6O
	sPW6ENcFNkl7hkAIQE3t9Cy6sZas1IQnNQBgDPT22gtl5JoHFeniWQpcZMxwq+9Or2EQ30/0Cb7
	sAnUJ2UNHbXALHlOtjmfKGUcD2uC823fD4Tu4oHHQ/MmbgDf0ggn2L9BIalY4+eD3ijAEOBGepN
	rB2UyUUQiNuS5tv8O9Rvd/gNbzBblo7FjH4XUfnBqk8q8wjEoN+MjcH3+qAfjhcCOyXxDOGtVM6
	4gzXRFuFEPTz/xOHmS8LfCWcJlBrkHNwTDYvRSeILaC+vE0e+3T1ebO+nZdTJh2g==
X-Received: by 2002:a05:6122:e253:b0:5e9:7a1a:5ad5 with SMTP id 71dfb90a1353d-5ee1c46bab6mr1148647e0c.20.1794420981137;
        Wed, 11 Nov 2026 10:16:21 -0800 (PST)
X-Received: by 2002:a05:6122:e253:b0:5e9:7a1a:5ad5 with SMTP id 71dfb90a1353d-5ee1c46bab6mr1148604e0c.20.1794420980694;
        Wed, 11 Nov 2026 10:16:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae1bdb2c94sm625101fa.26.2026.11.11.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:16:19 -0800 (PST)
Date: Wed, 11 Nov 2026 20:16:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
Message-ID: <7gqjjq7v5krgibjxqelyjwmrfygfnbsvyfubgbpkshkvgdftxr@dwm3rdpoqbnb>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
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
In-Reply-To: <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-GUID: 6HyGe_qCtIk_dD5-ugMz65HSDojAaGdg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX8HFDGM/M5qS8
 oQaBFTywlucJcvN/0b/iZIf2oUKKNqgoQsQO86Gb50exCQxw9fqSv75B8S9s3mF8Agu+HRUv214
 D8XANpWxnE5PHINov0SL0WiZzmy3/GxaTIlLVo8sU/8D5JgDG4a/IEp/DePQZXCTBvOO4vKoV/W
 uo1XDUD816SMvXFXGFCZaeWSJ/0A2RfwpuH17R0xoRN86kzr9Uui389imCDLeLSFuRuugIWn7Al
 x6wDYDIdv3qY5mfXBqWPBdMAbCuix35p6sdzFVKnCT02d5elAamqtHbX+mxUdgVPcyJC1TrH5yH
 ClVnwkd/Q4gyhnrx2jW9lVHgjybw897Em3uJth4uML5+b3M3ae8fqt2n2Ad7LrZggQpzeAFJYcK
 +itgOZ9lggZwENYqjDGlTfS5vlsE0w62eTVpEdqxhSsUnHwPIRF1qiXFMhEC4ougAc4wjwLA9KQ
 ua3Bl4Rmo2ZZ9Ea+O+Q==
X-Proofpoint-ORIG-GUID: 6HyGe_qCtIk_dD5-ugMz65HSDojAaGdg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX9UPLRcIWGDwZ
 jUpnAAtepimf4CkQuYG3O54S1pdRq0jX+PMViV8+vqjmYDkF5V48uiV752hrLStj12m15KUhOsC
 MRB8LH947ByDdDbZXcuPIIfr5mQCdzQ=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af4b0f5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=PrdBiiE1VpZ4eXJVCeEA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:01PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.

I don't think they will fail the probe. Nothing will be registered, no
bridge will be attached to the DSI host, which means that the component
device will not be constructed / bound.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> index 7a3f8afae22d..9c2cef11e7a9 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> @@ -189,7 +189,6 @@ &mdss {
>  &mdss_dsi0 {
>  	vdda-supply = <&vreg_l2a_1p25>;
>  	vcca-supply = <&vreg_l22a_3p0>;
> -	status = "okay";
>  };
>  
>  &mdss_dsi0_out {
> @@ -198,7 +197,6 @@ &mdss_dsi0_out {
>  
>  &mdss_dsi0_phy {
>  	vcca-supply = <&vreg_l28a_0p925>;
> -	status = "okay";
>  };
>  
>  &mmcc {
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
