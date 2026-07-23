Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152B7355048
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828531; cv=none; b=EQq4N9cccHCbJ8isSIc4oPLLB4zfk6NhPCJ+kfX7a0+NxWlu4ZB9lcVOsfsDlJbWRSo2WD4EblR9lq6IfCr/JEKnYAiIU2kA+T4YUgkYj6Bi+JHmY2/ZFvQ0EXMINwPEIoJi+0jaZXgIOK9hibd7QUxJpxyDeZv4jVLQ5fcPZvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828531; c=relaxed/simple;
	bh=B/zNBgXVZyKUjBeBKaBVWmqIpKEITY2JufcS0MhbhV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YK/IsmbgGZVQlOUrFgWykwrYvhyknK5LM04SobvCs0rhKn7PtuFwUExyzYMBKNjLWxk42z547Oj79D6kPkRpUVxOMb1oiou7ZQG2XGYroY+ri0sdqILCYUNrmnho3NRNnIR7iLFo1oxVjeXhte29KUaoKOFi3Oo5Ni7AuRTX8KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gdy7sExc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gdy7sExc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso9939555e9.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828521; x=1785433321; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvvOjkSIIOXtcwPEkIypGzvmNd95Ui/vslKtK/NZXXc=;
        b=Gdy7sExcpmzbExrSQiSZfIHtWgQT6E/aHV7TDRtbj27i/i0u5D9bUKdqdXvNk7TXDo
         RU0QyYMOyUnAn7nXPI67XN6XFS5/LK/nAFZRUhS9KdYZWs1K/aP1DrnYDd6Hkjd1dPau
         1maBU7ugLDS4ik32bn20sd3Ch2Yex3Z0EB+8M2j8EWKobAg5xNWSodAuzLGo2Zl0ps1Z
         gcjl7YVICoN0ukcPOXEWvkNyPKLKJpSH0XQCksspPCF5hWH8B5BLssEvPjYKqul5I2Bq
         Kh8pellvWlv393Y1OTwVRSaNyRbq6u0mKkIlqzeYpErkIXwOIawMyS0ksQzzKjSGyt7P
         8WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828521; x=1785433321;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CvvOjkSIIOXtcwPEkIypGzvmNd95Ui/vslKtK/NZXXc=;
        b=sI70+uU4tbJA+Ee7Aen2txDWMART0Ixs6VPVKqUB2sqaj8oYBMrenoQ1S3f8pnTxDO
         TLrMpiDYbHuOohfNrIn3F/UYD9aWJpDQsF/JYndLB/xVsBWud9tIVUyDuIM1S1P/9724
         nDTLWo9Yme373P0ipBer9oEGdO+y7akjp2cBYluhEcBnpP6ePzmfB/25SWL+ozaTOVpr
         pwFgKnbPYSFWi3LpAIy1/7D2OuCw+tNOTfhjh+KMqchiPHs+3ksnTO5af/u+/TGzwiu/
         CTHfPGQr8rmw/huqIxFOY1N+yN8+bAbk3+rnzn6ECP46cqoy+4pMbUC5Hub8/dJt6xOM
         nBig==
X-Forwarded-Encrypted: i=1; AHgh+RpOwR+UIGCqKqG9z3mTemjurtOMy+6b4jv9nWuesz5UInYdQc/RF1yGg4P0r+/PSPrWkUJa8Iyw91Uh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3VKbeAiwwpYVB5JEeRiy2kGjVwrHGZHoXnvF0WLYqnf1xfIdO
	+J8VjP16ZieKoGY6k62yiI3kZGye8aKA/crgpQrBFxgaLPJu3o1CHLh3
X-Gm-Gg: AR+sD13F4l5g3Ak8xPJPG1SUSxru4hsR/Dyr79KXMWQBNKRU1REr3S8XAFhkjAmPwEE
	YbwozzpVlOfzadfQzCgkBgeP1yNoFos71N3S56RmkaCUCnTRX3IZPJoEz5MYInlyCkCbHARi79q
	4tqAarlgN3Zyv4GG06cqi6BU5XPKcPbvaCk8wZQAhAwwbidw95biDTzWsT4PGYfjhpl6/Gf/ByI
	ZW1wxJt/C81tsGcHo3U0lSqwYIISjJp4lohFetPVgnb7jwCFrQhrzJnzqzV91lh0Oi/gd3npwWF
	Y5netJU25R5fb5vnDDprFdLp8D1dE0eyvwQJX30iANjw+86Hxb5SuRUZKHN/DFbhPh9dnQ9cfx7
	0FZyJlCTRdPjLYFzbsaBpn0tzoiDt0Dx1PPXGZ9DDWNjtQSbCzadMtregeDpRjyXpXjzlCXcvSg
	A2blqu
