Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41814CDDE5
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622602; cv=none; b=DipVxpuuR6IjpyyxE0SyQRl9xeQZl5UJSVocSRC33stkhDqCOsxTyFJhcuceW6/NWLmbO5Vw9l2MVPeOrMXynwdjfI/Nyw3OUq4/jb2yI4eHccAyZUhyCG7cMFUX68bZ7wRDyZhUIy/mSkTDCeuWWyWRf7PYM5FVOtXyDdzLKgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622602; c=relaxed/simple;
	bh=M27MaZh7uNSea4tklBHFnjOfJ/fhL04L1G35m+sSTdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=st+XCkyfydORPRT5duUswn+Rd07r1nA2sMfrIs9SxaXdxVvYQs/s1ZUT+q/tnYFqAbROVqyqtLqoTmsQs4fhEs9CkdBXDZD7RgYadD7eJexpfnphqdwhFiqfMpZnoqCSSWNSq9iE1Y3o9eAtg6MuWVgPrQ7p3E+z2zEW+aGibDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JT30UC1S; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JT30UC1S"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 1E98CBD488
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 22:09:53 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 45CBCBC2E6
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 22:09:52 +0300 (EEST)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id A804B20064F
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 22:09:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790622591;
	bh=M27MaZh7uNSea4tklBHFnjOfJ/fhL04L1G35m+sSTdg=;
	h=Received:From:Subject:To;
	b=JT30UC1SfG80LMxuH9YaLToqGNCSVFV7J8PcorEcGFIpfsweVeK11tVrc/uUlr6S3
	 FbSlC3J5Bl12eHxcbTZRLerwY1dy/5ly4s3TogT9cAZVSR0Ap4CQUPEkMjDdjP2FoO
	 CexjGYeYgJlKbp3UHgf7RBtEeH/FxGg730/PDtjJ00GbMAjAzULOeUDOUR13/Nf+jT
	 pHMVmAKC3k9qg/+76LOMOcn/wYnd2eTUbVg3JoxK6neqcdJJ+TXtZFfVQalEFrpAE5
	 EaVpMQZyM80+VP0/ebqOfCm95BxPsAo7xby8xs36R26jGPbV7eLLGQuly+5jylZAXZ
	 5dCLjlEru6TYA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.228.39) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pz2-f39.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pz2-f39.google.com with SMTP id
 d2e1a72fcca58-8807e5b8fa9so1985940b3a.0
        for <devicetree@vger.kernel.org>;
 Mon, 28 Sep 2026 12:09:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwtLyD0GIg2+ncmwDKwmqKh+d279ypa1BPSNc3ZawDqMopSBVS2JDhKyqNT+nvlTafRd8PkdnsTasEe@vger.kernel.org
X-Gm-Message-State: AFuF++nNV6U/gb+xldTACY7ztXlRoRPrn/yDpavhjokY03DlHhvB7Zls
	mpCXRKkcWWIWOhu2FUT5oYrNfNpqbNpT4v0tzYXLgHnVeN2mAg7L7Wn4KNWdmmzzE+K+FWzhW10
	0+2dHc/XvckvOk4NiWc/dVdFCKLmQb2w=
X-Received: by 2002:a05:6a00:950f:b0:881:622e:b404 with SMTP id
 d2e1a72fcca58-881622ec9e2mr5922881b3a.13.1790622590231; Mon, 28 Sep 2026
 12:09:50 -0700 (PDT)
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
In-Reply-To: <6f2e0c22-0be6-4daa-8ab3-28d92f41197b@cern.ch>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 28 Sep 2026 21:09:38 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGwccsppaCUETVJzNN8uGd8Pzujf9pz08SyHUQFKEOxCQ@mail.gmail.com>
X-Gm-Features: AclHuK_v9w0YXSZSx0g8Va5cCsEeDXtVXybBPr1g8CUrksUyT2o_myVNfPGRM4s
Message-ID: 
 <CAGwozwGwccsppaCUETVJzNN8uGd8Pzujf9pz08SyHUQFKEOxCQ@mail.gmail.com>
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
 <179062259190.388337.7728834551611369446@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 28 Sept 2026 at 20:41, Maxim Storetvedt <mstoretv@cern.ch> wrote:
