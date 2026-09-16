Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB9345731
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540184; cv=pass; b=T854bjrNVX6in+3Ptb/V/9rtzZ5UTzg0fQ+J+A4FgleqVhA9GCDO/QPja0fVUcACUuomAT8TNi9ZzTkibIFelUk7cT9A+XgL4+5rJKPQXHrUnNM5J/+X5B0lGgKF0ONSR2F3vskKpsKPK/Jn+ddeGsmQV0Sf10XCqwZPmb/CMyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540184; c=relaxed/simple;
	bh=vxwJtKP5dyGMaNoczGK/7UXp394tRjI7aLg0dpu/cdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meJ+EKSkxwePCcxE74gUCgHCcvU6EGZU1y8JjbGlIHBWS1jHO0gW1hnH2oG+bPIYQEmgcpSeDWyKS+HwYIYNbHzOKrUmmvfCGM1L/0D5RJj1xcCwPQwraGy+mp3IwS79ZEt8+1VsK4RINA7JOy5BwO2bHahqpqmbppAIM8DdQtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSdPIk8Q; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSdPIk8Q"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bab8eso262657241.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 23:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789540182; cv=none;
        d=google.com; s=arc-20260327;
        b=DpPYWXGYPdJTvAj+vmdTIjYOOCciYZYkQlHgXV3pavbEIqp2ypxvt03640LJyMdR0G
         pmD7yA78bJ2FaODxW0l/a5tY72z9Drr0GtLpXQZiFCHSg9VsyUznuploKHiMCgU+5oHh
         Hbf05GT0EKjvNFsqH8GQz9EO6m0kBkbGz3Rnd4mrs9lO0460vY8SQ57lQOJ+C3pE5Zjw
         LhXwgL5rP7r8dtgcpaHLVB45Z8T1a6O3+3sPHs2D29B35nd+8tl8MEKMWBPmQRy+xT9K
         Y6D4q95XiVlM44eKDHPdUg07cVXe/iepfkXZ7qBTBrYL6cPasQUXZbdFKQCr/UMz6fT4
         /0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        fh=YnEvNxvlkaG39x8xYJ+/8ZdFyqLsAi7xhnvJHbHwNio=;
        b=BevZ66MaBYBazAjOddvY7Qx2KhOZZEC8W3AcQoQt2cOcBC2X9kHVBVs7QMt5FoRjzz
         HwQHloGwYKJ1xRwAB/tbB+VGRP1AqzpYBA/Oreoo07O6DVQeb+wiJDSsGTBayG7LUJR4
         6verhmkQ9e8o1d5Ohc2jADhmmJydb0VpnTaywo3t4nPOZNmY+DninLxODAT6aaO3Et15
         6rEw5tXGsKh527gWHXuMbNfPU8HCH0UGI8Zy7u5mBxJVTxjHBJgEMEM0BeF7xsLBfiEt
         4sPP3MHuG//LA8NgpENC89whmFf7BgsoiuwPEE3ZubGypHizzm9dx48Fg5WpSRNZUC2m
         pzTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789540182; x=1790144982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        b=VSdPIk8QtSsqlbhk10jiflIRjv3ecXSilDdxODs8YfeBkFbJ05RTbaYB06O/8VGSU4
         3YF4ps1fzrGJTymh4Q8xkKnvDjpFaIEZGNEAPfJ6oZMRtZCWWkW5cjhEy4RmLXEU/PT1
         4ihUWv9z640YKZNVdBkEoOddM8MG/th872mPE/pgsQJsIEM92wQakqmqkXYCDvkZICke
         i09Y3myRwwO6vsDBY0PcA/rPRgwfGNK5tmA6FmVaflb4vwYNpbeJzGvVrwEmXAXF7PZd
         pRVDSaqZAHFT5FwX5Ecg9IrKH3qL0CPopNBztr6a4Dm8Rqtl1ZhTJainKYbVoJ4zhTkM
         Zy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540182; x=1790144982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        b=Q0AjsLlmMDOnqjTDhfSSXo25B7+G6OqphGmvirb2RoaBkeWnB8vL7sAqjr4WyYipUX
         wBEixFHyXbEGIbZxeg7gZP4lFeX9yGz4hOQ5Gy45bHOomdmYX0xLwzwpSnscglv8BIcr
         y9H+pAepY64ylyKrtOoWOvxAME7r8M3sa9pJ1MW7USu56VXY0jc6qXBDMUYSSD8ffRy3
         frWgBZqIoffvoYQ2DwScyVyzcF2brzsElwI7d/0rz/0JitxyYs4BSRBVs2W+ui18oSI4
         3tFpntnkIXpBMin49xyZhthv1g8x+WeFwPgKMjOc4GLSdNGdCiqr4EKDCLYZD/VdK3fj
         GOlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoaNVy2Nou/nH5llIFcfMMfAYkGT7yDpzSp3EDK14H6sQAPe8UUgWuYO+eag8cI2u6XxIANjmbGEnb@vger.kernel.org
