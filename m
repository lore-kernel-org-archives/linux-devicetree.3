Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D224C35F609
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315058; cv=pass; b=NEWqrnF92Yx+XkClVz1CNPiW/PJywylexxsY2NLDf95XC/1ygxsTxZ2zkANcdpbFDrflTnYdqJw+sbiTu6u519t4z9kavsnGONSw9qZaQeL1CxeHAAoWLTXoiEUFfBcW22C5DKYNpgFvv1abTQG1eHLLpljtAEu9ZVNtKjKEGdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315058; c=relaxed/simple;
	bh=TgqMFATpHhW+nEiJqSEEUReQS498sWbvY8+dfg1d0lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmpjOs05m383eTUvpAHdm0X9pIFuJxt0A6qgc5/Ynv0Mf+HVH2ND2/N31mhXdIGsKhme00M+hgpOlTmgOXqlQql93GOMCzKLSR8cCmhHQxX0zp71bj4plQrTE1Zr4WPXJxxWQeMCFvO9spPHjsbHhMHWHkljl0qjplwth8N7UcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vvgZn9Gt; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vvgZn9Gt"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a67221fe8so21788091fa.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774315055; cv=none;
        d=google.com; s=arc-20240605;
        b=BNk6mbwE4d0M19Up+95mFnjvDofgjEGC5BBxOHKpSY2E5dnMLZMijwIU6xhXS67N7l
         m1HeG+h5hkNeFyPaASHJkCoL8/MrymyVDVyIDXcwYFSVemO+qLwhZyypPXaa655j4waI
         0DQpvr7Iz33fs1IgQdwxxhUZ5nMHvs1C+k5W7xOMZ/avCRn3PomJFm0X10wQAn9b2PU1
         s1fQy8+RxVq3EC9gySGhKaFtAI3J1xjeSFhXvg53/1pFs2N27C1PVPpN/s1o+O07xDyU
         2D6yaMZYdQLc64S8yNxyBd/03R80c0eanGanHBaMMR2OAgYTmTejO+uk0nG3m1yaOvfi
         UgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqS1obwMLm1mQjysDeySwbfzBM57UQ5jcj3yckCXI/0=;
        fh=PRZOMzYzQMLGVhuSZDZD66w4xx5moSd4k4ib7POqn9g=;
        b=CfM/+j34iQwUTQBmognXbMqR4QFr3DPuihO3cwYWk2sighZEB1T5RsW0bSXgLu/kLs
         DwSg1TSdtZhAaAZM7F4I0O7EjeY+DMWka7n6vGS3hXNh/+qT1eiQhnYRM5Ie2WYDLOpK
         oeAoc+zg4hAGMnbTTLFfi3YM3V3h9cvuunjCeSjPae+EzMrkchRLhjwBXrzA49kWjtNB
         qU6v2b3/uoEtHEz+XmUWlJcFz4vOTqkzJFS7dvn3FzEjhZaZfUyrdww/CKuMnXon8/y/
         dAr5RuL+VMjadNxXEnYHBrUd3m30vbGTL1FFsSqB41/VqRYDES4teTdQhwlF36bK5f96
         FS4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774315055; x=1774919855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqS1obwMLm1mQjysDeySwbfzBM57UQ5jcj3yckCXI/0=;
        b=vvgZn9Gt0bNMu6GOdlDS9AOVNUllGJtTVkw0sXEMaONMD+IejYnJuYCB3uQDmX4sls
         otMcxQZd8w7QR8dSbEmONY5m1plWutWA4f9jON804oyK08LJt7i61Nv2hesFbP0rpYqT
         STToKFphq1AN/euxb34koCN1lUkwLfwgs2GT0PlZTWT4DvSahDTQ6Ww1F017jZ/wVLIY
         gZZrqhL9eCqmkJscd9nhuMzH3xuVAaKGa2bJ3uaIaDtlrEzGMEImmwg6K+gay7RCnoBo
         5dRHL5qcAd5ONvXdIZWKVfSejPCZPOJlhmnI86r9XOT3e1SGQT+dve4e6LbT6DBwFlef
         doxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774315055; x=1774919855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqS1obwMLm1mQjysDeySwbfzBM57UQ5jcj3yckCXI/0=;
        b=K0q5LqziTxmaSKpxBAHBQ1U3COoCcJ5LK7eJ9zBo0pOSHbY9pbyyv01Wp0Pzs1g7x8
         qYfBRx35TUMYWuIp4ZvUzMdgyn/PXR+ryuzmmWlIj2+DLcVNIybjTKjyFyhkyLgsY6Iy
         GFnBToSPBavyLmTWjOXBLby/xfRGb7ritylXINllFBVGRhiW/cSZFOmc5QsF5A9uD7pp
         i2u0+D8RV4VLFIp22/vgPbGKg5fm8E29EkYQB0PXNbj8jO/MTc332A1CVrTgkx73ypK2
         DAIDJzKyNwOyfGdDAd3Yq1dRNr9AkFTUSwBcCp02KBRhBd8Zrt5xnwBEc1iIoMBU2VGL
         Wjlg==
