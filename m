Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED5D35E1B3
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779017959; cv=pass; b=F0VVfGRsMMw5SF/eaCtYuKkCe1QlZZEhYZZRZkL8WfikLeyBJMkmx82JjqmLdwRdBNr5V/8hcW47r4rp26HJKqcbCBNWPo1WC4rtf+PeZ1upiI/x8Q8kRc6wf4ZfoRSyowRXzG9OkPvhL4QMxmTAyO91vXFTITWRMGD+Wtb6zyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779017959; c=relaxed/simple;
	bh=07BG2HCqLs24wN0p8rBiWh3sYfZF1TO/IvFxuWh5zgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h137hmR9ck4evLAjiU6xSK9XYd+HoYJc+NhnuvGkSQctIUbvXSv3V9GXlagZtsxA3Pi2vssWNaK1WZowa6bkbxoM48+4ecFvzzttYDv0shRoZD4QO5ZL/zqa3sSI47i7u3j3x+DapNSpMcCk0TjWws3yorKEbBADnP1cOnMOhvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV475T8u; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV475T8u"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-448528f4e69so685069f8f.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 04:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779017956; cv=none;
        d=google.com; s=arc-20240605;
        b=WnpK5YJW9S3JawTO3SuHiX9VgHummhTfkT5TrfrO3RHGAu6ocULOqwd7NbUKw76dry
         Uki2ZiIt5SmVTLzFGRkSilWW8Ej56o8hbMSqoNLnH5Dl+kEd+wDONdXA619E0sJRI7W7
         CO55uE9PlqGHeyJBfWDB34082WAJG9lnQ8TlLnCGfeXQY341xvEZYS4uNwa1Gj3RUvc7
         TS1S0UXJ15MFkxkAeL4MERBWdF/B/vmBoPKVl0t1d/fYlFErEcx49QgSCpGJqnKEIDCq
         1cGy3r1+Wc5UvcB5oHaLhFyOcXnZ86lcWSQZfbtaf4wcLLvfd5bPko0FKkSY3trhhcxe
         IVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h13AhDdJlu2pMhIlj69wYMw3L6813Wz3IcR1YzvG8Qw=;
        fh=uRoCZ4yWunZ1YMojQsArLQzvieAJZwOwxGzgytNvsgc=;
        b=VPMDiCr2gjXW4S5TRYYDFgjc9P2qK2JDRJWDrG27eSeM8G9w1I5PIhRJBDJ1WdKkBc
         20oStWLkHQBJ77w7852l7bySKGUNg2UK/uIIFAGp2uxGBVaUOFa3QHducOkar0iNXTay
         /O01BIW8JULEwIKEeATh890J1LF3L26C7twlo3HQ6xUNbJD9O4YL26KqCCi9XXdPRHLY
         US3ImY2zLfnp/l9kYKUmRFhRK2TT9yo4rpnkK7zLiGLGY2ukH4KojGdE0aHPU0SP3UOG
         yS3TW9cxlNHLl7BEA/p1DyCwEQOgFBPq0XE4rXr36/vMWZljyfv3UipV11YgltwWsOPd
         MYCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779017956; x=1779622756; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h13AhDdJlu2pMhIlj69wYMw3L6813Wz3IcR1YzvG8Qw=;
        b=YV475T8u6lYwgbs225o8v/5YU/OjFI+FCT3NxfDN5YZDA5MemHxF6BDt+/1xQyyNoV
         Am4A9TzG/gZG/tnIqrwPfjLGbIFnRVCZHifd7YdQYTcx1Dk/J6RnxSv9EwGpFrE+PfOe
         NYVq6JBDEewCzm6xFn4tOFtJA05c2hhfTb4p2/kpAXT6bkl3xh49RlOaQcvo40pKa4B6
         yAzmvfm/w+ilTefr+doCJF/0v8G7o+Cp81G3I+jpm/vcj/xlEs9QOV8OJGpraR0K87WU
         B9yrZ0aASOQhEwQPuGF/qHUURo/58QMSXrg0KwgFdD0Hum9/4dWeD0rnsyIeufhKz2Dy
         gwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779017956; x=1779622756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h13AhDdJlu2pMhIlj69wYMw3L6813Wz3IcR1YzvG8Qw=;
        b=LojOm/nXZBdVHei925S3t/LmZU8yYjrOH6zkfEpCGglmospt6RdPV9FE6SePFt8yad
         qtFV+cUbBLhgj+8DBFH4Xc7dEyaEi08yYl/f/4irBIctGpuug5z35ZxDPXlt2YbZ71U1
         m7vDxZHfKxjSjDbmSGuFi+Lf9oQoIy8+AmpPQLGJfe56bmT8n6rMI2mywj2a/T9CumYq
         JzqyEC7h3y3nWKXZLpOZ2xF8P1uX3vgBX3ivF2R9sINXldhVhNAf5cav0zb3hiNUO/Dt
         biepq27tHF5n4j+7Bkue9xz1HPA7Ix4BVOv44/vlzbPuE07XacrEbIfPx3VGoS40Th3X
         opYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eW4rZ6Z/8p5LDLSTY9N2UjbxkSTSfhaBdChEFAURKOSZUgn2+pSF0/ITeYFVMlgE2rivr1+68t8dx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6EwEVm+08XwFr8bnFe+4WUB0nSvRVF4K/jnR3MHH0IJM5R2/V
	pNlNZeo69Of3iFCs9T4ES66BPojPejtMdzxH/XOX00V2R5arEjy9l80wyS5tSub63Qbl723T1LG
	zVc7HSMDeFaDZHmquCXy2+SrO5kN4EEU=
