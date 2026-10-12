Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C34471249
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806560; cv=none; b=Dea2o4YGYM4ngaKvVzQRQYKRGFWWsR6sTt30EC91YkQGVAngbfWnkU0v0ZWmPuSYWWi5iKTfRrpEpp4vhlnnNB5unpM28wbdaJl9Sz72H6vcsOzKdcGXGSU6KV9scRi11KwaHeTE7UMt9VYSDvvaVHHvhYTXfOjZGFmWJwIdkHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806560; c=relaxed/simple;
	bh=+wKxsvgeADigiqUaqwzk6mlyDg1aQ0DfKdaYG7Ith9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESQ8wVsTuBX48GElK71VEsV38l934aV3s1SFvIPwN+roOCnBgHyjqbyiPeY9X1uq0bI1DEPD6YOsE4Iw74Y2aQr+eQS74kdqFM254Ap5fy0fPp/qGRD8jAD7wbVS5mHGqrlHVmoneILuP5Wqv5pA7+oZ81PEOKfzyOtAxX8Lr6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nxv7eiDq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcWdW7/X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nxv7eiDq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcWdW7/X"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08WH1686256
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L+t/zZ008TD9OKrDMLJfk0QW
	3V+cIzRcKiLejTRb2f0=; b=Nxv7eiDqbMZMOD2SF5LE44VdxaTrKVnRLw2fadSb
	OeVuCZt8YBheye/XzHYxLPLlDwYQ8ZiMa9rXipF18H3v8SFG4NsYJwpfaQCm41Pf
	s+/he4Az+hB/1zfbwIHh5Yjv05w/vBUdjy9vnq/UOAHIgnbFGOJI71h8L86+HdiU
	RlfNNoTXHEW5vVmke5KCKoskwOXENMe+tAatKY3TlR3YqxAJb680qvRhAGAPY90Q
	fWNYRxwAaKxYXHK4ONNUIyRKUZlbNhcmVCkcu5YE+L01IfuvMW4NZvdbkkWKksIu
	UggHzC2LID4czxxjRULUvcq1PQoJ6cm9m09EoUENVQ0XZg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc0mw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:02:37 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d88f5414dbso585758e0c.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791806556; x=1792411356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L+t/zZ008TD9OKrDMLJfk0QW3V+cIzRcKiLejTRb2f0=;
        b=VcWdW7/Xt/ZV98nU+Zqg3a6ELw/E4ahigh05jrXXh+oLNEsr5vcYpj8asJSaKY6plq
         ckQsL2laOERJAEXUKMo9sukMAUI4QizX8ooewoxdwhZJ8nqcVTGjvaxTIEDLMiSk6HfU
         bltQchvXaRUH2hhSiNrVkDjD30tuqiMKcyNdD63bKitjaqCSYgIC58EB1ErkOGewCkqs
         Mci9vi2QomyK+4bbhabX2q4GLPmfhNYGbUhI2KPa1PmJNhd5ysPFNiW0i0xtZRt49SZL
         ztmf9Ggem52IxALHM4982GMXCXdVIu+WCBHR3G+5FTRhSSwbF95QBpon6gdLyMpw168J
         74bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806556; x=1792411356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+t/zZ008TD9OKrDMLJfk0QW3V+cIzRcKiLejTRb2f0=;
        b=MqUgVQmDNMRtRDGaLbXrCFJ9Bdf8k8/r0ATVIjv/47h5L9kaLopnImpDbpwgvSoskq
         3IwwbDFO8V/d/VnE6yF5WGqIO0asa1KZ4CR6tbzM76Nio8XPu9+7ryQDyAEtuDEalwJx
         YCkFYYidQ1SDVpEKVh9WfQf1CUdOjsyR9d8Osh5+SYJPV4dJJyMUr/peJ+cE74ulVHi7
         rNvhtoaN0E13aT8W2pUvpcy0FEIg7C6i7yASW2nchFx/zXUWNHUoQyDtAtK6gnIXp7zy
         rQavnShRs1mc3Npj591rz3FZbFbwnrc/5xcIPmETwx7nBZGvuyzKKdJW2fwoZ2i4NOuJ
         wxQw==
X-Forwarded-Encrypted: i=1; AKwUvBzCqhS+2be2eNsrd1oXKbcfavuYG89p8gFU8R2996xeu6ugTD/BEeAXHgr6vJFc6+Z+rgWnxcAZwO7X@vger.kernel.org
X-Gm-Message-State: AFq9FYJZIQAKRphfQLAmUwynlhQPuj5Qq1KzxgOdEPHHkCGT7oxDsDAs
	A3ZJhvvhHbEbHmYN728zISJqOTRzVJ9dB5MtpROpPpA23POOD13F0dJGzwZOFTKYd1Y9Is44i5S
	9glI0lwPZoIyuSHQUflzJhaLULxweYZX7jTeQhRD7Nf2MWcFd58OtiIBBXkV2U1dF
