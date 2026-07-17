Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DDE3403E9;
	Fri, 17 Jul 2026 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303773; cv=none; b=u5qFpYGQVsAClVNdwtJawm4svAasp1vS4csHrDPTXZ4T+xWY3TYF0xw1eK1W/Mp/lKfvj6WMYbkLu+ITF3KY1tbEvnnJfLPsFvnF/LYerxC7JKC52UsQK5OlKH0CZwRO1xNAjKKgJ1/RgBWlU2sYNqwXJT0N01eMScRZNiWsqP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303773; c=relaxed/simple;
	bh=ZC+aybt/xs01TSo2+OGzHuUqZUn64HDjZmRVPTsj9XE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCoL1qvd6kdmvxjXqF/AAXzbBs+oN7+b3AbguKntF+kj8hIK9vEioR78wQJ+qoc9Ho+dVP/bBgjkr3kuA3pKEl9JVbPuvod7Qr7VZ1VDIzGIKIWHsHvPzLU1kKA0ckZPaTLEBIypFvvIqJsCClx0mJrUrlM7C1vBcUInDp+a8No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=u4pxVUIQ; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="u4pxVUIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1784303770; x=1815839770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZC+aybt/xs01TSo2+OGzHuUqZUn64HDjZmRVPTsj9XE=;
  b=u4pxVUIQorqhyhM59HsIkJrtZRWzmCBQiunoU91XuHpVxYswV1sZUb3B
   CLZJxS48dU9ZoEyXZ3bXq7lH0z77ldczfJFURrQmMCmL0Ht5T4ybUKuhK
   Fu9HzHOGSpf6wPcM7gd+qpK7PJbt1RQdTha2WRPFi1jUDdxQWZLwF7heE
   xZ92sv+AyKQbnsGVQQddMtIuJwiO74E3JQSRsxzUZL1u4MyHkC/+24lNg
   6QUrGQHMCj8YtyKss9EbsfsDTGOm1x3tWIwll4idT25ESpJin9kbLcib+
   4DNimvfIzQQHYWp7uTk9zd6iKy5i9vVr7zE/B9Dbu2q3zvBkthPyh2YDJ
   g==;
X-CSE-ConnectionGUID: ZN/leDicTCiSEFrhkwE2NA==
X-CSE-MsgGUID: g38FcU1tTXG+bOBprlDStQ==
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="asc'?scan'208";a="61112917"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 08:56:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Fri, 17 Jul 2026 08:56:02 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 17 Jul 2026 08:55:57 -0700
Date: Fri, 17 Jul 2026 16:55:00 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
CC: Conor Dooley <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <samuel.holland@sifive.com>, <dlan@kernel.org>,
	<guodong@riscstar.com>, <dfustini@oss.tenstorrent.com>,
	<michal.simek@amd.com>, <junhui.liu@pigmoral.tech>,
	<darshan.prajapati@einfochips.com>, <akpm@linux-foundation.org>,
	<zhangchunyan@iscas.ac.cn>, <luxu.kernel@bytedance.com>,
	<pincheng.plct@isrc.iscas.ac.cn>, <nick.hu@sifive.com>, <jim.shu@sifive.com>,
	<zong.li@sifive.com>, <greentime.hu@sifive.com>, <robin.randhawa@sifive.com>,
	<scott@riscstar.com>, <dave.patel@riscstar.com>, <raymond.mao@riscstar.com>,
	<pawandeep.oza@oss.qualcomm.com>
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Message-ID: <20260717-imitation-corridor-ce127d4093fd@wendy>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
 <aj5m00m4KxRAPAnB@plin-1878>
 <20260626-chitchat-purity-33af51f88380@spud>
 <akOkXpPi46LBHuIA@plin-1878>
 <20260630-frisk-excavate-7d562df75585@spud>
 <aloGd39fAlev7+4p@plin-1878>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7P4celFdWTWKZ/T/"
Content-Disposition: inline
In-Reply-To: <aloGd39fAlev7+4p@plin-1878>

