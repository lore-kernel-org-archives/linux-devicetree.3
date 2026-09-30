Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D86A44F543
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754806; cv=none; b=DxV3T95eU1Ky8KZVEGqsVW115dn66GGcqzkQBWq06/1ouphHUOhVgXarmaKjIGBgkLTp+7JwOWob/n7Jz5IOB+p5gH9PmTzfNG3ccDpUQGi63Mu+We4yI3QimHhWmOWjOfpLWVt5fWbp0EaO43V3BTHywYqJ26U/60u8SXeMg2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754806; c=relaxed/simple;
	bh=6DKatlxffhk1Ma2S0NPaHdERsrMNfgFOEbtCWhR/2HY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZfFgl+eJ0JhGsuSeKSj29LMcvuE2B83vPBXyyFvfOXEZsDoTd7lulBZDj/kkY8eIyCxXeYkzTf6oJvi4iX/74RFe85O2CeBtlc/Yk7MMxaZGBhlvEHkOMx0Kn8A7BSwE/Rzv8UqSpizxfVC7x78D9J/yM5V+dwfREe36q0r7AoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjRZDD/h; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjRZDD/h"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so27485355e9.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754803; x=1791359603; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAVEwX1cbG2Scf8aznTJisEUwviOCJejkET+NM0/PLQ=;
        b=sjRZDD/hv6awRoJ1I8LMw5ZOcjx7ARAQAOBmSJR2APPmHVUImwbI0HW8EOnY1t+xBv
         PwpEa3QRlH3m4fjFF0JYQo4CZ1T+qtOyEltAo3S/RWLdA82/5zgrAT8RzL21fvcJ5gI4
         KL0Axtl2hVou0ltofDYkKVzMZkgOKkRS7KMEmURfvUR5QLvOVQQ6PGDaK/n/xtWz0uf7
         eSqwDi0Sh8Z8lb3ZU7H7Amv1ckowd9zVQBjvGoEGMDN1Xbic7tteT/8vquTfCBDqbQ/k
         rrk3VJyMFktreafSDrGg4Icm7r4FVkkt2Ww2h4fuLK8skxkvmQyYFm/MnvE5i7FU4r0c
         qg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754803; x=1791359603;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAVEwX1cbG2Scf8aznTJisEUwviOCJejkET+NM0/PLQ=;
        b=aktSGBMqPM2SejzSqGSLq28Bukn0YWdtg1oyz0cajDdPhKUs3Ibk/XMQ03T72UpgtV
         VnNk2yUCTOae04J+2MjRbZQEOBSTe7Cr8qdOcL09hmkQ6HMnSOPG2sXfSLoGNEMjwESW
         dCWaMHqPm9iwlNyxmEKfnlEqa/Cwuu0mZyV1GMJjd+rkawuHlp3JqAIdngfXGe6IC1Q4
         1Q+QT+18qt7H0RtzG7KrUKiGGGnoC5Yhrm/0bQYcol2U8ertIigxwfh3GUEn8NqtQa9b
         uOVSW83HpFoKtWIB70yC1HL0I3OtSs92Q+uRIdosK7v5T5xE3sPXbLqHRM9qb9rDWc0E
         7YUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9pPM0UizRGgkPBqJUCoEw8bJD7pUw0vqMDokETpTFJebhEsNyfG4Z02HHcyZ40AFQqgpzyZ1xjzBp@vger.kernel.org
X-Gm-Message-State: AFuF++ko3iaG4bg2K45KwfZffDaGGTGf4JzMsbAA+QonAg/h5YTL4zBf
	DZIww3xXjeodIqzHxYLweGg2zE4TsFKuoNqgXNvYLq7J62hTocKwNuEfDa675oskiPcN6MGP
