Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D13914E0
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263423; cv=none; b=keTkOlPW9oJugwe2vHbm54BIXxA91992m98LGhUged3yuqJ0kCdprEkZDXJ0kY5ZYtCjp7Wx5Yx2pjYjQRhgo2c8kMdwBZ9xSrJf10ElVweGUnXJeDLOZISp0WH39rznci0ZigkGe8wIu65qo7OLadHtCneLEqSLKwOGckiFqnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263423; c=relaxed/simple;
	bh=3TzyiOjha5tC3GN0UvqQO4/AeK8iVyDqcMRIA9aojGw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xt7p8PsEWy/GThbp6udmP9otos6tlcdh1fiZIMqTmtrPuGxm6OaVj7lQZ8zqEOAGbaFbtihWg2LCBQlArCPLEjRPz6x0qyPofIVcUyt3Fg9cTYiBZZQytqrE8wjJz1QpCbhn0I3n3KsWFyTmzmAQVJSjZ8bdWwzWR0DZw9DwicA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTyIjSMi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTyIjSMi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fb439299so31881975e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774263420; x=1774868220; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3TzyiOjha5tC3GN0UvqQO4/AeK8iVyDqcMRIA9aojGw=;
        b=nTyIjSMi5M5jQmT6b0HpXubFVsoloJkKzHO2/xEWQSr6hXutCntRR4I/CHUGAfmuX7
         gswFj9Smnhfgr+lU1FZEZRPKz8HtoqX0JgCJS3hSMj/f5dUo2hV0tIVmss/6B2ylg2O7
         de3SnsVpMLxM2/wqHWW3daSf6hVemmit5IjGi6Z2Jip7z1kM8l9IQdyq0TTzJNBZ22lF
         Yz7MzK63VL9sMBQ1t1lmNrciL8IqY8huY526ULQXb4nCAjc4/f4b188pMP0rZ/M/aao5
         4Ba8Mr3pX/vNaYmW7H6arANfxYDWjzA7DmLK6ro8tzn/UIuaYnrA2ewizgwrU/aNNJVB
         oeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263420; x=1774868220;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TzyiOjha5tC3GN0UvqQO4/AeK8iVyDqcMRIA9aojGw=;
        b=Uy45j2xefsUYcXQnx93Li9qY7h0o00LF/QJ2e/FdCjeqlcIVj1nAwndi8LQ6ZaCFu8
         zzFn49PvD97eeFFFuBvze13hT6y6hbl0AhSC3K5W1mPdhkCT3Qdu3cIl0HYblD3spiaO
         xVv5FOC7qD1veoJngh3p8zo+nEvgCWGC2G4fSPvuVq5Q8Rg6fPcxibv7BmbHcc3FKtWx
         YaMyH4/NAC5vkwuPW5YwCf9w/lCahcpmyr4LZunLQ1HXShkYUqkRn4UCsRGzcY3wfsj3
         GuShBYIUQdyG9gfOqaq+UdHYcZH05LFcI4/ewylune8cjD6TkHaoV3Ddk+SRbaogtcRL
         3DFg==
X-Forwarded-Encrypted: i=1; AJvYcCXwGynqcUCRj39CuUy4asdB93bO7+8qkmttMGbI1yQeWkAulxa7bwkAZJwEEgHqEHdEurX8Pq/q7L8C@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7KDYIe6ioUcTLgAtBqBs7wsvVw6/IdbcSSY3yHlH70b2CQet
	OEJTRYyP/aWEMFjVMWezXt7kaYSGEvQhqTxg4ou3MP3oia9BgJO5Qm/2
X-Gm-Gg: ATEYQzz+ZdvWWhtm6kkJoI9cMch1mpm1lTV3vqyl+XcF36WyPdtss8twzf8Xpmo1aKN
	4O4xnm52TO4YnFXrnMEsP/ZIGviBJE+QPzojebpzFBBOe1yz8/y/23lT2mUJHS4qGxqlRJLPuUt
	MuIDPUPtWpv8oTTMf7tKTyPJ1nO7LbfTq/lz20Surd/SAb4XLVG9iUc0/QQoFr2er0yTjWOYMg5
	pvxRutRI0Wy2wBI2/8P17EJBDh6sLG+J97a4XteD/SbaeY2PuunZ58W6170YgJorB6KNtkOKnCp
	IL27QgUnUKVyY4GIk2BNpRWxJ8e5mx0V22f28xGCmx0DoknCBpF8zRaZ3LwvnKww/PWVD8Zked1
	hfdwGz+YYrGsBwMeEV5pqIGme7Ue5/Ub/BpqRat4wuC7g6BaMNadwq0ifmbKqDAmI4TXm3vVqlM
	jDzd5MFjlc6zlEG9dwLdAiSK5h0v4ba3U=
