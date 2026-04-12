Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F61257844
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775956024; cv=none; b=XlxgvHJ/i/usgtPbvFosFRIkk+OWgAD5zOcyu+Lo39yg1AI/DB9txbdy1Np2dRNGG76k/1APHlaOPW8pCuyQsXt+XhkRk3r0gIh9I5WYj3Eb433EQhQDfYgZJ33kdo16TvEJF52lQTJq6Sr3NlHACJaCFUaep2EGnPpT4/dh+j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775956024; c=relaxed/simple;
	bh=QDUhZKKvtr2X4IM8glTRV7TMMVZIqOuU1zNVoqUWBM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sf1AizTvlZn0xRY+Nbx82RG5CQ9C/hJUTizeWURDdyrXK9dUCceNLeTTjDshlc87NJzxFHArw3RJFjwmmhavvFJTyjfVkGz8lZBIyXc9Ck4GsN3jsX3pJCgXmLA5x6JVOLTOMnQIL/04QHKBm6LHL2lpvaOPtG1hZ4VzFYFEZX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDK5SyAt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAAjnHbK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDK5SyAt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAAjnHbK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BNqrW51594312
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 01:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cj8Mv/ie2mU8MZuhnfvt5j6+NsZ00dsXgrPHeC4p2KE=; b=bDK5SyAtxhPNqro1
	6lhbERpWBuOxd727/SN+AagqeMkwhsq11T80PHXYmWmgYQIDidfkzGbKUlSuOgLh
	81a5IIkZlY5ym4OmJE7vaSgSrr2ydiB/SllrKh5wmxACnts2QAkaTJqr6RSzATL3
	W5fZzRyXSeL3+SvF3r8Sh0fU5beg+tSouU9erl/8TwRgdTePokqXb25DQJzB/Y8s
	dV+0fTP1rn8OorLmkcB3CyhAk9uB5GeSLYiKYvlOG2egFzhvaq2FHhgVqaphNKgS
	0+N5u6OPx4utNo2Lj+XlTSsHDykiu6OuglzlhYnpasQRvxZBdXB/XxvxCUpd4CXp
	KyrFVQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkskvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 01:07:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e06219cbso9803265ad.3
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 18:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775956021; x=1776560821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cj8Mv/ie2mU8MZuhnfvt5j6+NsZ00dsXgrPHeC4p2KE=;
        b=eAAjnHbK0E2dnl4110m8G7lf4RyD4KCHQgzKLz6CC9tA75G7IJRQB52CEGcD2NEm07
         VhC46xwyE9QHLX1f/zjz6/FuH4H39h9rvCGaVSlC1k6vyra2DJpsPJ4Md7C3PJeUub6X
         ydGNiqXBO8nrPckmQ+JIIvvWZQyzdlhGgWJdBeprtawFxz3mCdRa6L+FN6YhrD+vA8wC
         NoKSuOOPUl5tQCe1Q+rcWfvK6BoYZFmFAz00g0dCnrVYUZgzJ7sK+d51Xswu4npwgJ6Y
         1blv70GiY5TaSV+nDLiH/WiPsSaphNCGYe670vydlfd9XQxuQtEEfWuhUc+hrZOXkd3n
         W66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775956021; x=1776560821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cj8Mv/ie2mU8MZuhnfvt5j6+NsZ00dsXgrPHeC4p2KE=;
        b=f81oYPQY+j/XHiPjY74/pinL7hRcPHPx7Cqz8zv3kCdbxzvqzvfI6QAVIT0TN57JSH
         QlPlX9QVs9IOQYmHYKMf5ciShXD087tppj6Ap4Shb46c6/YwV7ScKCqkqlEQipi5iH3U
         c0xwcsHKFDdWpDhKVs+ofAZqb9A0NHsaVxGHoBAeL4MpFHDx7SqghXj1aYU8vPKJgI0A
         q+D+ygkunA08ANBDISWUot85ed7qGfytBLuClYd/MTrbfUi9MYRb8o2zHNAr3aVZIw/3
         0WkwX5zdNAebWvhlpXuB0TYnMpA+qJ8yR0Ji8qxSJLPVnmJZt6rbW+PwmczVwYRR+3ZH
         QWgw==