X-Gm-Gg: AYBFou2ir4P4ymeHlwhZhss/cgDoCUrXawdH7Yd1UfvLQP/n0Sn0mtyk7WtceM+Wn6h
	QDyIQ1TQ403TTRkvMes1idr3zoeTrNNnnuuLZdwnQH0xGuw5qPbJkfKEst3pcele88XdQVJ2Fcc
	N0bs5OxfT+rTjKXlPJ41Z0jFFnVm/qC4qd6j2tel/nxivvhF6I6voA3qh4RFfrVkY+wsYjdDmaD
	0P5TXvG369cnrWd5ZOi9Q+bkKA9Agc+7JwEhCtiXN31Fp4bmXME3v/krZTJUeiQvImiDrKLBgSl
	B2ZhOBeuIoVuLtn1OR+QnwzVzTW3QM7jd/ZNAfcXBlRX5tzTdghulGjrjuF2Z3ZTpvTSLZ94K7K
	ZLxA3KVY8zlr9lqWxHEbhuV4EFZoQScoPo9drl7l9lzyQut15Brx+My18tQJgB9lsf8iVUyeaTC
	5jIUjez1e0NhgWkHq7ZBvjZLsiFzgoX8DvkOuPfSVARO6LvA22GoY3aNzTsb7wz0PXPoQESBVsG
	QIinDyDdCPsq4AHW5DOSiyFZis2paaP
X-Received: by 2002:a05:600c:6206:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a01b01b8c0mr8229045e9.19.1790754802651;
        Wed, 30 Sep 2026 00:53:22 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0175208e0sm32306225e9.7.2026.09.30.00.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:53:22 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject:
 Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <2026093046-scheme-fastball-59c4@gregkh>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <2026093046-scheme-fastball-59c4@gregkh>
Date: Wed, 30 Sep 2026 10:52:24 +0300
Message-ID: <179075474429.2320278.397112083512309038@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Wed, Sep 30, 2026 at 09:14:34AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 30, 2026 at 10:00:06AM +0300, Fil Dunsky via B4 Relay wrote:
> > The ports are named ttyCS so that the driver can coexist with the 8250
> > driver in multiplatform kernels, and PORT_GENERIC is used rather than
> > allocating a new port type.
>
> But even if you build a multi-platform kernel, only one of the uarts is
> going to be on the system, so why have a new name for it?  Can't you
> just use the "default" name instead?  If you do that, what happens?

I tried it on the board: multi_v7_defconfig with the driver renamed to
ttyS. The 8250 driver registers its runtime ports (ttyS0..ttyS4) even
though there is no 8250 on this SoC, so the probe fails:

  sysfs: cannot create duplicate filename '/class/tty/ttyS0'
  ...
  cs75xx-uart f0070110.serial: Cannot register tty device on line 0
  Warning: unable to open an initial console.

That is why I went with a separate name, like ttyAMA or ttymxc. If
there is a better way to share ttyS with 8250 I am happy to change it.

> > +/*
> > + * UART driver for the Cortina Systems CS75xx (Goldengate G2) SoCs
> > + *
> > + * Based on the Cortina Systems vendor driver.
> > + */
>
> No copyright info?

The vendor file (serial_cortina.c) carries no copyright notice, only the
GPL-2.0 statement and MODULE_AUTHOR("Cortina-Systems"). I will add mine
and name the vendor file as the origin in v2.

> > +static void cs75xx_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
> > +{
> > +}
>
> Why an empty function?  Can't you just leave it out?

The block has no modem control lines. serial_core calls ->set_mctrl()
without a NULL check (uart_update_mctrl() and others), so it has to
exist. I will add a comment saying so.

> > +static void cs75xx_uart_break_ctl(struct uart_port *port, int break_state)
> > +{
> > +}
>
> Same here.

That one is optional, I will drop it.

> > +static void cs75xx_uart_release_port(struct uart_port *port)
> > +{
> > +}
>
> This feels wrong.
>
> > +static int cs75xx_uart_request_port(struct uart_port *port)
> > +{
> > +     return 0;
> > +}
>
> As does this.

Both are optional and the resources are managed in probe, so I will
drop them in v2.

Thanks for the review,
Fil

