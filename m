Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06F4756C2
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 12:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105653; cv=none; b=SRrZ2LBfLlYplj4aD6gmY15JAkMJYYVsnmCB2KtXuYiSEteofk8fhihAELvaFAXcAxfbapPVokxuiOHu3iNo+498gJCZEYIYoXrdykmTEINpLlCUqrvdolhaOWwdFZrfktcbOrHMznqtcAdKPqGa7D45UlSkDridrCXhW0gy3MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105653; c=relaxed/simple;
	bh=5QHgAD7RH9HO00OejbCjm381HWXkjdORGiNJ3SolEfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfhiPR1ZMBMliqcSMQAKbXVaeUrcmSH4A7akd7oftXVX164Q6mJcNoniERDdyJxJbqw2H7JQCkXjJZa+lFACguawO8FWbJpJIw0j3RDfflGqxwiiX/twuCiijIxs/A8OYuBcZ2rm/kj7PtXTPhhjjpNutXg2XrZpiOX0ep5Hj9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VO8n7TRN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyAe8rIn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VO8n7TRN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyAe8rIn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778Ax5m3253810
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 12:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWhrQ5oZJ4OcodbYVFGeyGVtUwUyxWBQ54DXP3aMp0I=; b=VO8n7TRND5AA76sg
	F6Z5OOQiMWvMFOAIi75liJDz44UNFtsLKQDZdwRqJ2R0no/oYarA7NKx3v805IPY
	oo+vmrlL2R582xeSg4lIBq+fU+XZRDbngWtCp2ZB0GEJPGiwfLO0sK8z7N87Bgft
	PiJsWZNNRxiJmONGUZnh7lB1VfDI7KwJ7ovLedxOaj8WGk4JHTSr1oeznMO0zbjV
	MKShGe1wTgrBsNf/yFvTQjgjcncbv9tdNFvXMH4FAbfwXdEmLx1Ko7hRKy48RGsw
	skm14IWbOZnGdhV0xSMxqFNplCPUZIn3hUT4JYSv3WSGGWzgxWX40bbzA29orArE
	wHKYFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6k3wud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 12:27:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso39738071cf.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 05:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786105637; x=1786710437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWhrQ5oZJ4OcodbYVFGeyGVtUwUyxWBQ54DXP3aMp0I=;
        b=ZyAe8rInPObo9OttC/ACnwdIP7uCWb80jeSDypc0M984wAXmGPsbvWol+CdEIQ839o
         JKcl0DyGXgMSRiU97ol8/kkxTFRrV8ILj3WdB0RXZiOYj/A+niE76068BuxlorwZOVtj
         xU8THd5P2yhkZU6muMyX1H0Tjh21JJXsbvC00I/VHuuhFvuCatj0F22mrXs806hPq/O0
         59YFyp6915wFhG7zeNGUubNi1B2hedGueKa7vTg77/kq9SJK1rttvo1loeCL6HEe0E5O
         PqA9UmBjpHEed4C8LvuEhU0VnHXbhMn+l6lJlxsThI6vZb8K43FS0WOdlbwzmdE8x+Sh
         28vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786105637; x=1786710437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWhrQ5oZJ4OcodbYVFGeyGVtUwUyxWBQ54DXP3aMp0I=;
        b=LVpUKh0J7OnBPppkvRK8mKRdPVNb3T1ZfDnqZlrBGmjbXML02c5JgBUtq9gKnILa68
         jlqUg1x35RRDbpgJzcnpwlG9Hf5QrcNIZS2w3yWs1MqDmA/8Y3jOdkzntxoVyqx+2vSm
         N9tXTpXy+34hvB7lSoxjwQK/mlH337xD9KYjjLtCTg7dEtZzsAPnPlhVse7mfgr0N8/2
         TDfVEKMmSpM+Vlk4ipdyoo6T84ekJMhcucPOg7O3HJMdYc+TuoeKGzOsqLQ8dt1lzVFp
         3XAeDL6AWPVlgBDvhi+8+GVw6N5sbt7IY4yjipdFw9+rijFQXKE9+bKSp8O834VhUOS+
         fFYA==
X-Forwarded-Encrypted: i=1; AHgh+RpzPR3kthPhxVka220cuiMxb4da2g3EfJ/RrR0SX+k09X+wqJiLiClmdip39kkPoUK7Q0/u1FTj55Yk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj/L8Ecf+m0E76vBbGQK/8elTfpB5umLr7Zf9TAlIuXEHKBbf/
	HU2IB9EdGlCqkYnSv6osgAwpZpZW/0tkAsvnFszMXYARxI72/NRKzlAdy5Uf34MqQpSNADSpXZD
	ABPBoSy449+AR7DpwDxtSjJ7Nb45lyRkDkybhpEK2MhZZ3PibixX93OFQRBdhq4DI
