Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1E33B9DAB
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027703; cv=pass; b=VCMCdZTQS5f9pnu9b0rQzh9WdaL6l1LnK70UttKgsThhUh8+KUgYmwOfZU8zKj3RKNmHognyYY1T81dv5bY/cMM4ZieL+XQ80m4jZUuphZNZgVFWou+1HSZ/OEgR2ePvnMPyiVZ+8NrRdbxMY2RffXcMX3Rv4A+ho7zSSqdw+3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027703; c=relaxed/simple;
	bh=a9s45M2yFd2luVa3ROR6IXVFEmUl8An+BjESOWtxj18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oz68IeSAQqQN7jfyZML4514Cqi0N2jTfsFCmjsSqA7gSuLIgK3QTakmcQbI+/XJh1pCjq5VkY2fjqFNhL/jXbjfOgAF1n9tnGGbezm/i9dy2uoRRucGChAps0DoLyvkb84Y1d11CRDH06iL6NZtkfyN/gdzbzxFKT6TA/aamMWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a82VVafq; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a82VVafq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so7152725e9.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779027690; cv=none;
        d=google.com; s=arc-20240605;
        b=AhluuOqBnp50Mz7vSapQ4Xv5vfrU/BqodUtMprUE4l6Lqn5LMz6KPw2x03lyohJipf
         XvwIs6d6a5P2HKHZJqvE1A9K35v+DJcFOYVDAycayaoGfxqeD6AXKa6DUKmoZkVyBEDw
         x32PLn4cq0ACpkvR9yPClJEbafbiuRiVOg45o0Z0JJJqfGksEibpbSRADrBsCFOgfEKu
         vOLvpAgp98SsFMB9CZGovF+w0YAfEyX1RmCQPZexyqqzROKrL2VgZG+RlhB4CJZ/Mfzv
         3Al/cfYQ078WV8pusHQ/qywDxsmLNfibJkQs8e79dkZ2VEO/MI5kmNIgrfZ/WmTNmGAx
         /PXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u0XJWqDAWCmfrV09OO90ILuAbPxPPBqO51QHu07miis=;
        fh=aIxQ7NDg/s4M/b4+2i4fS6ABoaxvBwqWqC0U+G+Y7F0=;
        b=JdUoKrxNPYoqHtCg4JHebqTFN77aQOAV6eal31uS0J2dd+z7oElD34MUXPoVR6D5gh
         IlJC/hg6pL1CbVis+tixqdTccUtEneTWuRJrxSZMtlDahf6IdWBv7EWj8esyPre23sYJ
         3hc/UvLeU7t0OG2ams1cAmAETTClm+vVdjJPr05UNTgc7eB8PXoh7WS/y6JBTh0xE3/M
         vSiWzZb9mCXet9BpMMM0yp5tEHQ8mkTNHS7fN6ce2Ioxs+hfcK5kJOrahqDTdyBgrBTq
         mlV+tdurW8ZQEm3B+GpO9y14lgW3b2KhOdWZqjpyLG8m2PEvYIqgNpWao6PNHi790fjs
         4JhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027690; x=1779632490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u0XJWqDAWCmfrV09OO90ILuAbPxPPBqO51QHu07miis=;
        b=a82VVafqMMURuYCmwwxMIl7YK9psfar7PaH4PpujRWsTXBsIep5UwvOrwTHJbbhHlM
         P/ovKiwMhpZYw9HPEyXk+o2RYYoRtGREk7ADl7zbUnyUfH0ix3oTKkyI+ENCfR3E1aA/
         8aS33IoKaiVT4AUJleUhdbY7+8+BDqfPKJDmqqwJdw6BE/wSCWeyEtcsaT8hnzg8LziA
         0Bf+v9rn7SOVwtPJyuhFPdMtoIDX4yfVCcQUbUSqqLO8p3EwCzcCFQZslMNGzQzQtBvr
         7qfXO3iX1QsJr0jcO5aP8OB69MrZ3j++Sdtng6kwjAXOHG4pYvPt92X7U6Du++AUbY9Y
         KiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027690; x=1779632490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0XJWqDAWCmfrV09OO90ILuAbPxPPBqO51QHu07miis=;
        b=R7Qv6qj/ykLDajv0BU8wByBf4W0XHBxgXqyz3XDVNjOS3nosgzhq2Yj/gT8cJHnrGy
         jycgfoBb+HcYdkkNVCqDmyYB2j+nr3MzAUAgViusW4Wcj5bflXO37mwxqnW6TX7vm9vA
         mxlfCLWIJtArnKc+5BDy0Hx5sjMugWLpLwEMI6Q711kZNwvcWAwfLl7wr9c+if7pJ9AK
         f2TcPoDMdvQhhQ5EpB1w6A11AObaqqc5elQK1LMxuVhSPcq0T8Y/DBqk830I5oN9kj3T
         lK8bl3Fe3N2bfGfSUUfavrbP1Fm5buEYMAYHReKIKXmhR8HL1zCN7ssjTKKh2Xu3YzTm
         nvdg==
