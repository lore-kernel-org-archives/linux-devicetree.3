Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C86C3A874C
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726693; cv=none; b=UXVA6PHj5wXR+p979CgA+f4GOGpgkPcPeNpj1ShW8qAMrl76OZqBDDRq5Qf0okAmWDuxOmJGo7TVjXWmtIgMO7LErumyVRNKfYZahvBoRFjVh56aT3JCSg1Od63bAkWRJOP5aG5moCUBvlcjrK5rS83oxxKlPpxF6ACDTWNj2Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726693; c=relaxed/simple;
	bh=RIK6AzKoWfic71CgwczoNE8t9J4BmYslv1IWqoPa434=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbOO4HBDv25NoSJ//b+55wQ0CL+BQ2DapUQIaqZkPEglRBT5g77JuogGpHPTNbmDZCIlq4gIahpOSkG9lGPtWQxMZFGcuhBv3YyzAkh7UlbWhIUJk8hCR7xgImkfR8mgdk3UZzq6xSIce62LJE2WhqECvKq7So9HnTGhLp8RYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPQxh9/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZTRZbjb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPQxh9/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZTRZbjb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aRaq2368186
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjPLHndmLVKQTG4TpiuHBOh11+YSR/gs656clgRuRBY=; b=BPQxh9/QX9qx323n
	AlpS8CL0dXRqKQYQx7sLhm6VFBFEuFqEPtpsB3fWvXVQPZpcydyvuQq4ikRebJ/n
	2C9k2/gaaRN5ka+JkoN4teZ9vH+6PbHs3MeSi0T4dCZXQy8bQ2oc7ofjVEDzbApy
	YOvmNLzaDgS3uyY4wp5pH2tE7c1VdhBHHQTKYH8mmav74kKm89MFurT+dN/P/2RS
	GbdEMUQcdapnWS/X7dqSxXTmGy32ukitikVXsqk/X5pL61zkJyUEI6So/zxCqTVf
	GPQurw7NuUcfRrRZ4c9S2yl/yZfXR6mLT12Gs8pDmPz0fPhCuPDDtjWvzqH8yzwC
	Rs4dyQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgr9vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:51:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e4045395cso3613496a91.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726690; x=1783331490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjPLHndmLVKQTG4TpiuHBOh11+YSR/gs656clgRuRBY=;
        b=MZTRZbjbgK/3w2NvGh0eV4mADjKukSx3qrGBDcWC/Jdr/n50Ws8iwdvUP1EdIKrvvj
         qWaUfW8Kwt2UjkHNV21pO05ZYYJkRtzRsIQcenM7gJsDH6B3oEq44j9qwrlJLwLRo90r
         qZgQbisknXD53nUxacb7fijjDx9N/4YSNNnyF4Dt0pc9l5EHzzIr6w0DyHoieEzF0dcw
         4xbl0qnbNpyEZh7LN8Htzs5tC6V3SRyj5HZnYvU2zGO1Hd4smKsnqQbj419M3huagtVO
         I7yozFUtPwsiuseVdmQ6aSYfhGNMG9kssBh65lS/AjjZ6J/IiiRy8TmKD3c0TmLQJBtG
         uiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726690; x=1783331490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjPLHndmLVKQTG4TpiuHBOh11+YSR/gs656clgRuRBY=;
        b=FZdJUFVQZvLOk6+98P02ixY+4l2sKZqbYy9BV9KpK+9uURvVd5KfhB2K3/GMO5tlxQ
         g4+reg5cc9coBXZoot+cwKFfRxjzKW6TVHyWIgC1TbJGGcoXQx1tjgCeAzUES7BKV+aO
         VW284TaRlEVpJLJn2EmXGOOs15JMqaXnkiiw6rq1w3QcLR8sHXDGpEVozljtFdU9/jMF
         Ulas/0OrDntvsw4BDv7RbRdlbbk5A1YPvRHYLuLmDJIvXKRhl6XM/y2EpzUTzH4LBls0
         1yZj05f/CJ4GeSxG93alUpc57gtYzrPZXb5aUDp8svRbQxzahOIwHo5vqSDvHxu2VlPM
         1R2A==
X-Forwarded-Encrypted: i=1; AHgh+RrYDFgqP4S8gKV4LbbH8ya2GoyrgNCYNLdQF51MeTsTCGeQR5hl3ItGMxxpUhnysstocvLvAxnUOI9F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VEGYHThYmQd3KQQGSJHga5MP+qQn7CCsbe6BmWi+g+sds2fG
	oTrTOQ3MeJSp7TObAisxiLnUM0vxhX4RDGaFoUliIa2QSRUYjAfa8Na6ZvTaTIcP2ViEf7l5n56
	sNuvNWgi+fitZctG/YU2cxoTXSw0NJExs3VYKIMSgdjipIotb0pt0A0gBVoiv4tDC
