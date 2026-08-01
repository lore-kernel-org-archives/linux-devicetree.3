Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CC3231A3B
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618945; cv=none; b=kCyyhbqeh0rHPnY12e3QVz7vPtxNuu9bIRLxytk8nUkIBuAHVCHw5ijvuNf1Z1syrHeQKW7kGy7SEhhbHVu4VD2PYwQ/gEow6WZfIJBZXbtl19s+nocy7qstqZ979pdIYQkut6ZtEygUy1kNbDPJK4BxqDv8SSfFhZkUkJia6Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618945; c=relaxed/simple;
	bh=ZToXLcBBURIl1K5VmTLFGgsSv4/5S3g1RVUIdt+zWA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yo++YD0Aqf9ShO3E37Xlq9tcaDYFJh1DVPjqGEFgLG/KR7FTxx3ffm5vFgRtzumo6uT+ObtHxozBj7JB1GtkIrPqVBZbk9LbTsBNT8CVHLkGBHc76eJ0GwL/fglTgCKtqe+nd0vkZSauMnw6m0YZ/F8EuFmiKjxo7Y6j4OtcC9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y4eLxmOQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y4eLxmOQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954df200ddso5578285e9.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785618942; x=1786223742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7fLFmKk7qIiUCQ8tUCV0fF2fgy7ua0XmvUqcrQlTi8=;
        b=y4eLxmOQ3P2ml+whJO8sp20OO3yxQm9RzphrtEQKwhRrInhS8jaQ756lILD7xmRB1U
         7951AQ4hivn/H3kdMnEpO4SdZAviEnRDs25G7nk1mBxtveT07jMIp40wMcvWMPPhKHMQ
         NohEWLahk+IjXZ/L1zHaFpHW8TemmExmdFnfAnm2csc5192ad99DrnXqI93gqGk6TEB8
         y3j/hLMFOW4t3htRI/iBfBd5vM4VGj6xOxD/9mPoqAAs0pM0Cws7F0hhf9gdkdstbUvD
         nt7+8TaAHco1NcRb1Y2SPkRuvSXBsgr2K212ko50ksGymz7VeYA/7gA7Tqpuevtw3xei
         8Q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618942; x=1786223742;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7fLFmKk7qIiUCQ8tUCV0fF2fgy7ua0XmvUqcrQlTi8=;
        b=rVSqhWMkHzcNkoVlSYmBjZ0zeceUaw1+SW44YWpUZFirJbQIxezrS0liWuBTPq5sii
         ry8kEXCpzfqjD8JTeNR3eYKxUsDWjk6aSPPBH7W6ZJSPUSMOV7CXarxVF906k6t6gv49
         CnzuPjLxhZwIE+1Q7p8Ei3mP6IF16liff7D6xYJfazUfrS441wu2EYzTIrf/XPn0zuyW
         EG2cREksVt5PKvXVDZZO1BTlGxa0b0/ObC2k5neSGR7LmxRuwP1zokc7zvnSrmM08F39
         gq/zVz1+R/FkPvGbxNrHAsFynclb0oDt7E1K5+SS8COqnvfrnocj1M4ABJdDyh59Xj74
         QgXw==
X-Forwarded-Encrypted: i=1; AHgh+RryH1Ep3TituYDJGE1pMyG6Jz1rL+5NKGPWHW1yO9u9jQleA5AGIT2u+bKPf4X8cEQjIJ/5sFtlsJUn@vger.kernel.org
X-Gm-Message-State: AOJu0YxddHFjdbpdtjVjDv53QdbaRz2VPzHvB2OkkFOm321CkeIO8SYL
	FO7HCbye541aXFIDjBJAEkGSgULqOaa+S1KQMxfRYCuAQk3OPQBQqBhqvyJGbopRwJg=
X-Gm-Gg: AR+sD10Y1EdolxxdGwJXcmNFEFZhT656vHVmwSiRmcmv/rw3hlNQhfpQ+sb1GelOOh2
	h2uHYUYapYffav9qWc8pATlnuDPZqUJfTFkOpSu86f5R/Yo2gn4uUdzeTgwn00NuHXDgvOiW8ER
	YlXrWWBW+q2nzvE9x8eMbRLtQaQEs+2t9Uny4ydKY73eGcEzWZsIRAfj7RphrgJ6E4D4UmmZBcj
	k3Cmxa+3Fxr8nbNaeq6TLEPfUz6dg72yOF6IY3X2l7Nqby0PZIU6LAGZeAekr+xz8reYSylnli0
	0IYnTcn6EH5jZw+YIm5jn71lj8jp9e2NdkVhoku/pCFqEmNKm98gZGi6lDlKc7A/3zPt/05822j
	1v2t9LwU65E11mVZ38BvLxqCPn1hjcXf2Zo/9yHcowMFk9vywDIWfwxrB/QSx9gGOtlaYvd/8sr
	UpUSMK+qhtpe1ms50Ho8RaNvDsSIUbQMusaNxagVi/AcfIXtKGLziha1f2NNu4bM56OytSDnVun
	g==