X-Forwarded-Encrypted: i=1; AFNElJ8R8FPzRGrwvq3602jQy40eGHkoWwFpGSEcC5m71lTU5Brh9O/nDx7zV0k5UE7pw1u2zc+6Jq1ebjee@vger.kernel.org
X-Gm-Message-State: AOJu0YyBwULC6hxyLoHJb0Km2PG9o29moRaKVk2XqZmAr0KHHJYoJDVF
	PHwnzyiQGuaPTKnFqnJ1JsccYuJW2D51r32Ld46SeuFCi5MjQqylBmaXXcl13xk65vEakN0QU7u
	z33AnZFr8VAdHxUPGt0bdRsI1uWMItzQ=
X-Gm-Gg: Acq92OG3YHY+3c1FKkmyT0UmXwqqbDlYNjPCp7WdSg+Tjjj7n0N0YybxJg9ilBrGQwl
	2fsSgvJXoslwIW3esBtkqoyeyXkKXaPsRBCRJkoKbC8zOIthr8SVo5IN2yP445W5y8GkjisEby9
	zcpLywd51iTZbkVwlAakUUiTka5q3Q9FLMv9u3sP1vl3Kp0FEwF4VBgWzB8vB9N6vmJI0QJY7wQ
	Ut0yqlp8UnxtWI755SUa5H/bQ+cXjrjNCPa8PU9ohfVvnVOr/MEJM4+DpGqQ8cMcGyRGG1BbLg7
	IndKAx1cwx5Aw/Uign94rzz8FMkXfzRe4q5eyz1yCbXYmKD8ri7VAebdWhTbgV/1XSzQQfZgEqB
	1hcdLp1QTjoCRuxD/CpIh0DHj4gRs9tBUh/ZsSOkeTPhxZc4Jg8iQRBFNF/dn3g8L2OO2Sw2R2p
	p7VGW6wM0=
X-Received: by 2002:a05:600c:46d0:b0:489:1abb:5559 with SMTP id
 5b1f17b1804b1-48fe4dad784mr150638425e9.5.1779027689648; Sun, 17 May 2026
 07:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com>
 <20260516-veml3328-v1-2-1d4b663e2fe3@gmail.com> <20260517143449.6c30b99f@jic23-huawei>