>
>
> On 9/28/26 18:44, Antheas Kapenekakis wrote:
> > On Sun, 20 Sept 2026 at 20:41, Maxim Storetvedt <mstoretv@cern.ch> wrote:
> >>
> >> Adds devicetrees for the 14-inch and 16-inch hamoa SKUs of the Samsung Galaxy Book4 Edge.
> >>
> >> These use a common dtsi derived from nodes that were able to work on Linux
> >> from the initial Galaxy Book4 Edge DTS by Marcus:
> >>
> >> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
> >>
> >> combined with the patch series the Honor Magicbook Art 14, which shares device similarities:
> >>
> >> Link: https://lore.kernel.org/all/20260629154812.9066-1-mail@etehtsea.me/
> >
> > Links go in the bottom, Based-on-a-patch is not a thing, you may add a
> > Coby as noted in a parallel thread.
> >
> >> as well as a few more adjustments on top of that again to get additional features working.
> >> Special thanks to Jesse Ahn for helping expand on what would eventually become this dtsi.
> >
> > Hi Maxim,
> > I tested this series on a kernel with various other backports on two
> > european (norwegian market) galaxy book4 edges.
> >
> > Specifically, the 14in NP940XMA and the 15.6in (not 16) NP750XQB.
> > Specifically, the later is an X1Plus variant that came out a year
> > later with cheaper components. It does not work properly on either on
> > them. I was hoping that at least the 14in model would work as is but
> > no.
> >
> > My test devices have proprietary Samsung battery controllers
> > (ENE-KB9058) and type C controllers (Samsung EmuEC). Also the speaker
> > amplifiers are different. So the battery reporting, audio, and USB C
> > ports do not work at all using your DTs. The TPM does not bind either
> > but you do not claim that it does. At least they got me to boot and
> > for that I am grateful.
> >
> > Other stuff also does not work, but I am just listing the main ones.
> >
> > I suggest you change the -14/-16 suffixes on both models with
> > something more specific.
> >
> > The prior patches in the series look fine to my eyes. I did not A/B
> > test them, just pulled them in.
> >
> > Best,
> > Antheas
> >
>
> Hi Antheas,
>
> Thanks for giving it a test! I think we both have the (almost) same
> device, and your experience on the 14" NP940XMA (NO) probably mirrors
> that of my NP940XMA (IT).
>
> USB-C should already work for this SKU with the patch DT, but not USB-C
> hotplug (yet). For now, everything is just left as already set up by the
> firmware, so peripherals plugged in after boot will not be detected.
> Everything inserted before boot, and hotplug on USB hubs, should still
> be fine. Could you give it a try on your device?

Yes, that mirrors my experience. But without a TypeC driver you don't
get renegotiation. So no USB3, no fast charging, no hotplugging, and
no DP alt mode. I wrote one but it's still buggy and a bit too
complicated.

> Battery state monitoring should also be with the same caveats on both
> these devices, going via a separate protocol over I2C instead of
> following the other X1Es. There is a separate battery driver for this,
> and also other useful patches (like the webcam and kb backlight)
> downstream. For now at least, only the features listed in the cover are
> included here, but our repo linked there has pointers to the other
> relevant patches needed for now.

I did not find a battery driver so likewise I wrote mine. I think the
battery driver is more upstreamable than the TypeC driver. That will
take a lot of work.

But it also means you have a spurious hunk on your dt then. The hunk
that registers the dead battery and supposedly controls the TypeC
connectors from qualcomm can be removed as it is not present on your
device. It can then be replaced with one that registers the proper
driver later.

> On that topic, you will also find links to devicetrees for the X1P42100
> Book4 Edge there (via Ciscobugger). This might not be the same X1P SKU,
> but could also be worth a try.

I had a quick look at your repo. In my initial attempt, I tried to
reference your upstream (not you) but quickly gave up due to the large
number of commits and dtbs.

I only see a polling commit in your tree after it diverges, I do not
see a battery driver?

I think the only realistic way forward for me is to wait for upstream
to catch up and only add support for my reference devices (the 14 and
15.6) so I can flesh out my userspace until qualcomm starts to deliver
results on mainline kernels.

I attach my current tree below [1], note it is very unclean and I am
currently doing fix commits. Once I get to a place where I am happy
with base functionality, I will squash everything send it as a series.
If you tell me that your device works with the drivers I wrote (note
the LLM assistance), we can synergize. I do not expect the typec
driver to get upstreamed unless someone more familiar with the type c
internals gets involved, as a lot of the changes go over my head. But
I think it is realistic for me to upstream the battery driver, unless
you have a simpler alternative.

the drivers relevant to you are ene-kb9058 and samsung-emuec. If they
work with your laptop and are universal for these devices great. Note
that they are both interrupt based so the battery reporting changes
instantly. You can also take my dt for the 14 in for a spin or just
deploy my tree as a test.

I am contemplating whether an initial series using DTs, then a
follow-up switching to ACPI is simpler for everyone involved. But as I
see the huge amount of dts, I start to get concerned. So I might send
my initial series that enables the device to boot using ACPI instead.
As you know, Windows uses ACPI to boot the device and a lot of the dt
i derived was from the ACPI tables I dumped in Windows. The DT was
important for me to get an initial bring up for the device. I can now
sync kernels to it in ~2 minutes so I can rapidly iterate.

To that end, can anyone tell me why are we not attempting to use ACPI
to boot these devices and relying on DTs on the ARM side? I know that
traditionally for phones DTs are used but these are UEFI devices and
contain proper BIOS data for autodiscovery. What is the current
blocker? Switching to ACPI should let us drop all laptop specific DTs
by adding parsers to their currently DT only drivers. Am I wrong?

Antheas

[1] https://github.com/anatase-org/patchwork/commits/7.2.7-an12

> Cheers,
> -Max

