Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C7537E5EF;
	Thu, 16 Jul 2026 18:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225545; cv=none; b=VqJ1YW73NGzYEHFxkaaYUMwuZ9VGlRM7BrPD/eEAjb8mOr4ypXhVR8fliKYEJPea1ybJOdJmW88SEPGxXS2I3q30r1uAgnduv+CElbvuiJIIL+sLBciTHHnmpC0D21jnwPfBuy4C7kLlgItv5KROmc7rdpIiPtUBqVfxgpiVwKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225545; c=relaxed/simple;
	bh=HRe+YAb2Bm91TATrooa6bgKBXqONK+AJw5tvfQrtomo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLj9r01SPVZ3s5FlEPecig0g9ICDX0n77z8gWfA4ft4rXqevM5QWMzfofNmDVY/T1lnMQuzLQl5FtpfoItEXvsOlspIEVXhzlxf55bW2StSUq83pWr+etbaJwHrqbZW/WAaA/wgQx8S8xpo6mTqiaWREcqMUbSkg5kSFd7sCngU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0Djob2ue; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0Djob2ue"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=T1Kjd75GrDknuJfskGJbtCjuUzudFkj+B+wHx6EHO08=; b=0Djob2ueamTLt489wqKmvosaF1
	Hj6Jaqc32ygFK5l+ehoF1u77JMiTTSAggjjpJC8ZNhl1DoQGC7D/nIk6IOBkN2QbUC3sngUo6D42f
	BcIDgGfDLop1wndv7451eyRNpPXC75ZWYKhAJfZceYcjPuPNUP6eJ8bMEcENsNJfX8F+T/31e6Pz4
	SDAVeLXD+u3cqeKVbx/tZ7gEEfy+0umjhVh0/U/MlTkUnzY7+Di1a7Jk/CUQ/WzOW3p8KskBjKfuy
	YB7F6a/FAchPtlub2JPic1Q8E64vqty7+wxm58iy0NnF9IdVraYV3LJ98RbBDJPruxaAdu2+nDrpW
	gZfbiDyw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Thu, 16 Jul 2026 20:12:04 +0200
Message-ID: <14508147.RDIVbhacDa@phil>
In-Reply-To: <kzl6ykopmcj7nl6jnf4uav75cdn2znd3jb4vjlrde364homti6@2y2zfyvwni4x>
References:
 <20260608060940.52549-1-hrushirajg23@gmail.com> <14045151.uLZWGnKmhe@phil>
 <kzl6ykopmcj7nl6jnf4uav75cdn2znd3jb4vjlrde364homti6@2y2zfyvwni4x>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 8. Juli 2026, 12:21:30 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Hrushiraj Gandhi:
> On Tue, Jul 07, 2026 at 08:23:47PM +0200, Heiko Stuebner wrote:
> > Am Dienstag, 7. Juli 2026, 18:03:54 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Rob Herring:
> > > On Thu, Jul 02, 2026 at 09:04:55PM +0200, Heiko Stuebner wrote:
> > > >=20
> > > > On Mon, 08 Jun 2026 11:39:38 +0530, Hrushiraj Gandhi wrote:
> > > > > This series adds initial device tree support for the Vicharak Axon
> > > > > single-board computer, which is based on the Rockchip RK3588 SoC.
> > > > >=20
> > > > > The Vicharak Axon is a feature-rich SBC targeting developer and e=
mbedded
> > > > > use cases. It ships with:
> > > > >=20
> > > > >   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
> > > > >   - RK806 PMIC providing all SoC power domains
> > > > >   - eMMC 5.1 (on-board) and microSD slot
> > > > >   - Gigabit Ethernet via RGMII (RTL8211F)
> > > > >   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
> > > > >   - PCIe 3.0 x4 and two PCIe 2.0 slots
> > > > >   - SATA 3.0
> > > > >   - USB 2.0 host ports (EHCI/OHCI)
> > > > >   - NXP PCA9554 I/O expander for status LEDs
> > > > >   - Haoyu HYM8563 RTC
> > > > >=20
> > > > > [...]
> > > >=20
> > > > Applied, thanks!
> > > >=20
> > > > [1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
> > > >       commit: e0008b108aaf8c5aa22930b2ceadf8f894562acb
> > > > [2/2] arm64: dts: rockchip: add Vicharak Axon board
> > > >       commit: e08c3389c78dbefd31a57df8807cf57ef6f3c9b1
> > >=20
> > > Both have issues and should be dropped.
> >=20
> > I've dropped both the Axon as well as the Vaaman2 board from the
> > same vendor now.
> >=20
> > The whole thing is confusing.
> >=20
> > I should've caught the pinctrl issue, and do remember running a dtbsche=
ck
> > on at least one Vcharak board - but that must have been the Vaaman2 boa=
rd
> > because there the pmic fullfills the binding (and general setup of other
> > rk3588 boards).
> >=20
> > The vendor-prefix is missing indeed. I found earlier versions of the
> > version-avalanche had it, up until v6 [0] . Though I haven't figured out
> > yet why it was lost.
>=20
> Regarding the missing vendor prefix 'vicharak' that was noted: the prefix=
=20
> was already submitted separately upstream by my team in a different patch=
 [1].=20
> Because it was already submitted, Krzysztof asked us to drop it from our=
=20
> own series to avoid duplicates [2].=20

Looks like that series with the vendor-prefix was applied last
saturday [3], so I'll continue with your newly sent board versions :-)


Heiko


> [1] https://lkml.org/lkml/2026/6/24/929
> [2] https://lore.kernel.org/linux-rockchip/96c9b1eb-9f8e-430d-9c38-eb4d48=
9d7d24@kernel.org/
[3] https://lore.kernel.org/all/178378800443.138068.8763713563230008567.b4-=
ty@kernel.org/


