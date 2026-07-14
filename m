Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FDC2DCF45
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035346; cv=pass; b=EoJEdJ8ZvymlZPo3D2JqaE5hDV8PMSkdDc2bjXIEJTIc8X6yrZSUz0/M9y05KJke9l7XxUN/qEJV0Tifa1O5wc6m8AtPc/vuiUtxrbGlw4CFH7XWNBkE/Hifd0yUgfr+Y6vwlFgtfutgODcMcipRb4vpLj2yc/uy9Fa1UmH9Pzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035346; c=relaxed/simple;
	bh=7EpWkjOIX2bvUj7bhrZlFgeAZ49Zdzo9NleFTDfsS0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNtJMY7YHcTzSOJV2xvQgvw/k2krUvYAsA/jtCmnPEFzGH3nODJqdwR5HWaJO+D2TVhOLf2sVPcq9NWfAIE4gHWSmxWs+WbZyyKJ6EXwx5XYmX1cWu1M4uSJxPaptpeg78UVUgHk+7jqyV6l9sSd1DmeGptUx8vWLHLMbUbzE2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4l90eyf; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4l90eyf"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-476a130c138so985226f8f.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035343; cv=none;
        d=google.com; s=arc-20260327;
        b=b6QP0xQnidYYIqb9hiUL8Mr4oUwzmuRSFOqhEJjDnzB85eKH5YUznwpCtFrWmAJvah
         h8BGzkVYjTzW+XI6BUJ1GjfbsPRVhaHNBcSo5yEiauZ4K1CU5i0h94ne61KeoGGyCtyA
         EjfVBXBWvRlxxu6hd1ek8z9/fDQzHRIwPwsyJTs4tQcw9C39OAKDwORy7IoChu1XJTi0
         JxS3sE7efsVyFnLR3Pn1B3/TTRBdbxuCo8eQAGdudHiACAm3OmM//pjQtd1Hx6sCntaZ
         aRvxvqoZhjfdpyzuzGrrjCET634EZkSKOYgCAJuN4o+wRzEfQ/FO3YQHmP/cw9yP1woe
         zxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gd9QWw526oknp7pc7L5j5Qo1NtCYrA+LbHXHAVKWIIE=;
        fh=M/39KFzonRYFmiWQ56I1oN6p9N6PqryqzFtzOo9vSRU=;
        b=WT4FxmeDWiVA6AKxAEAEeP+H9oSQTsT2oDROjn/qdIQTvpYjlkW0KpCOFW/QIWiJD0
         oR1h4JCgSizZCf6iF8tuPhkH13bdHewaIqDEW1WrUjqBvuvaDJgi4sW9IDJytrzdCgqF
         Q+/6JxginJBEvkcgqOJAUsQ5f5XV4T1Tz5EK9VQaxWP/i0ljIgOHlojLFfESTwjjhqm/
         eDOTPOC+XHAXV+AQlbMsVF50yBEPy+AvIZei0mNCXfChZ2P3sRaWt+e9f5j8j0OGY8E1
         vxxDTgwWhFHTPEMvfeeqpgSzWCBczgjvlD6ErY4QqCfTPChAZ6SSCUVRybBDH6UwJAem
         mqhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035343; x=1784640143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gd9QWw526oknp7pc7L5j5Qo1NtCYrA+LbHXHAVKWIIE=;
        b=B4l90eyfla2j6MFR41xOPXv7A4x1XRFSzPN0nowphIxuDh07m0WEWw0M2Sye1SgRy5
         Z7cGxEZTPj37pONqjgCqZ2CxMMSdgLvnZkXNya4mO4/NlD2iNFyuZPtAN7s5nHczZeYk
         hBcsI63u7ss99EzSNJBihvSHm2IERdi5suzh7ED1a35P448C6ldyms8MaCwskKGD0EC/
         SeJZLrdRxykA0fDTz8TJXSDys7cEaZQC9i4et2F9WEm5lcnkd7z0GBq0yJdBoaw4tIaJ
         bV33eXOaS9cnT+XJ8UipXMLXlrzd3Bqzn2tQT6JysybKRizKt1NPeiXkDwjZ4e5+PMAu
         4ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035343; x=1784640143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gd9QWw526oknp7pc7L5j5Qo1NtCYrA+LbHXHAVKWIIE=;
        b=jddFoYPb6a/brBrTWRVZ2amm+tWU4OHQ1YWinOOYsJgdc7kgdHh6WhiyTSSQwGh/Uf
         NYmZukljPXiv/tgSJsqCtW0y0k6t3XV+/goD0zFs6XN1AY01TpKwrl9afQsU2bngbeXs
         pHKl2HLSiLpsIT27cBcpCHSI3PeFDh9UkvpahHuDcdGa219lLoh4AJFnP7fNhJqhGIKF
         BUoFbf5OUFR0QTqDpLylF5KIcN5TMlYUyFs+EFJIH7npdPBkDs1r2rkm5Oh45oC/aUng
         bNxKHQNO0mlIrZqcf6i/Qs6ZfNtS2gYkdLfMAgnDR4KIs/0UuCSkw1e8jcK8qff/ZFxs
         PSyg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7pCFcIf4Wv/QTQAPoqgU2utWLnIkja0JRy3GpEe8T/flOq9RuEz7a+EkaT4IXCZUoPG309SywM0gI@vger.kernel.org
