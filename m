Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278103A3815
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650189; cv=none; b=FeVg8VDZn3uG+ceYYPwpGJt3pYVeN04BYEze2BTTTOk8482cv2mD+b3u7w1wqonnNhsXlRaHeCO6d/AwZr/L3+uXBhAW26CJX5JUlmvDADzUbPI0BZL1AmY5cUQO3LfmUBA8ZLE2CLb5XA+FSH8uVCuFbF/oywnyyYPlK6JMeR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650189; c=relaxed/simple;
	bh=8WdwCDOAdxTlw0jp7B3yLA2x3+Wn7oqfprfw8LNjvQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuTYJqE5SxOYFYZ8Su7rTlpOvjQyqPN4x7RaynYzvtRL8DA8UKLASumcibFrITg5dFC7CrDDEAjTysMuoWVYmB7UU8/aYP88MpP4iH1Sj9GJ+XXWPWO05e1XMQQRJlUrxjITFyrwYM4zibZbv5SMq1QcaH7LL4oDL+HYjlVw3W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ag+mJwv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLDAZLY7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ag+mJwv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLDAZLY7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SBPg6u3868089
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QvGNDwVdi08g64ZU9YF0PBq5
	IxE5SHw96hFN5wOlbfs=; b=Ag+mJwv69LASJJsdLD5MusZUKWnJ3XoQJy/AzpAo
	1/NBIyvF2AZ9ocGrpw2GNUgCtllNOMT6bxyMQ3GKBPy6sVDj79QDHsanKYVN7rGy
	1zIP2yuCOPODKa7aGNDHUsUrhPUf4yCaG+ivmVp3qUMCNiTrYqgJ0zBB1sqpf1vT
	pLVr5lsvPICA0pa104fhgJDd0ur+nCL/+6BAg1FSD7ElwqPH7XYa5Ka6PAmNBCUj
	d8OxC5Vf1f1QNKo/USDlOQMx4rIxBHeHwOOnu7ZhpSk9KHu+0U4kNoH6bt8FbvME
	TqS4gtc1yeEhEpSYuszVGGH8mI7SF63XsdV30VkHD5njSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tujv6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:36:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so538554785a.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782650185; x=1783254985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QvGNDwVdi08g64ZU9YF0PBq5IxE5SHw96hFN5wOlbfs=;
        b=kLDAZLY7Ui3/nk49XUF0OaYkuzGmELm6LXcH2U4bYjtkb8+lvbeKA082SygFGMUsyL
         xPGoeIj8EjShz917qnpTjwhyIwHrAiwhUgroDDDl3FD6ueeVxQZZ3u04BdAiKY+dx77I
         AIsIZ/gIrK6rTyiiSYfG1qP3O26/O5cmH0ZqTEguNzhGKgVC1f55aOc8ybxOVzWXCm6j
         r0XHyUh/LSuNfepLHcmcNmplEix2cWJB7WfNJxnItEjLpuEMPdADYqx0kj8aRVIT9PrQ
         p3t47sNNAsNVpopQrqeK27LrnqSuNuZizt5DzScf2PicxFUgizIsV5qQBVSNed1ozPHL
         M6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782650185; x=1783254985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvGNDwVdi08g64ZU9YF0PBq5IxE5SHw96hFN5wOlbfs=;
        b=c6aHK+c82vM4QBF85Vji17yEVpx/PFGKFV3K31qA7I9PdEdHCG0TAFD2O/9CwbIgUf
         k96HvAWusl51whnPl0E9YYbCreUamrKoAue7iTd9GYZkmES1GXZsg13HDlScf4/ewiXi
         w9dmZw3y1iD+gJS8vnLBDqWZ13d6BfR5AqNXkeGvpDwZ+LgcU70FIPm7SjU3tkztnTTD
         e1Mfju70g1a0fwACDSeD2IJdRTqzYww5QOjbzaNE6khwVlMHOaUHzFV0261oeKQqGMCq
         xhJnKgXfwOvwqCgT91IH1KUGvSPMcRrrRKIT+PLLwPV5fvjf2CVfCtbgFqderIKsDAKa
         gngg==
X-Forwarded-Encrypted: i=1; AFNElJ+E1vT/OzJPyK1AbEyM5cKKLqWZnyBqjBpXERh9ipnFHtiGMplUyZFS/rMnZ5KTB6djH0woId7Y5Fls@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyb6bFy2HreuiQ+YMet6Ug2jygAbIggVfU1KCssOFGlhYHVuPc
	2aTzDioqdDqZX9JBnLEAs2Slnegm4zl3xfkL4VJoZ0o30b1UGPLICNf40wKDO4xi8HzVp+tru3N
	e8YHRCgd/LomKaaic98G19wD0XwOxgXi4hTda82192glj8tnRYiZZsFnSJzk5Sxv3
