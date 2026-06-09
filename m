Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D3C322DAF
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014120; cv=none; b=cTsDd87eyWIASsIFyGUcpdYb8KHji02G6Rd5Fq0Jx2qP7tuQmeU3NeZvYzZFnz02VFwVzI6uGTaStDWi+27Fv6uAsz8qGjvIrKdK8i/DSxQSxHdjuA4mtTWmimpKJ91Kr196CsO29Ig45/XPcr/+Btx3NYehMSK7Yltr0p9/PSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014120; c=relaxed/simple;
	bh=sVLQLsJuqgaxqNAWIjvG781Yad1ouGhsjockHLpSs5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYBLBaBjWHR5XPipYjsupLt7g9CThyb4f6ggJtfPJ2KO2kdZYKy+jREdBclT9SqxsfwNKv+lXXkAkK1Y5lAdIHJsU4RJYN1cIWsClbKEOEi8gDfNxKvnahCePrd9dLg/kjLQj1wDnW1UX0CQQKF4jIK+GPR+zJ/n8xbECxoduQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7BDyRnm; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7BDyRnm"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5121371f8f.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014117; x=1781618917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r24i4wArZYCxJTy7JVrCBxAoG5trXQLwOIZ0GvUDnrI=;
        b=T7BDyRnmckZIjjlTLOYjZ5mtSxo2Hni70tT0aHm4FrZUoWNvPiHj26Mr4foMStRQZG
         Vpfh3/s9s+kXFVD1iGZ2nCmbf0Hkv4a/wLmpDtHj1f1IFIP/Da02M6Tk3OfOmoReTQA1
         uwIey4zM953pyBtRBTq8NG3dZNPojYgPmF0QfOzBJiAHTEeMfbY7Rlw8OC0lZEr5XkMj
         AgvC/Ogt4GOXy5fh1Pi+iBLcx8Bu4vS5YZ3a1+/iBldNtZU7JwjhuZPkXwvRfCzPKa9o
         XMQ1M3tboenXhji/iYFr61lupht8AqF4reFE3CilWnpkoen79C8Veq52KfOFPR7h+9Gy
         BKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014117; x=1781618917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r24i4wArZYCxJTy7JVrCBxAoG5trXQLwOIZ0GvUDnrI=;
        b=FWjS9r1c2wNh8/PpCEBqQ3ey0Z/7pJuZytVfvBccmXWa+BEFPiUHw3DV/HSHbj2t0T
         lwX3EjAojWqOaAg6Ge2+N5VEIEpy1Ddd5DtolFZdN9ILKrJXrs6RiutKCKM0O+tPFH6P
         ad62ZKDdQ+yJSn284pypmsX9Yq8vllknGDLNzBRUp2w276hVHxgFYAPI/I9kJZmOR0BV
         fR2VfdIDyWmPQGggr0SJgst9esN3POVoHhY3nrCCPQMhI3Cf39+Q8UBNEQtwUsOigS+h
         GPOBTx3FLP3gjE4BG5A+S32dseEWxHW6CJe3REXCfJeL5Bv9Gq72npFuL1saOTSEDjTc
         K6Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9hQN4nkzTK5qAzoUsH+6gA9EKxzKeHeEoBwsQktsZsNe2ve3FhaoS5XkALsyzP6C+ce874HghFEyAg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0wfCqkIESKlHc0A04n0cL+lfv1HqF+ard7v5fU6uOF8Kco6Do
	WI6cq/wtKp8ZErth+DuMjE5T45KORboFE3T/FlLh1c8L17SXqozWNVMjrCo7iiO/
X-Gm-Gg: Acq92OGlFGfzr2gfDIwS100w5qQgONQ5hJiDV6ELf2q44baRtlR/pBziOrAqunbOFRc
	Rwa1awZP0CZq4/PaUz9J2rk+oJWbXqg4H8Befyt4+MYP0S+xGRHdWOO1PV2CFOv9SoPFwisxAcC
	XrY//iFKxXxQvVSDwBznFSwmKVrtbC8LkD0F36oNWLJKAuMt+AYDLh0dXNzIEs666rS2BqF0v6B
	zvJia1bFwe+iyKojPCbRcYCKMV74xXb03SgtuKJR6c/JRUaUfnJlwEFgENUfykvLYqnK1f85MqJ
	6J8ApfWTE2NxzLSOqoDzzwwYZAD2MV66QSvlQP9E5x7P788s68hM6s7XZzF12Y59l2BosrKtis3
	fQvWeLffuPCM1cEsZzOEh+uFfmznSWXdEaQBaDyvnpLixuAmCOTlkQ1YhIrr9kdEhcKAf/KXi8F
	JaH2o0+ODZp9ix+zOp3nMocpAsAPceimFPsmkfUaNLpTl/lq5Zkg==