X-Forwarded-Encrypted: i=1; AFNElJ/JFd4MD9eySeL72BmXDAKM/rbmin7Yd305Dhd4dd7ptthnUEk9gf6qmMnwPHsKZaGqKZK+QIDgY/DJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxPWO9Px7EORsJ2iQOGzd08lgwLblEO5zx6EfuCUy+r+3O3QAQq
	anV04Zn187k0RDk/nv8Q8kgDV/BlhfGFlT1MdmlY3JEY1Wds1ndH8ILWQSVLu49W407F5XlV5rb
	vJOJwERxZUeWd7rvZsCGEr+mKs9HrtlIkVNEtOcSzcB/nW9GphnDiIyUKsXD6Wb4s
X-Gm-Gg: AeBDietyJkwYsnxLk0GkYqH8KDKopyAj2FY2XZ4YPFzMg73Dn66fhssq8Bu/Tc3nU2i
	1wICzOb1j5PGSU4xCO0JP1pG9WUcAsU0e4CLqOvEZ5gh4VfyIc9Qba0CAzlVlTJPEMkKt71zbHT
	8g+DpglVd+fHSx4FZTSSE+NSJAKL891S2gvfMI2cGTi9fPODgT2FCyCiaE82CDVbdEp+/JBjanO
	n8Ny8vd6uRNt+Gqc8Nx8+wAodlH7X37nbBouIxh7xuw0T4oqhgdTK3UASssaLozAs1DHSeS3OBz
	pGGKhIeqg5YUxEUQ8LcDkhuePRXMdxNsFmNRxZBu0tJaDk1hHZiJhIVr84J82C2bwWYcUluxJYH
	+2Sxqe2fgwnYyFGbF7alWcPmoimP/bx7hZCkFBZoOiw+npZ34XrJq7G9J3OXbEaPS7K/4GTGBsk
	ceXfGzbzuNmg==
X-Received: by 2002:a17:902:a982:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2b2d59a0c3cmr64582095ad.15.1775956020869;
        Sat, 11 Apr 2026 18:07:00 -0700 (PDT)
X-Received: by 2002:a17:902:a982:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2b2d59a0c3cmr64581845ad.15.1775956020278;
        Sat, 11 Apr 2026 18:07:00 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f27048sm67859815ad.62.2026.04.11.18.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 18:06:59 -0700 (PDT)
Message-ID: <5d1dd70e-0300-4ca0-adb9-73f03cf4bf4d@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 09:06:51 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/21] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69daf035 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=f_8IO1HHPxn9Zh0c9RAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwOCBTYWx0ZWRfX9fRYAZXDSd8N
 IVaNh55baofnOloYbOOzsfVz5PtkkYSzHlUglGRtROzacmXtUg0k771gFCx9fUMXiAypcllOJEG
 JYpwPIcCDAfaid1fBs9l0MaZXOytPVlwBs56+znpOJXhLEJcduYBJ+CuEavWl2o/vNVGNZOKwPE
 lnfpx6dKc3UmgL2uPdj1wWMGW0NTyjxKi7ZncvuNAF8qtIfA+XQeDcMjzuD7CJEiUlbHZc2kMgC
 Yim6/WL4v/ZAcuC4oVxlLfz6tXrPz/wAdgNQSz9PJOK2Z5AGa+zz/JNRlaYRKzsGeDwWOTZAWgy
 Jx/jSkI2UAumhO7V0y0i+2WqBhF2HGOdd8lJaX3H+dqxlHhYZsuvifg6jwBc7+CDT0LpB8DTvSC
 IMGAUAqn1q0io+POXO23Y7ZvI28H9UBEwUaOrZTg/KaDrTjxbh+8WxPs22wjRJC9XKBDZAN+1h9
 fwrUa2OoGSaqwUvPi0w==