X-Gm-Gg: Acq92OFTKckO3cKutqCBNvz+X6DAe/oFbnzf3ypq2eePPZ5fa5NpC26N+oOp/s6ndq8
	ZlIjYZjHJfFD23kjL1BHIwV4gR2g7VatQiR0KmRvetpkZuwbnk9eYxCWLHkwsSDNMlw2mVHTkcO
	kZZeTQw4TFDAR4ku5fud863zk9KPlJQipsB/D3+8UOOa5w2z5X1ZwVtNKfRA5yjK7xnoq9ZAF10
	CFPbP701iV5ObDIehKAPGAayLSYJE6sVEUDKWiP8h/+trk1Fm5PrRGjDLBUvhqyocCMId34NV+L
	lw1sBhuflAhI269SMHWoiyThGILaRSu+RP8/bFXMoYGFV+ZldKAFaCRlW1IZvwW6y73TJrCS1g1
	Yv3bDo4YkNa7CB+6tF3/dQfD/QlE88z5JV5byZ35XezYpL6xgsF4LmyNbnzZgAGrHnQsVIQPjoj
	hIVs69T6c=
X-Received: by 2002:a5d:644e:0:b0:45e:739c:f187 with SMTP id
 ffacd0b85a97d-45e739cf872mr2376508f8f.22.1779017956020; Sun, 17 May 2026
 04:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com>
 <20260516-veml3328-v1-2-1d4b663e2fe3@gmail.com> <aglz4Z-10mzQBzvL@ashevche-desk.local>
In-Reply-To: <aglz4Z-10mzQBzvL@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 17 May 2026 13:39:03 +0200
X-Gm-Features: AVHnY4JJZYzoP3GtCnJcND-dB3yimuGo4vPxyJMnvdKPnn1M7vXd2xhOhoVm3pw
Message-ID: <CALoEA-y_us2D3_=AkLNQ+OEROjRt6+OQKi-xm6AWus_pjtHLMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: light: veml3328: add support for new device
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 May 2026 at 09:53, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Sat, May 16, 2026 at 11:50:54PM +0200, Joshua Crofts wrote:
> > Add support for the Vishay VEML3328 RGB/IR light sensor communicating
> > via I2C (SMBus compatible).
> >
> > Also add a new entry for said driver into Kconfig and Makefile.
>
> ...
>
> IWYU.
>
> + array_size.h

Ah, missed that one.

> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
>
> Most likely + types.h.
>
> ...
>
> > +struct veml3328_data {
> > +     struct regmap *regmap;
> > +     struct device *dev;
>
> Dup? We may derive one from the other (in case if regmap is registered with
> the same dev, otherwise needs a good comment explaining why not).
>
> > +     struct mutex lock;
> > +};

Okay, regmap is registered with the same device.

> ...
>
> > +/* integration times in microseconds */
> > +static const int veml3328_it_times[][2] = {
> > +     { 0, 50000 },
> > +     { 0, 100000 },
> > +     { 0, 200000 },
> > +     { 0, 400000 },
>
> USEC_PER_MSEC in all of them.

Good catch.

> > +};
>
> ...
>
> > +     return regmap_update_bits(data->regmap, VEML3328_REG_CONF,
> > +                               VEML3328_SHUTDOWN, VEML3328_SHUTDOWN);
>
> Here and everywhere else, use regmap_set_bits()/regmap_clear_bits() when
> appropriate.

No problem.

> ...
>
> > +static int veml3328_power_up(struct veml3328_data *data)
> > +{
> > +     int ret;
> > +
> > +     ret = regmap_update_bits(data->regmap, VEML3328_REG_CONF,
> > +                              VEML3328_SHUTDOWN, 0);
> > +     if (ret < 0)
> > +             return ret;
>
> > +     fsleep(veml3328_it_times[3][1]);
>
> This is not good. Why do we have a table from which we are using only one
> value? Define it properly and use here.

My bad, will use a macro instead.

> > +     return 0;
> > +}
>
> ...
>
> > +             ret = regmap_read(regmap, chan->address, &reg_val);
> > +             if (ret < 0)
>
> Do all these ' < 0' for regmap API make any sense?

I guess not, will change these to use (ret)
>
> > +                     goto exit;
>
> ...
>
> > +     ret = pm_runtime_resume_and_get(data->dev);
> > +     if (ret < 0)
> > +             return ret;
>
> There are respective PM_RUNTIME_*() macros.
>
> ...
>
> > +     if ((reg_val & 0xff) != VEML3328_ID_VAL)
>
> Do you need the & 0xff? Do you have register width > 8 bits?

The datasheet says that the high byte is reserved (silicon revision imo),
so it does contain data, therefore it has to be masked.

>
> > +             return dev_err_probe(dev, -ENODEV, "Invalid device ID\n");
>
> We don't fail on that, now we just warn.

Alright.

> ...
>
> > +static DEFINE_RUNTIME_DEV_PM_OPS(veml3328_pm_ops, veml3328_runtime_suspend,
> > +                              veml3328_runtime_resume, NULL);
>
> Split logically.

Easy enough.

>
> ...
>
> > +static const struct i2c_device_id veml3328_id[] = {
> > +     { "veml3328" },
>
> Use .name.
> This is a new development due to some Uwe's ongoing (re)work on ID tables.

Sure.

> > +     { }
> > +};
>
> ...
>
> Was this AI-assisted? If so, don't forget to add tags.

My bad, forgot to add it. Thanks for the detailed review!


--
Kind regards

CJD
