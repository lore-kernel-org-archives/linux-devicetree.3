Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC62F3E0C45
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539337; cv=pass; b=gPeTGgGYJlD3zs68zjNqOajVzyPzs19a5T1aSHMOzggsMvWj9EHFxM+eV/FW5FNBoMLKdp0Lf523R5ZfoCA2FZAjigGDHCk43axDN4CKZuY8SX46qRAQs0I5a/U8AywBxg9qrRuqlm8W+tBjcE9uXbPx3F2V81eXKG+izkVhRx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539337; c=relaxed/simple;
	bh=LjKyBj5dAm1YP1dYcpxbgCgcxxIttHOMroeyx9lFFRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKmBqKj7n7v+l8+NR3T2ydxCakQHFqAPP0qG3PZSvhn07m7mptdiUo+d/CFQk9m9zShHA0eyNNKRGmEIQzTQ72BxfB1w/+xM/OQvD4FUhf6rTjYuiXn4njPP6sOnD60Ny2xieexI3wQ/HWW5XQHsKmiZjZQiUu7EUF2em6dG3cU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkyvP6i6; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkyvP6i6"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-682fce74c06so582750eaf.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777539335; cv=none;
        d=google.com; s=arc-20240605;
        b=BF/RoelWZQa0DxtOmJgSLsgJaPnRk5iB6HXrkny2J1Y7eF2YRHNFh8DSsXVUW00sJU
         5Ag/5Mb7YKwgJpX1xfUDA8lfYfTNklsrw6TZvQJA+IRb93WIbIOVNDToNABDPimlBrFZ
         RPthK8DrycYhORl3VhMX4hJJIcP9xpFEOMWEAESDiPc1LOXeGGXGiPJ+qhSQHWdg4eR2
         cI1zX08bkwopG9AHwXR+f8JzbpL2UHjTUU5F0cgfiU8QqJI+j5V4nxgiX9Ux7NMN6QEp
         kOyU4lmVNpmmOs/epR827HOc5nMjEsQCgwf6I9JvWP3oI9Tro/+0iLQJe1Vns6lajZ8g
         5IcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6F3SW0LEcxR5KNp5mL/u22r1H9M5kFSrUg1f1ie4v4U=;
        fh=tg/SzuNxUdq7D7dkBhQcTf+iinfuiUn3qmUvqC1dg1U=;
        b=iEw7BKvlj5LKjEf8ocyf4tzC4oNMtDIxdRPQv9R5HykdAsx9bu4PM62hU5d7evfMwY
         qVqTxkqKI/cSj1T1Oq1PENQbZw9hEc0jI113/g3AaWqrgldj6FNWv1s2tIKxffa39n03
         Wp7BPJ02iJzfYxweNH7HIomtj2BU3FvlvlnXS639b47/OBNhOuFo2ki5dv/I46nGSM6R
         3gNGR4LGq97ytSAtIqLuDfASz/EvuV8u911p3AmNV5w1zp5E0dl+THSjP8Rb7ubb8GYT
         OKLADyEfPkAO3kNuckeMH/FSs4Ba0EwwvdJ7SSsiWkRby4cxZRi8EdsdyRlFbTCrLd5+
         R+QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777539335; x=1778144135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6F3SW0LEcxR5KNp5mL/u22r1H9M5kFSrUg1f1ie4v4U=;
        b=bkyvP6i6Ix9Kb5LgjDVfAVPvfT2TbJ+ejd1BKn3rAvdo5GWU8MYrlnAQljmNW5LA2e
         Dn3Q3cTAm9Aja0o4o6brbgsrnr5bhEBgX+JTFRH18YU0N08On/XmK10fe8umWX+AqeKn
         e/SiM7d1BA7LHaFvlLoS+ul8p/DrWMBprkPcqDZp9Boait2xzID6SaZqqf9OT1nTZgmA
         +r9HQ9adThJNZV9vRQ07NusLjdaKevjR6rxWccZ1+hHR0WWgULLvpbFZDZk5b8YNahC9
         yBRQzqwiET11AemP6mfEN7nQ924j+VV52KXWa5R3EjqYMwory98yRe0YAKZAYDwBNVH4
         CJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539335; x=1778144135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6F3SW0LEcxR5KNp5mL/u22r1H9M5kFSrUg1f1ie4v4U=;
        b=KIwl8+SV38Y7tr2Di8Sc3pvayVXT+/gYBAD/Pz8UKDuRyiGItDJuxujSRHoZGiR5dR
         WfIcFBjFgP8cRlnpdlCAdQuTHGhUarOeakz3EYSvNxxCPQ2MmpdedTkTyIrpDneN8hAl
         MRK+Qhhg1m1hnd3gVzqiPTFGJXn6z1a4WFx8TCG7+xmLrxtDA4Hjdlabt3O5H1Y0w7JS
         eUlA9WJmiuGgPHjIalWjtG/toar1zogylgsiB9INWccjqznPDXpeWeLQkgSfTfFpLi3Y
         wtur0Roi9dGK+Yo5YUeNnOMis4oRfbTEsw5UO97Yy0a9+HDPN6+t5a+Lj0Sp3sg8Lqfy
         6+1w==
