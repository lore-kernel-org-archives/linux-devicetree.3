Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D2C40B38C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098519; cv=none; b=aMlFBeGMkhDLUnPolsqdTcRhUlWSjwiq2+LWhwrF0Tyzh7/yAR9DI9hBN7nz9/M+yhrSAQUwpvQeL3UWhL1t1ApH5IgJyuMiSrfWF1lk8P5LTNnA5QLQT0kAjSvLJpGc5OBD7QFvLyPeXKITMQsiOE4S4u/z9nahE5r3+37pNQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098519; c=relaxed/simple;
	bh=YUdqjoFhiPqQLaf4gJadZcw3eGr2LIScfANZVbT6QL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfjotuBU2KNxGw/J8m8YuFmtRGE6DzDEA2vjy4iMHV/BAJTIIPbuKebCTbF8ZjcESRwr10GXYfNIgY7t44/2EPVR5OW7qQLLclZDfJ7q8ZZAoVIzioeT4dX/UrHRthfQsNf7qRhLBB5SWvu2lI9HO8i3ut7n9ccKZ4JPn2CAUZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6dvPlbV; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6dvPlbV"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa7a7c9711so7694539e87.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781098511; x=1781703311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLX2dOT9Bw/pz1APJXL+k95y9Wnfgl8Z5/bITb57NwI=;
        b=C6dvPlbViT5sQbueoeZFAHUlk1cv5y8IiGRqg1/olB6Gua5BTgZu3cJxvjvYtoEZ4t
         b1IEy/yWt322rHj+/2pceZ7ffykMIQF1BCQlkolvcKbF+zJaHesswH1PcJXTshnP/WU4
         kGK8DT8m9XtNs7NLSyd811yFkKlqx5ttKYyGPf2Bq0EARL7hFqGZf9uME91/g+fln++k
         nTNTHBPqCpxHMueDgB/lQ26N1qf1F1cnw79ABy8ICJq6XaRsdPQMQiGWJY6xfHg41/l/
         1bVz1So83U+K/tcFXQp1tXAwTwwam7IUObhC1fZZEWnv4npdVR2+O4jvYmbi2QME2wn9
         DXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098511; x=1781703311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iLX2dOT9Bw/pz1APJXL+k95y9Wnfgl8Z5/bITb57NwI=;
        b=jyfzHW/qq+dqBs0Dj/jLWZhoVCRIE566RsYR7jlSeQQIOyH/YZrMEToO/0M5kiFMut
         x8R0AwJap0PI4KKlvn1pi6RQxeetobevJ1PtMliOBqzL9JWkWFER3Klzgn/6dBEsoNGi
         05nvoYVtwBOUTup9UcHYzTuumv4CsFDnBL/ks/YfkJXLzvcqG//fqiWPEpHdTnU1+f3A
         olr/GPohTEV81N9KL046xH994V/sdEijeJ5W+6o/KzycQ19rVSX+Q9dkrOVvokw+gNrz
         JNokWZ6/8ibGduD+K19hM9u+/GBxnUJQELibWlM+B2TgH4JEeqeiMErFZijXXimRQI/G
         8aww==
X-Forwarded-Encrypted: i=1; AFNElJ8PXpmBpNv2ZZ9wlHEXMsnnOYFHSo8foMx1RVAx3mgeeEut2oUp+IzveeV4JJb4gQBRGnxk6yfu3E4J@vger.kernel.org
X-Gm-Message-State: AOJu0YwrTq+6TJ/sKQtIBnYtM8auDihWUWo6IwU4vAtyLcc35Jm6D5Tb
	EZSlCudzIX9PpEOfGgx8olHCNiYH0MS5ITF78jMlq+yRpzB4MGbXrE58
X-Gm-Gg: Acq92OF1+YGYmKxb+LtCJNj+AgDsliHWlxRbdQXWmWmwx/Y3Qk2bjiDbcqg1evEuYKv
	98OcqjocaKRWAEJEaPepXQk8g8pNcpe9SVDnb+wfgkU3iwJGRVJelBHSdfOXwuQz7SpoMBOCN2X
	9MXsSVtCmwbRdGdQgSvBpZ80aaR8yHzHoJ++7MocuJoE7461t4YvUc6cO2bjFqKagBizqYC4emD
	rzFhwQAmPhh1cv2d5FDsflV9fgZtZ/YG5HVv4W1EYOKeUnERiCiAbOmpBVl8nSLr68xtYTqZcz1
	H/PtP3hGDyt1VMG8gtbSziolXDkUIZo+i674YPSVsW+/h3/3Hb9mu08omwEKUXeeiPM2o7N1fCc
	5O/3vmNUJKgY0KLKRulNOd/hyEqF2LU2M2A62JW9YafU8w8qemczepW93MByThLsGAiVwTBjR5C
	4t9MEco6jYwxe1eoXO+zQuopyAOancd7L/Xk5Ok2tew6wJFb6hUQ==
