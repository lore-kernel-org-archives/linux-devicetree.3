Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C44FD795
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 18:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668154; cv=none; b=WguITQI0pWANuyBjkA/tdaJgKZu9GrZgvVHiDyIBxb0SnS6VEbLDzWGLTdjpDIUnULh6tF+cHiZzQGQOX40FCjagxuNSFf8qWIMnDsRSuIXExUwIpTBjhwS4iMCgR8P/gnKCkD3aykzMT1QlsF+DOTtsIoxnHv+PC4uS/JB/LUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668154; c=relaxed/simple;
	bh=fWeVX8x7HAmbo/Np4MivXSYP5FclmPOlzMclAQTIwug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBBmin+4Q5nGnYDbVzcKNbkN9eujoyrp7XR79aACXsk48kGcI/pAQgqKWnnzBzcc7P9NEbSTfWwI872y1WurorkaFC6NVuqk+NUpqtYRqFeGo4NMhOeJbymnkm71QNTKcOIba3hZGirgE54FeO6Sc/KvCupNurpomj5tnUqWa/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhW2+0UW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhW2+0UW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so6859465e9.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668151; x=1790272951; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EP61s3LnDYIz9su7+Im2NBnWl8yHpK6Gkwrf//woF6Y=;
        b=XhW2+0UWDOHoFnrh+PX1pNhUEYPObAdKToRS8AuwUHoHxBZ2IPWNo2qkfxB865Ma6A
         JD2dybwH6xHFdXB+udP7YzovCa73n4uGTcWGeuI1nXLIM0KRYMBY03aJ90W+iqa4P7NP
         zs/rpEdEf9YzvpEURdV0rvSrFdSVxA6g3f7VUMgwXy8SNlXMmxzF0gjXdDFcDHHhRqen
         MqedxrirWaXXrbWRZP40fG32hYLOlUSr5r4u+wrL5vwz1/hClANFvFSccdoPAdgrlKMo
         9W5l4UdcRl4ICpADabfe8kgtD09ktA1PLsztfH/QXl4bS4ODwlVT808Lji86UIbXPTR1
         YhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668151; x=1790272951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EP61s3LnDYIz9su7+Im2NBnWl8yHpK6Gkwrf//woF6Y=;
        b=zNftzs0s73Wy+GugCEBsys5GgohnQTQeEeSu+hTukJdySIRjwKOPg5lJwca4YFboDH
         qlfqokAllP+Ofu3UpDHlqDPlXoaN56fFi+qruKSt/NqIwe++l1IHRNUh7en85+h7Kzey
         hf1exb1mVOypsAODM0CsWLz2+2QhYzgJKSVG5b/a7FxWUyAR29SzYohN+WLEhXFGSoMY
         NdK7WwV021VHj/WdGoQSEXNcGEgAu9b/S/JSbTd1GZmMEoq+Y2YWtw8PSdKpnnbc2zZe
         JGtrTu/+ux9SVhhJGwTLC0RNSneSiBK0cZehqVhHmeID5A3+9Y+LySs3foCn3vw5fk1l
         8C8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfPEVC6pzo3NKVpmq+vkBli3dd93eTIs+WEAPUZ8lU2LinZMMzH4/pfXPGEQM+sI5kJN766E4d5I+/@vger.kernel.org
X-Gm-Message-State: AFuF++mICHWEmnvi2PxJhJh6Ay7jgNu9IQQz4XNzWXCXtFgBZLMmZRv+
	N0lRxjeZtljzz8c2/B71Gy3u0nnmTREOzJj4vH4CXaauK27dHV3bEuEn
X-Gm-Gg: AYBFou1Xita5tWLc2siBTMR30cfjSdCgzSViiOkvwZOnZg3pENC+oFmMipbfB+/2JBe
	id83SC5at2gq4azOyLiVzpJWN2YXeFwzxXABKxwbiqEqehiaKqfR3JwJfikIKhNtNFJz8RWNqtm
	DU81fNgpsDQ2GAsAJJmLYeK9NlQGXlmeG+kor2D04nfsRDOWPhyKT6iVzhBquLemrBftCjceLEl
	BFtH96NUPBM0/fmeRXEngfvifHdOUBquCu4M9N4Nk+LbMJAG+H4BgJSNDWgEMAVgLAnVf5l4rL8
	82TMhipVB5IxGHSuGIo0oUd834NmiX43GI9x940PIcRfogY8oinaL3ijCMsh9wE08HZettIMj7q
	Pva+LCxTQk5M82YVBs2T7neZ+YRA2StpGY/9tKiIWBkPyrEVbfiTJqB007exSmoLHoFb+tsQfUa
	pGBJj9dSWd8ELfUGHA/1KzvnXomRoLut6T2X3QzZQGeKBb924OFk8Y6Q==
X-Received: by 2002:a05:600c:4ed4:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49eac462571mr89969195e9.2.1789668150501;
        Thu, 17 Sep 2026 11:02:30 -0700 (PDT)
Received: from antoniarch ([78.211.139.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm96803245e9.6.2026.09.17.11.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:02:30 -0700 (PDT)
Date: Thu, 17 Sep 2026 20:00:44 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
Subject: Re: [PATCH v7 4/9] rtc: abx80x: properly handle shared IRQs
Message-ID: <aqwpLXghj-NWgH8w@antoniarch>
References: <20260916205138.16771-1-apokusinski01@gmail.com>
 <20260916205138.16771-5-apokusinski01@gmail.com>
 <20260916210527.CF14B1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916210527.CF14B1F0089A@smtp.kernel.org>

On Wed, Sep 16, 2026 at 09:05:27PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] rtc: abx80x: race condition loses interrupts due to flawed W0C status register clearing
> --
> 
> commit 27cfcb7135851594344aa538f01f8ef1328d2392
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: properly handle shared IRQs
> 
> This commit updates the abx80x RTC interrupt handler to only return
> IRQ_HANDLED and clear the status register when the alarm or watchdog flags
> are set. It aims to properly support IRQF_SHARED by returning IRQ_NONE
> for unrelated interrupts.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> 
> [ ... ]
> 
> > @@ -284,9 +291,15 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> >  	if (status & ABX8XX_STATUS_WDT)
> >  		dev_alert(&client->dev, "watchdog timeout interrupt.\n");
> >  
> > -	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
> > +	status_flags_clear = status & (ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT);
> >  
> > -	return IRQ_HANDLED;
> > +	if (status_flags_clear) {
> > +		i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
> > +					  status & ~status_flags_clear);
> 
> [Severity: High]
> Does this logic introduce a race condition that loses late-arriving interrupts
> in abx80x_handle_irq()?
> 
> Because the ABX8XX_REG_STATUS register is W0C (write-0-to-clear), any bit
> written as 0 will be cleared in hardware. 
> 
> The expression status & ~status_flags_clear forces a 0 for all bits that
> were 0 during the initial read. If a new hardware interrupt asserts between
> the read and this write, its status bit will be newly set to 1 in hardware.
> However, writing back the old status value forces a 0 for that new bit,
> silently clearing it and losing the event.
> 
> To preserve unhandled or newly asserted bits, the correct write value for a
> W0C register is ~status_flags_clear instead.
>
Not really: if the register bits are written with 1, then during the
next call to `handle_irq()` all the interrupts are reported as pending
(in other words the written ones are preserved). 
In particular, when I was testing the alarm interrupt and the written value was
`~status_flags_clear` as sashiko suggests, I was always getting the WDT
bit enabled and hence the alert "watchdog timeout interrupt" was
printed.
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	return IRQ_NONE;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260916205138.16771-1-apokusinski01@gmail.com?part=4
