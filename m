Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721930;
	b=dr3XOWMTaCfinkRnD5aOng97hNBWQnyIwYBWRr002gTrqAtIVQBBgw1guP8KdQ2Howf1
	 vxPltM2cNWgIsUfDIkjzE97IPF+2XdSzOYVJs1gOHsqF1b7LSadU9MdxlwK2H7L0gw4jb
	 ZfG3aWGvLJJniZf7qX8NDc3ufctmv/SqdLE+tE9GSiCJCLpgTbCt5q42rKBWRKY3j4xXd
	 ZqvvuaUKBfUmkYDiXsCK2N3HjHq8bNOdfX7DP3YKOxxD59HtKI4APf3J241QjcbMCTKq9
	 y8FUYr8b9+E/i7pyQYaBZPsx40IK6kXUTfiKm43C5LWx6Nlbg5J9Il6cefP2jP2zQvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721930;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:Subject:
	 Cc:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=MrwdyrGCigoLs5sakLPRHPJFywstvadxadEtt5B8ORo=;
	b=qjs0xAJwZbgIb0ozJ9hRt7IJ/Wts//IQ+TCjro7nzijlVKOHiyMwClRZ29Q9F/+xeCxu
	 oApTq60O4heAHvQhT7U2dZkAOAYm6SG8LqLl33FTcO5cn21vfSWxTqRaIbtg+nQFYwzw2
	 Z4Cf9Q7Q034OjplKH0cT6l4kUvPPghOq6X4rVPPG/BW0DI9Vvg0LSxgGcxPa3F5hbTEgO
	 MdNp8ixYJ8c7oV412io5bARg8WyF8PjuVPsZN1fekOBDpNif88TnmzOqUcI2FLOFXBPF7
	 xwElup+jyiJN4rPpwwX1JYGkVMxP33C2Be8NMRbhrNgEvulQOJW8QNDi1UXIpLL2u4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EQDaEarX;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B944C606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B944C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EQDaEarX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 626A84E417B4;
	Thu, 26 Nov 2026 19:38:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 351CC60558;
	Thu, 26 Nov 2026 19:38:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDF5511E68361;
	Thu, 26 Nov 2026 20:38:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795721922; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MrwdyrGCigoLs5sakLPRHPJFywstvadxadEtt5B8ORo=;
	b=EQDaEarX5ZZKUUatlj8XX6GwcMfEJAdXz0zX+hexJjwp4uUbs1XfV6d/bUYPRmRwv2Dg+j
	20BIq9QfQG4q7a5JWbrLkoPoAC0dddqbX+2IJM+duoput4oR1N09a5uo0MM0okhhW759uJ
	T4sQ1Vz+e0BfRWFpJhIXfLjVGLXwzuDr9Gu9ozrCw6l2Mda2rvzNl1V9YMNLr40KEn6AHC
	T+KO9TJ4bOO5eE93b1IgxmQWtTTHsrXHg3G2yg6ThJS6ptYtSt6yeuZwuE24z3oWBufppp
	uWXxhc5GzwNpWGgJUkMY4lE998ePX5S2z4YS2adtUFu/3ipxvt3LhSI8IX3Cow==
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
Date: Thu, 26 Nov 2026 20:38:36 +0100
Message-Id: <DN5EAJWRZSFX.3GP1W2FARX6K7@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/2] gpio: tc358762: fix reset gpio handling
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <kernel@dh-electronics.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Dmitry Baryshkov" <lumag@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Christoph Niedermaier"
 <cniedermaier@dh-electronics.com>, "Marek Vasut" <marex@nabladev.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
 <20261125-tc3-reset-v2-1-32eefcaf1460@kemnade.info>
In-Reply-To: <20261125-tc3-reset-v2-1-32eefcaf1460@kemnade.info>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 25, 2026 at 12:37 PM CET, Andreas Kemnade wrote:
> Reset gpio is asserted when the chip should be active, deasserted when
> the chip is enabled. That is the wrong way. Apparently users are working
> around this by using GPIO_ACTIVE_HIGH to compensate for that bug but that
> is not correcly describing the hardware.
> Since this chip is used in a RPi Touchscreen hat, apparently with
> devicetree overlays floating around, add a gpio quirk.
> Also prepare for using the reset-gpio driver.
>
> Fixes: 3355f4ee561d ("drm/bridge: tc358762: Add reset GPIO support")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
