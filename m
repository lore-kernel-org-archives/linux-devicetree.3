Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE84470119
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 13:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787233108; cv=none; b=hEL3tr8eqrSORROcMBU1Ey+v/BZ80faaX7quuqGG9Wm7KxWZiZoK56pEus2OmNPk+vMxnj99M9aMHRxhnrokz9NjZLMyIUNfoT/RLgxbeF8dSiYIrkYWHnlVjFCOuZ+e8zyigpFhxisql2wbxjRx8Q6mr7Z7qfXAg4oA/JLit/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787233108; c=relaxed/simple;
	bh=Z1miCnHttir/G3Rx76+heQpZizI2MKz53FCI+RqfCDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0uSiOkIgoujpzetJTEfxdbYasw5G6M/wuTkZwyS2az9d54o6xvq47D6m327wiGLp/6VcqHFNbSz/MjK1rN2AI/3PqVHGdOlbTUwye1rqXjJu9jK1UQe6rPknZ9X438WiRLbMULV6L5aRUNwKmU3lWMsQZUW7QZFaucunYF4orM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErzBM9dz; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErzBM9dz"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2612775a91.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787233106; x=1787837906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w3D/ZSNSsJf3laH+O8H2mOW+Lx8KwZD//ZzfL9xd+2I=;
        b=ErzBM9dzVDElT8+JVtKJ59Bv7ZUhJ8vNJSBtUSZBJ/eyKJEybrMfq+mzV4BDJnEhuH
         kVmy5sJJxXuhXK+cskv/w0LeD7pAztYVg/Bz1KrR2VFOIV75f3/e7e5D9agwFGqJS8yr
         oh0+8b1+v5MlJSIub+uChpgNoxMHYoOiPNLgFCl5G+2Vo7l1RhLPfw6uuzEryN4huROt
         G9hgBhuWiHAbl+7Zz1oxSV2Kpa3NV0Mvt0t/aCiFPQjeOg3pPGK0HWzb/gUenbvjmLcl
         PI5TClqaIxmiXXRzH5SzlUg9LxC2o5xmZo5CuxWBSFfaEM7SfDtMZ5ccKOYLwobXQ5V8
         n6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787233106; x=1787837906;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3D/ZSNSsJf3laH+O8H2mOW+Lx8KwZD//ZzfL9xd+2I=;
        b=ArO+bsssaet12dwSlrJe86i0Nf1WhtjK14Eip3m0K1k5AWb6PTLz1aYve08sMjRZgl
         LGG1p442k3h9SBJStspowKMQVsWdyZdJ0iqJUZS2nErAdaIfM9uK9BHzWHfc+08nlsgm
         ljJDmHNXKYIXdADvpdO8vLMnAEPHaH05aZK4Hw6Y0NtNov0EC2UdiP1sLo8dbk5wNK9h
         e3I+ShyGm12/IOKlfNhE6Y658ZuulXbCD4LMlByGyQp8tACT55SHFKOHoIZJWcJLetOV
         IK5D7HIJQ5/uJOI6U12S7UL01PVMZOw6SKj6sGkJJCSPz4U4uKk8iQtd5+Dz1alVdcMo
         qqqg==
X-Forwarded-Encrypted: i=1; AHgh+RqxzgPnQ5dBx0v8zIiaXtdlTKHj8eCit43D5M/phtA9swEQ+u4bdHZnElAWbK+REeMKoHSIky27aTpg@vger.kernel.org
X-Gm-Message-State: AFuF++nMG4CLR/FjPD3aUV3eFjDO570n50IYwq/3nVzUtsJcCBqvOpxs
	CdKwi8a1kX7enctCPIfZ4FJcqAGKj6GoG6wQW/irE4Nzlv1xv5eDtdnc
X-Gm-Gg: AR+sD101Ji9Z9pRuIlqi1wCAIcHcnPYdJMWGy0+OeJclEbg04p8JhcildSr6MVXUgWH
	EtVA091mio1lViaJmY/JmaIYKRLgDIgKOvTf/OJxrUbirsfGmYBihDUYDqxqCmjPAZQhCwaDJ0V
	hUMW/akV6qDm2SDZLKYCkWagCJM3lPihjq7IBo2SMZr58c41KXQQo37zbIpu4BrfVKv+i4qGJC/
	nINJDHUmtxmkEElvg+bqrURDxrR1ZI2bQwroDIkM7APzK01SeN2rwdGcJiIwzslbWa95cgXqZsm
	YZMd5BShBH9bDbXGM7FVD/r/SeX5jGcdyGymqrQZoTnkT9GgulltDYpQG+tA2nJh7NlBTAkwZh+
	NOWutcV4kDr5Pb1/8dMdB9ar99d4p18rjo0tWEAyvrF+f1kSTjl0fholOZEBgRxnsf+MqxHQG9C
	pOUqjOba8nyL0hwiLmK/zU0y7bX+yTCFxbI6lHthWNZosUPn3YIeFO/H5BXbiX/15EfTbHeZ2sS
	g==
