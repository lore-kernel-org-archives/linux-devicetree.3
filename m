Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259A23DB645
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348162; cv=none; b=bkFESArft2M2m206VrGmGcgE/46wlPhaj3cYszan68nAEAjV1dJlywI3QQHhNVHfQYHmNtqooEoVR1HX/GMFVXMrHUp0rXkQ5vIwrkrpBeG+MRly7N7fdjCv6xNTnQrMKwLK0211NbPMcG1ENzGVYdNtP/9EYO0OOXtmFyB/tO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348162; c=relaxed/simple;
	bh=eFW8dHy6Zg23j5JB3FyPdcRYGKquzdaBg6ZNicFYOK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoBMaikfzuYfFT+IBSiFlMHp53p5doUQost+Txp88cFByXCSzNdGw/RWLz3RVo4iTi+Z4QOGt1pqUZ+G8If0iVvt9qVoVtUZnuOkrhsrhxjNmUIBt/w2sZ04UWsWIBusfHOB0xx9dmRnvMO/h5yJC60t7bNij6XgJzn3vooVBQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULwq7BDm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULwq7BDm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3693C2BCB3
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 14:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776348161;
	bh=eFW8dHy6Zg23j5JB3FyPdcRYGKquzdaBg6ZNicFYOK4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ULwq7BDmQp2vdyNdvoOqZzBcQ759Wsn5hGIEVpy3iUuJCqEB+fg/lW6lY9vCezxKZ
	 u+mpNmiaZlMctGRpXJR3NX5P6Bt0EMGpznhrNaRkewDvsdhrXgpeBMp6Qh8+7VF20Y
	 Yqp+SX8dTrpHpMUUSpXzZxpzM54Um8ybPDeMqqdR5laEIVE+8vgxMw1q4/kRZcpsIB
	 WNtXckt0914ImHUCRBjImqE42fPc0XQBRwBHsX8ObFYnIc8wSIkRzgcn2QRocxcFXy
	 TYjgspWdWk/e1F0jPxeu81LnIc3VzF4mT9WiXC/nxoDfV6ZmXsDRL/1h9xw+87DKy8
	 ZUuYhaZ0HRZvA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6712fd40860so9643881a12.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 07:02:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+DVKI8BKzWRSTiAeam44EZsQkEhd2b4FCOvX1FcGsZ1ROA3Bm/Rfo9LGzWjF42w3Rl09+gtQngB5j@vger.kernel.org
X-Gm-Message-State: AOJu0YwwqKrcFkYoQIL8X8X7zkeALD/+mr5LCQjRWvjK/csSLjzU3InU
	NSFmpHrRoyxYBWKseSqw0XR2Y8ACbpayCCxqE/Qx0h8aDlNS0fKQ9G2AVcAc/IVmKvi3r2JbBjp
	7Dij6Wv5a6TZDVtUQvSk/mQ3HoAr9PQ==
X-Received: by 2002:a05:6402:24d2:b0:66f:a7e2:b28b with SMTP id
 4fb4d7f45d1cf-670795072cbmr9644507a12.9.1776348160222; Thu, 16 Apr 2026
 07:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
 <20260412-b4-ffa_ns_sgi_gicv3-v1-1-af61243eb405@kernel.org>
 <20260416121146.GA2736962-robh@kernel.org> <20260416-true-prophetic-centipede-3ad8e5@sudeepholla>
