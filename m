Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C452DF701
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828793; cv=none; b=sAlwD6hkyXjXGO4165XCtA+mTl9a4N1qnsMlp8cqfp9U+HPd0jPSSE7XqDS6knanpsOCaHt5jbmjQZqGti8PDPRjl3kDShg4KxmfAwxK78BrsQ5TkZzrdSpPmUXCrpzJeChdxl1HH91MCNKb+L/RpPlXYaAEv6lCXBz/P/iRv5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828793; c=relaxed/simple;
	bh=3RmCpCtF4yIf9Hb4baaN0F02LAHwJj3+PIw/VB7441o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=la3ky2ZFI7fj6gLAh+XvHF5SLiifAGyiVNIRGAsOxXb0WhxcREWNppUImkP9X/gaEI41qdsjElc4dTwBh7RJIOoU0ZMFfKNWeiawVJ2m06TKsRmQEIUUHq97HMK768T6zeJYQdPeHZk23qTqQ91sZWOFnnmt9gvlYgjAq0lIUvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+L1haSk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+L1haSk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso279528f8f.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828790; x=1785433590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGSQO4wVOMVCplq246iaqpf6IUDoviOjGxAJtPnPFUs=;
        b=S+L1haSkE0XZQOFR/u7KIjmsppK/aLtCQGfnJJ8v+0mpps6Octx3ka0vNs2u4Q2Y3j
         YmiSYf5FHMULnkm60dduttou8215NWUTShYnNmrYK5xR02TlGhsGOswk9SNSeGma9rfV
         g4VRw3fIhJc8mXxoefUmwcqGoOJ++guJXvh+UDBhn0JSjNZT81gORk5h1Nn/lLMQuAee
         szTrCpZSq7iuWkXUGlmzqxmrRQ5LiU+0npP8wDQ07VGFgItErW01jS8DLmA7qkjFNlmu
         M47yAj8YNn0d4DH46Uoj2U9vWhA+wM0yOnrOoObGHTZFCAFIuCYYTIYNUeh3kZuksWV0
         HESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828790; x=1785433590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGSQO4wVOMVCplq246iaqpf6IUDoviOjGxAJtPnPFUs=;
        b=SKpYKP3j7qLKPq6BHYWgf3QsLLDvnK/KmYYdvnQ8LFLMj56bqv+FRZ/UPG3/YXZjax
         2G4NHJT5l3xRwoTNK44IJmwJqCtpkSiquH8YMHpeUKynGK4/a+qWWP2MjDauO3DMOuxb
         35C4L4agfs4SUxXXzUrWiU2h623W4F1GBWYt4kQyVY7X4mTPLc/eBLOF6M8rvQw7S+rx
         yoG+TUipriWf2wAc+FBRq6v7NQNd1xcKWKo7aRjC7Axb+ORCaQlWcA9a6tOUFetEAKg1
         A4GpBZl3IUZOQvvoH5rOnggzjksDeikDqIi4DcV4Rd3aVHdqFu8WOlFudj7YGSHmPrko
         AHzg==
X-Forwarded-Encrypted: i=1; AHgh+RqDYLZgszfj0mDxNOUwXrqxk78+/nzB50xW4u95oJCd+LdvHkOynURFD+9b85ZmMYEHWnikFNptsDo1@vger.kernel.org
X-Gm-Message-State: AOJu0YzuTQfkdmBevhgEa/+oz5MNi3+Zc59FlHGL1wAIis7DdC+trBy2
	dpxecqLnW1Ynlkhjmu37JMB69QXpV+HWZz+Rf6UVex0AiUYZaXzQZ1Tr
X-Gm-Gg: AR+sD13KBC0UZufi9TrpDjA2HmeimNT+tTjnp/Qu98Hd0AY55yVnWPXhdyPjQCnG9jA
	0CmbhswxxFWhTpNH/+NcdE7fXDjVb6k6lx8lewffFSYcTsfPqD9I+aNeTS4q313m6OytGjPL5IO
	wrIAwdnyU8bCDErJzocrF41eK6K0TylYWEbEuxmQbopo/qU10Owp4XKgPyD3KcdX0UjNymXIjz+
	2FndAg5RyEcmWfrf6nPazLBc3C6JC/U0yfCoejt8K5P04DDVFKk28bUZ8VvQuHbNdo/o4l+14Tj
	MghR6NqdtLszO0cJdMlHFRNPIpLfhX4pmV/5bezYE6GejiYASKRIoB/nvHCm+LcZTVHL31r891U
	o3JfIIVzGeiSstV6UEeQNYOOSK+0zInglJBbFlb9M7tOXLenRIgXbdlMoxkCYiBQD+Af3g9prjI
	kXiu1Q
X-Received: by 2002:a05:6000:1848:b0:47e:aa3e:e75e with SMTP id ffacd0b85a97d-47f8da5c992mr5740400f8f.10.1784828790260;
        Thu, 23 Jul 2026 10:46:30 -0700 (PDT)
