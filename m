Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538498;
	b=TPaAWITrQztx/Vk/etR6N7SE6pgtBh3o1NA7+yamO5qKVOODQuLjzf1MtbqQdTgwZSZW
	 f+6Om5HB6kS4KHOmr96tIDbVzIVR76oVaUC0U6bJOpF4NpZi3YMbfHMakxoYgsciCbxtB
	 2Zugk2nrWVEwtZzX5ZDQo//vKV1u3cVVLeEq/lqtbZim1NSFMztyCHEZukG1UxWIIoiak
	 ARZQHyVJLuunzeg141faxHz5eLGdBq2vjqrgQcaJGeLacgzVlzSxyOk0i5nWNkwa5GC31
	 PpgJtIz+iCctN09iGn6mS5RaIEvkORbdfYPJ/Akd3HwjyGp9Wk20a4+AoGPL6sU31Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538498;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Last-TLS-Session-Version;
	bh=cheJlkoanCZTRG4AhCJxbSrRT9zoO/I9wDY38Qxp5Hk=;
	b=Nn01SDa6VRb6jzhp0f7VYmFFPUnWXBakj17wlBYb2S4hO2Upibe0gKda8V8CLiW0ZXvG
	 Z5pXKD5KpgQYEgSHOsCR2UclCYHapHAee5y/tCyUTjGYng0mFZY/Y69jh+qGiwjJd/w3n
	 atKqkEx6KDDZOnY1GjYHFn/+paC7m4XDC0weRonlJjR7YMs7XegkTY4r1Eu3TX0W+DPhx
	 /Q2DhmXA8k0/DaK5ccRrm8UsQKEISx/en6098dE0XTmsFIFb13jSv1b7p7oblf4UIsgPj
	 7bJBvBiAMdl3yK1CO91FcXon5YhKcDDfK8Cw8IzxBMaLqAR+3BnDpw+NRU7jnbty/0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cC5cNUw7;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3172B606A321;
	Tue, 24 Nov 2026 16:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3172B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cC5cNUw7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E4464E41746;
	Tue, 24 Nov 2026 16:41:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED19B601E1;
	Tue, 24 Nov 2026 16:41:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4A9211E69A7F;
	Tue, 24 Nov 2026 17:41:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795538489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cheJlkoanCZTRG4AhCJxbSrRT9zoO/I9wDY38Qxp5Hk=;
	b=cC5cNUw7oFJed13YEaX4fWUIaxKQkdzydKfQ9yy80c4r8hL2EGyps+9mJ9gPa29bZau93Z
	Mm1WW2W0cSx8HaIZMfhL8Sptorsuabrl1dcNoZflp6Fq1/r8sVQHlybGU079m+Fz4TNUT6
	cYwawPDm55MjDOIwMVGf0aPeWweEWwNEl5LljDozd9ecGuUzMutf6GwrFFPV8yw5+zfTOR
	1VLNmelAq4LWQODxHw7mpEce9TdtfE7LVBSIZBXXLTs32hcgPBpUOMAV8PJ6Fv5aOBPJYN
	w5d5TTZUCQxTY2eLtRCdP7Nrk5UXXYUZ+ff4wW+D+Cnu3nlAnXVzWj00DBMliA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>,
 Abhash Kumar Jha <a-kumar2@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject:
 Re: [PATCH 3/4] dt-bindings: phy: cadence-torrent: add phy-mode constants
Date: Tue, 24 Nov 2026 17:41:19 +0100
Message-ID: <8vihTUc0Sjqm4gFwtZkB5w@bootlin.com>
In-Reply-To: <20261121-wine-nautilus-of-courage-94af4f@quoll>
References:
 <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-3-da2db7125cd7@bootlin.com>
 <20261121-wine-nautilus-of-courage-94af4f@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Saturday, November 21, 2026 at 5:20=E2=80=AFPM, Krzysztof Kozlowski wrot=
e:
> On Fri, Nov 20, 2026 at 01:55:51PM +0100, Benjamin Robin wrote:
> > Add the `CDNS_TORRENT_MODE_*` constants to
> > include/dt-bindings/phy/phy-cadence.h such as SATA-LP and 2500BASE-X.
>=20
> But why? Why do we need more of these properties?

The Torrent PHY supports multiple standards: PCIe, USB, SATA, XAUI and
SGMII, ... For some of them, additional configuration options exist:

=2D USB:
  We need to know the I/O supply voltage (1.1 V or 1.2 V), since it
  affects the TX full-swing magnitude multiplier configuration for the
  USB TX/RX pad supply.

  The link can also be limited to Gen 1 speed (5 Gb/s SuperSpeed)
  instead of Gen 2 (10 Gb/s SuperSpeed+) to reduce power, which is why
  the option is named "LP" (low power).

=2D SATA:
  The PHY supports SATA Gen 1 (1.5 Gb/s), Gen 2 (3.0 Gb/s) and Gen 3
  (6.0 Gb/s). The link can also be limited to Gen 2 to reduces power.

=2D XAUI:
  The link can be configured to 1X only (3.125 Gb/s lane rate),
  dropping the 2X rate (6.25 Gb/s), again to reduce power.

=2D SGMII:
  The link can be "overclocked" to 2500BASE-X (called SGMII+ in the
  user guide) instead of 1Gbps. There is no PHY type in
  `include/dt-bindings/phy/phy.h` for 2500BASE-X, and since it is
  technically SGMII at a higher speed, I am not sure adding a new PHY
  type there is appropriate. That is why I added these constants to
  phy-cadence.h instead of reusing PHY_* types. If there is a preferred
  way, I am happy to rework this.

> >=20
> > These constants are used by the new Cadence Torrent PHY driver and
> > are referenced by the `cdns,phy-mode` property of the Cadence Torrent
> > PHY binding to select the PHY mode.
>=20
> That's obvious, explain why you are duplicating phy type instead.

You are right, the commit message needs improvement.

Any guidance on how you would like these options represented in the
binding would be much appreciated as I am not entirely sure about the
best approach myself.

The plan is to eventually allow reconfiguring the SGMII link speed
dynamically through phy_set_mode(), but for now the configuration needs
to be expressed statically from the DTS.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



