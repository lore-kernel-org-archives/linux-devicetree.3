Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC4F47CA72
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467795; cv=pass; b=h3v7hPvaPwmAJtTFKkFqNGb2T6dCz/0Sx2PCdPY2uDXQkoJstaklwD105rGKlDGGR6aDu7j7U+SZhRrhDKyA/g7mZh9ySBEcw9oy1XsG0Jw1wZ5IGCXx1vcufygGDB/Sf4klBVJvZ3/Xhdj0+C6vAtt0WPEZYq1nAIF5sAIcm2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467795; c=relaxed/simple;
	bh=c3RIJ2i8Y04OYsadwKNxN56yhveUJrAsHw56HkKOmYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otdsMlvuqTO//46AYdu6h0jJXRR/qyBxklQ+5MNpuSYvL0+oo8NlLLQ4IBeQTVXn3b0Mu6jJL+nTcYI/rVBDnkSyzD9utnIoT3xePUtr/mV7quOsF00xs1kqcuNgtCmCDPwe5h239jlTH/ArSnpC8orQI0Co4R21vxNd+glzQvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BD8BCWYb; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BD8BCWYb"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c29440ee0e7so201359266b.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467791; cv=none;
        d=google.com; s=arc-20260327;
        b=fL3tqClcUCjTbQWPWx3FxvWC/SwroEYp96xeW2Ae6PM+Z1aTm3mJNQBJZ18JctCVWF
         9x9iAzxYMuA5I5hTiMH7Ji0TG3Fyu5K2b9RsZpKgD0F8VsItLLv0aBz3lSYmznkIAMxK
         CFbmkq34Vp6OsdpH8XklKIWBf9lMJyQHUBdTOiUDpu68uOXH6mY4owKeHoSFbx/6N4KM
         p6toy5Cg5iF8w/9pwPPK5cBF9D6SsxoMmNr24MCeiG5Rbp8Mu67YlZ/qpb7fF8Ydwfiz
         mkYFbIR9H8iv8uVlf9CQ3TLwRBx439ClBeKNX00I5c0h18IzZro/gzs3sBBMNnP6dJZl
         lbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nYoTXRWm9dXxQab97Avfkm/YI6364EPnV/puvJGLZtc=;
        fh=HEJUCS4eHcNhRgHvULwVs4ikgvrDiGrfQCt3z4I2nYc=;
        b=F760cCnXZcqD/3d603eL+5UpsGiGlH8Ig1Ti+viXt+kRsVVc2tGSIzwivIfknXupDv
         OEdBzQByiqKTiorBx2mDJW8ZLI89d7ByNLzObxyz/PzZ1H1OTLEiDhk7hBvxCS97p9ru
         EaUAqcwxHvPvpJJMCLQXj/Nl6DiJ+RHbiW4h/hgWiM7dy/MTA3Dbtr9a9buLGscLAYQq
         enWgVoPr20Yn5rZX+1vjqa3TFGJD05kQm4BbVrKOX0xcp2Ur5uvUvBxNjkpEXqZaB5XU
         V91iyf1X66bQayGZhjkSEdukuezImEMRNE78Kwqn9enTVysI+D8+nMvppY1UkLg83Mtp
         qJPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467791; x=1790072591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nYoTXRWm9dXxQab97Avfkm/YI6364EPnV/puvJGLZtc=;
        b=BD8BCWYbg/2D6ELs1XNumO73g7sbmRiB4WAMxDPiToc1VZH2i+07pszYcoto91GCXY
         ArGwZHhNqEP5889Yg2n28jOKLcwthlZlYdybB6pm0/hhBTFG7QCpJrECo/Uj2O3MTCHk
         j83wwHysm6Ikl3f7jPb7EgHswjSGL0ngI9QpvCXYzrtEPq/BQsVoDyxXECmQqeKKJrMP
         B8MNqasHbfvHd5Myw2ix2+naDoTWxgYCH9xYVl6mDx/Igns3/sNkYT6vb8kH4RuyeUrA
         m9MapE6PU8l8j7LCF+FWO52q69vLRYIwv4jqcQbbanJbsGI1D/7j4HiVAmcR5S1ElAyl
         s0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467791; x=1790072591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYoTXRWm9dXxQab97Avfkm/YI6364EPnV/puvJGLZtc=;
        b=SoaExPRsL/9Tle3C/RZ5mK0iiCtuEN6R0DOIXPk0ZDTmwmKqjnnhYUi7waWRTCQHmZ
         rhq+rltawAMyc1bb2Pzt9t4PqhQA3axh0qZJILHqyX18NtFOhUT/BONENN7X2ovmaTxu
         ToEIiVfF8pe2dDvSnlkQ0R3mYsGHuJpJFRhxKNQzBiTT66DT88SHR7Y0L+xOgZV1Guux
         WNcQIGoiFo2nP7HzGwPDztzNAT8LDstG9uYzMoICejXshkDprPBd4APpQ5cZHfYZfdnJ
         +qoo/iUMgd5bRm0KZ9Rb01AV4Tikn+rj10q2DR8z5rmidA0biBN9xYpe0cL67sVFM2VV
         +Arw==