X-Received: by 2002:a05:600c:8b45:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-486fee0d6ebmr155577755e9.22.1774263419604;
        Mon, 23 Mar 2026 03:56:59 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b647120a1sm29601557f8f.30.2026.03.23.03.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:56:59 -0700 (PDT)
Message-ID: <cd0372969345e306a839b689f55f10bdab15069f.camel@gmail.com>
Subject: Re: [PATCH v7 3/4] dt-bindings: iio: adc: ad4080: add AD4880 support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Miclaus, Antoniu" <Antoniu.Miclaus@analog.com>, Jonathan Cameron
	 <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael"	
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, "Sa,
 Nuno" <Nuno.Sa@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan	 <olivier.moysan@foss.st.com>, "linux-iio@vger.kernel.org"	
 <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org"	
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>
Date: Mon, 23 Mar 2026 10:57:45 +0000
In-Reply-To: <CY4PR03MB339944E105FADF6717B5088B9B4AA@CY4PR03MB3399.namprd03.prod.outlook.com>
References: <20260321100154.1258-1-antoniu.miclaus@analog.com>
		<20260321100154.1258-4-antoniu.miclaus@analog.com>
	 <20260321120802.391cafd0@jic23-huawei>
	 <CY4PR03MB339944E105FADF6717B5088B9B4AA@CY4PR03MB3399.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-03-22 at 15:33 +0000, Miclaus, Antoniu wrote:
> > -----Original Message-----
> > From: Jonathan Cameron <jic23@kernel.org>
> > Sent: Saturday, March 21, 2026 2:08 PM
> > To: Miclaus, Antoniu <Antoniu.Miclaus@analog.com>
> > Cc: Lars-Peter Clausen <lars@metafoo.de>; Hennerich, Michael
> > <Michael.Hennerich@analog.com>; David Lechner <dlechner@baylibre.com>;
> > Sa, Nuno <Nuno.Sa@analog.com>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > Olivier Moysan <olivier.moysan@foss.st.com>; linux-iio@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v7 3/4] dt-bindings: iio: adc: ad4080: add AD4880
> > support
> >=20
> > [External]
> >=20
> > On Sat, 21 Mar 2026 12:01:53 +0200
> > Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:
> >=20
> > > Add support for the AD4880, a dual-channel 20-bit 40MSPS SAR ADC
> > > with integrated fully differential amplifiers (FDA).
> > >=20
> > > The AD4880 has two independent ADC channels, each with its own SPI
> > > configuration interface. This requires:
> > > - Two entries in reg property for primary and secondary channel
> > > =C2=A0 chip selects
> > > - Two io-backends entries for the two data channels
> > From the v6 discussion.=C2=A0 I'd just like to know a little more on th=
is.
> > Are they really separate backends?
> >=20
> Yes, they are separate backends. The FPGA reference design
> instantiates two independent axi_ad408x IP cores
> The AD4880 is essentially two AD4080 dies in one package.
>=20
> The two data streams are merged by a util_cpack2 channel
> packer before reaching a single DMA:
>=20
> =C2=A0=C2=A0=C2=A0 axi_ad408x (ch A) --
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --=
> util_cpack2 --> single DMA
> =C2=A0=C2=A0=C2=A0 axi_ad408x (ch B) --/
>=20
> Each backend needs independent LVDS alignment and lane
> configuration, so a single-backend-with-channel-parameter
> model wouldn't fit here.
>=20
> https://github.com/analogdevicesinc/hdl/blob/main/projects/ad4880_fmc_evb=
/common/ad4880_fmc_evb_bd.tcl


I was not really involved in this part but this whole discussion got me cur=
ious about why are
we going with the interleaved approach? Typically when each path has it's o=
wn serial interface, we
also have a separate DMA channel.

- Nuno S=C3=A1

