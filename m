Received: from mail-ed2-f10.google.com (mail-ed2-f10.google.com [74.125.228.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2D73F3278
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358088; cv=pass; b=bzYPNbd2YUOnIGu4UGRy+/eyqe74lIuUhrgcctngU+dk1z2bg9eOnxDx6LHqI47D4YDqk9XwxZZBo08XQHTu72E8c+ksU96I9czUVMGTN7T1z5AxYcpXoOL/3K8uJYKv+nT83f2Xv3syiqYN9B5nm6UpA/tf1JyzQf3FxvCMMCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358088; c=relaxed/simple;
	bh=lwlqRQGo4x08t5IeEylUOiECkKYgj49qcnof0QlOmWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ah1zXPtXPRiGc0SSPORuMc5ui8S561huOe0xyXUmqyN+muAD2A6FNyya2mS/heBrq3fpfQsey06HsVNQW3hfuboDHi7Z8mFGjvdMrdzw785zcUoACqapipKTbt+BaRZpXq95abXNloiUs7/pazEvqxY4jUUOZEmCsbEJRdoQgII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFdpIIrc; arc=pass smtp.client-ip=74.125.228.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFdpIIrc"
Received: by mail-ed2-f10.google.com with SMTP id 4fb4d7f45d1cf-6acbccc0fa4so1965890a12.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 00:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791358085; cv=none;
        d=google.com; s=arc-20260327;
        b=c/F4jfZDorpuInF2UZjxYwu4jq8MEXg+njqPv6+93Rxx7UEZANt5XGESdjokShJnQO
         NQvhNRcdkuSeJXgbu5R8Sb3S6xcQz48QLYejISmC6nqCdluDbA2tE35eKh1ZQswOoo5k
         EOBz5sWaUoxxmXWjMykotIOVa2IA38dXM+yp311iP4DRiXzY92tbUvWH9sKiKnHEOfe2
         vp2c53lb9M20eOXYlUFQTW31EceoKnqGbKy4NjAUlDFI5ENVK/rUS5TfsQPbgMo/P6hR
         n4VLd+C3DdSab0ZF3ZmPUjN2Cj6AKW057UcCkxyist7k3BtVLe4Z6pkOls94gIf8j8bZ
         q4mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Zq8NlPwkeL9howQ0mnjaivcphRCiBVQ8OhdmA2H/pU=;
        fh=cFXUvbkMD7VF2gDGQjOIT8MCwKMOa2QJ4r6YS7pR+Hk=;
        b=a8uZGlMh0uNhpU6nX2B+ZKEiAnOAsLc7CfvplNhHBRlQZ6uuVZwnbFVQzxg+/03dN6
         B+WapPoyef/WUZ76I6IsH6SIayyOdkstR9u4IizbaoqVCuF0AlwNleVPVI8j1HntZOR9
         RYvCbCwmMQKlTFhMhLxoi/E0n87am07bkiCmEYf/74XyUIVDSNIRlOGxZVQfKx4iYFBH
         mDWOYe8NWaywC6HhagYnVhbAmo0CKRsTwDsG4ZNVGXZ9FBKax7uoRyKZI+isYZPq2rPD
         TYFhBWg9JhpjLouZ4YxhYkfyyrUiGauAndNlWiLCTlbFAcJWFlC8SkQ8rC9K4x4KMJAg
         HQvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358085; x=1791962885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Zq8NlPwkeL9howQ0mnjaivcphRCiBVQ8OhdmA2H/pU=;
        b=tFdpIIrclVTIf2KAJrHMWSy1N4TnKP8uAXP0bJtwqfH2mnGsNpfTZnVcKNjvDtwBM/
         vOENIf5Mb+iRERWPg2Qn2S+lxK3nMyWmJ+uq5O13vagsz1lCSW+RvCQtG54rer0ZXhYs
         pX88b12xc8quFypjyCJK0sIm+BrpG4LAzRF4hBJDVJnipYu3lwgTSwqLa/BF7exccDlo
         IzEQfbxo/NApI2FGip4YPvlStWqx0jQ1rWVAUOyAl6AkJREhXClY9XAF//oYTJtaRyoZ
         MD12QDz7vSUZPtvH7jqee+rdsjPUc0BaSlPHwD+S3Vi9WoQJ7BxExPV7DpDmmlv0LG5Y
         d99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358085; x=1791962885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Zq8NlPwkeL9howQ0mnjaivcphRCiBVQ8OhdmA2H/pU=;
        b=wiq5gamheOYYSW9XIOXhvw4KZcHnUoLTt7Ub6ULWHzzVgxNo0Eq5btZN4T7yJQRgDU
         KN5w3eyyq2wDmZbvZ97vlyg8Rr365BVp2uqV7CGkg8PBe/fM7SEaqXIG81hVD+HDGFZT
         pmW9Svfd1cuO+WwnRkw+juRAT84T6w037Rmso4ylXo8Nf5lI5vkbUF1vbGondxcuAOW9
         +TDZnZn1CMJ6W1zG+iy67nw+EIWKbO5sFk/pkoX4cVm1pNzvvmm8GW54InJpudy2WWyQ
         J/VuX14gkxNBmHK8ocRulHI6/ZwJo2wyi3+A5t0E77pTS8KkTliimXw6qT9X5GDv8KRA
         OLmg==
X-Forwarded-Encrypted: i=1; AKwUvBxkO4jmPiDmOxG3rkQBJbmIaaiqpQgmpmlnZzeihlB4h1VVMihifF0tDoojaSbrbrXYq7/0VU4D89ij@vger.kernel.org
X-Gm-Message-State: AFuF++mq19p6hAqE/mb4QwU9k5niW1deMPyG92pbCQWd70LARYkpyaFN
	npj234HMBkzPfW/a49mT4hniF1nCJRAyH0Bi6h8rD/1AKBJ+K5Ct744u/CBbQWgDK3YNn0bt92m
	15MvSt/9XZzPt+IJoLJIDNpgfK5+dm48=
X-Gm-Gg: AYBFou1JqajATiVqMwn2076Q6g7APgPKMrMOEZ7MeFPlDumnPfTlNu/g5AnD2XGaBoU
	f4/5HPmfpVh3Dy6fcE674gCmUBOajWo+U+9Tpnvx8MoufnvNSXDAuVZeoaPzBj6Uw/PoHPq3kVj
	P7nDVubmwvmzVVQEHVobklkaJik1E/beLRxFMuuJDp42qv/HT6mxc9JpneE9Fx8qvCrXrPcHsJ+
	OPvR2XFTdwgPSxXJYo2CTyOI2QXNx7VHeP8tFHnk3ZUm2WOpjWQhvQ6XW7lnrRpiqHCLUO7D97y
	gy0Gb7pXn+YWYdhJ9vNeAyzM1l9jsHKjyRt0HdSj+YCqsf5aomOFeZrXODHnB/WPh8nX
X-Received: by 2002:a17:907:6ea8:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c317bdfe7aamr131010766b.27.1791358085108; Wed, 07 Oct 2026
 00:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com>
In-Reply-To: <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 7 Oct 2026 15:27:54 +0800
X-Gm-Features: AclHuK9-vNcZxKo1OhLsfKqvuLHm0D_pklXBR5Ny7XJ7B7WuohnKFrZGwSHbsF8
Message-ID: <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Shawn Lin <shawn.lin@rock-chips.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=887=E6=
=97=A5=E5=91=A8=E4=B8=89 08:53=E5=86=99=E9=81=93=EF=BC=9A
>
> =E5=9C=A8 2026/10/07 =E6=98=9F=E6=9C=9F=E4=B8=89 0:28, Coia Prant =E5=86=
=99=E9=81=93:
> > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> >
> > Add support for this selection by introducing the
> > "rockchip,sgmii-mac-sel" DT property.
> >
> >  From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > bit 1 (pipe_sgmii_mac_sel) is defined as:
> >
> >      0: SGMII routed to GMAC0
> >      1: SGMII routed to GMAC1
> >
> > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > the driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1.
> > If the property is absent, the driver leaves the routing unchanged,
> > so the effective value is whatever the bootloader or hardware reset
> > left.
> >
> > The driver validates the value and rejects anything other than 0 or 1.
> >
> > This is necessary for boards such as the Ariaboard Photonicat, which
> > uses the SGMII interface connected to GMAC0.
> >
> > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20=
TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > ---
> >   .../rockchip/phy-rockchip-naneng-combphy.c    | 42 ++++++++++++++++++=
+
> >   1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drive=
rs/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 7843356a4dd47..f76b48009673d 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > @@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
> >       struct combphy_reg pipe_xpcs_phy_ready;
> >       struct combphy_reg pipe_pcie1l0_sel;
> >       struct combphy_reg pipe_pcie1l1_sel;
> > +     struct combphy_reg pipe_sgmii_mac_sel;
> >       struct combphy_reg u3otg0_port_en;
> >       struct combphy_reg u3otg1_port_en;
> >   };
> > @@ -212,6 +213,8 @@ struct rockchip_combphy_priv {
> >       bool enable_ssc;
> >       bool ext_refclk;
> >       struct clk *refclk;
> > +     bool sgmii_mac_sel_present;
> > +     u32 sgmii_mac_sel;
> >   };
> >
> >   static void rockchip_combphy_updatel(struct rockchip_combphy_priv *pr=
iv,
> > @@ -341,6 +344,7 @@ static struct phy *rockchip_combphy_xlate(struct de=
vice *dev, const struct of_ph
> >   static int rockchip_combphy_parse_dt(struct device *dev, struct rockc=
hip_combphy_priv *priv)
> >   {
> >       int i;
> > +     int ret;
> >
> >       priv->num_clks =3D devm_clk_bulk_get_all(dev, &priv->clks);
> >       if (priv->num_clks < 1)
> > @@ -375,6 +379,16 @@ static int rockchip_combphy_parse_dt(struct device=
 *dev, struct rockchip_combphy
> >
> >       priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-r=
efclk");
> >
> > +     if (device_property_present(dev, "rockchip,sgmii-mac-sel")) {
> > +             ret =3D device_property_read_u32(dev, "rockchip,sgmii-mac=
-sel", &priv->sgmii_mac_sel);
> > +             if (ret) {
> > +                     dev_err(dev, "failed to read sgmii-mac-sel proper=
ty\n");
> > +                     return ret;
> > +             }
> > +
>
> device_property_read_u32() should return non-zero value if it's absent.
> How about this:
>
>         struct rockchip_combphy_priv {
>                 int sgmii_mac_sel;
>         }
>
> static int rockchip_combphy_parse_dt:
>         u32 val;
>
>          priv->sgmii_mac_sel =3D -1;
>          if (!device_property_read_u32(dev, "rockchip,sgmii-mac-sel",
> &val)) {
>                  if (val > 1)
>                          return dev_err_probe(dev, -EINVAL,
>                                               "invalid sgmii-mac-sel
> %u\n", val);
>                  priv->sgmii_mac_sel =3D val;
>          }
>
>
> static int rk3568_combphy_cfg:
>          case PHY_TYPE_SGMII:
>                  if (priv->sgmii_mac_sel >=3D 0)
>                          rockchip_combphy_param_write(priv->pipe_grf,
>
> &cfg->pipe_sgmii_mac_sel,
>
> priv->sgmii_mac_sel > 0);

Hi,

Thanks for the suggestion. I'd prefer to keep the current form, because
it keeps "missing" and "malformed" as two distinct cases.

Current logic:

if (device_property_present(dev, "rockchip,sgmii-mac-sel")) {
    ret =3D device_property_read_u32(dev, "rockchip,sgmii-mac-sel",
                &priv->sgmii_mac_sel);
    if (ret)
        return ret;
    priv->sgmii_mac_sel_present =3D true;
}

- device_property_present() checks whether the property exists.
- If it exists, device_property_read_u32() reads it. A non-integer value
  (e.g. a string) returns an error, which is propagated -- it is not
  silently treated as "absent".
- The range check is done later, in rk3568_combphy_cfg's SGMII case, so
  a bad value only fails when SGMII is actually used. That keeps non-SGMII
  users (PCIe, SATA) working, and leaves room for future SoCs that may
  support a different set of MACs.

With int + -1 as the "absent" sentinel, a DT value like 0xFFFFFFFF would
wrap to -1 and be mistaken for "absent", bypassing the range check. The
u32 + present flag avoids that ambiguity.

So I'd like to keep v13 as-is. Let me know if you still feel strongly
about it.

Thanks,
Coia
