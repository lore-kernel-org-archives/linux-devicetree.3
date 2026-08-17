Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B323C10BD
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982930; cv=none; b=Lc1A9cLq0cAJdjIqx2tnvLaO5XToNJHxf0ou78l4w6XOpi9Eg+TkAfnxy7s6U/EgvFC8bFCs1KI9SikhgNGFjTk/dh7Aqm3Wrl43JiJiz/QaZZVNQC4m1rwlzMe9DKqRCvZat+k4ebeX7BmFCdc/GzD+U6pwL0+s11OWOjxAYxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982930; c=relaxed/simple;
	bh=gRcbiXfBc1xHk1KGU0otuDcHYmR9hB18zsIsMVxfBQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Br3mSbl/6om07hG2PdyRT32QocV/hE0rQpuO7bZTvtrNRvr+WxQppEGZ3TsuWdLBYGj9gXanSq+wKsQRcRSCnBfYitWBPnAgRGVA+m5yAEW29+X1QnOVcXC0KQjVRA3A0wp9jsOugj/8OdR6sqX5PtFSHPjKxzq23Dq3tG7K/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqf7ThK8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCl28YUK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqf7ThK8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCl28YUK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYijl3082125
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IiNHZhXD4zVpU84b3/87tpD7H4RzexzgSBw04b8Zzk=; b=iqf7ThK8DyslyJpE
	rqqCR3RIH0GrLpJeT+sokLZUFxkBvQz5kh+10LmMNHRvTFo0+T672KVs+ZpQ6PTv
	vroMTmApAEuDU1yg/+0IkgDT/dSaJCHzjNZd1IXqEske4nXRw0cmNBaojohN6yKc
	2VvlUFWMRr32RaxYvPiLP1Y2k6M+88gCeHRWU/HHJP3UKWkYNGVglRoBm+6W2nSF
	iLIkkUz5fPm0d806tN5PmavJSuixsetC1tP1UXOyIxN+fomPdibsIxPuWZWGqR3H
	omfCTWGRW0ubsPXppYyj1e5ijG5qkFubilT8heEDZrKIfMcWePYeWbNiGwkjw1Np
	UxLAUQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y779qrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:08:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73761f92dd1so55706137.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982927; x=1787587727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IiNHZhXD4zVpU84b3/87tpD7H4RzexzgSBw04b8Zzk=;
        b=KCl28YUK/ciH3Uzb+QLV5Cu5b8sbgz0OVnrYPu1uiN4e51Czgln1hznRW8VBO2XMv8
         pQa/+KXXS5AkRNJ+7MGGYtRFEzuYLegJG3gjLLBMeTUDop/yymEys4T+0j1vyXYfwN3s
         xMsVTBJduo2claH1bWH+zuYjCixR5QavJHW46j7UAlfxVRzubtla9Nz+9qnyRtV6Tba8
         phC5evGJvPGtqLa8X4v/qN5rZk2LFHIj3g2EAHujA9T7c1fyJJOg3t6JIFC2iFnwaBLs
         pNZHDvEauxEUBNwy5oQoAlLgX1VHMuc0RxsUsy7skYnfNZPWxmwm9RGp3Z+rxJSYI+qN
         YKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982927; x=1787587727;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IiNHZhXD4zVpU84b3/87tpD7H4RzexzgSBw04b8Zzk=;
        b=Vqomo+kkbYSP7EufDtGpODsr166bLuGaRGIA/v/aH7xIzPAYxfBsMApLWBbpj9tYtj
         /HYi8VhjCxEwEPUxizMhYSJb7JvU0bPoZemMjYC2tqMYeogQbtgd6K6oPGLEpInjuARP
         RTceppigqU5jT++EYdtD6/2gODJFT7vDgEehqiLQhhakKXUlEvVULFXkDwAC+N/5OLk1
         jko6nGMU/R0PFgoWOkXFQ6cWB7qpll19abvVWd/DxVDvCOvPCqTVu+TCwFiDGeUsNNfS
         YASHfRdLcy4t7sISY8d+xcKTIduGCFydaXXMH7F1PY+8ZyOfObVCdrTNa5bFQrs0K+GG
         XWUA==
X-Forwarded-Encrypted: i=1; AHgh+RoNhJcfidC8p6q1EBT+cf9JVP6mwKLnPkdXfTJr+BbFF+NgGKqLfAd/sWpbZfC3nnAwiUdjwzOLUu0P@vger.kernel.org
X-Gm-Message-State: AOJu0YxzBwIiTlDVFcNifZyr0Q6Q5F6crtvnKjZ9fDJ2EpFKldJkkjab
	vkU8RhLES9GglSPweIPo2W6oG3adGrLcnmgN6ApTB3hSpf1n7+kr57o9Uf7D8hVQbvLzSxHo1Qa
	K1iewdNVW4eFkgI887qaH5vRAGm4C9evJe8NFmHBF6GzOrmflIXXeYz4IxrQL5RR0
