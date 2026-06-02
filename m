Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7823806AF
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397142; cv=none; b=Lu0eFKZsvGVzN/1Gy36c290Dp2yYc2aGBPJqy2Fm3h1WKZ4mJx0+qzC2dMoI/TN+XcSMKcMYZpyD0cipHKJ6TfF7CkK7EJ33u5BYTKgfuD2HdKPpkK4W9vIh6PAue2nBtfUjH1PFCKpj4BZa/tXEt277YteA94WZj8o2hWWUXqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397142; c=relaxed/simple;
	bh=krmbOe9KZiZf9SjrTGYg6OBtTzNanfyWe9ELGz8vfxs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=YkLWK8L1bBPTVy2xteZfUvegFYBPsLJXp2nZX0o2YTM7nyaGrM8nN1F6RsLt9h5myFsdx67Q2Cnvrd2Mf58yMWC18zKaWTmGYvg9mVELQs1KloiWg1fwhb62QwdCfugLNKxweNFNwCJJ+nKzFzQe+BJMej3wJgbiM8+qttsXwwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/mrVXxd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/mrVXxd"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ac10e337so11682955e9.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780397139; x=1781001939; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa1ijz/+jsCBRkiCFPbs9qjTyJXRBGgnSyJho0OJaY4=;
        b=M/mrVXxdrkHINJA5wT6SySdtdzfs5+mx8Dq4r70nPXoX2F8cT/SORp334kMUf1xZ2t
         AjCPdt1VTLj0lelIIPgHI9es82SDl8OtKjR6IeUPpiTIvi/yAskd4PNkw6D1TZIPz3BU
         6Eoh1OToGrsLcrS6NIt/Ist8xe3Lrfd0oTEdo6Dl4g8HCOFETNEjrVvzH9+uVuU6Po8l
         VGpcQ4UZXbWVilsKoHLsVk8uciUG9yl69xpFzB7YCpCuZxnLUxdtEeAr6La9vDt0QbhR
         X3Oc0qoGe3sm7LRVjVgMpVn441Clz+zobp+OUOo6CpXyp+/5OSdG5XvaT65DfYucMSsI
         Fuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780397139; x=1781001939;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xa1ijz/+jsCBRkiCFPbs9qjTyJXRBGgnSyJho0OJaY4=;
        b=jFIx8huWUwAyjTN8deFB9RFBAf59JagYtK+fW744zk14pkmPIA5wTNLmMg35HEUTTF
         TQijU9DCJZjRr6yWOE/28j2sIAdPRFzwLsCRBcbfP703C0cUG0jTl4G8G1OivPM+tcW3
         QHfhHDZeJOVL3U/ro9sEScKFyrBwDPBeQhdtpl3iAFA7cuwfnc29UQ5/11peG++C4Tn9
         WgUWeiXOFc+4DZgJR1IwkuYwB7AfeSkrfUPPeuOYk2AxVc7Zulj/nebU4wLlGRI0UnSd
         1AoUG4tHNpUJjaotodwuWLeScHJdMl3SwXHl6mE3F48StAz0J1BmBIOVYO2xc1Jgo1Q6
         NaTg==
X-Forwarded-Encrypted: i=1; AFNElJ/ubYlQYwhLFAj7X/1SyHwiGoNmzsT2E2lGHfFOOGEyKawxlb4GamxoM68xomK99x5L4WwpmSBFTeyl@vger.kernel.org
X-Gm-Message-State: AOJu0YxsaRVjan20SG9XVe/RLBwO/CU6zG1YZ+PxHmEgxrt1yM3smocd
	0hq/J2H0wEJXGd8gS9Mr5mvUb/xiuxvTI8MW6gwgbnnKN47Ws5ksGm6v
