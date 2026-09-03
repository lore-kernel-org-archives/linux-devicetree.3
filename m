Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F335445AFE
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424704; cv=pass; b=KyHJJCjEGGdVoJUT5nh5sffkec5eqKXjr17KBmNMBtlb4MNALRWgjUKDf4q7ke357OpOzbM0hFFh0eD1hIDWpybN9BWJpiHqq225sH9VEI07wuY/YxGRNIRb86rJkWdBBgPu1x1+YPi9xh5jzR3eWgdYDmSDmDFOHpjOctkdw5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424704; c=relaxed/simple;
	bh=TN4nRbj2sDa3jvcFws0KzC/xkvTzZd0I7H3ICwDkr5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxJf/JtWUQ5dUlfFOvEcNzRkY8GSaiOytxfriafbi84Shi82G1q8MboxOFEa0DEebsUJA/NaUAYlzSUtBbch5yK7hL0B1vaDcjU4JgUnXHs/W1Nd58EJaC43xeiMhPOA4HN0iTh5Em1LxT6LmAyxBxUtf7M0W5vSOJV5EucxUxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1KThPar; arc=pass smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1KThPar"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c254d2a2f66so86515966b.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788424700; cv=none;
        d=google.com; s=arc-20260327;
        b=AJAHeu7FQ5+vG3XYZsnF4vlRBsQ+JvrCVA7eCuBYgtQ/V9iiT8z3nOOJAuiljUInQ5
         /4066b0P22OuNTMp0uiTFdGppZ5oUNXAyRM6E5X/47jS2MI2TbTiDfLWztrnsmTrvmPb
         M6G7WGpNTOL7iHwbOzRrxKDYCvFcnKPPSQaNGEAcSQn3V1S+vU8KHwh9w/IN3tCHAO3K
         4EdL4f1HGhKxCN8Hk4QHO4bSfxzRfk21iWSydm0/DRsuEIlmBU6L8lIacPLtiLxRT8E8
         R2cBc5zwYR17hxfp6vExsDFBwwNN8nj9Y+N5w5dLFRGoPIgZcxgiH0z3LI8Qxd4FjM02
         uqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=;
        fh=vUD6X28R83RYr0yK3aWNqWwL5iqAnyjoFs2qGnuoIIU=;
        b=S5hJPYCT7oB0TlOvJdMg1ZIlOGG+4pdBqFcyhxgZS6BkUd7MeKwVR7h1R373RAxT3S
         tP7M+tNZ/mJxKmY8HhD37SIKUm+Bew6dqAKZqirQKsXZXPh9LeFP9TucrLq5IBEbC11P
         LyU9nCKP6SOiVjUS7CSEWFUpbVAJnmpRF5Pfac8Ku35u+hbkg5K38+nBSI2aC+S8QX26
         VZAzKHNehBKd5AcSAwhRogVgpugafu89XMPs7eUxcqBxZLqlmYqW4/bvW8cIy9Tg4T7O
         kGGp/4e4w5As598ARWw3LO7LYR3uqWcUH+4m7sNXTOTMYTNi/C2/rulTZchMnIbE2SyD
         wFNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424700; x=1789029500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=;
        b=Q1KThParMiBk4Ixunwx8k+m3hjhnkHFvvKa/rhPe7EdaK2d4h5ll32Q+RN67QTkOZc
         8jxQmYzl5TS07VD3JFNPsXT0GdrjJbvxGaOo+zQQeT9sDrsvPILQYn2pnpfVjLgYZO8Z
         FInD1IuGQjhejxZi/krDFs67sVD8bAV2k34bqwLj5fC9IEb8t5D4hZEbTdLazUtIwa7T
         sMzHihOT3uUvq0dWakEIb4jCpxHfKwelmP2DqJzndGfgj+zxWsUfPHSJ0RMA39h+rw1Y
         MxI1fZDXHuYjMUvVP0OKFEmzMZdKZxtpmYZ0QCiluqDwE5V9j0pR0CVmiaqcaIUFdiP1
         9bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424700; x=1789029500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=;
        b=Ib1gc3akbvXaEXhBoL+emITn+CJwDlw0R9ZOw11Bjl+eVmciIy8Pkk3JLW5UOpbdft
         A4vVDticLdtDZVM/mEnkOKFW3YlGvfZaGsG8J65UcbK+rGSm/Bsz6Mc0reNyHH4OQ1Mg
         18PZb67b7nP8C6PK57TyICcZg8Jt9+QjSz3C4mS3ObGKcdjVt7lw01Av5RBockGdxqLO
         baWcqA65815obxapdZqsT/xSCNWiVlOVOstAQCS6a5JQe6AWa+842wg7EoiJTm2ysgc3
         a6nprzb+NpLB5s5qmSFF3Cq0ffaV2SjuZ9Lk7YAKQFai3QPF479cAbVI9M1jQ+Vz3vTb
         IZxw==
X-Forwarded-Encrypted: i=1; AKwUvBywXPfaBjlZGePdoKW/fbld5LfAC6xh8Z8GPt87k1GCE8oXCi4YVYFdXne0+uGM4m3RutGO6thSEYwt@vger.kernel.org
X-Gm-Message-State: AFuF++kFZGA9LexIfJif1L9JDUm+oeed/ZN82L8e56JXJPoxRxIz/f70
	p5DBW2X/7U7TqiIWaM2BSmlyngP+NuBn9qzxuRdnl07/ltRq+NdE7sVSC/Y3wJjJrzV5AOJu2SL
	A2gbntFz6t3Kcef/TWEwUIm9OdI9noOE=
