Received: from mail-dy2-f19.google.com (mail-dy2-f19.google.com [74.125.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3925F4D2EC5
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219225; cv=pass; b=B7qiq0iCSvuWg+KaCikAY8Ykkwp/PXIKB/1X8x0w9IhwOA7DfYdnb4XcttON6tKF2SVQtmjZky8YKVYl2HcomwKlEAe4OCnUxoAf3ZdPP1XzPNkIgonXOfTzOP3wqzFxtqNVG8NXQEgnV5zZyxhW0zN9Sy2N3cZ1w31KCaLBfuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219225; c=relaxed/simple;
	bh=zSYpeV2P1QioqwAowluQEe3O60HHZwF3K/Julewq0kQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDQ/LMJ+52d0QAIN6ipZ2FlxTTI6zY+4QbasktlXLL4XSTzOXWKw91jZjlCnJa1cZaUbUolNxmghI/mTdClm9NC10uB2byCHia36r4/A5Y0TYfWtiJEtAQ3azKaNpHAepzfNQfgxiv2g6xMi0p6ySxibU21/EMDOPXTm67x1o9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQzhVZRG; arc=pass smtp.client-ip=74.125.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQzhVZRG"
Received: by mail-dy2-f19.google.com with SMTP id 5a478bee46e88-34d2d25127aso993854eec.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 09:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791219222; cv=none;
        d=google.com; s=arc-20260327;
        b=mPS2wEb4OlOhrqa+UI9+JsrDUx9Og54O5Ow+MzZJhqvCTPT2jtTAsyF4Dn7jTf0LtC
         iJ3hGDKcKl0HZ6fUyKDRKUhSJDr4B6xHTpi6lzatOzWXh2CFEYosQdeEpSCRJ2X97feh
         3u6LnYnDEcM7L9kw71JDEyrcj5kjxzy8EH0+QYhdCyC6FAlLMOZliA8Q91iWbY1+2nIT
         p5N1WdL7n33q6TNpe1EyRRWXbHJfZLTrwUtONJspN6vCtR2pMRH+CHnYonxphejO3Y+H
         AsYFK9lz+5IUOLk4wxb2bSrv2WeLEwb+BtUCKrWJqreMrmPHAdYMjlcol5VkRvHimVdg
         vwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        fh=pSpBlQ4ybNQZSpwB0PzOJmtt9aQxJgKoY14gc1mOOqs=;
        b=DMybIyLFvY+DAJ279gLw9q1hQ8Oh8XNJ6C8xVEO2suZW8QjEU9eX1Gu+CfpPacchXs
         wqGUNiQt/7lfyYxPxnvbTvfzt3t9xBHxuwlfovCGEOgw5gz69QAHbBPeTbWF2vwPKRL1
         ujxaD7qXKFBt4XNdSqidc70Cbo0B+0MBjgibkaZZVgHdJisgix9gl6lx0b01vme0QNjg
         O+HglvVG2zzzFiyUHk2dftKsFn6fyelnoxzDpbj3mPxLfTGT0YuVnUiicRo/5qNXvvwn
         MWYSe5n1MSOQV/P7dyJVNDl+mQFZkOrNvkV2zvIFL8R6Z954SROhYOQP+rPZ+R6CLofD
         pruA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791219222; x=1791824022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        b=oQzhVZRG1/i1tE/dByK3EUdbB5r6pa9Hw/FHX2RuROy1L1cO1yCZbs95WqQJtkLZu3
         HokXOoSh1Ns/qrHPybONQbBTCGBa7LXXoCWjoqGmW/LoeDefuv3gw+QzN68zHVcaEMvI
         AdFx0X46N8CgwhjncbkxXdl2JX6Ytg519aNwe/SEkVLjvvLIPim4ugQ+PwXxBOW64faQ
         ISHmHlql2SsnuPUtWoAvhzxQHJwKDdAtNx/Bl6Ym8pL1qR162kuFxPSG6MBArIyolS5B
         jiU4uEQcPA4XewEW4NIKQBV0DtRNAmxOst2MOJ6kWrjbkfT6XVNjOu6SLmcHSWGKcAND
         GyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791219222; x=1791824022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        b=wBSi+wREeYOiYhL1do7kyw6oM+P0mowOk87fOeI+T2TnDbf/nIIrLVxMpJdTh3Zhi9
         H2/NH3Tc2A7uR68BMdEUzC5qwmT1U9/nIesE5CzG2w0CFN1u52CHIcrtyABjshvV+N1R
         RNye4zWmTSmGJ6/g/9P4Ua+QVRqekJchdrI8AVVnfiYfzK60w7XuorwDStvMkapI+veC
         KIWqlJiDBXvZ9rg3Tm/6GQF5OFa+5x4slF68vB3DWoRSbJYFYYB+6LoFL0DUqMUtP5s5
         LcCTNIY1S/SibyMoe2eGdr7oLYRwpzwiUXAMyqLc7C1xsISMN0097ao3Dk4gHGPOG2G4
         PfMQ==
X-Forwarded-Encrypted: i=1; AKwUvBw088lopERvDsR4BpBlallP6ka3Mgi0qxH7HPI7Wb0AmO1pWNcT4vqAHan3iFZraOhFTnAJ/7b4MASa@vger.kernel.org
X-Gm-Message-State: AFuF++kIj9C2AxoDLFey3dZVogeYlWCc6M/uCkP7iWiaJP9wdbgXZipV
	BDkWXp2PrZzg7i8P+Zt9wD9d25PiHwPLCGTH3zoF/klvZ/oxcVh1GyMEQYQKDoo9d/ZaqlQhILG
	SCyG3SN//uGtBQLl6na5x6P6HoAYEXhgZOg==
X-Gm-Gg: AYBFou1vC5DfAD/9+eNajg4rlee1kGclHXgp37GJwcvH/g1lrzTfPAGRivuu5MF0zZS
	ELb/UyWSaAcKAcHV7/F6RFbTi/WOdGxnjXBUcXJN1AxJjshxuI6anW26f8QPV5vPyTGbiZHpPRt
	Z6QI/TxEBMfkTYWE8HBZRuFW4QMRq3YnoDivdev7k6VCfiUdd6L01MHhkitOLaCbfcBDLy+1kMZ
	pgn9GrmO+m8QGQ/nZJgB8Z+SkFbhaRd6+9lAN/2r3zcZlt/U9E5NWBpetVfQEMmJ3zq/QxpyQtL
	qIzO7hMFa3aLQb+J87r37b2l+VgIhJVs6s+6uDY1bsdkA0brl89Xs9QW944hJaqTx77NTOFRy+8
	01Z34Fbg1LD0n
X-Received: by 2002:a05:693c:8804:20b0:351:202c:c7a5 with SMTP id
 5a478bee46e88-351202cdc40mr6426669eec.0.1791219222183; Mon, 05 Oct 2026
 09:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004164121.193514-1-clamor95@gmail.com> <20261004164121.193514-2-clamor95@gmail.com>
 <asPQ5FgHe87XQJBT@aspen.lan>
In-Reply-To: <asPQ5FgHe87XQJBT@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 5 Oct 2026 19:53:30 +0300
X-Gm-Features: AclHuK80gf8oQpP3oXOiwBy9nGlcatk2lN-QYD_5rDpDvRkaMQwRh_t86WEgBCw
Message-ID: <CAPVz0n1-v-AcKg8O66q074N3gOZQD1Z6k6O+ae6yJS_-NvT6UQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: Document Skyworks AAT2870
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 5 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:31=
 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 04, 2026 at 07:41:19PM +0300, Svyatoslav Ryhel wrote:
> > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lightin=
g
> > Management Unit.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat=
2870.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.ya=
ml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> > new file mode 100644
> > index 0000000000000..014678616076f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> > @@ -0,0 +1,127 @@
> > [snip]
> > +  backlight:
> > +    $ref: /schemas/leds/backlight/common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: skyworks,aat2870-backlight
> > +
> > +      led-max-microamp:
> > +        minimum: 450
> > +        maximum: 27900
> > +        default: 450
> > +
> > +      max-brightness:
> > +        default: 255
>
> Should there be a min/max here as well?
>

Seems that you are correct. Thank you!

>
> Daniel.