In-Reply-To: <20260517143449.6c30b99f@jic23-huawei>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 17 May 2026 16:21:16 +0200
X-Gm-Features: AVHnY4LjscMK8M-TbLFayvnP80RNXxkDxv38M4KTbwHHOj0-FiQEilFrkPbwlXQ
Message-ID: <CALoEA-z5dJLYC_L93hPo5zpgB+yhjH3iOje1V5XgQ1aOPppU=Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: light: veml3328: add support for new device
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 May 2026 at 15:34, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sat, 16 May 2026 23:50:54 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> > Add support for the Vishay VEML3328 RGB/IR light sensor communicating
> > via I2C (SMBus compatible).
> >
> > Also add a new entry for said driver into Kconfig and Makefile.
> >
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Hi Joshua,
>
> Pretty nice for a v1.  A few comments inline to add to
> the other reviews (I may well have duplicated some!)
>
> Jonathan
>
> > diff --git a/drivers/iio/light/veml3328.c b/drivers/iio/light/veml3328.c
> > new file mode 100644
> > index 000000000000..9eb5429c813d
> > --- /dev/null
> > +++ b/drivers/iio/light/veml3328.c
> > @@ -0,0 +1,405 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Vishay VEML3328 RGBCIR light sensor driver
> > + *
> > + * Copyright (c) 2026 Joshua Crofts <joshua.crofts1@gmail.com>
> > + *
> > + * Datasheet: https://www.vishay.com/docs/84968/veml3328.pdf
> > + */
> > +
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
> > +
> > +#include <linux/iio/iio.h>
> > +
> > +#define VEML3328_REG_CONF            0x00
> > +#define VEML3328_REG_ID                      0x0c
> > +#define VEML3328_REG_DATA_C          0x04
> > +#define VEML3328_REG_DATA_R          0x05
> > +#define VEML3328_REG_DATA_G          0x06
> > +#define VEML3328_REG_DATA_B          0x07
> > +#define VEML3328_REG_DATA_IR         0x08
> > +
> > +#define VEML3328_IT_MASK             GENMASK(5, 4)
> > +#define VEML3328_GAIN_MASK           GENMASK(11, 10)
> Name these so it is obvious which register they are in.
> I guess VEML3328_CONF_IT_MASK etc.
>
>
> > +
> > +#define VEML3328_ID_VAL                      0x28
> > +
> > +#define VEML3328_CONF_SD0            BIT(0)
> > +#define VEML3328_CONF_SD1            BIT(15)
> These two don't add anything given always used together.
> > +#define VEML3328_SHUTDOWN            (VEML3328_CONF_SD0 | VEML3328_CONF_SD1)
>
> #define VEML3328_SHUTDOWN               BIT(0) | BIT(15)
>
> is sufficient

Ah, fair enough, that's a remnant of me using existing drivers
as inspiration.

