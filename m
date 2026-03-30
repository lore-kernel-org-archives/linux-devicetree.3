Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1F42E7F39
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898400; cv=pass; b=JjQhfUe0xZ3MfBanfN2CLdzspMHozoJgEP4PbKrqZMeLLNO/hxJw4M0sBqSV2tF2ytAOgWluOG9uy3TururYZK4B+969mg6ik4ShzV0PE/o6DnYu4/4RUpqq0Ydnwe3G9EtCGQ7NIuxxt1CniRZbSX0s0TIOpSvzbmgp/XEfsOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898400; c=relaxed/simple;
	bh=bBqluKZrjDvkJ2sz16Us24mHBI6UQh8bxqWySviNgzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PesjNfLaw936tBZqM4QbgvV3JNNxbP0lDB1rOv8y5W+lfJms24OD3rpOCV33ZPZG3qyMZXi8Mb3AWUkQHIkGasf3aW+b8BpAEDK8XwRToqHb+Qk8nfAlw5LS0s/kJaudisnAybFqc6T4kyTremmPxvCavplgIlAXAOqG7y6iCCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0510kVi; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0510kVi"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so47244151fa.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 12:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774898397; cv=none;
        d=google.com; s=arc-20240605;
        b=jqMvbQXIxDQjFJt23nDcmab8MhPzhWLyyktR/ItiHbfqeoV6al1kFhWrQ3u6IJFyvo
         JD79/1bjEGpYt3mH5NsDQXxgbsQHGPoKvTohTcJ7UNh06eKmM1sXib/1s12jbAB0AWzF
         bVubMES98hog92/gUhq+z/CK5WPkTLi/l3gt2uKv1tpwM9JAiKfxhUryKPQ/4ndG5BV9
         +fRxwzYiyyf67PKpXIcV4gJjz/X21unCfv3u02HmyLjfc5w7YcN7MyIjaEpTnTifTXZD
         tFHfNIiIhdDVeOWvQtw5BPErLsO2jmjxihpPuZ994tqrPuUF6DX5R+I5lulBPycnkYc3
         rjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4zGI0LF4C8bfxm2P1yp2Q5w8PnJvbwboy4UaVubM2s=;
        fh=G9CP7RDCNie1uOwWGN60o6uN4zgHZIhnulh3jaO9oPA=;
        b=N4gAc5YMohvXinGYtdKiZlaYDkwL6iP0/jREoJp5iQpo89BkfQcDlNz0ypUcDGnEQf
         qPNwafU4Uuji3f953aP6yMSfICI07pEBkE7uMcidbSR+YxfiGsWLlN2I+VFeHR800LrY
         7NNfDZ0h1DipZ5e8EMNWqC3IV5pzOWjvK8K/lvIBK7WIB7a7u+RY0diepfKaDZbJ4vkt
         TJjg/4dxoxAjWEF5PrjnfsXih4IG+NKHXVErH5Ww3R3Pa2UwRZa1wZa7gh0Eb5AnPQ3J
         oPk8xLnpH1EJ1OPbQxsJtstJNkqEchguV3y9IIXKn7ntG3dEDQKPltTywMX0tSgUUHBs
         26SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774898397; x=1775503197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4zGI0LF4C8bfxm2P1yp2Q5w8PnJvbwboy4UaVubM2s=;
        b=j0510kVivvXjxHWbPtNMAs0MoiG5Z0ESi7hII4RtEOe1LTsEkSITeoLmLS/oACTHip
         mKvbKmaJCvH8Q4QTYfvxJJDZctgcdj/2ew7qWkz3VHd/P33dL6XJ0bt5VZ+UTn2zLihW
         7PQOJ8XS4HPpb1qk/23KdZyFXhAeCkG7uYdngRLory5fp4fSKS28rA2ZvsVSzRMV+NR8
         TfQL1gUL4WfeDlLh/t3xzoVMX+0d5V2P7dShJed12B9EzE3hHMyx30KNTXQiMxeJHfGE
         ZDTzKP5dNSc0xymK9NXu8HNAQqrCSUDt3FIy4niNInV4r70V170lWA+kGE0B71uFMVd9
         w5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774898397; x=1775503197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4zGI0LF4C8bfxm2P1yp2Q5w8PnJvbwboy4UaVubM2s=;
        b=IqShnCh5CR9uTPxvZClimSz83jUb51yY4L4fLXYz9nOvtAv/YOi0Z02A1PDo0HJdj7
         /+nnhBrOLC09CBzBSsMqkHc9XyNDhzWSMJGpN6/7clt72I1tCzxHGn5pLUEFP9LXNEps
         yMyGloeSEXpu3+tSZ6FKsOw3P6aTFKxrYJ/64+8HXKRDFrtA3O26cVKUqJMqRFbyOexX
         CAcvqa39IF1QjcQ9CwVSYf2q7hhMt99d4xiwxZTZlu+jPmH8Tc+tpD+tfocnmySHBwHJ
         kfGRMUq6CuRUMpxK1OPXk8A+DAG09WWkuyG05kiLpMNTN1KDWaz7Z1LQ532HmOlkI5mK
         pyLA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Po2mNn95rI+YjkDxnAykQbJ50hOSCYYCnVBJ27ktzsscIKGT+g8IQ94MaSXNaEBtZ92nbF6Ig+cg@vger.kernel.org
