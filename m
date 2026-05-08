Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A50E230BE9
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236371; cv=none; b=uACqPWtaimbLO1PxJueD6Jul3j+HcP0qp0jwS3XZxdbhBghMy5s1LLdYsTqCPtgN+uG3hgNcrEGgfO/SGOrgLhW5QK4E0kfEZQ97KdL0SV8TM2qqGVZhwyqC50m5k3puTOY3dcugqw1IYxsRaWlkk6XNYGkv8I4Du/yIFXoNEeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236371; c=relaxed/simple;
	bh=36lBpAkEr0H2Wsx1O/r0B32FSIwBe2F6o8wScyIxU0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B26GbgQt1SgA/W6bfvwR/LrRBNHcQG3bo/YVfZQJSfjdgI3NXYy+UoZIE5trwaf5b3zF64w6d42rjGGQIeiGbGlOwRH7hdTf87uQuQdVSkBlv+AslTPecXEpqXQ+jBaJcTGzQyLJRYm7JwYQ01/Mnyjl7QrY0yVDcwK/4j6uw+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-62f390b8df7so1172608137.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236369; x=1778841169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZIqmD8zZ0qFeOi8hR6tlVmjP85Y0OQ26EIUPvE1H2I=;
        b=glS75wiCxaBEV08gGDECAAlKzHww0dZv/KGyZiF4GvftIzOBjDmyLc6+kCBoSfBr0+
         BY18TgVuI2YbyTNftcECUK3lREYDQCXmz9dFicjam5oBA7en0rAQmaDmQUbPocUS+iJF
         w8DZu/TfQbeiIp4C6A8rh22htvnqMRwZddpj4aI6GnuxpyxxWNtpy1Lmkg6/vX9UQyuC
         cu+vnWP/u3BvyLQLa/Q1Ou6w8k2v5p2JqkTNmfh38Pw98ppLT1lgV5Q1LgaD+3QHbUs5
         l5XuVLIGYNC14uVbPWh9t0hmr3HpFBnsZbmmWnwp0HxUKZOW8BQAxTb5Rq+w1v2DgE5e
         af/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+gQDjooC9vKVD6ibwpi6oiNa8gNgdugL5IVTT+S+PbKVQxca6dWELAQYLodJSdCNFx3oJ7a7J22Y8j@vger.kernel.org
X-Gm-Message-State: AOJu0YyF4juwzojqC1DRQWIoSq7QZb1a3aoUX0gNCvs/NSSlMtx3hs39
	MeKS8PPaaPrR7HWgDXjN8V2zRKRNtNb4OpARojZ/Ujfzx2+sHfOoOPLObXbxm3LtQKs=
X-Gm-Gg: Acq92OFYF9yKvszWdxXChu7eAjur9MBaJlYfBt3jv6fEO+qXz0yPHxNFsx71fCI3Mtm
	BRB5re7V92dT9/tVRg4DIpnyYpf2mIBydTWD8uCokeJ8VPgNh1qjPV6R7hFa5GXPVoHJ/baOF6P
	awaviiaCbX3sNiNLdv24QpXYRaDc0YWIQtsmt6DtLe1CHHSah700XYmbloPz2/ecc0Ii6dwewt0
	m2CXxhj4bwpzC2iARd8ZgnCdujkEXpXNF4gsUbEcDQnsLTLDPEnF7FktaI+3kdRCcpv+GtV9amG
	PgbiZh+3Chwqg3u6j8S/QwVM9OnKMEsQMpM9SkEXX//H/86VBZyq50Ok/pB2wUevFiAVsel5g2R
	7FH9hM199Ek2xR+mLCK2mMfycCZPyTVyo9/B1lbXLyf7Hv12QmMO/VhGsN0ATYN+9+j9AT4058W
	Jmg73KnLRhBXtLgl78EW3jc+jKShZKglXzK+zX7TQIqgIDZQ55RWq+uzCpEeGH