X-Forwarded-Encrypted: i=1; AFNElJ9etwpEZl95nup66uIdB8oTqd4JqWfvp84hqFmL4Nha/s21pO1fYIpfbb0EumckwcKcUW8dmgOw5ykN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+DFgJdP5jwrVCnHwpBO/l42fQBAzsvIqNh6Q7WqhKnXwURG1
	Bu22TcngT4KhYdZzoWm++ddX1iuEqL8em4n47BJkwZiCsQMCo+597HkcdsM/krwkHb6046zYpn1
	yJM50ZgAPdhcHHJwbMLGsc9tDUbX6N7c=
X-Gm-Gg: AeBDietASqpG8iQ/SJulzRC3ZMRwLCAlA57oWp923OWVu4AOnj33FvNv0KvEMBBS66+
	ZOPjwBHknXnml5atzWr4YJUu5vHsg7MLeQW/xRpUH3wOi8CfEOzYerdtzsB3o2E9JFZ/unfUha4
	5qYLFX5IyLJrXffpN6XJ7VNZ7UNsnRApdFjSFpke5KgGPeAsAVK04bWt7WBpIon1GFi2fCjOMV5
	vTXJgZoEp39Jn1PvaorHmJaSTn+by72dV5MQml0tes1FZr1W+N7Q3N+cZggjKKzwZErLdpVCXg2
	2p/tTrrRgxNHPt5Wnw==
X-Received: by 2002:a05:6820:1690:b0:696:70f0:7ada with SMTP id
 006d021491bc7-6967a4b77b9mr848411eaf.11.1777539334862; Thu, 30 Apr 2026
 01:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429040541.3404116-1-syyang@lontium.com> <20260429040541.3404116-2-syyang@lontium.com>
 <20260430-gainful-hopping-quokka-da7e7b@quoll> <CAFQXuNZ-+0dKFrViisWG4NK=yk2zJ5tn21RZZ3ze7ctsV6Ruew@mail.gmail.com>
In-Reply-To: <CAFQXuNZ-+0dKFrViisWG4NK=yk2zJ5tn21RZZ3ze7ctsV6Ruew@mail.gmail.com>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Thu, 30 Apr 2026 16:55:23 +0800
X-Gm-Features: AVHnY4JVp6wvmjhYEcmx2St3LTne9Y_ZRg2uwyrEugHA3vkFEyI9m4Aurz6GNe8
Message-ID: <CAFQXuNbAxdfy=9bBWAsy1Gx3Chgq+d3YpzaP+EBneEEsKok5tw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings:bridge: Add Lontiun LT7911EXC eDP to
 MIPI DSI bridge
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, mripard@kernel.org, Laurent.pinchart@ideasonboard.com, 
	tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E6=9D=A8=E5=AD=99=E8=BF=90 <yangsunyun1993@gmail.com> =E4=BA=8E2026=E5=B9=
=B44=E6=9C=8830=E6=97=A5=E5=91=A8=E5=9B=9B 16:43=E5=86=99=E9=81=93=EF=BC=9A
>
> Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B44=E6=9C=8830=
=E6=97=A5=E5=91=A8=E5=9B=9B 15:56=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Apr 29, 2026 at 12:05:40PM +0800, syyang@lontium.com wrote:
> > > From: Sunyun Yang <syyang@lontium.com>
> > >
> > > The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> > > and output signal/dual port mipi.
> > >
> > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> >
> > Missing space after ':' in subject.
> >

> it will be fixed in next version.

sorry, Where is the missing space? I didn't find it.

is:
Subject: [PATCH v3 1/2] dt-bindings:bridge: Add Lontiun LT7911EXC eDP
to MIPI DSI
?

> > ...
> >
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Video port for MIPI DSI output.
> >
> > Wrong description, first is input. Look at your DTS.
> >
> yes, you are right, I didn't notice this place.
>
> it will be fixed in next version.
> thanks Krzysztof Kozlowski
>
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Video port for eDP input.
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reset-gpios
> > > +  - vdd-supply
> > > +  - vcc-supply
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    i2c {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        mipi-bridge@41 {
> > > +            compatible =3D "lontium,lt7911exc";
> > > +            reg =3D <0x41>;
> > > +            reset-gpios =3D <&gpy8 8 GPIO_ACTIVE_LOW>;
> > > +            vdd-supply =3D <&lt7911exc_1v2>;
> > > +            vcc-supply =3D <&lt7911exc_3v3>;
> > > +
> > > +            ports {
> > > +                #address-cells =3D <1>;
> > > +                #size-cells =3D <0>;
> > > +
> > > +                port@0 {
> > > +                    reg =3D <0>;
> > > +                    bridge_in: endpoint {
> > > +                        remote-endpoint =3D <&edp_out>;
> > > +                    };
> > > +                };
> >
> > Best regards,
> > Krzysztof
> >
