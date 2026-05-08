Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3092736D9F6
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 05:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778218853; cv=none; b=jucJH4q8ZH59y2M7xQ+ujSXYis5DBwflpbNZWO1uVZMP/R153sgc0VtEMN5rQAW4sP/5Q/X/vkCSG4hWH3sCTdSeh6HOimz+dpc/gij20TY1MfG+6X2vX8pnGxBpgLEOJ7oDVJ8PNNcVbCq9G5lZrDdpzC7m8/a3VOAnpo+wNng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778218853; c=relaxed/simple;
	bh=aHH5sVtLipwO2ZtQ6wTNhUu9NOHfSFOwMWxkCdycvTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kx1AT3VVsM7ThQybuRuQjOox779TbLfeFKQmLp1LoMN0WBFhou+vIRW42I6UrPO8KuBWDg1jOywiIOtNorm3R2BBhRVQYh0DomUe3xJBWZUWkwlhUMkpTqvu8wWhOk/Y7BpO1jFvin1RLSvUcG/ZHI1p3EnOxvlw4kcbo+ib5Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMEAXCAV; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMEAXCAV"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c156c4a9efso2228410eec.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778218834; x=1778823634; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ksmwXaiHory2UHn0wP49erDqYkPYenClnhvYzwICpYw=;
        b=aMEAXCAV5LJo2unBanuqRp0Dwqx1NrWl/bCNaxWyf0rQirZ8yTmuCl+EfFHUdkc1AV
         axjmZKDV5PkX5BnerH+hcQ3HOb3emnPDkUANSU9Sk7Jfpwho7Ee/5bhRc5jAZya2Z2Y0
         FSTZjxSe7FNyoAEh85BRISsutaFm7ddSjf9aJiP86cPPV6snHDO9YmvTSCYNb61LBKLV
         AnZRBBsUC3C+sahS/dT5yZ6kwbx5b2vyOg0VHZ9F/yfegul4q518T+N/Yf7+JyN5J709
         jXZLQ2XeDHeLVc4VifdPPPsC65Vs+LEuC6IMf8uriUTcJ8x98lrNx3bnyG8gpp/55+AQ
         fZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778218834; x=1778823634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksmwXaiHory2UHn0wP49erDqYkPYenClnhvYzwICpYw=;
        b=lv/ZJNDOFzrUtyozdtFt4utTdgFm7KJ27iIs0AcdkLTSKcoSH3NzuUAQqqOOKsNUCB
         RjiQryi23Vn6mOjpdW88ufHF16ApPR0i3zuMcwkQVXED5UyCginhtM0fXbKXyvdGhZWo
         jJWCU4CPHhfAW5VUVLh61leG5H5ckFSzmW+gD0IfTEHd7z/HIr6YLVzjZliHDgZFWfLa
         /iD5N3zls2gtX2eY1Ik2Zr4y5MTWzRKjNZosN1W25odBSrM84O0z8Xt8ibz2697egEcC
         5/jeysz3rEQIekLa+QyilyRBBn9aQDio08yDr2hM8PP0uX7fUnvE90CBApHsGeXn3A71
         7hiw==
X-Forwarded-Encrypted: i=1; AFNElJ8kVkIwTlbs2+KvJhKUeaCQeX4eM8vOFG8S9BSyayD2cQWZNKuabJId3XuyaJUqC7X15f+DouYgxGai@vger.kernel.org
X-Gm-Message-State: AOJu0YyhyNO949XHPaw0qdKBYRMWfuvVl98RMFeImUabpvcTneiIaORU
	GSSQzlJvwR7wKYrxTBynmd+N01S7FRc3jj+5LjPK1KVCLX17EXKgYkJRcsRtQA==
