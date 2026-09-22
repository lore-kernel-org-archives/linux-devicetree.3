Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3992F566C5B
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093016; cv=none; b=fYsvadq7zVpPYc0assDSIcWLOjcPj5ExEJKNMbmCeb8f2dpTxa+FKcDNMM/2fyv/lLjGtQDGM3f93uEJyRqR/yy/czIY00EQMVX9T4jRYPtwJTmCSWeI+V0lxIKebSd8j27imQkxHjGjfDY4uL7X9QYd1eQnG7gNubVAg3a6f50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093016; c=relaxed/simple;
	bh=e8JQAB+2OKIHJqqLitjcvJVtojsIbIdvMsU0sAm5iQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKjh1h1Pt1nooUyvTAdAh/RPznb3lnV4J/njGpnBCR3R6vmaom6yTfNogxTpnxqwEmQa5KalaAgpUw29wSliYR1Vs6P3aagp8gkTfko4POvDAVvQ6RAnMWIalrAx8WxQ5zjFrGg+INVDKPNbtlz4sMhBldE0457i4PA8LUjc57k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WI2m3eSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/IL+8mE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WI2m3eSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/IL+8mE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjdjL898342
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SRf6BCtAUOHCG8nbF0m+RZ4k
	S7K7e6lPtCgKhANO0i0=; b=WI2m3eSOQYqv7AxA0n5TQyrAEjYn0kOEtyQjmMzp
	wkY3WIsGZCRsoA97xS5I32+Jjs4/QkRFwuwnDW6DCWWb8lMSBhYPe5X0X71BhnoL
	iXN7vXxGbC188YMDsviFHrqIbwY0CR+pmU5PW2T8Qw2SkxIdffjhvZaoQJTXJDQK
	2PbGh3EAJenGiQOWztTUmOhQbtc7WG61/Rc8WMA2Zg+VDGme2em1la+Vnj6sebVQ
	7t7DwTZ1JrQA7R3ZoMsuxBBvqG1qNN54YA/FhFzlOvpmd3JJMu7GSYI9ItgR8fT7
	mMGpGDf0VWquVr/sHO9CxENBiURnea93L66iRPoLIwvVKQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkn41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:03:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c83007a11cso1528334e0c.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093004; x=1790697804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SRf6BCtAUOHCG8nbF0m+RZ4kS7K7e6lPtCgKhANO0i0=;
        b=M/IL+8mEJUGXmnP74W4GjVHMF0f4dSqsNOreLb5oldNON0KAxg+XCgYbFv0G3znAKa
         Yv9e08CgOL92z2MF0a5qQbGojFQHqDFBgiTZeYGMzAIyCC49BEvXifBSXZieWc/x6nnU
         BhdM/IxN1njk4S+uZXsa+BYG84UT/cnsMwwvDVn0HjGK/VGrQrLYax3pG45F/8BgDYp4
         hhkLvkwYCGN8ZzTTj0lxgpeYLlBmxCZUoZHtmEUwXdjZvmF9SqTsag4rdrr7CQzdhvSU
         eywVvGPMK0TaxCZUiaa2Te9vWhigqmpRK338Igvy7KvqlhyN1QLYOQvS+ttBoaFWr+vC
         jg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093004; x=1790697804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRf6BCtAUOHCG8nbF0m+RZ4kS7K7e6lPtCgKhANO0i0=;
        b=RTKWvb8XHyZWNrXi4oQoLL1AiuLSCE5rZaLzKxR74FkYOu4EYjiNJYGpxFIoq6yek5
         VJxo1hD2p+dLGbIum40Od0sfU/+9dtr8iAQUJvlxoCQHn0Dsi1N3DfJ+RmjG70PkhTm0
         NftMF56ISiqZnWun0iOQ3Nth+xdtpZX4ciPzIQLzx6Pw6fgmcnOT0mJG4mZ8QCSxi2vb
         IFxjG8ZZU+8GOncb8jRLgh0oDFecVRZa2kUKY+JE2dGzo8Y6RZ9oH1FIu9qqv+A+ruLD
         hTK6PvVDIziIzUjXdjRXpOcnZmeVkf8o/mUVz1arGfOW+KJcMl6ZZZiZ/GukP80Sfc1E
         fZkQ==
