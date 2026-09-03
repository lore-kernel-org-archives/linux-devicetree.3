Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D96509F1E
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 20:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467008; cv=none; b=pSItCA3ElkHyvqNCaIJvtCztlJ5PNOMxuXqzaDgFxFEKWP4sODaa9uLtdt6gj6/6R0rN8OavCyeHlf8BO1gD7iXZ64jIP6dcTw/n/N+k3Hmj6FkONMv1zLVxxIIyIXseFB31MzYii4XWfupAN08bHr4ED/Cs3ypAdjKVRGrdvT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467008; c=relaxed/simple;
	bh=L9bmO5bQ4eT0+UVGVtoRZQT0c4FOX0ShFjkk3MTXEjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HB6i7B/Eo0iwTdVk+QKxXtDb1Cr09dr37+VTcAEGGlgyfEvEv0/SaGdwDAXr5O6RGY9C+T6rhgVBwjtjYHlPjc0Ch03BkLXqOjblKxpS7NZHGnwOgXkpWNz1OAPnqkY+lVSHU41ql7iuGKfF93jVODjTG48Hqg46L/EMTuz9OJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwTQ8dKm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwTQ8dKm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso2265745e9.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788466996; x=1789071796; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uiGpkvB7XXsZv/7nG5x9DWvEjoMSR6JMHV9KheYoJ+E=;
        b=MwTQ8dKm+vHPD/N/zXyG+hwOJ18iwIeygJAsmdgzzaTGaqgfutLLN/P8hLepZEqL5w
         rXzkBjt7Xr0Y5utgAyvOBoXWqhn9QTPwXJDkmuj+P2PpggKM2jmWifunZCEGwFy7Hw4D
         93pEG65lx1osbv3IAZ2ijrSdBdHHr5IXsxpuAk5DdHVRm9RHYgvqANaC2rbfZFO25Ir5
         R4+rN3pMiasV5lPbeOch8azB8/3oLPGvrikwfgQbFkwl5Z1n7DeZhywYCU3dDn21LK++
         do5wyle7cpOJ7ODptXvsi40F7xlLbyixt7bKrAyRyUoCT5226t+6TDon7S3+UE1zh8VX
         8e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466996; x=1789071796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uiGpkvB7XXsZv/7nG5x9DWvEjoMSR6JMHV9KheYoJ+E=;
        b=tFMFPCKeKBxwA57HlFESDWeMx40FiiM938Q72goousSkMzqoHAeI2K5OHk6xx8LcM5
         zBQgo6uqOKp4Wk62weLUjN07c7A8eZ3CkLL1pwQS8gcshQrjutH93a537Dof+Kefy8Zs
         ZPP+0RBNUkvc+DxL0Cs0IT4Q/BXl8rqtfzp43fj9mVjx9odJfEku1GnuhnMf1jljXSw1
         CKaA7IQVuhARpdtnyseiMMR62XCMSITN7a2WUrkfoWuvW9aTEjmfxOPpP+CrVBaPgv2E
         cPJc1cfm/JPok3MiAuwAuPJrxHYPZf3aDX6BawhXOmKAirTWQBfdw2tmGt+k1tWQL2js
         qaoA==
X-Forwarded-Encrypted: i=1; AKwUvBwOCcUlq1ZBo3ddOrfl/izriiat4aqktaAF7n/DXFakItgfCaa1qK/8WtKeg5RG5psJYgYUKqESS7p+@vger.kernel.org
X-Gm-Message-State: AFuF++kddxyiwy5rZyL6p64iODh2HQSX3KPO+dpxXXNYC9Di88gYzbh6
	ZoWfeip/LqY9RvrSdOgOEWZDvM5mW+lADWQh+LvWMuuavwvA0Zu33XlE
