Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E883DE453;
	Fri, 26 Jun 2026 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458420; cv=none; b=S6FgtNzwxjaEOojFO9sBUvG3rSZRsbmcv00wxLzyoV1YDPpF/xX7srgx225L723xy2BaGEaq4rvfCIHRR2fsTRj6J9wLDyxLf6hzDuf4dbqDxjSSAuCCVjJQ/YgqPsda1NNDtoFTm0uYtMNfjjksf3KGzyS6mX0ir9I894oPQys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458420; c=relaxed/simple;
	bh=ISWXHKaawn9h3mmKev98WgFcthqdhjvovZhyVz7j7f8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RihVlG5WSe+wyh9uKM8F7zHl4X5j5ck56b4PAx1asSeU/XYlRcoQgtRdmynPUbKDRFYBKAU98A/NGbPmXghiltsDBjYfAbEZXv+GRnvCIyW1Hv8dh312bstoaeW6D/PVqv2ZjQ6V3gjZmzdNxoO62CZYvZeRQ2Cc5oUz7TwH1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=PNynaQeQ; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="PNynaQeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782458420; x=1813994420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ISWXHKaawn9h3mmKev98WgFcthqdhjvovZhyVz7j7f8=;
  b=PNynaQeQ8cHGQSQgMHNp2EBryRRW83Gh2DClIUlRFAuyYI4qZWOjqYD4
   mNqGourYl/6f1uumEmJqzC58GQ0i0SSknKDOBaurK7jl5q9zbCnkdcLbV
   96s4Ga9beF78ly6Ulzlx3ThChajqGnaIISGd47246iaEuqPlqoTB+lUWQ
   Nn/vryRA2g6TTHkIGQXMwrXvl0WiQvXYO/ztUswK41Jjk8a6PFSnLplXO
   3fr9wEVOxDMrXrnmhRZrVOoDe+QZDrbXaH6zpW7w1mHxBajBsQDtxYBk9
   OeQZAAZnvBYalDwDKKWurlbvT2X4olV/VP1cRI1REnOj972oasNkL1tTu
   Q==;
X-CSE-ConnectionGUID: /ckA0SlxThe1rb4/x1hBOQ==
X-CSE-MsgGUID: JEpd77qjQQicd2yYZkhrag==
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="asc'?scan'208";a="58875964"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jun 2026 00:20:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 26 Jun 2026 00:20:12 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 26 Jun 2026 00:20:09 -0700
Date: Fri, 26 Jun 2026 08:19:19 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
CC: Conor Dooley <conor@kernel.org>, Joey Lu <a0987203069@gmail.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<ychuang3@nuvoton.com>, <schung@nuvoton.com>, <yclu4@nuvoton.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
Message-ID: <20260626-astrology-mural-853d3860e048@wendy>
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-2-a0987203069@gmail.com>
 <20260625-bobbing-annotate-d1c4d6874ee2@spud>
 <e3fe23ddbc504879bd797bbaa595d3653fa139ff.camel@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7SoCkx0H/fbweAJy"
Content-Disposition: inline
In-Reply-To: <e3fe23ddbc504879bd797bbaa595d3653fa139ff.camel@iscas.ac.cn>

--7SoCkx0H/fbweAJy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 01:27:21PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2026-06-25=E5=9B=9B=E7=9A=84 17:33 +0100=EF=BC=8CConor Dooley=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Jun 25, 2026 at 05:44:43PM +0800, Joey Lu wrote:
> > > +allOf:
> > > +=C2=A0 - if:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
onst: thead,th1520-dc8200
> > > +=C2=A0=C2=A0=C2=A0 then:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 5
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 5
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 5
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 5
> >=20
> > All the maxItems here repeat the maximum constraint and do nothing.
> >=20
> > Since you didn't change the minimum constraint at the top level, your
> > minItems also do nothing.
> >=20
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resets:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 3
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 3
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-names:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 3
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 3
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - resets
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - reset-names
> >=20
> > Both conditional sections have this, but the original binding doesn't
> > require these for the thead device. This is a functional change
> > therefore and shouldn't be in a patch calling itself "generalise for
> > single ended variants".
>=20
> Well yes they're required.
>=20
> Should I send a patch adding the `thead,th1520-dc8200` part of the
> schema?

If you mean the code above, no. Adding a conditional section when
there's only that compatible doesn't make sense.

What you could do is just add it at the top level though, which would
also benefit this patch since it'd not have to be conditionally added
for the new nuvoton device.
Just note in your commit message about what the ABI impact of the change
to required properties is (effectively nothing because it's optional in
the driver and the only user has the properties).

> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resets:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-names:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 const: core
> >=20
> > This is just maxItems: 1.
>=20
> Well the implicit rules of DT binding schemas are quite weird...

I don't think it is that strange, as the binding has
  reset-names:
    items:
      - const: core
      - const: axi
      - const: ahb
so just constraining to one item is the simplest way to do this without
duplication.


--7SoCkx0H/fbweAJy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj4n9wAKCRB4tDGHoIJi
0jrNAQDGXff+FunKOyT28vcC9lrAn2ZYxmbPl/I52t/aaUdp9wEAq5x1xHEXvb49
A3qqhyWWSlJZMo2jH5vbzEt1icggMwk=
=ND87
-----END PGP SIGNATURE-----

--7SoCkx0H/fbweAJy--
