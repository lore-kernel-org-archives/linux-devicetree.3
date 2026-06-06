Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225B31DE8AE
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 06:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780727432; cv=pass; b=HJ9Ghx/S4MrYmnvY1ninMd+4dRyDFg5Ih2Mpa3zbBR/ASJPkHCcI+8hHuAlMqu8TnJH1PJxM98LpHt8oVY3rxAwsSIO6x44sHUh4iKFRRht0LyZWyL9bSH5uEI/GYmki9evG8ycQwHfcG1nPHRordFpV7nm7GlWbxoaHkknuL1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780727432; c=relaxed/simple;
	bh=X5eGIKIaAXbMeVaOi/enngMTrc+DGG2Ene5cw0upzEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADn3dlOFn+quHtcBjC0tG5+YCah+gGWbQc5DBFyjL3YozdJID9W/0wbsK0+F/klXAkfisF3aVrdES5cjm1TjisD3u9l5EBWhXnpuLM+nBT6ug08T9QK7Ty5H84ZSBfMyGPl08PO8XwGPxWYj+B3wC/1uwklJKbkzbXEO48e3MSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgqCgDZd; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgqCgDZd"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6605c3453f2so2835418d50.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 23:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780727430; cv=none;
        d=google.com; s=arc-20240605;
        b=VpGIHRTSuk/WTGmDNwcSveOrLhQjbmub6fdBHf7/8it97ll0d96aRd5nZuQhcGNOqS
         jE2u8lk/IA32OkfKz/nl8Egp8wHcIOKXFmxxpDjq9fK0kCvlIkQYh5x7zYWdO5VArU2t
         C4Xv+RozwHeyLxLS+m68UQKvbf1Db9vaWTfkNvGMKC3iT2SzXvxWRmRzGxXhslIRL8yp
         pNEZw2juYLY6n+XB1fjm/9SieamlLU8nJY/QHUsoZrY+3WI1xDOvkJRk24UhkzE/JwO/
         0xfbWwrKs33tUo+XkPW0BD9ft860yLAGUpJN/b3je9sk6VOKyQTTqNryIs1q/IB3Of1Z
         cUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UVijupBHQhJ/W4zWv4Cj+FlQNn4qa4FEf2D0D//0T3Q=;
        fh=UvVBq8OHtW/D8ac4MwiWt5SIj2xOzJgKg1whRgkyUlI=;
        b=T/EXHwc3h+GygmNGe1/nqTbN3qUXh+LeucjKewyqCnWAdtjjWiz7ZQPOQtyWcuUFNT
         w42Jyd3FyoVVi/+XLBDv2d+2/zuNvxxzi0ZG7AONMTSJhmr3EgJDQVXiDML37Bx7M9By
         EvOqqIatT+xPlLwbK7/wB3BJwY5I9FNlHuvPKwEAwCUFuH7C6+RCI0ndrTR0/z2uPBYd
         p2yvy6YLsiXhlS4RVD0pOSFgzagexfS0Zx96txZCdqinfKw0DEYxy+yu4A5xNAeUL9gX
         5Ed3aWkp6WV7KXLvQvIbNw2VfcIHqEDNzH1rbPn7cN0x7pGJatFErmacJO+KZZbVuWv2
         wnvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780727430; x=1781332230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVijupBHQhJ/W4zWv4Cj+FlQNn4qa4FEf2D0D//0T3Q=;
        b=hgqCgDZdH6FRGaHdHNnPdepxG7tAMzOD+EJFdjMVKR2mxqyXAp5lu3C4guI/U80Xt+
         iGl4vohJJ1QdwGO5f+OEVlSxS+5mxWi0VGD+nrMkYI5YJ48Ue2TtP4d3qccE5ODJIYzR
         lFtnAE5KDAZszfilzZs1J9PVWFoCXC1aX7v9u+F41XR2DrHckuSk1Lx4HfhKdKk0cNMn
         0EfwFNT1c4fdifrHWbnkY57RuKW6zD2aLYfKR6fhbMnqEGDauIC0zJD2aLDJiskEe6hY
         i9W8xmuGW7gcAw5qrztE8JG0H4GjAR09cVnhxEvAZW/iNKNdddNzbEN28D4YNmCKuUX0
         CB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780727430; x=1781332230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVijupBHQhJ/W4zWv4Cj+FlQNn4qa4FEf2D0D//0T3Q=;
        b=eh4Dy+/8zdE5OR6lsWK2ejlhnLRrdZTFU0FhLkVwOL9AkAzbYXZ9wTl/j3dqq5KY1r
         98WLCu2gmoOeTfU9aF1IQzvcLjiZEjTLyMF5qS5ki1NEN7aztnMl6HDs7PAY7g0fwFVv
         Kq9iMwQFe1DE5LCCTDJQEaymir8uPB9xgbcpZOD+aUNtO8OjcXGUh5rOOePzeQXeo0r6
         J/zSbqqbXbIa2XtQ3M27DrzVSUctx3W/PkWbBs2rj/LeOO96PcZiqogdj7yvKMeo+ceu
         6QSgxcAFj2hVCE0nfcSNtci9NB8Ss8yby6PTfH3jd6S+XrtX/C6dosyH0DIWoWzduLgC
         9zqA==
