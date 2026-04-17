Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B5F29D268;
	Fri, 17 Apr 2026 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467918; cv=none; b=mYxlVfewtiiadpY7eaHv2Mud5Y/1oVxqMxIS0EEZ7LQpXX3NAS/ycgesYtRPxdP264fwZuI8fE5YWn+h+l8xRCoDcmcQYEOjR37CqNPfHv40UzTcOFwxrob5quE/YngyvyEoBWXqmempqMwO1LjOzzDl+A93WuGNEYdXmu+3V2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467918; c=relaxed/simple;
	bh=/Dpb+D5Zf6BVc7fmoQohrrGykvV51qJ7vAj0hnEvjGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LbJ86BUd8UH94IH0PRL7x+WnRXSyUxm3uB3UeLetkOp7lFdyeoZs0ni/Dk8YduTlzuBbdrFSyQRXwWKXr5QMlVx6zMYFykxtsibOkXTx8adFcgup1ww5T1z816YmZmSkLUOYCPCEJpje/S02n8u81r5au1yU4Bywq0Y+279Ay5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DeC9ygfO; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DeC9ygfO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LXShsoJFEcOkkjkNCh05aoYzhZtRefc51zZSNE5SZj4=; b=DeC9ygfOFFj4CMaWmxYUuQpZ55
	1pOMIP3QKI+esMBW6G3McrxUE6+pQOr1Lb0k+B8pgJTu/1cUGVSyVfdc0892/qd5uOvYb9PUAy6zx
	xomV2ahHqFS6eld/SXnCQtSH/2gdmc+Vi0cWu883diDKLI5cC1AZBFPE16jS4VkRuwd6n7tHndWe+
	O6JZIrDSu3WVVi/b60qC1Cmz3b3kZHNMrwNKaX+cdrC2dUb3FRVzGrg3AoRwN5kLwTYg/G6gYnhZ9
	rstNNw4rq5UZV7j5c+TzUuSdsLGmS38dRfAPkx7S5n0d8ADVJV7MBLTTfNlT9MIRZzqS+k94PQUhp
	VUpEkztA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 00/40] arm64: dts: rockchip: Wire up frl-enable-gpios for
 RK3576/RK3588 boards
Date: Sat, 18 Apr 2026 01:18:29 +0200
Message-ID: <2435759.n0HT0TaD9V@phil>
In-Reply-To: <70e9a8a0-414d-428f-8da8-9b65cc764849@collabora.com>
References:
 <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2297365.1BCLMh4Saa@phil>
 <70e9a8a0-414d-428f-8da8-9b65cc764849@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Cristan,

Am Freitag, 17. April 2026, 19:55:17 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:
> On 4/17/26 2:34 PM, Heiko Stuebner wrote:
> > Am Freitag, 17. April 2026, 11:24:34 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Cristian Ciocaltea:
> >=20
> > [...]
> >=20
> >> Cristian Ciocaltea (40):
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-100ask-dsha=
npi-a1
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-armsom-sige5
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb1-v10
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb2-v10
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-cor=
e3576
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-m5
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-roc-pc
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-rock-4d
> >=20
> > I do think one patch per SoC (rk3576, rk3588, rk3588s) would make more
> > sense, because these patches really are mostly identical :-)
>=20
> Yeah, apologies for the large number of patches, I went this way to allow
> per-board reviews.  As previously noted, I tried to identify the GPIO pin=
s from
> multiple sources, so I'm not entirely sure about the accuracy in every ca=
se.
>=20
> Would it be preferable to squash the patches per SoC and board vendor, in=
stead?

I really would just do it per soc .. so 3 patches. That is a size that is
still reviewable for people, who can then check for their board.

If the patch is labeled "Add frl-enable-gpios for all RK3588s boards", I
do expect people to notice it the same as "oh _my_ board gets changed".
("all" could also be "most" :-) ).


Heiko


