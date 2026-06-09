Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4FC438FE8
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013375; cv=none; b=e5Wr4PNWTtPxh+fgtzf/InUYqdxUqBXlV4mjS++H7HglaK7qLuspRZ13m6Wv5nGtVSwbLIFlIbhTCyeCncNAi3XQJ9S5tmgiOzHbzp4LENeoRlpjWVuVVOlI2RIrlNzYu/dUwICQvyOMPIn1a0mKWfBZnqfx6ohafZ2MP5/cx2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013375; c=relaxed/simple;
	bh=kOVb5UZJ7PirPcKIiVVj7Yi1gTqduCAlASlb/nfrhMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGfnCLossjHVrMJKvQATzXuD/r8EyowwCAaaHqFMCwtTB2tf94jHgM+kmdduOdBgca3vdMEGfX3XpXNIp35iT3j+QbZUE+3c73LSqqYk/ivnvOnZ5xpISIVZHpGPf8aUQySXUxpYfb94/9ErS/2fUQQ+7C7vaVdFznn1ENDged4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNk8nZPY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNk8nZPY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4908b92904fso63912285e9.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781013373; x=1781618173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jGyG5daN6w9H2aO200031+C6M/edAKFVis8h8TY864=;
        b=jNk8nZPYX6gCI/oi6DAtN4Ikci3kGzkIwPCapgA5VrBHCnP0nPxpkLyHGTLliXYuDC
         JNuIw3yNbh1BtF1Pa2ei+Eaf+hDRxGVQgoMih50JR34b72AlOKOHdc4zuzHgQxUjcg2H
         Shj2P47jrjAXvPuUMIyZf4lLX2jHbaYSby9RbJALSx2phg2ofvju66ShfJWPBcVYWwMO
         vhVjSVkkmAqu58/ZrRgJP9zFE4TT2TEUgFD9QmSDQor3gh8a++mxwev689yMsFcus/Te
         aP9TBjLGZ9BnPjmodDmTY9SIzzf+EVmETIjZcpDA9ZP+SQ+ch2l47Hl205Gm8ziQXGjV
         nnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013373; x=1781618173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jGyG5daN6w9H2aO200031+C6M/edAKFVis8h8TY864=;
        b=F/G1usSlE7sab38VzAlU+WQ3yo+CGdxcRMFOP4XqqC0r2UOe1RH7MgyMDpt18LJBDU
         aHq9W0h88drJKaRbybNsUH7KfhC08L7P4K7ExZlW8FWnSQF+bS5DT7Llebv9AMcwSfa8
         ut/JPb5Jaqmy4Fbq+J875FXL7VzCKv8FSuCUEBJPHByUO6OdQPE7vrJ6gRKzV/5Echtc
         mFTRVFArCl2m1ZTmUqv1gI2xjm/KZsci7wRqVRHzGV6UGa62yDGb58SPnUYOM6WMwykk
         T5a4+S4Qoha93JeYA+xYu1x2MBTUy1NnO8E+PToz1V2fmpHPpIafpaO0n4NF4jHmNVzW
         RRiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WfLUWDX1FnE7t83z+d78elgrHUpkDZp1W17uk0Yv+5ijSMMPORRJZN4r3t+WYahk8TNPL7NEAMlMN@vger.kernel.org
X-Gm-Message-State: AOJu0YwEn5RXf9a4H3677f2QczpzyzwVQEeDXl+RAgejO7SkZzFbir4P
	Fk2F109APV4tNN8+hgzH3awSbJgZnOVSuycpV77AVSQG1FW30ujiMkyk
X-Gm-Gg: Acq92OHzAuniQKtqB6J1EJuEYTsudPTuJpZUgkeTnv8WdWjNTojkhdHi8Ebp5no4kbp
	OzVkXxNJ9jESYHg6UwIs4IohSDnCF+swLv++dL5vM/c1fMEOubVAhY+NKJF26+8+kOs1nwLf8/7
	3AeUGWYr9Wye3McVkljollGLBp35I1vQJhYel3tLIpjOaY2JkHmJ+7BbW9B1++/WBmccoLvT7ps
	/jtYmczypMrX3DX6rHi9dgwNvIR4YK428xIcXVzKoVm/KmUp1NTA0H7W0uM/D4w/XmZS6YNCRhy
	GOyn0fwyRzkBcV1PXhQhvDoJu9bjYu6FYC6oU8244oZL4C89VYZKX8aJkiDLUpo5UTDhZvF0vQW
	hIurAvOhOLyGCXmrdbBO6yOmQS/Lju8aF+0DhqFBgQED0RE6EsqybW9e/4Tm2r7Bq25jUiZXRhO
	C1PPBsz9ctPYpkPaKegNdaMtZ/jqG59p4i0uiPV0fhJA92mze3ow==
X-Received: by 2002:a05:600c:6389:b0:490:33b3:4be0 with SMTP id 5b1f17b1804b1-490c26233abmr347947135e9.20.1781013372639;
        Tue, 09 Jun 2026 06:56:12 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm575882985e9.9.2026.06.09.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:56:12 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: conor@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: input: microchip,cap11xx: Cleanup and refine LED constraints
