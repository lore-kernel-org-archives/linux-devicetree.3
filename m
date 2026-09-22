Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9ED5625F4
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093105; cv=none; b=c1BnWrRlfAtQe9IDD8qF9X/BOiVZad8cliHa6V9C5rYNfIqrGp9HTLicWV94V/Rwn3QEEbeKg5Y3DlcnrOlx1bDHg8PROm+wvYhvvUmBSH6E+ePbuWn1EkPGqEcXn/shYEUQeEGrfvWCY2DJxUedrDng49URdYBHDASYbynbhY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093105; c=relaxed/simple;
	bh=skb9nM9bihQYVFuXS1j/3C7mu4OdrLVg0b5dMXw5JsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2hNc8NLES+LVlfPwxwe1b2cCnn5kOhGvToTlxRUVSd+i2/NIAQy9pOBQREos2CVOtMhJhO/qbfcrudArXNYdqUqH2vEvE1nogVrUEuXv/NMuwhaztK1KgnhQX6KcVsnzmeBXNoNXURMM4G6u4cDswfnf6B/dCZpoyhLRgUizv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WL5OOD5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzqUphZK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WL5OOD5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzqUphZK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjVIF1058306
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W6vBg0blR0+AkISTBRJY4Rut
	F5Ms724ptSlqmC18R00=; b=WL5OOD5GSpcjKicPIVXvJVUyfIocWZqrL6k/m9fY
	x0/Cc75zEUaexkJGIQNsv3OUrcdPNI5xfIknOyi6ONXNA1ZQcAlXKvRwmuG1qtju
	ggs8UoIA+K81ruzs7nGRHF4aPYdTlQYA92k6t15GswBl4n9rsLeCIz9Nah0rwUKE
	MM1w8OxWAgBlapmPcFdpOr3xiPho3iNlqLbCO9fREPaH2FxpgK6q3KWzQuLomAjf
	rTjfEbPuup6qS3xfvv/LWipuiR2uhFG5qH50kgHrXu7/ESUVIjKkZB2cWjSEbASA
	Y+hFhavUTmcOwLfLUpUonD1obqp+irR6KJVxfBT6yepUCA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5u9s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:05:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a5ed2517b7so1395562137.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093101; x=1790697901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W6vBg0blR0+AkISTBRJY4RutF5Ms724ptSlqmC18R00=;
        b=NzqUphZKvp/fN5L7hNnes7ePf+bbkJNtXKmAygyukW8eSvs41wlzr+8sH4iJ2SFDn6
         fFXwFjQRWXLvoAj5u5A/nef+ikKVjKxmcQSFjagUZYCA4OmHwC8tZ7s6bne6hmLe9Uq7
         bQ4kTyQcNU7w8vaYvdZRnkmiY2ghWKu6Q+Oj/Pd2gjyhGX4bjlUrhRGQKfhxKbNhd7RP
         1sRFOjZFFTnuD48bNfXoR5H7jCxVXLHeziixTS9ZuscQnmD1M1LuMWeW/pb2mr5jdzPW
         v5hKzPCLCE8ZF8htrOaWEQifH8RghcxC45AcBHxpxl2ROiYr6h/A3PoVbKG1PvSbkMNs
         p/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093101; x=1790697901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6vBg0blR0+AkISTBRJY4RutF5Ms724ptSlqmC18R00=;
        b=Q8sDWIqm8j3aD4LIvplmS7OJMW2RLNW9ejRuZg+BiFX5pSC5NLGk2eFdzLZdHeErGQ
         7cu+djVOyk6YoufBNVsgT2XCPHOKTlgvbg5u053JEqxToUSVPDj27oc7y8FRSlc2X3aT
         lryqRL7/4LY4R5dThZOvw3S9IoKLoHl0laV/YOVn6OCpsceNLAEiUyjJl9QuXgAolhL5
         8GkHsOxm8kQb2fo3bcnPPrXR5sbktqA5SgLP5CrtTiF+posUMb9ZkCAWHYHERSKC+vmt
         4q5uVB7yWIOX9vF1RNTIA0wWDS7ZiXwilUL0Nqcw7Q3lnPj5T7fzn+iWkPVSox7poMS7
         Sr+g==
