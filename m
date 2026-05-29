Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70B03C1992
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047027; cv=none; b=lrv1RHxkMGKDBhY4CZkXHgNp5CwXdevw2fidXztipab1wFXWFR2N+NtayS5d7sETdfmSfTPAnGe2WdgQMj2vk9d0spEFRugtsbSRMdOmQlgMPEh9ZPCLl1QRqnclJjbr7/lzWw4SXNYyFgDN8ZYFGmaAkpCAxZT/SBl+CJ6+5fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047027; c=relaxed/simple;
	bh=GV5Rm1RwGK7U8/1MVkT6I42g38w5v9VWFglOl5x0yhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqbQPSFoU7039BVgoKaVY9sG2+FT1JNDieBO4F7UnnoRdDKbVB8Ym5w6IUAmvdotzXuXnvbMJnObWcphc5uMCUBqf9oPE/U7NaXqI7F9a/0T5ki87AsVqcOpP8a49/Qeri2mP1HSnss6veCM0PvdQT1sHDxbQLAvb5rfvpt8z30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6hl8S8Y; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6hl8S8Y"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bdce61897ebso833405766b.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780047023; x=1780651823; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GYSRC4x1mjQTbx6PsVvZb225HoobPmXU3KLDTDQ5/gg=;
        b=b6hl8S8YmUL9U/oTnfIPjw8gG5G3oMdwMc/ofkHVzQrikuk4JvF34fTCz/qTHaKG8/
         c/41V3YpoRnUrul0dQ48XFLiLnsIZBNBSRSXkWZpfjAeXS/aJWDPQH6pBqSRFiGH0nHV
         ywVmjTVGxPwZhFOPjW8dAwO/Ofmgpl83xq/eV9R6AYSQUHz5yic8eQg/piESOqYTRr3Q
         11Gk6gVNHbPcW6ddyRsiA10OkncvIzFY+3zokGRa19QSs8pzgwJ7vhbbVz1W8sTSsIIN
         1GEgZAjeAiMYr+66l2AjO2ymZDyPmtheCpvaAPVZbFbAoSLncWUjRbCxjA7c/C1bgwFJ
         PNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047023; x=1780651823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GYSRC4x1mjQTbx6PsVvZb225HoobPmXU3KLDTDQ5/gg=;
        b=PjTwhV9EU24hQHIzj0lZvW82WTAG/FJiQImYcTC8WcBL7a1Lmb0j1qRE7fCjsHWoc5
         8UoJBElmvJtIJVb7olMC2Dda+llHKwIxoMkBs3nhVG7ya+crEqTv/+a85AU9qCxI04Rg
         8jN6eZCR9Y32CMH54vDoHTwDBvELF5fRYnLrd7QPbarDtttJU2qYyoZdtZ+YNRTs22SN
         GfUZWDQWyx64oSvXlIbKTOdL1+CoaQfXhLmBv/IXx6LwdRd6t9ptWzwC1yHQm+7tTqvd
         ECouDIBL1gUsZwV8Ivtx/+nCGnS+KKBXXmBIRC/ghuuIFEUhthWC3TnTazzRzkEeeI+I
         2ssg==
X-Forwarded-Encrypted: i=1; AFNElJ9F7sbMphkup0QiYGnrpPzVeUwD82SdTbFMxIzAkp3Zp2HUe16ENl1AiRMrswqDNtCfDFJWExpEhbu7@vger.kernel.org
X-Gm-Message-State: AOJu0YxiOidmvpphjtQzUx7MNCKr/DAR3j2zaG9BmeGj/OizElMn78X3
	XjRgUl5oXJTm38h45NuQzrcGVwff1Ka/VGOqDA37XwHE5MuVVTEqOem6
