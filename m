Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F7E37DAA9
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328742; cv=none; b=KDsTIkqpcsoQbl77ystRtpQjNzoUNRjCYnvFP7CPktiEZed7vxmd493cMpWo7oGm1ooZ+sb6D2GR79gmweUZ7gs548S+izOungWAULmJppmIMEhuQnfduW5gzG1jAjG18PlktsXpDg8t1JJJiNOQMyukkTiDFljrlmoZbdwuh4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328742; c=relaxed/simple;
	bh=ROYx6QEukf3YLjEl566ZTbj9VuE6iPvNRMj6LD7v8eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmZcWyCE/xM/5v3T0ybdxTvDPoWxKGIVAo+JB3AgkcZiND/xAslrh2fab8UWYcoheSDaaqili+33aJN759hfUN2IVM3AFXbze2i6oc9lE0dFWcK6PWchOCTak47IC5aPYyMQoXTe8FqoGrxfaLjldZstoXvRnDLmc74JpHNP8hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaUJRkQN; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaUJRkQN"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304e83724bfso4302961eec.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780328740; x=1780933540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaqksUdxiXyCtVFqTvdAaP62ws3AIE3gaygTLx44flo=;
        b=RaUJRkQNSA2o5iSTJITFFeSw24PkWjZPSyIu+Z1gD/gk2Ulj2QdrefgKXaooOJUNuu
         ko7Ti/WzAmV2kIcizA4DiMCP+DV5CkDXIrVjE3hl286ggvDDhbczAC5zrXhRxVKas7Fg
         o/LF45t8MmOqn/lkUuahDfqUfT657ThINrXKQqA7hnkco5ArZzg+KhFWynafvGOfyHal
         ukuOynMioZNRfWEcgvQ3arj3O9FJ6fN+ezI7Xc1p+OiWFai9sY77RYBhk8FewHrzrsn0
         lyxQ4aV5F091dZvgb/iFzPAq3eS8SGwNdQzUyFvtdaNinb7WNueqG7fApXC5f25MoAid
         Kg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328740; x=1780933540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UaqksUdxiXyCtVFqTvdAaP62ws3AIE3gaygTLx44flo=;
        b=ThZ4HgeyzRqtUAighzjxQnhj+NV7J2BfAZNJOzSSOjrMgm5HVPKzxKO4bAR5UL0Sd/
         8/M+kPAAPTEkDHBSEbUpdChOV+SCDjL8EJK3jYxtij/wTJf/T+RWl4OyaNwypeZDbAaj
         ZiHHOa4XAD+KetRh6tb/4GW0MLfvqQ23C+ua2ivK4ZNSP0S96bORCML9GsW2LffmSp7f
         HVivw71/q3RyeKTU1UbsB3afeIExo0wMBPVcVSr/53WaZGsTXHSSXKiUknI7YKsY5Eog
         djn3v9fNVHuu9EOzr1WypUXKwsLMqJDcFddt3qca8rIZO2Xvb9JU9aSWFXFbKHVblBGD
         Mw6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+eHrlHzyuHt9g1JTzAP4eIvuQu9p5h+6Dalh7INYOdQdddn8lP5kCH0B/64aasVH5Pop+v3Y98w7eM@vger.kernel.org
X-Gm-Message-State: AOJu0YwRoh93bT3K6cwceq7QrtF9XkiFdM1hjs3ucmVrzLvOcqtEgfEK
	Ic2/FdeK0Kuq2qgUpS7D7WJXrVOuw7O96dMo3aZuQoCG3gZaxwqLDOR1
