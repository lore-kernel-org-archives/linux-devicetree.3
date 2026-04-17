Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A523939B5;
	Fri, 17 Apr 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776425669; cv=none; b=CpqaatcYECt0hDq8OIiNqu34q99DYZOa0iJKL8h/xhgvg5kDPUODNP8q/SQRyCXCmxUcdRl7Vs3uw3KizTdmUHTszRydf1BmUVDlHE1rRqivfFTCgl5GpmK0pFfZ59FFm9EM2AMHHftqKooyjwO1aqGUm+3/Suhj+Elzo+oh78I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776425669; c=relaxed/simple;
	bh=8+vJPcKIjtvHqzKWiAWLIDqU2/qMLQeid6mb6zyxsa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o5I+NJaGaztHbY01ITAd2RfYcd2wFxfpSvQhFpfeuhQndQErmj7xOgRLYbS3q2H7oICRTf++7IOayQJH6SNBqM8CzOQWfs4KBNptV4+b4QHsvH5wF2RGgtIQ6IjJw3b8M1K9F2zD4tWWFdKL5AMU387xWUBuW6qv8SXH1mjUuYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=w5VNETAy; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="w5VNETAy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QXvq8NzDZEj8/tjI1g8fgGcQb8v00hPinRstwIxPQYQ=; b=w5VNETAyPX2dbqVYamJZo5ns+r
	y/IlzoPTW8Vzs69XHiAOmhhZ2tF3MuxfWeAbDVOE7sjw6YeX9ZowrVeCnlwDZlcjFUuw6BCvkCWWa
	G3hEOJnLKhbLoyzjDDq8J6mFIsLdaqcYDQqXKHg1xmobjAeBk0kuXbgXZfizJdMi9InKbLdKY4Kyk
	jinajrccSJEf9XBjFV8qL3/UBeTzxJacsl2VoOA01j9Z0aIAhGFjm140KbkvqHO8Kzx3XBohr3mAz
	dYE0PcCYpMkq65XjH1dLhT9lejH5my67Uyiy2xg11AQeYFJP8hAmlAMYvUPIEUcvVz81+dX12ymLr
	vydfxFZA==;
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
Date: Fri, 17 Apr 2026 13:34:18 +0200
Message-ID: <2297365.1BCLMh4Saa@phil>
In-Reply-To:
 <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Cristan,

Am Freitag, 17. April 2026, 11:24:34 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:

[...]

> Cristian Ciocaltea (40):
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-100ask-dshanpi=
=2Da1
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-armsom-sige5
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb1-v10
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb2-v10
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-core35=
76
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-m5
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-roc-pc
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-rock-4d

I do think one patch per SoC (rk3576, rk3588, rk3588s) would make more
sense, because these patches really are mostly identical :-)


Heiko

>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-armsom-sige7
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-armsom-w3
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-coolpi-cm5-evb
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-coolpi-cm5-gen=
book
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-evb1-v10
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-evb2-v10
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-firefly-itx-35=
88j
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-friendlyelec-c=
m3588-nas
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-h96-max-v58
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-jaguar
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-mnt-reform2
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-nanopc-t6
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-orangepi-5-max
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-orangepi-5-plus
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-orangepi-5-ult=
ra
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-roc-rt
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-rock-5-itx
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-rock-5b-5bp-5t
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588-tiger
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-coolpi-4b
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-gameforce-ace
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-indiedroid-no=
va
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-khadas-edge2
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-nanopi-r6
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-odroid-m2
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-orangepi-5
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-orangepi-cm5-=
base
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-radxa-cm5-io
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-roc-pc
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-rock-5a
>       arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-rock-5c
>=20
>  .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts      |  8 ++++++++
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts    |  8 ++++++++
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts        |  8 ++++++++
>  arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts        |  8 ++++++++
>  .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi      |  9 ++++-----
>  arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts       |  8 ++++++++
>  arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts     |  9 ++++-----
>  arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts          |  8 ++++++++
>  arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts         |  8 ++++++++
>  arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts    |  9 +++++++++
>  arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts       | 16 +++++++++++=
+++++
>  arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts  | 17 +++++++++++=
+++++-
>  .../boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts     | 10 +++++++++-
>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts        | 16 +++++++++++=
+++++
>  arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts        |  9 +++++++++
>  .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts      |  9 +++++++++
>  .../dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts     | 16 +++++++++++=
+++++
>  arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts     |  9 +++++++++
>  arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts          | 10 +++++++++-
>  arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts     |  9 +++++++++
>  arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi      | 16 +++++++++++=
+++++
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts  | 15 +++++++++++=
+++-
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 16 +++++++++++=
+++++
>  .../arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts |  9 ++++++++-
>  arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts          | 16 +++++++++++=
+++++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts      |  9 ++++++++-
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 16 +++++++++++=
++++-
>  arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts    |  3 ++-
>  arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi          |  9 ++++++++-
>  arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts      |  9 +++++++++
>  arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts  |  8 +++-----
>  .../arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts | 10 +++++++++-
>  arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts   | 13 +++++++++--=
=2D-
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi     |  9 +++++++++
>  arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts      |  9 +++++++++
>  arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi    |  9 +++++++++
>  .../boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts     |  3 ++-
>  arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts   |  9 +++++++++
>  arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts         | 15 +++++++++++=
+---
>  arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts        | 10 +++++++++-
>  arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts        | 10 +++++++++-
>  41 files changed, 392 insertions(+), 35 deletions(-)
> ---
> base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
> change-id: 20260417-dts-rk-frl-enable-gpios-ce9930dbf5ca
>=20
>=20