In-Reply-To: <20260416-true-prophetic-centipede-3ad8e5@sudeepholla>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Apr 2026 09:02:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLdSi2x-KibY7WXTEot8Bj=54XeE1VACtLTujxn0VTxRw@mail.gmail.com>
X-Gm-Features: AQROBzBIbU1scggnZL1CVMnkgU8q8vOpAVBM10XITxPhsoofCMIRMJjnOpjom_Y
Message-ID: <CAL_JsqLdSi2x-KibY7WXTEot8Bj=54XeE1VACtLTujxn0VTxRw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller: Add support for
 secure donated SGIs
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 8:09=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Thu, Apr 16, 2026 at 07:11:46AM -0500, Rob Herring wrote:
> > On Sun, Apr 12, 2026 at 06:04:37PM +0100, Sudeep Holla wrote:
> > > In GICv3, SGI security is defined by interrupt grouping and configura=
tion
> > > rather than by SGI number alone. Linux conventionally reserves SGIs 0=
-7
> > > for non-secure internal kernel IPIs, while higher SGIs is assumed to =
be
> > > owned/stolen by the Secure world unless explicitly made available.
> > >
> > > Document secure donated SGI interrupt specifiers for the GICv3 bindin=
g.
> > > It describes "arm,secure-donated-ns-sgi-ranges" for SGIs donated by t=
he
> > > secure world to non-secure software. It excludes SGIs 0-7, which are
> > > already used by the kernel for internal IPI purposes.
> > >
> > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > > ---
> > >  .../bindings/interrupt-controller/arm,gic-v3.yaml  | 27 ++++++++++++=
+++++++++-
> > >  include/dt-bindings/interrupt-controller/arm-gic.h |  1 +
> > >  2 files changed, 27 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/a=
rm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm=
,gic-v3.yaml
> > > index bfd30aae682b..664727d071c9 100644
> > > --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-=
v3.yaml
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-=
v3.yaml
> > > @@ -45,17 +45,24 @@ description: |
> > >
> > >        The 1st cell is the interrupt type; 0 for SPI interrupts, 1 fo=
r PPI
> > >        interrupts, 2 for interrupts in the Extended SPI range, 3 for =
the
> > > -      Extended PPI range. Other values are reserved for future use.
> > > +      Extended PPI range, and 4 for SGI interrupts. Other values are
> > > +      reserved for future use.
> > >
> > >        The 2nd cell contains the interrupt number for the interrupt t=
ype.
> > >        SPI interrupts are in the range [0-987]. PPI interrupts are in=
 the
> > >        range [0-15]. Extended SPI interrupts are in the range [0-1023=
].
> > >        Extended PPI interrupts are in the range [0-127].
> > >
> > > +      SGI interrupts are in the range [8-15] which overlaps with the=
 SGIs
> > > +      assigned to/reserved for the secure world but donated to the n=
on
> > > +      secure world to use. Refer "arm,secure-donated-ns-sgi-ranges" =
for
> > > +      more details.
> > > +
> > >        The 3rd cell is the flags, encoded as follows:
> > >        bits[3:0] trigger type and level flags.
> > >          1 =3D edge triggered
> > >          4 =3D level triggered
> > > +      SGIs are edge triggered and must be described as such.
> > >
> > >        The 4th cell is a phandle to a node describing a set of CPUs t=
his
> > >        interrupt is affine to. The interrupt must be a PPI, and the n=
ode
> > > @@ -136,6 +143,24 @@ description: |
> > >        - $ref: /schemas/types.yaml#/definitions/uint32
> > >        - $ref: /schemas/types.yaml#/definitions/uint64
> > >
> > > +  arm,secure-donated-ns-sgi-ranges:
> > > +    description:
> > > +      A list of pairs <sgi span>, where "sgi" is the first SGI INTID=
 of a
> > > +      range donated by the secure side to non-secure software, and "=
span" is
> > > +      the size of that range. Multiple ranges can be provided.
> > > +
> > > +      SGIs described by interrupt specifiers with type 4 (SGI) must =
fall
> > > +      within one of these ranges. SGIs(0-7) reserved by non-secure w=
orld
> > > +      for internal IPIs must not be listed here. "sgi" must be in th=
e
> > > +      range [8-15], "span" must be in the range [1-8], and the range=
 must
> > > +      not extend past SGI 15.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    items:
> >
> > As a matrix, you need:
> >
> > items:
> >   items:
> >     - ...
> >     - ...
> >
> > However, given this is at most 8 entries, I would just do an array:
> >
> > minItems: 1
> > maxItems: 8
> > uniqueItems: true
> > items:
> >   minimum: 8
> >   maximum: 15
> >
>
> Makes sense.
>
> > Unless we need more flexibility in GICv5?
> >
>
> IIUC, there are not SGIs in GICv5 and we may need to use one software PPI
> as a replacement for SGIs. LPIs are used for IPIs.
>
> I am assuming Marc will soon post his opinion/rejection on this series =
=F0=9F=98=89
> based on some offline discussion we had with respect to how it fits with
> GICv5.
>
> > Is there an example we can stick this property into so it gets tested?
> >
>
> Not sure if [1] serves as an example or you are looking for something els=
e.

In the binding example, but don't add a whole new example for it.

Did [1] pass validation? If it did, it shouldn't have and I need to
investigate. If you didn't run it, then that would be the reason I
want it in the binding example.

Rob
