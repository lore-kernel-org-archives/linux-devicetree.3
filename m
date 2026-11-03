Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716450;
	b=VNerkkiHvCYCrULC7Z8xoTZ6JWNW3kzY+gC2YPtsfL91l2bt5mHx9efqW920QYax9Vm6
	 2zEHWqGNlvp21JghgYOOW8tL8fjLWq6aMh6WHGoRSdfL6Q2Mf6t+j5JkPG4VGXBL4CC00
	 FiJnqQynzfDomUtQIY5fqC4D33RuBan5uWgwBQF7dAmi7H7Uptap9Yrg6197dLLOWsHRc
	 VmsTWebZhI0NI8Tu9o4g54ybHBYL2eyL4P8UYRtFhHWeAzSS1iDcPoaZo+Uhs6tI34Dfb
	 22ynvAQOvfM6oKRGr0/tQ8Fr/IaOOBIovcvq/gmE+lahaoBTt1veDw1J9qy/JvP7QKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716450;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=4ei8VWimnYV+Bwu8FysUlKVY7l28DimLQlCI3Ur68F8=;
	b=yG3oaLWriQkDDnqIZB6/a6RiS66fuFqIuhvJ/tAbJS3UVfvuSZKSmmlZ4FfjFwO8J99S
	 HP+7o0PHBEP3tYFcjTy6Bkc4/3xrS+h0aVGdaW730awn3i1yUoKJ237exF2rUNgRbkXS/
	 Vo7qk1n3APnOckm6kdZD6yhghuIgV126OohznCtMZhCamSFOg46Y1LfSewux0Fq13QPMw
	 0eGPtESzbaqUY5r5En/yCnQiiD43kTaN5dlNTg+ie9ubbzlH9KKxzp3SR0gCjslzXcQEy
	 k++U09w1nfUlivs+aYbb818BJScU+v9ssN+y1hWSlT18yNqhEJMBuIa6hS3kHSP6tDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=sJYuyUCz;
	arc=none smtp.remote-ip=79.135.106.98
Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A18F606A33B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 14:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A18F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=sJYuyUCz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793716447; x=1793975647;
	bh=4ei8VWimnYV+Bwu8FysUlKVY7l28DimLQlCI3Ur68F8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=sJYuyUCzkNU/lmgDb0NwnnxE4957XBhDJxljyhYhXxubK3nITlCHcpr75CZzF6D4h
	 DBF5FLZKmS4dGUFfXmTjgHmbKH7lDuCX/YctsWdU73r9Evkx4Zutb1RmFVGlgfghec
	 dLX+dM4dVCsv3WhVe19+/Fc7zNy/YskLFq04IKQkLttpCTvDNaPyLv5+ASOALXSTm2
	 6pd3bQsxfLza73fL+JIyAC2ippfNzBF54nXiXuMMfc5+mkVjJq0OLEZ3aVn4WFCBZM
	 OicfTi4OMHZ7i+oSY9i5J3biCLw8igL5SZfJzsZgkt8R2vekBLQ/9ZiiEXjbaIxsZf
	 1xqmPJLsU/syg==
Date: Tue, 03 Nov 2026 14:34:02 +0000
To: Daniel Thompson <danielt@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: add Kinetic KTD3137
Message-ID: <_kyk4j6fx0PX5QqVrjAIGH-5fzUhj-fKhD8YT4F734mCOnQCDXui6wQB77AOka69_gblWOJN2SxzC5OSrH1lXiQeciLfVnWuPHS0JfaMKD4=@protonmail.com>
In-Reply-To: <aunqGVkX7-Y61iDA@aspen.lan>
References: <20261102-6768-ktd3137-v1-0-b5b4f903c56e@protonmail.com> <20261102-6768-ktd3137-v1-1-b5b4f903c56e@protonmail.com> <aunqGVkX7-Y61iDA@aspen.lan>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 53d7bfe873821e818f7ca436899c3f949815e231
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tuesday, November 3rd, 2026 at 4:05 PM, Daniel Thompson <danielt@kernel.=
org> wrote:

> On Mon, Nov 02, 2026 at 09:58:48PM +0200, Roman Vivchar via B4 Relay wrot=
e:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Kinetic KTD3137 is an LED IC, used in various mobile devices for the
> > display backlight. Add devicetree bindings documentation for this chip.
> >
> > Datasheet: https://www.kinet-ic.com/uploads/KTD3137-04a.pdf
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >  .../bindings/leds/backlight/kinetic,ktd3137.yaml   | 64 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  5 ++
> >  2 files changed, 69 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,k=
td3137.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd3=
137.yaml
> > new file mode 100644
> > index 000000000000..140615640a9a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd3137.=
yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd3137.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Kinetic Technologies KTD3137 LED Backlight
> > +
> > +maintainers:
> > +  - Roman Vivchar <rva333@protonmail.com>
> > +
> > +description:
> > +  The Kinetic Technologies KTD3137 is an I2C LED backlight driver for =
medium
> > +  to large size LCD panels.
> > <snip>
> > +  led-max-microamp:
> > +    minimum: 5000
> > +    maximum: 29800
> > +    default: 20200
> > +
> > +  vin-supply: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vin-supply
>=20
> Why is vin-supply required?
>

The chip cannot function without VIN power supply. Even if it's on the
always-on power rail on certain board, there's always a chance it might be
accidentally left disabled on the other. It's better to document supply in
the bindings as far as I understand.

Best regards,
Roman

>=20
> Daniel.
> 
