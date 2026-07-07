Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E613A3D668F;
	Tue,  7 Jul 2026 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448646; cv=none; b=DbajfAQvtYjgqXJbaJuxuRnZrfx//KsDCqzsEiex+GksLGNU5L9s2Bw3tTTdaxFKf8XFcEs4h/Nt/N7uUvOMMRl3KwwJn9WdPdI22sDPisxo8IbMG47QkK6g/S0UDSLqPt4N9lm6jOXSRNX7ykSxrg7/Wfvb+yGxV4Lr6hiVLgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448646; c=relaxed/simple;
	bh=xQz/1de1fhdSsAQcRz1bIbjMT8tJONoMz2GIjS8HZQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lLyF+dkShqGbS+KSIz0BWCfBCDAVOPUvOs19rBGoSK2iHspe1mKdKknL6EDHjesMjzY24MJqKedpkB5Fq0FwQc0838izauCCjH+nkKnTfelrumsRZt9m9sppKQDKiGnitrEYyt/O+6vXZbBvBtDuT+Mk30zn+FlJIDUr8irgIdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CGltUv6A; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CGltUv6A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9JLJ0FpKM3qj52tf+7FbBXdfMaILfM/b7TzkNMXuLMs=; b=CGltUv6A8vNWyR6tnpsfe2ZOCQ
	JsAUW8Wrl8Jf6IDsfJvhIElhExWMpJ/Z/8WxZq5M/BwokI+6YCXoLZnwQzy0tJIEMX5AVoFVcAWml
	suUNS8GcSbCu+pd/KrNtbYBThifK89bbiGtIoSiKifux/D54RU999mk60Dh9Ujgv+gH6ZJQ7+STlE
	4jXjFZT3GSEnJwLEtDjDrNGMdZBBjJpb/4NI6T3V4nz9WK16fMb0Ys3Dm/LnwElUMW09UZWl+teC6
	U8S7EjJOwr0pjZHRAxncYs6FBeirD8AV7F6ABn6pXAEP1XuvC8EQ0pkRnjqgHn42p8hOBxaWNcVxE
	SCcwBPiw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: Hrushiraj Gandhi <hrushirajg23@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Tue, 07 Jul 2026 20:23:47 +0200
Message-ID: <14045151.uLZWGnKmhe@phil>
In-Reply-To: <20260707160354.GB3176120-robh@kernel.org>
References:
 <20260608060940.52549-1-hrushirajg23@gmail.com>
 <178301901903.3838694.3276523670393868229.b4-ty@sntech.de>
 <20260707160354.GB3176120-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 7. Juli 2026, 18:03:54 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Rob Herring:
> On Thu, Jul 02, 2026 at 09:04:55PM +0200, Heiko Stuebner wrote:
> >=20
> > On Mon, 08 Jun 2026 11:39:38 +0530, Hrushiraj Gandhi wrote:
> > > This series adds initial device tree support for the Vicharak Axon
> > > single-board computer, which is based on the Rockchip RK3588 SoC.
> > >=20
> > > The Vicharak Axon is a feature-rich SBC targeting developer and embed=
ded
> > > use cases. It ships with:
> > >=20
> > >   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
> > >   - RK806 PMIC providing all SoC power domains
> > >   - eMMC 5.1 (on-board) and microSD slot
> > >   - Gigabit Ethernet via RGMII (RTL8211F)
> > >   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
> > >   - PCIe 3.0 x4 and two PCIe 2.0 slots
> > >   - SATA 3.0
> > >   - USB 2.0 host ports (EHCI/OHCI)
> > >   - NXP PCA9554 I/O expander for status LEDs
> > >   - Haoyu HYM8563 RTC
> > >=20
> > > [...]
> >=20
> > Applied, thanks!
> >=20
> > [1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
> >       commit: e0008b108aaf8c5aa22930b2ceadf8f894562acb
> > [2/2] arm64: dts: rockchip: add Vicharak Axon board
> >       commit: e08c3389c78dbefd31a57df8807cf57ef6f3c9b1
>=20
> Both have issues and should be dropped.

I've dropped both the Axon as well as the Vaaman2 board from the
same vendor now.

The whole thing is confusing.

I should've caught the pinctrl issue, and do remember running a dtbscheck
on at least one Vcharak board - but that must have been the Vaaman2 board
because there the pmic fullfills the binding (and general setup of other
rk3588 boards).

The vendor-prefix is missing indeed. I found earlier versions of the
version-avalanche had it, up until v6 [0] . Though I haven't figured out
yet why it was lost.

Hence I dropped both boards.


Hrushiraj: please start anew with both boards.

But include all the tags you received in previous versions.


Heiko


[0] https://lore.kernel.org/linux-rockchip/20260601162143.170030-2-hrushira=
jg23@gmail.com/