X-Proofpoint-ORIG-GUID: Vd-XeiHXMi8H-sOQQZWNsC5RG-mT9vNe
X-Proofpoint-GUID: Vd-XeiHXMi8H-sOQQZWNsC5RG-mT9vNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120008



On 4/11/2026 8:10 PM, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> controller, which controls power supplies to the panel and the touch
> screen and provides reset pins for both the panel and the touchscreen.
> Also it provides a simple PWM controller for panel backlight. Add
> support for this GPIO controller.
> 
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpio/Kconfig              |  10 ++
>   drivers/gpio/Makefile             |   1 +
>   drivers/gpio/gpio-waveshare-dsi.c | 208 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 219 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index dbe7c6e63eab..1b210c451151 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -805,6 +805,16 @@ config GPIO_VISCONTI
>   	help
>   	  Say yes here to support GPIO on Tohisba Visconti.
>   
> +config GPIO_WAVESHARE_DSI_TOUCH
> +	tristate "Waveshare GPIO controller for DSI panels"
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Enable support for the GPIO and PWM controller found on Waveshare DSI
> +	  TOUCH panel kits. It provides GPIOs (used for regulator control and
> +          resets) and backlight support.
> +
>   config GPIO_WCD934X
>   	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
>   	depends on MFD_WCD934X
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 20d4a57afdaa..75ce89fc3b93 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -207,6 +207,7 @@ obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
>   obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
>   obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
>   obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
> +obj-$(CONFIG_GPIO_WAVESHARE_DSI_TOUCH)	+= gpio-waveshare-dsi.o
>   obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
>   obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
>   obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
> diff --git a/drivers/gpio/gpio-waveshare-dsi.c b/drivers/gpio/gpio-waveshare-dsi.c
> new file mode 100644
> index 000000000000..f4a1d4d3b872
> --- /dev/null
> +++ b/drivers/gpio/gpio-waveshare-dsi.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Waveshare International Limited
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/err.h>
> +#include <linux/fb.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +/* I2C registers of the microcontroller. */
> +#define REG_TP		0x94
> +#define REG_LCD		0x95
> +#define REG_PWM		0x96
> +#define REG_SIZE	0x97
> +#define REG_ID		0x98
> +#define REG_VERSION	0x99
> +
> +enum {
> +	GPIO_AVDD = 0,
> +	GPIO_PANEL_RESET = 1,
> +	GPIO_BL_ENABLE = 2,
> +	GPIO_IOVCC = 4,
> +	GPIO_VCC = 8,
> +	GPIO_TS_RESET = 9,
> +};
> +
> +#define NUM_GPIO 16
> +
> +struct waveshare_gpio {
> +	struct mutex dir_lock;
> +	struct mutex pwr_lock;
> +	struct regmap *regmap;
> +	u16 poweron_state;
> +
> +	struct gpio_chip gc;
> +};
> +
> +static const struct regmap_config waveshare_gpio_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = REG_PWM,

.max_register = REG_VERSION,

check comments in probe

