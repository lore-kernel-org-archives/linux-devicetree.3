Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAE220A5C4
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 03:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785640837; cv=pass; b=ov98MXLXhTbldYHhvTqTJ6j8k0WbmsSOMJKPRu13QtVypj6Q2N4CYOLLhYZGTw8BZ4wvxrhZFsbWMPO2tq3PSAMOmAjpFaJ5TZNM8sFBWNF4I4jOK4ZeySdDtS9VDGyBKPGHmwJJb6uIvBshhOLMsnS6QR4q540ljHyvkA8h8vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785640837; c=relaxed/simple;
	bh=37d6zNcTsy1RXjb9J/nKzOHniDYn2k4MTPlFufKuap8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUBDTcP93JnR7j4HN4pX9dXdDbvcMjnOl9WFD20dOgzp4umd7nPByEEKhWt9EPj2rWDmLlEgGVIbNhPM9TNFgPnYzi7IjXFY4LG7+spZ2HuDJECMjjTrQuY+MS/fXa8uNQpwzmEJgcF8dPE2qbTnWmak97cXS2Ay4utkgQzql+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnNAYU/q; arc=pass smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnNAYU/q"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c15e0279316so85374266b.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 20:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785640834; cv=none;
        d=google.com; s=arc-20260327;
        b=jrIbagoIW7Rb2T3qYsUb7x66UfHEDOC/CcrY76BjFhiqoJK/92Dq7xYkeH8By29Ldj
         8a9dGey1tSXhT0BrA7Z8ywjzRL2Sfo5H/1/DHk8kqTPGdWp5t/b3hjsHPXfykR5BcDQp
         GmmrkpszQIiCcsCreYDwFMH7MsZxm7ChX2//0XTGcUQaIHIh0ycLcGwYOUuYuOtkvvRZ
         2VL0WombrnaShsz6l0djsFDPb/Oyw2EA00afP0HNq6FvMlWfUYriTH5vqsLZojgd9o2S
         kin1vXf4RypOsAgn+2iNd6BTB40DGJ5wi+t4alwV78j7GjSRq4LQ3g6hj6VAbowNb08q
         /8AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dokjfNwvvyjCQVfo5U9weDVNiEMz1GgnQwdVbTp72Qk=;
        fh=H+dgnQ3c+jDVYGyIYyetYPmLB2u0ljhXZm0dnG4h2bw=;
        b=ew2OUKDCsCVE5jXd2YyL467ZZQJvhasie9LpT3sLCfU5nONsCc4GQBxo0C6HPlVk6u
         hnjlaptYHfdGsMY9Q1mfM6NTLqHTS9MQOKeH1fAA/H/HNK4KPdxe4b+qdHlrdkZGBd1w
         62kni+18pfbT+nKdiR+qfWU8iv0efEqHyOGxs4mvKJzX7k7HqbtN8R/vUyyQ6ZlO+1BU
         noixcnSLGJAAdK7DAFWMRLUmDDedMsV9eMvfezz8yzGaCb1/pYkmRcUgM3Taa0dVepXh
         D8BDjgEDRrpGSYbAAlnszTp6OO7BY0EBjoL09CGma/DSDlUrRmzlMgCZWV/BKyHdhIsv
         tvpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785640834; x=1786245634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dokjfNwvvyjCQVfo5U9weDVNiEMz1GgnQwdVbTp72Qk=;
        b=hnNAYU/qFKRWgbc9r02o1IF6tYDO/BO1e8m64CwVS5kBQHjdRuKCYgVYhf74i0R5BH
         cGBdQ6JZ4UrXdC3oF18WgNUtl7nHGplbFFhcronjm4KpbYbkD1gYJyqZwJXF15Euno57
         KHz4kcSZBKRcULimuOdOXV6sNcshQ0MDZPDy9rYa4IAkMkmfq5ShyO7ctrq1lTy4StuZ
         Q/KONhpR44pETAqPulATKeBDmn7LQ7XpNoayV4MeWo+c/0j1xTHkQCMaeNnO06o1jHjV
         wXwst5kPVLgCbzWT0YyLE0V7SrPk4dewcY285s76FaTIMjsI4wm7C9qImApL7c0XubIx
         ESCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785640834; x=1786245634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dokjfNwvvyjCQVfo5U9weDVNiEMz1GgnQwdVbTp72Qk=;
        b=pKHPrHbOzPa9oyzaYHKjyJY3fwmGys8M9sTbMad0SNxUBN4pWqrMcRCLPCg/eoeX7l
         D2f7BF/N5MnCeg+nlKcISxyKBvS8QKaZuBKflks7tTTJLS2eTTNaqiesZgOnJ/j2AA+0
         gC4tFjytiy416TxY4I8WWrGb9NTVMn9dHvzauy7Vw8eGe0qTaWtgRFzxXCkdrrf51yWf
         pzzU2okLpZb37BEGSo/JT6SKEb5LMCFDXwD8u8/0G/RCiTzMjMszlAE0y1sK4IOKNRvF
         vy5IyWPDGYNd2q+mnuo42MC2qLG+G553dy3aeRNHICQYgtwh2VUOMjs4ItNkNDzh6DQg
         ASDg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0EwIjwWWmBPzyNe2UxUWBKTR+MC1DKHM/TyhThdDD/ZOqNmJfc21B26QRwVK412fGDUeq6mHaroNU@vger.kernel.org