X-Gm-Gg: AYBFou1ooiPiiDUq8a3hulqTeLWDufYvW1BrQg82Ddnhl3rSLHyLIikMks7mBDGJ19M
	dleSiriRoGbnaYJactEDI0APq9oCeKS6WDYC4kbJtSCMaywDP5A1du3SWHQxr9v5JBU3s6Fl9I+
	h813yGn4bCd6vXWu0h48NZ35CaBOSXqo/lTjjeIzkbBErSz7YWHEK6ei7zAaMwMuj76HnIr2Kbz
	ZHylP2lCeTAmYIJvP2zn8GRds3du7KAF0jexyapBGdB3SZoHDhsalwFDIn8JpvyvYJRu9OvfcZ7
	QH5GbIMdwMDGk/uNmHPg9ZJWGtV/qV70sYbsoY/Jb1X0jMUVyxCQlY145Io8gAi7qFpILIOfCbK
	VROmvHrMmmW4W0yn9VK+xRdn/5DQITQbEzCv0XNIqhENpSxlhI52w45E6LGqEv+uZihIPMP0qa+
	b+2jIR+L2u1XtEFlHFPnFrkNPKLD3yI8qabc9ExFJO90N9wtxcuMMFqFesSu+m
X-Received: by 2002:a05:600d:8445:10b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49cf825d77amr6515435e9.11.1788466995662;
        Thu, 03 Sep 2026 13:23:15 -0700 (PDT)
Received: from antoniarch ([78.212.5.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm19661395e9.1.2026.09.03.13.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:23:14 -0700 (PDT)
Date: Thu, 3 Sep 2026 22:21:32 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 3/9] rtc: abx80x: add mutex protection for register
 writes
Message-ID: <apnV9eSqJtBUoyId@antoniarch>
References: <20260811194034.28937-1-apokusinski01@gmail.com>
 <20260811194034.28937-4-apokusinski01@gmail.com>
 <20260811195656.691DC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811195656.691DC1F00A3A@smtp.kernel.org>

On Tue, Aug 11, 2026 at 07:56:55PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Medium] The patch adds a mutex (`priv->lock`) to protect multi-step write sequences (like configuration key writes followed by register writes) but fails to acquire it during I2C read operations. Because interleaved I2C access resets the hardware configuration key on this RTC chip, concurrent unprotected reads can silently abort active write sequences in other threads.
> --
> 
> --- Patch [3]: [PATCH v5 3/9] rtc: abx80x: add mutex protection for register writes ---
> commit 22bce01eb8bed117145738b82a585f1daa2c3fdc
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: add mutex protection for register writes
> 
> This patch introduces a mutex to serialize multi-step register writes 
> on the ABX80X RTC, such as NVMEM transfers and configuration key writes.
> It uses scoped guards to protect these sequences from race conditions.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index fdf9664ebb6f0..0c8d3416fd5a9 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -234,6 +237,8 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  	buf[ABX8XX_REG_YR] = bin2bcd(tm->tm_year - 100);
> >  	buf[ABX8XX_REG_WD] = tm->tm_wday;
> >  
> > +	guard(mutex)(&priv->lock);
> > +
> >  	err = i2c_smbus_write_i2c_block_data(client, ABX8XX_REG_HTH,
> >  					     sizeof(buf), buf);
> 
> [Severity: Medium]
> This is a pre-existing issue, but do read operations like
> abx80x_rtc_read_time() and abx80x_read_alarm() also need to take
> priv->lock?
> 
> If a process reads the time or alarm concurrently with a configuration key
> write sequence (like a sysfs store to the oscillator or autocalibration
> attributes), could the read operation interleave and silently reset the
> hardware unlock state?
> 
> This would cause the subsequent configuration write to fail, since interleaved
> I2C access resets the hardware configuration key on this chip.
> 
> [ ... ]
Not true, reading the registers does not cause a configuration key reset
> > @@ -539,16 +559,18 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> >  		return put_user(tmp, (unsigned int __user *)arg);
> >  
> >  	case RTC_VL_CLR:
> > -		status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> > -		if (status < 0)
> > -			return status;
> > +		scoped_guard(mutex, &priv->lock) {
> > +			status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> > +			if (status < 0)
> > +				return status;
> 
> [Severity: Medium]
> This is a pre-existing issue, but does the RTC_VL_READ case just above
> this block in abx80x_ioctl() also need to acquire the mutex?
> 
> Since the read case performs an unprotected I2C read, it could bypass
> the lock and abort active locked write sequences in other threads.
>
As above, the read does cause configuration key reset.
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260811194034.28937-1-apokusinski01@gmail.com?part=3
