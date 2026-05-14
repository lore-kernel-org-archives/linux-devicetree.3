Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9529C3451C1;
	Thu, 14 May 2026 18:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783009; cv=none; b=GaMYd46Nqw3p2rnXDvF21zfa5VWwMMH5Tj62gfyB7BAObG5SABMpFzlVmuLM+F0er/ht+CUGQihS613A+Qju1i6y4giyKJ+7lFFa4kGDau4LwU4TAK0jfctDg8jhHXajpBcjzy+Qg+H2v0ncvoXKFuqse/2iu5z0PXxymDRWNlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783009; c=relaxed/simple;
	bh=FbnqPx1PyG+vLXcxu/p7mAAyZB6jG62MlCbjDqegcOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkFzc/0W6tXJ1qQ5gzcfFa9bVatkn9j0SXcY/d1ramVlKDdlmwR/IP9fC8jNjIBOpYNrta1W1zLvWIfGMAdXLlDxXeK1x5Y7Z0YI4ZG2jPIZmGyVIzmpV4pRnpJzzhtS0S1tKFou49lY6OKvb2sm1D9ExDtSW/mV7eoUWldsF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHo615zd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHo615zd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A359EC2BCC7;
	Thu, 14 May 2026 18:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778783009;
	bh=FbnqPx1PyG+vLXcxu/p7mAAyZB6jG62MlCbjDqegcOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VHo615zdxBV5CnRnYQFbNnfeTEPg0c42CzSOCww0v6RZKq6FO8SHUD+jVIfssc53Q
	 LYBTrXEdkvDr4xq57A11u0r7muhywEHg8ok+CUiiG1VGCSbA0R+ofTQQBchp9/wvk9
	 8/1+JAegc4sTXECrl0iGip5A1g154qKDciQIwoc6Biop2+cEE0zp0UDIIIQqSZTH7H
	 djPwsodLwayyKjL/xik87Q2kjaI4alIqpnC3XDUnyrQ6jOiWjKQnlcdIbLxnB0wLkp
	 TNl7b8JPvH1r0nraQ/JeFbSSDSjElmKgsNCXBtjvzvDvH1FcZNqQqdcMTQg9erKeyP
	 RFfpdv4kdxQJw==
Date: Thu, 14 May 2026 19:23:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Chipone ICNA
 35xx OLED driver bindings
Message-ID: <20260514-accompany-expiring-c90c6af5f7a9@spud>
References: <20260514-icna35xx-v2-0-45acd1dfa566@gmail.com>
 <20260514-icna35xx-v2-1-45acd1dfa566@gmail.com>
 <20260514-ambush-salvation-ce6616190390@spud>
 <CALHNRZ8ukiSM2+uj+Qg6rVbUjjFeo88HQjLZsFHbHBs_GTy_1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QaqnQ43ZV9tPSjq0"
Content-Disposition: inline
In-Reply-To: <CALHNRZ8ukiSM2+uj+Qg6rVbUjjFeo88HQjLZsFHbHBs_GTy_1Q@mail.gmail.com>


--QaqnQ43ZV9tPSjq0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 01:20:57PM -0500, Aaron Kling wrote:
> On Thu, May 14, 2026 at 1:07=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, May 14, 2026 at 12:24:49PM -0500, Aaron Kling via B4 Relay wrot=
e:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > The Chipone ICNA35xx series of DDICs are high refresh, low power
> > > MIPI-DSI drivers for OLED panels. The icna3512 is used by the Ayn Odi=
n 2
> > > Portal and the icna3520 is used by the Ayn Thor top panel and the Ayn
> > > Odin 3.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  .../bindings/display/panel/chipone,icna35xx.yaml   | 79 ++++++++++++=
++++++++++
> > >  1 file changed, 79 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/chipone,=
icna35xx.yaml b/Documentation/devicetree/bindings/display/panel/chipone,icn=
a35xx.yaml
> > > new file mode 100644
> > > index 00000000000000..6464d8d0cf86d5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/chipone,icna35x=
x.yaml
> >
> > Filename matching a compatible please.
>=20
> Does this require splitting / duplicating the files for each ddic, or
> can one be arbitrarily picked and the other stay with it?

Pick an arbitrary one. Maybe which one is older?

> > > @@ -0,0 +1,79 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/chipone,icna35xx.ya=
ml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Chipone ICNA35xx display drivers
> > > +
> > > +maintainers:
> > > +  - Neil Armstrong <neil.armstrong@linaro.org>
> > > +
> > > +description:
> > > +  The Chipone ICNA35xx are a series of DDICs connected
> > > +  using a MIPI-DSI video interface.
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - ayaneo,pocketds-panel-top
> > > +              - ayntec,odin2portal-panel
> > > +          - const: chipone,icna3512
> > > +
> > > +      - items:
> > > +          - enum:
> > > +              - ayntec,odin3-panel
> > > +              - ayntec,thor-panel-top
> > > +          - const: chipone,icna3520
> >
> > Commit message should state why these ddics are not compatible with one
> > another.
>=20
> Ack. Short version: some of the mipi vendor commands don't match.
>=20
> > Rest of this seems okay.
> >
> > pw-bot: changes-requested
> >
> > Thanks,
> > Conor.
>=20
> Aaron

--QaqnQ43ZV9tPSjq0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYTHAAKCRB4tDGHoIJi
0qAHAQCcuD1m0Aug+tDgcu9OC2u4uROICoc6KGLbjktD42X11wEA1NPKmSPP5xHm
W16lFmxqdpLUsSx6/hAPF/rWsV02dQI=
=uBJJ
-----END PGP SIGNATURE-----

--QaqnQ43ZV9tPSjq0--