X-Gm-Gg: AfdE7clFAXmCVSe3p0Xc4QGiSC4a6gQ4ON1PD8KUHVMQCJEuBfq71AVS312I4L1TJpJ
	ha8c8mWlrBx0jAP0axQnqYuqGcCFtlce3PkfRQznITrktvsHUHoOCLf8MIGSz4wgN1KfU3bst3u
	rt9Mx9kFyUshp7fLk8DOQRdTwajVi/sPXK39q//93XVek+5oMU8YuEOqcTWf0IfAU7Ms3q3Dr4Z
	dvI7NPuBcYjuZYEZrHuEo5Q/JhCYA8Qtb2CbXrP9U+3SlHnM/ZajIF8op8Lg9b5mq/AodtglTKn
	OA3tLS/G58+iZiVZYHtEuUlbYNG1I2YmofdpmYaEtvl7cnEHVyv3GGfwDtXtJYUGrh7F6G7t672
	Yt7WK/09Ame0chgM8nwcTAME+Ukebxf4VqNKMdOkkyX9kLkyCeDVZuzdNkuQc6ZDr42fEr0Q0B1
	Oj3OrJIkLsCMluQIdKIMpII+CT
X-Received: by 2002:a05:620a:2a05:b0:92d:6961:9524 with SMTP id af79cd13be357-92d69619913mr599482485a.69.1782650185189;
        Sun, 28 Jun 2026 05:36:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:92d:6961:9524 with SMTP id af79cd13be357-92d69619913mr599479585a.69.1782650184715;
        Sun, 28 Jun 2026 05:36:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afc749csm71506771fa.12.2026.06.28.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:36:22 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:36:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 4/5] arm64: dts: qcom: shikra-cqs-evk: Enable display and
 add ili7807s panel
Message-ID: <6qf7fau4yfmyl7qaecwxbj6kegyawq6euovi7ewwuki57gtepv@57vioqyiladd>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-4-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-4-449a402673d0@oss.qualcomm.com>
X-Proofpoint-GUID: osjxpHUltYknW35hmNA9pOcd_f41oSl4
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41154a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zkD0J19DHjye1_UR66kA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: osjxpHUltYknW35hmNA9pOcd_f41oSl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfXyQqeZ3C4ZDDv
 I8f1PjC2DEHvO/xO5W8iCeL9dl+CMwWcK8/i1V8E0VDJ5t61tGZ3PIIlYEtU8LFJTR4xu6pUp1I
 5rR0w+DQyOEnSeTnju1zE9tELcUa6a+/oposogVXRo7a4SMy/ZBfiq/+OXJAYmoAM6WF2faJ4eP
 Kf5xm7ojBuwIIeho1aaiAw62uiKw4GWQdJl3VTMUuouqr53ldQTLsJ7YwS7SqxX/jHXCoSSqlMo
 9m17XMWURXiNlPd10dzCp8xrfKeETk+oUQD+u5lSnbcycKpYNGNEN7VFJid2JBUFMqfkaxzpSKg
 gyBhHDDAri9Ub6GrRlIHbmbAMRck6gPrEo7Pt7TzCUOcNcG4nABY+moIXdnUUlpUen/bkeePsd2
 iRrV0CiC2uAkTuCn983f6AeevkQXj0DqtJpGsZiirFKGR3MC6f5UvV0oX+SdyWRYewrm6iQ4n06
 MG2R2ggD6Ie6OcXejPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfXwpt50/8DgqgZ
 oaC64d5vxC02Kej/fuBgwfB1lPuW4WZk/ljn2FYCt1VQJMI4+cF3Bq0ia6msusxAHW/1HzawbK3
 ZNsjAocZg0o1vcOTUdRDYNCbfwQaVlA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280110

On Sat, Jun 27, 2026 at 03:31:38PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Shikra CQS EVK
> board and add the DLC0697 MIPI DSI display panel node.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>

Missing SoB.

> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> +&mdss_dsi0 {
> +	vdda-supply = <&pm4125_l5>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply = <&pm4125_l15>;
> +		avdd-supply = <&lcd_bias>;
> +		avee-supply = <&lcd_bias>;

The same question regardin AVEE supply.

> +
> +		pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
> +		pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
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
> @@ -116,3 +174,49 @@ &wifi {
>  
>  	status = "okay";
>  };
> +
> +&tlmm {
> +	lcd_bias_en: lcd-bias-en-state {
> +		pins = "gpio151";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

Order by the pin number.

> +
> +	panel_bl_en: panel-bl-en-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +

-- 
With best wishes
Dmitry