X-Forwarded-Encrypted: i=1; AJvYcCXpiAphg/3HGX0LDXxImQE15PcwsP7ebPoal0GNdojwWPj8jhgDcOmrLGFLS0+4L6XZVEc7ZZcpujD9@vger.kernel.org
X-Gm-Message-State: AOJu0YwhXRv1+p4xs63nTCL75a45IVxiVuJ0pYNMj02mh8yY7kZADp6V
	ruogOEuB2uEEfL1pu4N5PONLsH1QvcNDSe4DBA6SN8xK6DoPJgMLkKqHWSHCHg2wGwLr86S3hYo
	yzKUstGfj6tW/eF5n5+AuxL32fruoj+PVKL2/K10RSg==
X-Gm-Gg: ATEYQzyaRVVkhpCKdnJXWaepAaV3o900GOAHs2A6jFnu24jemEUKciFkbgQ+3Kz1SIL
	9FekfDf0JIdoe4De5YEbtDPSTVGAEUfzvw3mHKSSXGL+R4/LOrYBXVWJj4g2E4jhc/EoWzyz04Z
	5brOwK/tF00/QOG4ArsOFWvJ8pobMxzd/U1Sr+8R/+jIUdMjQPz6QCBDSRlD/MZtF791/BmdmGs
	8BQTLk4w1b21nPlFNR7Q4jQ4rUKUhQY3aMl5LNUkWF/WW15jKYVgpZP9ovozWh4aqqnCnal2wMt
	tYcSd24MklGvuf4Lz+S4fs6CaCj9qU8S0z3aXnQ3mkL+gUbsNo4Dsr4Prn5/mJrFszY=
X-Received: by 2002:a2e:9850:0:b0:383:20cd:52fe with SMTP id
 38308e7fff4ca-38bf9703849mr32962451fa.17.1774315054476; Mon, 23 Mar 2026
 18:17:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
 <20260217081203.1792025-3-sbogdanov@baylibre.com> <326f3dad-b2d4-44fb-a4b1-d09fb0dc5024@roeck-us.net>
In-Reply-To: <326f3dad-b2d4-44fb-a4b1-d09fb0dc5024@roeck-us.net>
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
Date: Tue, 24 Mar 2026 03:17:23 +0200
X-Gm-Features: AaiRm50e7_vyqNaw6KGozZtyUIdxEAYNqIIQFD0h6In8lfXt_wnxCUYyWj3o8V4
Message-ID: <CAJ83Ew5RN2LPXzezqGEgneajS6RWDK-cGNej_DM8ukYc7fz1WA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
To: Guenter Roeck <linux@roeck-us.net>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 7:31=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Tue, Feb 17, 2026 at 10:12:02AM +0200, Stoyan Bogdanov wrote:
> > Add device compatible support for TPS1689
> >
>
> The title and description of this patch are really misleading
> since they don't mention that support is added to ti,tps25990.yaml.
>

I will add in next revision

> Also, the "title" field in the .yaml file still refers to "Texas
> Instruments TPS25990 Stackable eFuse" which isn't really accurate
> anymore.

I thought it should stay as is since driver is still tps25590, but yes
it make sens
to be changed. I believe this should be acceptable

title: Texas Instruments Stackable eFuses



> Guenter
>
> > Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml          | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.=
yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> > index f4115870e450..973ee00c2c49 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> > @@ -16,7 +16,9 @@ description:
> >
> >  properties:
> >    compatible:
> > -    const: ti,tps25990
> > +    enum:
> > +      - ti,tps1689
> > +      - ti,tps25990
> >
> >    reg:
> >      maxItems: 1