X-Gm-Gg: AfdE7cm+1I4PP+D8PZ+i4yI4kzDnajgE+cINA6WS3By8fXqXV36fZq53Vm+R7X4+AL8
	xWgV83po1v7dEbp4bTcva6LiPgYCT4mBtdLE6QvfyIXp6MWi/mQH74LNSVcIhc6cQZ7IDc/A2PV
	ZZnOAHSuGb985+TR/ELfo3jG9ZJSgOPkH7fnQKiwHlGymc1AuanwHvUcQdN2w4Z3lAa/n18Ru+J
	h9mNeyfsBv8Rsh41KbrQabliR/Wv/ENd9QLyI5I4YixIxbuJUV6W9l3hZAmF4+G58ylkiMf/Q6f
	jJ+gaS3cs/flWX5NhJFu4VoGfV37plqffJXnP9KsKvFP+X9hJEXMOEp7onj6SFOR16SqJ/hlViN
	utItKIMDbbDpRAdScO+kc9BLu91FtX9AYc+10EIwi
X-Received: by 2002:a17:903:32c4:b0:2c9:ff83:41e3 with SMTP id d9443c01a7336-2c9ff834537mr22842655ad.21.1782726689910;
        Mon, 29 Jun 2026 02:51:29 -0700 (PDT)
X-Received: by 2002:a17:903:32c4:b0:2c9:ff83:41e3 with SMTP id d9443c01a7336-2c9ff834537mr22842375ad.21.1782726689261;
        Mon, 29 Jun 2026 02:51:29 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c980f15234sm51913875ad.39.2026.06.29.02.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:51:28 -0700 (PDT)
Message-ID: <8236a2a1-040a-4ef3-ae14-41c1127a749b@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:21:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/panel: add Ilitek ILI7807S panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ayushi.makhija@oss.qualcomm.com,
        rajeevny@qti.qualcomm.com
References: <20260624-ili7807s-v3-0-ddf37052a289@oss.qualcomm.com>
 <20260624-ili7807s-v3-2-ddf37052a289@oss.qualcomm.com>
 <5pvhrsikc3spr5jworztun7pjpgnkfihxvqd3dthhn7yeoud56@vcajuuwqplvo>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <5pvhrsikc3spr5jworztun7pjpgnkfihxvqd3dthhn7yeoud56@vcajuuwqplvo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gPRn5yvfpk8gh1OEyBVcuARVptvzxcfa
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a424022 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yukSKlyBphtQfdkUWQ4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfXw22GjAWETt+B
 Uw0f5LOFOL+UPFa4ech9Sr57apysNtzrsav17BGj1HXDw2Zr9X8gUQR0kHSgH6SqqxY8Mb39Aii
 +dhA4NAddXttoUcW09veVo0uan8viHU=
X-Proofpoint-GUID: gPRn5yvfpk8gh1OEyBVcuARVptvzxcfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfXwubuIt7YEOjE
 C3/3/1XIdBaGGUH3msY7vk18e8/4bvERNQeqMerGyrIWF4ZY7rpSdTDvpmBFiSDqbVIYRk1TqPX
 IQxF63k3WGTwk2YOCVyfYWS0Fr0HeGRhpJn0iYhwzklYqayR/XzFaJkdoz3onKx7eDYcp6lXxhX
 nlEMvpBvBvwdVpd7uGx6y1SwsFYZgjzb9wrY456Gomi67hW0TL3V0eWow8MgEPs4BfXUt0wHViP
 cIsd+Q8ratAwUYliVCZCp0V7+MRLhaaCccKM3/llCIPl5cs7lmeFbd9JB5XmFmhZEwUbczfdBZ0
 eRQ1BgL38o1hKgpypUrJdWMt4akvhOM61RjQ+DcV3LsHZrjSnzW+N6PHZ2i6w9nnjJ+0cbdPrUz
 AAQsbrxc6JS7cqFGEWjVLeXnJnwxJoXVFjF2oXiU33cA6y9/62zXR/BescrJGcyIFg7M3fvCPUp
 ZNJJkl35Am/cQPQ1bFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290079

Hi Dmitry,

