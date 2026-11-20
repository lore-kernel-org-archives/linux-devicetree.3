Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199775;
	b=VmQmwc32Zk8PA612p1almMR2LYHDA5e3Ivy3CTdzZLIjtI2bR3k25jG0SDXS+tABSWFR
	 gtO9FqYxzXzzIQChUVfkVkEQsqVYdLNQg/HHb/77MzR8eeFl6S7H/8CJ6q3FrXCyXP6BG
	 SOxgeZnBJ+/wl1Dsw7MfeRLe8HopsognDXCTcwXBDdJ1EiQn1Jf60Iz9ApXtr3k1Qn4Bn
	 dezezv4UCCHDVSEP4quj1hafszdY2t6CE+4artdJ7569PGbJCpwpYoCisRnFcOuTAoSnS
	 iRKlh6naWjxfgZvxw1+JFXqFzSY2xQpIjGDn5bXwR+Yqsum7oB4e9drTtNhqco6EseQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
	b=kjZ6N+6hFRuU5tz4pDAoBRnDqzo/LbksLSM2ODzsbVuyaqyqKVA3bGEjat4/jFeTtbVQ
	 lHMC9s/7klCfa2Af6Z2B58lSfWW7VmxISRqMPqPn6j/aaOf5RJm7XOI9kW9z6Bz3OIGLx
	 8ZSpHl2WfN7MvVsWuTmjAXaAC3Y/l7dqyCgAnu6kUUeKJOUoH++c17SqLitpLFieDQmLZ
	 qARjSqluX7zr3ChrTLC3DlskfOBjDfze9qdVxJ29aXieEPQJiqNg8xbD4kW57eGjhBmWa
	 9VUS0tFDwj6HSxs57vqtcsXwGsYlIc/dc8QQt36p/2nM1//uTSTkfD/FS5YwRw6f4Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhhhzOot;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B9C60A261E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18B9C60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhhhzOot
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so844011f8f.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199770; cv=none;
        d=google.com; s=arc-20260327;
        b=CM6PLs2kZsPMd/EeVoEuhkCM7kXXZysWHpJQcJbGKDDUD6Se0X5RM78Enb2WwDkrzj
         5p1JGW4npZKD+K/vZgjoxTQESZmiFvs0aTqnVkN7krXngUkly5ch9IIJU8eMYOEagyab
         SG+fh0oltSxoavq5N0vdRk8HAiED/usijwnZQPS55RPNofR3gh54s/ika1+kFGSO8f+2
         dcGU0GVN35632vSzRUboNT00rCtBw8t7shVsqkQ6gpVtG6bj9kwJD6iR1cfA5yx7VxcO
         k8Cs7/wL1reSmkIGQWO8nD5oggTg4DXkZWQI2XX5WcI/uSVerBzg71GzACFKsEcshwQQ
         d+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
        fh=8kg3rB1aHLk58f+lrAK4myYJsg5JkG8lG/6eemKgTQ0=;
        b=SyNYjv3VfiNL9ga/pf71tHHvfABp1CELkr/RoDE3EpTFihzt3lmR4+uj2cuwkZ9KGi
         k2AxFEDFMeHer8TNMRRBbbTAIgB9QtzkvfxBR0XUNehTO9q8bgzkLLIQ2Cl+qfxhZafp
         cAKb8Y7myTTPmw8bdwQRL7C9AlCjLsEjgHNGFkMUoC1owSi3puhwMEFVvxWrRdSXIaW0
         QGc++hoM6B87bQgoJGeqH7qs/KiODxCMWE4sgnqFjMj7TVDa3WQJucSLU742U1Ardxol
         U13hGRFB9s9AfXsXR3kxvsSat7jhKr6npkuNUpgWbbkAabJGZXyjCoyWdI3sjacUfeER
         gZhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199770; x=1795804570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
        b=MhhhzOoth3xNp4mBIoSCsfaBcfe+qgDacYLeCNiiaUZDcBhpuY9rHSYdJJvxx3Deye
         9BqY4Jg6+yYsHV6zDxnH+ZHlvLhA3gk2U08rTantGlRaFBmKkuT2rIIX+VNYElga38+l
         fXiQzDDFr4PHLElbGi0nDzKpVpO8L0a6rj867hXOgvYbu666cMi0VYos/MyGfS/i2OR8
         A24vOwKFMARIz8B26GN1gzWHA3YbBoxwrctmSlRxdVz9yrSRBaeeeHeAZyNyd8NNFbjb
         spd0hHtocJ8Q/c93ePqPgfBzb692s/nVxXNbtjUOcC/bKJEhw725KMtZUN7xjOJCdbld
         r33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199770; x=1795804570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
        b=vda/gNaud9bVVHy61e7/WvuLIAlqXhlkzCe/o68XBOdQBbuqnePtEnIxj1IYYswtGw
         4gHir6joSeIOsLGbdaZVxUGSPqrj304wQ0VI7HYxadQ+DALO3476Sxn1uOdRaC7RoaL1
         YbItcXNOCFRhiGuUMSr408Zdnvkgv++5t+xwM83aA6Sr84AfdtTj1sMlLfRTU9E4uA6G
         SoyWsqSFYclUFlRtvvSLDCAnljZM3v6A5wnfPnUjoV78Fe/F7bhVTOCVyGNtNGIyZazM
         mF2CBjKjYmyzAbQ/OkT/eqy2KfVstEw6ta+yWuK4NMMXgtxg4OE5xb9ypNS5IdvZOO+U
         Smaw==
