Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B753DC4D0
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777047101; cv=pass; b=tpE0rRFw5JWI4YtZgwiPrJ/idKAmTgUf/2Id3mmuWPvDxmhmegr1X2q2PXEaLI4UsH5YiV2pj9Fm0tNIjYo2pPKRLLH0UzwsJitjmOPPOAJfzJlGzHcsn3UWxoTC/HQlkRHNWaKosALbMGxtzMqEHjx5BkNwSLq8itlz3KyRTtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777047101; c=relaxed/simple;
	bh=XT58P0GNuT/agefMa/eIUPVlfhr8TDxtzlVjKt4js8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvY9ox56YJtZd6mbO9WnL53Py/ICxw3RUFGFbmPj9tm+b0QQ7ATjin/2+0hnWsgcQTnBE57j5nyssUOOeLqF09XhkKRIQrcF8+O51+rBUqMYa+FY9g2WYoU6JHtW85+RyhlPeKV7zysLU7DFBq4a4hyGyBChdYRMwmWDmPWoL9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY6Nr3ej; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY6Nr3ej"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d77f6092eso5578567f8f.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777047097; cv=none;
        d=google.com; s=arc-20240605;
        b=DjHJdSfIC81LJG8aB/5c5557fMs7vUPjoaEXWxQRyi/IwvRHxcOsGc97F1XA+nTOZy
         yjbtN0/uF/LY4hJPx42tCxUDi4HIpYwNPW8LwaaVTjQwlXoz25A5zufsfYKI7zdWwxLI
         U4GlvsbZbU1d1yM0n+gQZpTwW5XFDpMlqVaM+vJxxKYZwplgT+agpfKmplh5imOlV8Gj
         up0qDuRkvgL5dbsr6Dqw1dtwwwSkG7Foo4quiHF+Kc+Un6F9AG+74vqPykdX8H0sk47Y
         +BoPoFjEe7xTL5jivKYtcwkOPw4qwIVdZI9bFD6E+uhbk15nYQhbma8EXdA65PPkkNL7
         Uhzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rHYuykEff/wrBFy5/qVUAiD99gisngBNcaqJxtGizX4=;
        fh=gzJjh4/jLUMX99dxiaCrS+L01gNc4b9ESYloJLyNoV8=;
        b=kzmSHWT3nwK5nlkiTaAs3ChyRiXmbjlvmpEYeFfSi2OwcZFGvuhLsXj4xqPjKaJX7/
         ROEzKyjgnKRacvcj/imj7iV7lpM5G09A9EVgRSB1x4YSz9ccRZA9fOGrSZ14pPH/aViR
         uahHf8ZNgh+Vwi/yTOKZwK3/R4I7jK/jpoyXLiwol2znFRcNT0ZpScXGxin30FjXP6IN
         0s4im1hcI7yQ/WG0Kw2gHeBqDK1QGoFm5yCJ9DRA5eiCG4XMnM7HOK0i9m4y20wZJhR3
         tMZHKyJCyKfEvcjEFtPTmCinDBZbQVJQnXqT7C4hcN98YGYzDUqjgOU6SoP/48UjEMCz
         qg2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777047097; x=1777651897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHYuykEff/wrBFy5/qVUAiD99gisngBNcaqJxtGizX4=;
        b=aY6Nr3ejFiSBvMFzL+UAqjHEXqxG3OFxHiIjVY9VlmJglU7TNJ6wmces2zXVcEFJgW
         C5z06bvoRBYeAkfVYEuIaz4lQ65No1O4vhoDudlRkBQbWhOQ9JM6ZSZrUT1MxHZV3+SC
         HVia/uSUe0zOTQV+rzOuXe+QrVNlDCf7blRc4BZ1XOVL0dB/Co0BINo7s/6XgdgmWE0V
         UaaQmH1IEZSrfLbjIfxmHzjbRNdIEqimPmpO9NXGMkSSmUfKdLicN1x6tKS2xJ51RwGs
         qZtXrlDrNehs4cea8CXmTSX2Zjo38iLBvL1sHZrRiWph686QZdv1emD4juDl+2s4Gyh4
         OpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777047097; x=1777651897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rHYuykEff/wrBFy5/qVUAiD99gisngBNcaqJxtGizX4=;
        b=G/gSMdfsP4LgmQRpRWa0A7X/XIZJOGtHa7fRa1BpkVJqFWU4g6ew6xgYt6o/foYI58
         CqbMKah1MR2VUkNi9YgbS34uOJemmlWur+4/NUKJsr6rWEz8y1+dmcY33tqTOxHkLz44
         xU9tTw74vPICrL2zurkGKqckjNu6+CkoOoGDBIkcLieAoeBq/9WqL/gGXRLk7wiUu22v
         qh/DBF6fdH9pWsoH8qiBXAkR2k7IExxr7Q1PDbQmjvXGBYPjyCYZWJcsv0D93Reh9wdL
         NeFiBRFrvZaoWX1nnv6LWN7F83qMiGqqZzTzlMZwmHR1YHC9JGLql5TzodHStJJ9QWLu
         PQtw==
