Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F82E719B
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304230; cv=pass; b=tejhM8YEFHBb51xaqztH+ihNJs4UuWnpTsvOqAehgqeQmCuCYGZkEMrgne39p/i+bBMEjV+fGV8VG5bqWLQZxY/22otuoZuTRPxrH5f5e4arGmFPUAIOgLbp2tQeerKPQrEX3pdkaxZBOrkLrVXR1l5+n9DIYOe3CpnYQOKaQfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304230; c=relaxed/simple;
	bh=FwoK1KY3nD1Qu6AMa5OA8mtSIBjWgPFlqGjW58spQ+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSFa+j4RyC2kO+38vQJT8TWaaHuQLKIbc91bNtU0yKCLPDHdD5L+d7Vhg1Gn7dKbJ75+2MKNIwx985CxBx02Q9nfLPntgIbUy32hfWaHQgpd9yj+Tz0If+k2oWJobZ7w/IrWuqnTpbFS91GnhHThM4wRl4oovbR7J3fY0Uyx5d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKCq4E3Q; arc=pass smtp.client-ip=74.125.228.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKCq4E3Q"
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c2e25574351so193779966b.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 09:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791304227; cv=none;
        d=google.com; s=arc-20260327;
        b=YsHJiQ/08vWCHWTHFaG9HsKYoZIKaWEQI8NwRHeXIBWJNNjqeNcQ8kgZm5qR9AggMZ
         1o0/hLVZEq7o2IEUZIuK3vBHghh1lRbtWa2mjpjWe8dl7PZIfYxEmDq/DWWgBbyMBWnk
         Nrfc7vCLP3HcE5e3d4snZp+sEKRdTOINrsXOS/GzjDUbIS7uIvKJ86Z/H6KAtXwwHhoM
         jVfjG+9vkPE5m3oKJi/Lv1540jjOmS1kB6TOPAWxVh0udYXYIbDj0EUhEkPedS70UwuP
         SePTb8fln9ZIJHY1T9zNRFyyAFRAi1Q4+NgxACX036OsUU+qxxJLyLX5Yfjq0j4RPTzg
         QwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=74ooKafJysXOQ8/oYCK0iAifCQLvUBwaTgwQCS1kaLE=;
        fh=9CStMklmvmkTWyFztEUVpg+uCpEV5p4zs5IMIKX1QYk=;
        b=im8caAZLkcBhwD+3j4UBIxuCyttsmNEtCgbt/uWsjWH8PkFX2OecKP5W8q9E4czF9c
         jeoBUHp4znHorz0lshsGw22xn9qCYCvlTHuY1XyXubskoBu1CVXi2iuwVQeKLLu9EZBB
         FGvDElp7gcGsIKxkg56dR+L3+YIbXRGbCUDQ+LWFRniU0bnw2aIxSCa9tu7sHwxwpry7
         F3XU645Fb/j9DjjlvY9jLKi3KpPZAFMTHBSpZxm2M4WpEvcrljE2lXjauq5vpA0YUpkS
         SZOWMM2NrVrlFl9TX3JArz2WxX96vD6GeJuCGOc0qBOX0I7fdUopOYnbbYKytU5TPyur
         Rvwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304226; x=1791909026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74ooKafJysXOQ8/oYCK0iAifCQLvUBwaTgwQCS1kaLE=;
        b=IKCq4E3QWdx0TRQTi+Sfz5fbF2CgtixEmRfCL45zpD7ZNIUZCkWCQEXUHlIFG3Jtvh
         q2nk6wAaFWXwP5+Xs+qNNXOXVWkBxnC5E0MOnkjFDIJ9uv2yxQFQJerfvcXkZYZY/exa
         lT7P6RDrCNFPlz/bgn4sWTqHoYZCl6TuEn6fA4Vujp3Pipn1UdzoHQpFrd+DmBbz9wuQ
         E0/Qar4NJQqvOupomBT2yCGiCJPCxnoVUesbL7OP+0z2yYzezY/fx5iwBtlZ6fZoUfKu
         /iKp2fkl5BIBPQUyfAn/tO4r3bqaMGtk6owdlYDF9k3Br5fqVWtXtyU92UTBlpmPbCHd
         Expw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304227; x=1791909027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74ooKafJysXOQ8/oYCK0iAifCQLvUBwaTgwQCS1kaLE=;
        b=MpcpT660/F85Iwyk1n8gW7czFD7Gk9Eyvr96FHXv4Tuf0nS6DOkBCiaqWsogl3gixT
         CXUMQLAYmwzNlQ+m5ckEmdoPt2WtvuJYOsVRQ8ewdii6vYGeec8q5dD4i6PhYE7Choe+
         sxn5VaiuarcP/GZ4VSDMewxZRcMVB9tBHNHxkQCbgYHfiUu3TiZdfyDSekfSbtVT5o9x
         DdMfUmTQ4XJ3b8tN5cMcr1a1r2KGdDguO8o5E8iH4WSEPA87qZrXq20Iihsr1XTNPm4A
         HuJ+umcLjq1cqaXHvGTSMtxEeisD3JXCsKErfYTAvYbY1Me0Obgs56WqnGpEU4kwews7
         VGjA==
