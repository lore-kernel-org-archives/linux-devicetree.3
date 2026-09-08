Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A434A2E17
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859097; cv=none; b=hGUrn+zcppYaSHkOugWE9AV1FUFIzpxm/4eEgv0govae+gPibpKm4+3vnVi7LYUGofUs6jQdC2XmEY2zMzDGAie5LCb7pKSgERJNN2FuXAFLaRIqTiMvPvwO5J9MKb9EL9GaDxvJUdCtJ0RCEX2U3+Ru0O+eCUHGBrPfaeKxvko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859097; c=relaxed/simple;
	bh=fq0xQsDyb2ik3dZe4uP1ij79Em4qxOoaPFTBW2VxLV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fv2yvfAW4BVJfEHqjlyAEL43qcfAaFycx3RXjIAmY9RvtNJbIzBSXvyYwrLta7pcUezKBK4aSNHpfGvemHnm/AGZMpUEGKO8WbDPeNEHOj+SYRHDN+vBk3V9SpSuddM1Q8Uc2kfP0XcqC8OU8yLy/w36gmiHnwKuaH1auK2o2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42701F00A3E
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:18:15 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4af730f8aso4654499e87.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4SBuuGby3FvgiL3nf1z2338/KKJs5WhnGdgRiTg71h19C/BLF4U6kqFxgAl/JJo1GAnwzPS6Xk7ua@vger.kernel.org
X-Gm-Message-State: AFuF++kwYqE/p1ccHO41o/TnlyDWF959AayC6o9oYTp2Lvyx7aPVYUzS
	1G4D1HgWFDVURc/MUiwOyZOfKRpPnpCY8C0HGKsxC0sa+KcmfRwj811D9wyay3d/JEFS02dTTL3
	3VJ5R6aOogtEvzf/vWRMUASCFrz3FO10=
X-Received: by 2002:a05:6512:3503:b0:5b6:4ae:8c02 with SMTP id
 2adb3069b0e04-5b61705c1a5mr4219196e87.29.1788859094494; Tue, 08 Sep 2026
 02:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-ks8995-to-ksz8-v9-4-8d8815a91bd8@kernel.org> <178883938748.219967.12302213755391446012@kernel.org>
In-Reply-To: <178883938748.219967.12302213755391446012@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 11:18:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLmv7-hkXDffi=Z4zYpjcArLjUEnB+YAVbd3Mgqu2s-MmA@mail.gmail.com>
X-Gm-Features: AcwNN1XPvHC8mn8i7RF-KwxIUTvQeolrZeAaU7htbGYDUzfJd6lLIOKyWMxF3gg
Message-ID: <CAD++jLmv7-hkXDffi=Z4zYpjcArLjUEnB+YAVbd3Mgqu2s-MmA@mail.gmail.com>
Subject: Re: [PATCH net-next v9 4/4] net: dsa: ks8995: Delete surplus driver
To: netdev-bot+sashiko@kernel.org
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	marex@denx.de, horms@kernel.org, linux@armlinux.org.uk, nb@tipi-net.de, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi netdev-Sashiko,

On Tue, Sep 8, 2026 at 5:49=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wrot=
e:

> [Severity: Medium]
> After this deletion, is the ambiguous "micrel,ks8995" compatible handled
> only as a KSZ8995XA?  In ksz_spi.c the ksz_dt_ids table has:
(...)
> Does that mean MA silicon now gets programmed on the XA path?
(...)
> Two in-tree device trees instantiate exactly this compatible:
>
>         arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dts
>         arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
>
>                         compatible =3D "micrel,ks8995";
>
> so both boards move to the XA path and to a different tagger.

As mentioned before, both of these boards use the XA variant.

I guess I'll just add this information to the cover letter so there
is context about this.

I will look into resolving the other comments.

Yours,
Linus Walleij