X-Gm-Gg: AYBFou0WWtcLpYEeldbn7FnC6HT42tspEqlwKjHIuiUsv15VgXDqgBqWmNfFKOuarPk
	SERBNsmu7tVF2mVzGJ6oYR0O5zG1Y+kZFfZtBjRp3BudXuFBP3vjC2V8xKtS0Fado5KpxJ7QKub
	whbJEP2m2RwQ8XmI69RFgBvQWsRAkt9P1ZrafE/jFLRfVCvJikYMcOc0we0vVbwvcmM1WmxY72s
	cfMfmO3os4MG16iEE9BTVwPAQ5Jo0ASqvU89HLGn/M5XhEf8m7O02zyqQiA9W2I/ykw675IhV6f
	dTSh5hOrE82dZfdgixNNiWEcfcTDF+VPcWiWd+jp7HJ3SyC0VN1E+dZ2abteoK4=
X-Received: by 2002:a17:907:c71b:b0:c20:af9d:4533 with SMTP id
 a640c23a62f3a-c25d560c603mr627292366b.19.1788424699559; Thu, 03 Sep 2026
 01:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260901150111.141037-9-coiaprant@gmail.com>
 <f07c64b4-3018-4e9d-8aea-12454f132419@bootlin.com>
In-Reply-To: <f07c64b4-3018-4e9d-8aea-12454f132419@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 3 Sep 2026 16:38:08 +0800
X-Gm-Features: AcwNN1VhuHjbmY1CA9bSBTxLCt2mOIIUXarfDkLXAsSy1buatA_CYmYfdE_lEPs
Message-ID: <CALj3r0hxSOrtRwOmAQ4Vw=nEkTfA+x93KzpAdG9m=xWFYbOuTw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 08/10] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B 16:34=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi
>
> On 9/1/26 17:01, Coia Prant wrote:
> > The RK3568 SoC integrates a Synopsys DesignWare XPCS that can be
> > connected to GMAC0 or GMAC1 in SGMII mode.  Add the necessary glue
> > logic to support this configuration.
> >
> > The current dwmac-rk driver does not support SGMII mode.  SGMII
> > requires a PCS to handle auto-negotiation and link state reporting,
> > but the existing driver only supports RGMII and RMII.
> >
> > Add a set_to_sgmii() callback to configure the GMAC GRF register for
> > SGMII mode (bit 7 set, interface selection bits 4:6 cleared).  Also
> > add a supports_sgmii flag to indicate SGMII capability.
> >
> > Provide pcs_init/pcs_exit callbacks to create/destroy the XPCS via
> > xpcs_rk_create() from the Rockchip XPCS platform driver, and a
> > select_pcs callback to return the XPCS to phylink.
> >
> > While at it, fix the clock enable ordering in rk_gmac_powerup():
> > gmac_clk_enable() is now called before any register access, including
> > the SGMII mode setup path.  Previously SGMII mode would bypass the
> > clock enable via a goto, which could cause synchronous external abort
> > when accessing MAC registers with the clock domain disabled.
> >
> > Also clean up the error handling in rk_gmac_powerup() by using a
> > unified clk_disable label, and add error handling for the default
> > (unhandled interface) case.
> >
> > SGMII In-band vs Out-of-band
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > On RK3568, the MAC clock is fixed at 125 MHz and cannot be dynamically
> > changed by the stmmac core's set_clk_tx_rate callback.  In-band mode
> > works because the PCS handles rate adaptation internally.  Out-of-band
> > mode does not work because the MAC would need to change the clock rate
> > to 125/12.5/1.25 MHz for 1000/100/10 Mbps respectively, and the clock
> > is fixed.
> >
> > Enable default_an_inband for SGMII and disable the generic stmmac
> > set_clk_tx_rate callback.  This forces phylink to use in-band mode,
> > where the PCS is responsible for speed/duplex negotiation.  Without
> > this, the stmmac core would attempt to change the clock rate on speed
> > changes, causing TX to work but RX to fail.
> >
> > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20=
TRM%20Part1%20V1.1-20210301.pdf (Page 386)
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
>
> [...]
>
> > +static int rk_pcs_init(struct stmmac_priv *priv)
> > +{
> > +     struct device_node *np =3D priv->device->of_node;
> > +     struct device_node *pcs_node;
> > +     struct dw_xpcs *xpcs;
> > +
> > +     pcs_node =3D of_parse_phandle(np, "pcs-handle", 0);
> > +     if (!pcs_node)
> > +             return -ENODEV;
>
> Here aswell you make it mandatory to have a PCS, as the generic pcs logic
> introduced in patch 1 doesn't handle -ENODEV, it treats it as any other
> error.
>
> So, either you return 0 when there's no PCS (so that we don't break platf=
orms
> that don't have one), or you handle -ENODEV gracefully in patch 1.
>
> Maxime
>

Hi,

Currently, `rk_pcs_init` is called only for SGMII, which requires a PCS.

As it stands, only the RK3568 supports SGMII, so we won't break anything he=
re.

Best,
Coia