X-Received: by 2002:a05:600c:4689:b0:492:6f6f:fa42 with SMTP id 5b1f17b1804b1-49573d37f29mr49484495e9.37.1784828520954;
        Thu, 23 Jul 2026 10:42:00 -0700 (PDT)
Received: from antoniarch ([78.212.250.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm16520989f8f.10.2026.07.23.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:42:00 -0700 (PDT)
Date: Thu, 23 Jul 2026 19:40:36 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/6] rtc: abx80x: add irq to struct abx80x_priv
Message-ID: <amJPSCvn_ufaDxvL@antoniarch>
References: <20260722195814.298552-1-apokusinski01@gmail.com>
 <20260722195814.298552-3-apokusinski01@gmail.com>
 <20260722201354.3BDA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722201354.3BDA11F000E9@smtp.kernel.org>

On Wed, Jul 22, 2026 at 08:13:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The shared IRQ handler unconditionally returns IRQ_HANDLED and inadvertently clears all status bits.
> - [High] The `abx80x_read_alarm` function fails unconditionally on success due to incorrect error checking.
> --
> 
> --- Patch [2]: [PATCH 2/6] rtc: abx80x: add irq to struct abx80x_priv ---
> commit ccef71986338cc749e8440b88d073968d465ea5c
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: add irq to struct abx80x_priv
>     
> This patch moves the irq number into struct abx80x_priv so that it
> is no longer tied to the i2c_client. This allows the irq number to
> be accessed in the case of ABX81X SPI clocks.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 5486d9d0b1e5d..9b0e1d48d9ba3 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -285,11 +286,12 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
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
> This is a pre-existing issue, but doesn't i2c_smbus_read_i2c_block_data() 
> return the number of bytes read on success?
> 
> Looking at drivers/rtc/rtc-abx80x.c:abx80x_read_alarm():
> 
> 	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
> 					    sizeof(buf), buf);
> 	if (err)
> 		return err;
> 
> Since it returns 7 on success, will this unconditionally fail and return
> early with an error code, leaving the alarm structure uninitialized?
> 
> [ ... ]
True but this is fixed in one of the subsequent patches where the
regmap usage is introduced.

> > @@ -921,19 +925,19 @@ static int abx80x_probe(struct i2c_client *client)
> >  	if (err)
> >  		return err;
> >  
> > -	if (client->irq > 0) {
> > -		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
> > -		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> > +	if (priv->irq > 0) {
> > +		dev_info(&client->dev, "IRQ %d supplied\n", priv->irq);
> > +		err = devm_request_threaded_irq(&client->dev, priv->irq, NULL,
> >  						abx80x_handle_irq,
> >  						IRQF_SHARED | IRQF_ONESHOT,
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since the IRQ is registered
> here with IRQF_SHARED, does abx80x_handle_irq() correctly handle shared
> interrupts?
> 
> Looking at drivers/rtc/rtc-abx80x.c:abx80x_handle_irq():
> 
> static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> {
> 	[ ... ]
> 	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> 	if (status < 0)
> 		return IRQ_NONE;
> 	[ ... ]
> 	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
> 
> 	return IRQ_HANDLED;
> }
> 
> If no relevant interrupt flags are set for this device, it still returns
> IRQ_HANDLED and writes 0 to ABX8XX_REG_STATUS, clearing all status bits
> including non-IRQ bits like BLF. Can this break other devices sharing the
> interrupt line and silently drop hardware status flags?
> 
Yeah so this looks like a genuine bug and should be fixed in a separate
patch I guess. In REG_STATUS we should only clear the bits AF or WDT if
they were set.

> >  						"abx8xx",
> >  						client);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260722195814.298552-1-apokusinski01@gmail.com?part=2