X-Gm-Gg: Acq92OESlFu6OQXhabZ9IUXiM3Iw9m1OfuGdl4XvYy8udtGPfhQcFa9WAAFeUNNZFr3
	5qJHf3dmQ0iL40C2e7qSnNXM7yKu9kEo4W9gb0MHzkiAWTZtA58yyrzE9nyO1S7FQ/1giOnKscP
	B7JR+OQIfD5ypLF3Ti8WD+z4qbuK1NTEVqAMELjO2UpOIRAueqkBMXVRPFZIXlBT3mtEBGMTojI
	yWqAdtI5KZq7pH0qXWfsQeYXlCYXUNIT9q0Qu68qdbns72rmrtChc14GGfOZxCAr8Y/swn7rRnc
	QBtdMUJLIIOQyXJikJbdWuHkpfu9f0+db+n5b/dIrUMDxZMOKNmjjMtLWZHR5lZaV9jqzpvtpUW
	ZOEJMR8XuA2WC4TWp18gO89Xu2XfKFgCnneERICNoqjCgi/ZRK09HecYVD/ufc1S0NZn+kCDrFe
	1Z3/6nAX47eYcWYV1mXlI0s44=
X-Received: by 2002:a17:907:2d20:b0:bde:72a9:ba83 with SMTP id a640c23a62f3a-be9cf2ae3d2mr105870766b.29.1780047022876;
        Fri, 29 May 2026 02:30:22 -0700 (PDT)