X-Gm-Message-State: AOJu0YyPuUyp3TeRaAzVV2wl71ZcSKGvx4j+S1ZHS1eLmiRqtfParLC1
	gb+cKJY5y69PS3OWdl9iSZzof1it7RbnQvv62GMrNmLYc6GfZJVmZmyytD8OuDhwPRaVtrjLDwI
	tfHMcqS4bc9C6bXE4NzlwfDWhPwzCMfE=
X-Gm-Gg: AfdE7clJLxHcAIE8PXpZotWT9uhTqFLiC2+GLJglbB9EkmN+lc3o3wouX+hgkuGan0A
	coXRbXW9LBhvqUupnhNCJK/jpw9JKJcqTohl6UZBntSL0AkAyYuYyaNWws50QasUrTcVEKVq/dE
	7WwnrkGOGAzDWMyZQRejlfSJKOrzn53u5w3Ckw8llaOXVt82VU/yDGPAeSb9/IuTKhz1+TT5M26
	4FLDfm2UgAxDUAqp09Ffo++0hx5y/tQJZ5OqTusrJeAD4t7ARk2wTsFLHjSH+JsyG1QiUUphWZl
	QP4JMTNrD9hS21Z5M+DgbkBQcCtglf+vxqBU+ifiGjzCWcWfaaq7MoJH9So=
X-Received: by 2002:a05:6000:612:b0:478:65a8:262d with SMTP id
 ffacd0b85a97d-47f2dcd1a6cmr15559441f8f.9.1784035343221; Tue, 14 Jul 2026
 06:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 14:21:56 +0100
X-Gm-Features: AUfX_mx629uzNMG8Nucw8hUhgYkDfx2F61U6edckb4KFpd8R3v5p5R-Ssz_7kJI
Message-ID: <CA+V-a8uWMJo8-WaFiXJQDs97gsrAEJG0-4PYgsp8J1LMjxd4-Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/9] dt-bindings: clock: renesas,cpg-mssr: Support
 RZ/T2H system controllers
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Jul 13, 2026 at 4:50=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/T2H and RZ/N2H SoCs features system controller blocks for low-po=
wer
> > management and access control that reside within the CPG/MSSR address
> > space. To properly represent these hardware modules, allow them to be
> > defined as child nodes of the CPG/MSSR controller.
> >
> > Update the CPG/MSSR binding to support child nodes by adding
> > system-controller child nodes using a patternProperty, requiring a reg
> > property and a renesas,sys-block property to identify the controller
> > instance.
> >
> > Restrict these new properties to the RZ/T2H and RZ/N2H SoCs to ensure
> > existing bindings for other Renesas SoCs remain unaffected.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Updated commit message.
>
> Thanks for the update!
>
> > --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > @@ -99,6 +99,41 @@ properties:
> >        the datasheet.
> >      const: 1
> >
> > +  '#address-cells':
> > +    description:
> > +      Required for the RZ/T2H SoC to define the address space for chil=
d
> > +      system-controller nodes.
> > +    const: 2
> > +
> > +  '#size-cells':
> > +    description:
> > +      Required for the RZ/T2H SoC to define the size of the register
> > +      blocks for child system-controller nodes.
> > +    const: 2
> > +
> > +  ranges:
> > +    description:
> > +      Required for the RZ/T2H SoC to provide 1:1 address translation
> > +      from the child system-controller nodes to the CPU address space.
> > +
> > +patternProperties:
> > +  "^system-controller@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      System controller child nodes representing sub-blocks for
> > +      Low Power Management (LPM) and Access Control.
>
> According to the documentation for the PRCi bit in Section 11.3.1
> ("PRCRN : Non_Safety Area Protect Register"), the low power consumption
> bits are in the xx28_xxxx blocks?
>
Yes the low power consumption (MSTPX) bits are in the xx28_xxxx blocks.

> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +      renesas,sys-block:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Index of the system controller instance.
> > +        enum: [0, 1]
>
> I am not so fond of such "index" properties.
> And of subnodes ;-)
>
The intention was to allow consumers to easily specify which sysblock to us=
e.

> > +    required:
> > +      - reg
> > +      - renesas,sys-block
> > +    additionalProperties: false
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -126,6 +161,10 @@ allOf:
> >        properties:
> >          reg:
> >            maxItems: 1
> > +        '#address-cells': false
> > +        '#size-cells': false
> > +      patternProperties:
> > +        "^system-controller@[0-9a-f]+$": false
> >    - if:
> >        not:
> >          properties:
>
> As RZ/T2H and RZ/N2H are rather different than the other (mostly
> R-Car) variants, perhaps it makes sense to spin them off to a separate
> bindings document?
>
Ok, I will split this up in the next version.

Cheers,
Prabhakar
