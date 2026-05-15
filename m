Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D9D44BCB5
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845734; cv=pass; b=XrbU3ZgSQUrXXN+uk3k79+rDe38JMWWyJg4/1OiWyLaXj5a1qFcS5svro2NFkpHB6Aw0uipOEWbpNTqu+4oOqQ29nMjx8gZUMO0cVaQHEH0kYcdYirmeg7drILihBtw4sSheD/1bgV7wwhrOY7eQg4iI0fp6gIRAYbrGmyCkqd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845734; c=relaxed/simple;
	bh=R2kaSodmffz6gXvU8DXS7cO2GFYMl1LTFjBKMYeFf5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKq3WJn7QzVJcIH23XMoNZ/s5XcS1YBl3607H2/HvGMrmwtXxlDufR8sOaFdv3ysG6Thg3AEGj2duLE/9ODxle2vPGqJo+O2Gy9WRZVPkUvQgCGncqbzS2WTr+vs3Czp5ZpowUkcMcCKf3mh5neSqsLL5YzM499+OOZlk0i2OdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6MT1tsx; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6MT1tsx"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45297094718so7258037f8f.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778845731; cv=none;
        d=google.com; s=arc-20240605;
        b=Hh/xly2Q1OE/nAy0REZXWfzzVNa1SYYWW2X5Jy1rlPzZR1muhddtPcZVu6+11CGMdn
         cIMd26Qth+pX6/6BaPWIiWr4V2r4AQNenm/SleeEPlXG0sVtJPVmdOdckcfNCXs3qRAa
         GKjepceGdBo3Lw/hu8l0CysRvKTKnNdRnkLt3/eaEBglmwkYJodBqRfa/usakztCjdr9
         NNgc3JFGEBuHT6hkTjncKVm6X55YiOFgd2ahyETibWAiIOSVnDt4ONJ/wDjcalN4bzeP
         iccg1qv9I5gvzS4jefaoansU2510D3DO+M3TM9903ZZ/7RMUcNo+a+xx9k9JiaCgh3nx
         xg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NjuSMtjvullePnYi7YI98+UWSJ0HXUTIXKG54JOD/HI=;
        fh=MNVWKeZCatUI9CRMr76MOQj9AzbGeSN3uamKzT8hVaY=;
        b=hMs36PnrZ8ECa9v1qQJHiKOs9takGY+eERhNi1eIzi+JKPR/S3HdX0XeIvNhTmU7Ok
         uNYFZQEhKLb5JB2WrmjYZsQDJDR/eftZRPjoyP7mmA6dFEyV2HMU1t1WnxAjNXXjoXaA
         w54V0MiUjwTyCj11bh8tRutYKEKaQwvD1A+Tzyei3SvN0vA8NZIlzaKEb8lDt1Lxf7hO
         A9ScLFwJ5kUUVfb0Vgq1u71MwlcuQz04w481XSlaFHZcwFU3gl7riUgeE8777HKWw+w5
         Janc7MugQcdmlscxjHVeK09x1EGbSWbAGf55SkJDlm2gunZIWXTTjwIH8v14Pmv6VRvn
         YT6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778845731; x=1779450531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjuSMtjvullePnYi7YI98+UWSJ0HXUTIXKG54JOD/HI=;
        b=a6MT1tsx1dBhtYs7sy2vQ7GG5KzG8LNM9q5CjY4vgu2ROQ7ZNdzG/IKjRQ7pPQTCE+
         sTwB65Up78OCoBSvuP5t0xGlbEfbLX6FQTWS890XXGt+QouT4U9+/M3suE6tQjtue+tf
         iTCXtwquLTeeVdDJu53GplGNy6h1HvQhExeblwwJY/LHRz0YctvbgjmHPumLniwkNwGX
         Nr69Ml5Oe/cgjCeJF5RLgPHN6hCuRhdDfyAOD+TPAc01iN4QSbTLk4fljHzLJg0iszfc
         r0NTI3vlRT984WQOhFzzBt4sPDqMNeMnu0MEs3F0EKyZBKZguVxgDKa4VwuAoblMcJmC
         rLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845731; x=1779450531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjuSMtjvullePnYi7YI98+UWSJ0HXUTIXKG54JOD/HI=;
        b=HG1l/VjdHpiL90OirdSMmmqi2GAJr0CIQQxMn5H6BnwvMxFguzxRVZpxq+a4ceH5VQ
         LVplaqTJOckuVeugiuvMByE8XQ8p34hWIFfj6E2d9K9G+rx4LRt/W8tGYVJM2X1eb+f+
         XPIRob7f2Ap1vctmP7Z2Qi/1M44a32/8+lrRiXHYpUiC2rfuVHnMuexz3kjTxQlctPfj
         ndhGOlZ/qaFR1A+tb6bQkoSVQ5SDr9t0Onxe0tZPRrj5oNKALtidI0wFJep5UM0EWHAT
         0y8TJOq47ZvaRLkKk/iW4/M+f3Z8EkvupjCSO6AHnCGqqNYVPhSeqSxQQwL0qOO5PmZ0
         GWAA==
X-Forwarded-Encrypted: i=1; AFNElJ+bn/Ky94ZwQb0Zc0Qa3ACy0yC2iB8gVH8/+aoX2oMfTQ1DBwZQ/d5Dh+8J5RL93pu0+2YccHEi213A@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5j3WF6P4AbgzrPQaAJC8CWxMnlsSK7xvFdy3VifCRZddxunrs
	m3gcWzstwVb5pg+5ThRxwQkLWd85LZI7SXc+7kucjX79+9Hzzn+l08B2VXC8E5odVMdyvQCodOA
	/PpWcanWX2EqKB0G6Q+gEa4HRdXkrrRo=
