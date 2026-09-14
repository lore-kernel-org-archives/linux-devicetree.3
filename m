Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4253C442388
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384988; cv=none; b=uDZp1K5gMjh6ko2M9U9dThN/a7Vo0Dv2HoB4yY5kzYKRbqhZgfOOHBsMXLEz9d17CLSl0nV4FWOlJJmEy0aPKpgkykrnTmZMihA94OJBNmlzoMFsMgBbH34qXoN61zc9246ZMsLF9tuvYk1hz6wf9GM4m5vbBtgo5F0Ry7HFeRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384988; c=relaxed/simple;
	bh=qB15Tu0wQgvflvACMlEZFwV6PZUUfZT9UV5fY5oJj88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQxC7IIS5wnktkYvoegA1MhRWoCxJ73oaaWb+XBDoUVyamGt4iTYCqI23NW4QPJxiup/GIFLuW0qarXjFcmD4q3gpc0HDzhYzQnGqIlHiPfq/WaFGYxdd+yyeCMFO//K2MDfb5mf04bYjhXddly15x0AvI9m/WnZmqb2gLuOqRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6eXEJqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoJZYOV7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6eXEJqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoJZYOV7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8Da530990
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	htoucfNJ1NBOznj2ucEtPoE5fys137bATrwbrwYNEEg=; b=V6eXEJqaW52sruVW
	KmAWqHedQKN92ge5YENWkiPjd+G4FUiYoi+rXuXHOXCHct/s2ruBO47fL403iyAH
	2SylfxfndayU9tuNs74mBf0Xj12d3kC5/2MhrMELYG8moOkZhHp5DR7YyqO0kNHs
	0Lw7qkc35AhQS+AgFCbu3IoOaFGpMQF7HP0nvezpOH9EjkcQG7/eI1EGSaOHqhHE
	tAFRbnOZo/0zdY6LMW69aKrcmdFxfdNVAuR98oQs9x/NZr3V+VuTPtOnn+xGBeb6
	5M5JFDIf2VvoFSBwfEjJixhhuEPdxOYVn7knVSt6iSa8pTvUSJQzCq5yrtQwVTO8
	3nO8Vw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst6ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:23:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106a836457so8828856d6.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384984; x=1789989784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htoucfNJ1NBOznj2ucEtPoE5fys137bATrwbrwYNEEg=;
        b=QoJZYOV7BnyzLLdIW+yvPVPt2qscLvhJScHXWa/lngGWPHXlJ10REiz+Z2MK+bEMWd
         vb9WpVF09f4IkqoN553BpFyr7kxTLta7w+8w0edbQBMtVzIe0HbnRu7mqLUWP55gFHBj
         QBgNC6njAKbVGI9wzixzzHV/O/byIte3d9DToyNKaVfBCZ4vlAYMXEdRCxz1E4stScZA
         bdCrDSLb3nwe6ykEBHGaDRS/zEQ53YsnVp1A2W20iAfftUH/eWawdHXg2bM1CqCDhrDZ
         xDQCZ/3kFfjzGm+9Lo7LRnxjA8KCtaJemxTMapRuQkM1Qlx/V3Tg/kxalufBa5ytCdDS
         q5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384984; x=1789989784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htoucfNJ1NBOznj2ucEtPoE5fys137bATrwbrwYNEEg=;
        b=fWd4yIE76g2yXxv1hzByYijI9xfwJhbzyUhOeN1l9l/5+jbqaePVqrK/KiQb5BIdvx
         aWov3/zZCH9EdhocmPrf5Usq/9dGIrd5lgq1nUWnivCEpkFdlYHAGwGjDT0nsTBN9jq+
         M2fkFAadrQEUEgroCGhDM392SCVdhg3V8Fg/gvrOJvkVi06GkFyfKpwuD9nsSACOE9R4
         5zun25pXZOsaWE6CbL68kt9KROq110dO/SHwRPlECIvqAp+AxA5KjgBGcVwO9aO3AXXA
         J5M5CuFb5iHkTwoNKMbGxOwxuI88jwqRhO1NjrGAB19pt0jAj4Y6KcIwkRkxjDiT1ETM
         pU6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+5LzyXolEIUsbu3hjhh/zXSGE4+f921f8i8F5Z1Vnu4oIFgFWd8VkKiTWYgyRgm/5fvIeYYDJ7RFU@vger.kernel.org
X-Gm-Message-State: AFuF++ml8zOxSLXlReTfiKaGMvg0wy167gW+tg6wQcVVXcyxcUROq4OY
	2HhN8fwOeeotcI5y36IFiGtr4mX/qmuhAHQrBBrmFN8WXNcMxI2j20WohUMbsCkrCYUr60NFzAK
	R2/QiTxrOQ73fdbjBeVGgrHniDWveVxy8g/vaywIJSAVMjpmVlzgySJnh0b1egiUy