X-Gm-Gg: AR+sD10xQRFmmW2cv5g9XvxYf8KWH2Sjas8+ZRcNix7P/xSiUrlw7K4dP6caZ7IpYta
	KteL3q2YAnf1+ldTzHwhy1GgG2BSoR2vOR+ppkFjAvuwTgvLc/d2RC9xym7co5ascHPh8EQAjOC
	hzyLk2SA1kpTMewq1ysECoZG5a034GvxPH3X846t3oTXBBXxTU1PJ+OVscVJFhzjsgEniXto24G
	gCutl+IIoWRCF7qWR9m6c8C1TZAD5jS1XY/pfiaINIKsCOgXk9uuet11sTL5bUB4Ea92dhBNs/C
	3ME4GPuCCKT6Y78Yn2leqy8C3q2zhoZtRk7pYsSlgAW18BxHC1d9MIfKC9zyV2SF0uwTsijDUUK
	jL1QPpXkTGF5vX8oPsd7QzIS2D8uSBA5XIibMkykP3CYqIg==
X-Received: by 2002:a05:622a:2612:b0:529:e058:d185 with SMTP id d75a77b69052e-52ce6108b6fmr262686811cf.24.1786105637137;
        Fri, 07 Aug 2026 05:27:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:529:e058:d185 with SMTP id d75a77b69052e-52ce6108b6fmr262685701cf.24.1786105636517;
        Fri, 07 Aug 2026 05:27:16 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c8bcca6sm41534105e9.4.2026.08.07.05.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:27:15 -0700 (PDT)
Message-ID: <727d6bc8-4682-4fed-97a1-e16efab8fbb2@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:27:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: amlogic: Add support for A9 thermal
 controller
To: xianwei.zhao@amlogic.com, Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260730-a9-thermal-v1-0-d786d37cba58@amlogic.com>
 <20260730-a9-thermal-v1-2-d786d37cba58@amlogic.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260730-a9-thermal-v1-2-d786d37cba58@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RpX16imK c=1 sm=1 tr=0 ts=6a75cf25 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=BY5PBP3jAAAA:8 a=a5WAP96V9kihPZHeLm0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=gQW0MTutLl7eKD3OLfcZ:22
X-Proofpoint-ORIG-GUID: BbVmfECFJcxjkPgspl7qLXyz1-kL7TJm
X-Proofpoint-GUID: BbVmfECFJcxjkPgspl7qLXyz1-kL7TJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5NyBTYWx0ZWRfX4iyWjnek6G2l
 Yn12mc7KDDDTbIhDrIZqgu/lsXQ1g88uo/RwCwK2Agroch2ntFviMCD9j2sTPOLNLPM5QoElYlO
 uW6j1TCv6OM3KZWAumT8h9yfmz1Xyl1siMb6cR3iTFyAy+NKVFJ6x9Bv+m0eq9lyDvA41nAwvOV
 FEnvw5UnGdBQpStZU7bryVIPE5sDUBmPaJfnO4b94tVWpMTCu4jGHceshv3xJyHW1uCVLD17WQk
 ZFeNFG2jKMtsLZhKNicJ/+wv8CEHnKjlXMST80jCx9aczo/rRuX8L/D0h6/+urGWC4wuF8+ocJR
 Q1DkjeIzYSxIWZaYpCJ2nf/rjomBQr48/oj7YBia69VuY0S50iXPyFimCDKCd/6Br3KBC+XlaJ3
 2y3nfwK+1JWvKsXgFcbl5ri9Csc+i/V75evbzy2o+uyMmlI3ijLBr0VwigIX4tFNtOeTxEi3Rkd
 83CvbAkqTHMT+tEEd/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5NyBTYWx0ZWRfX6UKyvPxXxf11
 zlBRqqF7kjjjel3vSvsjVjkIdXR9/qlu3w2kpEh0XWAdF61z8zkauZW3pGRCe3UsbOuU9K+MNL7
 5fvvb7W4K9w3iA9IYjq3OogdxyfXG1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070097

