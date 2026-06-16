Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9112F30569E
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616903; cv=none; b=VTTbbKVexktpnfWuFn+v9DjD1JX5ltTjXocrCu6rDNgx+6JF9aIJSNrTLvB6PLwqhtVn7lEEVkoCovAbrrhUSFhJhgHghGPT7pFut+M69/U+AGUqvp4VkhNIdv1edGAPR0NLQOaROAPvu4IHnyvIqaF0p+699c8wZwlIdhpjfdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616903; c=relaxed/simple;
	bh=8SWr+8yJ64EFlEqK0VHlM86gjkBxaLAQ04nGhLaz2s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBA9rvTJRv+nnKS3/Dbba1JWU3SCHJ6YnmD8slNSluhR4NkniVgARsF/PlqSWFSiUDdS8hB8Xyz/YGhDxQ2cSt62O7ZAqQTsmKUA4rKToYekpVoN3Rmkstm+5M30277cpoIJ5zPmcZC3sQv4h7frOOUBoBGlIMCuRKQcYcCB6Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW9uIb5y; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW9uIb5y"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304ec41197bso5135025eec.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781616901; x=1782221701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zqQ8rKn54gJWMFUFRv0VoaxJmxXkF0GPg+cMV+9gnA=;
        b=YW9uIb5yI0YZYO/+twnfKfEn1QIfxtG4w9ac36/FNgLhA3P2J94euvLznpTTJ//uWw
         TzP6ePBce9EJVeLXARWRwG43Gk3bbgXTcOSX5UTQvUyJMj/HqjL50l0yj/+giQvrneR/
         lbIY534QeKDMgl85lL3idV1JLoHU1RbYyUFvO0VruJnME7YCmxle39AmuaMNeJnVfW0+
         hQHzd8oLpmooW5dX1h0d1pWQR/ysvrHGeWNcMHm3F1eLeJV6lAPUMPyR3xgVziKVfFw2
         2ADRC4a9NbKFgYZ2ceT4J9x/iqGRUts2jcXgHnFOaiFo5ekYTTcELKMxx2Cidmi2CP6X
         ufSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781616901; x=1782221701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zqQ8rKn54gJWMFUFRv0VoaxJmxXkF0GPg+cMV+9gnA=;
        b=hBpNhaOupp09HFtorqz0QCG+CPXALLjmNbZqSMJ2rAwguiHrxroVgYRwhZEpFWj33r
         4Qvl1M/Q334W010a7/z7vXULN2q0bgS7khf+ZZYkOfg2qS/kgfffudG4Cr0l3oxnWy81
         iXwDbl7PgQPE9K4IxAw6mC05vybA5lGiJ9OtblEtv5Vz0LT3n4ABCU4/EkzU1iJkQ8jh
         ml+qYMrsQ8Y1HxUTVqlD78quqf6cRjJamP2FKH/W5rroGEV8EBlkNArHvHZS94sNIhMA
         Fl8knbYWwPm4qrJ/seqZoLyVs863jRX9Plfxid4Vfqtaq3dHP1MUK2hna4ryWIba/Br7
         W6Zw==
X-Forwarded-Encrypted: i=1; AFNElJ8zO8F7t4KmdbU2qDtp3FVANutV9BA/tuIMqSMoypwwRWRNxvKQb3CUYLiY0f9a5+wh/2LIl/sVeI48@vger.kernel.org
X-Gm-Message-State: AOJu0YzyqZIVHgEC4YtKyigtuetSCeQT8HK2LsjHRE976nbMrkqNAgvn
	FpF8OFAzutCrEBd/o84Jz+r5Qx8LCYVJ1wYDaoSI18eFPFTOIs86klF4
X-Gm-Gg: Acq92OEkZ9FBAw3eXUVbxKbNyVD/XJLvwAtOJ7utLc+w0OZTxezuCtAQgoBTv/NgYkn
	ht3MqiHTbgia0Xnd0ic1P0cpXvc5L2xJRwwq20bkqrICTJ6zXzZCSsFEynRzb4M4nMPtwedhv1A
	r0TBuEQhAdaYDW462g+Xl80Ggzx4N05gg5sTRaEFswj4Q0bBRbFD50Uut3oq+orLXD8deM2JlEx
	cc+Tcs7p4x0nbsdWJ5ENamiMDFbfmNqSbfNDTThHOIN1Z4b0MnZotcWIYPSGUnsvOiYH40hxGZ0
	xm9PNyaoehJWW4hc9V72pXAs/Y4yWU5nZVehkwZstN1NkPpgxlVNOnx3K8V/zFU1eMvEoaU0Ujc
	VGR1NzAcydg3mg1xh9nrq8w5Gakc0/fODJT3TD/s821cJ7NSNe8oTzbSWl7r+Xdj/SUZHe17+PN
	4l2Gwwp4adFWDB4vbseR+5xOeL5Lxg8gI=
X-Received: by 2002:a05:7300:7b95:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-30ba5f7020emr2320528eec.26.1781616900579;
        Tue, 16 Jun 2026 06:35:00 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm1224226eec.22.2026.06.16.06.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:35:00 -0700 (PDT)
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
Subject: Re: [PATCH v3 03/10] dt-bindings: input: microchip,cap11xx: Update datasheet URL and LED reg range
Date: Tue, 16 Jun 2026 21:34:55 +0800
Message-ID: <20260616133455.426643-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615-splinter-subtitle-a88cf08320e8@spud>
References: <20260615-splinter-subtitle-a88cf08320e8@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Mon, Jun 15, 2026 at 10:20:29PM +0800, Jun Yan wrote:
> > - Add datasheet links for all supported CAP11xx variants.
> > - Update LED node regex and replace enum constraints with minimum/maximum
> >   for LED reg ranges in preparation for CAP1114 support.
> >=20
> > CAP1114 has 11 LED channels. minimum/maximum constraints are easier to
> > maintain than long enum lists when expanding channel count later.
> >=20
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  .../bindings/input/microchip,cap11xx.yaml       | 17 ++++++++++++++---
> >  1 file changed, 14 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.ya=
> ml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > index 7ade03f1b32b..9578c7c206a2 100644
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
> > @@ -124,14 +133,16 @@ properties:
> >        The number of entries must correspond to the number of channels.
> > =20
> >  patternProperties:
> > -  "^led@[0-7]$":
> > +  "^led@[0-9a-f]$":
> 
> This should be done alongside the cap1114 change, not here I think. The
> constraint relaxation doesn't make sense because the user is arriving in
> a later patch.
> With it moved,

Thanks for your review feedback. I'll move this constraint change into 
the cap1114 patch and update it in v4.

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Although, should it not be led@[0-9a-b] if the max is 11?
> 

Agreed. I will fix this in v4.

> pw-bot: changes-requested
> 
> Cheers,
> Conor.
> 
> >      type: object
> >      description: CAP11xx LEDs
> >      $ref: /schemas/leds/common.yaml#
> > =20
> >      properties:
> >        reg:
> > -        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > +        description: LED channel number
> > +        minimum: 0
> > +        maximum: 7
> > =20
> >        label: true
> > =20
> > @@ -158,7 +169,7 @@ allOf:
> >                - microchip,cap1298
> >      then:
> >        patternProperties:
> > -        "^led@[0-7]$": false
> > +        "^led@": false
> > =20
> >    - if:
> >        properties:
> > --=20
> > 2.54.0
> >=20
