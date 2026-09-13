Received: from mail-ed2-f9.google.com (mail-ed2-f9.google.com [74.125.228.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406737E5EE
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789322732; cv=pass; b=i45m2dADe959rla0TYfWcpxgaw+rukd9VblHT9Jtit79hkcodTdwPHfHDJl6JK4BXIquzSx1+QjCxBKKS7zkd15tao3Nq4MA/EGxYXDP0Jf0AvQOpcHUF9ZFVKhvVXnf7QCP8FqGCY0d20gxerTG0tyyaYHbu8vmeavygzSZG60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789322732; c=relaxed/simple;
	bh=KOtTHl2ZUyPFirhy28Jx459Kdjt3u5AIiEGb5zEvRoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kw0b+9Z4gc4+U5e/0D+oizXvb5Ly31YHKYuy0bhjlBzhpVs9WT8B3Tkn3E/WrUgG8ftohUQdYJDJDfRspPSKvtt3Wv4KUeHKqDos4HcftlKd7iqNNRZjgSYgfQtqWOHsk/2LaJZjkWYiUYJ1geIHvZbNLcnB2wpOtZnAUH5BYmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwVKQ+0F; arc=pass smtp.client-ip=74.125.228.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwVKQ+0F"
Received: by mail-ed2-f9.google.com with SMTP id 4fb4d7f45d1cf-6a99cd510ecso1269837a12.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789322729; cv=none;
        d=google.com; s=arc-20260327;
        b=H2e3Ske4s7PBU9C+JJzg6FzFJ0yWKoTtZr3blbNH2VtSbfVvBS1jQ+ldEY5EhtVN2Q
         siQqbICU6GPw/x9OJP1mhkqYCAn4AqFZ8IAiU+gAoIi8aT5XjBvgeUdqk4RQTyQXJWaY
         7CmbDW85UA8fxMbAgKkRFCG2a+6MBPeZtRjrSjr4L6KWbHvQuIpQUcPeYT2JlbV5xJ9k
         oWbtdavxZwrRwL/XRB3wR/JaORbEz4UOSpBL63Ms8hyKNPgf7T2RFKK/GOjzGSTFF5B1
         W48Oj8AObHY94gTloYGfZmt8zx/NVG+3KmhqkuV+vDZUFGPsTlo9waUNKpTcAezZrpc3
         CAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=voliItkzs3OtrnJtmbhCv1xhQ+FU+qBLL3OO/h9nssc=;
        fh=BCsL1GNOqLt37qoLa5mnNuMjOg0UlpabDZ25nJOuWEg=;
        b=Zlo1rzts8PAgd5EitXAMSdAybf75L7iAliL8TMTtm6tF+U+dHTi2cE8mxiHco4Lccd
         yOShiC6+BQMA7h2Kwf685oMWV7CLiTJC44igNrMRms/WtNLzeIaJd6E8N841nvcL0eT/
         yxmic/XyTho0moragNqHHkOJZR9TUhf9DPSIVrCVrSubDd6VD+GJv92maMbr/IbTmoNH
         83zOi8zh1AcgWo55rJra9Vfo6YxhzWbYcBOindksA/IhJ1npD/BYe9U2gogwz83ettAh
         UsF3rCBq9gnoLvOGt4tb20SU5FgeWxzhSDStbiZIlqx0gOFvhTgp6GgYHZfETzGaoagQ
         Qg6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789322729; x=1789927529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=voliItkzs3OtrnJtmbhCv1xhQ+FU+qBLL3OO/h9nssc=;
        b=rwVKQ+0F0DdS0df6dM9p9aohkCPIkNm5KD8cfoEBV5HG31OdXaJdHGRjPDhoMG/9GI
         Q4QJUVHKeDKIAyd5OyiLkJgwMcJQQA9GNDV3CspsvaQHkM5+m/Xs72qPIu76ShzPo/0C
         j9xDT8YE2wprh2jeCzlljoQMhV5UwS4COYu86vzAJV+q3x9gTtnIwMgY6ocG6fnHDhtQ
         Mn/YbWF7jGWtpu1uONLNihvsU662fdj/ocsHTQH8pcvNMvuE+vfQLADoQ70O1gsyRnVJ
         Pn5LRObB1lX2uW0AUN3xyV6znLe/QuoikZoBspl+zmH75ltPt/pkT7WmH7k9w6lRwphq
         zt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789322729; x=1789927529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voliItkzs3OtrnJtmbhCv1xhQ+FU+qBLL3OO/h9nssc=;
        b=XEQdXgObgzL4OfSGcH/KejH8aVepDUBCMykFbjn8npT52GEd9oy5ezqn418+5lZK1+
         qDrpz1gfsuX56BHSYrpE38ZImZISxsE/obB2coksz/qK9pDlUsT6D6ONqiTH5poWdMWj
         uh6kuX5EX6SJJJg/L2ItroPyHVWdCPIhvD9Yn4IgunNn36io/iZcLOXDq8cIsrO2Y2Q1
         ktJLgx3n0Fbs5OO4xAl4Ln7oL5llZdrrbD4Lv6i9W2gdQbT5ggWOhD5m+lU03WqO7Ixv
         PspkiRejPqrCmwdOPWCGeHahhuRQEFATTB3jyCdsOi0t42vMWoE7jtQJg4P0XBwF0F9W
         xMkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlUkNuB/XJw3VtILwiX6VuNYfyh8BJN68bXMkQ+NwqNEb/2OMm1SYV3e3LDdXCRTv2S52FwvpeYATO@vger.kernel.org
X-Gm-Message-State: AFuF++lGASenXgeGnKITSZvD8u9l8/3YAvvY14JBjEweFXwlqkQIuFf3
	9gWNyBY0mBCu0QeBLd/heQvwQRaCxLhJQh8Dz94t5m0oTvjtddPMURPq1+hR1rhLUi71ZL4HtBS
	fdjd8CrTetID/UG346aW7BJw5OdzqQx4=
X-Gm-Gg: AYBFou2yrnCOZ4LIjc1nKG2g/+q8zcS6/LLHs/HXg9Un8hI4KIXcCHIHlWQNxFHwfHq
	CiFZpH7AQU5o9cozc8Gj06vujxDQFvI3xL9ofeCaix5oS+HzYgrYcepW5pZlfIC2eQaDFZl0J8I
	4Yo1H9fLhQuvCuxbk4Vdw8dhhHrrDDQPaSAPSbKJlNMy9qwVNiS6TmeeRcVVrJtqfnb1dbEai5g
	A3/3pGHd2VNsQ0dB+L9KpUKHzkwOnrMk5PORv6RJaI4T8Ihut3U+YAelKDo5+zYJlYQQEiw+tJS
	54fFW1+7GR+ulGYhRTBuecWC3TbdGcX28L4kFWvliki7wz8oWYsV9Lnnhg==
X-Received: by 2002:a17:907:d109:b0:c29:3e59:fd03 with SMTP id
 a640c23a62f3a-c2966732c9cmr1353966666b.18.1789322728959; Sun, 13 Sep 2026
 11:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153713.2572547-11-coiaprant@gmail.com> <20260912201332.127297-1-kuba@kernel.org>
In-Reply-To: <20260912201332.127297-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 14 Sep 2026 02:05:16 +0800
X-Gm-Features: AcwNN1XgxVngHvtMFNhv7y3qMtC3nxI3TV6XULwbytRJ0h4SCX-LBQfd6V3fGRY
Message-ID: <CALj3r0jBCoX=GRTrshY7QJO3Vykrbx+1NgE=zOV3S+WLLBNM2w@mail.gmail.com>
Subject: Re: [PATCH net-next v4 09/10] arm64: dts: rockchip:
 rk3568-photonicat: enable SGMII LAN port
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, vkoul@kernel.org, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, romain.gantois@bootlin.com, 
	hkallweit1@gmail.com, neil.armstrong@linaro.org, linux@armlinux.org.uk, 
	shawn.lin@rock-chips.com, david@ixit.cz, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:13=E5=86=99=E9=81=93=EF=BC=9A
> > @@ -242,6 +243,7 @@ &combphy1 {
> >
> >  &combphy2 {
> >       status =3D "okay";
> > +     rockchip,sgmii-mac-sel =3D <0>;
> >  };
>
> [Severity: Low]
> The changelog says:
>
>   "Enable combphy2 with rockchip,sgmii-mac-sel =3D <0> to route the SGMII
>    interface to GMAC0."
>
> Is that description accurate?  In the baseline the node already reads:
>
>   &combphy2 {
>           status =3D "okay";
>   };
>
> so the only new thing here is the rockchip,sgmii-mac-sel property.  Could
> the wording be adjusted to say the property is added to an already enable=
d
> combphy2?

You're right. combphy2 is already status =3D "okay" in the baseline; this
patch only adds the rockchip,sgmii-mac-sel property to it. I'll fix the
wording to say the property is added to an already-enabled combphy2.

> [Severity: Low]
> This isn't a bug, but the new properties do not follow the ordering used =
by
> the rest of this file, where properties come roughly alphabetically and
> status is last.  Here rockchip,sgmii-mac-sel lands after status, in &gmac=
0
> below pcs-handle comes before managed, and in the new &xpcs override stat=
us
> is first with phys/phy-names after it.  Compare the existing &gmac1
> override, which ends with status =3D "okay";.  Could these be reordered?

I'll reorder the properties to follow the file's convention (roughly
alphabetical, with status last)

> > @@ -350,6 +391,25 @@ rgmii_phy: ethernet-phy@3 {
> >               reset-gpios =3D <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
> >               rx-internal-delay-ps =3D <1500>;
> >               tx-internal-delay-ps =3D <1500>;
> > +
> > +             leds {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     led@1 {
> > +                             reg =3D <1>;
> > +                             color =3D <LED_COLOR_ID_AMBER>;
> > +                             function =3D LED_FUNCTION_WAN;
> > +                             default-state =3D "keep";
> > +                     };
> > +
> > +                     led@2 {
> > +                             reg =3D <2>;
> > +                             color =3D <LED_COLOR_ID_GREEN>;
> > +                             function =3D LED_FUNCTION_WAN;
> > +                             default-state =3D "keep";
> > +                     };
> > +             };
> >       };
> >  };
>
> [Severity: Low]
> This hunk describes the LEDs of the pre-existing RGMII WAN PHY on &mdio1,
> which is already functional and unaffected by the SGMII enablement.  The
> changelog justifies it only with:
>
>   "Also add LED configuration for the existing RGMII PHY on mdio1 for
>    consistency."
>
> Would it be preferable to split this into its own patch, so this commit
> contains only the SGMII LAN port enablement?

The LED configuration for both PHYs is kept in this patch because the
two PHYs are the same Motorcomm family wired identically on this board,
and describing them together keeps the two mdio nodes consistent. The
change is purely descriptive and does not affect the SGMII enablement.

That said, if you prefer it split out, I can move the mdio1 LED
description into a separate patch in v4.

> > @@ -586,3 +646,13 @@ &xin32k {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&clk32k_out1>;
> >  };
> > +
> > +&xpcs {
> > +     status =3D "okay";
> > +     phys =3D <&combphy2 PHY_TYPE_SGMII>;
> > +     phy-names =3D "serdes";
> > +};
>
> [Severity: Medium]
> Should phys/phy-names live in rk3568.dtsi rather than in each board file?
>
> The binding lists them as required properties of the XPCS node:
>
>   Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
>   required:
>     - compatible
>     - reg
>     - "#address-cells"
>     - "#size-cells"
>     - clocks
>     - clock-names
>     - phys
>     - phy-names
>     - power-domains
>
> but the SoC node in arch/arm64/boot/dts/rockchip/rk3568.dtsi has neither:
>
>   xpcs: pcs@fda00000 {
>           compatible =3D "rockchip,rk3568-xpcs";
>           #address-cells =3D <1>;
>           #size-cells =3D <0>;
>           reg =3D <0x0 0xfda00000 0x0 0x200000>;
>           clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
>           clock-names =3D "csr", "eee";
>           power-domains =3D <&power RK3568_PD_PIPE>;
>           status =3D "disabled";
>
> Does this mean every rk3568 dtb reports pcs@fda00000 as missing the requi=
red
> phys and phy-names under make CHECK_DTBS=3Dy, including boards that do no=
t
> enable the XPCS?
>
> The XPCS to combphy2 connection is internal to the SoC, so each board tha=
t
> enables it will have to repeat the same phandle, as this patch does.  Cou=
ld
> phys =3D <&combphy2 PHY_TYPE_SGMII>; and phy-names =3D "serdes"; be moved=
 into
> the dtsi node instead?

As replied in the earlier patch, the SerDes connection is board-specific
(some boards use combphy1 for SGMII, others use combphy2), so it cannot
be moved into rk3568.dtsi.

Best,
Coia