X-Forwarded-Encrypted: i=1; AL+hErGYAtnLYmys5Sk6wYoFqpto60ysHLN1yh6h3QaadYW1VY3dQ8VRppNCj5n2r6qjPIvuHwxMBj4B/TiB@vger.kernel.org
X-Gm-Message-State: APuU4Z81REMZiq8slJStGTjiPraf7oukyn2GVPh7FEbOFllt1WYZ3yIm
	QYaM6ZUY57Lipvbo2djoq6w5UFh/HyfmlAT1XjHnNzn9Q9vcvmdGWtFbIDiYl22ZKdZ30VYggmE
	D6U6KffzIjWFws4lrYuenkfujv2QKymc=
X-Gm-Gg: AZFdTZf9ow/K8C46ysoxylLO8Nz64vSmlGnbpFqaphwdsQnVznDyGEJZBK8baPq8Qh7
	mXXGEtBXOcvnaVbfyvpFakbTBTA4wR7Aj/kPOFWI/BUMy+cC+wGQ8KCz47Fsq3TLlhPsjiqxiA9
	IMHzfkX0ayyciMPFSfMTZ0w45YJu+NRYWc5alZM4DNwYTd11mGeY5nOukcPRUsioJcwwQtxdq81
	c/UH6ovPNJI7x6bb7tCodZMx7EmxdWQVcm13RIILhujzVS6qKwselIN/7QCG8xwIfSA1+f6/NaG
	qewqQbrcFBxaWAisJOegY2x2rbULfhbNUWxfVeBMNRjG3PsfPkz57G9nR6ejLWMwq7GG5CEHw5K
	nXqjWUrTIwBWy+GZKruwQLlBQLXIP3qXgyMwk2DYzWE2JCJBjyIKt9ajwWUFlnjhEYnOz+JAKq7
	9q10E1qBtWRinfXqsuhOLLX/G138vmm6u3G/miD7B6xMRl4IeQv1ACCuMABw==
X-Received: by 2002:a05:6000:2c05:b0:498:b92a:30b with SMTP id
 ffacd0b85a97d-4abb0c5d560mr8148264f8f.15.1795199770371; Fri, 20 Nov 2026
 10:36:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-22-prabhakar.mahadev-lad.rj@bp.renesas.com> <73e4df46-89ba-4578-bb07-acad3d319d88@linux.dev>
In-Reply-To: <73e4df46-89ba-4578-bb07-acad3d319d88@linux.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:35:44 +0000
X-Gm-Features: Aa3M54pteYuqCICsT2iLZaDSuKLW6c0ATYrH9gkWFijmAmsICBAQi61cGR-Fw3Y
Message-ID: <CA+V-a8s20m-vQ-Xe7gJvwyGvc-A0zRw3XpNqYAe8TtAuOcUjiA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 21/24] net: dsa: rzn1-a5psw: Update CPU port
 comment for RZ/T2H
To: Clement Leger <clement.leger@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Clement,

Thank you for the review.

On Fri, Nov 20, 2026 at 9:45=E2=80=AFAM Clement Leger <clement.leger@linux.=
dev> wrote:
>
>
>
> On 11/20/26 01:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The comment in a5psw_phylink_get_caps() states that GMAC2 is connected
> > to the switch management port. This is only true on RZ/N1. On RZ/T2H
> > and RZ/N2H, the conduit is GMAC0. Update the comment accordingly.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5:
> > - New patch
> > ---
> >   drivers/net/dsa/rzn1_a5psw.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.=
c
> > index c0c1f45852da..751d03b0bde4 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.c
> > +++ b/drivers/net/dsa/rzn1_a5psw.c
> > @@ -237,8 +237,9 @@ static void a5psw_phylink_get_caps(struct dsa_switc=
h *ds, int port,
> >       config->mac_capabilities =3D MAC_1000FD;
> >
> >       if (dsa_is_cpu_port(ds, port)) {
> > -             /* GMII is used internally and GMAC2 is connected to the =
switch
> > -              * using 1000Mbps Full-Duplex mode only (cf ethernet manu=
al)
> > +             /* GMII is used internally and the conduit GMAC (GMAC2 on=
 RZ/N1,
> > +              * GMAC0 on RZ/T2H and RZ/N2H) is connected to the switch=
 using
> > +              * 1000Mbps Full-Duplex mode only (cf ethernet manual)
> >                */
>
> Hi Prabhakar
>
> I don't see the point of this commit, fold it into the one that adds
> RZ/N2 support.
>
Ok, I will squash this in patch#23 in next version.

Cheers,
Prabhakar

> >               __set_bit(PHY_INTERFACE_MODE_GMII, intf);
> >       } else {
>
