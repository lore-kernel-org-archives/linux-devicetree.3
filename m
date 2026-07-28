Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B8339A06D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785258182; cv=pass; b=lXqpGvjc2iXxI3IkPZgczPwBqBSNuJQKLgH2DlHkHHoqVepHNzaiJX+JGdX78m807Oh7uBXsXTIBbocN3KD8gQlBkR9BSi8KbY9xNuWPK/DZjwhQ9ljup6DBaNxVzOMEb7qp42KdvqgeaNmjtnrQjyeUZPqDh6Z/bG2r1OM+aHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785258182; c=relaxed/simple;
	bh=groxGWngifTVT5bewG236tGfo/7tcFA7IZ4+tPcJwJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/CtRskV4+hDgIpVOcRepvHma0An09WcwEOwp5QaJGNqCWJfD9SH18UciqmNk1hR6ZGXTPvICR+910pNoDETfnf0NzQRaV1wm03NjYnqCI9xZPfwV3Dh15Vs2Fc8VrLJFKXxOipYG7myI4soIritZF3ZxHIl4ShrpUgSrxJcS2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MFTqj+DX; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MFTqj+DX"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6aae73c40c6so38436eaf.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785258179; cv=none;
        d=google.com; s=arc-20260327;
        b=VJgDaOe0Vef+VrujGNBVNULkHBGoq1RVjNGCykMTHTKmPT458orv2EhPRsn22swAuT
         8mQvEI2ID4zA/NEcLJMiJn1BVI3TmnyZo8Fs0wake8tGb9lcJ65dVv3mCYfb5iauhL8d
         bUvXhvhzDeOfGXBl55L/sXul06vqHwBUncOpLnjiAnG/l6tRe2uyaCWnghmF9x2R0W+8
         B5T6PLvU26IOMzw0pv5/TuHzJBY05LV4HfRaFAfqNe5U8DhabXPwKv9WeI89Ru9T7WN2
         R3QxyGJejK7Vo31YjiVYjWrIYgsF6SdzXgeLls+eL21WtAVthTGYJAlD0HMdhjoAEqiW
         rEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V8GPJp6TxM1kZFOBQxF7EjKvtzF1SyeUI22862FQRDc=;
        fh=g5pS1K+cwPQsmKcf8b7QOmaMzA2GrFgDy8JdoJsXryE=;
        b=o8RXVvDOnYa1Np6ZArr70BZhzypH2N5A1nA1jt2hkTcOqrs1jyHmtk/25+iZ9UF/9F
         9jr7OhMs70JwY2a0wb4ENenm8YyAQaIyIb1HbQRATFlUUhCrA9aD/ByrSBmrNnlJBNbn
         VZgSJZwGKt9sOgPdfwx28w6jMKn6CQZgEJmCEmoU1p5k7zdzNUfwe3LWksBwZ54J08Ba
         lF7DXfbJp2STlTkqaclSRRr8DcghxiU2hzZsyGI5ozQVbWSiREhzXJFyf0fJfzWi71fL
         KOZRtbfHUDhXn7UEMZ3C0Laelq2Mefjl4fHvu/XOVTeGHGnhJw5lFH4iRfo+q2Dk79fb
         rlAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785258179; x=1785862979; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8GPJp6TxM1kZFOBQxF7EjKvtzF1SyeUI22862FQRDc=;
        b=MFTqj+DXdMFvdEqxVMRwmtKE9eHxYede7DnE/4YUHRTRz+apb1/BptmGsHiqjbOKjw
         2J7jDncaIkli/DTTTHeLkhyV8h9MPWXCHGm0mR4MtK04uKdKD3pg0SKBZoj/tj4Bz1qk
         IyDV4BhnsaItjeQILFWRSP1k3TP2YXTRcexj76zshx933+HwoQ17Bp6gkKn/ezputZ6n
         gpor2X73lga83XSpg5defbUf7G+vpwSYafs1ggmuz5pf6lOiuy09LQT5Fvp2+sj1SaQb
         gKTAR+BpTuySRJuhvTiiwfHQtr1FOJxVCbEtVP8jbJCQZBjlt0lZGn3uDsONW/air+A2
         JPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785258179; x=1785862979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V8GPJp6TxM1kZFOBQxF7EjKvtzF1SyeUI22862FQRDc=;
        b=aCTY5xGIYWWrC2oW+entpN1rdyuF6YjJawUBmDJCoA9qHein8+gcnk6h5cev114cTB
         9DuGE3MerBkDM0iHOXqsB66zT34WCVgbhtdxtB1jHJXRcLFN54LbXT3evvhRLV65unT4
         +H53qmZaOVSzv7nowuJWk2MThXzinQ//A4+nRhRDtB9AF0V/EHU2aLh/ppM0nkx5ec6+
         vOsfZ4SpCbmEsmkqg9aF9ycAnlaepD03piHMbixZvKENP9LfqSgAeA9XPloUd/WOB0Bj
         DR30dU2MasV/swxTBcaFNZXbbNLceciiAaH3TadyuQqNWwI5SUwchsl4Ak+7zMUalNck
         HcFg==