X-Forwarded-Encrypted: i=1; AFNElJ+f4qDvJxjfcuc1ccBXgvcly8fN0Mr2gGhDrJWAEyy3xlvigMXnimQ3nJsbu96h0hxGBfhTaC4FOZKB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxozh4Qblcl3wh57/lFNz91INeMpexvXZ4VAATusksF+/nCUfL4
	FNshzgdX7/xTFeDHgWwrEZO3QEMT7dp/oqUSuOKw6n7gMDSFwr1C2Mw9oFWBaCT84/H7l6sEh2I
	G92KSIeNr0FO3caajGLtU2YrKKniG+qg=
X-Gm-Gg: AeBDievn/8+3upfoOsmXLW50eNNfEZxMGQNLcmjyrZZzn0SXLr/UErjln0VaAVca6de
	qkmldYzy3IkTFuxrpvVyWJMrXbbffP3HYfL/eR1oxFkJDVRU1FQbSW8EsxukqNSk/MBlKtpu6le
	u0U8olgaBYec5YaBy2kP8kUmN4954dBjTvn67kiZgIh6fUQiY5OXBmCHJAQkyxkM+u0OI1QuM/+
	AH7cXtR2w6UfOKa2jphBZD203DWQ+2C24R39dxax2RQ9210Xo1lrT64rhYT1bWtK4JM1QWb3GLr
	fdDMgQPeeNLtVSUSBCc=
X-Received: by 2002:a05:6000:258a:b0:441:2381:b630 with SMTP id
 ffacd0b85a97d-4412381b6dfmr22787166f8f.24.1777047097235; Fri, 24 Apr 2026
 09:11:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424071305.89503-1-clamor95@gmail.com> <20260424071305.89503-2-clamor95@gmail.com>
 <177701943440.2848156.923810545023102522.robh@kernel.org> <CAPVz0n3Wxk=9YpmU0nXsOQdtxBhoTBv8283+OHhUr-TKxkAb5A@mail.gmail.com>
 <CAL_Jsq+dekx_vVFXxLb3oFQ7MM6xkPSSB7vyTV0YWh9BPLhEDw@mail.gmail.com>
 <CAPVz0n1Pmq+fKFw5sPG7Gxjxs59jsA2s64ChnWt2SqkjGon2Aw@mail.gmail.com> <CAL_JsqKxCdeXDEMirnsBPUnV=3KPFaEeK=PJ+T1_izw5+YsfUQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKxCdeXDEMirnsBPUnV=3KPFaEeK=PJ+T1_izw5+YsfUQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 24 Apr 2026 19:11:25 +0300
X-Gm-Features: AQROBzB8M5T82W_SzNVUW1u76oB-t0u0G0IStj3xeIZcNs1Rh5H_C49Sb_96yQw
Message-ID: <CAPVz0n0jFyEwJe_VLY2b3_x1pzx2OzLL7C6PuBzDn8jvD+_pTw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: input: Document Imagis ISA1200 haptic
 motor driver
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 24 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:5=
8 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Apr 24, 2026 at 7:58=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
> >
> > =D0=BF=D1=82, 24 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
14:55 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Fri, Apr 24, 2026 at 3:57=E2=80=AFAM Svyatoslav Ryhel <clamor95@gm=
ail.com> wrote:
> > > >
> > > > =D0=BF=D1=82, 24 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 11:30 Rob Herring (Arm) <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > >
> > > > > On Fri, 24 Apr 2026 10:13:04 +0300, Svyatoslav Ryhel wrote:
> > > > > > Document the Imagis ISA1200 haptic motor driver, used primarily=
 in mobile