X-Received: by 2002:a05:600c:1548:b0:498:ff3:71ed with SMTP id 5b1f17b1804b1-4980ff372a8mr57034555e9.17.1785618941647;
        Sat, 01 Aug 2026 14:15:41 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.147.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b59a5bsm75930665e9.3.2026.08.01.14.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 14:15:40 -0700 (PDT)
Message-ID: <42505e53-ff1a-43ba-8125-3f00b0895ebd@linaro.org>
Date: Sat, 1 Aug 2026 22:15:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] platform: arm64: dell-xps-ec: new driver
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com>
 <20260801-dell-xps-9345-ec-v3-2-9f4bdb5a5dad@vinarskis.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260801-dell-xps-9345-ec-v3-2-9f4bdb5a5dad@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2026 19:22, Aleksandrs Vinarskis wrote:
> Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which may
> partially of fully compatible with Snapdragon-based Dell Latitude,
> Inspiron ('thena'). Primary function of this driver is unblock EC's
> thermal management, specifically to provide it with necessary
> information to control device fans, peripherals power.
> 
> The driver was developed primarily by analyzing ACPI DSDT's _DSM and
> i2c dumps of communication between SoC and EC. Changes to Windows
> driver's behavior include increasing temperature feed loop from ~50ms
> to 100ms here.
> 
> While Xps's EC is rather complex and controls practically all device
> peripherals including touch row's brightness and special keys such as
> mic mute, these do not go over this particular i2c interface.
> 
> Not yet implemented features:
> - On lid-close IRQ event is registered. Windows performs what to
>    appears to be thermistor constants readout, though its not obvious
>    what it used for.
> - According to ACPI's _DSM there is a method to readout fans' RPM.
> - Initial thermistor constants were sniffed from Windows, these can be
>    likely fine tuned for better cooling performance.
> - There is additional temperature reading that Windows sents to EC but
>    more rare than others, likely SoC T_j / TZ98 or TZ4. This is the only
>    thermal zone who's reading can exceed 115C without triggering thermal
>    shutdown.
> - Given similarities between 'tributo' and 'thena' platforms, including
>    EC i2c address, driver can be potentially extended to support both.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>   MAINTAINERS                          |   1 +
>   drivers/platform/arm64/Kconfig       |  12 ++
>   drivers/platform/arm64/Makefile      |   1 +
>   drivers/platform/arm64/dell-xps-ec.c | 268 +++++++++++++++++++++++++++++++++++
>   4 files changed, 282 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b5efed4c430..64e143bc5129 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7347,6 +7347,7 @@ DELL XPS EMBEDDED CONTROLLER DRIVER
>   M:	Aleksandrs Vinarskis <alex@vinarskis.com>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> +F:	drivers/platform/arm64/dell-xps-ec.c
>   
>   DELTA AHE-50DC FAN CONTROL MODULE DRIVER
>   M:	Zev Weiss <zev@bewilderbeest.net>
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index e32e01b2a9bd..29416f8d7232 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -33,6 +33,18 @@ config EC_ACER_ASPIRE1
>   	  laptop where this information is not properly exposed via the
>   	  standard ACPI devices.
>   
> +config EC_DELL_XPS
> +	tristate "Dell XPS 9345 Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on IIO
> +	help
> +	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
> +	  Dell XPS 13 9345, which handles thermal management and fan speed
> +	  control.
> +
> +	  Say M or Y here to include this support.
> +
>   config EC_HUAWEI_GAOKUN
>   	tristate "Huawei Matebook E Go Embedded Controller driver"
>   	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 7681be4a46e9..669dc9e79afb 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -6,6 +6,7 @@
>   #
>   
>   obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
> +obj-$(CONFIG_EC_DELL_XPS)	+= dell-xps-ec.o
>   obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>   obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>   obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm64/dell-xps-ec.c
> new file mode 100644
> index 000000000000..7758f5dd9342
> --- /dev/null
> +++ b/drivers/platform/arm64/dell-xps-ec.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Aleksandrs Vinarskis <alex@vinarskis.com>
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/iio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/unaligned.h>
> +#include <linux/workqueue.h>
> +
> +#define DELL_XPS_EC_SUSPEND_CMD		0xb9
> +#define DELL_XPS_EC_SUSPEND_MSG_LEN	64
> +
> +#define DELL_XPS_EC_TEMP_CMD0		0xfb
> +#define DELL_XPS_EC_TEMP_CMD1		0x20
> +#define DELL_XPS_EC_TEMP_CMD3		0x02
> +#define DELL_XPS_EC_TEMP_MSG_LEN	6
> +#define DELL_XPS_EC_TEMP_POLL_JIFFIES	msecs_to_jiffies(100)
> +
> +/*
> + * Format:
> + * - header/unknown (2 bytes)
> + * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
> + */
> +static const u8 dell_xps_ec_thermistor_profile[] = {
> +	0xff, 0x54,
> +	0x01, 0x00, 0x2b,	/* sys_therm0 */
> +	0x02, 0x44, 0x2a,	/* sys_therm1 */
> +	0x03, 0x44, 0x2b,	/* sys_therm2 */
> +	0x04, 0x44, 0x28,	/* sys_therm3 */
> +	0x05, 0x55, 0x2a,	/* sys_therm4 */
> +	0x06, 0x44, 0x26,	/* sys_therm5 */
> +	0x07, 0x44, 0x2b,	/* sys_therm6 */
> +};