X-Gm-Gg: Acq92OFxVMljcOtvtraLGkdKXzzKifbCUvY8ejLWd487th2O640oip3RMniRgm3jIqf
	N0ZnkZI9DvsQ+q8mkwsKV8CwiLchLs8LVSSBBJNQI/4w35A00/CuPHnGTjE11q378QHsVHSK+RT
	knOZyFc7JeaHyJjCuuJpcONX60O4sBYXhAWaJTd10uZBNE60UXQBAo8ijTZk5UOBHugBGM2Jp7z
	tqb6z63mJDZSK1WeXbqDCEvSNFWUCGoTvSWT2punZMWUgS0P9JNQJOKeG/G3CUf8bCiwWebhgfk
	6zzjXLW8u46kwOZDdEHFcTiT9dVVBpbvJJet9ndEJYAw7J9d9OjOnb1Y5LN1nSYlv0XvT37U+J2
	XlYZcxW4fdWlG98X7jNQtNCzK5G50CnYRn7OrbCCNcybK1VdUCMxXJpyB58D2PW1Wc/NlDa+Tux
	uMM6zVfIu0xzCFrIVMTPe18Gt30pSliiA47m1XAHcYl+bp0XsCWBQ6mCKsB0B5iRlhmvX0riF62
	TU=
X-Received: by 2002:a05:7300:2146:b0:2e6:e77d:7bcf with SMTP id 5a478bee46e88-2f54f9442edmr5665866eec.22.1778218833571;
        Thu, 07 May 2026 22:40:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:852e:ebf3:8de1:32e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859e8389sm903075eec.3.2026.05.07.22.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:40:32 -0700 (PDT)
Date: Thu, 7 May 2026 22:40:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] Input: isa1200 - new driver for Imagis ISA1200
Message-ID: <af115srC-zwjDxzq@google.com>
References: <20260507133948.75704-1-clamor95@gmail.com>
 <20260507133948.75704-3-clamor95@gmail.com>
 <afzJUcvQth6v9KGC@google.com>
 <CAPVz0n0w98wO_iJBiyvKqATA7a6+mkZG3DfbBwHp8FEExMHPqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0w98wO_iJBiyvKqATA7a6+mkZG3DfbBwHp8FEExMHPqQ@mail.gmail.com>

