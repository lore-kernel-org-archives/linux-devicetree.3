Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871AE375ADF;
	Wed,  1 Apr 2026 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043073; cv=none; b=NO0yd86cHS8t5b2B2hsqqdilapomdVNp3jlo2I6nomtnO6VzU7bW7EX+ZZCoP9tPP7mW08Rgoqm84LJKAAnH9slez6lNNK2Hj/FIs2I4F7eqyg2oQCkGQkN1gOtdO+yKqQybAleWtKgqYl+n6UbfXdsy2/30lFgqjDq4SjOeF6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043073; c=relaxed/simple;
	bh=eKIZZEUO/t2tOdWWu/hRCbLrH59vp6rYN9CVo7goXCY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bfw3CY00GGG3Eks3lhJv171UsSG6kDraT7dq7dnt8PVvDsFxl/je6CA+KEDQjzVYxZSa473bRFwaBbJvbZRXM/WT0CrRbDOHfqkm6avdHUE8V5tb3OqW8BIc6+3FrQxQaCQqo8cxQ/8NhbEMaReYuolmNw8BOwqstdWizRMVcoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pyHRbovw; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pyHRbovw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PxkBWy1RiMT/07EKwYFoIvm+IfBD6Bsnz0wcULDId4k=; b=pyHRbovwKj2zMxxAPkvZaa+tpe
	IFkvI6VPffo9zA/8u3NncwcbAnjbUOg4KwwRtSDVUUuicEC48SsPs7XpROu7hsgFunPEDdv3AZZDy
	+GX+0T7LpjE9+tPmVc/hB7tCgBwRnqqvnaQodp04FDXQSx7pbo01xjfBx4OLmWR1QLnWKd/jM9mUE
	ANtocl88GI7oy1wf/tyTsX5es2kMjhiHpUFS+wGbPR6X605YsNBg0bLkKiNQMvozxGbuyPJv31ezD
	zm526Jb8c8owTnl4xrZ97V5iA2zejb44zxNEMxE3qZJibb8OXPB+SwpYyGUrJZPoq3ow1etdHyORr
	cSJh3+FA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7tmv-000ABG-2r;
	Wed, 01 Apr 2026 13:31:09 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7tmv-000F8Z-2J;
	Wed, 01 Apr 2026 13:31:09 +0200
Message-ID: <fc375090851c17e069d7271f99ac4f75490a9a92.camel@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: dts: freescale:
 fsl-ls1028a-tqmls1028a-mbls1028a: switch mmc aliases
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Alexander Stein
 <alexander.stein@ew.tq-group.com>,  linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 01 Apr 2026 13:31:08 +0200
In-Reply-To: <bfd19beec4ccbe296cdc1da865b15caf3ad1e5cc.camel@ew.tq-group.com>
References: <20260224152523.570057-1-nora.schiffer@ew.tq-group.com>
	 <bfd19beec4ccbe296cdc1da865b15caf3ad1e5cc.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)

On Tue, 2026-03-17 at 09:29 +0100, Nora Schiffer wrote:
> On Tue, 2026-02-24 at 16:25 +0100, Nora Schiffer wrote:
> > All modern TQ-Systems boards follow the convention that mmc0 is the eMM=
C
> > and mmc1 is the SD-card when both interfaces exist, reducing difference=
s
> > between boards for both documentation and U-Boot code (which uses the
> > same Device Trees). Adjust the recently added MBLS1028A Device Tree
> > accordingly.
> >=20
> > Fixes: 0538ca1f102d ("arm64: dts: ls1028a: Add mbls1028a and mbls1028a-=
ind devicetrees")
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >=20
> > v2:
> > - updated author information after name change
> > - collected review tags
> >=20
> > As mentioned in the v1 submission, it would be great to get this in
> > before v7.0, as the TQMLS1028A/MBLS1028A was just added in the current
> > development cycle, and we'd like to avoid changing the aliases after th=
e
> > DTS was part of a mainline kernel release.
> >=20
> > Best,
> > Nora
>=20
>=20
> Hi Frank,
>=20
> can we get this applied, so the change makes it into v7.0?
>=20
> Best,
> Nora

Hi Frank,

is there still time for this patch to make it into v7.0? If not, it would b=
e
great to have this applied early in the v7.1 development cycle, so it can g=
et
backported to 7.0.y before anyone starts relying on the current order of mm=
c
devices.

Best,
Nora



>=20
>=20
>=20
> >=20
> >=20
> >  .../boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1=
028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.=
dtsi
> > index cf338b2e80064..426a81e1743f1 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dt=
si
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dt=
si
> > @@ -17,8 +17,8 @@ aliases {
> >  		gpio0 =3D &gpio1;
> >  		gpio1 =3D &gpio2;
> >  		gpio2 =3D &gpio3;
> > -		mmc0 =3D &esdhc; /* SD-Card */
> > -		mmc1 =3D &esdhc1; /* eMMC */
> > +		mmc0 =3D &esdhc1; /* eMMC */
> > +		mmc1 =3D &esdhc; /* SD-Card */
> >  		serial0 =3D &duart0;
> >  		serial1 =3D &duart1;
> >  	};
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