X-Gm-Message-State: AOJu0YxihIwUqSqcNfeCSMg+b1pKtpP0DAhu3VgxU3DfnyW6eEEW3MT3
	SthDwMr0DuJtvFPd5ZbpiceCcRzHXgvAEaJMDTRb0XDQTaNCZx2PjgPdPOK1VvX8dg5U31nGPDm
	R0kqW+bGwZsu0usb8P5xIM0jrV3WmMqs=
X-Gm-Gg: AR+sD1010+l8zvWv88LD473vyvN6p2TqBXFdzuH0r7yldq7QQXAAsGtksnsWBG4bdJI
	QaBtv0Ho+hCKPNO/9mEkWntZ7QCBtF6lMNfN5FjRJtXmaUjbEH3yK+8HjEbnKU/8CCSpSG3ZCu7
	H82bSCa+W+5atQrXvlYHWWjqxzTkvDLX7aBawYsGmLDdMpV6K1qTSK/MKErxg6MtXxdYJncLiRS
	qaP9sf4auAFfh6U4fxrDMJXamc7axwSnk1KC1RXO74dnzBiawdfvpfmv9hyuqTqbnQPU5smiWvt
	oRuvY4Ld+sLF9N75DVLG9ZIitMd4YiD/XAuz/5dZycp2ll2Pp7BVAB0CrfWLUlv8AcOz0A==
X-Received: by 2002:a17:906:d8c3:b0:c12:b227:614b with SMTP id
 a640c23a62f3a-c1fe80d4099mr321593066b.27.1785640833516; Sat, 01 Aug 2026
 20:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-9-coiaprant@gmail.com>
 <23d8e994-8552-466f-98e6-c47d5783525b@lunn.ch>
In-Reply-To: <23d8e994-8552-466f-98e6-c47d5783525b@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 2 Aug 2026 11:20:27 +0800
X-Gm-Features: AUfX_mxFPztNas3fSYA9l7Pdws6J-Z60lqG9o0kXKtJ3uRladP8seNb6Ax7e_y4
Message-ID: <CALj3r0i5yVcJY8V75y0Hm5xjtZSBpH0DXSAWKsAUqguChVcxYA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> On Sat, Aug 01, 2026 at 10:22:31PM +0800, Coia Prant wrote:
> > The XPCS block contains four MII ports (0..3), each of which can be
> > routed to GMAC0 or GMAC1 via the pcs-handle property in the MAC node.
> > The hardware maps these ports to different MMDs:
> >   - port 0: MMD 7 (ROCKCHIP_MMD_MII)
> >   - port 1: MMD 2 (ROCKCHIP_MMD_MII1)
> >   - port 2: MMD 3 (ROCKCHIP_MMD_MII2)
> >   - port 3: MMD 4 (ROCKCHIP_MMD_MII3)
>
> Why is port 0 called ROCKCHIP_MMD_MII not ROCKCHIP_MMD_MII0 ?

Hi Andrew,

The naming follows the Rockchip TRM. The hardware documentation refers to
the MMD for the first port as simply "MII" without a numeric suffix, while
the other ports are named "MII1", "MII2", "MII3". I kept the naming
consistent with the TRM to make it easier to cross-reference.

As I understand it, this is probably because the MII controls not only
Port 0, but
also the entire PCS (these registers are read-only in Ports 1-3 and reflected
back to the MII).

If you prefer, I can rename it to ROCKCHIP_MMD_MII0 for consistency. Let me
know and I'll update it in v3.

>
> > +static int xpcs_rk_read_c22(struct mii_bus *bus, int addr, int reg)
> > +{
> > +     struct dw_xpcs_rk *pxpcs = bus->priv;
> > +     int dev;
> > +
> > +     if (!xpcs_rk_mdio_addr_validate(addr))
> > +             return -ENODEV;
> > +
> > +     dev = xpcs_rk_mdio_read_remapping(addr, MDIO_MMD_VEND2, reg);
>
> Does this mean C22 registers are mapped into the first 32 of C45
> MDIO_MMD_VEND2?

Yes, exactly. The C22 register space (reg 0-31) is mapped into the first
32 registers of the VEND2 MMD (MMD 7). This is how the hardware is designed
and matches the standard C22 to C45 address mapping.

>
> > +static int xpcs_rk_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
> > +{
> > +     struct dw_xpcs_rk *pxpcs = bus->priv;
> > +
> > +     if (!xpcs_rk_mdio_addr_validate(addr))
> > +             return -ENODEV;
> > +
> > +     dev = xpcs_rk_mdio_read_remapping(addr, dev, reg);
>
> Should it be returning an error for dev == MDIO_MMD_VEND2? Or at least
> if reg < 32?

No, we cannot simply return an error here. The generic xpcs driver uses
C45 reads to access the VEND2 MMD for various operations, including reading
the device ID (xpcs_read_id). If we returned an error for VEND2 or blocked
reg < 32, the xpcs core driver would fail to identify the device and the
PCS would not work.

The VEND2 MMD is fully accessible on this hardware and contains the
standard C22 registers (0-31) as well as vendor-specific registers.
The remapping function maps the C45 address space to the correct
hardware MMD, and then the read/write functions handle the actual access.
This design matches how other xpcs platform drivers (e.g., pcs-xpcs-plat.c)
handle similar hardware.

For invalid MMIDs (e.g., MDIO_MMD_PCS, MDIO_MMD_VEND1, etc.), the
xpcs_rk_mdio_read_remapping() function returns -ENXIO, which is then
returned as 0xffff (meaning "no link" / "unavailable"). This is the
standard MDIO behavior for unimplemented registers.

Thanks,
Coia