> +};
> +
> +static int waveshare_gpio_get(struct waveshare_gpio *state, unsigned int offset)
> +{
> +	u16 pwr_state;
> +
> +	guard(mutex)(&state->pwr_lock);
> +	pwr_state = state->poweron_state & BIT(offset);
> +
> +	return !!pwr_state;
> +}
> +
> +static int waveshare_gpio_set(struct waveshare_gpio *state, unsigned int offset, int value)
> +{
> +	u16 last_val;
> +	int err;
> +
> +	guard(mutex)(&state->pwr_lock);
> +
> +	last_val = state->poweron_state;
> +	if (value)
> +		last_val |= BIT(offset);
> +	else
> +		last_val &= ~BIT(offset);
> +
> +	state->poweron_state = last_val;
> +
> +	err = regmap_write(state->regmap, REG_TP, last_val >> 8);
> +	if (!err)
> +		err = regmap_write(state->regmap, REG_LCD, last_val & 0xff);
> +
> +	return err;
> +}
> +
> +static int waveshare_gpio_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int waveshare_gpio_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct waveshare_gpio *state = gpiochip_get_data(gc);
> +
> +	return waveshare_gpio_get(state, offset);
> +}
> +
> +static int waveshare_gpio_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +	struct waveshare_gpio *state = gpiochip_get_data(gc);
> +
> +	return waveshare_gpio_set(state, offset, value);
> +}
> +
> +static int waveshare_gpio_update_status(struct backlight_device *bl)
> +{
> +	struct waveshare_gpio *state = bl_get_data(bl);
> +	int brightness = backlight_get_brightness(bl);
> +
> +	waveshare_gpio_set(state, GPIO_BL_ENABLE, brightness);
> +
> +	return regmap_write(state->regmap, REG_PWM, brightness);
> +}
> +
> +static const struct backlight_ops waveshare_gpio_bl = {
> +	.update_status = waveshare_gpio_update_status,
> +};
> +
> +static int waveshare_gpio_probe(struct i2c_client *i2c)
> +{
> +	struct backlight_properties props = {};
> +	struct waveshare_gpio *state;
> +	struct device *dev = &i2c->dev;
> +	struct backlight_device *bl;
> +	struct regmap *regmap;
> +	unsigned int data;
> +	int ret;
> +
> +	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(dev, &state->dir_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_mutex_init(dev, &state->pwr_lock);
> +	if (ret)
> +		return ret;
> +
> +	regmap = devm_regmap_init_i2c(i2c, &waveshare_gpio_regmap_config);

for waveshare_gpio_regmap_config: .max_register = REG_PWM,

> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to allocate register map\n");
> +
> +	state->regmap = regmap;
> +	i2c_set_clientdata(i2c, state);
> +
> +	ret = regmap_read(regmap, REG_ID, &data);

REG_ID here is 0x98,

in _regmap_read -> regmap_readable will check the max_register, then 
return -EIO.

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read register\n");
> +
> +	dev_dbg(dev, "waveshare panel hw id = 0x%x\n", data);
> +
> +	ret = regmap_read(regmap, REG_SIZE, &data);

ditto.

Thanks,
Jie

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read register\n");
> +
> +	dev_dbg(dev, "waveshare panel size = %d\n", data);
> +
> +	ret = regmap_read(regmap, REG_VERSION, &data);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read register\n");
> +
> +	dev_dbg(dev, "waveshare panel mcu version = 0x%x\n", data);
> +
> +	ret = waveshare_gpio_set(state, GPIO_TS_RESET, 1);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to program GPIOs\n");
> +
> +	msleep(20);
> +
> +	state->gc.parent = dev;
> +	state->gc.label = i2c->name;
> +	state->gc.owner = THIS_MODULE;
> +	state->gc.base = -1;
> +	state->gc.ngpio = NUM_GPIO;
> +
> +	/* it is output only */
> +	state->gc.get = waveshare_gpio_gpio_get;
> +	state->gc.set = waveshare_gpio_gpio_set;
> +	state->gc.get_direction = waveshare_gpio_gpio_get_direction;
> +	state->gc.can_sleep = true;
> +
> +	ret = devm_gpiochip_add_data(dev, &state->gc, state);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to create gpiochip\n");
> +
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = 255;
> +	props.brightness = 255;
> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, state,
> +					    &waveshare_gpio_bl, &props);
> +	return PTR_ERR_OR_ZERO(bl);
> +}
> +
> +static const struct of_device_id waveshare_gpio_dt_ids[] = {
> +	{ .compatible = "waveshare,dsi-touch-gpio" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, waveshare_gpio_dt_ids);
> +
> +static struct i2c_driver waveshare_gpio_regulator_driver = {
> +	.driver = {
> +		.name = "waveshare-regulator",
> +		.of_match_table = of_match_ptr(waveshare_gpio_dt_ids),
> +	},
> +	.probe = waveshare_gpio_probe,
> +};
> +
> +module_i2c_driver(waveshare_gpio_regulator_driver);
> +
> +MODULE_DESCRIPTION("GPIO controller driver for Waveshare DSI touch panels");
> +MODULE_LICENSE("GPL");
> 

