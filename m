Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032193D16F1
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 19:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777923468; cv=none; b=A6oLZBQ7PqVomGtTEEs0v/FgvCT48Foc4WIGozJRDdiy1SqmFisHpwqdikrPn3GRJDHbCOAojWyOQ1qhsOTR6eNnREPzyj7W0XHsj1Og5j83GfYgpQWmAy8JD6BzYA7H+Zu73lZDhMI2qmZBmkrQFMDic5NL7o7auUhYhlDf8hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777923468; c=relaxed/simple;
	bh=NCAV152kmL1c0/WTvQgyU0xiEjdTe/n/Tpg7/KyXu5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUmSxO6iu81iDXMe04JUMQWwpyp48eOMnU0ZaJXXsOTR/DJraThC7YzyY+kub7G3sq6lWod76DPee+PsvCPu4VVO0lQp6IwNiplJK8IJhuW8qzw3Gw5V/mfg+Stq5MGvphs1WhKlH4TvP586dbLqKx7XFVHMHag+81WbGZaB5Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnDGH58t; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnDGH58t"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso55754025e9.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 12:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777923465; x=1778528265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PTVTMnyXMhr6MOBQkrI7V5/oME2+FKO+b2H2y/lgEJM=;
        b=HnDGH58txQtZOLr06SuigkTLignyXdAuL9l4JAgScspsaG3Z8gun0achpQftaUtPGF
         e9Uwhp//XKTDzjdPoqzESDjzvBedRBAliIp0bbMaWXGOx+E6VWIz3qDdVAReY+mHq0Hy
         +vle3zJ1kPX30fmSnbKQU227JaOQbdMBYBIMvTgBF3jtFQX6BYoh+/APJjDomMzmtNEk
         8ahj4HL1/lXA1w08fnMp1Uk66AsEmB/1+4SHgX7RhHSZQDYNhLTngLtcCNEKQrJ0ExWv
         2IgSwrilpdS1slX+natFVoFvZM2ZQydX5O7dAxWAVA+juKnJuBZRm4hBv6AVEhZ8LuX5
         ZuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777923465; x=1778528265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTVTMnyXMhr6MOBQkrI7V5/oME2+FKO+b2H2y/lgEJM=;
        b=jwo9FOVFK66hehkvY2bh7AEgKSXC1bMy7HvavIctGfypSS2baMVNuWn9pMpUIqAMYC
         vxvHUoVIjcVBCJw2REUgAsYjM82ElBdKT/8dlFbUGMmOWeMDykq3Tm9v4M/L3JG3IMYY
         4pO8Q33a4tFGxXVuxI9QzVy8GbNivbTLQOun3PZw59aEwixwDde1t9joye/zwUA8T76+
         QYYMBWsySE/EbxovX3RKkXUmKLabReyYvIwMJyHWHAHY6oijOSbEMMfyV2i+pvWSH6Cy
         Yd3HT3fBiEf9tq6Npx3fuy3eIjiwbOUyRS+B/t4gAcMHuYQrWGOQTF2ZuBGCGcXwTrhZ
         coGg==
X-Forwarded-Encrypted: i=1; AFNElJ8ukwc0ZhXJT5+WcyptgxdP1M3hEi2M08dostqLjsqU0Egqu++QQZ575qDr/uVA2zq57rLAMBK7Wv/J@vger.kernel.org
X-Gm-Message-State: AOJu0YwAKG4hrdp6KdbPlvk92gbt3ZdqJRgTXl+ffRNjQGXU5etO+EpT
	03EA6umUT+uXCbICniKqhEQI5a0tkluF+hBhpzGJ88goVgaKZ/Wz/+pV
X-Gm-Gg: AeBDietAuIeqJ3h/VDRQDr2Bd6zSdMYve74n4Vec5X7PBQgPyE3nm2mvEFDqrT3vyCk
	jtlqQaOpKe90HTrAcwQ21ZNZW1qzSThMIq2hmnd1mQuPhjLgBHdGepcx0VGpu6z+kl/3kBra3OO
	JyBUp2Bpye6dHCsSxjb/70kd4/pO+yv5meodjVBdkBhrg6kSRmV1DTg+ddCSCtziQQnBcqNUCaQ
	4DsLdMT+ivTi6NVaLYMsjVyOzX6TYKoMBucXLvA9MBWPAlFJp3XwwhFpmay3143AbUNQcW9aTr1
	Z5rOkBqSpentBZgEHUJIBWPussujUKa4bmsEuy2jlhor226bKYuaF5hANyBj+8DNN782DunHGBz
	JcS257nSPblEJMYqeiz40EO6N9Mpmaon59OcRYjyw0tAVB/czzUqtHvwx/sX7OZ1l0D9QRerNqc
	z3r2MVznL1
X-Received: by 2002:a05:600c:e41a:b0:48a:592c:e642 with SMTP id 5b1f17b1804b1-48a9865f799mr149293125e9.18.1777923465214;
        Mon, 04 May 2026 12:37:45 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::3323])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb75fc1sm305550825e9.7.2026.05.04.12.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:37:44 -0700 (PDT)