X-Gm-Gg: Acq92OGtZ4p5/pRTlTb/t+p8ucEnDzQvxtHlVJkNVLdcnx/QD2vHyjgQSxv1fDjr9Y0
	uHHkYHJx/exIxD34kqR4bB8j5WZFAQqGP7d0ityJJO3IMjkJMWkcu1mzFLUckRMrX2PtB+YZdmP
	o6lP8zwc31jDYGIjxDvt+33kFVrJarXDArPC5nAJ/6W23ojXFhV5VOLwVMOkDAeMuR6mLtgiTup
	3yNXvOwDuyKLvPYMQvXhaEG0sUkbwKWm1aqrrzEbEUGQxSIeMq+KVggBbMUoSPzgl0c5kd94+b9
	CJmLpQhFHSXNThYrTk0hQ85GIw2TZXQhA5/6TZbokff9JDtYOZ5L6mJxaaERBTDAhLM=
X-Received: by 2002:a05:6000:25c6:b0:446:189c:ac4e with SMTP id
 ffacd0b85a97d-45e5c59f684mr4806457f8f.34.1778845730337; Fri, 15 May 2026
 04:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260505112405.667796-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260513174211.GA1400932-robh@kernel.org>
In-Reply-To: <20260513174211.GA1400932-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 15 May 2026 12:48:24 +0100
X-Gm-Features: AVHnY4JoESd-gzATyvjCHny04cCPotWuTiip4JC-1zEmWw2ejA6Kbb1CtdF9f2Y
Message-ID: <CA+V-a8vCdhoC+=zp3GR0JMtDWL6BQV+t+Ae46HfMOPEHsh+mmA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add
 RZ/T2H and RZ/N2H support
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review.

On Wed, May 13, 2026 at 6:42=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, May 05, 2026 at 12:24:04PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document xSPI controller found on the Renesas RZ/T2H and RZ/N2H SoCs.
> > The xSPI IP on these SoCs is identical to that found on the RZ/G3E SoC.
> >
> > The RZ/G3E HW manual (Rev.1.15) references bridge channel 1 and its
> > bits, however the hardware actually supports only a single bridge
> > channel (channel 0), matching the RZ/T2H design. The references to
> > channel 1 and its configuration bits will be corrected in a future
> > revision of the HW manual.
> >
> > Update clock/reset constraints to handle the SoC differences.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Used RZ/G3E comptiable as a fallback compatible for
> >   RZ/T2H and RZ/N2H SoCs since the xSPI IP is identical.
> > - Updated commit message to reflect that the xSPI IP is
> >  identical between RZ/G3E, RZ/T2H, and RZ/N2H SoCs.
> > - Dropped RB tag from Rob due to above changes.
> >
> > v1->v2:
> > - Add RB tag from Rob for the dt-bindings patch.
> > ---
> >  .../renesas,rzg3e-xspi.yaml                   | 56 +++++++++++++++----
> >  1 file changed, 46 insertions(+), 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/renes=
as,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/r=
enesas,rzg3e-xspi.yaml
> > index 7a84f5bb7284..e2633476bd54 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3=
e-xspi.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3=
e-xspi.yaml
> > @@ -30,6 +30,8 @@ properties:
> >            - enum:
> >                - renesas,r9a09g056-xspi  # RZ/V2N
> >                - renesas,r9a09g057-xspi  # RZ/V2H(P)
> > +              - renesas,r9a09g077-xspi  # RZ/T2H
> > +              - renesas,r9a09g087-xspi  # RZ/N2H
> >            - const: renesas,r9a09g047-xspi
> >
> >    reg:
> > @@ -53,28 +55,38 @@ properties:
> >        - const: err_pulse
> >
> >    clocks:
> > -    items:
> > -      - description: AHB clock
> > -      - description: AXI clock
> > -      - description: SPI clock
> > -      - description: Double speed SPI clock
> > +    oneOf:
> > +      - items:
> > +          - description: AHB clock
> > +          - description: AXI clock
> > +          - description: SPI clock
> > +          - description: Double speed SPI clock
> > +      - items:
> > +          - description: AHB clock
> > +          - description: SPI clock
> >
> >    clock-names:
> > -    items:
> > -      - const: ahb
> > -      - const: axi
> > -      - const: spi
> > -      - const: spix2
> > +    oneOf:
> > +      - items:
> > +          - const: ahb
> > +          - const: axi
> > +          - const: spi
> > +          - const: spix2
> > +      - items:
> > +          - const: ahb
> > +          - const: spi
> >
> >    power-domains:
> >      maxItems: 1
> >
> >    resets:
> > +    minItems: 1
> >      items:
> >        - description: Hardware reset
> >        - description: AXI reset
> >
> >    reset-names:
> > +    minItems: 1
> >      items:
> >        - const: hresetn
> >        - const: aresetn
> > @@ -109,6 +121,30 @@ required:
> >    - '#address-cells'
> >    - '#size-cells'
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - renesas,r9a09g077-xspi
> > +          - renesas,r9a09g087-xspi
> > +then:
> > +  properties:
> > +    clocks:
> > +      maxItems: 2
> > +    clock-names:
> > +      maxItems: 2
>
> What about resets?:
>
> resets:
>   maxItems: 1
>
Agreed, I will update it and send a new version.

Cheers,
Prabhakar
