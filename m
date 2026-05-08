Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C603845A4
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778228451; cv=pass; b=l9b8Kwa2Q4uxJrBAgNdA7EJGhFd9S+ZPmVRPCEKYyhdS/IjGTn6ufKRFv+U3i3f57ExXlNU82tE8Lm7rx4Vuhjf7+FJLOvuM/xGPdi4ldSnj1dbajpXJxCZCnGauXACZeEtHrX1R61RsmVnyQ03SWMmow+JV3LKjiQ3mx5m2DT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778228451; c=relaxed/simple;
	bh=lTkF7Xj1pPLGJApccu/V8Mry4PVrzP0dv5SU+hphSqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOwSPNCPBDmi156y1526+jwPtco6uzFMx8CCu15TLvcQZnZMxZaZdPC+BiBHZ3hZCEIcex5aySQLBPz35RZKAx7xV1ilOQcNRkNCtWzukrUCf2zhSpBqfOPc2wh7hXRFt0N4d7Tn42hUUkLxKt2tX15nwQZHBBmcWWaP3k+NEZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovy7WJKb; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovy7WJKb"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-62dff2771abso604523137.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778228448; cv=none;
        d=google.com; s=arc-20240605;
        b=Lg5PRYqLgxehGm0vTS/s4YqxbM7zVX3+S83F44sbhmCcwREHRzOqgbKsMAyRyIhBxz
         O4Ghg5QFxqdHXiqBTP2Fv8Ay09dCcCluofm2P2cSUN2Ds8NDBg76VWh5EK/+b48pSvzR
         qPFIyi8gqskdyYqisSwhS+BixmPV/Y/40bQLOWy/FBzD3QA8iE3mnV/cCL/h5dj3Kr6H
         v3n+YlJKu3+Y4TmCq8JFcr3NivOgYLLR6lpEHDiFJLYVgNtQliTddoJtlxUmoIoce2dB
         TUPmA6wn5xkOn/Yu4mG//detMhbXUPokiH2ZnxhGQAdzp2EmZv+4L4172bpp+NUZG4DC
         4izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HHvqc5QQlNg6QfQkGnDzkz4AP6jx9Mcp6qm5SqdJ5gs=;
        fh=KnER7XqoK1Q68rKuLlX8/xRcgQZkvE003N2w582m/Y4=;
        b=NKcFhd8Wwvd+4gVg2LkYN3xTGeESlLm7prg36yOh9ZnTumsPYjIrMfHrwq5zy4Rzgu
         bAkDnNYD5pSOwDPlWufFvH5JaIjtqqEk3SNMtXk+oq+XMji0iSjHZfp48jWSNvKgSZPB
         7zUg7Nb/eNu73OvyZPilmjz4Qyk4ekh26kSsIY664OZfOGwZtOce4T11gYfLyMb6HC5b
         6wrDFVV1sGREdGlIxNh8du6C1egTB9aCWhcLERZQ8wWR04kHjmbTcWSs7rMup1+tj51b
         +Hl4Nw9GjaRMQaROudx9soafWlYTTf2DUPl1T970xmLxUwpg8gRfAPfuzcuVP8nEBDXO
         rW3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778228448; x=1778833248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHvqc5QQlNg6QfQkGnDzkz4AP6jx9Mcp6qm5SqdJ5gs=;
        b=ovy7WJKbLUXUpfS9AK2nUoxnoJ9aJC6emEzi+YmThLXN3+ZEuEXrvBzJQGuVY42x+C
         LrikbL6KCjLDmFV54CKsT+eLXen8f96b8TRh0qwRS6iuazJxpaZNiPO1+t8ZqeSG01/3
         iKVptjKvNT8Ac62at3juk15Mcc/wEYp4PFs2E/Tg6YnohqQT5LrWCYWyLOir8aqkAtBu
         1xHn1s36xFW+mmiaqKn7KH6MsGDm1rWMU2X+H9DUfZfP/4G+KgHqTsUiVi0q2TexHLqD
         rvEigLzLkD5gXEU2j9fTz4cY8ohLJvXfyb/Z2FMKo1iZKvkd1sDYlOkbVki1Umxcskep
         60+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778228448; x=1778833248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHvqc5QQlNg6QfQkGnDzkz4AP6jx9Mcp6qm5SqdJ5gs=;
        b=Mo4JGyPZn8vAiGFlOqKstsZmEJIIk5PsDfNUpaVuwsnJ3sYaC2Np7sMxqMPwyiYtYD
         2wl10O7NTW+u1LUj65OSVTqCrA0K+1GAXQPPGRiqTCbFq90ynoJLB0p6hDqtCXPONCTt
         QPaWNqB5iSeFHd5pbxGZpF2434W48/rW1Auop3TrXiaQn1kb9VTaW/RX4asttelXp6Cj
         IsRSGucJY0eWdKaYZnFkgx583cCelP4ebwm/6USh4NK0MDIsYh1guazUNMpSIDGBrYgY
         9ekXIIVlho4yxHSTx01nIiWlJuVphQXfMTM9ynCepE8rQqvGAJlelMzODBHEIiGrNs3b
         vUgg==