>=20
> > Given discussion about interleaved data, I was kind of assuming they
> > were different front end interfaces to a single backend IP.
> >=20
> > The freedom this binding is giving is for those two backends to be
> > completely unrelated. I'm not sure if we want that.
> >=20
> > Jonathan
> >=20
> >=20
> > >=20
> > > Reviewed-by: David Lechner <dlechner@baylibre.com>
> > > Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> > > ---
> > > Changes in v7:
> > > =C2=A0 - No changes
> > >=20
> > > =C2=A0.../bindings/iio/adc/adi,ad4080.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 53 ++++++++++++++++++-
> > > =C2=A01 file changed, 51 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4080.yam=
l
> > b/Documentation/devicetree/bindings/iio/adc/adi,ad4080.yaml
> > > index ccd6a0ac1539..0cf86c6f9925 100644
> > > --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4080.yaml
> > > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4080.yaml
> > > @@ -18,7 +18,11 @@ description: |
> > > =C2=A0=C2=A0 service a wide variety of precision, wide bandwidth data=
 acquisition
> > > =C2=A0=C2=A0 applications.
> > >=20
> > > +=C2=A0 The AD4880 is a dual-channel variant with two independent ADC
> > channels,
> > > +=C2=A0 each with its own SPI configuration interface.
> > > +
> > > =C2=A0=C2=A0 https://www.analog.com/media/en/technical-documentation/=
data-
> > sheets/ad4080.pdf
> > > +=C2=A0 https://www.analog.com/media/en/technical-documentation/data-
> > sheets/ad4880.pdf
> > >=20
> > > =C2=A0$ref: /schemas/spi/spi-peripheral-props.yaml#
> > >=20
> > > @@ -31,9 +35,15 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,ad4084
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,ad4086
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,ad4087
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,ad4880
> > >=20
> > > =C2=A0=C2=A0 reg:
> > > -=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > +=C2=A0=C2=A0=C2=A0 minItems: 1
> > > +=C2=A0=C2=A0=C2=A0 maxItems: 2
> > > +=C2=A0=C2=A0=C2=A0 description:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SPI chip select(s). For single-channe=
l devices, one chip select.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For multi-channel devices like AD4880=
, two chip selects are required
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as each channel has its own SPI confi=
guration interface.
> > >=20
> > > =C2=A0=C2=A0 spi-max-frequency:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 description: Configuration of the SPI bus.
> > > @@ -57,7 +67,10 @@ properties:
> > > =C2=A0=C2=A0 vrefin-supply: true
> > >=20
> > > =C2=A0=C2=A0 io-backends:
> > > -=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > +=C2=A0=C2=A0=C2=A0 minItems: 1
> > > +=C2=A0=C2=A0=C2=A0 items:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Backend for channel A =
(primary)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Backend for channel B =
(secondary)
> > >=20
> > > =C2=A0=C2=A0 adi,lvds-cnv-enable:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 description: Enable the LVDS signal type on =
the CNV pin. Default is CMOS.
> > > @@ -78,6 +91,25 @@ required:
> > > =C2=A0=C2=A0 - vdd33-supply
> > > =C2=A0=C2=A0 - vrefin-supply
> > >=20
> > > +allOf:
> > > +=C2=A0 - if:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
onst: adi,ad4880
> > > +=C2=A0=C2=A0=C2=A0 then:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 2
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 io-backends:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 2
> > > +=C2=A0=C2=A0=C2=A0 else:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 io-backends:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > +
> > > =C2=A0additionalProperties: false
> > >=20
> > > =C2=A0examples:
> > > @@ -98,4 +130,21 @@ examples:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 io-backe=
nds =3D <&iio_backend>;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > =C2=A0=C2=A0=C2=A0=C2=A0 };
> > > +=C2=A0 - |
> > > +=C2=A0=C2=A0=C2=A0 spi {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adc@0 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =
=3D "adi,ad4880";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0>, =
<1>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spi-max-frequ=
ency =3D <10000000>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdd33-supply =
=3D <&vdd33>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vddldo-supply=
 =3D <&vddldo>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vrefin-supply=
 =3D <&vrefin>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&=
cnv>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =
=3D "cnv";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 io-backends =
=3D <&iio_backend_cha>, <&iio_backend_chb>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > +=C2=A0=C2=A0=C2=A0 };
> > > =C2=A0...