X-Gm-Message-State: AOJu0YwmMgAEo1OOmAIEA6yPkyyWs3Dr1/pR2Hr784kCsynkLtEUs2fC
	AgNgim0i+elbuUwXXZyqzRd+sTJQuFAZyqE3Wt87Cmxa751d1sEUhqFsOAownqG78RveN5ePF4N
	Q1m41YnF1nNRG9WGdFkl2bqrgWN7Zg9Sh1pJVega4yg==
X-Gm-Gg: ATEYQzxKHOGICE25coIDpmtGc4UQh7UejCvH4MykvfptNxmKS4cp26J34aRsLDNKesq
	JNP0mpP2NunhSWchfGB9V5lvKqv5uRl2mIYLBbpWO0dYfoD94AYmI3MC7NZEi/q80vKe4Vi/Y2C
	k84Io79/nQUv5312JLu2fX8db9Ldke8UkTF23fuYZABjamNXi1vD23NROyDyqCw3eHKB5grsxwz
	749ZaSdm8oB07L2JRQfw3KJrChb6UxFf42oLlx3QgEaqWPS4tZdK76Vth96/uM6dltpECqOOAtT
	ISAF6DxOk4iFJyd2mc85TxANILuTx0gP8OJUWIrH6YmQ5FkFi7s=
X-Received: by 2002:a05:6512:124f:b0:5a1:182e:1fdd with SMTP id
 2adb3069b0e04-5a2ba97ae34mr259197e87.0.1774897865900; Mon, 30 Mar 2026
 12:11:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327121919.603768-1-padmashreess2006@gmail.com> <b8ca83e9-5a48-032a-96bc-a62990cb61f6@gmail.com>
In-Reply-To: <b8ca83e9-5a48-032a-96bc-a62990cb61f6@gmail.com>
From: Padmashree S S <padmashreess2006@gmail.com>
Date: Tue, 31 Mar 2026 00:40:53 +0530
X-Gm-Features: AQROBzBeF4r6wAKBuXcXygjEyOsXmpae9qyr2Nh1QRmRZXDtSAHuxUe1epk4uG4
Message-ID: <CAEjBr-ZkFWpMARTyVe7Ln7GYPEXAG5phKWUNQFkP2495MAe+hQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: sound: Convert pcm3060 to DT Schema
To: Kirill Marinushkin <k.marinushkin@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 11:19=E2=80=AFAM Kirill Marinushkin
<k.marinushkin@gmail.com> wrote:
>
> Hello Padmashree,
>
>
> overall, your proposed changes look good to me, thank you for taking care=
 of
>
> the DT schema for the pcm3060 driver!
>
> I left a few minor comments below, but i am open for a discussion, if
> you think
>
> they are not relevant
>
>
> On 3/27/26 1:19 PM, Padmashree S S wrote:
> > Convert pcm3060 to DT Schema
> >
> > Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> > ---
> >   .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
> >   .../devicetree/bindings/sound/pcm3060.yaml    | 42 ++++++++++++++++++=
+
> >   2 files changed, 42 insertions(+), 23 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.tx=
t
> >   create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/pcm3060.txt b/Docu=
mentation/devicetree/bindings/sound/pcm3060.txt
> > deleted file mode 100644
> > index 97de66932d44..000000000000
> > --- a/Documentation/devicetree/bindings/sound/pcm3060.txt
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -PCM3060 audio CODEC
> > -
> > -This driver supports both I2C and SPI.
> > -
> > -Required properties:
> > -
> > -- compatible: "ti,pcm3060"
> > -
> > -- reg : the I2C address of the device for I2C, the chip select
> > -        number for SPI.
> > -
> > -Optional properties:
> > -
> > -- ti,out-single-ended: "true" if output is single-ended;
> > -                       "false" or not specified if output is different=
ial.
> > -
> > -Examples:
> > -
> > -     pcm3060: pcm3060@46 {
> > -              compatible =3D "ti,pcm3060";
> > -              reg =3D <0x46>;
> > -              ti,out-single-ended =3D "true";
> > -     };
> > diff --git a/Documentation/devicetree/bindings/sound/pcm3060.yaml b/Doc=
umentation/devicetree/bindings/sound/pcm3060.yaml
> > new file mode 100644
> > index 000000000000..2d920a70bced
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/pcm3060.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: PCM3060 audio CODEC
>
>
> Here, we seem to drop a short description, that this driver supports
>
> I2C and SPI. It's maybe not a big deal, but maybe we could return these
> details,
>
> as a `description` property? Let me know what you think
>
>
> > +
> > +maintainers:
> > +  - Kirill Marinushkin <k.marinushkin@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,pcm3060
> > +
> > +  reg:
> > +    maxItems: 1
>
>
> Here, i notice, that we remove the description of the `reg` property.
>
> It was there originally, and in the 1st version of your patch, but not
> in v3.
>
> The description here seems important to me - being a documentation, this
>
> yaml could be more helpful, when it describes the meaning of the properti=
es.
>
> Do you think it would be possible to bring the description back?
>
>
> > +
> > +  ti,out-single-ended:
> > +    type: boolean
> > +    description: |
> > +      If present, the output is single-ended.
> > +      If absent, the output is differential.
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
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      pcm3060: audio-codec@46 {
> > +        compatible =3D "ti,pcm3060";
> > +        reg =3D <0x46>;
> > +        ti,out-single-ended;
> > +      };
> > +    };
>
>
> Best regards,
>
> Kirill
>
>Thank you for the feedback, I will bring back the descriptions in the next=
 version of this patch.