X-Gm-Gg: AYBFou1bIUCi/doKqq1pJFO4zPvV848s7oC1Ps6sIrii0KIjwMBeB3CuPWlZKO/JfAN
	poMABbWZKuNzHQ+uDmhzVcOYmvpm813eNxUBvDO7Zks5lUFzRJpeLnLToMQ68pk7EhlCXhAxBt/
	chMV1TbqDwpQc1J7N2K1DaFPgF/MvmQ8TBYcxbnsGjIxR0cVXWqhPBuPzEcDCQlp+XLep6y0L0d
	RJT+DlrCiR0i3GubFr/OzvLpzosEdU4n5nqrFdNBQYZmruLCCRsvTB0ZaFOvEGMxYth3uDoUb6i
	iFWvXudk+1WgVA60ni2uiWHhwZztrWLYk3UkDzI2y7oBCF5zydx83ZNR73f27nX2US2MZ22gTtR
	F6q2YiXA0mpuOZYD/NsuyQjV2A4KhHIlbRomI7jSsOJq6c8AjcKcRNbpF7Rx2MEBr8B9jOGP5L3
	JkuWsXO/c/nnwA
X-Received: by 2002:a05:6122:3906:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5e91f568fe2mr2394608e0c.22.1791806556243;
        Mon, 12 Oct 2026 05:02:36 -0700 (PDT)
X-Received: by 2002:a05:6122:3906:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5e91f568fe2mr2394580e0c.22.1791806555793;
        Mon, 12 Oct 2026 05:02:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36693sm2843699e87.3.2026.10.12.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:02:34 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:02:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add Talos Lyra EVK board
Message-ID: <k4aaqs75ks4hlnyzh2jo6tj4ada3ayuwgztxtyj2d7otu6gnqw@jnbo7xqc5o3c>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfXzM+Aa0JVd72Z
 ZuOtwZOJ5+6J13TQTGGnv8eM+uDMXYsJlgGndgmqz72WHQfH/7E6lOFPjLQNklOtWutc3hxtMwx
 EcGE5qaR7efsbbTGZ0l1B/qQuzQMY1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX3QBwJi0C2HMq
 RxucQwrjumapb5ye/qG8PI4QhiRle5fQcV+iLcF6WQnDC3xY+mu40OgpU6CgKnY8BPvzkQ/USuy
 Ds0bpDb2l3YJEeT3PI2vk+Wm8Bd24qOxu4z7RAgeZxh5mH4Hcky8o4roAp4aQlFuje5jToPVxCT
 itWCcbU0Dnv5i60KOW0wKN/u0nkI+tCGntaRsOcuUffAFwdOT5+AdqxRdjQ/hoPLmjeI/rM94u/
 rXO5BWEOq4rPqfXHEMq3LHQzQYIRD/YyiGpZQVrMY9aVMt7MrRLepiYCSEnfTl7mB5Lfd7rimSs
 G+CU1mYWpZFMWgNgAoW7piQTcasSF/dSGkvgWstUzxWm/zlAAd+eCsTqgddQt8Rd0lsay6fKS+6
 SZA7GpetZlCblVYWEoN9tSpWh08Uf1wbROtopGI/Zl3mDiurrotSclKwfzZL6gGRn5E5tyPq+1G
 JLpmRwbl35XgEEGJoCw==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acccc5d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Of6yoZ__H_Ug1Y5B8SEA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 8NKaP1v7qrywjn-Ur6WcnhUhAq7zI0iX
X-Proofpoint-GUID: 8NKaP1v7qrywjn-Ur6WcnhUhAq7zI0iX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120047

On Mon, Oct 12, 2026 at 11:46:28AM +0530, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> 
> Add the device tree for the Talos Lyra EVK platform which combines
> the Talos Lyra EVK SoM and Lyra carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 
> - Native DisplayPort output
> - GPIO expanders on i2c5
> - SPI-attached TPM (ST33)
> - USB host and peripheral controllers
> - Power and reset keys
> 
> Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
>  2 files changed, 138 insertions(+)
> 
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;

Also, forgot to ask in the first review. Are all the USB supplies routed
on the SoM or on the carrier board?

> +
> +	status = "okay";
> +};
> +

[...]

> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy_2 {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
