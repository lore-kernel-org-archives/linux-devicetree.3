Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE83D34A1
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514046; cv=none; b=J7uMS3dpZ419PQL0ADLkUHpSZT3o9NeKvipMf7YivKn75tpvgevcxZxYYfmZotYiTFl5t+gHp5repMOEFmw2GORqHo4t4uXOnsNIqKtu0buFWiDnaWt3jBToTCBSeOBXvTJVppsOkLz5VIHEZY8CBvdS3oXYSrLAr1YvChL9CU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514046; c=relaxed/simple;
	bh=9vbHwUfFBu0h5d3Kzw4rb31Zus7XH32N1aJcCy/L9Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dH/jM+vxBEG3vVEnmhuPfgQLx7IkDP6Y/9gEwlFt+IHNIrGwrMDlb+mJqz2RbqUgNP40Lotklo2gDsSkxRBqsF66/2NwEkF4C9lehe6MojPofjFyo554TrjKaJtfF9lznk00cUpgquhAAgRYkf8DKgO0xpLnF06DfuUb1Bgf1nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQNl3qZw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQNl3qZw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so2528831f8f.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514039; x=1782118839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2ZOqhU/l6/beyy/jENnR1Hvx3qZYXFW88yO0lTvHG8=;
        b=dQNl3qZwzDS0g+NDlWALaehegJE4tnyyDdtLYmmr5ehPPWfirTBYeErm5rbn8VCsi9
         xWf/JHoYzCV2uLl9irUmdNjx74/nlKS57LBNbLQb/W9i0eoUWq7LBK4pGoKM6+S3IIW6
         TKEt8yFW//g3CCfTjlIUWLeloOUd/hT2QTpGkhmxkdRvda67v83yyq12Ue/3IQMr/YBA
         8TmBf0+ncbZE7C+KLYdOwSIS7+0D9OinZtUU7dMuEc73DmyctRWxjeyn2NO8jHUXrCfu
         hQIaQnOLnH0TPPSx9gnJPjmUlUhBpwsIqj9z18DqX/ICtJZW7qo4pvrMvdrq55Fl3Ibp
         Av2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514039; x=1782118839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z2ZOqhU/l6/beyy/jENnR1Hvx3qZYXFW88yO0lTvHG8=;
        b=AljSp05Cf7qmIsw64PKcB/gO0yRXxitmKLWmeuk0SB/D7s6LafB47QvwdTadGqXa1q
         QL+mAOeWv9/nD3WkmUS2isAHu/d2egQSZbkesdn33yxuLxmConzHwbVjQzhbcRvpqhoS
         NLi3XX5/cbNMSaN5j25isWjp3WzM/ryqewFnk1oPAjfpjsrUgMIP1VpurbR+F/l+M9NU
         YcjUoJRt4ObdufnB4tGl/g6X1/hJ3OeaWocBDPqll+OSWhWvzlaaHxWfedaPy9+m9n5O
         X6tF7hy4WimfpSQPW3pvwN5r8lXUZrVWUSYOVKm6nW1KytXU0kZn+DyH41uzvWITU7Me
         a4uA==
X-Forwarded-Encrypted: i=1; AFNElJ8CC81m6auNd6h5UsF5LKCmXy+n9u9ZtN9G8Vi4mLRo/s1UfJL70FXgcf43hFXF+kP9jsZEUU+pitZS@vger.kernel.org
X-Gm-Message-State: AOJu0YxB/vs+kOhHt7I2ZJNTrYGCKhteKvs5mBnShqJXyy+H39yixIpk
	7SHtAoGUfsGtqvdVbBEyEoy3PGr8MMduLPJ5gWMSiLuF6DcGCYCbw18W
X-Gm-Gg: Acq92OFY79F4oMrU+/a2SUYAamF0MyOVeNd/eqK+OF69qHcOgVgEk66K0hxJ+Rf6AnO
	LlyopciuOqRrZ5KbNDJQAJDYVvjWsn80uMhrdgx3PoYBSR/6qi03TALhdTE9hlozFB1YdfrBM66
	GnCJHXzJggKQ7ia4M8oV7EqT4DQ3QX4yVj0yKAB4Lfgsx5AF715MK6D1aWA+IUMT20TaseePFyP
	4BnGdfM+03BI1ukw8ItfhTIQ9t3asRxAyFQTi9z9wMR7OCXxkati16goDcTS7cnU88hR0VO89CR
	dw0+pgYqA9ahzkb10kBAXEd4X8RxYz0sbmWwKN/oAsSOwJ0jDzGszXnqDe7faMasuK4p8Zva+2t
	KIvizqx93QhV6LD0HB5VH4Kj/KJtvv6rZkTFHsuZgiKXmiR0nwgpToLMbMyDO03LlR1n9zozuAA
	U5h5a7uvr7fGWMCFutlmODXPIOQkzjEiReGLeZW30sqHdTQ806PwL83IUGhvXo
