Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05C831AF3B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 03:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889654; cv=none; b=p48nw0swNj+MoRPACCp/k3qmeuk+E23M0fTpMnzQn6i9kUJlx6l0x4zeo104Gv/CEYfoYzU3KGegqx/nxMYNua9VNe2I7NhDGuUF6TAf2i94T+A9tH80f4K8GOV7eD987BeodlAcXe7RgPjAsWNrpWz81HL7pn4eCvTjyMr1AEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889654; c=relaxed/simple;
	bh=cJY46STgIA6TyAenxOUlDlnzysrmflNCaD5Gv0ZZ5wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBY+Epxtev1kVh6wgTqhU2AdnpSjy6QX6mwRmNESIypDrTUq26AJABtP1TYbM/OOFtUx+PMrhFjhXmzBEhLzhPjNbpGRowChp1aaU9V4HMed8A2EogXJEsRrB9qrMoacfZIR1VJYeSCV6eaU6iQfSeFDbipxKq7Gi84QquYAf3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCO+h2uU; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCO+h2uU"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf3781ca51so37356355ad.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 20:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780889651; x=1781494451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjptvaqMFpkJ5ciR5zDYcgVGEGYgvQ+MyYxJKKdThD0=;
        b=ZCO+h2uUaWUNELAcPkZX/+EZW9Cbr7v2FHGnFymNbxxCrpwUCgWy5ayp93tMawaTNK
         2mJDzcwFIs1NAmovoS6rbA60greN+D3Qqs+JQdjx/BpXB6Ycv2xT0GxwlC5ZVHWkJy/I
         griFLS+WLFDDbqbyYFWzt3vuNZPK/bmtk6vbUbhZMgxKdh0iRq6DlFqiDrQAq8h8rpqi
         RxS07vlOp6zH6yHVqCWR/mdXKdFyyDqbmX1u7Xpvx72liqbhr5Db2KVqkrDLTNPyRo4Z
         xM9cZAc8dJYU4EkiUsLz8spK3lTBV4dIvzVxC5v9C9sfrIP9mMy9F/czU5ntbab4iMhA
         SSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780889651; x=1781494451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mjptvaqMFpkJ5ciR5zDYcgVGEGYgvQ+MyYxJKKdThD0=;
        b=VuT8sAXMWEKJ01wEOZ20CHOW22fmhP8RMoHF5lYpUtyhi8WfaL8QSt3APESKDWyYw/
         vxvnZD0zmcjP1GEGNlhpg3go0I5VH5jveN6X1vHysRCsOOdP59HuVGhNRKbqTbIHbOYC
         aSmChzQuHpd+5rOKtH9KyxcmkwTRNJRBtqm8qm0ssdda9BqC9Hlz3V0A0Y/KwrN7QYKo
         dfSf6Z4BcS4jimEoQr5xXz+NStQpgjxOrJukCXvEArHiADjRRYv/HaOjFftovh7cLydZ
         PaqZZUOhNWLcpXixaQibcGkLVPoWrJP61PyDup2Fadk/Nu6cdY122udlDfp8kiwCTrLi
         oqxA==
X-Forwarded-Encrypted: i=1; AFNElJ+eC/dmYCru2WFhQwbQBI2gjH2VVJuOOEdbmzvRGFG7QxG91SioXyxyuWIvzlxIai7piBON2fJeCpGE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnvt8EeCO94nFDAYiRtsE9VG63iyUqF+xWChET0q/QPGywmBEs
	CLNgOIFjik971Opjh12DOro57iSZQETVwnvS54/7WaGdFOAIHx3maBAR
X-Gm-Gg: Acq92OG39hduUQCVY0kWC4bcraa+3egjP4JQAoEjbjHdjD8Z9rvAQsKco/Ubi2NWF77
	Ji+LpseirESECcRBCv7WB3vh9xojK08qMpM5AHavkvv5Q9WWrr3SMDUk/r//ZHuA4vXYKi2zOH7
	hVwO15YyVBALi27G1ycjFOXBoD3EQlvCxPSYT4UvKzuwHFn4TnutIi7OdkKOPobsvkYxlvvSmb9
	MUftwtEsWiooqgWflIQWFEPnibgU/ju8AAT1kx1e4H/+XC5ciIauQ01t8MpkcbBImv+igkLb4B4
	zUB+8OfQAuSOPfCCiG2eoQL6Zwb8QgLDn+VVy6Wxeqg2TMYK1ZX0w6SHOh4mmPP82dwzarvRnNu
	IlHYADVxqX4wuylxGj6nwerbg6i3ZlR67GfHyedofYH2oNlDctpIpdmIC5mNJw/4qQXbf6hu8Xn
	SVmJcKi2oPLZJaDimnQD7AEp6YFB7ifSmGTTDfvKTxuxeiXJ0=