X-Gm-Gg: AYBFou0BIgDEsUsQG8L8KIaTlbtu7QaP+iAmEvoQyfShNMs5DU7YEYHm4OpRhaI4EI3
	5NZyGPA2yVEiKWwARohTjGE0PHnTXwIXf8uo1LXOqdRqpYL3UTWaEU0wSotYeSaDXDKWJSAzlUy
	2ZWSuvLVkrFsXJu7ENH7fIV2IWEkr5v6lL2YYOfYbK0XWo45wQqdQUWupC/B97NuW4bLeMnnWEU
	N50tVVQfl8IBnXodzFEaELaJxx1sQp5CeS6rnJ/xosESXXODyhkgaelji1Hy4r+0kHlLWkYOzD3
	3nvR75yXxnyMHZWIkNdGtl3ylbbLgQgfDYnHAqxV0dRayOmMh/zcUTkOL6r+tf7Kk3V+2QUFteO
	Mhr4T0vyq0PQGBWaxZIh/4Q==
X-Received: by 2002:a05:6214:4883:b0:912:1f0f:b204 with SMTP id 6a1803df08f44-9122e4ccd58mr27341326d6.1.1789384978925;
        Mon, 14 Sep 2026 04:22:58 -0700 (PDT)
X-Received: by 2002:a05:6214:4883:b0:912:1f0f:b204 with SMTP id 6a1803df08f44-9122e4ccd58mr27339976d6.1.1789384977653;
        Mon, 14 Sep 2026 04:22:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594f0fasm4216719a12.25.2026.09.14.04.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:22:56 -0700 (PDT)
Message-ID: <d0d7e3d0-15bf-4850-99ec-44d429c6bae1@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:22:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 20/20] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-20-0e742578b524@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-msm8952-initial-support-v1-20-0e742578b524@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfXwUF1Enmc40wk
 6CvC49iKOhLe1KqLYiRK/GN0/N1sfKm9d+MhwkxgCdiUr1pWi7M5yeFTseDM/gnjY7MpA79wTGc
 jw+0GDdWBIFCvEtLi5u6zhNG+zj+/mdrd648I1g1DmhDrufOMMsq20N9AgYFG7I3gbX4R7/F6rN
 UrC5c93NLx769vzOjm630N5+1ubcIsndEB0sBF/gHTJeCe/avbNAhkmkg9XYM8IhnKxcFxoY5z2
 2vmAsItwf6B4i7bLD6ET1Iyb/kuZG4II3dW1pWs7eIxHSD/yWmujhXk3aOtUX+HdlvNvVcJsH2b
 NeIYr3zdZFZuki33E+J82CnpzrLoZDPNSBFy8trdQousGL+8nYubH62PpvV74BVmnp/1HaNyQbR
 y2S4NZ9/FKQjsOKi6+vv6v/ZUmZP+hRSAFDFhZNlcZl7wGbkKf8dOU2BNHYtW4K47ftW8qv1VDg
 8cxoDSv4jlWlY9xkVvQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d918 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OuZLqq7tAAAA:8 a=orgwjQpZXFS75ENpSOkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: l1n6iJ8wofC4TP8KubLVz74AORnRHxff
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfX1/ke5o8v/VVW
 LBp3b6ww/ZMAk/cxJF27Ogc1AxMFfLM8S0R7xs8An8ELRP6zioj45+4qgOS0DtuXekxy5ExaZn3
 zkRRgGbFFb+MXOxInQRQS1864LI6m9w=
X-Proofpoint-ORIG-GUID: l1n6iJ8wofC4TP8KubLVz74AORnRHxff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140161

On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add General Mobile Shamrock (GM 5 Plus).
> Shamrock is designed similar to L9300.
> Downstream reference is [1].

Please feel free to
wrap your messages at 72
characters, otherwise they are
a bit hard to read! :D

[...]


> +/ {
> +	model = "General Mobile GM 5 Plus (shamrock)";

It's not any "policy", but other DTs tend to only put the "pretty
name" here, without the codename


[...]

> +		framebuffer {
> +			compatible = "simple-framebuffer";
> +			memory-region = <&cont_splash_mem>;
> +
> +			width = <1080>;
> +			height = <1920>;
> +			stride = <(1080 * 3)>;
> +			format = "r8g8b8";
> +
> +			power-domains = <&gcc MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_VSYNC_CLK>,
> +					 <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_BYTE0_CLK>,
> +					 <&gcc GCC_MDSS_PCLK0_CLK>,
> +					 <&gcc GCC_MDSS_ESC0_CLK>;

Please align the '<'s, make sure your tab width is set to 8

[...]

> +	multi-led {
> +		compatible = "leds-group-multicolor";
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_INDICATOR;
> +		leds = <&red_status>, <&green_status>, <&blue_status>;
> +	};
> +
> +};

Stray \n above

[...]

> +&ramoops_mem {
> +	status = "okay";
> +};
> +
> +&adsp {
> +	status = "okay";
> +};
> +
> +&lpass_mem {
> +	status = "okay";
> +};

Please sort the label references alphabetically

> +
> +&pm8950_spmi_regulators {
> +	// PM8950 S5 + S6 = VDD_APC supply

Let's use /* C-style comments */

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <20 4>; // Downstream doesn't use 21,22,23. 24 is mdss_te

Let's keep a \n between the last property and the following subnode

[...]

> +	tpa6130a2_default: tpa6130a2-default-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +		output-low;

Drop this property, the driver will take care of it 

Konrad
