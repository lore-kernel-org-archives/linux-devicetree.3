Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EEA22D4C3
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350876; cv=none; b=lpQWucEO4gF6eISfAtpRNY5afatqsLXYBB2CNXr5P3K3uvJudWmPpYArx06WeTbCLcgr1EcBSmB0BwqUpeAFeSU8EWyFkT6RvRwCJhPW5xXVAuJH+0Yv6a701YtvNI9RJs2xxDWAcVGlJSOWxaOgrgn7XOBNLNOL59o8N4dDH8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350876; c=relaxed/simple;
	bh=+RDLim/geriyK6BHkVN+y+fbAsLHqr+xXa+qxaKtufQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMij30iFAANuc7hoPROhYzNOX36ZxFJDbt1+3YQKm3atZ0AL9CxXNOvrZ0hld3N0vxg5eUEG2xKeenR/jHo285xkCBhnwhhvtUrhYa3Rd9+g6hDOALoBNAfC4k+W4sCuo2+rci09DFV+3pFs98/L9KEcGdJqMGkA8KcO7kvhXBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e4004a4a6fso5732641a34.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350874; x=1779955674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kh5ilGfgBOd7IY4hv5kPF1I4gBzJqYiKUxJVuEQxYWY=;
        b=g5WM3ctjVp5o1mLAxwEZiUsmBTIffmIlEUtGyPR1X0bAQfTyK8hSeqBlzt4/VRH5qu
         7b+tahm4b400P3wVgS+5H1swUl+dZchnmxnLyqJf6I9fLreTZcZv/vPxD87MxHAIVKOY
         BH5KRHbIPEkZBvMGbIe4c5QrtfnCNb1JI99HTp/Ja4HoXZ5jh1NSPguoqqcs6KkVJsL0
         NeCdF5XFlQeuO3JGIclRPNQRyUdIo+8lxa2ocJDsvIUvx6/XSohzMbkHIANfeUcmB0MM
         ybAypZVPprFo7H8qOdxV00wqsT7T2xsUZuqhHbmY4HElmhdW2Ygtpu+NyCd3ln30XbLk
         a6Pg==
X-Forwarded-Encrypted: i=1; AFNElJ/ocd+Mbb/fFhf3cpleaTm8VFoc61VT2CkyCTj5ef3JAuMr39UPgiQ5z3K6rloMz7+7TPq6qex4P83s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy39gMDt2kZxo5ifhs/Bm+yL6Jw2NVbfaVnd9N8z2oRhTIugN5x
	IznyhBWw/vEPvha9fWw1F6elNrE+EMKTFSdQkNjPNmw16ULJMxiOQo0bJwTd8v+WJmY=
X-Gm-Gg: Acq92OHp2r/cPIQdabc+oMAzzzGwH6TRirPE+BlCsR+HFPNmIeM0kRaNo3VQ8YKtUgp
	wiq5soBZ/b2vi/HVGAqh74YILn8RuWRfYtRwDLqt1SkHY16uGuKD4zpCr0W7vHOG6d5YhCenQlp
	lsPDbaT5jT8GnqT92Nh7XfuJwP6xNQUSeTbpdgPcIYfqDufNOxVJedjT/DQTfZnZpIGUjxRgA68
	TPvcCnrFTEwzzEb24H57DH0abOckgVkeCsbTdsCS8oiEfYjdC6gXAN6tag4UIZwFy1w0iIRzYdd
	DH0BBDXt2FzIHlOUYq0zo203lvQpfuNzG20qw/HJLi0qiIcwVtQSXlmfL/LBmEtOeRbqmKDstDt
	2M8upL+xRtpMYvB4qvhv1WX1Qw8J1jQ0zh29cDvq/p33120QX4cA6Yskrv2Ve/SB8UB5XJ4G1fm
	It4upEqsDCZbFMaKuCd76jb+cx+zXAA1YxJwQyBNo2PAjQAkXvrX5JvlfFzVbHG3LReUpXOVw=