X-Gm-Gg: AR+sD13dGu6mmKnraCreX17EkYFUEnY2PDlUepzN72CJ+5jOxwpOsXy00AJNomBC70L
	4jpYrxWLZR9Hh0oJnhxbmvaxCWQf5Ph3ZQiAdOXd37YjrwiKy1/Dhwv0MblQP1QoNLKQZxaUfdi
	vMDJOi+FA3AgpVuILovSouvelpPQfwHjrJr0m1Qcfz0joXnSSG/dk4rS2xXoBXO/sxdQT/V4Sv6
	gv+MFYdhsGLCZu2Agpgs5s6+ZNIE2MTP0qoTg77i5sgcNCAaZE5CMZ01ERD6/3SBu49R8Roy+vz
	MKKkhPfBo8VwLeVLbL0nfWu5WxVb7xedQDutX/a6Um6lxhgMInLo0ttcfSLEiUHjjJyX/udCP0D
	zgEqri2S1pa9IkjPVTG06FJda
X-Received: by 2002:a05:6102:a4c:b0:745:17b0:10cc with SMTP id ada2fe7eead31-76f2df883ccmr1649139137.4.1786982927127;
        Mon, 17 Aug 2026 09:08:47 -0700 (PDT)
X-Received: by 2002:a05:6102:a4c:b0:745:17b0:10cc with SMTP id ada2fe7eead31-76f2df883ccmr1649134137.4.1786982926613;
        Mon, 17 Aug 2026 09:08:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea2cdcsm77637766b.18.2026.08.17.09.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 09:08:45 -0700 (PDT)
Message-ID: <79c3c201-395b-4a89-bd4f-0e64a59a1fa8@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 18:08:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-7-79a779d76173@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-next-patches-v1-7-79a779d76173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfXwFpUIasabW9h
 iyIc4WJQoaztXiWsTEKNvY4tNZLbq8U0X7J0Cm2Hvi5RzWhySBJvE0hLIZG7aoOGFZk8dBBvikt
 SaLBYfEGv+U6Ib6PGyf5LqCfjUXG8l+04E2uM+zAOl3XPlxbA9lAfkA1J3H/QHbEMxaRAlzJmlr
 YeAGruACShiWdE56W77U0EghXc84A0rm0CVWYi6rpWld1F4YwqgT7T8tGij9tXsjbxbuNUUs/mO
 GUSQp44rnjb2M5K/h7b1D8Nweo0glvT9y5kMT9TF7w7W9Y3KesT1MaI5C011UxpojMxaY3TLZJ5
 Q9tq2PJmjaw5flbThC9HoPmzp8P9VUguQWn37cfMMJS0lNBXeTQU/tiUl1pgApSqwK9fi8BKidS
 2LeYCtJMsCD5Zdt1VeSnZfi8xA5yAEgZbVkZjTeB8gR7HcBwKoLxfTYiX8hBVCjoJEfnM1Uspt5
 GBnhwUVJLri+0sYQU4g==
X-Proofpoint-ORIG-GUID: A99EMalXwtP4jyz2GkA0yjgpoXtviqWu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX/JOKpo5v1WXI
 8v76xmpdMRdxhVT/GA9lwxG9W4VZCNkJ4/tOgSG+byAxb1KmARhCjufXeEWRR0zxbq5ztpSfVrK
 21++N9qjx42F2XMHRfzcyqsKfR6Vk+g=
X-Proofpoint-GUID: A99EMalXwtP4jyz2GkA0yjgpoXtviqWu
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a83320f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=mdXfIj6UjNWI-6idB5UA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170123

On 8/10/26 6:55 PM, Adam Skladowski wrote:
> Add a devicetree for the Xiaomi Redmi 9T smartphone, which is based
> on the Bengal/SM6115 SoC.

[...]

> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		framebuffer0: framebuffer@5c000000 {

Please add a \n above


> +			compatible = "simple-framebuffer";
> +			reg = <0 0x5c000000 0 (2340 * 1080 * 4)>;
> +			width = <1080>;
> +			height = <2340>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
> +		};
> +	};
> +
> +	backlight_dsi: backlight-dsi {
> +		compatible = "led-backlight";
> +		leds = <&led_backlight>;
> +		brightness-levels = <255>;
> +		default-brightness-level = <190>;
> +		/* Backlight controllers can differ between panel variants */

Should we at least enable it now to make the backlight level controllable?



> +		status = "disabled";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_n>;

property-n
property-names

in this order please

[...]

> +&usb_dwc3 {
> +	maximum-speed = "high-speed";
> +	dr_mode = "peripheral";
> +	/delete-property/ usb-role-switch;
> +	phys = <&usb_hsphy>;
> +	phy-names = "usb2-phy";
> +	ports {
> +		/delete-node/ port@1;
> +	};

I think if you assign the supplies to the qmpphy none of this should be necessary

Konrad