On 7/30/26 10:34, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add support for the Amlogic A9 thermal controller.
> 
> The A9 thermal controller uses different calibration parameters, requires
> separate core and bus clocks, and supports a hardware over-temperature
> reset mechanism.
> 
> Add the A9 calibration data, retrieve the clocks by name, and configure
> the hardware reset temperature through the optional 'amlogic,hw-reset-temp'
> DT property. When the property is absent, use the default reset temperature
> of 110°C.
> 
> Also restore the hardware reset configuration after resume.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/thermal/amlogic_thermal.c | 107 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 104 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index a0b530624b60..c9c351496653 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -45,6 +45,18 @@
>   		 TSENSOR_CFG_REG1_DEM_EN |	\
>   		 TSENSOR_CFG_REG1_CH_SEL)
>   
> +#define TSENSOR_CFG_REG2			0x8
> +	#define TSENSOR_CFG_REG2_HITEMP_EN	BIT(31)
> +	#define TSENSOR_CFG_REG2_REBOOT_EN	BIT(30)
> +	#define TSENSOR_CFG_REG2_REBOOT_CODE	GENMASK(15, 4)
> +	#define TSENSOR_CFG_REG2_REBOOT_TIME	GENMASK(23, 16)
> +	#define TSENSOR_CFG_REG2_ENABLE		\
> +		(TSENSOR_CFG_REG2_HITEMP_EN |	\
> +		 TSENSOR_CFG_REG2_REBOOT_EN |	\
> +		 TSENSOR_CFG_REG2_REBOOT_TIME)
> +
> +#define TSENSOR_TEMP_CAL		1
> +
>   #define TSENSOR_STAT0			0x40
>   
>   #define TSENSOR_STAT9			0x64
> @@ -63,6 +75,7 @@
>   
>   #define TSENSOR_CALIB_OFFSET	1
>   #define TSENSOR_CALIB_SHIFT	4
> +#define TSENSOR_HW_RESET_DEFAULT_TEMP	110000
>   
>   /**
>    * struct amlogic_thermal_soc_calib_data
> @@ -93,6 +106,7 @@ struct amlogic_thermal_data {
>   	const struct amlogic_thermal_soc_calib_data *calibration_parameters;
>   	const struct regmap_config *regmap_config;
>   	bool use_sm;
> +	bool has_sysclk;
>   };
>   
>   struct amlogic_thermal {
> @@ -101,8 +115,10 @@ struct amlogic_thermal {
>   	struct regmap *regmap;
>   	struct regmap *sec_ao_map;
>   	struct clk *clk;
> +	struct clk *sysclk;
>   	struct thermal_zone_device *tzd;
>   	u32 trim_info;
> +	u32 temp_code;
>   	struct meson_sm_firmware *sm_fw;
>   	u32 tsensor_id;
>   };
> @@ -138,6 +154,46 @@ static int amlogic_thermal_code_to_millicelsius(struct amlogic_thermal *pdata,
>   	return temp;
>   }
>   
> +/*
> + * Calculate a temperature code from a temperature value .
> + * The unit of the temperature is degree milliCelsius.
> + */
> +static u32 amlogic_thermal_millicelsius_to_code(struct amlogic_thermal *pdata, int millicelsius)
> +{
> +	const struct amlogic_thermal_soc_calib_data *param =
> +					pdata->data->calibration_parameters;
> +	s64 factor, uptat, uefuse;
> +	u32 temp_code;
> +
> +	uefuse = pdata->trim_info & TSENSOR_TRIM_SIGN_MASK ?
> +			     ~(pdata->trim_info & TSENSOR_TRIM_TEMP_MASK) + 1 :
> +			     (pdata->trim_info & TSENSOR_TRIM_TEMP_MASK);
> +
> +	factor = param->B + div_s64(millicelsius, 100);
> +	factor = BIT(16) * factor;
> +	factor = div_s64(factor, param->A);
> +	factor = factor - (uefuse & TSENSOR_TRIM_TEMP_MASK);
> +
> +	uptat = param->n * factor;
> +	uptat = div_s64(uptat, BIT(16));
> +	uptat = param->m - uptat;
> +
> +	factor = factor * 100;
> +	factor = div_s64(factor, uptat);
> +
> +	temp_code = ((factor >> 0x4) & TSENSOR_TEMP_MASK) + TSENSOR_TEMP_CAL;
> +
> +	return temp_code;
> +}
> +
> +static void amlogic_tsensor_setup_hw_reset(struct amlogic_thermal *data)
> +{
> +	regmap_update_bits(data->regmap, TSENSOR_CFG_REG2, TSENSOR_CFG_REG2_REBOOT_CODE,
> +			   data->temp_code << 0x4);
> +	regmap_update_bits(data->regmap, TSENSOR_CFG_REG2,
> +			   TSENSOR_CFG_REG2_ENABLE, TSENSOR_CFG_REG2_ENABLE);
> +}
> +
>   static int amlogic_thermal_enable(struct amlogic_thermal *data)
>   {
>   	int ret;
> @@ -254,6 +310,13 @@ static const struct amlogic_thermal_soc_calib_data amlogic_thermal_g12a = {
>   	.n = 324,
>   };
>   
> +static const struct amlogic_thermal_soc_calib_data amlogic_thermal_a9 = {
> +	.A = 9164,
> +	.B = 2747,
> +	.m = 370,
> +	.n = 270,
> +};
> +
>   static const struct amlogic_thermal_data amlogic_thermal_g12a_cpu_param = {
>   	.u_efuse_off = 0x128,
>   	.calibration_parameters = &amlogic_thermal_g12a,
> @@ -272,6 +335,13 @@ static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
>   	.regmap_config = &amlogic_thermal_regmap_config_g12a,
>   };
>   
> +static const struct amlogic_thermal_data amlogic_thermal_a9_param = {
> +	.use_sm			= true,
> +	.has_sysclk		= true,
> +	.calibration_parameters	= &amlogic_thermal_a9,
> +	.regmap_config		= &amlogic_thermal_regmap_config_g12a,
> +};
> +
>   static const struct amlogic_thermal_data amlogic_thermal_t7_param = {
>   	.use_sm			= true,
>   	.calibration_parameters	= &amlogic_thermal_g12a,
> @@ -291,6 +361,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
>   		.compatible = "amlogic,a1-cpu-thermal",
>   		.data = &amlogic_thermal_a1_cpu_param,
>   	},
> +	{
> +		.compatible = "amlogic,a9-thermal",
> +		.data = &amlogic_thermal_a9_param,
> +	},
>   	{
>   		.compatible = "amlogic,t7-thermal",
>   		.data = &amlogic_thermal_t7_param,
> @@ -305,6 +379,7 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	void __iomem *base;
>   	int ret;
> +	u32 reset_temp;
>   
>   	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>   	if (!pdata)
> @@ -323,9 +398,24 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>   	if (IS_ERR(pdata->regmap))
>   		return PTR_ERR(pdata->regmap);
>   
> -	pdata->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(pdata->clk))
> -		return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n");
> +	if (pdata->data->has_sysclk) {
> +		pdata->clk = devm_clk_get(dev, "core");
> +		if (IS_ERR(pdata->clk))
> +			return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get core clk\n");
> +		pdata->sysclk = devm_clk_get_enabled(dev, "pclk");
> +		if (IS_ERR(pdata->sysclk))
> +			return dev_err_probe(dev, PTR_ERR(pdata->sysclk), "failed to get pclk\n");
> +	} else {
> +		pdata->clk = devm_clk_get(dev, NULL);
> +		if (IS_ERR(pdata->clk))
> +			return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n");
> +	}
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "amlogic,hw-reset-temp", &reset_temp)) {
> +		dev_dbg(dev, "using default hardware reset temperature\n");
> +		reset_temp = TSENSOR_HW_RESET_DEFAULT_TEMP;
> +	}