X-Received: by 2002:a17:902:ecc8:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2c1e83455c4mr147137575ad.33.1780889650914;
        Sun, 07 Jun 2026 20:34:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm166052735ad.8.2026.06.07.20.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:34:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 20:34:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: Re: [PATCH v2 2/3] hwmon: pmbus: Add support for Silergy SQ24860
Message-ID: <c1c7e115-b490-4859-873d-e48d19054ba4@roeck-us.net>
References: <20260605063042.91776-1-zmzhu0630@163.com>
 <20260605063042.91776-3-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605063042.91776-3-zmzhu0630@163.com>

On Fri, Jun 05, 2026 at 02:30:41PM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Add PMBus hwmon support for the Silergy SQ24860 eFuse.
> 
> The driver reports input voltage, output voltage, auxiliary voltage,
> input current, input power, and temperature. It also exposes peak,
> average, and minimum history attributes, sample count configuration,
> and maps the manufacturer-specific VIREF register to the generic input
> over-current fault limit attribute.
> 
> The IMON resistor value is read from the silergy,rimon-micro-ohms device
> property and used to configure the input current calibration gain.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

checkpatch --strict says:

total: 0 errors, 3 warnings, 6 checks, 464 lines checked

The MAINTAINERS and the DT warning can be ignored, but I expect the rest
to be fixed.

> ---
>  drivers/hwmon/pmbus/Kconfig   |  19 ++
>  drivers/hwmon/pmbus/Makefile  |   1 +
>  drivers/hwmon/pmbus/sq24860.c | 432 ++++++++++++++++++++++++++++++++++
>  3 files changed, 452 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/sq24860.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 8f4bff375ecb..a905b5af137c 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -612,6 +612,25 @@ config SENSORS_STEF48H28
>  	  This driver can also be built as a module. If so, the module will
>  	  be called stef48h28.
>  
> +config SENSORS_SQ24860
> +	tristate "Silergy SQ24860"
> +	help
> +	  If you say yes here you get hardware monitoring support for Silergy
> +	  SQ24860 eFuse.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called sq24860.
> +
> +config SENSORS_SQ24860_REGULATOR
> +	bool "Regulator support for SQ24860"
> +	depends on SENSORS_SQ24860 && REGULATOR
> +	default SENSORS_SQ24860
> +	help
> +	  If you say yes here you get regulator support for Silergy SQ24860.
> +	  The regulator is registered through the PMBus regulator framework and
> +	  can be used to control the output exposed by the device.
> +	  This option is only useful if regulator framework support is needed.
> +
>  config SENSORS_STPDDC60
>  	tristate "ST STPDDC60"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 7129b62bc00f..86bc93c6c091 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -60,6 +60,7 @@ obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
>  obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>  obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
>  obj-$(CONFIG_SENSORS_STEF48H28)	+= stef48h28.o
> +obj-$(CONFIG_SENSORS_SQ24860)	+= sq24860.o
>  obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
>  obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
>  obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
> diff --git a/drivers/hwmon/pmbus/sq24860.c b/drivers/hwmon/pmbus/sq24860.c
> new file mode 100644
> index 000000000000..43a2cb542169
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/sq24860.c
> @@ -0,0 +1,432 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2024.
> +// Author: Ziming Zhu <ziming.zhu@silergycorp.com>

Please do not mix C++ and C comments. Yes, I understand that the first
line must be a C++ comment. The rest of the driver must use a consistent
comment style.

> +#include <linux/bitfield.h>
> +#include <linux/debugfs.h>

I do not see where this include file is used.

> +#include <linux/err.h>
> +#include <linux/hwmon-sysfs.h>

I do not see where this include file is used.

> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include "pmbus.h"
> +
> +#define SQ24860_IIN_CAL_GAIN		0x38
> +#define SQ24860_READ_VAUX		0xd0
> +#define SQ24860_READ_VIN_MIN		0xd1
> +#define SQ24860_READ_VIN_PEAK		0xd2
> +#define SQ24860_READ_IIN_PEAK		0xd4
> +#define SQ24860_READ_PIN_PEAK		0xd5
> +#define SQ24860_READ_TEMP_AVG		0xd6
> +#define SQ24860_READ_TEMP_PEAK		0xd7
> +#define SQ24860_READ_VOUT_MIN		0xda
> +#define SQ24860_READ_VIN_AVG		0xdc
> +#define SQ24860_READ_VOUT_AVG		0xdd
> +#define SQ24860_READ_IIN_AVG		0xde
> +#define SQ24860_READ_PIN_AVG		0xdf
> +#define SQ24860_VIREF			0xe0
> +#define SQ24860_PK_MIN_AVG		0xea
> +#define PK_MIN_AVG_RST_PEAK		BIT(7)
> +#define PK_MIN_AVG_RST_AVG		BIT(6)
> +#define PK_MIN_AVG_RST_MIN		BIT(5)
> +#define PK_MIN_AVG_AVG_CNT		GENMASK(2, 0)
> +#define SQ24860_MFR_WRITE_PROTECT	0xf8
> +#define SQ24860_UNLOCKED		BIT(7)
> +
> +#define SQ24860_8B_SHIFT		2
> +#define SQ24860_IIN_OCF_NUM		1000000
> +#define SQ24860_IIN_OCF_DIV		129278
> +#define SQ24860_IIN_OCF_OFF		165
> +
> +#define PK_MIN_AVG_RST_MASK		(PK_MIN_AVG_RST_PEAK | \
> +					 PK_MIN_AVG_RST_AVG  | \
> +					 PK_MIN_AVG_RST_MIN)
> +#define SQ24860_MAX_SAMPLES		BIT(FIELD_MAX(PK_MIN_AVG_AVG_CNT))
> +/*
> + * Arbitrary default Rimon value: 1.6kOhm
> + */
> +#define SQ24860_DEFAULT_RIMON		1600000000
> +#define SQ24860_DEFAULT_GIMON		18180
> +
> +#define SQ24860_VAUX_DIV		20
> +
> +static int sq24860_write_iin_cal_gain(struct i2c_client *client, u32 rimon,
> +					u32 gimon)
> +{
> +	u64 temp = (u64)6400 * 1000000000 * 1000;
> +	u64 denom;
> +	u64 word;
> +
> +	if (!rimon || !gimon)
> +		return -EINVAL;
> +
> +	denom = (u64)rimon * gimon;
> +	word = div_u64(temp, denom);
> +	if (word > U16_MAX)
> +		return -ERANGE;

This is not "Math result not representable". Return -EINVAL.

Also, please make sure to fix the problem reported by Sashiko, or explain
why it does not apply.

> +
> +	return i2c_smbus_write_word_data(client, SQ24860_IIN_CAL_GAIN,
> +						(u16)word);
> +}
> +
> +static int sq24860_mfr_write_protect_set(struct i2c_client *client,
> +					  u8 protect)
> +{
> +	u8 val;
> +
> +	switch (protect) {
> +	case 0:
> +		val = 0xa2;
> +		break;
> +	case PB_WP_ALL:
> +		val = 0x0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return pmbus_write_byte_data(client, -1, SQ24860_MFR_WRITE_PROTECT,
> +				     val);
> +}
> +
> +static int sq24860_mfr_write_protect_get(struct i2c_client *client)
> +{
> +	int ret = pmbus_read_byte_data(client, -1, SQ24860_MFR_WRITE_PROTECT);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return (ret & SQ24860_UNLOCKED) ? 0 : PB_WP_ALL;
> +}
> +
> +static int sq24860_read_word_data(struct i2c_client *client,
> +				   int page, int phase, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_READ_VIN_MAX:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_VIN_PEAK);
> +		break;
> +
> +	case PMBUS_VIRT_READ_VIN_MIN:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_VIN_MIN);
> +		break;
> +
> +	case PMBUS_VIRT_READ_VIN_AVG:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_VIN_AVG);
> +		break;
> +
> +	case PMBUS_VIRT_READ_VOUT_MIN:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_VOUT_MIN);
> +		break;
> +
> +	case PMBUS_VIRT_READ_VOUT_AVG:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_VOUT_AVG);
> +		break;
> +
> +	case PMBUS_VIRT_READ_IIN_AVG:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_IIN_AVG);
> +		break;
> +
> +	case PMBUS_VIRT_READ_IIN_MAX:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_IIN_PEAK);
> +		break;
> +
> +	case PMBUS_VIRT_READ_TEMP_AVG:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_TEMP_AVG);
> +		break;
> +
> +	case PMBUS_VIRT_READ_TEMP_MAX:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_TEMP_PEAK);
> +		break;
> +
> +	case PMBUS_VIRT_READ_PIN_AVG:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_PIN_AVG);
> +		break;
> +
> +	case PMBUS_VIRT_READ_PIN_MAX:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_PIN_PEAK);
> +		break;
> +
> +	case PMBUS_VIRT_READ_VMON:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   SQ24860_READ_VAUX);
> +		if (ret < 0)
> +			break;
> +		ret = DIV_ROUND_CLOSEST(ret, SQ24860_VAUX_DIV);
> +		break;
> +
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +		/*
> +		 * These registers provide an 8 bits value instead of a
> +		 * 10bits one. Just shifting twice the register value is
> +		 * enough to make the sensor type conversion work, even
> +		 * if the datasheet provides different m, b and R for
> +		 * those.
> +		 */
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			break;
> +		ret <<= SQ24860_8B_SHIFT;
> +		break;
> +
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		/*
> +		 * VIREF directly sets the over-current limit at which the eFuse
> +		 * will turn the FET off and trigger a fault. Expose it through
> +		 * this generic property instead of a manufacturer specific one.
> +		 */
> +		ret = pmbus_read_byte_data(client, page, SQ24860_VIREF);
> +		if (ret < 0)
> +			break;
> +		ret = DIV_ROUND_CLOSEST(ret * SQ24860_IIN_OCF_NUM,
> +					SQ24860_IIN_OCF_DIV);
> +		ret += SQ24860_IIN_OCF_OFF;
> +		break;
> +
> +	case PMBUS_VIRT_SAMPLES:
> +		ret = pmbus_read_byte_data(client, page, SQ24860_PK_MIN_AVG);
> +		if (ret < 0)
> +			break;
> +		ret = BIT(FIELD_GET(PK_MIN_AVG_AVG_CNT, ret));
> +		break;
> +
> +	case PMBUS_VIRT_RESET_TEMP_HISTORY:
> +	case PMBUS_VIRT_RESET_VIN_HISTORY:
> +	case PMBUS_VIRT_RESET_IIN_HISTORY:
> +	case PMBUS_VIRT_RESET_PIN_HISTORY:
> +	case PMBUS_VIRT_RESET_VOUT_HISTORY:
> +		ret = 0;
> +		break;
> +
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int sq24860_write_word_data(struct i2c_client *client,
> +				    int page, int reg, u16 value)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +		value >>= SQ24860_8B_SHIFT;
> +		value = clamp_val(value, 0, 0xff);
> +		ret = pmbus_write_word_data(client, page, reg, value);
> +		break;
> +
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		value -= SQ24860_IIN_OCF_OFF;

