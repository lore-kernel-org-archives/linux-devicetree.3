Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2182D595D
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 01:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775698008; cv=none; b=K597duczyLRB/z2pHqApOAl+Av9RRO7JmDPV2MVBTKV2LT5x0BCitSCjpVHx4D/SHYmBWW5sS0zCb1RB6VfcSrLQ2qSwDVARD9RS60c2PmMRDHtu2Z4nTz3ofKuZtrA6crThkK3Es62vAEXRA3asvs2Wdj4ns8JVZdixIjweG+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775698008; c=relaxed/simple;
	bh=c+qraEel5u5mqxsQj8Yt8B2EtBExGlmXunhJD8uSklo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zy0c0RjpcM6VlK7kiOnfAIIV3A4Ld6ZIbngoL5raZqy7a4VaKk5ibN8oejGY1MTr+Scgf8MTwNMfcBUDGza3xEr4ti6peWpGjaHDeEweKKlUznxNRUfFja9yiqX9HFhGE93f4E116Ve5Rp3AydILvmel5khoJ+CqWDyyyVfcEOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yt4Mh1Vm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNLmJgXN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yt4Mh1Vm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNLmJgXN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638Nl0jG1073261
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 01:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dDnk3ruHiHMF/0uvVDLmz4WG
	2YJ8OdFJaHFnUpJqBok=; b=Yt4Mh1VmXz4PfwqtPgBAIDJKxRJJ2Q6QTWS+zcr2
	gz7IrlP27jjHvxB2E0bgYIUDa0FJfeERLD5PD5/Yaj4vW+zmG66pTaivIEqUPCCv
	gRsIGvvwMBvxpBOG5NHT+4H659+Mq2Wm1ZNAY75GvApOZulebuJ5Eka4rHdeVSOz
	i1Dz1pHfPLu8JrtX9banqI4vyDlgK3IydqOsF+TNL2uCCKTXp/lTz55HXo7zjeYk
	NJNEVapvyvqyeGG5EP/1GFVhMKyoKjGX1rfAXqWN07qGRli1EGbFgWpBcndLJ00m
	DLkSWVKrTKwIhrRVHgOM6VKjUQesmPiwZlArzk+zJQlH4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb39t3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:26:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9d52ad9aso10776871cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 18:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775698005; x=1776302805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dDnk3ruHiHMF/0uvVDLmz4WG2YJ8OdFJaHFnUpJqBok=;
        b=hNLmJgXNRKi1jMTce4jOt/UQy2CbZ7UATqbJJuWsp28NRfTGJ6vpzm/Ic694Vwsx2A
         Op6oXfIwMu52L+aI5/VvzEvaUsH6Mx7H0iQ+Vz9qj9kxHtFEML+IS7/pgLUt8bnA3R6C
         1Tgdv0Hm2ulJZ8W8Wri/ldVzCqKvjFKcESpY/BBgtQN9XRyJylP6qEf5uF3e3SNaYijH
         wfX8FAVJsRWWQwFQc6MzI2X30N6N/98CKk4gID7UHadWNmb0dglVu9R5oZoBqDh+q9YY
         8GiBvPiG3A+krsSrxTsv6jZ5tsizVFOh0Y4N7sEAI78U+oSS3sPKipaThWPR6bwcCraG
         s6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775698005; x=1776302805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDnk3ruHiHMF/0uvVDLmz4WG2YJ8OdFJaHFnUpJqBok=;
        b=O3hYZbhmErIwwvLTPVCWxnTXDuXs5uBQGkf8yr3VG1DrjQU8/TtgN0BmhyiYMbibUX
         h8mf631g/AKFFxNJz4nUQlXl9OFV1yPH32TU50yg85/yB4qewT7cO1P2YZhhFqK+C1pI
         AISSgWtcB14SqfWwl96pf/e/JZnmLSWXWiL9/ln4Fjltrqp94nn8iDL4L0ZN9yOa319y
         pkrn0nzxatpP3/2rg7Yw0ApwnQw5t8a2MgHcaiaz9fCVDWhKawlG83Uh7YQ9UzH8F9PF
         OpYyMaRcS0yryKDqbqSEsV61qFUUSqn/IWXLMT+gHarlPbMnx4+H7BzOyGMsp7UaGiF5
         Z6QA==
X-Forwarded-Encrypted: i=1; AJvYcCUTt13bM5I2Di85m6qQbJ8/sBwNRASYx5+AOLRAfGDlBwxs0nFR3Ya/ObPT2upEmUZLZOVOJKeoXTul@vger.kernel.org
X-Gm-Message-State: AOJu0Ywii0S+OkjZcYd6M0dXGStLNvMTDUfjy3mP2pcVPJE3QrIIrz7k
	6KzUuzgCZs1kQknCPBixxTHw5Y8la/GDj1H9mGwipIRKOTPmtZs53o+K1FEtIc816/8taaIzOO1
	BPvg8ehZRobxkuK4GqzSl+K4TeGbSJTmCcbQkXOOKVHwAcnwg2tF7UgEZnrCMWUcT
