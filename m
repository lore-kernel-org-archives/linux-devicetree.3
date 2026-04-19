Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685DF207DF7
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776595139; cv=none; b=ZU6rwLrwiCf/+ZKRM1l44rGFLV7qyX5/bJeO3OHU0SfPvOidBGFO/ZjF1EuZy9Js5tjJSd8Z2JiP1BhwO7Y2bv4pOD2csekCUFMc60ErlLl/fhPQeVIAto4WiY7ZxnIDg1ECqH2gyzP1N7iOjk+jqP5tZQtqInzWA+JZbpIvpFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776595139; c=relaxed/simple;
	bh=YF+RdPrpjlfkCj61O6WOCKrSenzgxhuMzg6jRTpJ84Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVXxJdDZX1Jp7zbkT1ToSd5WAEYWL4xpfubvhXtVsys14LBpbWhDdwTWbXZCVLNYbQ9DD1scIYRHV/OdXV/+20MogldFI5EzADoamO2sxG2CPJKENJM+IZFO94qfAbBt1laNB0jvbgRT9xXiPbQQGcCIAtasvALcDYcrvD8Qao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvMQW+Ce; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvMQW+Ce"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so1713409f8f.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776595137; x=1777199937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSNMSL2yf7R55Mkk0U6fT14ULpUWkywT0FjbSBd+zG4=;
        b=HvMQW+CezOe8Fy0QixWceOUJk0b5dSpxTXI9f37k/MN369MvlY23bAaFXgYh/6x5L2
         QsFiCSZKJV+ptOWnNxU4t/Dr64PogW8YzWWE7vtwzMukUFnvLVDb/mD5D8CiZGFxzkyE
         XF7bRPNDi3U2xcB5zQyCvQi9EVDgilCw3e45RllqjCMZnLppRUOdb6AbBgZw2RSc/hPc
         HL37XW0WLUOqVhe485VJ2Z55f7aglUxOQi9wbxZYuCdvL+mfA7cr/+bWjHibr3kYtXfY
         8OIR9igXmobHBXmu74gCAM5uPdDhm13G904th4zdCJhLINmM/QMXGOOtHUd59esb6v6T
         BQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776595137; x=1777199937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aSNMSL2yf7R55Mkk0U6fT14ULpUWkywT0FjbSBd+zG4=;
        b=FRIvyN9A2GN6s26bDWZhS6ME6lJho8bQMahWgpf7Yes8pe6UFFBzMnftVkQRHoYkyc
         vveAdXncadiCgjCBdhH8LYwl4xAoIWGkeUaYawShWCAsV9QIBfCcnMMq3rxfhgrfuZVj
         Bv9/xE365eoymgIy8PENRpR17Yzz59LBYVby1KwheHsAbIVdrPgBfagRmljFD3qZDMLC
         Leufjcg6D/HPWBxXnhfmOnizXxKzdlJ0fxtXpEiH3X/D/5zEtka7neF76U7OBNdApB6H
         bl9PluuPtrtmWSrHHXdcF0Pcz+sz8FmOKWOLAI9+GpbktJkQUVyqZdTLV8mXdnvGrY4a
         nitQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iabTbYoR3WHNw1jFS/Rj9WW9kSTYlwnUZRZx3VFiHDk03iqwlb60HiDEFKvqRcamURjYF4QR6biI/@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJeAkTh7kvJYKAIqJ9UnfBgfJEW81pgCR03cIRjGDJVFfJrfO
	PHbVdwbg7hYmb4fbZjQOmyrF9bglG+KUaTH8wSLOWKWfrKwICISsjyO3
X-Gm-Gg: AeBDieszefPnYvpjuODltRgQntgcswv8q+wcvybXsdGZ/YWwRa07kMTwZU5dMnTmP+F
	OeABQ4DPahBqXjAWPZPJe1H9SFEhST5FQTjoXx3Kvlal2xvrScU5ocxcN/x/ideCC+SXdKN8+FC
	zUKiy0Xt/9D4MenKN/nZLkP7ibyLvIML9k6GItXzc0WQqQGX8+iDiHu98LHgVQ6WOeTr/JxGwUO
	bEvpEBetfEUpVkcXYWJF3UBx9EJKSd6L3E5wlX0gp8372L5FkpheG1uLtHNQ31EY9KJuZSwwoeL
	2wrKqCjEx/9ffxEaMwmURJGgn+z9DwyyT73EHDOga5nf2r2DqZ27PC7rHk983JMTqhHk5KBL1w2
	iAvudXkos5DIImaYdtR6Ze+jWKFnZVJKvdXCwGG/FCp0fS2ARUXlhc0JLuMrnz+dO59L8crYrr8
	sgUG4HJQB+vFdU7H5nl5sfR7oERQ3qWehdZiCfeuQY25Pd1tfI7pVtUt0=
X-Received: by 2002:a5d:5849:0:b0:43e:a8ad:975e with SMTP id ffacd0b85a97d-43fe3dfbedbmr14792261f8f.27.1776595136543;
        Sun, 19 Apr 2026 03:38:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46898sm20259211f8f.27.2026.04.19.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 03:38:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm: dts: allwinner: t113s mangopi: enable watchdog for reboot
Date: Sun, 19 Apr 2026 12:38:53 +0200
Message-ID: <ar7Vj6maR5aXgp7KQK7v1A@gmail.com>
In-Reply-To: <20260418135519.16e41490@ryzen.lan>
References:
 <20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl>
 <2825865.mvXUDI8C0e@jernej-laptop> <20260418135519.16e41490@ryzen.lan>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 18. april 2026 ob 13:55:19 Srednjeevropski poletni =C4=8Das je =
Andre Przywara napisal(a):
> On Fri, 17 Apr 2026 20:19:20 +0200
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> > Hi,
> >=20
> > Dne nedelja, 12. april 2026 ob 19:42:10 Srednjeevropski poletni =C4=8Da=
s je Michal Piekos napisal(a):
> > > Reboot hangs on MangoPi MQ-R T113s because no restart handler is
> > > available.
> > >=20
> > > Enable the SoC watchdog whose driver registers a restart handler.
> > >=20
> > > Tested on MangoPi MQ-R T113s.
> > >=20
> > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > ---
> > >  arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 4 ++=
++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t11=
3.dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > > index 8b3a75383816..f0232a5e903b 100644
> > > --- a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > > +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > > @@ -33,3 +33,7 @@ rtl8189ftv: wifi@1 {
> > >  		interrupt-names =3D "host-wake";
> > >  	};
> > >  };
> > > +
> > > +&wdt {
> > > +	status =3D "okay";
> > > +}; =20
> >=20
> > Move this to sun8i-t113s.dtsi. All t113 boards have the same issue.
> > Watchdog should be always enabled on ARM.
>=20
> We actually have that line in U-Boot:
> https://github.com/u-boot/u-boot/blob/master/arch/arm/dts/sunxi-u-boot.dt=
si#L22-L27
>=20
> IIRC, the idea was that it is *firmware* that chooses the watchdog, so
> the generic DT should not be the place to set this.

Why would firmware need to select watchdog? We only had issue on H6
with it, so I kind of get it for that, but in general, all ARM based SoCs
have it enabled by default which is IMO how it should be.

Best regards,
Jernej

>=20
> If people use $fdtcontroladdr as the DT source, everything falls in
> place neatly, no need for changes or runtime patching.
>=20
> Cheers,
> Andre
>=20




