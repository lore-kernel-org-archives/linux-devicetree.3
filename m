Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE61394E91
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 21:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781645014; cv=none; b=ueIG3W1Bb4h2s+Sa3mWGO7RaD0CBydYvg7pfrSV5nsKPqcfozzFwkTwwIMF5Mjv8pX0r7rL0rXCQ+jg+4WGS5vUPvYf79zuonH4UaosRyyIA8gqdfGv2NX8iljvwWdKSQjhOOQMIvbAE1+S/tMVLYBpkua4EdG+WQbZquSn2nSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781645014; c=relaxed/simple;
	bh=tOJ0BjM0ldVhSsSRHlSMBhHPNTPDe2oSS1RBcYunUGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHsOk/pKJLpqY+kRGw5iIyS6lq4t3x+5q1bPm9Bwon1v1mdBF4tLNpBn5GDRek10IKYIugGcUFoC81MhNYacbbVhSLWX8XZGDsIeBgsimVONq7OmJdaO8lWb/QBUARAH9I2FAmbZJtqjJXOORtESxnMvpuKQ3IQpcsxwq81H9D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b19JHsqJ; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b19JHsqJ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bc806fcf8so514779eec.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781645012; x=1782249812; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVGHWnnJ0bnpjfbLQ9kiQcWUR79CsLTM1nJ13tFxcHw=;
        b=b19JHsqJ5m57yk8F1Ppz9Zz8y5Vvmz7mf6EkhSHLdJr0HbRrL5ZLsstiM9H/54Am4w
         Iwat9IWtbxJpgbsREgmnTza00VP9dVTBfIt1Y/QeyA5yV+im30tVKzekbRH34ghNxk6d
         AmyxXW1NQXNCu+IqPdtV3aTKtM1anr/yJAr7ZYmyh5MO8ReVE3MEPTLYfGIvPthn0X0Q
         Ur7FLNAACsrCKrUdzE/kDpmisHP/l5sgjWjHZQV444AUMXnE2ZYxJWYngNjXWs3HBANP
         lpMViTDfIK81/XszIWqAyOvPrq+gnj0CGM5WGwAA8hbVUFSM6H4tcafNnm25myTJcMVo
         d9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781645012; x=1782249812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVGHWnnJ0bnpjfbLQ9kiQcWUR79CsLTM1nJ13tFxcHw=;
        b=jb6wC2abWmcco2bwx/hjFdPwwrR0H8+51KaB837TD3qvoEuc4IHxbP1ap4PqMhuHin
         pQJdqr0EnrEhVQ3S/oEq559s46hJhbxqBvMzbmi5GgZB5qxGE4vDPD6oxV/+1kWOYfc1
         lVNnHZUXLuqZCOeWVPqoentaV4LgWLdiQw7IwJYCc40CqBhZZUNdJTzAKbKM0t5jU8JH
         1VieGmaj4cDQQsu+NMyAEMi4sSnTJ1ByoU3MJ6z3n630kTk8jOahXQ66X93lZedlm8L2
         7MsjLLjXRYVBFTuF1GkzwWvYoE8+qDPlOkXM/dyyhQrtEClMSsrjE/WFVyXk49UISAuI
         kQ+w==
X-Forwarded-Encrypted: i=1; AFNElJ83cLHR3Vvu4cdvNX/55uHKCoF4moRIk88eOc3KsmXwy7MGPw2eo/riWUOJI2Ohae1v0uT+nyrQY98I@vger.kernel.org
X-Gm-Message-State: AOJu0YwTvMeBUow3lSpvey4G8rIMc0sMxfgRKkg+xUIR1VI3S0Z/xwCA
	iuPm5u2RDZDUASU+J1ZjYToMEyXUrtEHilfGZl3gWJX/wS6BQUC9dSMC
