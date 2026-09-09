Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C33955DE
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788977008; cv=none; b=BUKBu3acKtJayy5v/GR7Bu01S+K2VuHf5Y97inSyztSyZ21q7VZr2Ri+qdvvEzd3eCWdFWcCc/qHhcTn0zl4nc2b2b0arSyXCXmlwVmHzsq/16ny7BbLgH279JfQd5mF/m3TIf3W3d24TABKD18Z8IUROqrMeTglVoDRq58t49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788977008; c=relaxed/simple;
	bh=h0+O/uLPWOX80ES9M0XKdB5md+a2oSQUnkWr/gWIyaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/N/Z4+moUwCACh44SsAtyVPnMZAHV4uy2bB6ywPQbYdbCzS2M/HwITxMFWpvFI7uInxRuvynnX0Oa4PAh7dQcURJc+gr9MKelygzXJo41BCHDxufrjN0I0Z1EANvWPWMQbM0AM1KvnR0vANVBCw01cy9+XlMhDut6zs57g3dZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSuSjSAv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSuSjSAv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso8678075e9.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788977004; x=1789581804; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bjvBiyvh/g8+fag4d0kfWnymDoayXnCGlAJvwIriZP8=;
        b=sSuSjSAvW8G2BiaFjsjQTtHpBnXuK45djz92Q9LkrjJF0eLYfXK5ORDPxf1bLn6zL3
         YJ2X6HCYZJxZV8UHdllvGXuNgyAUpiFgmJBFB0u9t4Xzjr2e+oc6A4M7WHeMz7NdxTII
         CKrvrQexlLxFuMUkdB2/6i/bpZzDk3OgZZfU+T64Brce7xRpJamNgA8cym6f/1u1MHDE
         nWZBsOlUiaIpXxmm3vW5ZG0UpKyoch37Ewz6+H+VvumF/vNAHvW2eM3VGFC0w8A4B1j3
         uoEhVMBfdLKk+K4PcVTUfuJnuGsqctxjt7mb44UlW4Bo4Ge7pG7rzPt9cm/drMKazaZX
         L5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788977004; x=1789581804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bjvBiyvh/g8+fag4d0kfWnymDoayXnCGlAJvwIriZP8=;
        b=rEKfHyXDE2w8GcGByC9uZzaMloPt38gnWDuC8/uvu290p7BIFeteRzuo4s4WeUMFw3
         WaEat5FkM2a5J6VZ860fWdAF4cGPP+GcgYMubOiJPEmbgb0SZMayZPeYRGKe9QGNxRGv
         9ZjgkLOWR15vKl7wD/B4DmynSm4Wrirykg2DbTAOEipplDNoEahoLEk3XSOxboZ41vnK
         4FJd3kQgXNlQYN2R37ysE4Adj8UVr2zkrk1w5EHwijpcMCdYNScPIgL1jSFO/i1qcnlB
         45xNusdMxgO67ErR9ndGhLVemkYZ9uvCPqCr0+8cGmO5jFoWaHX7UVCyNI1O3/6e1Xdm
         5L1w==
X-Forwarded-Encrypted: i=1; AKwUvBxzI/wRFXL79emji7GtSEBk1bu1WoXeUwAZ7S5vdU/JsCXXIZAZI0pYIn2QqTHSZ10s+j3PJAiEl/Kh@vger.kernel.org
X-Gm-Message-State: AFuF++n60sYVT27M4Gw+A5H21U15iR6LABs3WrbLwO1FVDB8eYTaynbj
	RYhvFbaydkrKxunuy4O7qqtJOzVFJN9/w1adpLaCtP/9i2bVaMlleE0m
X-Gm-Gg: AYBFou3eJ4i/kOvDsoyYPi5m5DlkoaUdy7YzOGNHTkF0rNMaKIM+rlQgUlUXQbJV369
	TW38tUeINfOLAy8X1a5GoCi227q68bO/v1hIR8UcNfs2OdeewhCHls0/OA/VDUliZm2JI++n01U
	W2U3KJfOeoBFHisxFyjfR00o9wcsNWVN6xQIOqjVJteitd6HqCgDKFZvQp8IcyWkz+Q6OndHEtH
	ac7Mqc+JL0XpuUa0JKa9zvuloAZ9qek85R10cXRfsiqFJLSGsFqOQnHZrSCuJggqHw2VFtNZxYk
	2Lrcg893DIZn8g0iNJ2pKwY7Zd/Pq6SWaU/zKrzI3MoGE2ipQeCID55g8K9K9+52FrXQdpjjRwl
	EwK41sQqAbJt2Y9WglNVKz8MSFkjFngoxg/94ho1ipixvqle3sV317LsthDEFZ0JzGrKQZAxk4J
	4Nva2fi/QZ3stgt9AKj2dah1HK2l5JdDTZ3lvbwXlwYybCXIun6crD0Y73UoOKgl1B6HcWwCW6
X-Received: by 2002:a05:600d:8647:10b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49d26d863famr4558255e9.1.1788977004041;
        Wed, 09 Sep 2026 11:03:24 -0700 (PDT)
Received: from antoniarch ([37.163.183.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm76460505e9.3.2026.09.09.11.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:03:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 20:01:39 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rtc@vger.kernel.org, robh@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/9] rtc: abx80x: add mutex protection for register
 writes
Message-ID: <aqGeyGaUriVsueZ2@antoniarch>
References: <20260907203216.53192-1-apokusinski01@gmail.com>
 <20260907203216.53192-4-apokusinski01@gmail.com>
 <20260907204634.2A7C11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907204634.2A7C11F00A3A@smtp.kernel.org>

On Mon, Sep 07, 2026 at 08:46:33PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Incomplete mutex protection allows concurrent I2C reads to break configuration key sequences.
> --
> 
> commit c33d071aef97a2d9a731cf3e557a1cf0fbf7c50c
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
> > index e4fd7b5d4b110..44de234efecf7 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -445,6 +458,7 @@ static ssize_t oscillator_store(struct device *dev,
> >  				const char *buf, size_t count)
> >  {
> >  	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	struct abx80x_priv *priv = i2c_get_clientdata(client);
> >  	int retval, flags, rc_mode = 0;
> >  
> >  	if (strncmp(buf, "rc", 2) == 0) {
> > @@ -456,6 +470,8 @@ static ssize_t oscillator_store(struct device *dev,
> >  		return -EINVAL;
> >  	}
> >  
> > +	guard(mutex)(&priv->lock);
> > +
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since this commit aims to
> protect configuration key sequences from race conditions, does this leave a
> similar race open for concurrent I2C reads?
>
> If Thread A executes a protected write sequence (like oscillator_store), and
> Thread B executes an RTC read operation, can Thread B's I2C read interleave
> and reset the configuration key?
>
No, becasue reads do not cause configuration key reset
> For example, abx80x_rtc_read_time() does not take priv->lock while reading
> the ABX8XX_REG_HTH registers.
> 
> Similarly, abx80x_is_rc_mode() (called from sysfs and read_time) performs an
> unlocked read of the ABX8XX_REG_OSS register.
> 
> The ABX8XX chip specification dictates that any intervening I2C read resets
> the configuration key. This would leave the register locked, causing Thread
> A's subsequent protected register write to silently fail without returning
> an error to userspace.
> 
> Should priv->lock be taken during these read paths as well to fully prevent
> I2C interleaving from aborting configuration key writes?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260907203216.53192-1-apokusinski01@gmail.com?part=3
