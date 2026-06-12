Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B19E36A022
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247229; cv=none; b=e3fYHKtqj0Olp/iIEGor3g+DC3s4nvWFu0FmrmUBJw5UG8vrqkNAj8tJLNppr7k7/6tb+iGdx4RiBAi4eXmuGjDlM4C9sQSf4m9H4qwu2J3vgYP9EzikeBIuD3riVgpTiKXuDQdE9Bq5G8fzAerMzNzpHy0YKYRPrLBLXZXvm+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247229; c=relaxed/simple;
	bh=/u5OAUoODuv/UAS23jRkMs/IlED8v/yAb0+ZDxA5R14=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+fvuXvs18FhCbsXukmyeg2jNiUOl1VXNQx5YZsDhpOHtAco2ehkBd7fWD9ginhb7mr+2ELoyFwu4co4dJjMUm26a3gixcIT6q5XOmE2fB07Pc8mtXjR2c3OP8y/GBcObIBvd9YcOpS6/VnOVDARAT4EoYOJlU/TKRuOSFwGzVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdSrgkaF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdSrgkaF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso6997715e9.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781247225; x=1781852025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MssOwhTL72ghClGQmpNeh5OP7aj5IoqaYdtcZRWycjQ=;
        b=PdSrgkaFCq6tLIaL2XBy7E+zahum28ztDmDPY3GeB2GP+Jxc5t/FioXtMtx4/iT9XV
         bxv3WHCgD/5N+btjmbVB5Y430uZXHTLJ+MCd87bAO0TK6rSOGszPFbWiVqVuNEpDjAnD
         p71JcJcKhOroAIVQs6iIx2mNRfpUUMtpgpF5SvO22t1/0ubqu5TIab9mRtxHiNtZyws+
         sdnjfPzpMfS4bNNNpw+jh2+LPpCop/pJgVInVFdloiTtsjvl0hgQuIKzPOI5NwTayAXQ
         8ubbeei7wqoN+0CAxGmlXMBs8G9IlZKDmJ3joGlm21Xyp+BlXcslHhZCT9fFh+TuowwC
         dngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247225; x=1781852025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MssOwhTL72ghClGQmpNeh5OP7aj5IoqaYdtcZRWycjQ=;
        b=l2k5xBNCnps+ep4gZ7bldq8Mrti2yTMLsHaoATWpNZLefg/41UBb01FKFRCye9A1Ub
         M7VpiFtMZTBXWKJdUN8o8YBCu1AD5Y0Ro1H+YAUUmL3SB9n+sjpiMXDNyzHwnjQul9IY
         UaHx6T2vyGWLNIkIG9OfPs18iX26l3XvCCypKvBdjDx1VlXFaCAFyfeUbDxWXbHzd0zk
         3mDzGfxyqmbSQGEvDBj0eyPMjmZzp3QQooyXW01JZc70wekG30rpmnj4jSJNUGYH1u7h
         KDXA/ACusceh7phBnUyDy21vs5tJNl7UaP8XxIk8d8IioMmW/bNgwetty02DJHdyfioX
         +2Aw==
X-Forwarded-Encrypted: i=1; AFNElJ9EWl+hzH612jzAfpf8BNYxghn4+QACIHG0Cox+X5h43iAgBQtWf+N+Qxl3X3anoAaPqMnci/pLRodc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7y72QrNzmXaPRxJPEqQj7QQpNEbXi7s7HSEQUlgiw9nwF9VIv
	WLPhoRoa4zVRMBNUbhi+to1hB5sZuLbSQ5FxqOurLyQc2yPCgs7atu67
X-Gm-Gg: Acq92OGQMgtTcMOpw4kTDU6ZWXBUa9FeEMcMWsZysrUhLFEheBk8D3i1bjhN8RiFV2u
	oHN4KQYB+JmhpC3W9ofO544XB1yKXHFp3RDLWzTTCJIf5MTqgIuA8zkPfQ93XL24dIWZJ/gKBHL
	e+4cPBDFgYXGbmeYWJm8Z4LySUHKycFmGDsYkZ6NPB+FXAbJcAfvknS2TDSCrz4J7+Wm02CIbke
	NMQ9I1kYBcNhpLGYshJBQKY0C7+Q8WrNQgUxxNnhqUp1zz0x4N/cnzGIPdfeEgS7Tc9k/9aAMXy
	1bj/iEeS8c5Rb2rSMsr+1/dJkQ1BkMpoLl32slvqx4Vb3Lhj/Xpynul0neMl67OgEmWhlqsyBxF
	RaJd70ERHB1TRLXG2FGE4PdcZkYJHTdCpmnLTZYXJKoqG9/cr3SP2dZyraaNr8vqwFxqfD7l+Hr
	Oeivy8K/3X7IWuQZH2dSWNh89Ko2Ab34+JVcNcm6lszbRC+nyk8uggWOgHnfL8jCarjHpEQF4=
X-Received: by 2002:a05:600c:8485:b0:490:a1be:6b01 with SMTP id 5b1f17b1804b1-490ec4991d8mr16991665e9.4.1781247224745;
        Thu, 11 Jun 2026 23:53:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2d09a85sm119274065e9.14.2026.06.11.23.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:53:43 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:53:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Leonard
 =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, Marc Kleine-Budde
 <mkl@pengutronix.de>, Alexandre Torgue <alexandre.torgue@st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 0/3] ARM: dts: stm32: lxa: change stdout-path baud rate
 from 9600 to 115200
Message-ID: <20260612075342.6615d66c@pumpkin>
In-Reply-To: <b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
	<20260611204341.147f1afb@pumpkin>
	<b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 Jun 2026 22:33:18 +0200
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> Hi David,
> 
> On 6/11/26 21:43, David Laight wrote:
> > On Thu, 11 Jun 2026 20:12:32 +0200
> > Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >   
> >> The LXA boards are the only STM32 boards that set stdout-path = &uart*
> >> instead of explicitly specifying a baud rate.
> >>
> >> This would mean the default of 9600 is used, but it goes unnoticed when
> >> booting normally as barebox fixes up a console= line that includes a
> >> baud rate.
> >>
> >> When EFI booting GRUB however, GRUB will not pass along the console=
> >> line and thus the board ends up with a 9600 baud Linux console,
> >> confusing users.  
> > 
> > Is it possible to determine the current baud rate (by reading the hardware
> > register) and default to that value.
> > Then if grub has initialised the uart the kernel will use the same
> > baud rate.  
> 
> I think so, yes. In addition to the register divider configuration, one
> would need the input clock rate as well, but that's not a problem.
> 
> Do you know if any drivers already do this?

I've seen it done somewhere, certainly x86, but possibly NetBSD.
That would have been preserving the baud rate set by the bios.
You don't want the baud rate changing half way through the boot sequence.

	David

> 
> Nevertheless, I would like the LXA device trees changed, even if only
> to align them with all other existing STM32 device trees.
> 
> Cheers,
> Ahmad
> 
> 
> > 
> > 	David
> >   
> >>
> >> This series fixes this. As the device trees were added at different
> >> times, they are fixed each in a separate commit with its own Fixes: tag.
> >>
> >> ---
> >> Ahmad Fatoum (3):
> >>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
> >>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
> >>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
> >>
> >>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
> >>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
> >>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> >> ---
> >> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> >> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
> >>
> >> Best regards,
> >> --  
> >> Ahmad Fatoum <a.fatoum@pengutronix.de>
> >>
> >>  
> > 
> >   
> 
> 

