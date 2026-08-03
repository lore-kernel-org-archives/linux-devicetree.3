Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13DA41B36E
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 17:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777442; cv=pass; b=WBqDfSlkpXMYjYl/B3tfQ7vsb3GSom+xH3RDGL1zVzOJVdOwlTUKRzuQQDbjx7PAj2yNbdupPBSp0zXcEHVZoMiT1vPpN9TyzbRhKOWvMUkCN7q5or5bCfw8v3bFimbPmVE9zazf1+eyUrpMsXl+MEH89lnJX61QZdxN9J4tHvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777442; c=relaxed/simple;
	bh=/aIP5kdHRv420QYAn8jtf5FUqXXy259JWuHla5LMYPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8ekCF749lcjDLTV8D2pDjWXkkOzftSXQQ7eJDeS/W0y30XSNgPFWjcGTcQR8FqTWwy33qMurh21gphn8lRQXdikeyXhXYlTaejRCWu0JRjYSBpWrl04cd7YvIOKlIbab0eTfM9LbX2bkJt5/yVtyZm6ezERKKYWMmi6qr+SZ4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgkYLlUx; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgkYLlUx"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so5088518a12.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785777439; cv=none;
        d=google.com; s=arc-20260327;
        b=dSNQENUfZfudOlWqI8St5jE7upCcxiGuPHFRpyoSJctnQvOogc/6LBSY/cUJi7FtwS
         d8U8APwz7gzWmHoYzNbXT68umH7ELH+gp/kbekSDURKyK0/nWEU5tzlLYGj9DCTukvAs
         PfH5AnyQ8hPiJKQRHDky1SXkwdYteUqfaBBYhn3bcblAxqt/14JAsfObRM55MWP/xFsD
         E+emS0kygCBCpZTfZO8whtELZ4hIuNP3pPML4DB9X2OKGqnBjTB74Fwr/zJHm4JuFyzq
         98WaQAuAgv0aW2JszmnCHQTVJB0Lardm4p9BPxn0UrJY7DdzPLj9a5Lx2ra5PXP8zjWB
         sAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CR0UMYa97mM85aqJSl/JOVNVWw7zagx4FNFrcVMGQkk=;
        fh=VeE/qD2VWowPH9YqlsSrY0bW/TLPcDoAiA92rRAWwBc=;
        b=VCwQ7/qB/eL+Z3Gwtl0NCYHbddFLuP81sXx7i79gPGTa0kf1orPoMOKLCJYG3pz2wn
         uERWjf8K0MNLwtQi/Cfz9/a1wyvRojdeWiYap1YPq44i9j8JSlfuxNyY3A1HjkcUhfIZ
         eukZCXVsyuDPf34fi2+bEwinMfG6Qvbih4pMSY3K9ssb1WexnbFQxHRVdphgr/8IOfhL
         XyrvCetPzDBG3mOYXs9ehnzwOXJ2mo3f/Y3+PdWbIjpC5E2b92d2nGx1ArzmH6JZquq6
         wKXZ/GVToQZeLPcRgzbZEAwHQYk29TES5ykGufKo9IIYxdk6xOjY+T45yDDKYTFYOIwq
         Jf+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785777439; x=1786382239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CR0UMYa97mM85aqJSl/JOVNVWw7zagx4FNFrcVMGQkk=;
        b=PgkYLlUxy5bOl5Hls7AwDLSdVqBqsiw9yBsQiOCQvo6FJWIWcId2wCySN6eWdKwmPb
         wYoRCrktWUUQe4MytcECQ9Nv6MVNksKBQdqSXXBX3pqt30Lc7xQL/xkyG6UdhGOt0pcQ
         4t6g94p1E7c3QDnGgLCMklKI/6Nag++Kft0iZvLtJt3c9a/95j7W1EtI4Z3NA5xHJwp1
         eBY99HIhSNy704lq1wgWibo1Ww+0jHGW+nCrzi2n7XmzETZ58+OFje+//z9KfP6MpN2m
         p+UR79v2kk2cA5K/Ln3Wan9fY/9uegr3TxZA8Eco8RHMUGSbEYl9pfQWyTo3adzEhFY9
         h73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785777439; x=1786382239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CR0UMYa97mM85aqJSl/JOVNVWw7zagx4FNFrcVMGQkk=;
        b=lvaaOULyK3PBh+FWEoPA2UOwj1NX1BD7qdnfzMOfXYdrTjRopO3UEtVNByuh8vSla9
         qlaJ/M38a2thqxXo6uIoLRq4nBoKr1ZlIdF54qMrdN3N/3+iF+8ZVFJVb8jsErEi+S9Z
         1YjlZW82/N00NM71Env5M6f4j45jeTRxfT0N5fLnZL61rB5BnIpRlm6KHhEofqud1obq
         YT731TZn2OjPklxjEmtlvq0Hr3hQdx+CP8rJcsrhrmfHEv4PF7jvgizqtRJPFAekrTg5
         qPgqpUb1etcC+HNREd9E7ClMJVGTopV9TgwQPfyY27tKDxDu6OUvcF7SM2Cy0OCHpUk6
         bDgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsJWHSq9vH0wnB2/woDT3sUe/sgj7rUCN4H+OnOaeSUS3OgpiOGxlHBt9AoFETR8AaZ1N06tgb4u24@vger.kernel.org