X-Forwarded-Encrypted: i=1; AHgh+Rq82jakeuWd0W6b0EfEacXwpzOumuE3VZJf3SOQGDO0QixX9v2fsVPrKi7vNn+phTFvfnYWsh52d8gu@vger.kernel.org
X-Gm-Message-State: AOJu0YwwS3lu1gRTp9PnQn5kXrGw1R2LcH6K3i2bj4gimzPGvvLHVjAL
	eFJ7pIUEVzIZKKmp85CUX6w4wQPhf9+SwjJsTbG8rqquZiOVK/XVx9xWQ43v/tkcgVzYJY0CQL2
	nM3cgTLxPOJBWBKiDgA0Ljx1aDhhVU7vpJl5C1SBg2A==
X-Gm-Gg: AR+sD10LivpXoZpi3gRZDN0tXisuy2FZKZTbbpAd/c5T5fXJmiG6U927YUWHVJ9YNo1
	ESDWbuJEbrZzmDxzJed4VgOVvtXCU0HHYT1aOFR43He/U0rJRfVQzyzlvRQVwvmSPaqTieOS2gn
	fhIrin5IYdhPGjxz5qqng8H7GSUSSxoS3Vl6/Z4QMvglE4DiV0OebdAu1uaxlPhmV2LdSOYD4c2
	ZY2+x9cmJRumbN8Zv5LG0qg31oWSLfhdLGLgdtYss6177IR41t3mCvWgB1NoYqFPeR++RxiMG/H
	3ycR1cKqarAn80uZQ9+OapR1U/8LBxIdZ6w/+92LVVqTUWAF4YC+rFRQTgpPJBMHwtaBqm5Cq5o
	BFw==
X-Received: by 2002:a05:6820:1611:b0:6aa:da90:8bd1 with SMTP id
 006d021491bc7-6ac96a2be31mr1559545eaf.11.1785258179388; Tue, 28 Jul 2026
 10:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
 <20260715-imx708-v1-1-1f36f54e14d4@ideasonboard.com> <178413842630.1426769.14095686086162764899@freya>
In-Reply-To: <178413842630.1426769.14095686086162764899@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2026 18:02:43 +0100
X-Gm-Features: AUfX_mwSdrWqYhPenfvLyVGSkh4QDNAyWTECB24t2RneV51JiZrWgV36_HGpj3U
Message-ID: <CAPY8ntBnnFTjKiKL9AooYun7fX8DEdocs3sY_PoAXgT90nGYTA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add imx708 image sensor
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

Sorry for the delay in replying.

On Wed, 15 Jul 2026 at 19:00, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Quoting Jai Luthra (2026-07-15 23:01:28)
> > Sony IMX708 is an 11.9 Megapixel CMOS sensor, that can output pixels
> > over MIPI CSI-2 bus. Add bindings for it.
> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/media/i2c/sony,imx708.yaml | 120 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 ++
> >  2 files changed, 127 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> > new file mode 100644
> > index 000000000000..bc346730e1f3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> > @@ -0,0 +1,120 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx708.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony IMX708 Sensor
> > +
> > +maintainers:
> > +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > +  - Jai Luthra <jai.luthra@ideasonboard.com>
> > +
>
> [...]
>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index febe918d6316..b0e3abfd88a9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25269,6 +25269,13 @@ S:     Maintained
> >  F:     Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> >  F:     drivers/media/i2c/imx678.c
> >
> > +SONY IMX708 SENSOR DRIVER
> > +M:     Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>
> I've kept "kernel-list@raspberry.com" here from the downstream tree.
>
> Given you maintain other sensors used by Raspberry Pi modules, let me know
> in case you prefer I drop this or replace it with your email in v2.

Including our internal list means it gets the attention of all those
involved here. Whether that is L:, M:, or R: seems to be open to
debate.

If you need an individual name then I guess it may as well be me.

  Dave

> Thanks,
>     Jai
>
> > +M:     Jai Luthra <jai.luthra@ideasonboard.com>
> > +L:     linux-media@vger.kernel.org
> > +S:     Maintained
> > +F:     Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> > +
> >  SONY MEMORYSTICK SUBSYSTEM
> >  M:     Maxim Levitsky <maximlevitsky@gmail.com>
> >  M:     Alex Dubov <oakad@yahoo.com>
> >
> > --
> > 2.54.0
> >