X-Gm-Gg: Acq92OGcYF8bMXLz/NreBHu00GFMfqb2wJt7Q9MJtKZE3aPMDwNu/AOJsnbIT7V26oz
	SuVdHLDqSj+w0MlUBcdc4bUhfiL8Intq8Y1ThpBtF6aGSkjcovDnS2f5Cn24HXk2NgVkRlDCzMJ
	lnTOnOwI5349gls5Tt6t/wim5Mi9wTmF19B8sRrW85l5DDEaPSAEXd/Wb0DugPY53S2aOQodCiD
	/AMDajj/kC3lU0RExq/UrSX51OH3pXRos2HrBdI0mfKeFGyxDtSR0Tj4fgKtGwf1CC4sDcTqWwE
	+EV9LC9QY6t8vSyWIfPCdMYioqyN4tyut7z1bbUFqHP4ymo9bAsIrzgNRgPEu2B4NnCOIaRw6nu
	4jSn3tX1u77GTcBq/U4joZ4nE2IA24/m7occPJ4vcgvTzD7jXoZV1AVyzRmNfll6CIq+mjL2c54
	XCKiibBSvRh8nMd4uvWDUswSJMTdwLPjDNlaLjiOirrOxYlU4=
X-Received: by 2002:a05:600c:3acb:b0:490:aef9:aa3b with SMTP id 5b1f17b1804b1-490aef9ab5cmr94462275e9.32.1780397138637;
        Tue, 02 Jun 2026 03:45:38 -0700 (PDT)