What if value is < SQ24860_IIN_OCF_OFF ?

(also reported by Sashiko)

> +		value = DIV_ROUND_CLOSEST(((unsigned int)value) * SQ24860_IIN_OCF_DIV,
> +					  SQ24860_IIN_OCF_NUM);
> +		value = clamp_val(value, 0, 0x3f);
> +		ret = pmbus_write_byte_data(client, page, SQ24860_VIREF, value);
> +		break;
> +
> +	case PMBUS_VIRT_SAMPLES:
> +		value = clamp_val(value, 1, SQ24860_MAX_SAMPLES);
> +		value = ilog2(value);
> +		ret = pmbus_update_byte_data(client, page, SQ24860_PK_MIN_AVG,
> +					     PK_MIN_AVG_AVG_CNT,
> +					     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
> +		break;
> +
> +	case PMBUS_VIRT_RESET_TEMP_HISTORY:
> +	case PMBUS_VIRT_RESET_VIN_HISTORY:
> +	case PMBUS_VIRT_RESET_IIN_HISTORY:
> +	case PMBUS_VIRT_RESET_PIN_HISTORY:
> +	case PMBUS_VIRT_RESET_VOUT_HISTORY:
> +		/*
> +		 * SQ24860 has history resets based on MIN/AVG/PEAK instead of per
> +		 * sensor type. Exposing this quirk in hwmon is not desirable so
> +		 * reset MIN, AVG and PEAK together. Even is there effectively only
> +		 * one reset, which resets everything, expose the 5 entries so
> +		 * userspace is not required map a sensor type to another to trigger
> +		 * a reset
> +		 */
> +		ret = pmbus_update_byte_data(client, 0, SQ24860_PK_MIN_AVG,
> +					     PK_MIN_AVG_RST_MASK,
> +					     PK_MIN_AVG_RST_MASK);
> +		break;
> +
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int sq24860_read_byte_data(struct i2c_client *client,
> +				   int page, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_WRITE_PROTECT:
> +		ret = sq24860_mfr_write_protect_get(client);
> +		break;
> +
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int sq24860_write_byte_data(struct i2c_client *client,
> +				    int page, int reg, u8 byte)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_WRITE_PROTECT:
> +		ret = sq24860_mfr_write_protect_set(client, byte);
> +		break;
> +
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +#if IS_ENABLED(CONFIG_SENSORS_SQ24860_REGULATOR)
> +static const struct regulator_desc sq24860_reg_desc[] = {
> +	PMBUS_REGULATOR_ONE_NODE("vout"),
> +};
> +#endif
> +
> +static const struct pmbus_driver_info sq24860_base_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.m[PSC_VOLTAGE_IN] = 64,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = 0,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.m[PSC_VOLTAGE_OUT] = 64,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = 0,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.m[PSC_TEMPERATURE] = 1,
> +	.b[PSC_TEMPERATURE] = 0,
> +	.R[PSC_TEMPERATURE] = 0,
> +	/*
> +	* Current and power measurements depend on the calibration gain
> +	* programmed from the board-specific IMON resistor value.
> +	*/

Comment alignment is off (see checkpatch results).

> +	.format[PSC_CURRENT_IN] = direct,
> +	.m[PSC_CURRENT_IN] = 16,
> +	.b[PSC_CURRENT_IN] = 0,
> +	.R[PSC_CURRENT_IN] = 0,
> +	.format[PSC_POWER] = direct,
> +	.m[PSC_POWER] = 2,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = 0,
> +	.func[0] = (PMBUS_HAVE_VIN |
> +		    PMBUS_HAVE_VOUT |
> +		    PMBUS_HAVE_VMON |
> +		    PMBUS_HAVE_IIN |
> +		    PMBUS_HAVE_PIN |
> +		    PMBUS_HAVE_TEMP |
> +		    PMBUS_HAVE_STATUS_VOUT |
> +		    PMBUS_HAVE_STATUS_IOUT |
> +		    PMBUS_HAVE_STATUS_INPUT |
> +		    PMBUS_HAVE_STATUS_TEMP |
> +		    PMBUS_HAVE_SAMPLES),

Unnecessary ( ).

> +	.read_word_data = sq24860_read_word_data,
> +	.write_word_data = sq24860_write_word_data,
> +	.read_byte_data = sq24860_read_byte_data,
> +	.write_byte_data = sq24860_write_byte_data,
> +
> +#if IS_ENABLED(CONFIG_SENSORS_SQ24860_REGULATOR)
> +	.reg_desc = sq24860_reg_desc,
> +	.num_regulators = ARRAY_SIZE(sq24860_reg_desc),
> +#endif
> +};
> +
> +static const struct i2c_device_id sq24860_i2c_id[] = {
> +	{ "sq24860" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, sq24860_i2c_id);
> +
> +static const struct of_device_id sq24860_of_match[] = {
> +	{ .compatible = "silergy,sq24860" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sq24860_of_match);
> +
> +static int sq24860_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct pmbus_driver_info *info;
> +	u32 rimon = SQ24860_DEFAULT_RIMON;
> +	u32 gimon = SQ24860_DEFAULT_GIMON;

gimon is a constant. Why pass it as parameter to sq24860_write_iin_cal_gain(),
and why validate it there instead of just using a constant ?

> +	int ret;
> +
> +	ret = device_property_read_u32(dev, "silergy,rimon-micro-ohms", &rimon);
> +	if (ret < 0 && ret != -EINVAL)
> +		return dev_err_probe(dev, ret, "failed to get rimon\n");

I am a bit lost here. Why accept -EINVAL (invalid arguments) ?

> +
> +	ret = sq24860_write_iin_cal_gain(client, rimon, gimon);
> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +					     "Failed to set gain\n");
> +	info = devm_kmemdup(dev, &sq24860_base_info, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static struct i2c_driver sq24860_driver = {
> +	.driver = {
> +		.name = "sq24860",
> +		.of_match_table = sq24860_of_match,
> +	},
> +	.probe = sq24860_probe,
> +	.id_table = sq24860_i2c_id,
> +};
> +module_i2c_driver(sq24860_driver);
> +
> +MODULE_AUTHOR("Ziming Zhu <ziming.zhu@silergycorp.com>");
> +MODULE_DESCRIPTION("PMBUS driver for SQ24860 eFuse");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