You ready have intuited this as a data-structure so if you define it as 
such with __attribute(packed); it will look neater.

> +
> +/*
> + * Mapping from IIO channel name to EC command byte
> + */
> +static const struct {
> +	const char *name;
> +	u8 cmd;
> +} dell_xps_ec_therms[] = {
> +	/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4 */
> +	{ "sys_therm0", 0x02 },
> +	{ "sys_therm1", 0x03 },
> +	{ "sys_therm2", 0x04 },
> +	{ "sys_therm3", 0x05 },
> +	{ "sys_therm4", 0x06 },
> +	{ "sys_therm5", 0x07 },
> +	{ "sys_therm6", 0x08 },
> +};
> +
> +struct dell_xps_ec {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct iio_channel *therm_channels[ARRAY_SIZE(dell_xps_ec_therms)];

This should come from data supplied via the probe .data and compat string.

> +	struct delayed_work temp_work;
> +};
> +
> +static int dell_xps_ec_suspend_cmd(struct dell_xps_ec *ec, bool suspend)
> +{
> +	u8 buf[DELL_XPS_EC_SUSPEND_MSG_LEN] = {};
> +	int ret;
> +
> +	buf[0] = DELL_XPS_EC_SUSPEND_CMD;
> +	buf[1] = suspend ? 0x01 : 0x00;
> +	/* bytes 2..63 remain zero */
> +
> +	ret = i2c_master_send(ec->client, buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int dell_xps_ec_send_temp(struct dell_xps_ec *ec, u8 cmd_byte,
> +				 int milli_celsius)
> +{
> +	u8 buf[DELL_XPS_EC_TEMP_MSG_LEN];
> +	u16 deci_celsius;
> +	int ret;
> +
> +	/* Convert milli-Celsius to deci-Celsius (Celsius * 10) */

milli-Celsius is very strange hyphenation just use the lower-case kernel 
terminology for it millicelsius.

https://www.kernel.org/doc/Documentation/devicetree/bindings/thermal/thermal.txt

> +	deci_celsius = milli_celsius / 100;
> +
> +	buf[0] = DELL_XPS_EC_TEMP_CMD0;
> +	buf[1] = DELL_XPS_EC_TEMP_CMD1;
> +	buf[2] = cmd_byte;
> +	buf[3] = DELL_XPS_EC_TEMP_CMD3;
> +	put_unaligned_le16(deci_celsius, &buf[4]);
> +
> +	ret = i2c_master_send(ec->client, buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void dell_xps_ec_temp_work_fn(struct work_struct *work)
> +{
> +	struct dell_xps_ec *ec = container_of(work, struct dell_xps_ec,
> +					      temp_work.work);
> +	int val, ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dell_xps_ec_therms); i++) {
> +		if (!ec->therm_channels[i])
> +			continue;
> +
> +		ret = iio_read_channel_processed(ec->therm_channels[i], &val);
> +		if (ret < 0) {
> +			dev_err_ratelimited(ec->dev,
> +					    "Failed to read thermistor %s: %d\n",
> +					    dell_xps_ec_therms[i].name, ret);
> +			continue;

Is it really legitimate to continue on in this case ? I'll leave it up 
to you to think about that for yourself, perhaps yes is the answer but 
if term_channels[i] is true and a read of a channel fails - surely 
that's indicative of a bail-out situation not read the next channel 
situation

> +		}
> +
> +		ret = dell_xps_ec_send_temp(ec, dell_xps_ec_therms[i].cmd, val);
> +		if (ret < 0) {
> +			dev_err_ratelimited(ec->dev,
> +					    "Failed to send temp for %s: %d\n",
> +					    dell_xps_ec_therms[i].name, ret);
> +		}
> +	}
> +
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +}
> +
> +static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
> +{
> +	struct dell_xps_ec *ec = data;
> +
> +	/*
> +	 * TODO: IRQ is fired on lid-close. Follow Windows example to read out
> +	 *       the thermistor thresholds and potentially fan speeds.
> +	 */
> +	dev_info_ratelimited(ec->dev, "IRQ triggered! (irq=%d)\n", irq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int dell_xps_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct dell_xps_ec *ec;
> +	int ret, i;
> +
> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +
> +	ec->dev = dev;
> +	ec->client = client;
> +	i2c_set_clientdata(client, ec);
> +
> +	/* Set default thermistor profile */
> +	ret = i2c_master_send(client, dell_xps_ec_thermistor_profile,
> +			      sizeof(dell_xps_ec_thermistor_profile));
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to set thermistor profile\n");
> +
> +	/* Get IIO channels for thermistors */
> +	for (i = 0; i < ARRAY_SIZE(dell_xps_ec_therms); i++) {

This should be num_channels passed from your compat .data

> +		ec->therm_channels[i] =
> +			devm_iio_channel_get(dev, dell_xps_ec_therms[i].name);
> +		if (IS_ERR(ec->therm_channels[i])) {
> +			ret = PTR_ERR(ec->therm_channels[i]);
> +			ec->therm_channels[i] = NULL;
> +			if (ret == -EPROBE_DEFER)
> +				return ret;
> +			dev_warn(dev, "Thermistor %s not available: %d\n",
> +				 dell_xps_ec_therms[i].name, ret);
> +		}
> +	}
> +
> +	/* Start periodic temperature reporting */
> +	ret = devm_delayed_work_autocancel(dev, &ec->temp_work,
> +					   dell_xps_ec_temp_work_fn);
> +	if (ret)
> +		return ret;
\n

> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +	dev_dbg(dev, "Started periodic temperature reporting to EC every %d ms\n",
> +		jiffies_to_msecs(DELL_XPS_EC_TEMP_POLL_JIFFIES));
> +
> +	/* Request IRQ for EC events */
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					dell_xps_ec_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	return 0;

You aren't returning the ret.

> +}
> +
> +/*
> + * Notify EC of suspend
> + *
> + * This will:
> + * - Cut power to display/trackpad/keyboard/touchrow, wake-up source still works
> + */
> +static int dell_xps_ec_suspend(struct device *dev)
> +{
> +	struct dell_xps_ec *ec = dev_get_drvdata(dev);
> +
> +	cancel_delayed_work_sync(&ec->temp_work);
> +
> +	return dell_xps_ec_suspend_cmd(ec, true);
> +}
> +
> +/*
> + * Notify EC of resume
> + *
> + * This will undo the suspend actions
> + * Without the resume signal, device would wake up but be forced back into
> + * suspend by EC within seconds
> + */
> +static int dell_xps_ec_resume(struct device *dev)
> +{
> +	struct dell_xps_ec *ec = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = dell_xps_ec_suspend_cmd(ec, false);
> +	if (ret)
> +		return ret;
> +
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
\n> +	return 0;
> +}
> +
> +static const struct of_device_id dell_xps_ec_of_match[] = {
> +	{ .compatible = "dell,xps13-9345-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dell_xps_ec_of_match);
> +
> +static const struct i2c_device_id dell_xps_ec_i2c_id[] = {
> +	{ "dell-xps-ec" },

A nice .data will allow extension of this to other systems with 
more/less channels.

Which is why you shouldn't use the ARRAY_SIZE() extents from statics 
declared up top directly.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, dell_xps_ec_i2c_id);
> +
> +static const struct dev_pm_ops dell_xps_ec_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(dell_xps_ec_suspend, dell_xps_ec_resume)
> +};
> +
> +static struct i2c_driver dell_xps_ec_driver = {
> +	.driver = {
> +		.name = "dell-xps-ec",
> +		.of_match_table = dell_xps_ec_of_match,
> +		.pm = &dell_xps_ec_pm_ops,
> +	},
> +	.probe = dell_xps_ec_probe,
> +	.id_table = dell_xps_ec_i2c_id,
> +};
> +module_i2c_driver(dell_xps_ec_driver);
> +
> +MODULE_AUTHOR("Aleksandrs Vinarskis <alex@vinarskis.com>");
> +MODULE_DESCRIPTION("Dell XPS 13 9345 Embedded Controller");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("IIO_CONSUMER");
> 