Received: from nsa ([45.94.208.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d27f2207sm50349466b.2.2026.05.29.02.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:30:22 -0700 (PDT)
Date: Fri, 29 May 2026 10:31:20 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Syed, Arif" <arif.syed@hpe.com>, 
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Message-ID: <ahlcnlJJnLfmCZNH@nsa>
References: <20260529001903.625737-1-sanman.pradhan@hpe.com>
 <20260529001903.625737-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529001903.625737-3-sanman.pradhan@hpe.com>

On Fri, May 29, 2026 at 12:19:21AM +0000, Pradhan, Sanman wrote:
> From: Syed Arif <arif.syed@hpe.com>
> 
> Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC
> switching regulator. The MAX20860A provides monitoring of input/output
> voltage, output current, and temperature via the PMBus interface using
> linear data format.
> 
> Signed-off-by: Syed Arif <arif.syed@hpe.com>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
> v3:
>   - Removed "maxim,max20860a" from of_device_id
> v2:
>   - Removed WRITE_PROTECT write from probe
> 
>  Documentation/hwmon/index.rst     |  1 +
>  Documentation/hwmon/max20860a.rst | 57 +++++++++++++++++++++++++++++++
>  MAINTAINERS                       |  8 +++++
>  drivers/hwmon/pmbus/Kconfig       |  9 +++++
>  drivers/hwmon/pmbus/Makefile      |  1 +
>  drivers/hwmon/pmbus/max20860a.c   | 57 +++++++++++++++++++++++++++++++
>  6 files changed, 133 insertions(+)
>  create mode 100644 Documentation/hwmon/max20860a.rst
>  create mode 100644 drivers/hwmon/pmbus/max20860a.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index e880c6ca84f0..ffaacda416e7 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -163,6 +163,7 @@ Hardware Monitoring Kernel Drivers
>     max20730
>     max20751
>     max20830
> +   max20860a
>     max31722
>     max31730
>     max31760
> diff --git a/Documentation/hwmon/max20860a.rst b/Documentation/hwmon/max20860a.rst
> new file mode 100644
> index 000000000000..ea6d2228fafc
> --- /dev/null
> +++ b/Documentation/hwmon/max20860a.rst
> @@ -0,0 +1,57 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver max20860a
> +=======================
> +
> +Supported chips:
> +
> +  * Analog Devices MAX20860A
> +
> +    Prefix: 'max20860a'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.analog.com/en/products/max20860a.html
> +
> +Author:
> +
> +  - Syed Arif <arif.syed@hpe.com>
> +  - Sanman Pradhan <psanman@juniper.net>
> +
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for Analog Devices MAX20860A
> +Step-Down Switching Regulator with PMBus Interface.
> +
> +The MAX20860A is a fully integrated step-down DC-DC switching regulator.
> +Through the PMBus interface, the device can monitor input/output voltages,
> +output current and temperature.
> +
> +The driver is a client driver to the core PMBus driver. Please see
> +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate
> +the devices explicitly.
> +
> +Sysfs entries
> +-------------
> +
> +================= ========================================
> +in1_label         "vin"
> +in1_input         Measured input voltage
> +in1_alarm         Input voltage alarm
> +in2_label         "vout1"
> +in2_input         Measured output voltage
> +in2_alarm         Output voltage alarm
> +curr1_label       "iout1"
> +curr1_input       Measured output current
> +curr1_alarm       Output current alarm
> +temp1_input       Measured temperature
> +temp1_alarm       Chip temperature alarm
> +temp2_input       Measured temperature (secondary)
> +================= ========================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b71acb130395..1d9651947ee3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15688,6 +15688,14 @@ F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
>  F:	Documentation/hwmon/max20830.rst
>  F:	drivers/hwmon/pmbus/max20830.c
>  
> +MAX20860A HARDWARE MONITOR DRIVER
> +M:	Sanman Pradhan <psanman@juniper.net>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> +F:	Documentation/hwmon/max20860a.rst
> +F:	drivers/hwmon/pmbus/max20860a.c
> +
>  MAX2175 SDR TUNER DRIVER
>  M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 64f38654f4e7..5825dda75f2c 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -402,6 +402,15 @@ config SENSORS_MAX20830
>  	  This driver can also be built as a module. If so, the module will
>  	  be called max20830.
>  
> +config SENSORS_MAX20860A
> +	tristate "Analog Devices MAX20860A"
> +	help
> +	  If you say yes here you get hardware monitoring support for Analog
> +	  Devices MAX20860A step-down converter.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called max20860a.
> +
>  config SENSORS_MAX31785
>  	tristate "Maxim MAX31785 and compatibles"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 1f2c73b71953..ffc05f493213 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MAX17616)	+= max17616.o
>  obj-$(CONFIG_SENSORS_MAX20730)	+= max20730.o
>  obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
>  obj-$(CONFIG_SENSORS_MAX20830)	+= max20830.o
> +obj-$(CONFIG_SENSORS_MAX20860A)	+= max20860a.o
>  obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
> diff --git a/drivers/hwmon/pmbus/max20860a.c b/drivers/hwmon/pmbus/max20860a.c
> new file mode 100644
> index 000000000000..f5feefcbe407
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max20860a.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Analog Devices MAX20860A
> + *
> + * SPDX-FileCopyrightText: Copyright Hewlett Packard Enterprise Development LP
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info max20860a_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |
> +		PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
> +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_INPUT,
> +};

Any reason not to add regulator support? Given that the device seems to
be a regulator...

- Nuno Sá

> +
> +static int max20860a_probe(struct i2c_client *client)
> +{
> +	return pmbus_do_probe(client, &max20860a_info);
> +}
> +
> +static const struct i2c_device_id max20860a_id[] = {
> +	{"max20860a"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, max20860a_id);
> +
> +static const struct of_device_id max20860a_of_match[] = {
> +	{ .compatible = "adi,max20860a" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, max20860a_of_match);
> +
> +static struct i2c_driver max20860a_driver = {
> +	.driver = {
> +		.name = "max20860a",
> +		.of_match_table = max20860a_of_match,
> +	},
> +	.probe = max20860a_probe,
> +	.id_table = max20860a_id,
> +};
> +
> +module_i2c_driver(max20860a_driver);
> +
> +MODULE_AUTHOR("Syed Arif <arif.syed@hpe.com>");
> +MODULE_AUTHOR("Sanman Pradhan <psanman@juniper.net>");
> +MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX20860A");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
> -- 
> 2.34.1
> 
