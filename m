Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486924;
	b=2vxRyxeHOrjBlNWAFEoinGNVMiF8z2HlVJZrZz2hYDpZ3HkWZ/8rmPLambudzM1FfwnM
	 TlON9KxJZE55omqZGFXYiUPkrQx3fcxOsMwMet3xe8+wWuKqLe5iNe48QjPXcEWpzcCrP
	 xuYNqS+qbHkzJVt3cpEdON4SK5wfrpXw+z0+8jvH6VNOEZQPbSbwoVF2IIj+UcOctF9jV
	 cdGNHGJYPPG1o6I0mpLIfI/K4xQCdQ9YojzeLhs+1IzsONxDTOesWXfL8jKqfXkUS/mx8
	 tOBcNy4qZwvBq0zy8SUuCIjK4jDpe+uvWWGRL68BjO6PFfgx/vjku2D1UPL0WIKz5XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
	b=TUkoaZQo1/rpJBJzNRRnU5XRURE5JwvPTklveUpf0NRPx7NuwdZTKSry/ATcsHf+x1w8
	 cf9OXmtlmT2w+xVpzV7Mowem5DaQiP+PbIbknpvBZzBPJpCxJpqImx8jHXJKhd18xbuLu
	 uzkCRgV4UaEdUpYNxysXvVZ5/skOpCCm2jlz7fqQdtpi5jjw+47fLks7N7ltd8Zphv3RX
	 aj/Hik7mEqsws8UG4ZPK6hYwvNYjkM46Lf26txm5P1DDC3/XGLC/fhGHesTaVbPvhNiGl
	 u1AYU5QMsQu5p5kTuEJrf4f7B+B2IHUH4dXSULOLryBG6t/i+hpJG0kHwFElHSWOtcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ums0J9tX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB5D606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB5D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ums0J9tX
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso41109245e9.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:35:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794486922; cv=none;
        d=google.com; s=arc-20260327;
        b=IHdSk7xogw4ZbIitoy/s4Ej3unkJ40TKGfJRcpmvQLXqATOT6x7aogU+obv+4RnD8c
         MUh9/x3agtMaGSM1TZunnn9h3HJKhRu1Y+rRCOD0OLv4wEScczNFPrHcoHohax2qRLTi
         Bd+NUEfYRkPolvePXwzuYFUt+1kqjTKp+DuvqmgwF9ce11tjGRqXX6elAPy7KhKCQJZs
         O5rP0J/gcf+FUFGqUa4xp61Yuw5R4z7Dh6xvG9LvlvuwuzYmASmJaTZVALNLtg0p77ub
         tv1d028ONEeBnAXcn4kLb8KUyCUGjdqbpnssH1YEvpT3Rxh9GP+FRC920Zwly/4fpVci
         lwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
        fh=3NpAHCsFrWfEnl6T1l+foQY5FTw0eCvmltsl3l6VX8A=;
        b=SWis+rSP4PwxzsF+R8f+8P5rphQJFt1SmRFa2seT55G85OvUihbH7hu/432blxbgQr
         R1HHnDsufIHblNfWvvFmLrMbLwM+YRmLUnthLt9cnvgUyStQ3vgEHw2Yz9W17I0mUN1O
         fJgKqszCsEKgA6TWboLfq6jAn4g3hhVF42XBBPv/Fr2hxSphYa572LiNwjqGPBoNV5N2
         uUT7w5TT5AuSknjfGtqZ5CLFH6Xp+o/QMJyMwCCaXB5KPw0Rn21McQnuoYY+2b1RbmNh
         kdjpewWJrOjkUI3v/kj72wunike/tSDyCDUsMkBirvmZLGFwEbgQZF4gr5HK4IQgsVXJ
         Do4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486922; x=1795091722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
        b=Ums0J9tXeHFKhdP+fol+vzmGnv1+Fue5K3B2lj8LLRXkHXY3JaZgN1a68UZDyVwlr3
         b+0TXQx6uz2DxdQO9FJRj6XA4Pwp5YiLBfzHunkAP5nZXfa20p8ohSXA/npzC9fTPsof
         YCI6CV0szHYmKPkXtlYqz3aToZBEJPSZnO3qJny8ZRSWwckefgqbggkEwAI5aEzUA0Vt
         ks8xjf2GELPaPEaJ0BQpF8FQOm3C6U7vbbVBf6l3M2MbyEnOxikMPL1dXYKfefIFcB7Q
         NDEggS0PaVnv+7mUAzLQBIW9SgIF2fBI7ZuxfzOOKngGjXrCabf714t5TK6zi46fwp+G
         FNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486922; x=1795091722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
        b=hi7Q0m1ZXvqd6BbkM+n+lAG8vXaYS4GxhjWeBww3FMS/JbsagVCOF5sl+AH9OnJiDb
         eK+Z/Fx4swlE1q7uS2COTK0PlYWQTZ7LxlZUhWAbOAHCzEnwuypr3KjWo9ZoH9tajD2k
         gt8b9PceEeoSPVrmm3aI7i4NLYeGwEf4RyJ/HxscfqkOQzL7blJn+rItF7Cq2TWat6cN
         3BHv4WUzFetKkl1K23TYbTbwio+9uPYxs32b+jt2wMGaCKGJH8dbrShfaNxhYxnQV7Jn
         IKd+6c/FYjFY+lKZL1HkrBtejvrY+/K7DeWi3GxbimZ+FxAnZNzP1hmgYrdWgKEyngsg
         khRQ==
