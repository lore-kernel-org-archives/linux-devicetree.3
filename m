Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A143ED3C9
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 19:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870838; cv=pass; b=m/QsxS+KHx9WG7fZMlr9sSjvOlJ2KlFNTPdZI5KrjzMmwhYcUBEv+GrQ7Ks9r+8Sos5yum3FuxcZgShdj6W3CdtL6M7RCJZDHoGCUhoL7y9jLedgyk3xxAAzjXFHBlwtH9ekRcruSvDTqFhEbkKEKyAul7WWBq8/BnnVvg786cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870838; c=relaxed/simple;
	bh=hd5zHk+yVobv7CaHMqAXD+PdEmceY9xI+QAzkPqKuMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXtcReKUzj9IKU/HEUq4+ba3Ol/mu+bmkbsWHqKKvgljQiwECn4do0iC5jHLOsXUjxf1idtARMslb+1I/mnVaa/aumeIBPWkrjWU/tv88HorlXQU9y0yOZa6QdCnPooS9YjvGfyxe9d3yPFeYpQmWMWjSKxPXIohv0Q5dfSeMn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZaHXhk1; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZaHXhk1"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7542a2ee156so67370137.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785870835; cv=none;
        d=google.com; s=arc-20260327;
        b=BzIE/FG4rsQoJDCb0NPtHqE5v7P3Jwx3EeNAdK4LBytsVt0XGa+0xSQtB8BUCEV665
         Uxc2/oCpDvFeTS/igRVeF5B2Ro9sDjxlwxoj7tDYt2gvA9kDc4o4B3EKJWrYRUdi8LR5
         rPkWntUkr0kRXQRRqXSWzSqxJ/plb85uNZXJOBVFNSGLz/ICkNQkFsmaJwiMi/TNa0BC
         3jmkMd2W59BjkkE6E2hsDCejK9ldnNuEzRY1NVLmvpZVbGgB6wW8++usFzkgiDgAunC2
         UppnW1EfjbaKpo+LoL7XKVtml41jwBbPa6PV5/0Ft0N33jJx07KMzBfGi8pJlLBDlGFS
         jxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oaumWihiToMR49sZEz9K8oHxfPmHFhmNoW5o+oLOoZU=;
        fh=nLsubDsT3NdnTEk09jFJfmB829YpUezUfJ7BnK/a6ss=;
        b=ivJUGfrn+iot+ibszG76l6mr9BIpCJVSWCKOcn3e9fmRHa5qTOAVQrKrTIUq0edxQ1
         kUSexRsqxOQda7fzBMNJcmHbHkVDhVUwmqpA4morKG+dex2g48kzpH5N7sk5JbeM08yu
         Ya1pmK43skccTWvfyUh9Feggr9w8hyNCYCOL6HgIy5ZUcNUxx9Oz8nBQD1dYmM/Qv7XY
         s06mZVa0F8sv+JTb5VnqNQUZjPtbxQJGrvrIg6lmJBpnGPObpeoTlwPIL1S9AYRueq28
         o2p05GquoezGu4M9MHu0iuCzmdQvaQgrrR38oRM0ULCVTsDbnF0og/Zl9QYNyO2PBRiN
         nlog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785870835; x=1786475635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oaumWihiToMR49sZEz9K8oHxfPmHFhmNoW5o+oLOoZU=;
        b=gZaHXhk1ecA3LBsBU4XpfZaoD6PYPN3WZitU4NlEG65NG31lmuoyEZOrcoEArjeSPf
         80ItkRH0VtRD5LqaPiJ+cQxnk/oCRKs6AUR9ABolX69EASEjmrTBJKvbkrIIxmVtGBCU
         31Z9Xay8GGPQtxja4AuPsxQdUAsnrPbnmomVYl+Ez/pgysXUnbIhWaE0Ib33BSqHDKJX
         FWnb57qcre3/Do/CFb9uoNcX2qTmyyNKSmIo6PmmBM0acOXZY4bT6U4Ph2WXZiCjQAqF
         iYC5LUQzdQyDumJGLR6sjQl1R3somoV3mmkDnHizz5uYJhq8kcmiwok3mEoptbfh2Pdi
         lg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785870835; x=1786475635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oaumWihiToMR49sZEz9K8oHxfPmHFhmNoW5o+oLOoZU=;
        b=a6+Go5pJIQhD7hQGUAUFHuszZU3w/0hWO+0mqpe+wvPA+b40eq9lMDXpyh4Q4m67sN
         lzU5tozdlNTikaKV3JDtDVTxs1g/kgDSPh4/xmf48mqwwuAXpJKSwPi8i5MAHGta81Ad
         yKCbXFKEgei75wbsieKwIvEsX/wh7uzkXoHjAk7ib9o0vQ8KQUs7rc8f5HYKG9JtNo3L
         Fdv8hF3jghX/gIIWqBTLFM/8xM3yTgnfzz4DyjoIwDS0Ma8zEZQ0P9G9pswyygi2mozq
         exbGAHXmSknXic3OowshNOk7KhGOuWgoCnuwsVTvSdkgk0UNYsiD8Vrn7IHFKL5r8JYx
         jEaA==