X-Gm-Gg: AeBDiesoPWx79sgIoWb1C2uYaPI72HckQLzPIPjG8QaXNuC4HBIRnj/ujBKNtYu6tXE
	fpTlFCxRfz6Kb8aPi+lZlitnwU+N6AfItDeC/ABKP/25X81nbHCnZDWF4+a/l6/7xdv8D6KBgvd
	07GuRQm+mDUp0PWpL5YLe2PKyI3wZL1LycHpx+hu8l+5C1aiteEIJFFsjH8Wnxtp/jTYnK/ADqc
	3G5X0CkMVzm/4MzxtjV9AcnXy2TIIYGU9FiG1wajRjyNbQ7zY6J8YXySkJpyIinc9jtSoKX5ouj
	PpYDIXFhFOb32E/BoZNjuG7V5HPz6zUlhC40/vqSma+neocgkitSqLoEEV+2V5KRDsYKgeQWGBf
	Rhwa9bJhQdn8UIeqTCu6PhxQC7n+tkpZuqcsLYxmlF6MFZmLVYtVD0ZGkWJtn2M6HDcEQIxHjFs
	5qeJem8/wL24+C0YttJ4nNxFKt/xNv/k+1sHM=
X-Received: by 2002:a05:622a:5a8a:b0:50b:49c0:b6f0 with SMTP id d75a77b69052e-50d62b52891mr341037861cf.61.1775698004733;
        Wed, 08 Apr 2026 18:26:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5a8a:b0:50b:49c0:b6f0 with SMTP id d75a77b69052e-50d62b52891mr341037451cf.61.1775698004239;
        Wed, 08 Apr 2026 18:26:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd6799sm5085625e87.81.2026.04.08.18.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:26:41 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:26:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
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
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 19/19] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
Message-ID: <l6pezliurpgv2mopw2xl4gfgpki6r3v6ufpsaavj774qnxgept@h3jxxpco23oa>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-19-5e9119b5a014@oss.qualcomm.com>
 <CAMRc=Mcusnm-k76e6jTiwrw5xJL7f-nWBsg4=QpD08cv8pPgMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mcusnm-k76e6jTiwrw5xJL7f-nWBsg4=QpD08cv8pPgMw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxMSBTYWx0ZWRfX1Tflnhi8KKLv
 1pNTcy+JexszeA0y+A6R3qHpS8MvtRQKBttbwnwuG4vuvzMgWJxJw/hloejbCNcglUO3A0e5pk4
 JcQPGq9VMJRb4CjWT+ccG87QtlZxZ/h+7/G8sqMzJ/L48Z6utbAzdU1TGv6EPNNxfG2IXQWpLJM
 EmTm26k2M8uynFkgpzSUf/xh+kRGJpx+F40lZpCl6T6FVPHL6EQ4tf/ujF0SZEP9+YBXGQbrkTr
 5JukueBk2F73r5msqU2R7MLKsW4KcaTSyH2JUs6UTRoVzj6smne6n8RB7OENpQY0RK/+1qltfv8
 wbSWF0xOjYR3+oUVY6yiDGPQoSOa+ty+YQqLyGacItKRRZKFZwAUfFFteTpB0UMP2bwHzfPuO/J
 rqxYCCnerEEparFXhg54ZNhCmUQjVeuVw0csfYXOd0zs/v80AIxgLH2hXS7+L7CLCd1wtOu72Eq
 4/dH6S5FmZDAwZubwcw==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d70055 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=cggtC_SuP12cYYYmGtYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: U0ihdXViZe6FyDjabV5EdAXoWdvuYctU
X-Proofpoint-ORIG-GUID: U0ihdXViZe6FyDjabV5EdAXoWdvuYctU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090011

