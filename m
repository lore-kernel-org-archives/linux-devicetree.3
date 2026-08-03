Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E63A05C4
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790198; cv=none; b=df8dLiqkY0v4R06RK3d6iRViBDfgJheqHd+R/WsRaHulm3gFMo3UHrBi12/0QzWDvOvfTeyYYhuXIkMINin5tE20iPTmOREEMl9t23PyEye/gWSTP8nxxNsz94EjBe+r2o4yUCd/AtLLshgxB0YGsfdc8t/A0xakM1e60D2ya/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790198; c=relaxed/simple;
	bh=/1OaECMujIFSJE7t+DVTrABpYZ5BfId7y7cIHEcKVeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHgWZ4lyGJpMJEqOxmfGcuaCILgMkeQVrApCtyQN8EQeXaP76EUkxIq3KbLPHDKMR9Ze/M20jM2Zxq8en1d7UOLnM3i1qS13NZ2zGUww6a8cEReZVHjRRXX0QT8XTCkFDAN0o4/loaKJbcguqE/YcwRiwtFlqzuhxIn6tyN7MSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmL2CiUe; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmL2CiUe"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1978091f8f.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790195; x=1786394995; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhuGZy0V/iO4wh9VJe2g8/AuD286lKexbEG58gGTA9A=;
        b=AmL2CiUe/leCa0YJ9czB1Y3+I3M9Bwu9onjkRk2epDRdgUhZO1AUlCRaOBc5gjslgl
         77OV9MsdamglxI6npg00GeSFv7h8IA01WGLG6gPMJL4Lymm+1fbOxEUE2mHMjIWLMiu8
         chQ/VROsznlhe4j6uyhHKz5jiwL5ZdfaHmrpugrIWIH0eGv0x7OFKf4mcN0iAAuOmhwb
         SuVPD+TVzEkzCTIXb8IpGo/PU1BmCjEmt836IUZePvsfH4oy9iTGFL/WT7nn2ioJUJHY
         ktXUSweTwDQWkR4BEasa7VwsoPneu68VmlGUSLGZBYCWA4jb/3Ea26DDz/5yoz4mGkOx
         CkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790195; x=1786394995;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vhuGZy0V/iO4wh9VJe2g8/AuD286lKexbEG58gGTA9A=;
        b=eiglao1oB1xndTHzXXq97s3NHGy7fSmUY3xc8QtAwCzC17a18ptmjXq09dUv263+th
         pBuMOCGF9jNSSt2PAgxqb4BYXP02/Ymkba5BxctqOVSQ7ayeFdTv59rOwT3B8Qq72Y00
         IKbN4xtB0jDPt8+K359+WMEodxzSvjU/fd2d5GxI0qGrel7j7Iqs3jAgqVf727/p6fo5
         LA652Zph2WokshdSzP5S1nL9PMZsUbhoPolhpaGbZOdiqLMXuIm7K4+UzUX6FR/dC7Ty
         fe1GqRgl9J4sS6VIrrwWtKBWO0mnUNxt/lXlssULfP8OU8Rm68JKzwgu6ZA7RXhxoYl3
         mPuw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8q9G+zGhF26YwSIxaG/1O78wr9cGhUCbERyl+djdbKG1jifKna6V3kykb4mfij44FWcz6UxUJOBl5@vger.kernel.org
X-Gm-Message-State: AOJu0YxzfLk2ot++LcI+NSomDwDgzxhAGwZY4QYSRizCCqHod4/mGIyF
	vNoxiBU/SEi/7gaCkPUAjqW4spd1uUJbjNeFH9ccXhxXMeCmhXvvJe9QMimS4w==
X-Gm-Gg: AR+sD1231URhwfyVDALYMIuWiQZhu9vqoc6urQYN4EvYds3VXJNdaPSr/IABo8JN6uu
	CTXiKuMpJKVHHmLAMr2jDav7l2Qq+kdrrxvWCF1pXKNaQTqrlpA/8PJsUiYx1Xt11ifKaK2Ko64
	jtEma0M+qpe4Yj0/7DFlaj1QXhrDij1kQ2mAMtyH3X9Uf1QGvMNH0WP2nV8sxznBJo2R2v/eCfG
	G2VMhglHXGrMMB+RSJEfPo58R3n2JrUN40eh3XZM4X06oBu3+ab+/nAFebZQHnkHLPy3rIfGbgX
	BJlgfJObMRU9CKuFGRi07zJCszc0SfQDqSrnb2jFUs07S90qTU5+PGJ0IHDiZA2qt871RTDPSmF
	NvT1I6ZWUszDZE0oQNzHdHGNnduNLFvEFXLe+o/ZQq3JktLFmsJJZQIGfSgf61rbsm8DoiZ1gAM
	nSAQHm7Xs+l7LDkEYZx2dhFPK3l2kFEYSzuULGOG01Es9AOv54yAU7uZuk3b9KCb1M
