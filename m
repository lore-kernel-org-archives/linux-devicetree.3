Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7860A4C224C
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676957; cv=none; b=LfikfSLnBJAm1am/7rGGx4kTUBD1saJcL/obvIvx0CjiKxqjPvDNAoToTBJogFP70ZZ+Z1XGQGTDjyClAJeZa0uELL4hFmqBh8TgQ7g2NOB5A4ReZUXEgXN1vE5kyiirG4j6wbxXRlSVTp4824J62viFa+q1vjn0ZFijb8rfqDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676957; c=relaxed/simple;
	bh=7E/FyJ/TvooU1Eq7DhSqLlMVSAu9nLzNeNoUUqFgvQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSsyOu6sm/s9QvRdo382kV85qnO9Ow5FgC9Ph/Xtx1r/vOjW/Mu7wYr6IbUqnKY1MofB0sYrz2g98JBYePfkDIZwPRksERwROACgc95DSzthFiz340DRAPX+5jWeuOdyVU9U9QAjx0G0lqtxG28j6xEgHK8L/MuScLqm7tJjU5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=o72h1DBO; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="o72h1DBO"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id E0A1842C3E
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:15:28 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id BEBE642C33
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:15:26 +0300 (EEST)
Received: from mail-pz2-x0c.google.com (mail-pz2-x0c.google.com [IPv6:2607:f8b0:4864:3b::c])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C62F11FFB15
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:15:25 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790676926;
	bh=7E/FyJ/TvooU1Eq7DhSqLlMVSAu9nLzNeNoUUqFgvQI=;
	h=Received:From:Subject:To;
	b=o72h1DBOlXRfSo2Nz0pBNtF5EoripUSorYPdxO6Wp9ldgXpo7KTlp4neoYkHOK5wh
	 OCzJd3CfhUKbP7j/iNrxhpfn/G5kn+yCfkogxRNOE88s/HQHeJC3KndPQrrYeSv+lF
	 zYJ8TynLQmhNNCmnpCcTU8/jxHl6c5UFpsJyJsywJF16OcuhshjFqs49aM++23z+XF
	 HL/rmxJdm+kg0WLPq3rSAu8qx9gKJ3hrCC36RQOv7pPo6vANPf6+Udxn8pENgcFcMn
	 OfugwIYq8tbWQSTcAeKpDgagrLtnQyVarZelFFogsSX0dPWnVC+fsJBosTYySla+az
	 BFQrzczoJFOyQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 2607:f8b0:4864:3b::c) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pz2-x0c.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pz2-x0c.google.com with SMTP id
 d2e1a72fcca58-8805988a200so2546526b3a.3
        for <devicetree@vger.kernel.org>;
 Tue, 29 Sep 2026 03:15:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxkPbD8vv7T7euKewb173XwvMqNzRlPMKWWVGWgwir0VI+yzKbpS3BfFe6rMo1GnH10IqvMRr8i+/l1@vger.kernel.org
X-Gm-Message-State: AFuF++mFGFYtgoyFdQdPLuMZMOZ2zCY9tqGKyc6OBkZL0VE5fcUJiBtg
	SCpys9XF7Ri4JWawnlwkvFR19B1Mkrm4bFslHhQkk1Axj0N8oW+0EeRI7hMii7agpOxoZeczAPq
	1VdF6C6GhCqpPyPdzpGWZGjOCHyoKIfQ=
X-Received: by 2002:a05:6a00:a90:b0:882:359f:ef17 with SMTP id
 d2e1a72fcca58-88235a00258mr6854298b3a.12.1790676923332; Tue, 29 Sep 2026
 03:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920184148.31541-1-mstoretv@cern.ch>
 <20260920184148.31541-4-mstoretv@cern.ch>
 <CAGwozwGzw1CE03kbWJaV7iC=1o0QXg9PpreTunenm-vHPe515A@mail.gmail.com>
 <6f2e0c22-0be6-4daa-8ab3-28d92f41197b@cern.ch>
 <CAGwozwGwccsppaCUETVJzNN8uGd8Pzujf9pz08SyHUQFKEOxCQ@mail.gmail.com>
 <3c0701fb-9f8e-41d3-a815-d48b1a29716f@cern.ch>