X-Gm-Gg: Acq92OEWjDTwwJ5/Lwj5xeAq3FshHVFUXkQuaMTKE7HKUrvFGFoQmM++Oha6KuQdcrH
	g2V5U5ad2NXUOCNHYO3oXQsk/oZQNlJ5748nOxId8xajLVXfwyNP2YfxNQa0kMx/X0Yp9Jr/7y4
	z4HeuJpdg4JB/vtzyFaFEhL0xPLA7qLlFK40l9UY3dJl4qE37VENz1JvWXPw/CzwwnqqVE3vYlD
	3duhLN+uzjgJJoo0d0jD3jXQXGbm4/lTBL58NWLR6pdJtJVfYKw0Fgz5FQDd5dTK3uMvUZ7ZX3N
	ntmUy1Eyy31z7lSoP22E08rJXq2Szy8nM47g4wFQK/rura6AAf8Z7BNABhT4V4s3WwRy5xSi1ET
	TBbWX4mE9dpkT5QFpE7GEhOJrdJSipNLJKDW9wvBP/AcO5WLeTREVgPy6SSfGa0+A1mARsLxfrw
	WZ8SDU6i4uAkYhHnV3OhDn5RtylVfQs6wWHcrOA2Kg1/e0oqLL40MnI5VyN5HbiC8=
X-Received: by 2002:a05:7300:8c85:b0:2f0:5605:466e with SMTP id 5a478bee46e88-30bca92de91mr522312eec.9.1781645012000;
        Tue, 16 Jun 2026 14:23:32 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:cbae:d24:189c:2cb9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd0deead6sm109387eec.26.2026.06.16.14.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:23:30 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:23:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v8 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
Message-ID: <ajGyejCSRMhY4G2R@google.com>
References: <20260528053203.9339-1-clamor95@gmail.com>
 <20260528053203.9339-5-clamor95@gmail.com>
 <ajDPtOyr8GJYaVYQ@google.com>
 <CAPVz0n2fnM6zYtP9bCtsY9mcLdce_R+1UPmMo0o4JRgjnhuhKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2fnM6zYtP9bCtsY9mcLdce_R+1UPmMo0o4JRgjnhuhKA@mail.gmail.com>

On Tue, Jun 16, 2026 at 09:25:25AM +0300, Svyatoslav Ryhel wrote:
> вт, 16 черв. 2026 р. о 07:26 Dmitry Torokhov <dmitry.torokhov@gmail.com> пише:
> >
> > Hi Svyatoslav,
> >
> > On Thu, May 28, 2026 at 08:32:00AM +0300, Svyatoslav Ryhel wrote:
> > > From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > >
> > > Add support for multimedia top button row of ASUS Transformer's Mobile
> > > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > > default which suits average Linux use better and with pressing
> > > ScreenLock + AltGr function keys layout is switched to multimedia keys.
> > > Since this only modifies codes sent by asus-ec-keys it doesn't affect
> > > normal keyboards at all.
> >
> > I think using input handler to intercept ScreenLock + AltGr is quite
> > awkward. I think this also passes the original key events (unless you
> > make it a filter not a regular handler).
> >
> > I do not see benefit for reacting to AltGr+ScreenLock on other keyboards
> > to activate the special mode on this one. So given the fact that you
> > already mange the data stream when you split it into "serio" ports,
> > maybe just intercept this key combo right there and create the input
> > device and signal input events right there?
> >
> 
> Though it seems awkward at a first glance, media keys are integrated
> with a standard keyboard in a detachable dock. It is highly unlikely
> that media keys will be used with a different keyboard then the one
> that is integrated with dock. Additionally, the ScreenLock key has a
> code specific to this driver and is not in general use, so even if any
> standard keyboard has AltGr but none has ScreenLock specific to this
> driver except the dock itself. Handler is also set as observer so it
> should not interfere with work of other input devices.

I am not concerned about it interfering with other drivers, I am
concerned about it unnecessarily connecting to unrelated devices
(anything that declares EV_KEY).

Again, I think having input handler is not appropriate here. I would
fold this patch into the patch that introduces the 2 serio ports,
enhanced the data stream analysis to detect your key combo, and then
report through this new input device. You do not need to have the round
trip through atkbd and the new input handler for this.

Thanks.

-- 
Dmitry