X-Received: by 2002:a17:90b:4a05:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39580a80a65mr24462807a91.4.1787233106124;
        Thu, 20 Aug 2026 06:38:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm27736097c88.13.2026.08.20.06.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:38:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 20 Aug 2026 06:38:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: (starfive-fan-tach) Add fan tach driver
 for StarFive JHB100
Message-ID: <9fc113e5-e56c-4e9f-8b29-914f39503b0f@roeck-us.net>
References: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
 <20260819091601.41077-3-changhuang.liang@starfivetech.com>
 <033d3490-9848-436f-a7ad-e6ab73768031@roeck-us.net>
 <ZQ4PR01MB12025F1BFB7E3F897228AA40F2A42@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB12025F1BFB7E3F897228AA40F2A42@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>

On Thu, Aug 20, 2026 at 10:15:52AM +0000, Changhuang Liang wrote:
> Hi, Guenter
> 
> Thanks for the review.
> 
> > On 8/19/26 02:16, Changhuang Liang wrote:
> > > Add fan tach driver for StarFive JHB100 SoC.
> > >
> > > The controller supports up to 16 independent fan tachometer inputs and
> > > reports fan speed in RPM through the hwmon sysfs interface, along with
> > > stall and low-speed alarms.
> > >
> > > For this controller, the special clock and reset operation sequence is:
> > >    probe: clk_prepare_enable() than reset_control_deassert()
> > >    remove: clk_disable_unprepare() than reset_control_assert()
> > 
> > s/than/then/
> > 
> > >
> > > Co-developed-by: William Qiu <william.qiu@starfivetech.com>
> > > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
...
> > > +
> > > +static int starfive_fan_tach_hwmon_read(struct device *dev,
> > > +					enum hwmon_sensor_types type, u32 attr,
> > > +					int channel, long *val)
> > > +{
> > > +	struct starfive_fan_tach_data *priv = dev_get_drvdata(dev);
> > > +	int ret = 0;
> > > +
> > > +	switch (attr) {
> > > +	case hwmon_fan_fault:
> > > +		scoped_guard(mutex, &priv->lock) {
> > > +			scoped_guard(spinlock_irqsave, &priv->irq_lock) {
> > > +				writel(STARFIVE_FAN_TACH_STALL_INT(channel),
> > > +				       priv->regs + STARFIVE_FAN_TACH_STATUS);
> > > +				/* clear fan_stall first */
> > > +				priv->fan_stall[channel] = 0;
> > > +				reinit_completion(&priv->comp_stall[channel]);
> > > +				priv->armed_stall |= BIT(channel);
> > > +			}
> > > +
> > > +			starfive_fan_tach_ch_stall_unmask(priv, channel, true);
> > > +
> > > +			/* Waiting for hardware to measure */
> > > +			wait_for_completion_timeout(&priv->comp_stall[channel],
> > > +						    2 *
> > STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);
> > > +
> > > +			starfive_fan_tach_ch_stall_unmask(priv, channel, false);
> > > +
> > > +			scoped_guard(spinlock_irqsave, &priv->irq_lock) {
> > > +				priv->armed_stall &= ~BIT(channel);
> > > +				*val = priv->fan_stall[channel];
> > > +			}
> > > +		}
> > > +
> > 
> > I'd really be interested to see how long it takes to read the alarm and fault
> > status of all fans. And, yes, Sashiko has a point: the attributes are supported to
> > report a sticky status, not something that is calculated on the fly. Is this based
> > on some heuristics ? I don't claim to understand how fault and min_alarm are
> > calculated. A comment in the code describing how this works would be
> > helpful.
> 
> There is no real calculation for fault and min_alarm, the hardware simply counts the 
> corresponding pulses within a specified time period and reports the counts via interrupt 
> when the counting period expires. I will try to modify it so that the previous statistical 
> result is recorded, and when reading, the previous result is returned,  thus eliminating 
> the need to wait for the measurement.
> 

So how long does it take to execute the "sensors" command with 16 active fans ?

...
> > > +
> > > +	for (index = 0; index < count; index++) {
> > > +		u8 ch = tach_ch[index];
> > > +
> > > +		if (ch >= STARFIVE_FAN_TACH_CH) {
> > > +			dev_warn(priv->dev, "Invalid tach-ch %d, skipping\n", ch);
> > > +			continue;
> > 
> > This should also return an error. Also, this is the only use of priv->dev, and
> > priv->dev == dev. priv->dev is therefore unnecessary.
> > 
> 
> Thank you for pointing that out. I noticed that the `struct device *dev` passed in the function 
> starfive_fan_tach_create_fan() is somewhat redundant, so I plan to remove it directly and 
> keep `priv->dev` instead.

Just for use in this function ? Why ? It is not used after probe.

Guenter
