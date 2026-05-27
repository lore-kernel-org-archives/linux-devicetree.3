Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981AE3E9C20;
	Wed, 27 May 2026 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878805; cv=none; b=AwmkgnCnoP7SEgRdz2P42IFM0wsIvswgYnzcN8DBcO1WyN6HLH4KYyeV2HTm1A6FKsF32KqzMgN1lZxDAIjHqEtbtwwIVIPeaOBrbLseZ02wlBJSJ7ZkgAmxS471ddosduHyKacaY3ZHPZv2PgPDiLJbTabHGqqcqeCcgrEEcUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878805; c=relaxed/simple;
	bh=d6F/PFmCcpF5rkOI3FY7y9BcT9wcYqUk7qh2bk32KEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6kks2oKxukKEBfo8TGSs+KuBWOBlZ1bYrRTfjNme66kLbYZIsKpsf8C6Nf5yJPFIwpHXxw4zH9Nfv4UImoho6jVvMgLiu43xxKDsLeusK24W0qZoUlSugTj3UaB6TYNQAtpUIi2zZT57VvBaBaDhW2Mi8IujTnAGiAVXtF/pLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ufIdeOKB; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ufIdeOKB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=N+eyeYWDj7Jk/z76utxzNR9wXCHzRmse/hMsH5lp/hw=; b=ufIdeOKBXO2UAgKnFHGKZVZOce
	BJHUtPuyGZfXt6aUnuQy1ssUjgXdJa2ckiwKiN58DiKNvp8gDD0JOcmqq5+Gs4Aie0QdeOf137K3+
	KnY62JZM4bgs/dyxOeCiGnsoAtnFr8n/FWF8Y+tqH+JmFzzgocUi7+LhjBduBpGp9fxcLo9YgJvpU
	Uxzlz+NnYEBpRANaRal/kDq2mBRPaAafFK0VP1hSejkItP/2fvOe10jE5gE6RindxPRDuTiFIRDL0
	SnbGVwynBOV197K9D2tXyHCNkN5birrETu23YUhMOi1qsAk0QTqFt6a5eiSyrESdtPqlN0bxh5p5W
	l9QIjzBA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 jonas@kwiboo.se
Subject:
 Re: [PATCH v2 4/5] phy: rockchip: inno-usb2: Add clkout_ctl_phy support
Date: Wed, 27 May 2026 12:46:29 +0200
Message-ID: <4449069.vzjCzTo3RI@phil>
In-Reply-To: <agX1obJdYdNhnvnN@vaman>
References:
 <20260505170410.3265305-1-heiko@sntech.de>
 <20260505170410.3265305-5-heiko@sntech.de> <agX1obJdYdNhnvnN@vaman>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Vinod,

Am Donnerstag, 14. Mai 2026, 18:17:37 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Vinod Koul:
> On 05-05-26, 19:04, Heiko Stuebner wrote:
> > From: Jonas Karlman <jonas@kwiboo.se>
> >=20
> > The 480m clk is controlled using regs in the PHY address space and not
> > in the USB GRF address space on e.g. RK3528 and RK3506.
> >=20
> > Add a clkout_ctl_phy usb2phy_reg to handle enable/disable of the 480m
> > clk on these SoCs.
> >=20
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 47 +++++++++++++++----
> >  1 file changed, 38 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/ph=
y/rockchip/phy-rockchip-inno-usb2.c
> > index 7cec45192393..d8879fcd4291 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > @@ -179,6 +179,7 @@ struct rockchip_usb2phy_cfg {
> >  	unsigned int	num_ports;
> >  	int (*phy_tuning)(struct rockchip_usb2phy *rphy);
> >  	struct usb2phy_reg	clkout_ctl;
> > +	struct usb2phy_reg	clkout_ctl_phy;
>=20
> This gives a kernel-doc warning. I have applied please send fix for this

Just if someone reads that in the future, I sent a fix for that last week i=
n:
https://lore.kernel.org/lkml/20260520102859.1357411-1-heiko@sntech.de/

Heiko