In-Reply-To: <3c0701fb-9f8e-41d3-a815-d48b1a29716f@cern.ch>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 29 Sep 2026 12:15:12 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGHyA5Lqh28LQkGVNf-Xj=hFPM_DZ9nQXQ9Rk9KynTfFA@mail.gmail.com>
X-Gm-Features: AclHuK92o2D9MoL45RS67cVnRLXbDC2jGhqffGiqh1vzVrLrNn6TUItqsz0paY8
Message-ID: 
 <CAGwozwGHyA5Lqh28LQkGVNf-Xj=hFPM_DZ9nQXQ9Rk9KynTfFA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4
 Edge devicetrees
To: Maxim Storetvedt <mstoretv@cern.ch>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
	abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
	kirill@korins.ky
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179067692617.742096.10447099747580679671@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 29 Sept 2026 at 00:22, Maxim Storetvedt <mstoretv@cern.ch> wrote:
>
>
> On 9/28/26 21:09, Antheas Kapenekakis wrote:
> > On Mon, 28 Sept 2026 at 20:41, Maxim Storetvedt <mstoretv@cern.ch> wrote:
> >>
> >>
> >> On 9/28/26 18:44, Antheas Kapenekakis wrote:
> >>> On Sun, 20 Sept 2026 at 20:41, Maxim Storetvedt <mstoretv@cern.ch> wrote:
> >>>>
> >>>> Adds devicetrees for the 14-inch and 16-inch hamoa SKUs of the Samsung Galaxy Book4 Edge.
> >>>>
> >>>> These use a common dtsi derived from nodes that were able to work on Linux
> >>>> from the initial Galaxy Book4 Edge DTS by Marcus:
> >>>>
> >>>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
> >>>>
> >>>> combined with the patch series the Honor Magicbook Art 14, which shares device similarities:
> >>>>
> >>>> Link: https://lore.kernel.org/all/20260629154812.9066-1-mail@etehtsea.me/
> >>>
> >>> Links go in the bottom, Based-on-a-patch is not a thing, you may add a
> >>> Coby as noted in a parallel thread.
> >>>
> >>>> as well as a few more adjustments on top of that again to get additional features working.
> >>>> Special thanks to Jesse Ahn for helping expand on what would eventually become this dtsi.
> >>>
> >>> Hi Maxim,
> >>> I tested this series on a kernel with various other backports on two
> >>> european (norwegian market) galaxy book4 edges.
> >>>
> >>> Specifically, the 14in NP940XMA and the 15.6in (not 16) NP750XQB.
> >>> Specifically, the later is an X1Plus variant that came out a year
> >>> later with cheaper components. It does not work properly on either on
> >>> them. I was hoping that at least the 14in model would work as is but
> >>> no.
> >>>
> >>> My test devices have proprietary Samsung battery controllers
> >>> (ENE-KB9058) and type C controllers (Samsung EmuEC). Also the speaker
> >>> amplifiers are different. So the battery reporting, audio, and USB C
> >>> ports do not work at all using your DTs. The TPM does not bind either
> >>> but you do not claim that it does. At least they got me to boot and
> >>> for that I am grateful.
> >>>
> >>> Other stuff also does not work, but I am just listing the main ones.
> >>>
> >>> I suggest you change the -14/-16 suffixes on both models with
> >>> something more specific.
> >>>
> >>> The prior patches in the series look fine to my eyes. I did not A/B
> >>> test them, just pulled them in.
> >>>
> >>> Best,
> >>> Antheas
> >>>
> >>
> >> Hi Antheas,
> >>
> >> Thanks for giving it a test! I think we both have the (almost) same
> >> device, and your experience on the 14" NP940XMA (NO) probably mirrors
> >> that of my NP940XMA (IT).
> >>
> >> USB-C should already work for this SKU with the patch DT, but not USB-C
> >> hotplug (yet). For now, everything is just left as already set up by the
> >> firmware, so peripherals plugged in after boot will not be detected.
> >> Everything inserted before boot, and hotplug on USB hubs, should still
> >> be fine. Could you give it a try on your device?
> >
> > Yes, that mirrors my experience. But without a TypeC driver you don't
> > get renegotiation. So no USB3, no fast charging, no hotplugging, and
> > no DP alt mode. I wrote one but it's still buggy and a bit too
> > complicated.
> >
> >> Battery state monitoring should also be with the same caveats on both
> >> these devices, going via a separate protocol over I2C instead of
> >> following the other X1Es. There is a separate battery driver for this,
> >> and also other useful patches (like the webcam and kb backlight)
> >> downstream. For now at least, only the features listed in the cover are
> >> included here, but our repo linked there has pointers to the other
> >> relevant patches needed for now.
> >
> > I did not find a battery driver so likewise I wrote mine. I think the
> > battery driver is more upstreamable than the TypeC driver. That will
> > take a lot of work.
> >
> > But it also means you have a spurious hunk on your dt then. The hunk
> > that registers the dead battery and supposedly controls the TypeC
> > connectors from qualcomm can be removed as it is not present on your
> > device. It can then be replaced with one that registers the proper
> > driver later.
>
> Just left as-is as placeholders, but yes, can otherwise be removed.
> Do not really affect anything otherwise.