Date: Tue,  9 Jun 2026 21:56:03 +0800
Message-ID: <20260609135603.848573-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608-mooned-ambiguous-02493b8d383e@spud>
References: <20260608-mooned-ambiguous-02493b8d383e@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Sat, Jun 06, 2026 at 11:03:56PM +0800, Jun Yan wrote:
> > Add detailed datasheet links for all supported CAP11xx devices.
> >=20
> > Unify LED node pattern to support all chip variants in preparation
> > for CAP1114 support.
> >=20
> > Remove redundant LED properties inherited from common.yaml
> >=20
> > Apply per-chip LED channel limits:
> > - CAP1126: max 2 channels (0-1)
> > - CAP1188: max 8 channels (0-7)
> > - CAP1106, CAP12xx: no LED support
> >=20
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  .../bindings/input/microchip,cap11xx.yaml     | 51 ++++++++++++++-----
> >  1 file changed, 37 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.ya=
> ml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > index 7ade03f1b32b..99d00f572a2d 100644
> > --- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > +++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > @@ -10,6 +10,15 @@ description: |
> >    The Microchip CAP1xxx Family of RightTouchTM multiple-channel capaciti=
> ve
> >    touch controllers and LED drivers. The device communication via I2C on=
> ly.
> > =20
> > +  For more product information please see the links below:
> > +    CAP1106: https://ww1.microchip.com/downloads/en/DeviceDoc/00001624B.=
> pdf
> > +    CAP1126: https://ww1.microchip.com/downloads/en/DeviceDoc/00001623B.=
> pdf
> > +    CAP1188: https://ww1.microchip.com/downloads/en/DeviceDoc/00001620C.=
> pdf
> > +    CAP1203: https://ww1.microchip.com/downloads/en/DeviceDoc/00001572B.=
> pdf
> > +    CAP1206: https://ww1.microchip.com/downloads/en/DeviceDoc/00001567B.=
> pdf
> > +    CAP1293: https://ww1.microchip.com/downloads/en/DeviceDoc/00001566B.=
> pdf
> > +    CAP1298: https://ww1.microchip.com/downloads/en/DeviceDoc/00001571B.=
> pdf
> > +
> >  maintainers:
> >    - Rob Herring <robh@kernel.org>
> > =20
> > @@ -124,25 +133,21 @@ properties:
> >        The number of entries must correspond to the number of channels.
> > =20
> >  patternProperties:
> > -  "^led@[0-7]$":
> > +  "^led@[0-9a-f]$":
> >      type: object
> >      description: CAP11xx LEDs
> >      $ref: /schemas/leds/common.yaml#
> > =20
> >      properties:
> >        reg:
> > -        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > -
> > -      label: true
> > -
> > -      linux,default-trigger: true
> > -
> > -      default-state: true
> > +        description: LED channel number
> > +        minimum: 0
> > +        maximum: 7
> > =20
> >      required:
> >        - reg
> > =20
> > -    additionalProperties: false
> > +    unevaluatedProperties: false
> 
> > Remove redundant LED properties inherited from common.yaml
> 
> But the pattern here suggests they aren't redundant, this is how you say
> "these properties are the only common ones allowed". You need to explain
> why other ones are valid to change this.
> 

I checked other LED dt-bindings and related driver code. 
This change is not suitable and will be dropped in V2.

> pw-bot: changes-requested
> (a commit message change is required at least)
> 
> > =20
> >  allOf:
> >    - $ref: input.yaml
> > @@ -158,7 +163,20 @@ allOf:
> >                - microchip,cap1298
> >      then:
> >        patternProperties:
> > -        "^led@[0-7]$": false
> > +        "^led@": false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - microchip,cap1126
> > +    then:
> > +      patternProperties:
> > +        "^led@":
> > +          properties:
> > +            reg:
> > +              maximum: 1
> 
> I think these changes to permitted properties should be a standalone
> patch.

Agreed. I will split these changes into a standalone patch for V2.

> Thanks,
> Conor.
> 
> > =20
> >    - if:
> >        properties:
> > @@ -183,6 +201,9 @@ additionalProperties: false
> > =20
> >  examples:
> >    - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/leds/common.h>
> > +
> >      i2c {
> >        #address-cells =3D <1>;
> >        #size-cells =3D <0>;
> > @@ -208,19 +229,21 @@ examples:
> >          #size-cells =3D <0>;
> > =20
> >          led@0 {
> > -                label =3D "cap11xx:green:usr0";
> >                  reg =3D <0>;
> > +                function =3D LED_FUNCTION_INDICATOR;
> > +                color =3D <LED_COLOR_ID_GREEN>;
> >          };
> > =20
> >          led@1 {
> > -                label =3D "cap11xx:green:usr1";
> >                  reg =3D <1>;
> > +                function =3D LED_FUNCTION_INDICATOR;
> > +                color =3D <LED_COLOR_ID_GREEN>;
> >          };
> > =20
> >          led@2 {
> > -                label =3D "cap11xx:green:alive";
> >                  reg =3D <2>;
> > -                linux,default-trigger =3D "heartbeat";
> > +                function =3D LED_FUNCTION_INDICATOR;
> > +                color =3D <LED_COLOR_ID_GREEN>;
> >          };
> >        };
> >      };
> > --=20
> > 2.54.0
> >=20
