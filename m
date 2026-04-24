Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3453C13FA
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032556; cv=none; b=Dl7ofNlmuWewPDRniEtNM4mFZwfFF7HIZdP32qItEes9JP8DAEg9djpaH7N3X59BzWzSCHVhKIoJNI0d5DSSYNm+PWg47mOSYANH8gAIuqi3NZUVFKhFj93XkdmfGvj+zywIGFrPJZheDuEbs/CxLI01Ovx9WEwtWp2TZ8wCn40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032556; c=relaxed/simple;
	bh=6x8AaL0soP/QvCrhUlcKrRT+37cNHuikR53lCEKEpMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fK5wyxMwpaufWLTOycfry/RbcaoliHgfl+TDyZnIjqbCuYPf5Ugvws6+/ue1Tpe01tIZJLT9HxZJTfQs8xwpD704xjmHfuoMykwLTHCyz+bRcxdllq062IexKSLSzISqZh+DGrfby19pc1hnY3DoW4hSQnCsWo24RqM+iRwLU+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso9684110a12.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032553; x=1777637353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlPOzsbSlIKF8HuNfduxYXPi56LqB7rH+tGNemLx+GY=;
        b=VPf4sfp7xE9eEBSInB9mLfDgA4QUiY2rxqJNRJp7EZYuXyQrQ8wFyxyG+HTWYySQQp
         Z7CFxJctHNb73WiXlXixMdGoXsUHn1otwgw3fGCAcEg8ptPn+enIIAnGiYkP5gPBzxCC
         T0iWiLJxPSch9vHrNO9hfBOpuJvQycmTLdjX72jLOHP5s6gmJKq1eYSJUGca0o9LBQEJ
         PJ4bx2KrM2x51zZPX8E/4dRNJg3G+uA5Uj3rpro49te3ii93ciaJWHzsWZACuj03tSkw
         Pwfr51ofFz6krVse7yJNDqjnr6sq8vHYT9Z1LOk9l+EPeB3wc7kUoa6ODBcs9rlXdl1Y
         r3nA==
X-Forwarded-Encrypted: i=1; AFNElJ+q/+fQJ/2f1ZQAi/LIFYLvzHaagA3Bg82vWq/6aJK7/WA77g7QXoaBdqMX6RQBSVxRyN1Z0oLXLkKO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Rge96XtpJicHrl5wVuW08oCWsEmlf/HgR/407ejKhnWN+9Yw
	0UaY4ara4iHRyPIvd8HOnMuLZNzXuOQLutDc6E54208oE5zgwkrrV8KKIP/0xAVyfkg=
X-Gm-Gg: AeBDievYXHxoaVf9oIKXRWOLmTvMmGZrytaDobio1rqi5UXNR0zfGL+n5MIWWVKNzGW
	et4fxjg1+KnVIGofZKQVfS2lf6ksX+avsEvL5ucL9r3XYXCMSw1o71rl6RRsi2Br2E15hz4ZKmt
	b0OT/E6DR3YKQdhWLxbZ6lAnd1sQT+VDXuMw2ufhblZFkWMHQe1JJ9bDndWXM2F2vzE5WzFFazw
	kADQRs2WCqlyBBEIkK72nEYJUan6yAqZNXU4XUvgYdse5e7nD2WzHPjbIW8lXFqm8lcN4EQwtp1
	WAlo61gvKV3gV+Yu4qoP/CyjOYXDxviJkbZtAtdl9zd0GCA19aQTgercPMLx2xoYuMvIVKXUnsU
	BOn9uzEDSBjptjAEq93ApVs9T43u9nmTViBZ/eM3tqMyFXmG59AKdI91kSttW1Yodqggknbf5UU
	5PPNEc6H+NE9BjlFjvOtnDh8DzsPn1RbOeKm/Opaoksv35hRvPAo0J/iXlvorIQ+KueV2HOis=
X-Received: by 2002:a17:907:70b:b0:ba4:b8d6:c336 with SMTP id a640c23a62f3a-ba4b8d6d9c2mr1615679166b.43.1777032552506;
        Fri, 24 Apr 2026 05:09:12 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1c38csm764726566b.41.2026.04.24.05.09.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:09:12 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9382e59c0eso272321366b.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+gWi970TolY4Vvq1Fj2J68MinY/BARVukWSDT2EytKnENWT7ItQZTXcNqScvl3JIrxyxGcegxsV/Fx@vger.kernel.org