X-Forwarded-Encrypted: i=1; AFNElJ+CtQs8LuA/DmCq8JCwc6nfUIkm+gNbW6eO50kg4kCo602eTjAz5ETC8QBg03/ZTLkWAhIO3ozNPBtF@vger.kernel.org
X-Gm-Message-State: AOJu0YyEm8S40H7oUOsFPtgMKLdgbRsJBd7rQRWKbT3eEVUSc8f2VT5v
	m0P6fp/3jQ8zLUxBH9VN19N8uyBLjI2yBjvumADnFx1L5MSfkRtjUcFz6FhL8bYxPWaY6yAdvfy
	z2QrXxbFi9zhu9FG9fZVvmnL7SnHRmL4=
X-Gm-Gg: Acq92OF2TBfpOj3AP3Rgvcu8JGKb05iVUhyjkn55w8axzcvu+oQbGovF9nPEX22J6v4
	dH6G0obDDwxP4bU1JRAQ3qXcHKKuhOyf0I5oL1yffgr2x9t4ivrTTO8VL2S/jCH2axEKqZlFXQy
	GkWzlu7ZN9jIJ1gDt2EPDmoPODkUJYcNKYf5amTVnTPaBdG80DC8oeWbKc1sQosdA4htMJabMuV
	Iuefqd2IB0gKI77jQVQQURr+68oCPFHesar4vhhxEcTYlHrrvIHsfNkGOsPR5xcZTzi/c3B75RA
	w+naFZzNDXQm0+Ql
X-Received: by 2002:a05:6102:26d1:b0:608:6b33:5bc2 with SMTP id
 ada2fe7eead31-630f8fc123emr6203272137.18.1778228448423; Fri, 08 May 2026
 01:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-add-e50sn12051-v4-0-ff2b3768ac7e@gmail.com>
 <20260507-add-e50sn12051-v4-1-ff2b3768ac7e@gmail.com> <20260507-squealing-vanish-16fea3c114f5@spud>
In-Reply-To: <20260507-squealing-vanish-16fea3c114f5@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 8 May 2026 16:20:37 +0800
X-Gm-Features: AVHnY4LY8-27TKesI70xHAUIFe9rb9_MdP2mFDNPu7z3TNgg0dnTs4zeU01pEIQ
Message-ID: <CAPBH0A_D3siq+_CMM5Ouqemn56eJhU8U7KuL5gTC8h_tvL7kXQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051 binding
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Chang <kevin.chang2@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B45=E6=9C=888=E6=97=A5=
=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:07=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, May 07, 2026 at 01:12:26PM +0800, Colin Huang via B4 Relay wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree binding documentation for the Delta E50SN12051
> > PMBus-compliant device.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/delta,e50sn12051.yaml     | 42 ++++++++++++++=
++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn1=
2051.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.=
yaml
> > new file mode 100644
> > index 000000000000..72aefe212d17
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.ya=
ml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/delta,e50sn12051.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Delta E50SN12051 PMBus Sensor
> > +
> > +maintainers:
> > +  - Kevin Chang <kevin.chang2@amd.com>
> > +
> > +description: |
> > +  Delta E50SN12051 is a non-isolated 1/8th brick DC-DC power module.
> > +  It is a PMBus-compliant device accessible via an I2C/SMBus interface
> > +  and provides standard telemetry such as voltage, current, and
> > +  temperature measurements.
> > +
> > +properties:
> > +  compatible:
> > +    const: delta,e50sn12051
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C bus address of the PMBus device
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> With only these two properties, shouldn't this be in trivial-devices?
Thanks for your comment.
I will remove this file, delta,e50sn12051.yaml,
and add device into trivial-devices.yaml.
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        power-module@40 {
> > +            compatible =3D "delta,e50sn12051";
> > +            reg =3D <0x40>;
> > +        };
> > +    };
> >
> > --
> > 2.34.1
> >
> >
