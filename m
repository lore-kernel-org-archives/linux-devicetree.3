Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE95305687
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859925; cv=none; b=LYnfPG0HD5DgkBRAIMk1sxpSn2yHxU2qn858tkXFUaYa5V4oYcv5+ELeGSYoRe7V9yB6RC+F4OdSRpzHZPCM15W2tOkdsBZH3POVuqyRh83KLw7IYkCyIQs2wiUTGTgryUJeQSiBS9Z79ELgn/IFgFSWxKO2mdwN5vPcwK6UE1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859925; c=relaxed/simple;
	bh=nSQhZQ6tGlBOmtUdwr13VWi2FIFZQeS4gjHokci/kyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6gql5GS5mzq3NRChQFCQz1QKBVnLfb2ottfCMlucFM+3Ko4Tm/s0OzFLODozfC6cs719Td4E/cEpnSjHKGZW6MlvCJinH36oR7OMax6DCtRYbFpJJWy7uJE81+Q2qFw8P6FODYyz0rEi3afgJMlMynQNpzuxudAhnfOq69RIDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a40502e63bso8641946e87.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859922; x=1779464722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkAu8P10dwihkNM39UctSZpVluViyWa9thhV649dqfg=;
        b=e+L6hIv42ngyi3pbPNaXjOdMMzyqQ1qQS4fPFf539BaJh1OSrd0BbxxRsw747Jia0+
         fyMZxydupo9jHT8O3+xjf7qGZvo9xsuucuLeeqqeDY+ydO1ImpuQxGdgyZ58oav0j0NM
         twH4KX9BZxeGSWW4vwTyH9CpRFIuEnDIAQ+J9z7f1AZGhX9hDPAZNmxOYYNDsTEly3mo
         BfEI+5vIj8bCo4ahct6oOI0l4SYCynKMDc0Uz26Po85whbXWtxZySGWPKdLXMkWHtxXT
         I6TFb0Zfhun0cqkG8hslwkijWB5TT+bZhep1rp7z20ei11Irwuko+UTeJVUgPd70mGWm
         1eMw==
X-Forwarded-Encrypted: i=1; AFNElJ+NW5bLCWmjkMyXCBWeBRP+FIqQOVDyJqsfiiuajlBpwPTm6bS7rJZyTIV/SUXIYh2NFHwccKE+EvUK@vger.kernel.org
X-Gm-Message-State: AOJu0YwkGr8V2JapVVZXdcZj8LJSRHKH4PrE9z8/apv7k5Ybj5AO5Ulp
	Uy2mEHrrIA1ev4uHeZlHJXAR4+l5cDdS37A9tHHXbhrcY5ra1DQRs0oijN/q6DsUUjA=
X-Gm-Gg: Acq92OHdXGuTFsEDMC/QCWTor7VuoQ8u4DpRoF43hO5zNnnOp1Dm8Pl9yzQMPDIs/Yy
	awRrs4Q5YfhPzsnvgN5YeIGQNODhfRDVw5L21PZP+2mVBjhW9lNrzG3/TgsX2ImBeLc388RuUAn
	UoBaIQ/Wj1uhiP8Ms7A+8OD/84Gbk4t1bIbKiKKR8jaigzIifXRFwJoeO6oPpGw1/hAedhJqUB1
	iKfFqTwTgwkLs1b98iDfR297Cjh4jmuskFo179NXbPByaWDIwaOc/CxOe8j15EAA0gK5j+yRY0Z
	1gwzbRWo2G1UQyvbEDkgLGDRKn7BIzx7XhhC29HCuECAhEIZ/046okcuH2CH1oVgGXVdnUdlqC9
	VSzV4OWH4kep0RdDlEoEj6KyuCdrRWkfgcgkh53X10g0zGATa9uvLeHu1zsPKSOjGuFNq+p9M0Z
	6hqSSQdf0k1gjUb3D4SCTQ9sleCiRd+D4h1/rklDH9qmjFZwzSr/QTf8fL1xHR4LtcBvOweyvfG
	mM=
X-Received: by 2002:ac2:4c47:0:b0:5aa:b6a:738f with SMTP id 2adb3069b0e04-5aa0e749c47mr1479386e87.45.1778859921909;
        Fri, 15 May 2026 08:45:21 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc0ccsm1416978e87.41.2026.05.15.08.45.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 08:45:21 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-393925cb1baso13581fa.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:45:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8tKrz18Pxpo/n+RTmWZU70FE4VIC7gyrOAuMmSo6Zd7RySO/LYDdo136USa7oIOy8CGso8E+xKY/Gc@vger.kernel.org
X-Received: by 2002:a05:6402:e0d:b0:684:44f:d859 with SMTP id
 4fb4d7f45d1cf-684044fdae7mr1374876a12.3.1778859601770; Fri, 15 May 2026
 08:40:01 -0700 (PDT)
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
Date: Fri, 15 May 2026 17:39:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
X-Gm-Features: AVHnY4L73EskDuVnlvp0bKAJEo06GxthEmZ8mwHk1YJIsXaKqejpar7GeFZqJcE
Message-ID: <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

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

[...]

> I watched a bit of the LPC discussions around this (from Marek I think)
> but sincerely most of those problems had one (not necessarily simple)
> solution: fix your firmwares AND/OR apply quirks in the meantime...

So let's forward to the future, where the firmware is fixed, is fully
compliant with the SCMI spec, and all IDs are stable, so no quirks are
needed.

Where do we specify the SCMI IDs to use?  Unless when using the
remapping driver proposed in this patch series, they must end up in the
DTB.  Existing upstream users put them either in the SoC-specific .dtsi,
or in board-specific .dts.

The SCMI server is supposed to expose to an agent (e.g. Linux) a
sequential and contiguous list of IDs that represent only resources that
the agent is allowed to use.
  - We cannot put the SCMI IDs in the SoC-specific .dtsi, as that
    describes all hardware in the SoC, which is typically much more than
    Linux can or even wants to use when running on a specific board.
  - You would think we could put the SCMI IDs in the board-specific
    .dts.  However, that would limit actual use cases later, which do
    not necessarily depend on the board solely.
      - E.g. when moving control of the CAN-FD controller from Linux to
        the Realtime OS, the CAN-FD node must be disabled in the DTB (by
        overriding status to "reserved", or by just deleting the CAN-FD
        node, both of which can be done by the boot loader). However,
        with SCMI, the IDs corresponding to CAN-FD resources must be
        removed from the ID space, causing a full renumbering. Who is
        supposed to update the IDs in the DTB?
      - E.g. when partitioning a single Linux system in multiple VMs,
        and distributing hardware across these VMs, all VMs need
        different DTBs, each describing a subset of the hardware.  With
        SCMI, each VM needs different SCMI ID spaces, causing not a
        simple partitioning of the devices in the DTB, but also a
        renumbering of all IDs.

Hence there are no stable SCMI IDs in DT, by design!
And what do we describe in the SoC-specific .dtsi?  E.g. U-Boot IPL
still needs real hardware description.

What is the stance on this from the DT maintainers?
Thanks a lot for your answers!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