Old SoC without the 'amlogic,hw-reset-temp' will now default to 
TSENSOR_HW_RESET_DEFAULT_TEMP

> +
>   
>   	if (pdata->data->use_sm)
>   		ret = amlogic_thermal_probe_sm(pdev, pdata);
> @@ -346,6 +436,10 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>   
>   	devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd);
>   
> +	pdata->temp_code = amlogic_thermal_millicelsius_to_code(pdata, reset_temp);
> +
> +	amlogic_tsensor_setup_hw_reset(pdata);

Somehow related to the above comment, should it be only for A9 ?

> +
>   	ret = amlogic_thermal_enable(pdata);
>   
>   	return ret;
> @@ -355,6 +449,8 @@ static void amlogic_thermal_remove(struct platform_device *pdev)
>   {
>   	struct amlogic_thermal *data = platform_get_drvdata(pdev);
>   
> +	if (data->data->has_sysclk)
> +		clk_disable_unprepare(data->sysclk);

Not needed, devm_ is used in the probe function

>   	amlogic_thermal_disable(data);
>   }
>   
> @@ -363,6 +459,8 @@ static int amlogic_thermal_suspend(struct device *dev)
>   	struct amlogic_thermal *data = dev_get_drvdata(dev);
>   
>   	amlogic_thermal_disable(data);
> +	if (data->data->has_sysclk)
> +		clk_disable_unprepare(data->sysclk);
>   
>   	return 0;
>   }
> @@ -371,6 +469,9 @@ static int amlogic_thermal_resume(struct device *dev)
>   {
>   	struct amlogic_thermal *data = dev_get_drvdata(dev);
>   
> +	amlogic_tsensor_setup_hw_reset(data);
> +	if (data->data->has_sysclk)
> +		clk_prepare_enable(data->sysclk);

Shouldn't the clock enabled before accessing the register in 
amlogic_tsensor_setup_hw_reset() ?

>   	return amlogic_thermal_enable(data);
>   }
>   
> 

