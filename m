Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA340F732
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785789182; cv=none; b=L2Qtt2E17pkebEq6wYj00Mdvp5SoVWkj15XiGkQ4WIrx39hoeU4Q0+SKX2KSLxhsi66qSBDAC8KJHqFHO0aTGo2CGWdOKJFaNLAzz+6RheRtjXSAo5R95e5grZ0UxX1h0jT8IfXW2rWDsutOtMi98pCuJw4tBHSXwo/s5Ib5tv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785789182; c=relaxed/simple;
	bh=nqSpLXnbQZzJq6PZBs/MbADaKMSUv/rCgrrAXQ8do2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnEIXssdzWTcfUAbJ8BrQfUhQd2BtuYHifH+JiGH7/LE143OWWsGU7RSLrN82XQewdbylo8jrgRe2kt4244fhYAXrZYKWqFDoTInKrS0IY2kgdXTEsd3FVwf4oid17omAcjML2B+nJGUUxTJja9PRjKFvuGwrpO9CwlgLcwK7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6qVC/E6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6qVC/E6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so25689595e9.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785789179; x=1786393979; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rApWxITnrHnc04C0bper7oYi+AJK0f2NsvvyV/Q/8B0=;
        b=V6qVC/E6iQtPgVGIxkNjV/aalDH//k4KbNrikzN+mDbEw5rUVc/NrU8oKPEH5NJDgd
         dBNdpOeaKaZK/uC75/8e93aRNxW7iJnZ8ZHYFC1Vlkvg49eaTLlOUCO1jn35UmgHO54I
         g14CXUNmoe9QMxyedg8OVqDLQVwYbzpz9yFHTtqb+5zTvGy2POnaM0iird3PUEJ7MPXf
         Ijo+FBZs9G+fhMqEJ23o84yAvwzOxhwPhiNgBcqp1iDrNf7fmpN/OWwpkwFNnOK258Di
         VZD2ja0nRsLFcsr2xi49svBe29p9inLm5uuHd60TPYBbQNMUQMpIFp3mLkepbHh5QLXx
         tSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785789179; x=1786393979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rApWxITnrHnc04C0bper7oYi+AJK0f2NsvvyV/Q/8B0=;
        b=YjSXVCRVNOj5qJXqOzJPxyLG4sYRwzbEro41ncz840xgQED1AreCzDolaRC2+p3uce
         upCRx9+oHt96uQtZ3qK+4VVAnjFUZ6+qnkB/nh1bBS5GOmAE+Xyb+FEiL148hLywgCey
         B2jDuvipeX8sONDjcxzruIWSkoTdrydk252rpDcVkAymOGJneWsIACfJiwrw7mZL3RTr
         mAaPOyvlHY1Wzqbt0MOOZg0o+W3O6IYvBrhmlB8IWN0J5R2fmc2Uh28jEVM+nNhGtWaM
         YoTdm/hwq5busE5LXFyL5IbVwhl3u2zWjbP6uOpdu6/aE+UEnZMuEmu0AHmjbs3k2B6p
         FU2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqES4F8HURYpw88EughD/b8QlYO3LdB8bLEKlKDfeRkGLKZbv2wOVKmYfvgqYAdyoVTw6qXkJYqV6qg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0GaVhHfqgHRAiFAc+4oVu0zK+95DyVZGLz/7682DyFtnwc9YC
	Q6LKTAzaKegMo7QfxH3djp5ynAvDVFDK3JYv7pgZjar03yiQGjqVCbrRF5PVqw==
