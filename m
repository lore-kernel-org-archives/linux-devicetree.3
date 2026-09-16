Received: from mail-ua2-f20.google.com (mail-ua2-f20.google.com [74.125.226.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F32E3A1D01
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 05:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.212
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535552; cv=pass; b=QdYcUwjN2IgGDgpQ18hgQBTG47ygXA4tZnijYaMnMg7t/6mx0kaxRP6gyMr+lHfZptpUDENvFgbiK+ZB1cvwhTBiuV67233lRQTahvtvYdngKCXZuyrZTiAlBDd6ZpYhx0aqIdscGSOqLS99ppfNhvlgtyiPKj6SIjikqThwQXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535552; c=relaxed/simple;
	bh=xfMfjILt2qYVQAqWVFpTkowhP2xgf3MvNiTst1AwzOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M27HUXR0+8zanpFzWpmDHFzRfagiNi08qDfNJ0Wqw6NqVX4Ln5xzIzBQ9FZrbeFIeSNDiljL7fNPBsLudWlQeb+ptqmbiB5YUJ7fCliF4XzU81S+/QMOkaK0QLY5tiuUsR/EI8caZLmy2JuuC7QvJYVIjMmM8Yww6z6Vdtkkjyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoYzsp2Y; arc=pass smtp.client-ip=74.125.226.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoYzsp2Y"
Received: by mail-ua2-f20.google.com with SMTP id a1e0cc1a2514c-97e7c8d040aso270108241.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 22:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789535548; cv=none;
        d=google.com; s=arc-20260327;
        b=baQkTeG8/GIezfLXb8d7kmF/Qt/ezvpq/y5zKIwCdIDkR1+4KhxoN1CH/FMO36Key5
         vhNutQieqiECw8g/ulY0sDJsi7v/+9NWseEcCodrAMrlP+bUsTUcus0yAmiiITCmgZPV
         wK22VRYgG5EJzUyiINcjcu6B+xwoVkPGtDUixFCK/aTRIAb4VFEWjSeMeoQE70Tj+Exb
         iTAfidWHmkg4fRXDqHIezcfWnRn4UY9r12xm4AjpUMSqkSg9YsOTnvqRBDJIl9LMAfPI
         mNT7o2YKI1s4Frq0u7WCtmsB9xfp+5nAnpXdnnFKMDcRCTqnuGcjEg/50m3fL6EV54ds
         Rhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        fh=dnGJAe+ZAsCy0ipD6Q7iweRTmHKo1PvQxKIwHBkIjZM=;
        b=oktFXmMg7VEE8vfC/5Jrr9Yjan1B2tXbx5kO7gytBK+dObtbfSM5a7nKuNRmb4Hd9y
         J8GHfeNKTQ6Yc2oRbleNPhfvF3Lc2Al+iub12zyGw1rB98IINEqy8m6pUanovKGOPEFT
         ECU6KITeWKsMOzjzQwaLqgLGe1Cu8jmmGtrebuxsrXYOQ4QcpRu/1Zq/u5YtVh1gOBLm
         ZLUia4PbgumtY7hevZ9+9JRQ0p2kZ2rZf+LhQY/YL6cQ/wXwp2IuaGeZlrEQM4xORFHS
         EGznWMT017djOfizbikfPMhNmT+cZizkWxOGlCAjw3WEtCQN9TBauWlkhhfkAHywhdA6
         C6xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789535548; x=1790140348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        b=XoYzsp2YhnEj9tlW4XHgn995P2na4t2gSWWxk2SiJP8ad7mKThT4Y2a8CWDzf8C1Yq
         SrK6GhePfogTZkYeMNs+qudtEZCaHxoyZzh2l4BjVYrdsUC+YNor94INAd7cFvbnqkC9
         Ap7ibXqKgl6H/dBqrZLfL6jCQ0/pms6nLa6G6W+XeO2wm/uOpUm1pcgsDAVCcmlsoZ98
         2qzETLTUpMqnw7ayJIpBMm2PTDedi64KyixAtjwqd511aLIfxZ4V7dxzixwwZLpbZ5yI
         vybsmFdHC903hzXM9NsdCqWc8FOusttxOFXnLnMFtSEoH5CHPGZu4Hux4VAtPHi5ZKoE
         A0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535548; x=1790140348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        b=OlPLcxij43IxQKi0gU1tF7DLYI2GA7thBzkTory9eFumiJo5Nep2IP39JVIGxMTdQg
         Y2KqFPMr0ECjFEpyEowsRgNrZO2Y2u7gqK56ku3o2xNJvIheCPpkYn3H/mQj9pyHcfjv
         wYmevXBtBcXkx/TfStzHaIbLSoe5LryUizl/nX5izZTovlcG7Va6Qqm1fS2uVBfVvBTx
         riTTnR9T26LoYy7SuU5CWed95laas0Xo/e6szBWfEeV6bWP+bNkVl+Fy0bnITVuVgmVK
         SeiANIreB0Z4ZF4RIP4hWsSw21V5LVLOCbm+2QVIJJsv96QxB866zwhAGJ5h+HanCsOJ
         Tsuw==
X-Forwarded-Encrypted: i=1; AKwUvByQAeh8qf3QjbfrYwldbLd1is81X2QZHAVu7Tnz7zTsJudfO776IyBJQI4AxR951Ge44X4fvMOSVQZU@vger.kernel.org
X-Gm-Message-State: AFuF++nREnKMBzBtNmQePvGU6A8OsccDa3cdAFEB1BUT8m4EtFZE4cjx
	DEYicpRvy8oysqzEqIG+0Dk1yGHWvNMec96XTzrf+4XOlVZ7Tw12l1xjEgM3t+iHzWBEsk8wMVa
	yPsT0XycLyrne4zLX5+bpaqokYYFKmkk=
X-Gm-Gg: AYBFou3a6Wjcj8vIQ6F2Ju4+gt9rWOhqHvmG/7oixCLNlQVA9eLfTyQehJt/4fOFLp8
	ttSGBf0FloByp7gLlHri7nVwGc/5a25ECjJxiJVhLO48GlxYenpa5eD+UCiWWLu76akHZaUiDOl
	J1YUjQyH92/dy0bnxfv4LmUYB9JUsi8VbKMMrjHIwdbya1OIc2+6kXpVKg7AXH9nCmTiRYpwpet
	oUKZgbl5J6sTr8erPGbBndHU6FV+/QIMjsOxyCM3MMYXEYz2S/qkMNM0810u39952PmhXmbD+pQ
	PaAOwpE5u1HplMrPpOkl57FHIRmSYgEZWbToOAftzANekPizMlT85spDFhYo3AYLFX+fBF0aaAV
	pBOjHNTdnGX37S3pSztLOCEVcjVDI/RS8apLB0iMz6h/YXH1q3W8XVWBNutxM8+RKZxbJ8UrM2E
	3Zp8ff9oZG75z734KBV5jK3jXun7j5Kaeo0S4p/Px1eH6F
X-Received: by 2002:a05:6102:38ca:b0:79e:caaf:de9 with SMTP id
 ada2fe7eead31-7a02acc855amr1205112137.6.1789535548385; Tue, 15 Sep 2026
 22:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916044119.475666-1-alastair@d-silva.org> <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
In-Reply-To: <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 23:12:17 -0600
X-Gm-Features: AcwNN1UNecxTndtUibx9ggVDgut-WAi8ElAvEyyyzRhfanBmsu20NosAEZK33OI
Message-ID: <CADvTj4qRMviM=KXinCKi657pVC_kj7Kt1yizW_EGDu4m7VKQFg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] net: Add Allwinner H616/H618 EMAC1 and AC300
 EPHY support
To: wens@kernel.org
Cc: "Alastair D'Silva" <alastair@d-silva.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:56=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Wed, Sep 16, 2026 at 12:41=E2=80=AFPM Alastair D'Silva <alastair@d-sil=
va.org> wrote:
> >
> > This series adds support for the secondary Ethernet MAC controller (EMA=
C1)
> > and the co-packaged AC300 Fast Ethernet Physical Layer (EPHY) found on
> > Allwinner H616 and H618 SoCs.
> >
> > The Allwinner H616/H618 SoCs feature two EMAC instances: EMAC0 (typical=
ly
> > used with an external RGMII Gigabit PHY) and EMAC1 (Fast Ethernet,
> > connected internally to the co-packaged AC300 EPHY). EMAC1 uses a
> > dedicated clock control register in the syscon register space, which is
> > accessed via an offset index in the DT syscon property.
> >
> > The AC300 is an integrated 10/100M (100BASE-TX / 10BASE-T) Fast Etherne=
t
> > PHY communicating over MDIO at address 16 + phy_addr. It requires
> > retrieving factory bandgap calibration data from the SID nvmem controll=
er,
> > managing internal power rails and clocks, and optimizing transceiver si=
gnal
> > parameters.
>
> There is already a series from James covering the same thing. Please chec=
k
> the mailing list and possibly our wiki (linux-sunxi.org) to avoid duplica=
te
> work and subjecting the maintainers to the same discussions again.

See:
https://git.kernel.org/netdev/net-next/c/783f6f1fdcd5
https://git.kernel.org/netdev/net-next/c/6cc2fbceb49b
https://lore.kernel.org/all/20260915-submit-h616-emac1-v1-v2-2-322b32e40eb9=
@gmail.com/

>
>
> ChenYu
>
> > To ensure reliable link establishment and MAC software reset with the
> > internal PHY, dwmac-sun8i is updated to defer MAC software reset until
> > sun8i_dwmac_init() after the internal PHY has powered on and begun
> > clock generation.
> >
> > The series is structured as follows:
> > - Patch 1: DT binding for Allwinner AC300 EPHY.
> > - Patch 2: PHY driver for Allwinner AC300 EPHY.
> > - Patch 3: DT binding update for Allwinner H616 EMAC1 and syscon index.
> > - Patch 4: dwmac-sun8i driver support for H616 EMAC1 clock index and
> >            internal PHY deferred reset.
> >
> > Testing:
> > - Tested on physical Mellow Fly-C5 hardware (Allwinner H618) running
> >   Armbian with sustained 100Mbps full-duplex network traffic (DHCP,
> >   iperf3, NFS rootfs).
> > - Device tree bindings validated with dt_binding_check.
> > - Separate SoC and board DTS additions will be submitted via the
> >   linux-sunxi tree.
> >
> > Alastair D'Silva (4):
> >   dt-bindings: net: phy: Add Allwinner AC300 EPHY binding
> >   net: phy: Add Allwinner AC300 EPHY driver
> >   dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1
> >     and syscon index
> >   net: stmmac: dwmac-sun8i: Add Allwinner H616 EMAC clock index and
> >     internal PHY support
> >
> >  .../net/allwinner,sun50i-h618-ac300-ephy.yaml |  79 +++++
> >  .../net/allwinner,sun8i-a83t-emac.yaml        |  14 +-
> >  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  65 +++-
> >  drivers/net/phy/Kconfig                       |   9 +
> >  drivers/net/phy/Makefile                      |   1 +
> >  drivers/net/phy/ac300-phy.c                   | 331 ++++++++++++++++++
> >  6 files changed, 486 insertions(+), 13 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun=
50i-h618-ac300-ephy.yaml
> >  create mode 100644 drivers/net/phy/ac300-phy.c
> >
> > --
> > 2.53.0
> >