X-Received: by 2002:a17:907:3da4:b0:bac:1263:2562 with SMTP id
 a640c23a62f3a-bac12632637mr434030666b.24.1777032550820; Fri, 24 Apr 2026
 05:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto>
In-Reply-To: <aekXUvIPb8nkhdKu@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:08:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
X-Gm-Features: AQROBzCeAVXP6DoeEYDD8I1FaXSTP-ZpY0v2OnIf6zjZFA9mNfY85ZLl0E87BuA
Message-ID: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > Currently non-SCMI drivers cannot find out what the specific versions of
> > each SCMI provider implementation on the running system are.
>
> Thanks for your patches....this is not a proper full review of the series,
> BUT this patch catched my eye..
>
> Indeed, yes, it is deliberate that the SCMI version information is NOT
> exposed out of the SCMI world, since being the SCMI an attempt to
> standardize a common FW interface (as in [1] of course), you should not
> know what runs inside the black-box, it should be irrelevant...
>
> ...indeed the versioning is used inside the SCMI stack to deal properly
> with different protocol versions implemented by the server OR to apply
> proper quirks when needed, but all the rest should be standard....
>
> ...you should NOT really behave differently based on the underneath
> protocol or firmare implementation version...it is the SCMI stack that
> should behave properly, transparently...

Oh well...

> Having said that...I understand that at least it could be useful to be able
> to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
> have been applied/activated at run time...but anything more than that it

I see no need for that, but we can discover which quirks have been
applied from the kernel log ;-)

> seems to me dangerous and prone to a number of abuses of the SCMI stack
> itself...
>
> (Also...exposing the versions itself means also tracking that bit of info
> in more than one place: the quirk framework and your drivers.)

I'll see if I can get everything handled as quirks instead...

> > However, different versions may use different ABIs (e.g. different clock
> > IDs), or behave different, requiring remapping or workarounds in other
> > drivers.
>
> ...abuse like this indeed :P ... the SCMI server is supposed to be that
> one entity remapping the IDs in the background if the same IDs happen to
> be representing different physical resources across a number of distinct
> platforms all supported by the same firmware blob...so as to present
> a consistent set of contiguos IDs...

In our case it is just a single platform, with different ID number
spaces for different firmware versions.

> Also because this should be one of the selling point of the SCMI stack
> in a virtualized environment: you can ship the same kernel drivers with
> the same DT and you know that ID=<N> will always identify the specific
> resource that is needed by your driver without worrying about the fact
> that in reality in the backstage the effectively managed physical resource
> could be different across different platforms, because that does not matter

This sounds strange to me, do I understand it correctly?
So the ID should (1) be tied to the use-case, and not to the underlying
hardware, and (2) be the same for different platforms?

For (1): Then we must not put these IDs in DT at all, as DT is supposed
    to describe the hardware (and firmware IDs in DT were IMHO already
    a stretch before).
For (2): How can there be a contiguous list of IDs, as not all platforms
    may have the same underlying hardware?

> if the SCMI platform server had properly remapped (at build time/run-time ?)
> the resources to your expected ID...alternatively of course you can ship
> with different DTs to describe different hardware...BUT remmapping stuff

That is a different issue: as SCMI covers the full platform, not just
the SoC, the IDs can be board-specific, and thus should be specified
in the board .dts, not in the SoC .dtsi?
Then the SoC .dtsi should describe the hardware, and we end up with
things like arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts?

> in the drivers themselves guessing on the vendor/subvendor/impl_vers
> seems a dangerous abuse...

There is no guessing.

> I watched a bit of the LPC discussions around this (from Marek I think)
> but sincerely most of those problems had one (not necessarily simple)
> solution: fix your firmwares AND/OR apply quirks in the meantime...

Unfortunately (at this point) we have to work with the firmware that exists.

From that LPC discussion, we learned that we are actually the lucky
guys: some other vendors tend to change the IDs and/or behavior without
bumping the version, so Linux cannot even act upon that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
