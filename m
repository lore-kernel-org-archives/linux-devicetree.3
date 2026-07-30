Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66B135C680;
	Thu, 30 Jul 2026 18:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785437427; cv=none; b=F+CDsAS2fgCv1SQVhubTs7UES9+t9WgebHN1keJrl4wHat5n3aJwio/Om54zsAKXIZQkbNW50atnUHjwvH3P6vpbvMrbVh0vHa38AaNWVOJGy+Dh1UCq0/duALNN0WQLVkX1WSliZd+kQ3bnwXtUTGBjul5dFusw3hig32etwv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785437427; c=relaxed/simple;
	bh=74fmClIVlFs2T6olLcj+jqpv71HNuopvRZXLpi1fgEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qq9YzWbLF51YeZ7bMFG9WnIoSpKfuhuYDwr4SxdVxq4I5oNeBJh5ylpOBgc0BcjZQu7eDRP438wK17rH5bDXbGggjjYj9VSuDrUE7mho7KngdTW8+1LCzAM9+I42+T98Zpi1rD59ja9/+Cnuexezcthyxxfu2ScUjfdKOaq7sRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EdR/nENw; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EdR/nENw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=lw261SftemxN1SqHSmMtQfPekZaiyKsME3L516pe5q4=; b=EdR/nENw/RKQjMwL7fuYGbAaDb
	DmWHpj6oHz/AD/uqXIBHEuNvGTFKc12WXNLx7cpqJeM5UaPHUgO4g1GCNK/gmeHOVsB47Zv05qGHM
	5Wl99fd6H0oQZWbeEUt9Q7A+a72saSngMEMGF/43Ckj9nEo4pDrbFcuOMpF1I6QrVzMok6PutRWST
	LYsv7WzB1WX5QbDf1Vu3wAyY7U9vTO6EqLcsm796rV1y/AN3xTUAoe2xGKT+3GppRx1t4cGg6qCVT
	bWHPhZVjdIyhK/eZUgRJeJLq9puDihjHg/XuQVdgs/ZMTixgso0dQIZNC71LQUB6+UJAuf2+S6YBE
	03Bkb8ZQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Yan <andy.yan@rock-chips.com>, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v1 0/7] Add HPD support for Rockchip Analogix DP
Date: Thu, 30 Jul 2026 20:49:43 +0200
Message-ID: <2014349.VZ3vTMCxA0@diego>
In-Reply-To: <20260730032744.381566-1-damon.ding@rock-chips.com>
References: <20260730032744.381566-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Damon,

Am Donnerstag, 30. Juli 2026, 05:27:37 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Damon Ding:
> This series improves the HPD (Hotplug Detect) interrupt handling in
> the Analogix DP driver to enable reliable native HPD pin detection on
> Rockchip platforms, and introduces platform-specific HPD detection
> schemes with fine-grained interrupt control.

[...]

> Tested on RK3576 with both native HPD pin and GPIO HPD configurations.
>=20
> Native HPD pin mode:
>=20
>   &edp {
>       status =3D "okay";
>       pinctrl-names =3D "default";
>       pinctrl-0 =3D <&edp_txm0_pins>;
>   };
>=20
> GPIO HPD mode:
>=20
>   &edp {
>       status =3D "okay";
>       pinctrl-names =3D "default";
>       pinctrl-0 =3D <&edp0_hpd>;
>       hpd-gpios =3D <&gpio4 RK_PC1 GPIO_ACTIVE_HIGH>;
>   };
>=20
>   &pinctrl {
>       edp {
>           edp0_hpd: edp0-hpd {
>               rockchip,pins =3D <4 RK_PC1 0 &pcfg_pull_none>;
>           };
>       };
>   };

Yay and thanks a lot for working on that.

If I roll my display-port carrier board back to the analogix-dp being
the endpoint, this works exactly as expected :-) .

I can plug in the display at some point after the boot and have it
detected and setup correctly. Same with unplugging it while
the system is running. The connection status is correctly reported
in sysfs.


Though there is a caveat. When the eDP is not the last part, this does not
work anymore. The detect function always returns "connected" if there is
a next bridge available.

My board [0] has a physical DP connector on it, so models it as
dp-connector, but in that case the Analogix driver always reports being
connected.


Heiko

[0] https://lore.kernel.org/linux-rockchip/20251009225050.88192-3-heiko@snt=
ech.de/
=2E.. same effect with hpd-gpios in either the edp node or dp-connector nod=
e