X-Received: by 2002:a05:600d:6452:10b0:48f:e230:d5ab with SMTP id 5b1f17b1804b1-490ec5057bdmr127752275e9.31.1781514039035;
        Mon, 15 Jun 2026 02:00:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2ce361sm31634760f8f.31.2026.06.15.02.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:00:38 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:00:36 +0100
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
Message-ID: <20260615100036.1e09c22d@pumpkin>
In-Reply-To: <f0b7d0a0-9b75-4d63-bc1a-f0891c86b2b9@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
	<20260611204341.147f1afb@pumpkin>
	<b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
	<20260612075342.6615d66c@pumpkin>
	<f0b7d0a0-9b75-4d63-bc1a-f0891c86b2b9@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jun 2026 09:53:49 +0200
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> Hello David,
> 
> On 6/12/26 8:53 AM, David Laight wrote:
> > On Thu, 11 Jun 2026 22:33:18 +0200
> > Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >   
> >> Hi David,
> >>
> >> On 6/11/26 21:43, David Laight wrote:  
> >>> On Thu, 11 Jun 2026 20:12:32 +0200
> >>> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>>     
> >>>> The LXA boards are the only STM32 boards that set stdout-path = &uart*
> >>>> instead of explicitly specifying a baud rate.
> >>>>
> >>>> This would mean the default of 9600 is used, but it goes unnoticed when
> >>>> booting normally as barebox fixes up a console= line that includes a
> >>>> baud rate.
> >>>>
> >>>> When EFI booting GRUB however, GRUB will not pass along the console=
> >>>> line and thus the board ends up with a 9600 baud Linux console,
> >>>> confusing users.    
> >>>
> >>> Is it possible to determine the current baud rate (by reading the hardware
> >>> register) and default to that value.
> >>> Then if grub has initialised the uart the kernel will use the same
> >>> baud rate.    
> >>
> >> I think so, yes. In addition to the register divider configuration, one
> >> would need the input clock rate as well, but that's not a problem.
> >>
> >> Do you know if any drivers already do this?  
> > 
> > I've seen it done somewhere, certainly x86, but possibly NetBSD.
> > That would have been preserving the baud rate set by the bios.
> > You don't want the baud rate changing half way through the boot sequence.  
> 
> I agree in general, but in this case here, the BIOS defaults to 115200:

That would certainly make 115200 a better default than 9600.

	David

> 
> https://github.com/linux-automation/meta-lxatac/blob/wrynose/meta-lxatac-bsp/recipes-bsp/barebox/files/lxatac/defconfig#L171
> https://elixir.bootlin.com/barebox/v2026.06.0/source/common/console.c#L349
> 
> Cheers,
> Ahmad
> 
> > 
> > 	David
> >   
> >>
> >> Nevertheless, I would like the LXA device trees changed, even if only
> >> to align them with all other existing STM32 device trees.
> >>
> >> Cheers,
> >> Ahmad
> >>
> >>  
> >>>
> >>> 	David
> >>>     
> >>>>
> >>>> This series fixes this. As the device trees were added at different
> >>>> times, they are fixed each in a separate commit with its own Fixes: tag.
> >>>>
> >>>> ---
> >>>> Ahmad Fatoum (3):
> >>>>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
> >>>>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
> >>>>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
> >>>>
> >>>>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
> >>>>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
> >>>>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
> >>>>  3 files changed, 3 insertions(+), 3 deletions(-)
> >>>> ---
> >>>> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> >>>> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
> >>>>
> >>>> Best regards,
> >>>> --  
> >>>> Ahmad Fatoum <a.fatoum@pengutronix.de>
> >>>>
> >>>>    
> >>>
> >>>     
> >>
> >>  
> > 
> >   
> 