X-Received: by 2002:a05:6102:5a95:b0:62f:3c55:d41e with SMTP id ada2fe7eead31-630f9058785mr6559042137.24.1778236369041;
        Fri, 08 May 2026 03:32:49 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-631402487f3sm603311137.10.2026.05.08.03.32.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:32:48 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-628086439b6so1423184137.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:32:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/jY5lBDovprsJZKGSJg/ZlyCQgCHfG4+efXTVv+HCXP9LCp8O+3UVTHb5BsjdSm/Oxur/XOyDFWgsg@vger.kernel.org
X-Received: by 2002:a05:6102:3048:b0:614:bef5:637c with SMTP id
 ada2fe7eead31-630f8c2bb7dmr6450388137.0.1778235990622; Fri, 08 May 2026
 03:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto>
In-Reply-To: <ae6Zp54NhKlVes8J@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 12:26:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
X-Gm-Features: AVHnY4J3TVnOKvIG81cskhXstanCgVV2EYjhdTAUgyNfFJiiKyj4H0BCwyLVTfY
Message-ID: <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
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

On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > Also because this should be one of the selling point of the SCMI stack
> > > in a virtualized environment: you can ship the same kernel drivers with
> > > the same DT and you know that ID=<N> will always identify the specific
> > > resource that is needed by your driver without worrying about the fact
> > > that in reality in the backstage the effectively managed physical resource
> > > could be different across different platforms, because that does not matter
> >
> > This sounds strange to me, do I understand it correctly?
> > So the ID should (1) be tied to the use-case, and not to the underlying
> > hardware, and (2) be the same for different platforms?
> >
> > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> >     to describe the hardware (and firmware IDs in DT were IMHO already
> >     a stretch before).
> > For (2): How can there be a contiguous list of IDs, as not all platforms
> >     may have the same underlying hardware?
>
> I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> is a possible SCMI deployed setup that can be useful in virtualized setups
>
> I mean, the DT describes the hardware of course BUT when you refer to
> some of this hardware DT bits from some other subsystem by referencing a
> phandle, even in the non-SCMI world, you are in fact selecting a specific
> resource that fit you use case, right ? Can we say this ?
> I mean you needed that specific clock or regulator that you described
> previously so as to be able to enable some other piece of HW...
>
> Now, the SCMI provides an abstraction on top of this, since you really
> discover domain IDs of a specific class (clocks/regulators etc) you are
> in fact describing an HW abstraction that you then refer with the usual
> phandle...also because there is NOT so much SCMI hardware to describe,
> given that the HW is handled transparently (opaquely really :P) by the
> driver on the FW side...
>
> ...you basically obtain such domain ID, usable as phandles through dynamic
> SCMI enumeration so that you can use it all over your DT to make use of such
> resources...
>
> ...on top of this, consider that the SCMI server CAN provide to its agents
> a per-agent-view of the world, IOW it can (and should) expose to a specific
> agent ONLY the resources needed by that agent, i.e. it can expose the set
> of resources 1-N to two distinct agents and that does NOT mean that the
> underlying physical resource mapped by ID=3 in both agents has to be
> effectively the same piece of hardware: it could be the case, and this
> would be useful to exposed and managed properly a shared resource, or
> it could also be that the same ID=3 could refer to completely distinct
> pieces of the same class of hardware...(same protocol same class of
> resource...)

Exposing only the clocks/reset/power domains the agent can use,
in a contiguous list of IDS, means that the number space changes,
depending on which resources are exposed.

Suppose you have a system where you want to assign a specific hardware
block in the SoC to the realtime CPU core instead of the application
CPU core running Linux.
That means all resources used by that block must no longer be exposed
to the Linux agent, and the corresponding IDs must be removed from
the ID space exposed to Linux.  As the ID space must be sequential
and contiguous, the IDs must be renumbered, impacting resources that
are exposed to Linux.  As these IDs are used in the SoC .dtsi, they
must be changed there, too, However, these IDs have become part of
the stable DT ABI, and thus cannot be changed.

This patch series fixes that issue, too, by describing the actual
hardware in DT, and doing the mapping to exposed SCMI features in the
kernel, based on which firmware version is running on the SCP.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