X-Received: by 2002:adf:eac3:0:b0:45e:ce28:666a with SMTP id ffacd0b85a97d-460302dcc75mr22913774f8f.1.1781014117225;
        Tue, 09 Jun 2026 07:08:37 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcae2sm66253526f8f.6.2026.06.09.07.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:08:36 -0700 (PDT)
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
Subject: Re: [PATCH 7/8] dt-bindings: input: microchip,cap11xx: Add CAP1114 support
Date: Tue,  9 Jun 2026 22:08:27 +0800
Message-ID: <20260609140827.850117-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608-broadly-reunion-09fc8eca5e87@spud>
References: <20260608-broadly-reunion-09fc8eca5e87@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Sat, Jun 06, 2026 at 11:04:00PM +0800, Jun Yan wrote:
> > CAP1114 is a 14-channel capacitive touch sensor with 11 LED outputs
> > and hardware reset support.
> >=20
> > Add the compatible string for CAP1114, include its datasheet URL,
> > and update the maximum count of LED channels and linux,keycodes entries.
> >=20
> > Add description for microchip,input-threshold: CAP1114 only provides eight
> > threshold entries, which does not match its total channel count.
> >=20
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  .../bindings/input/microchip,cap11xx.yaml     | 21 +++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.ya=
> ml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > index e307628350c2..08233386a433 100644
> > --- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > +++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > @@ -12,6 +12,7 @@ description: |
> > =20
> >    For more product information please see the links below:
> >      CAP1106: https://ww1.microchip.com/downloads/en/DeviceDoc/00001624B.=
> pdf
> > +    CAP1114: https://ww1.microchip.com/downloads/en/DeviceDoc/00002444A.=
> pdf
> >      CAP1126: https://ww1.microchip.com/downloads/en/DeviceDoc/00001623B.=
> pdf
> >      CAP1188: https://ww1.microchip.com/downloads/en/DeviceDoc/00001620C.=
> pdf
> >      CAP1203: https://ww1.microchip.com/downloads/en/DeviceDoc/00001572B.=
> pdf
> > @@ -26,6 +27,7 @@ properties:
> >    compatible:
> >      enum:
> >        - microchip,cap1106
> > +      - microchip,cap1114
> >        - microchip,cap1126
> >        - microchip,cap1188
> >        - microchip,cap1203
> > @@ -62,7 +64,7 @@ properties:
> > =20
> >    linux,keycodes:
> >      minItems: 3
> > -    maxItems: 8
> > +    maxItems: 14
> >      description: |
> >        Specifies an array of numeric keycode values to
> >        be used for the channels. If this property is
> > @@ -122,6 +124,8 @@ properties:
> >        is required for a touch to be registered, making the touch sensor =
> less
> >        sensitive.
> >        The number of entries must correspond to the number of channels.
> > +      CAP1114 is an exception where channels 8~14 reuse the eighth entry=
> 's
> > +      threshold, so counts differ.
> > =20
> >    microchip,calib-sensitivity:
> >      $ref: /schemas/types.yaml#/definitions/uint32-array
> > @@ -149,7 +153,7 @@ patternProperties:
> >        reg:
> >          description: LED channel number
> >          minimum: 0
> > -        maximum: 7
> > +        maximum: 10
> > =20
> >      required:
> >        - reg
> > @@ -199,6 +203,19 @@ allOf:
> >              reg:
> >                maximum: 1
> > =20
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - microchip,cap1188
> 
> I don't understand this restriction, shouldn't this be
> if: properties: compatible: not: contains: microchip,cap1114
> so that the constraints before your change are retained?
> 

Previously, the LED reg property had a default maximum of 7 for CAP1188. 
With the addition of CAP1114, the default maximum is now 11. 
An if-then constraint is added to limit the LED count for CAP1188.

> Also, you don't add a new constraint for linux,keycodes, so now it is
> permitted to have > 8 entries for existing devices.
> 

OK. I will add the relevant constraints in V2.

> pw-bot: changes-requested
> 
> Thanks,
> Conor.
> 
> > +    then:
> > +      patternProperties:
> > +        "^led@":
> > +          properties:
> > +            reg:
> > +              maximum: 7
> > +
> >    - if:
> >        properties:
> >          compatible:
> > --=20
> > 2.54.0
> >=20
