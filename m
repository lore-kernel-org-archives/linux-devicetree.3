Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039883E3DB3;
	Fri, 26 Jun 2026 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782464330; cv=none; b=HnnzMjaPXS/+D3nR3gVROIJTUtO36WIN9R+95RVhsfGfLCZSxsETJSMwP5evwCduo53o8nwY2+sRLARIOpSNcPhmtGM82Qw0OMbJnpVTKl2q7Sq9qHMKiN42E33PTNXGIbHY9GjjKQDGZuK0eFEVbA1Um+dFnKaGxujXpKnf09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782464330; c=relaxed/simple;
	bh=gBAXAZAAK2FtxoDd2n15ZSuLuPQ6DYQX29tnPTf6I0A=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzywc2uwwTyotTFdrKYA8ditm5aYIWw61qAbiN8Ry7ro3CCYAa7er70NRuePeCNYZZUGIVHI7W+yykpoJxIscMRW2/aFV5v+Tuemx+Fv0bfIfA7uVKBILCQeqezOs14VV27WMdZSiPulsRaJBCxHKIvpqh0vExVy6phpHEwHFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=b5yLiE9K; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="b5yLiE9K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782464330; x=1814000330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gBAXAZAAK2FtxoDd2n15ZSuLuPQ6DYQX29tnPTf6I0A=;
  b=b5yLiE9KGoLpZB8eBxh1L3jSvDwpTfpeSU9r9Qygf4D5UJooi8RZLaKG
   qvEwTK+cn0GsBtR84QxNxcdKjWPPrYV017T5TS+AGY3fSYG6lJV+cULAA
   ArpBxnIduE57y//KJsIzvwOrBsnobHoEEsHNB0doCyZayvi/7r0nmZYWt
   n5W9gSxLyL6UemwSbHAk2JQL9v9T+v10YuIzrsmWGWNko6UNRs7tdTa2U
   FFyM4742qZnvZuHVR0i0yzM0MyAS+Vs5+Y6VLfHSwZndw5AMYIUkGI5n6
   Uip5NV0I6AZihznWUXOHGUn1OSHZUKUkqQ9uWTKksePE9AgfY9eiVmwoF
   g==;
X-CSE-ConnectionGUID: IvWDA/V0S8+NXI2DA7OsIw==
X-CSE-MsgGUID: W/2gxdW/TaO6gXqF0Utz7A==
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="asc'?scan'208";a="59724797"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 01:58:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Fri, 26 Jun 2026 01:58:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 26 Jun 2026 01:58:43 -0700
Date: Fri, 26 Jun 2026 09:57:53 +0100
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
Message-ID: <20260626-agreement-express-b16c71315f7b@wendy>
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-2-a0987203069@gmail.com>
 <20260625-bobbing-annotate-d1c4d6874ee2@spud>
 <20260626-zit-amuck-e743e58d2e15@wendy>
 <84b93c496fabdeee05d2f962a1b764fdbfaacdb7.camel@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oMGcdFhNmrqDF+5V"
Content-Disposition: inline
In-Reply-To: <84b93c496fabdeee05d2f962a1b764fdbfaacdb7.camel@iscas.ac.cn>

--oMGcdFhNmrqDF+5V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 03:58:14PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2026-06-26=E4=BA=94=E7=9A=84 08:22 +0100=EF=BC=8CConor Dooley=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Jun 25, 2026 at 05:33:37PM +0100, Conor Dooley wrote:
> > > On Thu, Jun 25, 2026 at 05:44:43PM +0800, Joey Lu wrote:
> > > > +
> > > > +=C2=A0 - if:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 const: nuvoton,ma35d1-dcu
> > > > +=C2=A0=C2=A0=C2=A0 then:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 2
> > >=20
> > > Anything that updates the minimum constraint should be done at the
> > > top
> > > level of this schema. The conditional section should then tighten
> > > the
> > > constraint, in this case that means only having maxItems.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 2
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - const: core
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - const: pix0
> > >=20
> > > Does this even work when the top level schema thinks clock 2 should
> > > be
> > > called axi?
> >=20
> > Additionally here, only have core and pix0 seems like it might be an
> > oversimplification. I doubt removing the second output port means
> > that
> > the axi and ahb clocks are no longer needed.
> > Is it the case that your device supplies the same clock to core, ahb
> > and
> > axi? If so, then you should fill those clocks in in your devicetree
> > and
> > this can just constrain the number of clocks/clock-names to 4.
>=20
> The clock controller of that SoC is quite weird -- it has only a single
> gate bit, but controlling 3 clock gates. All core, ahb and axi clocks
> have gates controlled by this single bit, so it's why currently it's
> modelled as only core clock supplied.

Yeah, then what's in the binding is definitely wrong.
Even if the same clock was provided to all clock inputs in the IP, all
individual clock should be listed in the devicetree - although it will
look a little silly to see clocks =3D <&foo 2>, <&foo 2>, <&foo 2>, <&foo 2=
>;
In this case, 3 clocks controlled by 1 gate bit is an implementation detail
of the SoC's clocking hardware, and not relevant to how the dc instance
should be described.

> Well it might be worthful to supply the bus clock before the gate as
> ahb/axi, especially axi, because both the AXI clock and the core clock
> constraints the maximum pixel clock.

Right. And looking at patch 4/7, and the wording:
| The Nuvoton MA35D1 SoC integrates a DCUltraLite display controller whose
| AXI and AHB bus clocks share a single gate enable bit with the display
| core clock, so the clock driver does not expose them separately. This
| patch makes the axi and ahb clocks optional in the probe.

It sounds like there's probably some issues with how things are modelled
clock wise in this device, unless this is not an accurate statement and
there's actually one clock provided to all three inputs. If they're
distinct clocks, with different rates, only having one exposed has a lot
of potential to be problematic!

--oMGcdFhNmrqDF+5V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj4/EQAKCRB4tDGHoIJi
0sgLAQDTZ355M4AEO2uZkBGTQ7oEMZkFXQdFbefyp5zI+AwZFgD9FvkomdGAUC4V
3G3h0sz6Ep5t2DWWrSj9oLBU7J3uQwo=
=jvWv
-----END PGP SIGNATURE-----

--oMGcdFhNmrqDF+5V--