Date: Mon, 4 May 2026 21:37:42 +0200
From: Wadim Mueller <wafgo01@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor.dooley@microchip.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] counter: add GPIO-based quadrature encoder driver
Message-ID: <45kxuyadtuvc4g2dsxcsvrsaw5agpq6zaesmc47x23vg5c3zsy@oke7vjaf7jqb>
References: <20260501200749.20029-1-wafgo01@gmail.com>
 <20260504093648.530308-1-wbg@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504093648.530308-1-wbg@kernel.org>

On 2026-05-04 18:36, William Breathitt Gray wrote:
> On Fri, May 01, 2026 at 10:07:46PM +0200, Wadim Mueller wrote:
> > This series adds a new counter subsystem driver that implements
> > quadrature encoder position tracking using plain GPIO pins with
> > edge-triggered interrupts.
> > 
> > The driver is intended for low to medium speed rotary encoders where
> > hardware counter peripherals (eQEP, FTM, etc.) are unavailable or
> > already in use. It targets the same use-cases as interrupt-cnt.c but
> > provides full quadrature decoding instead of simple pulse counting.
> > 
> > Features:
> >   - X1, X2, X4 quadrature decoding and pulse-direction mode
> >   - Optional index signal for zero-reset
> >   - Configurable ceiling (position clamping)
> >   - Standard counter subsystem sysfs + chrdev interface
> >   - Enable/disable via sysfs with IRQ gating
> > 
> > Tested on TI AM64x (Cortex-A53) with a motor-driven rotary encoder
> > at up to 2 kHz quadrature edge rate.
> 
> Hello Wadim,
> 
> This is certainly a neat idea! :-) Several times I have wished for a
> convenient way to just plug in a quadrature encoder to the GPIO lines of
> my system and immediately start reading position data. However, I want
> to be sure this makes sense as a Counter subsystem driver before I
> proceed with a full review.
> 
> If I understand correctly from my brief overview, the core approach in
> the gpio-quadrature-encoder module is to take two GPIO lines (A and B),
> setup interrupt service routines for them, compare their GPIO values on
> each interrupt, and respectively update a persistent count based on the
> quadrature relationship.
> 
> From that description, I don't immediately see a need for this to occur
> in kernelspace. Couldn't the same design be accomplished effectively in
> userspace via the libgpiod API[^1]? I believe that library allows you
> to watch for GPIO edge events and request GPIO line values. (I'm CCing
> the GPIO subsystem maintainers in case I'm missing something obvious
> here.)
> 
> Although the Counter subsystem does provide an established user
> interface for counter devices, I'm not sure that alone justifies a
> kernel driver when the same can be achieved by an equivalent userspace
> application. If you can argue for why this should exist in the kernel,
> I'll feel more comfortable with accepting the Counter subsystem as the
> right home for the gpio-quadrature-encoder module.
>

Hello William,

thanks for the look -- fair question. Let me try.

Even with A and B in a single line request (so one event fd, no extra
get_value() between edges) the libgpiod path is:

  edge IRQ -> kernel edge event -> chardev fifo -> scheduler wakeup
    -> read() -> decode -> update count

The wake-to-update delay is bounded by the scheduler, not by the IRQ.
At 2 kHz X4 the inter-edge spacing is ~125 us, which is firmly inside
scheduler-jitter territory on a stock kernel under load -- and a single
missed edge is a permanent position error rather than a transient
glitch. In the kernel the same work is essentially
spin_lock_irqsave / gpiod_get_value / count update / unlock in
interrupt context, which is what gives quadrature decoding the
atomicity it needs.

To be honest I haven't put real numbers on this yet -- the argument
above is from experience, not measurement. I'm going to set up a
proper back-to-back test (libgpiod v2 decoder vs the in-kernel driver,
same hardware, deterministic edge source via eHRPWM so the generator
side doesn't pollute the result) and follow up on this thread with
the results once they're in. If userspace turns out to hold up under
load on this SoC I'll happily drop the series.

The other angle: interrupt-cnt.c is the same shape of driver -- one
GPIO IRQ feeding a Counter -- and quadrature off two GPIOs feels more
like a sibling of that than something to push out to userspace.
Keeping both behind the Counter ABI also means downstream tooling
doesn't need a parallel libgpiod path next to the existing Counter one.

> > Changes in v3:
> >   - Pick up Acked-by: Conor Dooley on the DT binding patch.
> >   - No code changes.
> 
> As an aside, you don't need to resend the patchset if there are no code
> changes, I'll make sure to pick up the tags in the mail threads when the
> patches are accepted. This helps reduce the amount the messages we need
> to parse on the mailing list.

Got it on the resend, thanks. I'll just collect tags in-thread next time.
Thanks,

Wadim

> 
> Thanks,
> 
> William Breathitt Gray
> 
> [^1] https://libgpiod.readthedocs.io/