X-Forwarded-Encrypted: i=1; AKwUvByvTOugdUbEXhwLex+ecyuVGog86c/0vJqTpvXSvW9GjhbHplGc3QwV1aUwzhgT9XifO3o3TLNMjeaB@vger.kernel.org
X-Gm-Message-State: AFuF++nwCZAdEeYahb/QKJBhPngctdJh8kAskZsOteNWFilI+nZatBz6
	0RwGkHvhf5N4hUkBy/JTKXmGscdSHP32Ify0EYIAraDTag4+VKK1acK8FMWgq/XlgSLMahfwKvy
	tZNhKXo/965NAVJOKvaQ2YQaBYN4Pago2a1rdZIdl0FUMBioYUXCjoCMs7vMryXN4zq3vXnGx
X-Gm-Gg: AYBFou3rSbptMxUTEbkoaoQN54+OVaPwwM9+TQOHsO+JdejxCxq01Rxu7Q2/cHdwoPX
	yDNNs2kWuyMBFgqyvEpmQkIy0GdduJAgQTeuVyBi/uQ7kwPZSemqPfPYptwjhlfqAOVk+H7ums+
	qky8Yn1EVz9z8BuX/JPAyzu4MrVj6HcweshpchEPk6iMKIhg8i5oHcxdss0R/7PHFHxBp8sL363
	WeUEAXZwhFdMrmuGCYWaWJXR7gZJeM1PfsyTWGEEsZNdv9r1TGKx7wKBwdNmrOreyHrqgPjjUaK
	VqBSKPv54mJKpC9CZBa+1uRFn3Al4aIwpOBZKXPE1HCPPnOGn6WQ8qzKvI1q1j4MZxiA2dSSCTj
	SATMaSaaAm4iXtqEPlt/vm7YkTLbr71psV+lSsrPD1DJ3W7vEIbbZDI3E69YqPnKo8BTISXFNim
	C4wa1a+8jlmXPv
X-Received: by 2002:a05:6102:370c:b0:7a1:f951:f2fe with SMTP id ada2fe7eead31-7a55c8821e8mr7932888137.17.1790093101372;
        Tue, 22 Sep 2026 09:05:01 -0700 (PDT)
X-Received: by 2002:a05:6122:4f99:b0:5c9:a60d:3277 with SMTP id 71dfb90a1353d-5c9b599e181mr9764222e0c.11.1790093089758;
        Tue, 22 Sep 2026 09:04:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859682bsm2260e87.84.2026.09.22.09.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:04:48 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:04:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Message-ID: <qkhgg5x67sijiialucvzac275zhpjrtt47a4udjpyzmgvilut5@dcrslq3ai7mc>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-2-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-2-d5d5c3ffe070@oss.qualcomm.com>
X-Proofpoint-GUID: 0LtZ22pfbZ9ROuCjDIYHi-QtlIhz45e6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfX7ghs+kLNJ3oS
 J1eaD+bPy0Bk/aqQkvq/sMF4ibQKeOwXk34LKrSi9gN++zKrm2VDyyAm1VlQqwBMe82GtS9zHUJ
 c8RaLHCMlIqyrBiw5Bp4Xi9oMLpvKMk=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2a72e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=c2b1m3NVJlNk683j4LYA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 0LtZ22pfbZ9ROuCjDIYHi-QtlIhz45e6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfXy7czqrS2OHUq
 JGQtg0mEaK+LBJY3DSqu5V8kfrhb8HU1s3DF50XsH4Hcekiu+r5iDveqecLuC8JiYFECGYh4Wxk
 s7h8snOTXx6G3iNxMeJol8JsaI8VpkdNs6Y6eyWXbGqGpszeqLNCsTjaWZ87uJYSjhPfVbnAvN9
 t8ux3RNC2APuH4Vd01FzbA+StixVTNaNf8x3zMoB7WSkyrmENdDHuCD7vmTcJD7hkXoYpVBSnoJ
 IxIFNY/xpxwVjXiHTud3jLaumXr/uUsIGAQGGFhD/SZQ8pgJWM7wEfUahbWrNFnJSrbY9wvrJlG
 /v/ts2eZ7RPLCL1x6yPTvmRFFu1kNwrqJPkhBBTuSE9ptHpY7AnWQwBdTSB2KxdjWfyqQYgVDZf
 dB7E/cE4RrBQhU1UERNNNjYyxYkQbZoPtXthzVs4kVi+Egc5b3cmytXF3ZNrS2vsADmS+8+Qspq
 5PKd6jwebnHtILmrkKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220235

On Wed, Sep 16, 2026 at 02:41:19PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
> board and add the DLC0697 MIPI DSI display panel node.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++++++++++++++
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
> +		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;

Same question, panel_bl_en should be a regulator.

> +		pinctrl-names = "default", "sleep";
> +
> 

-- 
With best wishes
Dmitry
