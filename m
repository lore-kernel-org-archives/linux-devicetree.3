Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D5533F368
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773356; cv=pass; b=OmtQvBeEyp4q5CNKcWJc7POOG9InzW1VPF30Q+n+qAx1BVCj+YIS8WXQ2PrXV8ZArcorSoAg0hDvQ2re6wS5eYlxjmbb6sg1RnDpUy02jLKmJsK+E1o9weg+ieSMyx2mAzkyQiEiL4Yr4VG+Ik4Oz/VUjqv2nRfYIHpY6jKZzLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773356; c=relaxed/simple;
	bh=WkleEX41KDLCmTlkLZWoFZUTVoGZM+SKri5I4gXE6so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acMQ2/1Q0ga0IMoI9Pt1b+x512texww8J/bgBqeEh3yWS2HNcJLi6HZFGTCbNshmr+8Y5PsKOI/GKLZeFu9Rj5Ka9ej/vlaF5gqyZWB5ZkpCw1vpcKHpgKGmz/3izGdq/jYpRfhXtLzIomYCzsnQaF/+Dx6p9bOwZbdZdfAI2EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6sr13ph; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6sr13ph"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-74ab6c88052so1150492137.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785773354; cv=none;
        d=google.com; s=arc-20260327;
        b=fDpyZypf1dNY0MJncJhgobYAxOucJFAjxEYpNWiIihC0098vQR0a3ad70j3yW6bCMp
         VMgznxpAMCwnn2P52x1EpkHdrjlGbYc7HwSisRoBqF1MpPnLq697dAZbDNo+RYsu/z28
         lJ6a1BLhjEbDZBebVxrL95f/m5XKjuvjUEk3CO1RXYqUBjrHyVQBSbjSoDSZHPSIHCT1
         XN+pPJ6higcCNtf3vUb/day4baDAd+on8kMPw+650QCxm2IPBik1r9pMpztRazvSTjIF
         MRGnxJHr3AA0t7yvQU8LX1IQrs3iaaEIOflO+vPVerQn81Uluv4Pu6sJSj/eu5t1VuBf
         TITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        fh=Oqp07JXpZDn92hGTokXrV+0TklskCI2G5MvuqZWlTkY=;
        b=rsrau8O0HxafqCL9OQ1glPkWNFh0Qb8MxZKoS/se+/AiZ37RMmJ/NErqaa8M/A2Z1B
         SZauSqdtGKh6O+M055Sbosxr1N8v/OMxsun9yLGfW7sWN2jFCmTnKYwc+kkH9IMqR4oX
         578mPvppjXzGlskDgu9Yr2fJLJCFZxbje1/+LqIQ0rOLrU5G4E3BUptrtokZnxdc32nm
         mQLfssj82WgJfKcsys7+XiAhMzcS+VA1czevcQrIzqIjZSgbyEJiEDru6LA78N2VCq6O
         GEY6Z4JZPTuerr4qOZhBiWOQbcg2W850g1JMipeGDIarpfItJrKgR8KhxBQMggl5eqK2
         iklw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773354; x=1786378154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        b=R6sr13phygwg8sm4AgcW/fH3c9JPj5LLySV4hsZjUglHapiB8edOJHzLXh3YrVMV07
         pWw9I2WDMlGvDN2EHiDUp7NEhqTKFn0HMZR4+6Lgm0z49UM2MTd3CHsk3sOp25lpI/dC
         wYQtVcr1VH2SX8EwM/oNYlvSPmtWLef6SfakCVllq2Jy133EpHbS/UO9AfczCD4W8ime
         E0kDhxNWkz8PXx6Ds790P+LR9oKuoTx65JlmT8JrZ8ARJsqrU5Iy90f/sGvwnQIlBiW2
         myqHA1yurRQblMHLOdXW26XZQynCIMYaBICyyXyrsqH3zfvp0bq6LxbSlGNozc+Uypum
         V9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773354; x=1786378154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        b=hpidERY9A1gpcnBv22DXctzaTraK4J41xypQvBgXr5rHE2mpHREKNnJqn5NIdtyf1w
         fo6sza68KKgvJjQRLB2aYuZq+4qNktXgdzwSlyIENRM1WcvJ7zLSPmNYO70OH5I8X3p4
         XrlDiu9DbPujU++mqRhnJsz0urpzwQFC2kFHwPjAu2QWOv6UlRjDMNTP21OUm/Yrxv9r
         8xH6F/7gtR9z14VV75ihdmL5ahL767YR/1sCmDmxAFPuGdxNh/2C/diUgNiGYnT0QENR
         agV7Ap17LS3Sw4Vr7dXlAUNwwYC/pqsnAWrdh26/iNvIZK7v0JpNC4CyycUbgEy9jO3r
         Hvqg==