--7P4celFdWTWKZ/T/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 06:39:51PM +0800, Yu-Chien Peter Lin wrote:
> Hi Conor,
>=20
> On Tue, Jun 30, 2026 at 07:06:14PM +0100, Conor Dooley wrote:
> > On Tue, Jun 30, 2026 at 07:11:26PM +0800, Yu-Chien Peter Lin wrote:
> > > Hi Conor,
> > >=20
> > > On Fri, Jun 26, 2026 at 03:36:38PM +0100, Conor Dooley wrote:
> > > > On Fri, Jun 26, 2026 at 07:47:31PM +0800, Yu-Chien Peter Lin wrote:
> > > > > Hi Conor,
> > > > >=20
> > > > > On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> > > > > > On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wr=
ote:
> > > > > > > Add per-hart DT properties for RISC-V Worlds architecture:
> > > > > > > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > > > > > > platform-defined values are primarily used by M-mode firmware
> > > > > > > to configure World ID CSRs and restrict WID usage across
> > > > > > > privilege levels.
> > > > > > >=20
> > > > > > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> > > > > > >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++=
++++++++++
> > > > > > >  2 files changed, 98 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/w=
orlds.yaml
> > > > > > >=20
> > > > > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yam=
l b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > index 5feeb2203050..4b5778b6d3e7 100644
> > > > > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > @@ -26,6 +26,7 @@ description: |
> > > > > > >  allOf:
> > > > > > >    - $ref: /schemas/cpu.yaml#
> > > > > > >    - $ref: extensions.yaml
> > > > > > > +  - $ref: worlds.yaml
> > > > > > >    - if:
> > > > > > >        not:
> > > > > > >          properties:
> > > > > > > @@ -120,11 +121,31 @@ properties:
> > > > > > >        thead systems where the vector register length is not =
identical on all harts, or
> > > > > > >        the vlenb CSR is not available.
> > > > > > > =20
> > > > > > > +  riscv,pmwid:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > +    description:
> > > > > > > +      Platform-defined M-mode World ID (WID) assigned to thi=
s hart.
> > > > > > > +    minimum: 0
> > > > > > > +    maximum: 63
> > > > > > > +
> > > > > > > +  riscv,pmwidlist:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > > > > > +    description:
> > > > > > > +      Platform-defined bitmap of M-mode World IDs (WIDs) tha=
t this hart may use.
> > > > > >=20
> > > > > > I don't understand what the difference is between this property=
 and the
> > > > > > one before it are.
> > > > > > Is this one meant to be used by m-mode software to then select =
one which
> > > > > > will appear in riscv,pmwid?
> > > > >=20
> > > > > pmwid (single value) is the reset default, while pmwidlist (bitma=
p)
> > > > > defines the allowed set. The root-of-trust M-mode software may se=
lect
> > > > > an allowed value from the pmwidlist and write it to the mwid CSR.
> > > >=20
> > > > I don't understand the point of the property then. If it is the res=
et
> > > > default, just read it out of the register?
> > > > Unless I am missing something, it's useless to s-mode because it may
> > > > not be what m-mode chose and useless to m-mode that has access to
> > > > the csr.
> > >=20
> > > Smwid is optional. In the no-Smwid case:
> > > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/=
SoC
> > >   registers, exposed to software via riscv,pmwid DT property)
> > > - S/U-mode's WID depends on opensbi-domain configuration [1]:
> > >   - If next-wid is specified: S/U use that WID (via mlwid CSR)
> > >   - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
> > >     world)
> > >=20
> > > So riscv,pmwid serves two purpose:
> > > 1. Source of truth for M-mode's WID when mwid CSR doesn't exist
> > > 2. Fallback value for OpenSBI to write to mlwid when domain config is
> > >    absent.
> >=20
> > So it is not the default at reset at all then. The reset default is
> > something else entirely and this is used to overwrite that.
> >=20
> > > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/=
SoC
> > >   registers, exposed to software via riscv,pmwid DT property)
> >=20
> > In this case, it seems like pmwidlist would just contain a single entry,
> > and there is no need for pwmid.
>=20
> The pmwid and pmwidlist properties cannot merge because pmwidlist represe=
nts
> an optional hardware mask. On physically unrestricted platforms, pmwidlist
> doesn't exist, making pmwid essential to define the hardware reset defaul=
t.
>=20
> >=20
> > Quite frankly, it seems like you need to decouple these properties from
> > being 1:1 mappings to your extension's CSRs and both name and explain
> > how they are to be used by software.
>=20
> These properties are actually not 1:1 CSR mappings. pmwid, pmwidlist, and
> pmlwidlist are the exact terms used in the RISC-V specification to descri=
be
> these platform-defined hardware values, so I prefer to follow it.

CSRs or terms in your extension, it matters little.
Your properties should reflect how software will actually interact with
the devicetree and wordguard. There's no point having a bunch of
properties that relate to aspects of the extension if software is not
going to actually use them.=20

I fundamentally do not understand why software ever needs both both the
singular and list properties. What does software actually do with the
list property when both it and the singular property are provided?

I expect to see something simpler and/or much better explained in the next
revision.

> > Again same point applies here, why can a single-entry riscv,pmwidlist
> > not suffice here?
>=20
> As explained above, a single-entry pmwidlist cannot replace pmwid because
> it would fail to represent the exact hardware reset default for platforms
> without physical WID restrictions.

If there is one entry, use that, and if there are multiple entries, pick
one?

Thanks,
Conor.

--7P4celFdWTWKZ/T/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalpQVAAKCRB4tDGHoIJi
0jrAAQD2HsxRZGdaMTjHcT10zblTSWUgCgqW990Vx+F307i2cwEAkCpsPtBdCPdm
ggloawOyflqzbNxyB17YUKeQz3W86wE=
=5mfd
-----END PGP SIGNATURE-----

--7P4celFdWTWKZ/T/--