X-Forwarded-Encrypted: i=1; AKwUvByw1oVzvHGZnTzHIT3yd1P2oQ4WUpzYJj+6ID8Jgkzc6tWpPUioCJx7d6TL4Pef9k8T8zpq2iiqJoaD@vger.kernel.org
X-Gm-Message-State: AFuF++k3hy8oFcYbNr9mFjTy3QbEtwcRn0GOUqkEftZvxAMjktWPwd75
	0zn+tsqNlqGjVSSl0pQwNsJrFw++i5dFBGspwouKzoAWm5OdR4JDvQEURuKKZaTlNiVP3ZbkOY1
	l9kCulDIEwDkmjz5rTXuwSGLlxpKZeTqcGRkYKkEWsJj+vNqesl0skL1ibvzSCMGn
X-Gm-Gg: AYBFou2BhCV7sz+EUPFu4wB8MTH/InfwF5Ddpksw3Cxp+Gw+UedvMWO8Ie42mhHCP1T
	l1XDA6WBK99LcxcCeJm1RvykO1BOK4hd6D1L69z+NvbjHndMYNQChT0D/Twy2rpnTfsoFTE5798
	2f+o8iVDLK00djYkVWAwDF8D94IlQUSFEoPbSw1X1T2g5vnNjNAsQUNcFxpPUc9YC5ZWymuumrR
	yqPyk2HWzDDwhDkyR/biLC6cJzy+yFZtbK3e3zBMEdt8tjvr6DWQMcTY8rQ679KwzlDlhNn2Ger
	FqQww6X8M3XAFB7yrVGZDzuVs+LOv3C5h6HC3oNfVeaNW7GQYaTeVB1h2JprVRsta5dVLgRGE1V
	tJBgRRrnxD/ZdWBmHfpcI2vgENvQFEl43buiEAq/S4/W8a82BuirTZz70d7lyLs79poBbJWt3qG
	B12QBIb1yv0Y3n
X-Received: by 2002:a05:6122:390a:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9b58f8e64mr7724977e0c.3.1790093004469;
        Tue, 22 Sep 2026 09:03:24 -0700 (PDT)
X-Received: by 2002:a05:6122:390a:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9b58f8e64mr7724896e0c.3.1790093003941;
        Tue, 22 Sep 2026 09:03:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552fd4sm7707e87.2.2026.09.22.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:03:21 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:03:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <5som4lcux7m6fyawwhjyrdxxiys6dh5ix33mtkxsseuv6uyxez@jb4m62r7x7i2>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2a6cd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=c2b1m3NVJlNk683j4LYA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: YYaFztz3SCbd4cDVG8MXTYkZ15r2X6AN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX2mMouG/dUjI8
 Z0a+0nIYM55OJugk2XYvSLeAyEEaN0e68asSwrNIER27+OouZkxQAZWK4FwQYQVL0vh4tTxCEr0
 aUyftlYJjkILGrJ21BuEk9Y8gu2p5uBNcKxIxSMytj8XZUwxwNhBLKfYtxxmqvAhiMkU/X5dRDM
 WrOGVhA6Bm2X7dWMDZ/g4sWzucWQf70mzlIZ+yTyTu5M2Vsa+V33us/Zr4EK9CF0/4+jF6BjKk6
 1YENv3CSQtX6qu5lwVcqQZiQResMsoEsBeZ4G7FNLnzdmmjIudnUE9dncCPC6w1jUakBY8cXP0v
 URrwhHkV9y59ijpAMgNUGs5z4woDf7rXXtYMyGwxow1o6XYUMIJieVTOQdySF2ZLb6h9IsqhMP0
 8lFBDerbEZqRc3Lzd3SIXl+ms6V6FvijMJbL4pc60TCX1OAq0dQAP2ukDJuyqKtWuCle+RKI9JS
 vKg68JDgb79Ai0QMTzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX4x4Lm1DtojMr
 p9icVMnJ+2vTUzSqctXprx7DqiV88LjAnFxr2pn5EfgFM5HzJJk3MxDa7y5uWaYwdomewWyDWRn
 nRyeSwmOPA82BUxnvlGci6PpwkaCyMU=
X-Proofpoint-GUID: YYaFztz3SCbd4cDVG8MXTYkZ15r2X6AN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220234

On Wed, Sep 16, 2026 at 02:41:20PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Qualcomm
> Shikra CQM EVK board and add the DLC0697 MIPI DSI display
> panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
> for DSI PHY PLL stability.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm4125_l5>;
> +
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply = <&pm4125_l15>;
> +		avdd-supply = <&vreg_disp_p>;
> +		avee-supply = <&vreg_disp_n>;
> +
> +		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;

As far as I remember, your panel_bl_en enables an external regulator.
Why is it not described in this way?

> +		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry
