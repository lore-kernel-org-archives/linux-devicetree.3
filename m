Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44F3B27F6
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021050; cv=pass; b=N70RQWl9RlifioNdck4mAsD69Iec47gKQB2Lcwc4/yLanVqdacBhSlzCAElIFbY3gH2zfuA04R4DDFkawkebzlvk7y02voev8eOCHTopIn4umwfbK8VAMebV0n3v91uLFr5f9Fq+ocj7UEXnAhn40Mte94hRw1FaXOiOby1ELJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021050; c=relaxed/simple;
	bh=cPrLSyGwGLPmONlY2FTynuZ/8LkekDLtwBlnPe36bVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShRXX/+l8ImpXWhUsozKHudWg9+7O88oNy1cPdB9267wUUMn2VyLZ/cfUgIssa2KQFmZQ8439rGN08ang3d5prGbYk53450GpaJy4oR4C+hfXsevGlJ4DPGWKf9SgwygzhVckUCXGkvDazhfRjHQsq0w0AcXmmbmsS4CUNQIhho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3IRDFHO; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3IRDFHO"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7912ba58291so123833137.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 23:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789021039; cv=none;
        d=google.com; s=arc-20260327;
        b=C6r5kY1BNeNbAzBVSU4NFTPdPQHB1yzRqOVqpAXB3HNXLYBvvvK0SwFU8VwZ87zdRh
         dwYVWZBxg31v5Csf98oVTMLna6t/C3gMjPqJDXXBH5lyK6euwmTQfRYnz0RubdchRZLm
         bnGSFAq47+7v5IqZAq6VgBj0ty4STerxttVI+aE1xpmE/5nIknYpOTbcwCS/q6nNDl9H
         bt7ZG5TllZrGcC2XKG6gvbrOx8lr8g5/+Zsrt/lmwZve/PefrOI4aIbgJP1cy0KfGt1q
         MZSWtfB5RaN5WwBFfy3XE9CGUrlFejpTxfRKcGBFEv+2zT6djgMGu3Ry94RF9wFg/pb1
         xfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+gu/5PaYwRoWH6FAJcX79bn4Lfhl+cAwZpfqQzFbKk=;
        fh=kvYRr0VgE2GSdXOef7c0kwIt1VuryUR2w2HK51r7MXw=;
        b=TvhMqo8s4RGdQteMtgH2v60fl/mFlrReOOLojnhhunzjJtpeIVmUz2SojzEplVgNZj
         WoYy2RZeffoMNfhxb3XnCkN8MTbdwdkZNNuNdRLXSbgBVBmCfh4mYanx3c1rvTnuqlbg
         03nYioCTdFN/FupPm+VaDei/8wbvXQm2hiJhUPFSA+weuXX4EdYNqqMEAgEW3NqxHDYV
         B9MMR1pvxbZo0RppsIcj5ulDirDdzx7EH0r4JZufp2wP63Eutywo/kh5Uwy2/VkolrYx
         Y+dm6HHye5KQzoU4FawNPMRXoHoALPXI+MfCqvCIIJJO1m+kzXFqllIYo90E66oDLQ3o
         sGkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021039; x=1789625839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+gu/5PaYwRoWH6FAJcX79bn4Lfhl+cAwZpfqQzFbKk=;
        b=s3IRDFHORWZQjwdW8fT9py5zLtdIu3NrcUBW8HwlshmHkVbq7hSqqQnn/JXiPd1oRB
         MrjoTiU25YpaKxuU3fFnrY9y7J2Li1XRnfOMF0ZYVgkI0XYO/Wj8f/mzkR+9nhlX3NIR
         +J0AQYTFrnxg2+Mr0eairAHic8ngLO5WMIJ8SoSIq4IQJiGqAyhHlkMmeDOT3ksQHYL1
         mm3O4SkyotrikclbGD1ICnejW1wNu8YfX5TC1v0pM1z79Y6cqMwQaNekO9pRC4UOx4dZ
         OaDm+JCSFl7phKSKvx5WwDTnZM38t1rDSHxrqcXdhggVw75ZLi/1+GmSCGTzjcBqOasa
         Sk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021039; x=1789625839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+gu/5PaYwRoWH6FAJcX79bn4Lfhl+cAwZpfqQzFbKk=;
        b=IBPm9AmWKVNDnGa472ZJQqt5u+eza3wC9YojxPR9uhMCMXD0eaCb4fMwKgCWGECcE4
         mIKn4HB+7tn+u6dXLyNVX35RRYLzm9k/Ahmtm78lCMIRXGNpcF3yNWPCWl6J59Y2qXGs
         rMutYoCsz8uuWRhJRwE7OEvys3ntfJ5uX5rpsMtfN/2jtEJHNklbq3HIhrNUspwafC/h
         79RNIO3QES697rzYL6jA+eqttLwXM98YT8RnfaAK9HmNQrne7L3pxKpObR7PmID1dnvO
         7ru2y0wbO9WOzmp7EAnR9yuSRXpEfNpWiC6fBQTnfiu0Fzp8S2cusM5prqqKevvGkcCq
         fiew==
X-Forwarded-Encrypted: i=1; AKwUvBwlwzWwnH9yfszhfo8WTt9myAxw3NpdHWT95rV8T5dXA6F7kVLTWsJZ5//Inydglauemh4MjW/1ItWq@vger.kernel.org
X-Gm-Message-State: AFuF++nygx/BynLyVh7KtrVeH+Z6Hli9KFk0LCb0I7NZaX/1zBBoGp/7
	6C7uaz02ysYNS6NP9Q1lA7F6ir2LLlQGnnfH3Mg9cWxm2U5bGB4Do0PX97EvyMgk2rpn+J2XhjG
	MwIB42MoJJ7DFUdD4t2B+OQI/ipCakvA=
X-Gm-Gg: AYBFou3OS8veG8OGOlWXrPx/DW9GptMH5oTnUAoEi6A3CiNc7fgM4lwzrn4QYy1q4IR
	MUWZAOeMLDTlHcAilgGNzxv5k5O2x4KvAKYAXz5nH1BaVZ0a5fVIdpFAjqBCeV7cinWAEGjyX06
	gBshSw1LBHFtNMHhBkNIbIzpCU4tCQAv602ZJuRh408xKxBBk9NLk5EHpbt3+T9B3zjDeHv1jg6
	SwzPrbNTjvFzUA3gZny3e5Vw7o+/ygkqoc5IcaSsVXdDrQG0rYnjPz2nZcubDYjdv/7ZxzIQOs7
	CYYYoLUu82h4H8AEF6nJBb3+2xsauoGPL7VS3rstu0rzNmhTUMOofjMkEcem3bRCJl4WZg==
X-Received: by 2002:a05:6102:fa8:b0:78f:5bab:4761 with SMTP id
 ada2fe7eead31-78f5bab4867mr6319524137.8.1789021039061; Wed, 09 Sep 2026
 23:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
 <20260907-add-tda38740-and-tda38725-v2-1-1d051d63aa01@gmail.com> <20260907-kangaroo-ascend-d0541fbdc975@spud>
In-Reply-To: <20260907-kangaroo-ascend-d0541fbdc975@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 10 Sep 2026 14:17:05 +0800
X-Gm-Features: AcwNN1WJnyA4tn7yoArv1afcfdYawuxDz1IlQc9gvSLXyiXSPW2rdMiDiRDwIWA
Message-ID: <CAPBH0A9ULmcNV_SGf7GsywpdW_LZubkFY8hCrV7x_oXtv6-7dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Sep 07, 2026 at 02:52:29PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree bindings for the Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators with PMBus interface.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 82 ++++++++++++++=
++++++++
> >  1 file changed, 82 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda3874=
0.yaml
> > new file mode 100644
> > index 000000000000..c9bf19902d3c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.y=
aml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
> > +
> > +maintainers:
> > +  - Colin Huang <u8813345@gmail.com>
> > +
> > +description: |
> > +  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchrono=
us
> > +  buck regulator with a PMBus interface designed for industrial use.
> > +
> > +  Datasheet:
> > +  https://www.infineon.com/row/public/documents/24/49/infineon-tda3874=
0-tda38725-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,tda38725
> > +      - infineon,tda38740
>
> If the programming model for these devices doesn't differ, one should
> fall back to the other.
>
Thanks for review.
I will update.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  infineon,vout-scale-micro:
> > +    description: |
> > +      Scaling factor applied to READ_VOUT telemetry.
> > +
> > +      TDA38740/25 pin strap parts are available in two flavors of
> > +      VOUT_SCALE_LOOP: 1:1 and 1:2.
> > +
> > +      For the 1:1 VOUT_SCALE_LOOP version, output voltage sense pins a=
re
> > +      directly connected to the output, and no resistor divider is use=
d.
> > +
> > +      For the 1:2 version, a resistor divider is typically used (for e=
xample,
> > +      499 ohms for both top and bottom resistors).
> > +
> > +      In some designs, users intentionally modify the feedback divider=
 ratio
> > +      to obtain an output voltage different from the internally config=
ured
> > +      VBOOT or VOUT value.
> > +
> > +      In such cases, the device telemetry (READ_VOUT) continues to rep=
ort
> > +      the internally programmed voltage and does not reflect the actua=
l
> > +      externally adjusted output voltage.
> > +
> > +      This property provides a multiplier to scale the reported teleme=
try
> > +      value so that the monitoring system reflects the actual output v=
oltage.
> > +
> > +      The value shall be expressed in micro units where 1,000,000 repr=
esents
> > +      a scaling factor of 1.0.
> > +
> > +      Example:
> > +        If actual Vout =3D 0.75V and READ_VOUT reports 0.7V:
> > +        scaling factor =3D 0.75 / 0.7 =3D 1.071
> > +        value =3D 1071000
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 100000
> > +    maximum: 2000000
>
> This is not a required property, so you need a default.
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
Thanks.
I will add the default.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        sensor@40 {
> > +            compatible =3D "infineon,tda38740";
> > +            reg =3D <0x40>;
> > +            infineon,vout-scale-micro =3D <1071000>;
> > +        };
> > +    };
> > +
> >
> > --
> > 2.34.1
> >
