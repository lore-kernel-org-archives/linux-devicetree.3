Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C53F23A1
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290293; cv=pass; b=SFyJOou2cY3IN6fg/LJ3k+HippFhT8LPoFR8kIg7bBdXtrulxXnqpSOhrtBVBD/cgW74tpnT8QicHanjD3q/nmGCMo1ZThLA1d25DrZr2obBK0/ze3qFeDmw8Bm2Jg1gwusV0HcdEgNE47seeh17NwHnz1HfHPbnZbPpaOhRIFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290293; c=relaxed/simple;
	bh=eiOOIR+BuCgNoFXzdn/1KJetRl3m/Y+Ifs/Wqtp9Tg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8xrvlWaTW3/7zFda+xRP0qHFMb3xgcVAbCnlx28vzSBFm2MvYjXf9tOXhqL6fsztgUP8L3Q3+Wbn/vk+7pxiiF8C5Ykuj5jhSZ4JE2UMO4DmjTTMR4bienJDKabsBkRXXppADouqOyD1CVaI+D24pqhsE5K2H+DCENtAVLo+Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8sogdFH; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8sogdFH"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso8397427a12.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779290289; cv=none;
        d=google.com; s=arc-20240605;
        b=iAHx9ppipqLK9W1N/ZBUfrzW3M9zT64jJCuM4lmYWiDwqfpj0XQvWHijF50wAmRJZy
         GizILWeB51Uir/2mHY0tFeDsZpemXZA5Iiy09H/e7vGRqsBqbr3LMfLFFyIFN1Ta7OO+
         dUOyxRnTDYJHeZFpOqt4rqqLdL6r40o2nrBJtA2wh/4kLU+EkWEiAPRTEIuNrlKkjpou
         FPn30WqFllWa9Rv1rKbw9D1RvymuIiIfmzkLkjyF30/R7PbkfkKtODGUXfN4NqlAiTTE
         cg49YzVbzSljPN4MOac9YRyajAQo2W7DG7NTK7MPRY/Xj2s392HY16O7EFW1nrnN5p+k
         T35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m9qLByd2PzQi0vKZgnHfAth5+WLU5IX+PErom9/qoQk=;
        fh=SkufWz++dgrcFQOyXZMLL41Gwzw6B9RjqoHO+4R+pgw=;
        b=bk8kQK+CVGxshkRgO66PVFjGOansamqpwPOTWDAhWoly56JTFezR9/OlOwuWbAY5zD
         9e8DecWza8O2E215WO9VgRBrhdoe611hULlETJMdBqUySAzafRZP6tNUbSrt3WG1tRKl
         YkJ3iOEL4C/4FBMRt7KAm7KBTI8LCd49VTNWN1yLY1ma7pJOaK2lIWew87xpX38+4c8z
         jnt0/F0Wm1xKYtnvxai6LJzUXsmpY55T/9XaVF/+GLFMcUhIDw3Xqb6r5CL4aNXEdpAX
         330LAALtapKa4e91jFCBpLKy1DyGjsiGGOBNdOFTF8i1G3h+v0Zfk9XSNDIHdNVsdzp2
         lqXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779290289; x=1779895089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9qLByd2PzQi0vKZgnHfAth5+WLU5IX+PErom9/qoQk=;
        b=h8sogdFH2cYt4F/ShN5FoLrwrLKsUN5lhQEpBx3CYNijo/kidvmkwn+AVnCC6cryw4
         jOGh49qn2vQRvIzlx50T46iavk7ghjO8Amvr4MRtsi8bbB01HTEzAbw75Qxb33OjTxNc
         5pbij6JSFLFhUqIXzYTmr7rEVu1RpyWwUwWs6PYsivM/Q6hxKyClHE9Uf9q2ls5vqmXy
         r1qb6HQiAi6rA1cWUefkA7Wfqlax+Fqrt/m2cqmIMiHv4gQbBAFdIPah7aX6J2MSDhYq
         X1a0tRAG6t5oL+ZHzOiRvI9cpF2XCM8EkgB4cClok31AbVYQcp1jWxTaVfY9xNCaPVHx
         nFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290289; x=1779895089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m9qLByd2PzQi0vKZgnHfAth5+WLU5IX+PErom9/qoQk=;
        b=HfVU4zaYUE1joglaw1c/ESkdMLoTGON6xYr0+OT2z2BvLN5qgEK4FfHtWs5oTBozLA
         l9UBZ/Di+7mWkHEgywGyxN6QReOInBKLy5TVXwDXMCVB9BDsSDXCuVhrlRR4ZXVpCkgw
         ejeP3cYSs8dPfYa203lKFmWOrN235ZtN0Yq4xwFWV37LZE97Ax0IXnr3m2fj5Jeez0Fq
         YDdFQSRJp/FdGBrD/90jY2dSU2fSIprOUjcEDgIK7b3dseCJYCOuA/1pwjOACrJxS1EF
         4Wx/VIvCxhkNu2sQ00Ha9Wff+/NJ7b3yiVqU9/7F9qyJwRPBg6W8mS5DgDq7TK81dhGI
         Z+kg==
X-Forwarded-Encrypted: i=1; AFNElJ+ECpeMz7OckLbhZrz5xvAkVbAL0QqRXlH7dahvnZM+b11tmY0ouA76nKuzcp+KS1KudNYrso+OLMWZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xB1GdtHmictygbtAGIaeT1WLJSeDFBqRobAkIDrIUb74ptt8
	Inr0sV0munrZx+/49qTiXF+tZOkZNxKLHT1qHbDJ10atP0thmfxwAv+uDmHmeIo0Op116XPaZdW
	uqrAph1LZzVmBT4O1As5aq/mt3yQ/GfM=
