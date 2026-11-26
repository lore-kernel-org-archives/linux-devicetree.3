Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721880;
	b=mpe+zPmCXLdnKHh/DbmOB2uG5sl8XOdbiVQWlfg4q/fzDmEwd8UKyBuHU+EWE882nXfy
	 14guYWo6bt7AuFuSUHITf8SBsYVdzWUbhd/GzTfQZvGpSTi+qErggBAmVC2tgxWOkCPZm
	 ni/0HSereetxSFX4RC4dWuliXSCF36+r5bAIyOGDcQH8k7q39+VYJsq0vuvwBMjtaiPzY
	 G2/vBOLX8ZCF1f7gTv9PK2YhXZHJ3u2Qy5uERU27qL1L0u50l9C2aeGTQRweVJ9ql2rse
	 69Eh4Nrw1IbAVpZz0Abcv4u4Nc3IjY8kxhuSlHlupENLuepn5b3PUphF9iFroV3+ZVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721880;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=ybgKfYhvLLU6UqBy8vCA/+mhJgc1ZHe5FG2bKhBu33A=;
	b=PTsH3/l0+fKYvP61DTgmWld3wLiUglJpULGo0NY3EkCwYruJHCKNtJkvZDAOD6v8oJiP
	 IRU7rUVFKAE2kj1jz6p12qHs3LrZmON7voxNBI8l12oZodG6LFvM/bQNGkUJ3bUkDXH1e
	 QVabZoh1o0S1HAxB7DndcyGvrZp5jsvIaA0NsUF0Abv2Au50RCKyDXKJ2D+3pc9ibV5zr
	 QKobPwiz4jE8kCMXiiHIlH1mp/TVsAL9BjEyE22E2/Bw/J3jAYr5R1RuVy+OhLZ17E4MQ
	 KPpPy/sOTh9nm9411OWftzvn6jPdh7ndoY0v+rECjxOZjnN0HkkMkkG9Rb6YP7cgBVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ikpepjGN;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC76E606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC76E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ikpepjGN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E8551A1821;
	Thu, 26 Nov 2026 19:37:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EE0C60558;
	Thu, 26 Nov 2026 19:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 156A911E68361;
	Thu, 26 Nov 2026 20:37:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795721871; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ybgKfYhvLLU6UqBy8vCA/+mhJgc1ZHe5FG2bKhBu33A=;
	b=ikpepjGN6sLKeY5KwFcYxKIG1E9nr29DC1TZLHGxbMfWVZF+/P/Yyr0QsaYzSjFSMvYlda
	/AVOUAjUJ5yv2pMovn9eC2e6V8iKJU+8ekSOrJbyDk1bbAzHKSC1nnBvwJwvu060nADTN4
	OIkLuACu5VZ0Fi6w1MIwulFj1cm6ouGlut+nvLbfHtoTSUYAoWg5bFkntpdzVvcKp9smgz
	/bzChrnaA7J0UiqwudDozyaSFRxadMMqec7pWt2+VFrD2RcDEHICmc3z8Uz+E9qChY0m4R
	eoBnaqA6+wKKu7H2AkAhN/sBVj5CMtyNCUSen+7ZG3+xkzmLBSP4gCgTGNm4vQ==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:37:40 +0100
Message-Id: <DN5E9UEG4WF7.3HAHIZ08FF1OA@bootlin.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358762: fix reset handling
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Christoph Niedermaier"
 <cniedermaier@dh-electronics.com>, "Marek Vasut" <marex@nabladev.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <kernel@dh-electronics.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
 <DN5AB16C26GE.3M5Y1X38QATK8@bootlin.com>
 <20261126193423.2344f609@kemnade.info>
In-Reply-To: <20261126193423.2344f609@kemnade.info>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 26, 2026 at 7:34 PM CET, Andreas Kemnade wrote:
> On Thu, 26 Nov 2026 17:31:09 +0100
> "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>
>> Hello Andreas,
>>
>> On Wed Nov 25, 2026 at 12:37 PM CET, Andreas Kemnade wrote:
>> > The bridge driver desserts reset after disable and asserts that
>> > upon enbale. That requires users to workaround that by declaring
>> > the reset gpio wrongfully active high.
>> >
>> > Fix polarity in the one device tree actually declaring
>> > a reset line. That patch has to go in after the bridge fix.
>> >
>> > The issue came to sight during experiments with reset lines on the
>> > Epson Moverio BT-200. There are two of these chips with a shared reset
>> > line, so also prepare for future conversion to use a reset controller.
>> >
>> > To avoid having GPIO maintainers spammed with a bunch of patches for
>> > BT200 support, do that fix separately and now, so it can go in more
>> > fast-track way.
>> >
>> > The devicetree change is only compile tested and is more
>> > a cleanup, not an urgent fix.
>>
>> Can you test it and report back? I guess it just means applyint patch 2
>> without patch 1 and checking whether it works.
>>
> No, I cannot test that. What I can confirm is that BT200 reset with a sin=
gle
> chip works with GPIO_ACTIVE_HIGH without Patch 1, with Patch 1 it works w=
ith
> both GPIO_ACTIVE_LOW (which is the correct descrption of the hardware) an=
d HIGH.

Ah, after re-reading the details I think I got what you mean: your hardware
should work with patch 2 + the part of patch 1 changing tc358762.c (even
without the gpiolib-of.c changes), right?

So, well, nevermind.

> Patch 2 is based on the assumption that things are working in the state i=
t
> is in right now, and only corrects the description of the hardware.
> I expect to break things if it goes in without patch 1, so probably the
> best strategy. would be if patch 1 goes to v7.n, then patch 2 should
> go into v7.n+1.

OK. I can apply patch 1 next week.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