X-Forwarded-Encrypted: i=1; AHgh+RoSbBNJ07xNAQopMCwHWMUfqsK1OlyyqP/qOHNMl8l7ox7QiBc798aYhA/DcNJh3+2KByps9lpEeQln@vger.kernel.org
X-Gm-Message-State: AOJu0YzRLirmW/D8162neIaxoJ2W5+EeCqCCHOlEV6ZhN4/PkJFvFhTN
	VXS489VJTD3bxWQjJ3S2Kz2MbpYB6rYDxW7F0Up4D/FQwmf3VdInatRaMC6tmEkPCJmz2Gmclom
	grGNvwHKqkDkKZ3EjB9nKBQ+26G2GnU4=
X-Gm-Gg: AR+sD1162UrwsgBXmlJ8pF3hIYmtKvk7e8NIyTwnxg8mTaYUte+wgph+qD2Cew49WtH
	cp0eddEGb29NQaeyk51bifME1lxFKK6tKX7qGYUzfWU1YZYRWa3k9AVAG8iKugFDNw9UbI8lbTD
	JXhafQ7OVtHnkYNB5tIwGKoU96RcDrFc1bTnKyhJ03bTbMZAWcz9XdRqjKDnJq3qJyMa3zvwKfm
	mb6ABuonBnh6ge2/7skXdZuCDWD8sdWIaWfqqOqf4jDS7nHOm01IGn+TTv+Sf5XVzStCMnMldzb
	m3+kwzoW60s8HkFgaS0Gp25OUehOCkV2ZOvUMP8+nv7G945zJvdeLIKa3n+/RdxLjZcgULeTs5F
	Fs9qxmqilH/YSnqhGGEtOczOdhF/phlLxruq8WYct1wv5iXc9TJb4nKeagS/TaJTxcnxjkqS+JP
	ZTF5FBCKxSRUE/f+6IT7YKHmNaJM2pNAGHRwde
X-Received: by 2002:a05:6102:5045:b0:74d:ce64:efa9 with SMTP id
 ada2fe7eead31-760e9951613mr360293137.12.1785870835475; Tue, 04 Aug 2026
 12:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-submit-mdio-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com>
 <c1c5ce0f-2c65-4c19-a525-cdd2ef33b6e4@lunn.ch> <CADvTj4o+B933k4TUshgcvZ4tENDbit3fHEBtwy5ODpsf60osyw@mail.gmail.com>
 <c6f001d6-b9db-4434-8468-4705d62ffdbb@lunn.ch> <CADvTj4rA5QaeccDvSP2qrseFKv+7MKhj=pRWdSnNzKKjMCdK6g@mail.gmail.com>
 <2536faa6-0888-47e1-be99-127e098929fa@lunn.ch>
In-Reply-To: <2536faa6-0888-47e1-be99-127e098929fa@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Aug 2026 13:13:44 -0600
X-Gm-Features: AUfX_mw2lc5eE_Y0nOfCYqQraRgviIPcW4MPAnQ7Ers4snXhX7otKzMctiJHOnM
Message-ID: <CADvTj4riSs0n4W8UFDGFEdc=dqaDYdq90xQKwn-stuKaaqx+2w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/3] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Aug 04, 2026 at 09:10:30AM -0600, James Hilliard wrote:
> > On Tue, Aug 4, 2026 at 6:54=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > > > If this was a hat on top of a SBC, with an EEPROM indicating what=
 the
> > > > > hat was, then maybe DT overlays would make sense. But from what y=
ou
> > > > > have said, this is a fixed PCB design, nothing hot/cold plugable.
> > > >
> > > > Some H616/H618 boards have the ethernet port on an expansion board:
> > > > http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/d=
etails/2W-expansion-board.html
> > >
> > > I don't see a list of pins which go across the connector. Does the
> > > MDIO bus go to the expansion board? Is the PHY on the expansion
> > > board. It all looks passive to me.
> >
> > Pins are listed under "24Pin expansion board interface pin description"=
:
> > https://orangepi.net/wp-content/uploads/2023/10/OrangePi_Zero2w_H618_Us=
er-Manual_v1.1.pdf
>
> So just the lines after the PHY, basically the UTP lines without the
> twist.
>
> So please stop wasting my time by making invalid points.

I'm confused how this is an invalid point.

Presumably one may want to use OF_DYNAMIC to dynamically
enable the PHY only when the expansion board is installed.

Whether or not the MDIO bus is wired to the expansion board or
physically integrated into the SoC doesn't seem like it would make
a difference in regards to whether or not one would want to dynamically
enable the PHY using OF_DYNAMIC as that decision would presumably
be made based on the actual configured hardware setup. If the PHY is
not physically connected to an ethernet port then presumably it should
remain disabled due to that being a non-functional hardware configuration.

Or am I missing something here?

>
>    Andrew