On Fri, May 08, 2026 at 08:30:19AM +0300, Svyatoslav Ryhel wrote:
> чт, 7 трав. 2026 р. о 22:26 Dmitry Torokhov <dmitry.torokhov@gmail.com> пише:
> >
> > Hi Svyatoslav,
> >
> > On Thu, May 07, 2026 at 04:39:48PM +0300, Svyatoslav Ryhel wrote:
> > > From: Linus Walleij <linusw@kernel.org>
> > >
> > > The ISA1200 is a haptic feedback unit from Imagis Technology using two
> > > motors for haptic feedback in mobile phones. Used in many mobile devices
> > > c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Beam
> > > GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.
> > >
> > > The exact datasheet for the ISA1200 is not available; all data was modeled
> > > based on available downstream kernel sources for various devices and
> > > fragments of information scattered across the internet.
> > >
> > > Tested-by: Linus Walleij <linusw@kernel.org> # GT-I9070 Janice
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/input/misc/Kconfig   |  12 +
> > >  drivers/input/misc/Makefile  |   1 +
> > >  drivers/input/misc/isa1200.c | 540 +++++++++++++++++++++++++++++++++++
> > >  3 files changed, 553 insertions(+)
> > >  create mode 100644 drivers/input/misc/isa1200.c
> > >
> > > diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> > > index 94a753fcb64f..52f192104ee2 100644
> > > --- a/drivers/input/misc/Kconfig
> > > +++ b/drivers/input/misc/Kconfig
> > > @@ -852,6 +852,18 @@ config INPUT_IQS7222
> > >         To compile this driver as a module, choose M here: the
> > >         module will be called iqs7222.
> > >
> > > +config INPUT_ISA1200_HAPTIC
> > > +     tristate "Imagis ISA1200 haptic feedback unit"
> > > +     depends on I2C
> > > +     select INPUT_FF_MEMLESS
> > > +     select REGMAP_I2C
> > > +     help
> > > +       Say Y to enable support for the Imagis ISA1200 haptic
> > > +       feedback unit.
> > > +
> > > +       To compile this driver as a module, choose M here: the
> > > +       module will be called isa1200.
> > > +
> > >  config INPUT_CMA3000
> > >       tristate "VTI CMA3000 Tri-axis accelerometer"
> > >       help
> > > diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> > > index 415fc4e2918b..d62bf2e9d85f 100644
> > > --- a/drivers/input/misc/Makefile
> > > +++ b/drivers/input/misc/Makefile
> > > @@ -49,6 +49,7 @@ obj-$(CONFIG_INPUT_IMS_PCU)         += ims-pcu.o
> > >  obj-$(CONFIG_INPUT_IQS269A)          += iqs269a.o
> > >  obj-$(CONFIG_INPUT_IQS626A)          += iqs626a.o
> > >  obj-$(CONFIG_INPUT_IQS7222)          += iqs7222.o
> > > +obj-$(CONFIG_INPUT_ISA1200_HAPTIC)   += isa1200.o
> > >  obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)   += keyspan_remote.o
> > >  obj-$(CONFIG_INPUT_KXTJ9)            += kxtj9.o
> > >  obj-$(CONFIG_INPUT_M68K_BEEP)                += m68kspkr.o
> > > diff --git a/drivers/input/misc/isa1200.c b/drivers/input/misc/isa1200.c
> > > new file mode 100644
> > > index 000000000000..f8dba8a95c7d
> > > --- /dev/null
> > > +++ b/drivers/input/misc/isa1200.c
> > > @@ -0,0 +1,540 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +#include <linux/array_size.h>
> > > +#include <linux/bitmap.h>
> > > +#include <linux/bits.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/devm-helpers.h>
> > > +#include <linux/err.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/input.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/property.h>
> > > +#include <linux/pwm.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/units.h>
> > > +
> > > +/*
> > > + * System control (LDO regulator)
> > > + *
> > > + * LDO voltage to register mapping is linear, but it is split in two parts:
> > > + * 2.3V - 3.0V map to 0x08 - 0x0f; 3.1V - 3.8V map to 0x00 - 0x7
> > > + */
> > > +
> > > +#define ISA1200_SCTRL                        0x00
> > > +#define ISA1200_LDO_VOLTAGE_BASE     0x08
> > > +#define ISA1200_LDO_VOLTAGE_STEP     100000
> > > +#define ISA1200_LDO_VOLTAGE_2V3              23
> > > +#define ISA1200_LDO_VOLTAGE_3V1              31
> > > +#define ISA1200_LDO_VOLTAGE_MIN              2300000
> > > +#define ISA1200_LDO_VOLTAGE_MAX              3800000
> > > +
> > > +/*
> > > + * The output frequency is calculated with this formula:
> > > + *
> > > + *                 base clock frequency
> > > + * fout = -----------------------------------------
> > > + *        (128 - PWM_FREQ) * 2 * PLLDIV * PWM_PERIOD
> > > + *
> > > + * The base clock frequency is the clock frequency provided on the
> > > + * clock input to the chip, divided by the value in HCTRL0
> > > + *
> > > + * PWM_FREQ is configured in register HCTRL4, it is common to set this
> > > + * to 0 to get only two variables to calculate.
> > > + *
> > > + * PLLDIV is configured in register HCTRL3 (bits 7..4, so 0..15)
> > > + * PWM_PERIOD is configured in register HCTRL6
> > > + * Further the duty cycle can be configured in HCTRL5
> > > + */
> > > +
> > > +/*
> > > + * HCTRL0 configures clock or PWM input and selects the divider for
> > > + * the clock input.
> > > + */
> > > +#define ISA1200_HCTRL0                       0x30
> > > +#define ISA1200_HCTRL0_HAP_ENABLE    BIT(7)
> > > +#define ISA1200_HCTRL0_PWM_GEN_MODE  BIT(4)
> > > +#define ISA1200_HCTRL0_PWM_INPUT_MODE        BIT(3)
> > > +#define ISA1200_HCTRL0_CLKDIV_128    128
> > > +
> > > +/*
> > > + * HCTRL1 configures the motor type and clock sourse
> > > + */
> > > +#define ISA1200_HCTRL1                       0x31
> > > +#define ISA1200_HCTRL1_EXT_CLOCK     BIT(7)
> > > +#define ISA1200_HCTRL1_DAC_INVERT    BIT(6)
> > > +#define ISA1200_HCTRL1_MODE(n)               (((n) & 1) << 5)
> >
> > I wonder if this should simply be BIT(5) and you conditionally use it in
> > the code. The macro is not really usable to disable the setting...
> >
> 
> That was the initial idea but mode is not boolean it is an enum and
> macro fits better to handle enum. Code does not enable/disable this
> field, this field is configured with every start call.

OK.