Unfortunately, there is no such thing as placeholder. When your series
merges it will have no placeholders. Fold the contents of [1] into
this patch for next revision. This node should not be included and is
not used for these devices. This will drop the duplicate battery and
also allow you to drop your external rule.

[1] https://github.com/anatase-org/patchwork/commit/4b9fe35f55c78342b24c2ab309acc8dc38a890cf

> >
> >> On that topic, you will also find links to devicetrees for the X1P42100
> >> Book4 Edge there (via Ciscobugger). This might not be the same X1P SKU,
> >> but could also be worth a try.
> >
> > I had a quick look at your repo. In my initial attempt, I tried to
> > reference your upstream (not you) but quickly gave up due to the large
> > number of commits and dtbs.
> >
> > I only see a polling commit in your tree after it diverges, I do not
> > see a battery driver?
> >
>
> Plenty of old branches here, but README should always be up-to-date with
> links to all the patches used [1]. In this case, we just use the
> existing battery driver by Saddy [2].
>
> > I think the only realistic way forward for me is to wait for upstream
> > to catch up and only add support for my reference devices (the 14 and
> > 15.6) so I can flesh out my userspace until qualcomm starts to deliver
> > results on mainline kernels.
> >
> > I attach my current tree below [1], note it is very unclean and I am
> > currently doing fix commits. Once I get to a place where I am happy
> > with base functionality, I will squash everything send it as a series.
> > If you tell me that your device works with the drivers I wrote (note
> > the LLM assistance), we can synergize. I do not expect the typec
> > driver to get upstreamed unless someone more familiar with the type c
> > internals gets involved, as a lot of the changes go over my head. But
> > I think it is realistic for me to upstream the battery driver, unless
> > you have a simpler alternative.
> >
> > the drivers relevant to you are ene-kb9058 and samsung-emuec. If they
> > work with your laptop and are universal for these devices great. Note
> > that they are both interrupt based so the battery reporting changes
> > instantly. You can also take my dt for the 14 in for a spin or just
> > deploy my tree as a test.
> >
>
> Thanks for that link! Tested your np940xma.dtb + ene-kb9058 and
> samsung-emuec drivers on top of my tree, and they seem to boot
> fine on my NP940XMA as well. Battery monitoring displayed, and there
> is hotplug detection (for the charger).

Good to know. I will base on your V7 going forward and only do my
changes on top (removing the separate dbts I did thinking there was a
deviation). This will hopefully help you to push this through.

> > I am contemplating whether an initial series using DTs, then a
> > follow-up switching to ACPI is simpler for everyone involved. But as I
> > see the huge amount of dts, I start to get concerned. So I might send
> > my initial series that enables the device to boot using ACPI instead.
> > As you know, Windows uses ACPI to boot the device and a lot of the dt
> > i derived was from the ACPI tables I dumped in Windows. The DT was
> > important for me to get an initial bring up for the device. I can now
> > sync kernels to it in ~2 minutes so I can rapidly iterate.
> >
> > To that end, can anyone tell me why are we not attempting to use ACPI
> > to boot these devices and relying on DTs on the ARM side? I know that
> > traditionally for phones DTs are used but these are UEFI devices and
> > contain proper BIOS data for autodiscovery. What is the current
> > blocker? Switching to ACPI should let us drop all laptop specific DTs
> > by adding parsers to their currently DT only drivers. Am I wrong?
> >
>
> There's an interesting discussion for that here that's worth a look [3]

I had a look. Interesting discussion. So that's where Hans went. Good
to know. Great hire by Qualcomm. I will consider his points and track
followups for ACPI

Best,
Antheas

> Cheers,
> -Max
>
> [1]
> https://github.com/zensanp/linux-book4-edge/blob/x1e80100-book4e-7.2-14-tmp/README.md
> [2] https://github.com/Saddytech/Galaxy-Book4-Edge-linux/tree/main/driver
> [3]
> https://lore.kernel.org/linux-acpi/20260623145225.143218-1-johannes.goede@oss.qualcomm.com/
>
>