X-Forwarded-Encrypted: i=1; AL+hErGy7Pp9wWNr8rVsCie+8D85uJNh7vzNOF0MfsoNEqynSDgyMd8SNdXpAPYzCMBOsfFvoN4RerYA8Ttq@vger.kernel.org
X-Gm-Message-State: APuU4Z8dc1I8blc+DQqsfw4LG91EE9I7FUoNAh/M2mVIuJMZqEWGrXWX
	fDjeClRHo3HpHjJpizujdegSVTT1XjAdOR5iX32PofIAGfr/qg93TZtU1ZCUlcpYf7ARs9FfkGR
	C1ISBoap0zx2vXfnB9i2jhIcdW9pL0WA=
X-Gm-Gg: AYBFou17I0iMAPdK6zoq1DY+RqsnU+3c82e+3pX7+k2ygyyRTbiwRUvDzfybofuChJO
	CjBj5o/eq0bA0EFOxfKKzsV6U6KgZ70aqDc+cRwJ1I0qm3NVZn/14kCoAqNxtPE112oEY1xeOn4
	h6KcivAuN+TCbEIqCq/6Us5CW+jtZj/SJJ6nreSLNQ8VFgAkhlO1xIzX4SdNoKjk5SXub40cEOj
	QH0EqGQ7ZsSdXzC+SYy9qPDeytvgXpg//nsAB2jhIQb0QmO8c2axe0kByXlmQ2df+f0QQT8RHc3
	P2Q6nLdia9NsymkseGSN7etwtH+4qZIXJnClaz/Nwcfm17UEYUKqmgu3pwOBO8K7cmHMdtgjlEd
	bBOKtxTzB6AjpJ89zjP+audSTPApnfA72e1wk1wVQMMUrN2207Le7iaHoqzQLbso68LDPZ1DtLY
	pq/FOuqHwwPZiLk5UBQw4q8Vhl+vNmSvyNIrrTBn/uP7eO91aDuPb5GfIisQz15F5Vh29z3cCOB
	T61cAI3s/NRwjfnGwU8
X-Received: by 2002:a05:600d:84ca:20b0:4ba:493b:3401 with SMTP id
 5b1f17b1804b1-4ba493b3412mr59282305e9.9.1794486922109; Thu, 12 Nov 2026
 04:35:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261104182105.1102555-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261106154454.GA3654918-robh@kernel.org>
In-Reply-To: <20261106154454.GA3654918-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 12 Nov 2026 12:34:56 +0000
X-Gm-Features: AclHuK9CRcx1aTAbEKf-B1mAZlFhg1ndxA-uzYSl8n-I7fAtC3zV5PucT1NF8gU
Message-ID: <CA+V-a8uN1D7CQmKtAizY40NUOXHDLO2VG8JiAiLTyNb6uG=9jA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 05/14] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Disallow ports beyond port@4
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review.

On Fri, Nov 6, 2026 at 3:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Nov 04, 2026 at 06:20:53PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Restrict the A5PSW ethernet-ports node to ports 0 through 4, matching t=
he
> > hardware configuration of four external ports and one CPU/management po=
rt.
> >
> > Although the schema pattern limits port nodes to port@0 through port@4,
> > additionalProperties: true allows other port nodes to pass validation.
> > Set additionalProperties to false and explicitly allow #address-cells
> > and #size-cells so that ports beyond port@4 are rejected.
> >
> > Existing in-tree device trees describe only port@0 through port@4 and
> > are unaffected by this change.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> > - Added reg items validation for ethernet ports
> >
> > v2->v3:
> > - New patch
> > ---
> >  .../bindings/net/dsa/renesas,rzn1-a5psw.yaml         | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5p=
sw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > index 9c477ceb170b..250c59e58439 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > @@ -63,12 +63,22 @@ properties:
> >
> >    ethernet-ports:
> >      type: object
> > -    additionalProperties: true
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
>
> Drop all this.
>
> >      patternProperties:
> >        "^(ethernet-)?port@[0-4]$":
>
> And make this "^(ethernet-)?port@". Then any node will get the 'reg'
> schema applied. That doesn't check the unit-address, but the way to
> check that is comparing it to the reg value (not yet implemented except
> for specific buses in dtc).
>
Good point.

>
> >          type: object
> >          additionalProperties: true
> >          properties:
> > +          reg:
> > +            items:
> > +              - maximum: 4
Here I can drop items and just have something like below:

         properties:
+          reg:
+            maximum: 4

Cheers,
Prabhakar

> >            pcs-handle:
> >              maxItems: 1
> >              description:
> > --
> > 2.56.0
> >