X-Gm-Gg: Acq92OGv4jN6G4IJD60NnFYOhfD6O/+LQu7IHVm3sq2afcuA5IBTRYGYfwynVgQ12m/
	DMNj2ICQW16ANvodFZPStBQU2PITIObAzgvNGVmulmRPtW3UY6nDiz+Bd590LwG8Jh0VKyfcf73
	HV82TkmDUAkDS40apfP4ynI5XpfFsjf308MBlKC49kr/A+V89xRd4pNNdSdO0S0bBhv5PZHpDHx
	FWr6Fr74pF1S8ZGy7gsU0+br1JUZDUhEqCxWn6lF3z61KLnrwRb840NbqCNkkbNQU2kXJddRifg
	/7pKPG4VHv4fXG0lDmrNdLQmTqTXT08BGOs6yO1E1lNIKRIAZwXgNAknDAQMiAAG+/+/Q2Uf/Nm
	KjvfGzv6r9nfm4RFlJ1U4WCH4gA6HRvfOkzAk/hnnfjia1ofarZuT+m2hOXLMkSltqA6Y/0tv5M
	8qDJG9EEG8I7qqglwD/zLWdWwyjUKFk9Uawju9uvv7AIGkkUvEFhRNBO1r67EA
X-Received: by 2002:a05:7300:e12a:b0:2d8:71c2:255d with SMTP id 5a478bee46e88-304fa51a193mr4979946eec.14.1780328740237;
        Mon, 01 Jun 2026 08:45:40 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed563d09sm8875697eec.15.2026.06.01.08.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:45:39 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lee@kernel.org
Cc: conor+dt@kernel.org,
	daniel@zonque.org,
	devicetree@vger.kernel.org,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	robh@kernel.org
Subject: Re: [PATCH v7 4/6] leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
Date: Mon,  1 Jun 2026 23:45:33 +0800
Message-ID: <20260601154534.1675736-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527151743.GA712405@google.com>
References: <20260527151743.GA712405@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Wed, 20 May 2026, Jun Yan wrote:
> 
> > The IS31FL32XX series features an SDB shutdown pin.
> > Driving it low (active low) places the chip into hardware shutdown
> 
> Nit: No need to wrap for a new sentence.

Got it.

> > mode for power saving, while all register contents are preserved
> > and registers are not reset.
> > 
> > Deassert/assert the pin accordingly during probe() and remove()
> > to manage hardware shutdown mode.
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  drivers/leds/leds-is31fl32xx.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> > index fe07acbb103a..5b9ed5a1818f 100644
> > --- a/drivers/leds/leds-is31fl32xx.c
> > +++ b/drivers/leds/leds-is31fl32xx.c
> > @@ -10,6 +10,7 @@
> >   */
> >  
> >  #include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/kernel.h>
> >  #include <linux/leds.h>
> > @@ -60,6 +61,7 @@ struct is31fl32xx_led_data {
> >  struct is31fl32xx_priv {
> >  	const struct is31fl32xx_chipdef *cdef;
> >  	struct i2c_client *client;
> > +	struct gpio_desc *powerdown_gpio;
> >  	unsigned int num_leds;
> >  	struct is31fl32xx_led_data leds[];
> >  };
> > @@ -421,6 +423,14 @@ static int is31fl32xx_parse_dt(struct device *dev,
> >  	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> >  	int ret = 0;
> >  
> > +	/* Driving this GPIO line low takes the chip out of shutdown,
> > +	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
> > +	 */
> 
> Please use properly formatted multi-line comments.

OK.

> 
> > +	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
> > +	if (IS_ERR(priv->powerdown_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
> > +				"Failed to get powerdown gpio\n");
> 
> Nit: GPIO

OK.

Thanks for the review, will fix all of in v8.

> 
> > +
> >  	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
> >  	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
> >  
> > @@ -609,6 +619,9 @@ static void is31fl32xx_remove(struct i2c_client *client)
> >  	if (ret)
> >  		dev_err(&client->dev, "Failed to reset registers on removal (%pe)\n",
> >  			ERR_PTR(ret));
> > +
> > +	if (priv->powerdown_gpio)
> > +		gpiod_set_value(priv->powerdown_gpio, 1);
> >  }
> >  
> >  /*
> > -- 
> > 2.54.0
> > 
> > 
> 
> -- 
> Lee Jones

