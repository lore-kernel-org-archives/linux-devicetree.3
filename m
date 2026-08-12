Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB23B3880
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528520; cv=none; b=W65eap+Om7QxpRbDaEEr70mMX2a4ngB3Lpdp/C5BVFqlNUXR6IfrE5t3AFSU3+F91snJEZrCLQgcm8q4im/JqBrkM2V8wGjWI7EvVvpoWIxq4IeLLXeYLGomJE0rO94yot8qbFnTLoIJle5crzUqOb2m06U0IlpmiBc++L0GpJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528520; c=relaxed/simple;
	bh=bWURXCZrQDZ0x80rfdOSm1jqz2Xjezk3ZnaVSR44ifs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AV/kUedHaUlJNGdXWU0UPU1aocNbVoIpCRjwUuIWGWlNLfgS8qz5ScLhM5ORChrvF0StrAeAtjU96aBAuHnG8vYmLEl4k/6a2uaSAJKjosQ2f41IqqDuq7FwZCxv9xiSMNq2araqCEtsjqncLMt/WrARNIFIvq6wDJLL4tBdWx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso547584a34.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 02:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528518; x=1787133318;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/axx2TQndZ7l7LrHHfpxsCFqNyyCWsv8j2VxY85Jrxc=;
        b=bSqomX9KeBw0fZkfLC8wtEfpTl5ociTQxWbLM8wfWBpjS074zr+sJRgrYpH5BaRKc7
         BlVuZsS+Q+XIJJFKSMjYWrsorNbKp4j5oroGKUq89MJybYBQ/vmsEDVan3xK4SJfp5+h
         xpFWgI8GjaDd7+XaRBzJQkigOPVHhvqPrFEBtyG8QlbQnCBSebH+chqRN+rcYVCg8Svr
         Jl9K3zpUAZu0ALp2V4U+UHgtPL18qrIVb1oS1Ev2ERLKwR2GxXzKJte+5Moyk2jK1Azd
         nmZuYaKbh9NX6Aep/AQ1bm0L9ksUcIDHP/C6LgAU5AR07VqJUDedGDMDhFwh/XvhnYMg
         mzqw==
X-Forwarded-Encrypted: i=1; AHgh+RoSv6nijHZORFzmAWIhmCygbQsM8prUrlQYN7qncP5nXIRmPNCIjQIz2mffixa7+7RhlNIyI1SIxeAg@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKPJQzrPoK9VmxT62jZPXcH3VgpU37XLvsoOnk2pRYxzGEpvq
	S/a2GaOUS1tVY5MHRoPH95hm1BZw5TZNw1NXPacfaIxaBxjcNEi/oeUwTHPmEF2n
X-Gm-Gg: AR+sD12MbPDcw/4XRFq2uXDu+jBzJtaTX1dYOVNMVWVX1OSKvYf26Z6iqb2yJM3UcZu
	yvhC1SnWteMQGzs1frnWbZkvZcpC40kfuYg8/i6SuWdO4V5zuA256CKRglDyeFTq9xrdGeR1wzy
	1WwklNuQaOF7iEmGS5rOp97iArWC49VPk0dnYY4sbhMhUVp7H5HY4jBxSCVndvBehjGrAjADvnx
	sFLIBYbGbT44bcYGVmqxMdJBJo/PgncfRTnO9z6MQkq77Hf759o0e4ezQLdhR+9UduOrK4ceYd4
	/SiGN0EYf5b+s7+87+tKR/HYrAm4yqq3lOOgdHH2XsVOlDd/LGCM5oBdN+NRa1Jvv+OteejEvLx
	kkW071DPhIOhNFYq6mPWhfSdA5wIveB2ri5mv/LNg0VF01cnRXxF3+T8ryXkk3XrqLRIkWJ/5tM
	P7mmEX3UO99mGB2CPmsvZKrMZq8LBhfQjZNeVNtJkOEK3EroXS6NSdqNuqsCXHFYhJh6EyX27VF
	5VGiuRU00Dp/cXpBvNc5ETbQJn2TyizgKY=
X-Received: by 2002:a05:6830:f84:b0:7d9:f50f:9691 with SMTP id 46e09a7af769-7f3b74d6946mr3404825a34.0.1786528517849;
        Wed, 12 Aug 2026 02:55:17 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3b33cd0f1sm2381937a34.16.2026.08.12.02.55.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:55:17 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-495b250b01cso521925b6e.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 02:55:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpAs1p9I+1QMdZBewG5jM5h1OL7yEYelm+bXEZIpxGFwRY5lQdlOy5V+jfdV99o6kZUFmFeszvq06pu@vger.kernel.org
X-Received: by 2002:a05:6102:8020:b0:74c:7fd8:73eb with SMTP id
 ada2fe7eead31-76c87d7044amr1040741137.1.1786528061345; Wed, 12 Aug 2026
 02:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org>
In-Reply-To: <20260811163334.GA2354701-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 11:47:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
X-Gm-Features: AUfX_mxykVa-_GVxsMsY5j-WoXLeEw0hqTlxX_hGEjk_L8dF08TYL9-2xHiMqsc
Message-ID: <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Tue, 11 Aug 2026 at 18:33, Rob Herring <robh@kernel.org> wrote:
> On Mon, Aug 03, 2026 at 02:01:18PM +0200, Geert Uytterhoeven wrote:
> > On Thu, 16 Jul 2026 at 23:49, Rob Herring <robh@kernel.org> wrote:
> > > On Fri, Jul 10, 2026 at 01:02:39PM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > > > > > Add a firmware property, for systems where SCMI must be used instead of
> > > > > > direct hardware access.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > > v2:
> > > > > >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> > > > > >     Pulse Generator".
> > > > > > ---
> > > > > >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> > > > > >  1 file changed, 7 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > > > > > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > @@ -35,6 +35,12 @@ properties:
> > > > > >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> > > > > >      const: 1
> > > > > >
> > > > > > +  firmware:
> > > > >
> > > > > RPi is doing similar, but I have doubts. It looks way too close to
> > > > > generic "syscon" which is disallowed.
> > > > >
> > > > > I think this should be vendor+purpose specific, e.g.:
> > > > > "renesas,scmi-transport" or "renesas,scmi-firmware"
> > >
> > > If you can tell me the resource that a 'firmware' provider provides then
> > > it is fine, but you can't.
> >
> > It provides a firmware API, which is not available until the firmware
> > provider is initialized.
>
> I don't know what "a firmware API" is. What does it provide? I know what

It can provide lots of things (everything we are no longer allowed to
touch directly from Linux ;-)

> a clock, GPIO, reset, interrupt, etc. provider is.

A clock is an object you can access through the clock API.
(s/clock/.../ for the other cases).
Firmware is a service (virtual object) you can access through a
firmware API.

In all cases, the consumer of the object or service needs to know
which object or service to use (there can be multiple).

In all cases you cannot access the object or service until it is
available (initialized and registered), for which we have -EPROBE_DEFER,
and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
firmware".

Thanks for your understanding ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