X-Gm-Gg: Acq92OHL4QWNzH6H5PQWVjWQ9BM+nGtfTI6CtuIUP10vzecRgh6LQYdLWBzVIokdAj+
	Qp3N8opDdmp2LHqRxF8W/1z/IioAv27OVftjqPgAMhqHA0EuFMQB37DisAFXY4HjIaqAhP8EaXJ
	+WZo5HEMAwsYaOwICMhn9/jVDLjj/eA1OlL5xDj4Xg83m3hPVQM9BUKRI4KdcG8HoYYY7za83Tb
	uLca8phLdifLMqpF478g5wEr4qwYy/an32eTHrfC0lHi9vfUa6/7UvoviugQc54qpodJopw1/nV
	XpxMDh6jdjJc9oc2h3SSta79EnW6FlWoV1eZUtOVqrizsU+14wpkfC7K7nUpUosw
X-Received: by 2002:a17:907:998d:b0:bd5:5834:1d3f with SMTP id
 a640c23a62f3a-bd558341ef5mr1219917066b.22.1779290288833; Wed, 20 May 2026
 08:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260518155324.168948-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW1m1bUJY+7AF+W7hZ_zpcBt=nbJivjr-nrmSLBiZv8qw@mail.gmail.com>
In-Reply-To: <CAMuHMdW1m1bUJY+7AF+W7hZ_zpcBt=nbJivjr-nrmSLBiZv8qw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 May 2026 16:17:42 +0100
X-Gm-Features: AVHnY4JybpRBzBUvxwIH8V6FnXAx2_urpMr8NNxvoYafQOv4Ri8o8_Tz826UNqQ
Message-ID: <CA+V-a8uY0Bit=3g-3ZMB+nDyMXoCqHuqQiusi-c29DWMfWHJ_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: renesas,r9a08g045-pcie: Add
 RZ/V2H(P) support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, May 19, 2026 at 7:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 18 May 2026 at 17:53, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the PCIe controller found on the Renesas RZ/V2H(P) SoC.
> >
> > The RZ/V2H(P) controller is similar to the RZ/G3E variant but includes
> > additional registers and configuration bits for PCIe lane control. It
> > supports multilink operation configured as either a single x4 link
> > or two independent x2 link controllers.
> >
> > Unlike earlier SoCs supported by this driver which only feature a singl=
e
> > PCIe controller, the RZ/V2H(P) SoC implements two controllers. Both
> > controllers rely on the system controller (`sysc`) for configuration,
> > but the required registers reside at different offsets for each instanc=
e.
> > To correctly identify the controller instance and map the corresponding
> > system controller registers, make the "linux,pci-domain" and "num-lanes=
"
> > properties mandatory for this SoC and restrict their values according t=
o
> > the hardware capabilities.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
>
> > @@ -235,6 +238,20 @@ allOf:
> >            maxItems: 1
> >          reset-names:
> >            maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g057-pcie
> > +    then:
> > +      properties:
> > +        linux,pci-domain:
> > +          enum: [0, 1]
>
> Sashiko has the following comments about this property[1]:
>
> | Is it appropriate to use linux,pci-domain to identify the hardware
> | controller instance?
> | Device Tree is designed to describe hardware rather than software polic=
y
> | or configuration. The linux,pci-domain property is an OS-specific hint
> | used to assign logical PCI domain numbers.
> | Using it to identify hardware instances strictly couples the hardware
> | register mapping to an OS numbering scheme.
>
> and
>
> | Does limiting this to [0, 1] cause a regression for valid software
> | configurations?
> | For example, if a board with multiple PCIe controllers assigns domains =
2
> | and 3 to these instances to avoid conflicts, the binding will fail
> | validation and the driver will fail to probe.
> | Could the hardware instances instead be identified via standard hardwar=
e
> | descriptive mechanisms, such as their physical base address (reg),
> | standard aliases, or by adding a phandle specifier argument to
> | renesas,sysc?
>
> dtschema/schemas/pci/pci-host-bridge.yaml states:
>
> | linux,pci-domain:
> |   description:
> |     If present this property assigns a fixed PCI domain number to a
> host bridge,
> |     otherwise an unstable (across boots) unique number will be assigned=
.
> |     It is required to either not set this property at all or set it for=
 all
> |     host bridges in the system, otherwise potentially conflicting
> domain numbers
> |     may be assigned to root buses behind different host bridges.  The d=
omain
> |     number for each host bridge in the system must be unique.
>
> In the RZ/V2H case, the number is local to the SYSC instance referenced
> by the renesas,sysc property, while linux,pci-domain is global to the
> full system by definition. Fixing the numbers to zero and one works,
> until some other controller in the system has conflicting requirements.
>
> I do see a future case where this may break: if Renesas would release a
> new SoC containing two RZ/V2H dies, there would be four PCIe controllers
> and two SYSC controllers.  This would require two PCIe controllers to
> have linux,pci-domain =3D <0>, and two having linux,pci-domain =3D <1>,
> which is not permitted.
>
Agreed.

> Hence adding a second cell to the renesas,sysc property, to specify
> the base offset of the PCIe-related registers inside SYSC seems like
> the best way to go?
>
Ok, I will change renesas,sysc to use phandle-array so that we can
pass the controller index.

Cheers,
Prabhakar