X-Forwarded-Encrypted: i=1; AFNElJ/bcjUcN0zFTHLokdxEN0q+6/SXO5b7ELXxie3T1WOoTMYumJXL1YoP2GFXvKN6KZInz+UDecRdyfg+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1+fTq8zCD4jaXH3YaHax1nJ9KEU/LySc6ojrBV3Lmw+dBcERZ
	ITgwHWiKamVubLjhKGTKZtA3r+eBDmXe0wzosW3imCdkbzhJo+NZKPwsN8d3yeyNmRz0dZSE+Lt
	FljAFRfwdlxwB2cFpbHj/dspNR2l0OV4=
X-Gm-Gg: Acq92OGcgH1068VTdhibrF2O9u3jdJLZxUBcX+N3cf6dzePWgBSYPoptQ5V65NRc3ts
	HBpO/SeMKxmoHQP7suHb09abLyqBt0NizbqN+An1jInFErLrEpshVFp1SrwkGNxQZlLiyoMZWZx
	kL4b2AiDCM7ueCAvJtO+oDRKX78ozPpqn5KvH+kYS7hE9MakSIdkpRwkgkgEmEgwZWLigc/eKG2
	jDxIGdw0X/196ew8la3u9yzcT5SacaU1WzbNc1Sq6CZrOFC6FqJ3gso+GWVsuNFOwFzhzahTyIu
	fUnORBryH2zqbWD+4mE=
X-Received: by 2002:a05:690e:144b:b0:660:8e61:1a60 with SMTP id
 956f58d0204a3-661073da64dmr5860503d50.14.1780727429976; Fri, 05 Jun 2026
 23:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505100854.5258-1-chaitanya.msabnis@gmail.com> <20260507192923.GA2429305-robh@kernel.org>
In-Reply-To: <20260507192923.GA2429305-robh@kernel.org>
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Date: Sat, 6 Jun 2026 12:00:19 +0530
X-Gm-Features: AVVi8Cfnh4kQyyE6tnAd7qDVPyvuU5534L8kK9y1BmkNv7zqyOcjeLX3vVPdgMI
Message-ID: <CABjkosH9OT3fQUhzryxnXkZL9EO4sgAEQ7hg2Y42UWrDDLbN4A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: convert axxia i2c to dt-schema
To: Rob Herring <robh@kernel.org>
Cc: andi.shyti@kernel.org, wsa@kernel.org, anders.berg@lsi.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi and Wolfram,
Just a gentle ping on this patch. It received a Reviewed-by tag from
Rob Herring a month ago.
Is there anything else required from my side to get this merged into
the I2C tree?
Thanks,
Chaitanya

On Fri, May 8, 2026 at 12:59=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, May 05, 2026 at 03:38:54PM +0530, Chaitanya Sabnis wrote:
> > Convert the LSI Axxia I2C Controller bindings from legacy text
> > format to modern dt-schema (YAML).
> >
> > During the conversion, the obsolete `device_type =3D "i2c"` property
> > was dropped from the example, as it is deprecated and not utilized
> > by the driver. The `clock-names` property is enforced as required
> > matching the driver probe behavior. The example node address was
> > also updated to a standard 32-bit address.
> >
> > Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
> > ---
> >  .../devicetree/bindings/i2c/i2c-axxia.txt     | 30 -----------
> >  .../devicetree/bindings/i2c/lsi,api2c.yaml    | 52 +++++++++++++++++++
> >  2 files changed, 52 insertions(+), 30 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-axxia.txt
> >  create mode 100644 Documentation/devicetree/bindings/i2c/lsi,api2c.yam=
l
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-axxia.txt b/Docu=
mentation/devicetree/bindings/i2c/i2c-axxia.txt
> > deleted file mode 100644
> > index 7d53a2b79553..000000000000
> > --- a/Documentation/devicetree/bindings/i2c/i2c-axxia.txt
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -LSI Axxia I2C
> > -
> > -Required properties :
> > -- compatible : Must be "lsi,api2c"
> > -- reg : Offset and length of the register set for the device
> > -- interrupts : the interrupt specifier
> > -- #address-cells : Must be <1>;
> > -- #size-cells : Must be <0>;
> > -- clock-names : Must contain "i2c".
> > -- clocks: Must contain an entry for each name in clock-names. See the =
common
> > -  clock bindings.
> > -
> > -Optional properties :
> > -- clock-frequency : Desired I2C bus clock frequency in Hz. If not spec=
ified,
> > -  the default 100 kHz frequency will be used. As only Normal and Fast =
modes
> > -  are supported, possible values are 100000 and 400000.
> > -
> > -Example :
> > -
> > -i2c@2010084000 {
> > -     compatible =3D "lsi,api2c";
> > -     device_type =3D "i2c";
> > -     #address-cells =3D <1>;
> > -     #size-cells =3D <0>;
> > -     reg =3D <0x20 0x10084000 0x00 0x1000>;
> > -     interrupts =3D <0 19 4>;
> > -     clocks =3D <&clk_per>;
> > -     clock-names =3D "i2c";
> > -     clock-frequency =3D <400000>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/i2c/lsi,api2c.yaml b/Doc=
umentation/devicetree/bindings/i2c/lsi,api2c.yaml
> > new file mode 100644
> > index 000000000000..2d1c3069c3a3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/lsi,api2c.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/lsi,api2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LSI Axxia I2C Controller
> > +
> > +maintainers:
> > +  - Anders Berg <anders.berg@lsi.com>
>
> I don't think lsi.com is valid any more. We'll see if it bounces.
> Otherwise,
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
