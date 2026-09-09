Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C2D55C312
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962644; cv=none; b=CrfbNaURN15G3PyuibyGQ/QPBKW21z60qjSuOyFA59QND2NxNamEY4qLuumz7sTdgarKmqbo/0DFlu6LpnxnyUC5TJGNS8FmbABvy80NHNmWyNCjm6460QLecKov2LYZXis46Y6PLo6qJbh6/LGuOg7ZXMNWETf+pPy733bZ0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962644; c=relaxed/simple;
	bh=flAfYKpZIwatzm6YSBJWn1WpTr7IwC7yAuIdmnA9T7Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2traSEmmYukxc2+MNNjtL4KRry9kZOnYC1jFiYyUZ131mTPKrAOqtxVTDPFbEDpA5jKO7xCHWY3XyVQNz93vhErYkviagVUhrVPjybcaWYkMqX6PBMFC3QHHI05LB/pLay3FecZpQlInDhUsaFSkAZT8+zC4RiX3JyFNwy7nl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTT+DAzl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTT+DAzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62771F00A3D
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788962642;
	bh=0qvI3Ij6pHot4GWpLZbVGJuwCMn3p13tzKFz475rd7w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZTT+DAzlKSXBjYpX73WnjIUnaP6TjJfF7Vuuf1RzuLFdc+xCTqtUljqK65Ws6ijHD
	 ckfGyZ6owx4DTYBLML2blor0OOs0NVCBtJ2uowjMJOYUeiKvIj/spcJvNw/wzuoDsQ
	 sukkvnqVfSddWBK4wcMLuEusAPlMDSrDDx13a+4bD1wS9CcWLmHi8cLIHzMyhh/feg
	 s2+vwmK2dRw1y7fsWg9jScf7AvVGsag2Aj7j7yUye5TacAnswbxRsJF80N/tSVJqW1
	 WklzT+iyUNL1fwBPbneHxtmJjodQ0uAxFZIGJH6q1b6/dq3DqmCSG0iyi4eHcsWdEM
	 GtsQFgig7/E9A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39ca300db70so45248971fa.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:04:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZNpb/xCyK1kkPzY7lRLBT9X/DMkmQ1iq79kl2BdGq8HBmAMnUNyRYDkIPgQLNhNBF3Ps1UO6We2ZK@vger.kernel.org
X-Gm-Message-State: AFuF++n3KusZ+tRMPi7xLipeJkNEV+lO7Hc7JeCIKtht8gmHMmxQd0f6
	6x5c3ILRalmFpbZnJGNM5Ntjm+TUueug2Qxrhho8z6c5dOuNvTj/8+w6ufoJWXBk7C6voDMw2sb
	C1FD57qP6gO/DmRQlt85Ee9L+NehqZpFuwvt62HACtw==
X-Received: by 2002:a05:651c:a103:10b0:3a4:973c:9387 with SMTP id
 38308e7fff4ca-3a4973c96fdmr5064251fa.26.1788962641476; Wed, 09 Sep 2026
 07:04:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:03:58 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:03:57 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260909132153.1596191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org>
Date: Wed, 9 Sep 2026 07:03:57 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfvwcvV7yvkXz_YikGxQ8M0_ajgGA3bf==ZpT_Z46v7EA@mail.gmail.com>
X-Gm-Features: AcwNN1US7FJNeFLdpa5M-NPN5cGI7wXmVw6SZ5lmp-9zPkwIPUzMBGaaTvwumLk
Message-ID: <CAMRc=MfvwcvV7yvkXz_YikGxQ8M0_ajgGA3bf==ZpT_Z46v7EA@mail.gmail.com>
Subject: Re: [PATCH 00/14] mfd: unused driver purge
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sep 2026 15:21:37 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> As part of my cleanup of old platforms, I had a look at all drivers that
> may have become unused because the last platform_data or DT definition
> was removed, or because of unmet Kconfig dependencies.
>
> These are all the mfd drivers I found. The first ten in the list
> actually turned out to have been unusable long before my series, and
> I have added explanations on how I determined this in each patch. The
> last four patches are still in use in linux-7.3 but become unused after
> my series [1] that I hope to get merged for 7.4.
>
> Somewhat unorthodox, I took a shortcut here and remove both the mfd drivers
> and the corresponding subsystem drivers (gpio, hwmon, iio, input, led,
> media, power, regulator, rtc, video, watchdog, asoc) in a combined patch,
> to simplify the interdependencies: removing just the mfd driver would
> leave unselectable or broken drivers in other subsystems.  I also have
> additional patches for each of the other subsystems, currently a total
> of 300 patches, many of which still need better testing or proper
> changelog texts.
>
> Please let me know if you all think this approach is ok, or if I should
> explode this further and turn these 14 patches into 70 individual ones
> by splitting them per subsystem.
>
> See [2] for the current state of the overall series.
>
>      Arnd
>
> [1] https://lore.kernel.org/lkml/20260908152808.3928630-1-arnd@kernel.org/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove-7.3
>
> Arnd Bergmann (14):
>   mfd: remove unused 88pm80x driver
>   mfd: remove unused rdc321x southbridge support
>   mfd: remove unused si476x driver
>   mfd: remove unused wm8400 driver
>   mfd: remove unused adp5520 driver
>   mfd: remove unused da903x driver
>   mfd: remove unused lp8788 driver
>   mfd: remove unused aat2870 driver
>   mfd: remove unused lm3533 driver
>   mfd: remove unused rc5t583 driver
>   mfd: remove unused wm8350 driver
>   mfd: remove unused mcp-sa11x0/ucb1x00 driver
>   mfd: remove unused menelaus driver
>   mfd: remove unused iPaq micro driver
>
>  .../ABI/testing/sysfs-class-backlight         |   11 -
>  Documentation/admin-guide/devices.txt         |    1 -
>  .../admin-guide/media/radio-cardlist.rst      |    1 -
>  Documentation/admin-guide/media/si476x.rst    |  160 --
>  .../admin-guide/media/v4l-drivers.rst         |    1 -
>  .../devicetree/bindings/regulator/88pm800.txt |   38 -
>  Documentation/hwmon/index.rst                 |    1 -
>  Documentation/hwmon/wm8350.rst                |   30 -
>  .../watchdog/watchdog-parameters.rst          |    7 -
>  MAINTAINERS                                   |   14 -
>  drivers/gpio/Kconfig                          |   22 -
>  drivers/gpio/Makefile                         |    3 -
>  drivers/gpio/gpio-adp5520.c                   |  169 --
>  drivers/gpio/gpio-rdc321x.c                   |  199 --
>  drivers/gpio/gpio-wm8350.c                    |  144 --

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