X-Forwarded-Encrypted: i=1; AKwUvByGt+N9ir2+Txuvvdvze4lbmdrnEJzmZCoDXZ5/ADkqUHwLqlRCLucg6I4RsBGm4/CtD79r3GSHm90Z@vger.kernel.org
X-Gm-Message-State: AFuF++lvy4IMRaPAOfdyMyr1BuURxd53D66iRtm/yVut/4TMBe7CEnMq
	XBcFErviCYpw83+iqIDR80F5RU3502CiFYAfGPKIGzNqB8JczjCjOi5q8C9/Bb/FhRQvsgRzR3/
	gcLkwJRhAQHRot4NPsfaSLGLaXk1BcYY=
X-Gm-Gg: AYBFou2rUAKpPugUi5MFpbtNyl2h0G2Cii0WKxvqoqXC3CkbJfHQIYc4d0VDWOcEN5u
	cFApdQq6andJKb+ffJJyLQ7dPsw6MzkmiZgWbdMuXsLisY5slvNLa5Werk0uCWgrXQInG0efQWO
	KQaJTDu0vtMbJVobQDXeKuHPe68ds6qh5r267COXxYIphV2sekDB/IFbm9BQd+0WGWzop8teuBh
	MW/REisObqzhztmwq0/WvlG/Za+Xg2esZsqvBigfg0offTo7Y0OOSs3BirvmaWqjFp9U3oBGlm9
	96NT54K503NMsmUCp15Ch1ESAaAOD0YF8KWF0KDGWqFprjKqxmYqZk40xw==
X-Received: by 2002:a17:907:3d56:b0:c25:6c9a:88bc with SMTP id
 a640c23a62f3a-c29b87339e8mr775899466b.19.1789467791028; Tue, 15 Sep 2026
 03:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913185849.907479-3-coiaprant@gmail.com> <178941747711.22033.8495700704733189874@kernel.org>
In-Reply-To: <178941747711.22033.8495700704733189874@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 18:22:59 +0800
X-Gm-Features: AcwNN1XIwap_FwM1kV5GNhNfjY4yI0txPnJoW2RyomCTNzqIwhUfgmMQ2h9aiaE
Message-ID: <CALj3r0ge_AVi=jrUZh_T8cEt954S_Ah7Hi4QxkccjEm6zug_Ag@mail.gmail.com>
Subject: Re: [PATCH net-next v5 02/11] dt-bindings: phy: rockchip:
 naneng-combphy: add rockchip,sgmii-mac-sel property
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org, 
	linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz, 
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8815=E6=97=A5=
=E5=91=A8=E4=BA=8C 04:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> - [Low] Concern (validated as NOT a defect in the series context): the
>   binding adds `rockchip,sgmii-mac-sel` while, at this commit alone, no=
=E2=80=A6
>
> --
>
> dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel pr=
operty
>
> This adds an optional rockchip,sgmii-mac-sel property to the naneng-combp=
hy
> binding so a board can select whether the RK3568 SGMII interface is route=
d
> to GMAC0 or GMAC1.  The property is restricted to the RK3568 compatible v=
ia
> the existing allOf conditional and defaults to 1 (GMAC1).
>
> [Severity: Low]
> At this commit alone, is rockchip,sgmii-mac-sel read by anything?
>
> rockchip_combphy_parse_dt() in
> drivers/phy/rockchip/phy-rockchip-naneng-combphy.c does not look it up,
> struct rockchip_combphy_grfcfg has no pipe_sgmii_mac_sel descriptor, and
> no in-tree DTS sets it, so a kernel built from exactly this commit would
> silently ignore the property.
>
> This resolves itself later in the same series: "phy: rockchip:
> naneng-combphy: add SGMII MAC selection for RK3568" adds the parsing
>
>         priv->sgmii_mac_sel =3D 1;
>         device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sg=
mii_mac_sel);
>
> along with the RK3568 pipe-GRF descriptor
>
>         .pipe_sgmii_mac_sel     =3D { 0x0040, 1, 1, 0x00, 0x01 },
>
> and the write in the PHY_TYPE_SGMII path of rk3568_combphy_cfg(), and
> "arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port" adds the
> first user:
>
>         &combphy2 {
>                 rockchip,sgmii-mac-sel =3D <0>;
>                 status =3D "okay";
>         };
>
> So this is noted only for the record, since the binding and its consumer
> being split across consecutive patches is the normal series layout.
>
> The remaining point is a design question rather than a bug: is a raw
> uint32 MAC index the interface preferred here, or would a phandle to the
> GMAC controller node be a better fit for describing the routing?

The property maps directly onto a single bit in the combo PHY's own
GRF register (PIPE_GRF_XPCS_CON0 bit 1), which selects whether the
SGMII lane is routed to GMAC0 or GMAC1. It describes a mux setting
inside the PHY, not a relationship to the GMAC node. A phandle would
introduce an extra dependency edge between the combo PHY node and the
GMAC node for no benefit, and the raw value matches how the BSP and
the surrounding GRF properties describe similar muxes.

So I'll keep the uint32 form.