X-Gm-Message-State: AFuF++m8a+L4hpKNl9ThCEm4JDWLXEKfhJ4vWonu7raUz4l6d4f6L6tU
	qaNzt7apJNZ6gY7sW3TdqTenZXG43nTP+8disrjFvMUI9VZ4OZ3CuL6qs3ZOrXoYoiwgbttvWv2
	03lXhQS91jTntFrnCQU3ewKQKCBx3KWY=
X-Gm-Gg: AYBFou0ENRM8Vqr8uUJ0A+xAyko+hR4tnp4UF4PJBQUDQWGn4DLK/y9CfJaa7LrDKD5
	sl3ZKtMzwYLIdlaft6QU78awFP4Pskh0TbhRt6eGM17HFvhvx7Z7V6gBsL84Fgzv8nFj4hG0Bac
	jYVBxpsrM3vV6vcQQQ0gE5XGtNPxCWS3Ibpf6DdzVUqoQxF89NYpuK1LzYzVMfk5cCw42u64vZB
	m/1ULjFtEUQRAADiQ/sROK4yElkzYm5TzZCpJwj/5eOSTnJMYl6zGc7P72xFMm7GsVrENCjkWY7
	kraF1YE7urFfZfpvs9G23y2PW2IhHW0V4bBTCngxdKv/05Nu3GAWxrnOhwTZ6gNHJw5SvwBx5/o
	JNkreG+EylXX6PHHTaK4wSEYECHvep9+T7bShuQ0rKbEHsdfWsxYU5BL+mP+02V7cLA5J9GYyqy
	6D0ApwszYNrt2NPL2kXanTyteZnrGa0jBVKx6SM+pIFG7q
X-Received: by 2002:a05:6102:3ec7:b0:79b:b116:2c5 with SMTP id
 ada2fe7eead31-7a023d19677mr1268443137.2.1789540182266; Tue, 15 Sep 2026
 23:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916044119.475666-1-alastair@d-silva.org> <20260916044119.475666-5-alastair@d-silva.org>
 <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
In-Reply-To: <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 16 Sep 2026 00:29:29 -0600
X-Gm-Features: AcwNN1UffeYUy4Pp1zpzsKWqvpGpKHs9ZXj5jRY360cdZ_TOsQDRhTD1ZCtKs60
Message-ID: <CADvTj4pC2xGn4m5Medhpn16wwLj34uatw7v266CCmYWOyWPAZw@mail.gmail.com>
Subject: Re: [PATCH net-next 4/4] net: stmmac: dwmac-sun8i: Add Allwinner H616
 EMAC clock index and internal PHY support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Alastair D'Silva" <alastair@d-silva.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	richard.genoud@bootlin.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:25=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 9/16/26 06:41, Alastair D'Silva wrote:
> > Support EMAC1 and the internal Fast Ethernet PHY (AC300) on Allwinner
> > H616 and H618 SoCs:
> > - Allow reading a register index from the syscon property to offset the
> >   regmap field for EMAC1's dedicated clock control register.
> > - Add emac_variant_h616_internal with support for internal PHY, MII,
> >   RMII, and RGMII modes.
> > - Delay the MAC software reset until sun8i_dwmac_init() when using the
> >   internal PHY, ensuring the PHY has powered on and begun generating
> >   the receive clock before the MAC attempts to reset.
> > - Skip setting H3_EPHY_SELECT for H616 internal EMAC, which does not
> >   use the H3-style EPHY select bit.
> > - Handle -EPROBE_DEFER cleanly during clock and reset control acquisiti=
on
> >   in get_ephy_nodes().
> >
> > Assisted-by: LLM
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
>
> Even if this is a duplicate some of the work done by James Hilliard, this
> raises interesting points.
>
> > Notes:
> >     Tested on Mellow Fly-C5 (Allwinner H618) under Armbian, verifying s=
table
> >     EMAC1 probe, deferred soft reset with the internal AC300 EPHY, and =
100M full
> >     duplex operation under load.
> >
> >  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 65 ++++++++++++++++---
> >  1 file changed, 55 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > index 48c52eb96233..1728893589a6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > @@ -130,6 +130,16 @@ static const struct emac_variant emac_variant_a64 =
=3D {
> >       .tx_delay_max =3D 7,
> >  };
> >
> > +static const struct emac_variant emac_variant_h616_internal =3D {
> > +     .syscon_field =3D &sun8i_syscon_reg_field,
> > +     .soc_has_internal_phy =3D true,
> > +     .support_mii =3D true,
> > +     .support_rmii =3D true,
> > +     .support_rgmii =3D true,
> > +     .rx_delay_max =3D 31,
> > +     .tx_delay_max =3D 7,
> > +};
> James's series [1] says this SoC only supports RMII (yet includes RGMII t=
iming
> control), and here for seemingly the same device, there's MII and RGMII
> support listed.
>
> [1] : https://lore.kernel.org/r/20260915-submit-h616-emac1-v1-v1-0-195de0=
bb1f8a@gmail.com
>
> Maybe you can coordinate with one another, can we connect that SoC to a n=
on-internal PHY ?

The SoC, yes, on emac0 for H616, but not for emac1.

> If so, can we use MII, RMII and RGMII ? or is it just RMII ?

Looks like it's just RMII.

>
> Maxime