Received: from antoniarch ([78.212.250.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm3363002f8f.26.2026.07.23.10.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:46:29 -0700 (PDT)
Date: Thu, 23 Jul 2026 19:45:05 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rtc@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/6] rtc: abx80x: use regmap instead of I2C specific API
Message-ID: <amJSJYp8xECJ4Hx9@antoniarch>
References: <20260722195814.298552-1-apokusinski01@gmail.com>
 <20260722195814.298552-4-apokusinski01@gmail.com>
 <20260722201646.115101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722201646.115101F000E9@smtp.kernel.org>

On Wed, Jul 22, 2026 at 08:16:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Hardware unlock sequence is broken by read-modify-write inversion
> - [Low] Incompatible pointer types passed to regmap_read()
> --
> 
> --- Patch [3]: [PATCH 3/6] rtc: abx80x: use regmap instead of I2C specific API ---
> commit 97cd1f33d168c96f848a8f59ba284bfe9c5f89fe
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> Date:   Wed Jul 22 19:58:11 2026 +0000
> 
>     rtc: abx80x: use regmap instead of I2C specific API
>     
>     Rework the driver so that it uses regmap_* functions for communication
>     with the device instead of the i2c_smbus_* API. This way the support for
>     ABX81X RTCs which use SPI can be added later.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 9b0e1d48d9ba3..e5ba821a67689 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> > @@ -125,52 +126,53 @@ static struct abx80x_cap abx80x_caps[] = {
> [ ... ]
> > -static int abx80x_is_rc_mode(struct i2c_client *client)
> > +static int abx80x_is_rc_mode(struct device *dev)
> >  {
> > -	int flags = 0;
> > +	struct abx80x_priv *priv = dev_get_drvdata(dev);
> > +	int err, flags = 0;
> >  
> > -	flags =  i2c_smbus_read_byte_data(client, ABX8XX_REG_OSS);
> > -	if (flags < 0) {
> > -		dev_err(&client->dev,
> > -			"Failed to read autocalibration attribute\n");
> > -		return flags;
> > +	err = regmap_read(priv->regmap, ABX8XX_REG_OSS, &flags);
> 
> [Severity: Low]
> Does this pass an incompatible pointer type to regmap_read()?
> 
> The API signature of regmap_read() expects an unsigned int * for its third
> argument, but the address of a local int variable (&flags) is passed here.
> While this may not cause memory corruption since int and unsigned int are
> the same size, it violates the function signature and generates
> -Wincompatible-pointer-types warnings, which can break builds compiling with
> -Werror.
> 
> > +	if (err < 0) {
> > +		dev_err(dev, "Failed to read autocalibration attribute\n");
> > +		return err;
> >  	}
> [ ... ]
> > @@ -259,13 +260,13 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  
> >  static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> >  {
> > -	struct i2c_client *client = dev_id;
> > -	struct abx80x_priv *priv = i2c_get_clientdata(client);
> > +	struct device *dev = dev_id;
> > +	struct abx80x_priv *priv = dev_get_drvdata(dev);
> >  	struct rtc_device *rtc = priv->rtc;
> > -	int status;
> > +	int err, status;
> >  
> > -	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> > -	if (status < 0)
> > +	err = regmap_read(priv->regmap, ABX8XX_REG_STATUS, &status);
> 
> [Severity: Low]
> Does this pass an incompatible pointer type to regmap_read()?
> 
> Similar to abx80x_is_rc_mode() above, this passes an int pointer (&status)
> instead of an unsigned int pointer.
>
I don't think it matters in all these cases, but I could make
these values unsigned int just to maintain the pointer type
compatibility.

> > +	if (err < 0)
> >  		return IRQ_NONE;
> [ ... ]
> > @@ -294,14 +294,13 @@ static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
> >  	if (priv->irq <= 0)
> >  		return -EINVAL;
> >  
> > -	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
> > -					    sizeof(buf), buf);
> > +	err = regmap_bulk_read(priv->regmap, ABX8XX_REG_ASC, buf, sizeof(buf));
> >  	if (err)
> >  		return err;
> >  
> > -	irq_mask = i2c_smbus_read_byte_data(client, ABX8XX_REG_IRQ);
> > -	if (irq_mask < 0)
> > -		return irq_mask;
> > +	err = regmap_read(priv->regmap, ABX8XX_REG_IRQ, &irq_mask);
> 
> [Severity: Low]
> Does this pass an incompatible pointer type to regmap_read()?
> 
> This passes an int pointer (&irq_mask) instead of an unsigned int pointer.
> 
> > +	if (err < 0)
> > +		return err;
> [ ... ]
> > @@ -379,22 +376,22 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
> >  	}
> >  
> >  	/* Unlock write access to Oscillator Control Register */
> > -	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_OSC) < 0)
> > +	if (abx80x_write_config_key(dev, ABX8XX_CFG_KEY_OSC) < 0)
> >  		return -EIO;
> >  
> > -	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_OSC, flags);
> > +	retval = regmap_write(priv->regmap, ABX8XX_REG_OSC, flags);
> 
> [Severity: High]
> Does this hardware unlock sequence get broken by read-modify-write inversion?
> 
> According to the datasheet, any subsequent I2C access (read or write) resets
> the configuration key to zero. If this sequence uses a read-modify-write
> operation (such as regmap_write_bits()), a hardware read is performed after
> the unlock key is written. This read resets the configuration key, causing the
> hardware to ignore the subsequent write and breaking features like
> autocalibration.
>
I see no issue here. The datasheet clearly states that
"CONFKEY is reset to 0x00 on any register **write**". I experienced no
issues with the current version of the driver when testing it on AB1815 hardware.

(this comment also applies to the other read-modify-write "bug" reports by
sashiko in this patch series)