X-Received: by 2002:a05:6830:673a:b0:7d7:d510:4bf9 with SMTP id 46e09a7af769-7e5ec4950ccmr943189a34.12.1779350873735;
        Thu, 21 May 2026 01:07:53 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com. [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b95b82fsm15751422a34.12.2026.05.21.01.07.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:07:53 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4043b27ddeaso3604657fac.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:07:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/LyBqjN+LLVUgY5JOv+G+vE1bn/oB/1wox3SrcTYvaHgDfwFnztAmo1s0UqBVHVc9cuXnLEx3cjDP6@vger.kernel.org
X-Received: by 2002:a05:6102:952:b0:660:cba2:b6a5 with SMTP id
 ada2fe7eead31-6738d46a2c9mr965451137.7.1779350455953; Thu, 21 May 2026
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
 <agor5HJ0JFBoX3sZ@pluto>
In-Reply-To: <agor5HJ0JFBoX3sZ@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 10:00:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJrXcp7_S-KTKQJ8NuVhywiCWEHXMVvWkTFZwnmQayyA@mail.gmail.com>
X-Gm-Features: AVHnY4LKAf9GYj9Cj8Ma9x6mjosVr-AC-oJEzWQ_9yBj7Yua2eAsFSXzEFT0UeE
Message-ID: <CAMuHMdWJrXcp7_S-KTKQJ8NuVhywiCWEHXMVvWkTFZwnmQayyA@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
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

On Sun, 17 May 2026 at 22:58, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, May 15, 2026 at 05:39:45PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > > > Currently non-SCMI drivers cannot find out what the specific versions of
> > > > each SCMI provider implementation on the running system are.
> > >
> > > Thanks for your patches....this is not a proper full review of the series,
> > > BUT this patch catched my eye..
> > >
> > > Indeed, yes, it is deliberate that the SCMI version information is NOT
> > > exposed out of the SCMI world, since being the SCMI an attempt to
> > > standardize a common FW interface (as in [1] of course), you should not
> > > know what runs inside the black-box, it should be irrelevant...
> > >
> > > ...indeed the versioning is used inside the SCMI stack to deal properly
> > > with different protocol versions implemented by the server OR to apply
> > > proper quirks when needed, but all the rest should be standard....
> >
> > [...]
> >
> > > I watched a bit of the LPC discussions around this (from Marek I think)
> > > but sincerely most of those problems had one (not necessarily simple)
> > > solution: fix your firmwares AND/OR apply quirks in the meantime...
> >
> > So let's forward to the future, where the firmware is fixed, is fully
> > compliant with the SCMI spec, and all IDs are stable, so no quirks are
> > needed.
> >
> > Where do we specify the SCMI IDs to use?  Unless when using the
> > remapping driver proposed in this patch series, they must end up in the
> > DTB.  Existing upstream users put them either in the SoC-specific .dtsi,
> > or in board-specific .dts.
> >
> > The SCMI server is supposed to expose to an agent (e.g. Linux) a
> > sequential and contiguous list of IDs that represent only resources that
> > the agent is allowed to use.
> >   - We cannot put the SCMI IDs in the SoC-specific .dtsi, as that
> >     describes all hardware in the SoC, which is typically much more than
> >     Linux can or even wants to use when running on a specific board.
> >   - You would think we could put the SCMI IDs in the board-specific
> >     .dts.  However, that would limit actual use cases later, which do
> >     not necessarily depend on the board solely.
> >       - E.g. when moving control of the CAN-FD controller from Linux to
> >         the Realtime OS, the CAN-FD node must be disabled in the DTB (by
> >         overriding status to "reserved", or by just deleting the CAN-FD
> >         node, both of which can be done by the boot loader). However,
> >         with SCMI, the IDs corresponding to CAN-FD resources must be
> >         removed from the ID space, causing a full renumbering. Who is
> >         supposed to update the IDs in the DTB?
>
> As per my previous email, after such a breaking change I would expect a
> new DTB describing the new HW to be needed anyway.

The underlying hardware would still be the same...

> >       - E.g. when partitioning a single Linux system in multiple VMs,
> >         and distributing hardware across these VMs, all VMs need
> >         different DTBs, each describing a subset of the hardware.  With
> >         SCMI, each VM needs different SCMI ID spaces, causing not a
> >         simple partitioning of the devices in the DTB, but also a
> >         renumbering of all IDs.
>
> Ok now I am lost..why do you need a distinct IDs space for each VM ?

Aren't the different VMs different SCMI agents?  If not, how do you
prevent them from stepping on each other's resources?

> In a virtualized env, I would expect to leverage the SCMI stack to
> realize the exact opposite: same set of IDs advertised to each VM (and
> so same DTB potentially) by the server which in turn can decide to
> assign the same device (and handle the sharing) to some ID or assign
> different devices to the same or different IDs on each VM: i.e. you
> have a set of virtual_IDs that is what the server exposes to each VM
> SCMI agent, and then a bunch of real physical IDs, without any contraint
> on their numbering, that the server uses in the backstage to refer to
> the real resources and that it properly remaps to each per-VM set of
> exposed virtual_IDs during the build and/or boot board configuration
> phase....i.e. when the FW adapts and reconfigures to the specific
> board that is finally running on.

Again[1], how would that work?  Clock, resets, and power domains are
not the final resources that are used by the OS.  They are merely
resources for devices that are described in DTB with other resources
(MMIO register ranges, interrupt numbers, ...) which are not handled
by SCMI.  If the server remaps e.g. a clock to a different clock,
it will no longer work with the corresponding device described in DT.

[1] https://lore.kernel.org/all/CAMuHMdVunEehM01pLa3t5a6o0NmMOCQRwh7n5J+OkDk2YR9kUA@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