X-Forwarded-Encrypted: i=1; AKwUvBzQt9XgHulkxDtHUkTd2h9BXyCnEY2aBx2ytVIp2tDCWdyL9GGmSimW1XJt7blA4fzJZHv8ZioKHgzQ@vger.kernel.org
X-Gm-Message-State: AFuF++nKUrkiRVXhpouZOGPOc34uZx31H7x63eTeOERh02aa3XFBOFxc
	YUomia9AMMPA1u3djeOXAazOZWpW6cV930QFJ1st1urzTNpOrIf1JQTSh4/2Xago2FlI5RVm/+k
	Px3/R4/GLd74vivjSd41LEtOFIp/NQd8=
X-Gm-Gg: AYBFou0TL8CoK9mCJlnr0YhIIL8p+LzuvcqGvX6fdawb3F7NeIpkhP5FOInscmwE91T
	DWpUTcyEYctwIPywb1ARDtIsxiW3i4w+iM+RQxWbFONEKuW6gJMS3uixNeRhlC8P+O3kyVza1gz
	JiPYteeTLPgEQbdjB8itDLV5kE9wUn120rKTiW5K+DQRbFp5oz52STUtC2LMvEZnUOxObwsxMiH
	fXKhfocWT7VdT7wOdievcoC6j/nNr7w7DKv/g+hP/JJcEzuEHVyk7TF9iFaoxa6TBkbMG7cRCsh
	XBptbjgJFyzUlVy54pSnd/fu0Y2u4YKx9BLDdgXvOwMGRmwS2KL1VFndNQ==
X-Received: by 2002:a17:907:944d:b0:c2a:fd39:f231 with SMTP id
 a640c23a62f3a-c2e6ed68303mr1020357266b.26.1791304226334; Tue, 06 Oct 2026
 09:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006074749.2010233-1-coiaprant@gmail.com> <20261006074749.2010233-3-coiaprant@gmail.com>
 <08736f4d-a728-4b1e-a28e-882648a412e0@rock-chips.com> <20261006161403.GA2469169-robh@kernel.org>
In-Reply-To: <20261006161403.GA2469169-robh@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 7 Oct 2026 00:30:14 +0800
X-Gm-Features: AclHuK_1XvsTomk5pZfZ6KjwFLcu1GrCsrDj9BN4LAny9Xe_1QYEOW_C3FucYAs
Message-ID: <CALj3r0haEf-oGo3QW5XVaz_F=oTNX14PFs31Owkq+79Vb8qjVQ@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Rob Herring <robh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=887=E6=97=A5=
=E5=91=A8=E4=B8=89 00:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Oct 06, 2026 at 10:53:22PM +0800, Shawn Lin wrote:
> > Hi Coia
> >
> > =E5=9C=A8 2026/10/06 =E6=98=9F=E6=9C=9F=E4=BA=8C 15:47, Coia Prant =E5=
=86=99=E9=81=93:
> > > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> > >
> > > Add support for this selection by introducing
> > > the "rockchip,sgmii-mac-sel" DT property.
> > >
> > >  From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > > bit 1 (pipe_sgmii_mac_sel) is defined as:
> > >
> > >      0: SGMII routed to GMAC0
> > >      1: SGMII routed to GMAC1
> > >
> > > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > > the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> > > remains at GMAC1.
> > >
> >
> > Thanks for your patch. I have a question below, please have a look.
> >
> > > This is necessary for boards such as the Ariaboard Photonicat, which
> > > uses the SGMII interface connected to GMAC0.
> > >
> > > Out-of-range values are rejected by dtschema, so the driver does not
> > > duplicate the range check.
> > >
> > > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%=
20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> > > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > > ---
> > >   drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/dri=
vers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > index 7843356a4dd47..7b867e7520064 100644
> > > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > @@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
> > >     struct combphy_reg pipe_xpcs_phy_ready;
> > >     struct combphy_reg pipe_pcie1l0_sel;
> > >     struct combphy_reg pipe_pcie1l1_sel;
> > > +   struct combphy_reg pipe_sgmii_mac_sel;
> > >     struct combphy_reg u3otg0_port_en;
> > >     struct combphy_reg u3otg1_port_en;
> > >   };
> > > @@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
> > >     bool enable_ssc;
> > >     bool ext_refclk;
> > >     struct clk *refclk;
> > > +   u32 sgmii_mac_sel;
> > >   };
> > >   static void rockchip_combphy_updatel(struct rockchip_combphy_priv *=
priv,
> > > @@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct devic=
e *dev, struct rockchip_combphy
> > >     priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-r=
efclk");
> > > +   priv->sgmii_mac_sel =3D 1;
> >
> > Before this patch, SGMMI was routed to GMACX depends on bootloader(if
> > setting), or routed to GMAC1 by chip default. Without knowing any
> > potential candidates setting it via bootloader, you might not force any
> > DTS files without "rockchip,sgmii-mac-sel" to pick GMAC1 as fallback.
> >
> > Maybe you could just keep the SGMII route as-it if the property is not
> > present. Meanwhile, should validate rockchip,sgmii-mac-sel is a valid
> > value passing from DT.
>
> That is the typical way tri-state properties work (as opposed to using a
> boolean). In that case, no 'default' in the schema would then be
> appropriate.
>
> Rob

Hi Shawn, Rob,

Thanks for the review and feedback. I've just posted v13, which addresses
both points:

- The driver no longer forces GMAC1 when the property is absent; it
  leaves the routing as-is.
- The driver validates the value and rejects anything other than 0 or 1.
- The binding drops 'default', since the property is tri-state.

I'll avoid replying to each comment individually to keep the thread
clean, but please let me know if anything is still off.

Thanks,
Coia