> > +
> > +struct veml3328_data {
> > +     struct regmap *regmap;
> > +     struct device *dev;
> The use of the one embedded in regmap got mentioned already in another review.
> > +     struct mutex lock;
> All locks need a comment saying what data they are protecting
> (might well be in the device).
>
> Mind you - I'm seeing quite a bit of locking around simple regmap calls.
> Given there are locks in regmap, you may need to call out if there
> is a particular readout sequence that must not be interrupted.
>
> I'm not immediately seeing one and as such you might not need a local
> lock.

I was on the fence with this one - my understanding was that the locking
in regmap was just for i2c bus interactions, not actual value read/writes.
I've no problem with removing it though if I am mistaken.

> > +};
> > +
> > +static const struct regmap_config veml3328_regmap_config = {
> > +     .name = "veml3328",
> > +     .reg_bits = 8,
> > +     .val_bits = 16,
> > +     .max_register = VEML3328_REG_ID,
> > +     .val_format_endian = REGMAP_ENDIAN_LITTLE,
> > +};
> > +
> > +#define VEML3328_CHAN_SPEC(_color, _addr) { \
> > +     .type = IIO_INTENSITY, \
> > +     .modified = 1, \
> > +     .channel2 = IIO_MOD_LIGHT_##_color, \
> > +     .info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> > +     .info_mask_shared_by_all = BIT(IIO_CHAN_INFO_INT_TIME) | \
> > +                                BIT(IIO_CHAN_INFO_SCALE), \
> > +     .info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_INT_TIME) | \
> > +                                          BIT(IIO_CHAN_INFO_SCALE), \
> > +     .address = _addr, \
> > +}
> > +
> > +static const struct iio_chan_spec veml3328_channels[] = {
> > +     VEML3328_CHAN_SPEC(CLEAR, VEML3328_REG_DATA_C),
>
> Would be nice to have a an IIO_LUX channel (always an approximation)
> as that tends to be what userspace wanges.
>
> Hmm. I googled a bit. Seems there is a note that has more info.
> https://www.vishay.com/docs/80010/designingveml3328.pdf
>
> Interestingly suggests that green channel is nearer than clear.
>
> If you can put the correct scaling in that would be a good thing
> to support (keep the green as well).

Sure, I was intending to do some extensions once this first version
gets polished and accepted, but I can do it now.

>
>
> > +     VEML3328_CHAN_SPEC(RED, VEML3328_REG_DATA_R),
> > +     VEML3328_CHAN_SPEC(GREEN, VEML3328_REG_DATA_G),
> > +     VEML3328_CHAN_SPEC(BLUE, VEML3328_REG_DATA_B),
> > +     VEML3328_CHAN_SPEC(IR, VEML3328_REG_DATA_IR),
> > +};
>
> > +
> > +static int veml3328_power_up(struct veml3328_data *data)
> > +{
> > +     int ret;
> > +
> > +     ret = regmap_update_bits(data->regmap, VEML3328_REG_CONF,
> > +                              VEML3328_SHUTDOWN, 0);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     fsleep(veml3328_it_times[3][1]);
>
> Add a comment on why we need to sleep maximum integration time.

Fair, I also made the value into a macro per Andy's comment.

> > +
> > +     return 0;
> > +}
> > +
> > +static void veml3328_power_down_action(void *data)
> > +{
> > +     veml3328_power_down(data);
> > +}
> > +
> > +static int veml3328_read_raw(struct iio_dev *indio_dev,
> > +                          struct iio_chan_spec const *chan,
> > +                          int *val, int *val2, long mask)
> > +{
> > +     struct veml3328_data *data = iio_priv(indio_dev);
> > +     struct regmap *regmap = data->regmap;
> > +     unsigned int reg_val;
> > +     int ret;
> > +     int reg;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     ret = pm_runtime_resume_and_get(data->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             ret = regmap_read(regmap, chan->address, &reg_val);
> > +             if (ret < 0)
> > +                     goto exit;
> > +
> > +             *val = reg_val;
> > +             ret = IIO_VAL_INT;
> > +             break;
> > +
> > +     case IIO_CHAN_INFO_INT_TIME:
> > +             ret = regmap_read(regmap, VEML3328_REG_CONF, &reg_val);
> > +             if (ret < 0)
> > +                     goto exit;
> > +
> > +             reg = FIELD_GET(VEML3328_IT_MASK, reg_val);
> > +             if (reg >= ARRAY_SIZE(veml3328_it_times)) {
> > +                     ret = -EINVAL;
> > +                     goto exit;
> > +             }
> > +
> > +             *val = veml3328_it_times[reg][0];
> > +             *val2 = veml3328_it_times[reg][1];
> > +             ret = IIO_VAL_INT_PLUS_MICRO;
> > +             break;
> > +
> > +     case IIO_CHAN_INFO_SCALE:
> > +             ret = regmap_read(regmap, VEML3328_REG_CONF, &reg_val);
> > +             if (ret < 0)
> > +                     goto exit;
> > +
> > +             reg = FIELD_GET(VEML3328_GAIN_MASK, reg_val);
> > +             if (reg >= ARRAY_SIZE(veml3328_scale_vals)) {
> > +                     ret = -EINVAL;
> > +                     goto exit;
> > +             }
> > +
> > +             *val = veml3328_scale_vals[reg][0];
> > +             *val2 = veml3328_scale_vals[reg][1];
> > +             ret = IIO_VAL_INT_PLUS_MICRO;
> > +             break;
> > +
> > +     default:
> > +             ret = -EINVAL;
> > +     }
> > +
> > +exit:
> > +     pm_runtime_put_autosuspend(data->dev);
> See below for comment on how to handle this using stuff that
> ultimately comes from cleanup.h
>
> > +
> > +     return ret;
> > +}
> > +
>
> > +
> > +static int veml3328_write_raw(struct iio_dev *indio_dev,
> > +                           struct iio_chan_spec const *chan,
> > +                           int val, int val2, long mask)
> > +{
> > +     struct veml3328_data *data = iio_priv(indio_dev);
> > +     struct regmap *regmap = data->regmap;
> > +     int ret;
> > +     int i;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     ret = pm_runtime_resume_and_get(data->dev);
>
> PM_RUNTIME_ACQUIRE_AUTOSUSPEND() will mean you can rely on this
> being auto suspended on exiting scope.  Will allow early returns
> and get rid of your goto that you noted already.

Oh, now that is interesting! It would simplify things greatly...

>
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_INT_TIME:
> > +             if (val != 0) {
> > +                     ret = -EINVAL;
> > +                     goto exit;
>
> With above, all these become direct returns.
>
> > +             }
> > +
> > +             for (i = 0; i < ARRAY_SIZE(veml3328_it_times); i++) {
> > +                     if (veml3328_it_times[i][1] == val2)
> > +                             break;
> > +             }
> > +
> > +             if (i == ARRAY_SIZE(veml3328_it_times)) {
> > +                     ret = -EINVAL;
> > +                     goto exit;
> > +             }
> > +
> > +             ret = regmap_update_bits(regmap, VEML3328_REG_CONF,
> > +                                      VEML3328_IT_MASK,
> > +                                      FIELD_PREP(VEML3328_IT_MASK, i));
> > +             break;
> > +
> > +     case IIO_CHAN_INFO_SCALE:
> > +             for (i = 0; i < ARRAY_SIZE(veml3328_scale_vals); i++) {
> > +                     if (val == veml3328_scale_vals[i][0] &&
> > +                         val2 == veml3328_scale_vals[i][1])
> > +                             break;
> > +             }
> > +
> > +             if (i == ARRAY_SIZE(veml3328_scale_vals)) {
> > +                     ret = -EINVAL;
> > +                     goto exit;
> > +             }
> > +
> > +             ret = regmap_update_bits(regmap, VEML3328_REG_CONF,
> > +                                      VEML3328_GAIN_MASK,
> > +                                      FIELD_PREP(VEML3328_GAIN_MASK, i));
> > +
> > +             break;
> > +
> > +     default:
> > +             ret = -EINVAL;
> > +     }
> > +
> > +exit:
> > +     pm_runtime_put_autosuspend(data->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static int veml3328_write_raw_get_fmt(struct iio_dev *indio_dev,
> > +                                   struct iio_chan_spec const *chan,
> > +                                   long mask)
> > +{
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_SCALE:
> > +     case IIO_CHAN_INFO_INT_TIME:
> > +             return IIO_VAL_INT_PLUS_MICRO;
>
> That's the default - no need for the callback.

Good point.

>
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static const struct iio_info veml3328_info = {
> > +     .read_raw = veml3328_read_raw,
> > +     .write_raw = veml3328_write_raw,
> > +     .read_avail = veml3328_read_avail,
> > +     .write_raw_get_fmt = veml3328_write_raw_get_fmt,
> > +};
> > +
> > +static int veml3328_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev = &client->dev;
> > +     struct veml3328_data *data;
> > +     struct iio_dev *indio_dev;
> > +     unsigned int reg_val;
> > +     int ret;
> > +
> > +     indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +
> > +     data = iio_priv(indio_dev);
> > +     i2c_set_clientdata(client, indio_dev);
> > +     data->dev = dev;
> > +
> > +     data->regmap = devm_regmap_init_i2c(client, &veml3328_regmap_config);
> > +     if (IS_ERR(data->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(data->regmap),
> > +                                  "Failed to initialize regmap\n");
> > +
> > +     ret = devm_mutex_init(dev, &data->lock);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = devm_regulator_get_enable(dev, "vdd");
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to enable regulator\n");
> > +
> > +     ret = regmap_read(data->regmap, VEML3328_REG_ID, &reg_val);
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "Failed to read ID register\n");
> > +
> > +     if ((reg_val & 0xff) != VEML3328_ID_VAL)
> > +             return dev_err_probe(dev, -ENODEV, "Invalid device ID\n");
>
> This breaks fallback dt compatibles.
> If some future part is released that backwards compatible with this one, then
> the dt-binding will reflect that.  That future part will typically have a different
> ID_VAL.  We need that case of new binding, older kernel to work so this can't
> fail probe.  It is fine to print a message though to indicate we are seeing
> a value that we don't know about.
>
> Note sashiko moans about this sometimes. It's wrong so ignore it on this
> particular thing!  Sadly it's seeing a lot of older drivers where we did this
> wrong in the past and haven't adding the churn needed to fix them all.

Yes, Andy already pointed out to use dev_warn() instead. Good idea.

Overall I appreciate the review as this is my first attempt at a driver.

-- 
Kind regards

CJD