X-Received: by 2002:a05:6512:1346:b0:5aa:7a7d:c7d2 with SMTP id 2adb3069b0e04-5aa886ca133mr5697683e87.18.1781098510327;
        Wed, 10 Jun 2026 06:35:10 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66ea9sm62000751fa.2.2026.06.10.06.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:35:08 -0700 (PDT)
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
Date: Wed, 10 Jun 2026 21:34:58 +0800
Message-ID: <20260610133458.970174-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609-ebook-tantrum-4846384c02d5@spud>
References: <20260609-ebook-tantrum-4846384c02d5@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Tue, Jun 09, 2026 at 10:08:27PM +0800, Jun Yan wrote:
> > > On Sat, Jun 06, 2026 at 11:04:00PM +0800, Jun Yan wrote:
> > > > CAP1114 is a 14-channel capacitive touch sensor with 11 LED outputs
> > > > and hardware reset support.
> > > >=3D20
> > > > Add the compatible string for CAP1114, include its datasheet URL,
> > > > and update the maximum count of LED channels and linux,keycodes entri=
> es.
> > > >=3D20
> > > > Add description for microchip,input-threshold: CAP1114 only provides =
> eight
> > > > threshold entries, which does not match its total channel count.
> > > >=3D20
> > > > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > > > ---
> > > >  .../bindings/input/microchip,cap11xx.yaml     | 21 +++++++++++++++++=
> --
> > > >  1 file changed, 19 insertions(+), 2 deletions(-)
> > > >=3D20
> > > > diff --git a/Documentation/devicetree/bindings/input/microchip,cap11x=
> x.ya=3D
> > > ml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > > > index e307628350c2..08233386a433 100644
> > > > --- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > > > @@ -12,6 +12,7 @@ description: |
> > > > =3D20
> > > >    For more product information please see the links below:
> > > >      CAP1106: https://ww1.microchip.com/downloads/en/DeviceDoc/000016=
> 24B.=3D
> > > pdf
> > > > +    CAP1114: https://ww1.microchip.com/downloads/en/DeviceDoc/000024=
> 44A.=3D
> > > pdf
> > > >      CAP1126: https://ww1.microchip.com/downloads/en/DeviceDoc/000016=
> 23B.=3D
> > > pdf
> > > >      CAP1188: https://ww1.microchip.com/downloads/en/DeviceDoc/000016=
> 20C.=3D
> > > pdf
> > > >      CAP1203: https://ww1.microchip.com/downloads/en/DeviceDoc/000015=
> 72B.=3D
> > > pdf
> > > > @@ -26,6 +27,7 @@ properties:
> > > >    compatible:
> > > >      enum:
> > > >        - microchip,cap1106
> > > > +      - microchip,cap1114
> > > >        - microchip,cap1126
> > > >        - microchip,cap1188
> > > >        - microchip,cap1203
> > > > @@ -62,7 +64,7 @@ properties:
> > > > =3D20
> > > >    linux,keycodes:
> > > >      minItems: 3
> > > > -    maxItems: 8
> > > > +    maxItems: 14
> > > >      description: |
> > > >        Specifies an array of numeric keycode values to
> > > >        be used for the channels. If this property is
> > > > @@ -122,6 +124,8 @@ properties:
> > > >        is required for a touch to be registered, making the touch sen=
> sor =3D
> > > less
> > > >        sensitive.
> > > >        The number of entries must correspond to the number of channel=
> s.
> > > > +      CAP1114 is an exception where channels 8~14 reuse the eighth e=
> ntry=3D
> > > 's
> > > > +      threshold, so counts differ.
> > > > =3D20
> > > >    microchip,calib-sensitivity:
> > > >      $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > @@ -149,7 +153,7 @@ patternProperties:
> > > >        reg:
> > > >          description: LED channel number
> > > >          minimum: 0
> > > > -        maximum: 7
> > > > +        maximum: 10
> > > > =3D20
> > > >      required:
> > > >        - reg
> > > > @@ -199,6 +203,19 @@ allOf:
> > > >              reg:
> > > >                maximum: 1
> > > > =3D20
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - microchip,cap1188
> > >=20
> > > I don't understand this restriction, shouldn't this be
> > > if: properties: compatible: not: contains: microchip,cap1114
> > > so that the constraints before your change are retained?
> > >=20
> >=20
> > Previously, the LED reg property had a default maximum of 7 for CAP1188.=
> =20
> > With the addition of CAP1114, the default maximum is now 11.=20
> > An if-then constraint is added to limit the LED count for CAP1188.
> 
> Ah, is this because cap1188 is the only existing device in the binding
> that actually has LEDs?

- CAP1126: max 2 LED channels (0-1)
- CAP1188: max 8 LED channels (0-7)
- CAP1106, CAP12xx: no LED support

The LED reg property constraints for CAP1126 were added in Patch 3 [1].

[1] https://lore.kernel.org/linux-input/20260606150458.250606-4-jerrysteve1101@gmail.com/