> > > > > > handheld devices and capable of supporting up to two motors.
> > > > > >
> > > > > > The exact datasheet for the ISA1200 is not available; all data =
was modeled
> > > > > > based on available downstream kernel sources for various device=
s and
> > > > > > fragments of information scattered across the internet.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  .../bindings/input/imagis,isa1200.yaml        | 145 ++++++++++=
++++++++
> > > > > >  include/dt-bindings/input/isa1200.h           |  16 ++
> > > > > >  2 files changed, 161 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/input/ima=
gis,isa1200.yaml
> > > > > >  create mode 100644 include/dt-bindings/input/isa1200.h
> > > > > >
> > > > >
> > > > > My bot found errors running 'make dt_binding_check' on your patch=
:
> > > > >
> > > > > yamllint warnings/errors:
> > > > >
> > > > > dtschema/dtc warnings/errors:
> > > > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bi=
ndings/input/imagis,isa1200.example.dtb: haptic-engine@49 (imagis,isa1200):=
 enable-gpios: [[4294967295, 22, 0], [4294967295, 23, 0]] is too long
> > > > >         from schema $id: http://devicetree.org/schemas/gpio/gpio-=
consumer-common.yaml
> > > > >
> > > > > doc reference errors (make refcheckdocs):
> > > > >
> > > > > See https://patchwork.kernel.org/project/devicetree/patch/2026042=
4071305.89503-2-clamor95@gmail.com
> > > > >
> > > > > The base for the series is generally the latest rc1. A different =
dependency
> > > > > should be noted in *this* patch.
> > > > >
> > > > > If you already ran 'make dt_binding_check' and didn't see the abo=
ve
> > > > > error(s), then make sure 'yamllint' is installed and dt-schema is=
 up to
> > > > > date:
> > > > >
> > > > > pip3 install dtschema --upgrade
> > > > >
> > > > > Please check and re-submit after running the above command yourse=
lf. Note
> > > > > that DT_SCHEMA_FILES can be set to your schema file to speed up c=
hecking
> > > > > your schema. However, it must be unset to test all examples with =
your schema.
> > > > >
> > > >
> > > > I am not sure what is going on here. I have installed dtschema-2026=
.4
> > > > which seems to be the latest. Running the check with this schema gi=
ves
> > > > a clean result, no errors produced.
> > > >
> > > >   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> > > >   CHKDT   ./Documentation/devicetree/bindings
> > > >   LINT    ./Documentation/devicetree/bindings
> > > >   DTEX    Documentation/devicetree/bindings/input/imagis,isa1200.ex=
ample.dts
> > > >   DTC [C] Documentation/devicetree/bindings/input/imagis,isa1200.ex=
ample.dtb
> > >
> > > Let me guess, you have DT_SCHEMA_FILES set? Then you are only
> > > validating against the schemas that match and not all of them. There'=
s
> > > a single binding target now. See commit 400fbf4b5870 ("dt-bindings:
> > > kbuild: Support single binding targets"). Of course, changes in this
> > > schema could affect any other example, so you ultimately have to chec=
k
> > > everything with just 'make dt_binding_check'.
> > >
> >
> > Thank you for explanation. That is unfortunate.
> >
> > > The issue here is enable-gpios is defined as a standard property name
> > > with 1 GPIO. I don't think we want to extend that because with more
> > > than 1 you have to know what each signal is and the relationship
> > > between them which will vary.
> > >
> >
> > Is it still possible to use enable-gpios for 2 gpios in local cases
> > (like this one) or I have to use some non-standard naming like
> > en-gpios or control-gpios etc.? This device has 2 pins called hen and
> > len, usually they are hooked to a single gpio, but that is not
> > universally true.
>
> Just do hen-gpios and len-gpios.
>

That would require reworking all gpio handling. Would you mind if I
use control-gpios? It is not standard and does not cause that
complain.

Additionally, is it acceptable to use header defines in imagis,clk-div
or should it use direct values instead. Thank you.

> Rob