On 6/27/2026 2:11 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 24, 2026 at 02:23:52PM +0530, Arpit Saini wrote:
>> Add a DRM panel driver for the DLC DLC0697 1080x1920@60Hz MIPI DSI
>> panel based on the Ilitek ILI7807S display controller.
>>
>> The panel operates in video burst mode with four data lanes using
>> RGB888 pixel format.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/panel/Kconfig                 |  12 ++
>>   drivers/gpu/drm/panel/Makefile                |   1 +
>>   drivers/gpu/drm/panel/panel-ilitek-ili7807s.c | 293 ++++++++++++++++++++++++++
>>   3 files changed, 306 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>> index 7450b27622a2..1cbaac1bf545 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -264,6 +264,18 @@ config DRM_PANEL_HYDIS_HV101HD1
>>   
>>   	  If M is selected the module will be called panel-hydis-hv101hd1
>>   
>> +config DRM_PANEL_ILITEK_ILI7807S
>> +	tristate "Ilitek ILI7807S-based panels"
>> +	depends on OF
>> +	depends on DRM_MIPI_DSI
>> +	depends on BACKLIGHT_CLASS_DEVICE
>> +	help
>> +	  Say Y if you want to enable support for panels based on the
>> +	  Ilitek ILI7807S display controller, such as the DLC DLC0697
>> +	  1080x1920 MIPI DSI panel.
>> +
>> +	  If M is selected the module will be called panel-ilitek-ili7807s.
>> +
>>   config DRM_PANEL_ILITEK_IL9322
>>   	tristate "Ilitek ILI9322 320x240 QVGA panels"
>>   	depends on OF && SPI
>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>> index c2c5cf817116..c3002b351cb8 100644
>> --- a/drivers/gpu/drm/panel/Makefile
>> +++ b/drivers/gpu/drm/panel/Makefile
>> @@ -26,6 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) += panel-himax-hx83112b.o
>>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX83121A) += panel-himax-hx83121a.o
>>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
>>   obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
>> +obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7807S) += panel-ilitek-ili7807s.o
>>   obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
>>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
>> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
>> new file mode 100644
>> index 000000000000..8ddfab2693ec
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
>> @@ -0,0 +1,293 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/regulator/consumer.h>
>> +
>> +#include <drm/drm_mipi_dsi.h>
>> +#include <drm/drm_modes.h>
>> +#include <drm/drm_panel.h>
>> +#include <drm/drm_probe_helper.h>
>> +
>> +struct panel_desc {
>> +	const struct drm_display_mode *mode;
>> +	unsigned int lanes;
>> +	enum mipi_dsi_pixel_format format;
>> +	unsigned long mode_flags;
>> +	void (*init)(struct mipi_dsi_multi_context *dsi_ctx);
>> +};
>> +
>> +struct ili7807s {
>> +	struct drm_panel panel;
>> +	struct mipi_dsi_device *dsi;
>> +	const struct panel_desc *desc;
>> +
>> +	struct regulator_bulk_data *supplies;
>> +	struct gpio_desc *reset_gpio;
>> +};
>> +
>> +static const struct regulator_bulk_data ili7807s_supplies[] = {
>> +	{ .supply = "vddi" },
>> +	{ .supply = "avdd" },
>> +	{ .supply = "avee" },
>> +};
>> +
>> +static inline struct ili7807s *to_ili7807s(struct drm_panel *panel)
>> +{
>> +	return container_of(panel, struct ili7807s, panel);
>> +}
>> +
>> +static void ili7807s_reset(struct ili7807s *ctx)
>> +{
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>> +	usleep_range(10000, 11000);
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> +	usleep_range(10000, 11000);
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>> +	usleep_range(10000, 11000);
> This looks like the reset being active-low. Please define it as is in
> the DT and use normal (hold = 1, drop = 0) semantics in the driver.\
Ack.
>
>> +}
>> +
>> +static void dlc0697_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>> +{
>> +	mipi_dsi_dcs_soft_reset_multi(dsi_ctx);
>> +	mipi_dsi_msleep(dsi_ctx, 120);
>> +
>> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x78, 0x07, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x35, 0x00);
> mipi_dsi_dcs_set_tear_on_multi()
>
>> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5e, 0x09, 0x99);
> MIPI_DCS_SET_CABC_MIN_BRIGHTNESS
>
>> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
> MIPI_DCS_WRITE_CONTROL_DISPLAY
>
>> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0x01);
> MIPI_DCS_WRITE_POWER_SAVE
Ack.
>
>> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x51, 0x3f, 0xff);
> mipi_dsi_dcs_set_display_brightness_large_multi(). Also please use
> 0x1fff instead of the full brightness.
>
>> +
>> +	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
>> +	mipi_dsi_msleep(dsi_ctx, 120);
>> +
>> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
>> +	mipi_dsi_msleep(dsi_ctx, 20);
>> +}
>> +
>> +static int ili7807s_on(struct ili7807s *ctx)
>> +{
>> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>> +
>> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> Drop, set it in probe()
Ack.
>
>> +
>> +	ctx->desc->init(&dsi_ctx);
>> +
>> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> Drop
>
>> +
>> +	return dsi_ctx.accum_err;
>> +}
>> +
>> +static int ili7807s_off(struct ili7807s *ctx)
>> +{
>> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>> +
>> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> Drop
>
>> +
>> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>> +	mipi_dsi_msleep(&dsi_ctx, 20);
>> +
>> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>> +	mipi_dsi_msleep(&dsi_ctx, 120);
>> +
>> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> Drop
>
>> +
>> +	return dsi_ctx.accum_err;
>> +}
>> +
>> +static int ili7807s_prepare(struct drm_panel *panel)
>> +{
>> +	struct ili7807s *ctx = to_ili7807s(panel);
>> +	int ret;
>> +
>> +	ret = regulator_bulk_enable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
>> +	if (ret < 0) {
>> +		dev_err(ctx->panel.dev, "failed to enable regulators: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	msleep(20);
>> +
>> +	ili7807s_reset(ctx);
>> +
>> +	ret = ili7807s_on(ctx);
>> +	if (ret < 0) {
>> +		dev_err(ctx->panel.dev, "failed to initialise panel: %d\n", ret);
>> +		goto err;
>> +	}
>> +
>> +	return 0;
>> +
>> +err:
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> +
>> +	regulator_bulk_disable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
>> +	return ret;
>> +}
>> +
>> +static int ili7807s_unprepare(struct drm_panel *panel)
>> +{
>> +	struct ili7807s *ctx = to_ili7807s(panel);
>> +	int ret;
>> +
>> +	ret = ili7807s_off(ctx);
>> +	if (ret < 0)
>> +		dev_err(ctx->panel.dev, "failed to disable panel: %d\n", ret);
>> +
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> +
>> +	regulator_bulk_disable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ili7807s_get_modes(struct drm_panel *panel,
>> +			      struct drm_connector *connector)
>> +{
>> +	struct ili7807s *ctx = to_ili7807s(panel);
>> +
>> +	return drm_connector_helper_get_modes_fixed(connector, ctx->desc->mode);
>> +}
>> +
>> +static const struct drm_panel_funcs ili7807s_panel_funcs = {
>> +	.prepare = ili7807s_prepare,
>> +	.unprepare = ili7807s_unprepare,
>> +	.get_modes = ili7807s_get_modes,
>> +};
>> +
>> +static int ili7807s_bl_update_status(struct backlight_device *bl)
>> +{
>> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
>> +	u16 brightness = backlight_get_brightness(bl);
>> +	int ret;
>> +
>> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>> +
>> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
>> +
>> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct backlight_ops ili7807s_bl_ops = {
>> +	.update_status = ili7807s_bl_update_status,
>> +};
>> +
>> +static struct backlight_device *ili7807s_create_backlight(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	const struct backlight_properties props = {
>> +		.type           = BACKLIGHT_RAW,
>> +		.brightness     = 0x3fff,
>> +		.max_brightness = 0x3fff,
>> +	};
>> +
>> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
>> +					      &ili7807s_bl_ops, &props);
>> +}
>> +
>> +static const struct drm_display_mode dlc0697_mode = {
>> +	.clock = 131911,
> = (1080 + 18 + 2 + 16) * (1920 + 26 + 4 + 20) * 60 / 1000
Ack.
>> +
>> +	.hdisplay    = 1080,
>> +	.hsync_start = 1080 + 18,
>> +	.hsync_end   = 1080 + 18 + 2,
>> +	.htotal      = 1080 + 18 + 2 + 16,
>> +
>> +	.vdisplay    = 1920,
>> +	.vsync_start = 1920 + 26,
>> +	.vsync_end   = 1920 + 26 + 4,
>> +	.vtotal      = 1920 + 26 + 4 + 20,
>> +
>> +	.width_mm  = 0,
>> +	.height_mm = 0,
> Do you really don't know the dimensions of the panel you are
> contributing?

Ack, will update in v4.

Thanks

Arpit

>> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
>> +};
>> +