X-Gm-Gg: AR+sD12PST7DA/6UmkE9yqjkPccnOFZR5sZxKBujsGN2wA5keDUUx6ldItKK8AWF69H
	8uRYAOty+N/U2p5tdUk5xIM8O5sUpRB8YapwDT6sH2LcjfftLlpITZvsGuY8PXz0ycRs46Bk4jW
	4MNVYaLsZHUQkMFahZkPpWzdjU3DBBh2JrozCq/L5343puVXv03j0Sojr578ft6S1P1py9aCS89
	EcnFFGpPxg+ySfk7YFe5QEbRWSw4OF6e4179M9nz6JHxlICVHRYzTHVqbiCVNPsSOz3GYCNqalU
	Ll8AcJdaByfV/5OzFzrrNM82EjmcoKlvxRLpRE/GhIfQluiq/eprvsAfxQN9siTq6Rj/pn8bT+s
	+xaJPBstUwo+8I8M5olJNmFRm4NczAL9afBOKGdWSafQ0sC+TgmispbfJaNA2TQirlLraHuNlZl
	eXDoprL/BXY3tDRMnE8fD6L0gkhtla021/nRvAvVyFrPdtengQl/b48hiMV3Bt6rzW8nzI7M0rK
	10=
X-Received: by 2002:a05:600c:154b:b0:499:49a6:4388 with SMTP id 5b1f17b1804b1-49949a643f9mr33545705e9.17.1785789179046;
        Mon, 03 Aug 2026 13:32:59 -0700 (PDT)
Received: from antoniarch ([78.209.183.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7b73sm26259495e9.9.2026.08.03.13.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 13:32:58 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:31:28 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	conor+dt@kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/8] rtc: abx80x: add irq to struct abx80x_priv
Message-ID: <anD5lUnSpYMtkuyg@antoniarch>
References: <20260731184831.44037-1-apokusinski01@gmail.com>
 <20260731184831.44037-5-apokusinski01@gmail.com>
 <20260731190450.548A81F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731190450.548A81F00AC4@smtp.kernel.org>

On Fri, Jul 31, 2026 at 07:04:49PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Read-modify-write of the status register introduces a race condition that loses interrupts.
> - [High] Unconditional failure in `abx80x_read_alarm` due to incorrect handling of `i2c_smbus_read_i2c_block_data` return value.
> --
> 
> --- Patch [4]: [PATCH v3 4/8] rtc: abx80x: add irq to struct abx80x_priv ---
> commit be354d8ef94de08e1314876fad55888243ca019f
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: add irq to struct abx80x_priv
>     
> This adds the irq field to struct abx80x_priv so the interrupt number is not
> strictly tied to the i2c_client structure. This allows it to be more easily
> accessed for ABX81X SPI clocks.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> > @@ -299,11 +300,12 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential race condition with
> the status register.
> 
> In abx80x_handle_irq(), there is a read-modify-write sequence:
> 
> 	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> 	...
> 	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
> 				  status & ~(ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT));
> 
> If a hardware interrupt (such as an RTC alarm or watchdog) sets a new flag
> in ABX8XX_REG_STATUS exactly between the read and write calls, wouldn't the
> write operation write back a 0 for the newly set bit and inadvertently clear
> it without handling it?
> 
> This same pattern appears to be present in abx80x_ioctl() as well:
> 
> 	tmp = i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
> 					status);
> 
> Could this cause hardware interrupts or status flags to be silently dropped?
> 
> >  static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
> >  {
> >  	struct i2c_client *client = to_i2c_client(dev);
> > +	struct abx80x_priv *priv = i2c_get_clientdata(client);
> >  	unsigned char buf[7];
> >  
> >  	int irq_mask, err;
> >  
> > -	if (client->irq <= 0)
> > +	if (priv->irq <= 0)
> >  		return -EINVAL;
> >  
> >  	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this error check work
> as intended?
> 
> i2c_smbus_read_i2c_block_data() returns the number of bytes read (which
> would be 7) on success.
> 
> Looking at the code just below this in abx80x_read_alarm():
> 
> 	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
> 					    sizeof(buf), buf);
> 	if (err)
> 		return err;
> 
> Wouldn't this evaluate to true on a successful read, causing the function
> to prematurely abort and pass the byte count back as an error code?
Will add a separate patch to fix that in v4 as it may be useful to
backport it to stable releases 
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731184831.44037-1-apokusinski01@gmail.com?part=4