X-Gm-Message-State: AOJu0YzF50iANzJyjpHXYiUHIYLFo9Icyw/YvgNlnXaBE6asXH5aWDGq
	brztX50UyIeiQO1pepBMRZxjQ+zYw1kSwDiOtm4CJcLvtTgy/VONuAeP08lrODG5oTLqGi/Vtft
	YWx6a0aRDsI/F8ediTeDnXd0jTPK3Bgk=
X-Gm-Gg: AR+sD13ZyvyPCKnB6Z/+JMneSRok7z4z4vhA9+eCPqliJ1GAIYa0T1+7QoOpDK38Y4l
	9qkp1POMMOFRq6X8+djYPn6cxALvIRdi4c9YvZC5MTi3cTaAgDiXH3IB+JLffApHlW6tFn8fGge
	UP+fY3A/ASQqSfPBuBxy/C8hRZT5H3xo8PdOjOnfJCeRw8J/5KTtsauKbJR3RaRuyn/JtFutyc1
	bV2oWgvhjhmxQF/RrBA2svdBtK5f4sU0IulA25egCxgPo6wc2Ojhx3fphHfHVHjH5LpQ9rRO26m
	P4eJAJ2D4IgH9LQ22XBw2KPjd9GjJfezGaRSNM1k+Ye+RsUcin2+zQ1Q7BcHwvdaI+l32es14SF
	ZetLLGItH9pFAsUM+zJyA9nojxDUemJDExi8zOXnGrK+j
X-Received: by 2002:a05:6402:a51c:10b0:6a0:c9e1:181d with SMTP id
 4fb4d7f45d1cf-6a0c9e12cd2mr4720601a12.14.1785777438858; Mon, 03 Aug 2026
 10:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
 <20260801-hm1092-driver-v6-1-5979f223748a@gmail.com> <20260801130150.5BDB41F00AC4@smtp.kernel.org>
 <20260803143241.GA3364728-robh@kernel.org>
In-Reply-To: <20260803143241.GA3364728-robh@kernel.org>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Mon, 3 Aug 2026 22:47:07 +0530
X-Gm-Features: AUfX_mzBSrMqhs8O1alBT0XAhQBr__EPtIEyVLNZtdnsmHlUUvRwv9-x4Su1tZw
Message-ID: <CAJTcUFQ0iBF=2i3Bqs8PmBRNeqeYjdazNYU4HPzL1eM+UGuhwA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, media-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Aug 2026 at 20:02, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Aug 01, 2026 at 01:01:49PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The schema fails to restrict the `data-lanes` property to a =
single lane, allowing physically invalid device tree configurations to sile=
ntly pass validation.
> > --
> >
> > --- Patch [1]: [PATCH v6 1/2] media: dt-bindings: Add Himax HM1092 NIR =
sensor ---
> > commit ee5879a0923ec6b56edc74d8a66ff697b111ae09
> > Author: Ramshouriesh R <rshouriesh@gmail.com>
> >
> > media: dt-bindings: Add Himax HM1092 NIR sensor
> >
> > This commit adds a device tree binding schema for the Himax HM1092, a 1
> > megapixel monochrome near-infrared CMOS image sensor. The sensor is des=
cribed
> > as outputting 10-bit RAW data over a single MIPI CSI-2 data lane.
> >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092=
.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
> > > new file mode 100644
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
> > [ ... ]
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        required:
> > > +          - link-frequencies
> >
> > [Severity: Medium]
> > The commit message mentions the sensor outputs over a single MIPI CSI-2=
 data
> > lane, but does this schema restrict the data-lanes property to a single=
 lane?
> >
> > Without explicitly defining a data-lanes property constraint (such as
> > maxItems: 1 or items: - const: 1) in this endpoint block, the schema in=
herits
> > the permissive defaults from video-interfaces.yaml. This would allow de=
vice
> > trees specifying physically impossible multi-lane configurations
> > (e.g., data-lanes =3D <1 2>;) to silently pass schema validation.
>
> data-lanes should not be present, but that's probably an issue on a
> number of bindings. There's not a great way to so this other than using
> 'additionalProperties' instead and listing all the properties used from
> video-interfaces.yaml. But then you have to list 'remote-endpoint'
> everywhere which is not great either. I'd rather just allow the property
> even if it doesn't make sense for the h/w.
>
> Rob

Thanks for the clarification. I=E2=80=99ll leave the binding as-is and won=
=E2=80=99t
add the data-lanes constraint suggested by Sashiko.

Regards,
Ramshouriesh