X-Received: by 2002:a05:6000:29db:b0:477:3986:9b54 with SMTP id ffacd0b85a97d-47fd72b0820mr19601084f8f.20.1785790195099;
        Mon, 03 Aug 2026 13:49:55 -0700 (PDT)
Received: from antoniarch ([78.209.183.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2961sm40075934f8f.13.2026.08.03.13.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 13:49:54 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:48:26 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 2/8] rtc: abx80x: add mutex protection for register
 writes
Message-ID: <anD96GGy16VCzpCL@antoniarch>
References: <20260731184831.44037-1-apokusinski01@gmail.com>
 <20260731184831.44037-3-apokusinski01@gmail.com>
 <20260731190257.45F771F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731190257.45F771F00AC4@smtp.kernel.org>

On Fri, Jul 31, 2026 at 07:02:55PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Low] Build failure due to jumping over a `__cleanup__` variable declaration in a switch statement.
> 
> Pre-existing issues:
> - [High] Shared IRQ handler unconditionally returns IRQ_HANDLED and clears the status register, risking interrupt storms and breaking battery low detection.
> - [High] Missing mutex protection on I2C reads allows them to interleave with and silently break multi-step configuration key write sequences.
> --
> 
> --- Patch [2]: [PATCH v3 2/8] rtc: abx80x: add mutex protection for register writes ---
> commit d3bc95e6c97e9f4f1dbb461f4986e984a4ccd25a
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: add mutex protection for register writes
> 
> The ABX80X RTC driver performs multi-step register operations such as
> NVMEM transfers or register writes preceded by a configuration key
> write. Add a mutex to serialize all the register writes to protect
> these sequences against race conditions.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 5486d9d0b1e5d..8d791b9ec7d21 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -219,6 +221,7 @@ static int abx80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> 
> [Severity: High]
> This is a pre-existing issue, but should I2C reads like those performed in
> abx80x_rtc_read_time() also be protected by the new mutex?
> 
> If an unprotected I2C read interleaves with a protected multi-step write
> (such as abx80x_rtc_set_autocalibration()), it can reset the configuration
> key on the hardware. This would cause the target register write to be
> silently ignored.
>
Not true. The reset of the configuration key happens on any register write
but on on read.
> >  static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  {
> >  	struct i2c_client *client = to_i2c_client(dev);
> [ ... ]
> > @@ -263,6 +268,8 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> >  	struct rtc_device *rtc = priv->rtc;
> >  	int status;
> >  
> > +	guard(mutex)(&priv->lock);
> > +
> >  	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> >  	if (status < 0)
> >  		return IRQ_NONE;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this interrupt handler
> unconditionally clear the status register and return IRQ_HANDLED later in
> the function?
> 
> If a shared device or spurious interrupt triggers abx80x_handle_irq(),
> returning IRQ_HANDLED for unrelated interrupts prevents the core IRQ
> subsystem from disabling a stuck shared line.
> 
> Additionally, writing 0 unconditionally clears all flags, including
> ABX8XX_STATUS_BLF, which prevents userspace from detecting a low battery.
>
> [ ... ]
> > @@ -539,6 +559,8 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> >  		return put_user(tmp, (unsigned int __user *)arg);
> >  
> >  	case RTC_VL_CLR:
> > +		guard(mutex)(&priv->lock);
> > +
> 
> [Severity: Low]
> Does this cause a build failure?
> 
> The guard macro declares a cleanup variable inside the switch statement
> without a surrounding compound block. Any other ioctl command jumping to the
> default label will bypass the variable's initialization, which GCC usually
> flags as a hard error.
> 
Even though I didn't experience any issue, this review seems valid to
me. I'd change the guard() here to mutex_lock/unlock in v4
> >  		status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> >  		if (status < 0)
> >  			return status;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731184831.44037-1-apokusinski01@gmail.com?part=2