X-Forwarded-Encrypted: i=1; AHgh+RqZQpBwT7p+r4mmiW88wxgP6whxKDK1tCq7kpXNCjDMtLuJTR2V3wndUbfMggjzUT0ug133F4mnSOEg@vger.kernel.org
X-Gm-Message-State: AOJu0YyVsJoZEr9OxNs979NVfD6Blb/Fo50tncDsDB/1+8Yfny3ZnO5O
	puJRompOdaDsiAncb5YnXogoiQVlOsMHcz68LmY8FS/K4mP88ZtZlq/zM504LGi9Lmv9mKlw7AP
	CKsAmTl4R2alWECS7zvUJ+VCt4f2gaSQ=
X-Gm-Gg: AR+sD11vjy9pS4z/ODBUxvkjYxbzqA1K7EUo9ZSCbyEMDd1xBVRmXL9Ta6mL7Oz68Nv
	PDQihNbnAs+g5+lDYRd4Qb0UwBKB3D1UVI+TK6KO+kgv/yvTDFp6fFsyDJgxPcQ869yV/Y6HWGs
	/k8Nw1GtuTlB6gWRH/JYwDT3Mn2y9wqMWfQH1DZB7nNRVe0hw86N4EzCoPBLB2ZYROz0tC0wMEs
	ZB0ZqDWVjVhKMnYNls24xjrXD84D/lO+WO+1oMdVX2LVW/1t5QSeqHjyDJgcSTslOCcDWxoU5EA
	itBhLdPpjB7zdcxtg7SGW1uK3UyNV2p+k49P2NZC+5Cvzu8OL0IIxmH0iH0yxSjY9xX+7iWlZDa
	BdVCcLRVt+/IUa9QJi8Y+6nqjPFz+U081lFo4ZlyVYcIEELX6JCSXnOK249vKAi/7V3e14nekVa
	WZNd3J+hExcOQ9E2+v9EkRqsmJ2+YuflmMNFBE
X-Received: by 2002:a05:6102:15a3:b0:738:be73:55e0 with SMTP id
 ada2fe7eead31-75b237677ffmr7059647137.12.1785773353603; Mon, 03 Aug 2026
 09:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com> <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch>
In-Reply-To: <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:09:01 -0600
X-Gm-Features: AUfX_mx9mt9dbVrMmCFnN7qHq2KVIXtx4IDcN-1su1pyV_2ANjujEXVMup0YQWo
Message-ID: <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static int
> > +ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *control,
> > +                            unsigned long outputs)
> > +{
> > +}
>
> > +static int
> > +ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *control,
> > +                             bool active_low)
> > +{
> > +}
>
> I've not looked into the details, but these look like pinmux. Does
> this I2C device have a GPIO controller? Can these pins be used for
> other things than LEDs? Maybe you should be implementing a GPIO and
> pinmux driver. The Ethernet PHY driver can then just select the
> correct pinmux configuration.

These do not appear to be GPIO or muxable pins. The AC200
documentation describes them as three dedicated EPHY LED
outputs: link/activity, speed, and duplex. The bits in SYS_EPHY_CTL1
enable those output pads, while EPHY_CTL provides their shared
polarity setting. I have not found any documented GPIO data
registers or alternative functions for these pins.

Therefore, implementing a GPIO controller would expose capabilities
the hardware does not have, and a pinmux driver would only provide
a single fixed function. The callbacks exist because the LED function
belongs to the PHY, while the pad-enable and polarity registers are
reached through the AC200 I2C regmap rather than the PHY=E2=80=99s MDIO
registers.

>
> > +static int ac200_ephy_ctl_power_off_locked(struct ac200_ephy_ctl *priv=
)
> > +{
> > +}
> > +
> > +static int ac200_ephy_ctl_power_off(struct acx00_ephy_control *control=
)
> > +{
>
> > +}
> > +
> > +static int ac200_ephy_ctl_power_on(struct acx00_ephy_control *control,
> > +                                unsigned int phy_addr)
> > +{
> > +}
>
> These look like a regulator? The phylib core has support for
> regulators.

The external supplies are already represented as regulators. These callback=
s
do more than enable a supply: they sequence the package clock, reset and
shutdown controls, then program the PHY address, calibration and interface
state required before the normal Clause 22 endpoint becomes usable.

> Maybe take a step back and look at the overall architecture, and how
> Linux can represent these blocks.
>
>         Andrew