> 
> > > +
> > > +/* HCTRL2 controls software reset of the chip */
> > > +#define ISA1200_HCTRL2                       0x32
> > > +#define ISA1200_HCTRL2_SW_RESET              BIT(0)
> > > +
> > > +/*
> > > + * HCTRL3 controls the PLL divisor
> > > + *
> > > + * Bits [0,1] are always set to 1 (we don't know what they are
> > > + * used for) and bit 4 and upward control the PLL divisor.
> > > + */
> > > +#define ISA1200_HCTRL3                       0x33
> > > +#define ISA1200_HCTRL3_DEFAULT               0x03
> > > +#define ISA1200_HCTRL3_PLLDIV(n)     (((n) & 0xf) << 4)
> > > +
> > > +/* HCTRL4 controls the PWM frequency of external channel */
> > > +#define ISA1200_HCTRL4                       0x34
> > > +
> > > +/* HCTRL5 controls the PWM high duty cycle of internal channel */
> > > +#define ISA1200_HCTRL5                       0x35
> > > +
> > > +/* HCTRL6 controls the PWM period of internal channel */
> > > +#define ISA1200_HCTRL6                       0x36
> > > +#define ISA1200_HCTRL6_PERIOD_SCALE  100
> > > +
> > > +/* The use for these registers is unknown but they exist */
> > > +#define ISA1200_HCTRL7                       0x37
> > > +#define ISA1200_HCTRL8                       0x38
> > > +#define ISA1200_HCTRL9                       0x39
> > > +#define ISA1200_HCTRLA                       0x3a
> > > +#define ISA1200_HCTRLB                       0x3b
> > > +#define ISA1200_HCTRLC                       0x3c
> > > +#define ISA1200_HCTRLD                       0x3d
> > > +
> > > +#define ISA1200_EN_PINS_MAX          2
> > > +
> > > +struct isa1200_config {
> > > +     u32 ldo_voltage;
> > > +     u32 mode;
> > > +     u32 clkdiv;
> > > +     u32 plldiv;
> > > +     u32 freq;
> > > +     u32 period;
> > > +     u32 duty;
> > > +};
> > > +
> > > +struct isa1200 {
> > > +     struct input_dev *input;
> > > +     struct regmap *map;
> > > +
> > > +     struct clk *clk;
> > > +     struct pwm_device *pwm;
> > > +     struct gpio_descs *enable_gpios;
> > > +
> > > +     struct work_struct play_work;
> > > +     struct isa1200_config config;
> > > +
> > > +     int level;
> > > +     bool clk_on;
> >
> > I think you need not only clk_on, but general "active" flag that you
> > would set at the end of isa1200_start().
> >
> 
> Acknowledged.
> 
> > > +};
> > > +
> > > +static const struct regmap_config isa1200_regmap_config = {
> > > +     .reg_bits = 8,
> > > +     .val_bits = 8,
> > > +     .max_register = ISA1200_HCTRLD,
> > > +};
> > > +
> > > +static void isa1200_start(struct isa1200 *isa)
> > > +{
> > > +     struct isa1200_config *config = &isa->config;
> > > +     struct pwm_state state;
> > > +     u8 hctrl0 = 0, hctrl1 = 0;
> > > +     DECLARE_BITMAP(values, ISA1200_EN_PINS_MAX);
> > > +     int ret;
> >
> > Please use "error" or "err" for all variables that only hold error codes
> > (or 0) instead of a real value that is used for something.
> >
> 
> Not real value, but return value. Why I cannot use ret aka return
> value? It is much more versatile since it can hold any function return
> value including errors.

This is my preference for input. I do not want versatility, I want the
opposite: if I see error I do not need to consider whether it holds
something of value besides an error code. And if I see "ret" or "retval"
I know that caller might be interested the value. And also

	if (error) {
		// handle error
	}

looks neat.

> 
> > > +
> > > +     if (!isa->clk_on) {
> > > +             ret = clk_prepare_enable(isa->clk);
> >
> > This return 0 on success so
> >
> >                 if (error)
> >                         return;
> >
> 
> No, code is correct. If clock enable fails, further function execution
> should stop since regmap operations on unconfigured device is not
> desirable. Since this function is void using general "active" flag as
> you suggested to indicate that start reached end would be beneficial.

I am simply saying that you do not need to check if value is negative,
checking that it is non-zero is sufficient.

Thanks.

-- 
Dmitry