Received: from localhost ([2001:4bb8:152:df59:3b69:56ea:a39b:adb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a03f8sm34033694f8f.7.2026.06.02.03.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 03:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 12:45:35 +0200
Message-Id: <DIYI40YK6CSX.2P4017PHVJHCT@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rishi Gupta"
 <gupt21@gmail.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Matti Vaittinen" <mazziesaccount@gmail.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
 <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com>
 <ah6p-f2RCW8VcuDR@ashevche-desk.local>
In-Reply-To: <ah6p-f2RCW8VcuDR@ashevche-desk.local>

Hi Andy, thanks for your review.

On Tue Jun 2, 2026 at 12:01 PM CEST, Andy Shevchenko wrote:
> On Sun, May 31, 2026 at 09:58:22PM +0200, Javier Carrasco wrote:
>> These sensors provide two light channels (ALS and IR), I2C communication
>> and a multiplexed interrupt line to signal data ready and configurable
>> threshold alarms.
>>
>> This first implementation provides basic functionality (measurement
>> configuration, raw reads and ID validation) and defines the different
>> register regions in preparation for extended features in the subsequent
>> patches of the series.
>
> ...
>
> + array_size.h
>
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +#include <linux/i2c.h>
>
>> +#include <linux/module.h>
>> +#include <linux/mod_devicetable.h>
>
> In C locale it seems wrong order.
>
>> +#include <linux/mutex.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>
> + types.h
>

Do you know any tool to automate this beyond asking an AI? Manual
auditing is not very reliablo and it is not that difficult to miss a
header that has been indirectly included. Building with W=3D1 and similar
stuff did not help.

>> +#include <linux/units.h>
>
> + Blank line.
>
>> +#include <linux/iio/iio.h>
>> +#include <linux/iio/iio-gts-helper.h>
>
> ...
>
>> +struct veml6031x00_data {
>
> Have you run `pahole`? Does it agree with your layout?
>
>> +	struct device *dev;
>> +	struct iio_gts gts;
>> +	struct regmap *regmap;
>
> Do you need dev and regmap? One may be derived from the other in case reg=
map
> uses the same dev on initialisation as the one stored here.
>
Ack.
>> +	struct veml6031x00_rf rf;
>> +	const struct veml6031x00_chip *chip;
>> +	/*
>> +	 * Serialize access to scale register fields scattered across multiple
>> +	 * registers (rf.gain, rf.pd_div4, rf.it) to read and write them as a
>> +	 * consistent set.
>> +	 */
>> +	struct mutex scale_lock;
>> +};
>
> ...
>
>> +/*
>> + * The gain selector encodes (PD_D4 << 2) | GAIN to identify each gain =
setting.
>> + * Gains are multiplied by 8 to work with integers. The values in the i=
io-gts
>> + * tables don't need corrections because the maximum value of the scale=
 refers
>> + * to GAIN =3D x1, and the rest of the values are obtained from the res=
ulting
>> + * linear function.
>> + * TODO: add support for MILLI_GAIN_X165 and MILLI_GAIN_X660
>> + */
>> +#define VEML6031X00_SEL_MILLI_GAIN_X125  0x07
>> +#define VEML6031X00_SEL_MILLI_GAIN_X250  0x04
>> +#define VEML6031X00_SEL_MILLI_GAIN_X500  0x03
>> +#define VEML6031X00_SEL_MILLI_GAIN_X1000 0x00
>> +#define VEML6031X00_SEL_MILLI_GAIN_X2000 0x01
>
> Not sure if these one-time use definitions improve or not the readability
> of the code. Up to Jonathan.
>

I prefer these definitions, and a similar pattern is used in multiple
drivers in IIO, but I have no strong feelings about it.

>> +static const struct iio_gain_sel_pair veml6031x00_gain_sel[] =3D {
>> +	GAIN_SCALE_GAIN(1, VEML6031X00_SEL_MILLI_GAIN_X125),
>> +	GAIN_SCALE_GAIN(2, VEML6031X00_SEL_MILLI_GAIN_X250),
>> +	GAIN_SCALE_GAIN(4, VEML6031X00_SEL_MILLI_GAIN_X500),
>> +	GAIN_SCALE_GAIN(8, VEML6031X00_SEL_MILLI_GAIN_X1000),
>> +	GAIN_SCALE_GAIN(16, VEML6031X00_SEL_MILLI_GAIN_X2000),
>> +};
>
> ...
>
>> +{
>> +	struct regmap *regmap =3D data->regmap;
>> +	struct device *dev =3D data->dev;
>
> In case you really need a 'dev' here, pass via function parameter, no nee=
d to
> keep it in the 'data'.
>
Ack.
>> +	struct regmap_field *rm_field;
>> +	struct veml6031x00_rf *rf =3D &data->rf;
>> +
>> +	rm_field =3D devm_regmap_field_alloc(dev, regmap, veml6031x00_rf_gain)=
;
>> +	if (IS_ERR(rm_field))
>> +		return PTR_ERR(rm_field);
>> +	rf->gain =3D rm_field;
>> +
>> +	rm_field =3D devm_regmap_field_alloc(dev, regmap, veml6031x00_rf_it);
>> +	if (IS_ERR(rm_field))
>> +		return PTR_ERR(rm_field);
>> +	rf->it =3D rm_field;
>> +
>> +	rm_field =3D devm_regmap_field_alloc(dev, regmap, veml6031x00_rf_pd_di=
v4);
>> +	if (IS_ERR(rm_field))
>> +		return PTR_ERR(rm_field);
>> +	rf->pd_div4 =3D rm_field;
>> +
>> +	return 0;
>> +}
>
> ...
>
>> +static int veml6031x00_get_it(struct veml6031x00_data *data, int *val2)
>> +{
>> +	int ret, it_idx;
>
> Why is 'it_idx' signed?
>
I'll make it unsigned int.
>> +
>> +	scoped_guard(mutex, &data->scale_lock) {
>> +		ret =3D regmap_field_read(data->rf.it, &it_idx);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	ret =3D iio_gts_find_int_time_by_sel(&data->gts, it_idx);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	*val2 =3D ret;
>> +
>> +	return IIO_VAL_INT_PLUS_MICRO;
>> +}
>
> ...
>
>> +static int veml6031x00_set_it(struct iio_dev *iio, int val, int val2)
>> +{
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	int ret, gain_sel, gain_reg, pd_div4, it_idx, new_gain, prev_gain, pre=
v_it;
>
> Similar question here and so on...
>
Ack.
>> +	bool in_range;
>
>> +}
>
> ...
>
>> +	ret =3D regmap_field_write(data->rf.pd_div4, gain_sel >> 2);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_field_write(data->rf.gain, gain_sel & 0x03);
>
> Looks like repetitive piece of code, shouldn't be a helper?
>
> ...
>
Ack.
>> +static int veml6031x00_single_read(struct iio_dev *iio, enum iio_chan_t=
ype type,
>> +				   int *val)
>> +{
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	int addr, it_usec, ret;
>> +	__le16 reg;
>> +
>> +	switch (type) {
>> +	case IIO_LIGHT:
>> +		addr =3D VEML6031X00_REG_ALS_L;
>> +		break;
>> +	case IIO_INTENSITY:
>> +		addr =3D VEML6031X00_REG_IR_L;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(data->dev, pm);
>> +	ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D veml6031x00_get_it(data, &it_usec);
>> +	if (ret < 0)
>> +		return ret;
>
>> +	/* integration time + 10 % to ensure completion */
>
> fsleep() adds up to 25%, isn't it enough?
>

The problem is that it adds UP to 25%, but that is not guaranteed. If
almost no extra delay is added, it will be below the margin I added,
which was necessary when I tested this delay with real hardware.

>> +	fsleep(it_usec + (it_usec / 10));
>> +
>> +	ret =3D regmap_bulk_read(data->regmap, addr, &reg, sizeof(reg));
>> +	if (ret)
>> +		return ret;
>> +
>> +	*val =3D le16_to_cpu(reg);
>> +	return IIO_VAL_INT;
>> +}
>
> ...
>
>> +static int veml6031x00_validate_part_id(struct veml6031x00_data *data)
>> +{
>> +	int part_id, ret;
>> +	__le16 reg;
>> +
>> +	ret =3D regmap_bulk_read(data->regmap, VEML6031X00_REG_ID_L, &reg,
>> +			       sizeof(reg));
>> +	if (ret)
>> +		return dev_err_probe(data->dev, ret, "Failed to read ID\n");
>> +
>> +	part_id =3D le16_to_cpu(reg);
>> +	if (part_id !=3D data->chip->part_id)
>> +		dev_warn(data->dev, "Unknown ID %04x\n", part_id);
>
> dev_warn_probe() for the sake of consistency?
>

Jonathan would like this to be a dev_info().

>> +	return 0;
>> +}
>
> ...
>
>> +static int veml6031x00_hw_init(struct iio_dev *iio)
>> +{
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	struct device *dev =3D data->dev;
>> +	int ret;
>> +
>> +	/* Max resolution =3D 6.9632 lx/cnt for gain =3D 0.125 and IT =3D 3.12=
5ms */
>> +	ret =3D devm_iio_init_iio_gts(dev, 6, 963200000,
>> +				    veml6031x00_gain_sel,
>> +				    ARRAY_SIZE(veml6031x00_gain_sel),
>> +				    veml6031x00_it_sel,
>> +				    ARRAY_SIZE(veml6031x00_it_sel),
>> +				    &data->gts);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to init iio gts\n");
>
> IIO GTS
>
Ack.
>> +	return 0;
>> +}
>
> ...
>
>> +static int veml6031x00_probe(struct i2c_client *i2c)
>> +{
>> +	struct device *dev =3D &i2c->dev;
>> +	struct veml6031x00_data *data;
>> +	struct iio_dev *iio;
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	regmap =3D devm_regmap_init_i2c(i2c, &veml6031x00_regmap_config);
>> +	if (IS_ERR(regmap))
>
>> +		return dev_err_probe(dev, PTR_ERR(regmap),
>> +				     "Failed to set regmap\n");
>
> One line is okay.
>
Ack.
>> +	iio =3D devm_iio_device_alloc(dev, sizeof(*data));
>> +	if (!iio)
>> +		return -ENOMEM;
>> +
>> +	data =3D iio_priv(iio);
>> +	i2c_set_clientdata(i2c, iio);
>
>> +	data->dev =3D dev;
>> +	data->regmap =3D regmap;
>
> As I said, one of these two is redundant.
>
Ack.
>> +	ret =3D devm_mutex_init(dev, &data->scale_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D veml6031x00_regfield_init(data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to init regfield\n");
>> +
>> +	ret =3D devm_regulator_get_enable(dev, "vdd");
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to enable regulator\n");
>
>> +	data->chip =3D i2c_get_match_data(i2c);
>> +	if (!data->chip)
>> +		return dev_err_probe(dev, -EINVAL, "Failed to get chip data\n");
>
> I would move this closer to the point when we have data allocated. This i=
s
> a cheap check and it's better to boil out without need to allocate resour=
ces,
> touch regulators (that might be undesired from power consumption and phys=
ical
> processes due to the dragging them on and off), et cetera.
>

Ack.

>> +	/* The device starts in power down mode by default */
>> +	ret =3D veml6031x00_als_power_on(data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to power on the device\n");
>> +
>> +	ret =3D devm_add_action_or_reset(dev, veml6031x00_als_shutdown_action,=
 data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to add shutdown action\n");
>> +
>> +	pm_runtime_set_autosuspend_delay(dev, 2000);
>> +	pm_runtime_use_autosuspend(dev);
>> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
>> +
>> +	ret =3D devm_pm_runtime_get_noresume(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get runtime PM\n");
>> +
>> +	ret =3D veml6031x00_validate_part_id(data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	iio->name =3D data->chip->name;
>> +	iio->channels =3D veml6031x00_channels;
>> +	iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels);
>> +	iio->modes =3D INDIO_DIRECT_MODE;
>> +	iio->info =3D &veml6031x00_info;
>> +
>> +	ret =3D veml6031x00_hw_init(iio);
>> +	if (ret)
>> +		return ret;
>
>> +	pm_runtime_put_autosuspend(dev);
>
> Hmm... But why? Wouldn't this be problematic with reference count on the =
failed
> devm_iio_device_register() below?
>

I could move this a bit further down after devm_iio_device_register(),
but as I replied to a Sashiko complaint, the reference count will never
underflow in this configuration.

>> +	ret =3D devm_iio_device_register(dev, iio);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register iio device\n");
>> +
>> +	return 0;
>> +}
>
> ...
>
>> +static DEFINE_RUNTIME_DEV_PM_OPS(veml6031x00_pm_ops, veml6031x00_runtim=
e_suspend,
>> +				 veml6031x00_runtime_resume, NULL);
>
> Wrap this logically:
>
> static DEFINE_RUNTIME_DEV_PM_OPS(veml6031x00_pm_ops,
> 				 veml6031x00_runtime_suspend,
> 				 veml6031x00_runtime_resume,
> 				 NULL);
>
> OR
>
> static DEFINE_RUNTIME_DEV_PM_OPS(veml6031x00_pm_ops,
> 				 veml6031x00_runtime_suspend, veml6031x00_runtime_resume, NULL);
>
> ...
>

Ack.

>> +static const struct i2c_device_id veml6031x00_id[] =3D {
>> +	{
>> +		.name =3D "veml6031x00",
>> +		.driver_data =3D (kernel_ulong_t)&veml6031x00_chip
>
> In the similar (to OF ID table) way, leave trailing commas.
>
Ack.
>> +	},
>> +	{
>> +		.name =3D "veml6031x01",
>> +		.driver_data =3D (kernel_ulong_t)&veml6031x01_chip },
>
> Broken indentation, should be a new line somewhere.
>
Ack.
>> +	{
>> +		.name =3D "veml60311x00",
>> +		.driver_data =3D (kernel_ulong_t)&veml60311x00_chip
>> +	},
>> +	{
>> +		.name =3D "veml60311x01",
>> +		.driver_data =3D (kernel_ulong_t)&veml60311x01_chip
>> +	},
>
>> +};

Best regards,
Javier
