Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199546;
	b=AdYwC+7l6C+SXOxs07l5CzbEaJXJtOg07s6D+g3JqtFz4SNAqjVMwpgGQC4a1yXN+h6E
	 Jun6QTQCvjF1yQS+tFdwH1hHuijBBVfPEZM6npY+kWsKllLNwiS/5SU6VADR0pfSsJo66
	 xJCfVCaQBmNFVbXLztavhiX5rW0dEnE2XLAIbTe6LfQ/xGQrZX0ept26y/jr9Div3hstb
	 nmWT0Fc7IrrTPb7ezrdyo5XhwFt1cnH9bIY2elQc+NoLupoi1Pjp39bJ0lMM8ZovCexPn
	 zD+DMPNQ7DsZYDzNCwEwPRxcJ396WeO+AJY0yR8rAmORYUXNlGnIp/gVAHukFXeFdCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qdpiEp0f2c3LjxTdYPvRzKuFSHht9K4INL82GKB/8H8=;
	b=yiKo6fHgH04fNw6b7i6hQroezELWqSzaMJxa6CoeMboDvN/cMrD+iL4Xl47xt5mBSzX3
	 zPj72ia0BrL8mY0cFKATTM6hlWwHyRM2qS4kaXmKO1QZNWyeLyalZioz3nr0eOlSJfmN4
	 gc+q5BFq6j+94UTR8DVura97fE43GJq7KmEKiTulT0/LL2Gh+z/zEg7Bkl1T63C0QFa9P
	 cHExoTiCkQ/k7/W8rB5xJ+PTklcoAveJtUbM9tNvUZP2guVVISjQhywCt71e8gToiBLdM
	 CCyL90Dug+MTiZym5QfO8nTATVcph6RyOrqX0d5fPw7gc0aghj2+gTwniE/EAXSHS+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndOHic+M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B756F606A337
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B756F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndOHic+M
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so11379335e9.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199544; cv=none;
        d=google.com; s=arc-20260327;
        b=UMQn/FjX/x939rmDzJAgAnzgVWzXKt6+0n4DSru93DB71B7EerDyoBCkZ+E5cg8/yp
         rWS4FkDvnQ15Ye0gfDwuTzIY16n2wtVvJ7e9PeLHQBCoHsY8FG7B0ng5ze50pI5Q3sp1
         w+HExIZqSv/nchRxCoRWSSZ/34YDcJiIIci28jN6DQzA6fUDNKx41uex+YrOCS60NJvi
         ZSq5H9yJ4eBY8DRIEROHRlwL/ImZpfRdBQu0q2OXGzXeK9w4RaN8Fu6hMWaCyk6qGC3K
         aswzsyuPcmkxxzjuTOVv3jHHvGoOMlVJL1jwah87HUNBAECj68OuGUpLIP25ynykExQR
         6stw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qdpiEp0f2c3LjxTdYPvRzKuFSHht9K4INL82GKB/8H8=;
        fh=pl6quZJ9zIGf+A1Js/dbkBQUbXST0OoHR0Cox75DQe0=;
        b=AS1S+38b8afz1LhFt5R4KpGnQbOulnCNGxq6v+V9BS30GMQlQGBDjtFYdqnqbzA8i1
         MTCbW24iFaQBRYahHCkbD2W6PD/7L5BFyTnNc+tqykSF/sLN95uZa8IW90d3jhSfdF9U
         1ZS7eu8Y5WWgcBqCyNjrmo1fu6c24i2glJySa2Og3LkzWTmdfxSG/MLPHA8qjNxqHPM7
         GX915p7ANWL/loURK7AhvuU4MTI98ebUfXwLY75yAyL8WraXg201L3SsvmI3a8GYJAbv
         nvPH1OzaBWHfEtU9e+Ym/7k7lETpXyzzOORD2l1pdJXs7S941vh1QFTne16oXMm76oOF
         3Pxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199544; x=1795804344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qdpiEp0f2c3LjxTdYPvRzKuFSHht9K4INL82GKB/8H8=;
        b=ndOHic+MgMREurcnuv6YefFBdrW1f2TPWdybI5XVPKnjFI8WjmT6RA/QWtOnB5XBVS
         GMWl5n09lfCOi2/7Uq1tQywzWoYrxo2vIWwsl3aNJMf4OmyMFpCKPz0OmGoZ6rh6OpLD
         zfoiz8Ticj3GpEvz3uVg9eP9cD4zOXI6/PK1gZI3rzDCIkxraeWmjnw5HkqwSYBggann
         heYBS6nzbsM6oQJO+wgY+Habe3yEkIi50cqviD64INGQYBDyDJLQk2HgEICwAmIhTyfz
         bWEyhQ1TENjuqotyWLA2oqUeRhxHl/3vUxUNhZQiTKglUyacSS/H4KzQgXUI8vshKpE/
         SR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199544; x=1795804344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdpiEp0f2c3LjxTdYPvRzKuFSHht9K4INL82GKB/8H8=;
        b=N73eaPTGrDzgqnItqjz7WbmvkUt7Ih3G+nrKmhjOX8FXwHEdEtX+LGjJWTjDcRn2NR
         KI0hge23/hbdgKUJWjSzV+hsbrlxXt1aDEx3962GU+VXyBKt/qrmvBYT9UrP+DBoMGFR
         uQfmIPhzFqcLJbA8BxoMLOPs0EG36Admrzpk5u22byRuwo34C91k1SelnUkuTIYTpewQ
         1kl3zJe2pnVoOiiJbpwEU+5BboUtnTaIBvsKU7e9ZaQOAvs9cJms/HRBRG7vyT4TdF9p
         G0YfPkwStKByl3m6oRTXACxBCElS4eNBXTwjDBAkYcMpSp37uSSz5LtAJQiBiGmK+K8t
         Rcgg==
