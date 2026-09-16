Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9EC3C1D54
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581270; cv=none; b=uM6j5psiZeABOP01xYtN38XmgTOwN0tqyZJ5tJFMGJ6DUBzv4brZ6+4bnzNRHyww0/nMAwAOIMn8mbxODrusNUfD3eLyrtv1Epd+bnTEjzMK/TcDnygdAKuWIQRIIeksUNeHiGVEWrI0cGhGCrDgF/HGtInMGLC3sdvqMjtoT1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581270; c=relaxed/simple;
	bh=Cqg6vVI70cLVzEG8ecPWCjFZMFvO/UxUkzSSLhHLR1w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cDuGUJr3jKsF1ejcElViDBVSpwi8MqUg6WxSTiQzprZD4eLpzdc9wPAet8ZvZ1KJ7tGyHEW/4Nap7KlpnQlgohyerOLpxxZwgeV4YcTa/awNF8L2qYZFu46ouTq8JrrUShVGAVebfF/JjZiffNZJqmuXdqNkpay8SqJog4L/9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TcSoHG9V; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TcSoHG9V"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7835EC5CD5B;
	Wed, 16 Sep 2026 17:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E92D60337;
	Wed, 16 Sep 2026 17:54:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E109411C7B048;
	Wed, 16 Sep 2026 19:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789581245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dk0JQm8us/AHyRmRetaMD31Tkw103q/6ScjStQSddmA=;
	b=TcSoHG9VOO8N/Akl1Ii5cXGAwVbhs35cR/6fcw83quy012TAR8wslY0ekQpyWWsvOcKMSK
	YJXXQSTo2x+g0+urFdfPyc1yvtrfLSbJHRyXtV8GNkZCgf4PJxWMAmj+ACBJG6eYpJk27K
	yf/2FhVmrRURAfimPmiirMOghxiKmgM38qTlx4uohz88EhDu0K9CzqON4RuMBmgFoLeDR8
	q1enwneWpIxGKZuDxcABQA+y80oXiIxkIVe9bpHnsD0LJu8X/rOwJP1+KnN5ssZdlHwcJn
	JxGTOCzdsQhdCb+2qfFmBaIjh89GML2SzqfCttBGoz9tWCtwzGRjCUTmR5xtng==
Date: Wed, 16 Sep 2026 19:54:02 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li
 <Frank.li@oss.nxp.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke
 <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 5/7] of: unittest: Test fw_devlink with PWM nexus
 maps
Message-ID: <20260916195402.6b48cb77@bootlin.com>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-5-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
	<20260910-fw-devlink-nexus-ready-v2-5-17ac82dbe226@toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Ernest,

On Thu, 10 Sep 2026 16:16:46 +0200
Ernest Van Hoecke <ernestvanhoecke@gmail.com> wrote:

...

>  				fwdevlink_nexus: nexus {
>  					#gpio-cells = <2>;
> +					#pwm-cells = <2>;
>  					gpio-map = <0 0 &gpio_provider 1 0>;
>  					gpio-map-mask = <0xffffffff 0>;
>  					gpio-map-pass-thru = <0 0xffffffff>;
> +					pwm-map = <0 0 &pwm_provider 1 0>;

Same comment as for GPIOs

> +					pwm-map-mask = <0xffffffff 0>;
> +					pwm-map-pass-thru = <0 0xffffffff>;
>  				};

Best regards,
Hervé
