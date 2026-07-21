Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A3C39C00E
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643831; cv=none; b=K/HTz8sSWr2/hkU8t0LAe5RgqrN0YTV1z0wX6zJRFpYD3iBC/D0WgMb1kLqCJiAsNSokxr3Lg+EBpHv6n3//8dZklyM39VFHJtlOXJz8nFd8aR10X5JbaRfXzJMyVY/mJuzRGfaEA+0u2aAkr6lrnhYG6CvoCHj9oyvoiuqa4W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643831; c=relaxed/simple;
	bh=YbE3FIEf16hP8H+mbp4mAxHDf1jtRYXry1/q9zHuyWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEXr4P1KoEK/7QpTMgziBUC2gbTN7JMFtmbbFY9zoZisI8cKwhbLQFkTeGqtixjwTdhiYlTAL8DN40ne4GIxIHKEkhiIWgCZ5EjQylx3j/cdtk7zdWp6+Aa+2e4myRIyihrTc3gt3ZFsRrDSIjHOjpL9oUrSMOy4ILl/KgS6Ti0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5SmH4BX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5SmH4BX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365931F00A3E
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784643829;
	bh=W872MX1aaB+YZmKQrLunW/vuC3RmxtdDHd9xnW6ge+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M5SmH4BXlce5RIkeR7JLaR+DYcExoVzvJZxY15mNd/86gVy+IIZEAbVLqrabl/fae
	 dRHYHv0Rzwi/98UDdgLJ4BuqS1gyLzWIzptNDaFWK+Lqr4tQOvzEORiwGWoq9w42ON
	 aLwhIFaccqMXjGqR+CeG2FDMEYGEJnC7OUawXHKrMFVq10lNdvdJB29+clOYAM/eWG
	 HRxRXKMzncodK3Y/9VB2d14OTWMgXo5Noi6XuOoAa9VT77n5QlUeLZTQuwymB2aIwH
	 sGfx9HEIW5GZ81KEJESowJn5MqU21Cc8ceB7Wq+0oZnNNhMx7cNaW7QJXIXuDNN12u
	 XFcTxv8DBL0fQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c16794450aeso821152766b.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:23:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpERaArzH3/JGrCvy+dwr/SK+j2MkWQARUjwazNe+QVgdPbM5WeRSksbacZrWLhXlvzYIJp7uKLTZ52@vger.kernel.org
X-Gm-Message-State: AOJu0YwIeAKK5eoSkdqZCT85DDhy5iGS6wAi21cG9V5Hfm2nK4eAfcPH
	UYowxgGtq7Wy+PGFYyGwejIPm1wdS6Ix8MuQ6IXURTu++qp7rucUfzz8fSq140b8ibAiNSFXlFn
	XVVTOj1QOSY8J/c0WfEfABB5+KCNkqw==
X-Received: by 2002:a17:907:741:b0:c12:1dd4:13ea with SMTP id
 a640c23a62f3a-c16b4765b7amr761810866b.30.1784643827828; Tue, 21 Jul 2026
 07:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701175330.1645927-1-ninadnaik07@gmail.com>
 <20260701180553.473121F000E9@smtp.kernel.org> <20260716173939.GB534222-robh@kernel.org>
 <2f1795b5-cab3-4241-b3f8-532a7fc4df9b@gmail.com>
In-Reply-To: <2f1795b5-cab3-4241-b3f8-532a7fc4df9b@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Jul 2026 09:23:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJEbkPU2oYB2p0vBsq=XdzkXurdDUzZdJDOM=MpENLbYQ@mail.gmail.com>
X-Gm-Features: AUfX_mxEjh-9RPB6Ab6fyhpFd_zD5BN0wQFo33UhJrt5AZbs4HA5Micyu-a_32A
Message-ID: <CAL_JsqJEbkPU2oYB2p0vBsq=XdzkXurdDUzZdJDOM=MpENLbYQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 3:15=E2=80=AFAM Ninad Naik <ninadnaik07@gmail.com> =
wrote:
>
>
> On 16/07/26 11:09 pm, Rob Herring wrote:
> > On Wed, Jul 01, 2026 at 06:05:52PM +0000,sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
> >> - [Low] The schema conversion incorrectly restricts LED child node nam=
es to `^led(-[0-9a-z]+)?$`, which breaks `dtbs_check` validation for all ex=
isting upstream device trees using this binding.
> >> --
> >>
> >> commit 6c59295f22b17d02a2b26847db54458f820fa4f3
> >> Author: Ninad Naik<ninadnaik07@gmail.com>
> >>
> >> dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
> >>
> >> Convert lacie,ns2-leds to DT schema.
> >>
> >>> diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.ya=
ml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> >>> new file mode 100644
> >>> index 0000000000000..679a618906d80
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> >>> @@ -0,0 +1,87 @@
> >> [ ... ]
> >>> +properties:
> >>> +  compatible:
> >>> +    const: lacie,ns2-leds
> >>> +
> >>> +patternProperties:
> >>> +  "^led(-[0-9a-z]+)?$":
> >> [Severity: Low]
> >> Will this restrictive regex cause existing device trees to fail dtbs_c=
heck?
> >>
> >> The old text binding example used a child node named blue-sata, which =
does
> >> not match this pattern. Since additionalProperties is set to false bel=
ow,
> >> nodes in existing device trees that don't start with led will be rejec=
ted
> >> during validation.
> >>
> >> Should this regex be relaxed to allow existing node names, or should t=
hose
> >> device tree files be updated alongside this conversion?
> > While yes we prefer what you did, it's perhaps not worth changing these
> > old .dts files to match the preference.
> >
> > Rob
>
> I understand this. Should I relax the regex to allow any pattern so that
> the existing as well
>
> as new DTS files could be properly validated?

I doubt there will be new DTS files here, so you could just list the
node names in use. Or to just allow anything, you can do:

additionalProperties:
  type: object
  ...