On Fri, Apr 03, 2026 at 08:30:22AM -0400, Bartosz Golaszewski wrote:
> On Wed, 1 Apr 2026 09:26:38 +0200, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> said:
> > The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> > controller, which controls power supplies to the panel and the touch
> > screen and provides reset pins for both the panel and the touchscreen.
> > Also it provides a simple PWM controller for panel backlight. Add
> > support for this GPIO controller.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpio/Kconfig              |  10 ++
> >  drivers/gpio/Makefile             |   1 +
> >  drivers/gpio/gpio-waveshare-dsi.c | 220 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 231 insertions(+)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 4c3f6ec336c1..f0bb5cdebf9b 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -804,6 +804,16 @@ config GPIO_VISCONTI
> >  	help
> >  	  Say yes here to support GPIO on Tohisba Visconti.
> >
> > +config GPIO_WAVESHARE_DSI_TOUCH
> > +	tristate "Waveshare GPIO controller for DSI panels"
> > +	depends on BACKLIGHT_CLASS_DEVICE
> > +	depends on I2C
> > +	select REGMAP_I2C
> > +	help
> > +	  Enable support for the GPIO and PWM controller found on Waveshare DSI
> > +	  TOUCH panel kits. It provides GPIOs (used for regulator control and
> > +          resets) and backlight support.
> > +
> >  config GPIO_WCD934X
> >  	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
> >  	depends on MFD_WCD934X
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index 20d4a57afdaa..75ce89fc3b93 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -207,6 +207,7 @@ obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
> >  obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
> >  obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
> >  obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
> > +obj-$(CONFIG_GPIO_WAVESHARE_DSI_TOUCH)	+= gpio-waveshare-dsi.o
> >  obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
> >  obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
> >  obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
> > diff --git a/drivers/gpio/gpio-waveshare-dsi.c b/drivers/gpio/gpio-waveshare-dsi.c
> > new file mode 100644
> > index 000000000000..30fe7569c150
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-waveshare-dsi.c
> > @@ -0,0 +1,220 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2024 Waveshare International Limited
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/err.h>
> > +#include <linux/fb.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +
> > +/* I2C registers of the microcontroller. */
> > +#define REG_TP		0x94
> > +#define REG_LCD		0x95
> > +#define REG_PWM		0x96
> > +#define REG_SIZE	0x97
> > +#define REG_ID		0x98
> > +#define REG_VERSION	0x99
> > +
> > +enum {
> > +	GPIO_AVDD = 0,
> > +	GPIO_PANEL_RESET = 1,
> > +	GPIO_BL_ENABLE = 2,
> > +	GPIO_IOVCC = 4,
> > +	GPIO_VCC = 8,
> > +	GPIO_TS_RESET = 9,
> > +	NUM_GPIO = 16,
> 
> Why is this part of an enum?

I'll move this out of the enum.

> 
> > +static int waveshare_gpio_set(struct waveshare_gpio *state, unsigned int offset, int value)
> > +{
> > +	u16 last_val;
> > +
> > +	mutex_lock(&state->pwr_lock);
> 
> Can you use guards for locks?

Yes

> 
> > +
> > +	last_val = state->poweron_state;
> > +	if (value)
> > +		last_val |= BIT(offset);
> > +	else
> > +		last_val &= ~BIT(offset);
> > +
> > +	state->poweron_state = last_val;
> > +
> > +	regmap_write(state->regmap, REG_TP, last_val >> 8);
> > +	regmap_write(state->regmap, REG_LCD, last_val & 0xff);
> 
> I2C regmap writes can fail and their return value should be checked.

Ack.

> 
> > +
> > +	mutex_unlock(&state->pwr_lock);
> > +
> > +	return 0;
> > +}
> > +

[...]

> > +
> > +static int waveshare_gpio_update_status(struct backlight_device *bl)
> > +{
> > +	struct waveshare_gpio *state = bl_get_data(bl);
> > +	int brightness = backlight_get_brightness(bl);
> > +
> > +	waveshare_gpio_set(state, GPIO_BL_ENABLE, brightness);
> > +
> > +	return regmap_write(state->regmap, REG_PWM, brightness);
> > +}
> > +

[...]

> > +static int waveshare_gpio_probe(struct i2c_client *i2c)
> > +{

[...]
> > +
> > +	dev_dbg(dev, "waveshare panel mcu version = 0x%x\n", data);
> > +
> > +	state->poweron_state = BIT(GPIO_TS_RESET);
> > +	regmap_write(regmap, REG_TP, state->poweron_state >> 8);
> > +	regmap_write(regmap, REG_LCD, state->poweron_state & 0xff);

And this can become waveshare_gpio_set().

> > +	msleep(20);
> > +
> > +	state->regmap = regmap;
> > +	state->gc.parent = dev;
> > +	state->gc.label = i2c->name;
> > +	state->gc.owner = THIS_MODULE;
> > +	state->gc.base = -1;
> > +	state->gc.ngpio = NUM_GPIO;
> > +
> > +	/* it is output only */
> > +	state->gc.get = waveshare_gpio_gpio_get;
> > +	state->gc.set = waveshare_gpio_gpio_set;
> > +	state->gc.get_direction = waveshare_gpio_gpio_get_direction;
> > +	state->gc.can_sleep = true;
> > +
> > +	ret = devm_gpiochip_add_data(dev, &state->gc, state);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to create gpiochip\n");
> > +
> 
> This driver looks like it could be easily converted to use gpio-regmap and
> become much shorter in the process. Could you please take a look at
> linux/gpio/regmap.h?

I took a glance. It is a nice wrapper, but I think being able to call
waveshare_gpio_set() internally without extra troubles overweights the
bonuses of the wrapper. Also, I'd agree if there were extra complexity
here (e.g. the stride or the in/out handling), but having just the out
GPIOs doesn't seem to warrant it.

An alternative would be to split away the backlight into a separate
pwm-backlight device. Then having waveshare_gpio_set() isn't that
important and thus I could switch to GPIO_REGMAP. But then... We don't
have real control over the PWM. We are really programming some values,
with the actual PWM duty cycle calculations being handled internally.

With all that in mind, unless you really insist, I'd prefer to leave
this part the driver as is.

> 
> > +	props.type = BACKLIGHT_RAW;
> > +	props.max_brightness = 255;
> > +	props.brightness = 255;
> > +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, state,
> > +					    &waveshare_gpio_bl, &props);
> > +	return PTR_ERR_OR_ZERO(bl);
> > +}
> > +

-- 
With best wishes
Dmitry