X-Forwarded-Encrypted: i=1; AL+hErGbSB1pc7sosOL9Y1st3ViNSCzqR46Z3w1ExGPzYdDJQE1TIBwEeE5y4aoeBw+n5O1lSPvyicHS4w4w@vger.kernel.org
X-Gm-Message-State: APuU4Z8PiSkDrkT4fsvwxBsSndm5FFlJYP96m+tVhdKqSpM672RGHz6L
	aglP7vTlxDYnfNiwNnHYO/Kb7737XxL3j3uucyrNQSyvhvgPlib04iFP58/CRn7WN7dTwMQUQSr
	h9pWhhub780EkStyrACAOTiNWXue+cKY=
X-Gm-Gg: AYBFou18YnfN8CnChkUO5tjgGpYDZ5YlGmzLLxnp3Lhoo8kqI97hnZ759QS/y9AbP3a
	1wfFxooeH3dZVdpQaqypN2WlUv1bjeCU7vRNYOKPkEQ72p2ZG9IXmRSTO6GSG04+O//GN1AaqcY
	6Ju5c1zyjjcHN7Z3EVby3iShphpzdI8RtIvBr6FvvfKhU5rvFCLKexFyXPFKAt1V4qpCaagWh14
	UvYKKnFPsgZ5LELLXGxCdjihd+GavsAfKCjpZ+5KDTTNKA+ukQDnh4hLGowaBo+THgCiJ2XjhV1
	Zbk11Eyh1iNsKR6CmoyIBUnVIlZVLUpW5RrJFsWSt90xVYj0lgDCXqV70UOG1kRSOwPC/ZJYBxf
	v/KZIEc+zCJPr9bQOal+3+O+3oRZl75URvugeolC4OaCnyFAQsIXw/kDzQ41zmY5YAdBwAcyc4v
	1x0dD3BnHULyiypGdpU4e19aUkZoF1xLnfAEv4nfCVUlZRfqWJwe2Jvqb9yQ==
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id
 5b1f17b1804b1-4bb888097a2mr107166235e9.5.1795199543982; Fri, 20 Nov 2026
 10:32:23 -0800 (PST)
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
 <20261120002549.1908299-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <0ff0a7ec-b899-4668-a245-196ed1032548@linux.dev>
In-Reply-To: <0ff0a7ec-b899-4668-a245-196ed1032548@linux.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:31:58 +0000
X-Gm-Features: Aa3M54r8rrZ0zrmXAOHeL5MeMKEwVaPZYcTvPMAdXWb5WEiB_5oOfQ2UQLAY5MQ
Message-ID: <CA+V-a8tsZiLZ24KO=RaQogQ-2d=Wuug3U1ZX-fi=HqvpOZb98Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 03/24] net: dsa: Kconfig: Expand config
 description to cover RZ/T2H and RZ/N2H ETHSW
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

On Fri, Nov 20, 2026 at 9:32=E2=80=AFAM Clement Leger <clement.leger@linux.=
dev> wrote:
>
>
>
> On 11/20/26 01:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
> > the same tagging format is also used by the ETHSW blocks found in Renes=
as
> > RZ/T2H and RZ/N2H SoCs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5:
> > - No change
> >
> > v3->v4:
> > - No change
> >
> > v2->v3:
> > - No change
> >
> > v1->v2:
> > - Updated description for Kconfig entry to cover RZ/T2H and RZ/N2H ETHS=
W
> > ---
> >   net/dsa/Kconfig | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
> > index bdeb60af764b..3c18314aee95 100644
> > --- a/net/dsa/Kconfig
> > +++ b/net/dsa/Kconfig
> > @@ -199,11 +199,12 @@ config NET_DSA_TAG_RTL8_4
> >         switches with 8 byte protocol 4 tags, such as the Realtek RTL83=
65MB-VC.
> >
> >   config NET_DSA_TAG_RZN1_A5PSW
> > -     tristate "Tag driver for Renesas RZ/N1 A5PSW switch"
> > +     tristate "Tag driver for Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H E=
THSW"
> >       help
> > -       Say Y or M if you want to enable support for tagging frames for
> > -       Renesas RZ/N1 embedded switch that uses an 8 byte tag located a=
fter
> > -       destination MAC address.
> > +       Say Y or M if you want to enable frame tagging support for embe=
dded
> > +       switches found on Renesas RZ/N1 (A5PSW) and RZ/T2H, RZ/N2H (ETH=
SW)
> > +       SoCs. These switches use an 8-byte tag located after the destin=
ation
> > +       MAC address.
>
> Hi Prabhakar,
>
> I would fold that in the commit that adds support for the  RZ/T2H, RZ/N2
> itself (ie patch 23: net: dsa: rzn1-a5psw: Add support for RZ/T2H
> Ethernet switch)
>
Sure, I will squash this in the next version.

Cheers,
Prabhakar

> Thanks,
>
> Cl=C3=A9ment
>
> >
> >   config NET_DSA_TAG_LAN9303
> >       tristate "Tag driver for SMSC/Microchip LAN9303 family of switche=
s"
>
