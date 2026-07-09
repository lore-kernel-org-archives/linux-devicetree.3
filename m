Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E80741225
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 00:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783555940; cv=pass; b=X9xYAcPGzxGBy4UHyfLB6KfwUNLaOz2Ynpr6VthhkXCA0Qh5UYZSsV8V+xTDY6DaKjhN9/Bva3EEMGLZWth+/ay9Or9qmmZQPFr58ewul3F6RbmONSPScLl60eSoHxIhpJNQH1FQQy5R1X8k6E5Ms3b78HILWQBQytbZXefWbxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783555940; c=relaxed/simple;
	bh=ujm2++fOaQbhOA4MmQSTLdq4gprqLzthH/E1smRUGkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrqXTtTsST9i9k2z9Kk1vrgJKV7Hvc9JD3+rScBNAV/jgll+Dtl12mEzHObq+Hs8fEhGCX95dnrYoDJBmZUMaLhdK8vjWWr54ntjY4/PCHpXYknKIdEzkG9qRhB0tIOHObFz7WaGv+t/DkS0hC+DhIfvAjNVM2Bjq5FXAYFy3Hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qt3TwRYI; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qt3TwRYI"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so2090781a12.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 17:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783555934; cv=none;
        d=google.com; s=arc-20260327;
        b=QTocNaqWMuzDEuxj398vDYWV7WpNjmtuIl8ncGzHOypybSF1oSgvhsaGQNEX+S/mgD
         lWQcAtKq7vKF/+h2xfKwowXPrbh3tpfZgd7zJfqYL+qmxAluW8eEQKJqYwqc44n3HL2G
         kcPSphpxtL++uJJTfJSOLdhIOAdKwti+SAEJridmEmGUufRXyLK4AWBzU7le2MIfLqyM
         sHnrEDp7Km8TKK9U57BLkdAfI0a60Ga3NEP1jvJBCpr/CuRTnEryCs2Uy1gBxTCB5poH
         Jnx6AMtL3MA9B6WInRmqq2i/azV0E3ZEhQ9T9izyWfgPR6f0bZdliu2cRWvVOl94zBCA
         YCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ujm2++fOaQbhOA4MmQSTLdq4gprqLzthH/E1smRUGkc=;
        fh=hUUUYy7CGEaHlBtjnszEecf+7Eb5EvlVJYC5iXBSMuM=;
        b=iRmrOhQd5jkawMerpiMvs1qlk5JOQvGKV75GLuadry3b5XogQkfjqfCVTzAUB3H90J
         j2TYWQuVSrYa2ECu3+prPnCyTbJCcWDztlpiVQ/l0UNzYt3M2eQuaDIPeSySA0S/ODIW
         4uouLTxbAjZHiaPs+SOIGcThsJGVhzC1NyjiCZvn3J/P0a9ZLF0dtq/TB5nE4cXHDbsq
         bcI14eNZd/c7OCtFxQ3AoZjtqa6iCQuzhgZjjcb6K0BgcilavjYHwVai8w+3YXzOjXKb
         k9wCCAMK+5TZH5K1mD8bV8MvVpPsZwJkz67rNwc9cgWqjV6GGVapeEYfium5vAbBxjLL
         /zig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783555934; x=1784160734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ujm2++fOaQbhOA4MmQSTLdq4gprqLzthH/E1smRUGkc=;
        b=qt3TwRYIa3PItGFz0tFZLXGdX3sZE9cSPw56o0roOXRkhG/ZPldnHxqAXG/kX9ANKY
         qGKgoV//5dFdsacUcB/J5JtYgEvNf/pkr5r4aJZB+omMDGZWjxAHv79AMI8larIDXbQh
         s05zYnYhV6f1wnxBGEBygS63tBVzRGbBZ9BIlZ9TzDL2sLeRZRWOGV/diqDEm0SR8/eo
         eFR/uVQFW2xyXyBI5mclyB3/qfCZW558C2HcxvclZmr88SaxcFXyOYxqPsKDBVokt53T
         hb6GCUmwv8XcV4tM5eM8PXx6aDJcWH8dJC2gfUHWL+lP5Frh5VwHco8O5m1OW7bxgKcE
         Q84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783555934; x=1784160734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujm2++fOaQbhOA4MmQSTLdq4gprqLzthH/E1smRUGkc=;
        b=FQf+TepaTuhA4HN1Jjmn1TnYLwFNNOidy2107191IOMx77N+yvKKCFG+3wgMyHl4g9
         XfzeLA3ooCnzKA8iEDc+ffSiRY7QKTwkuFDOUF/s5EV6I8FKGDv5+Q8itfbu4sv2UYfz
         8hGJANjEM9ilQpGcCNPgNpOuJrvNLQ5EZ5N0K3FmQpPkRI3E8J2h9GuMXcrCMDccyYad
         CpMLXWGBQhk6gQG9JgzqUj+t4fmpApceNxo2ossoRnn+MGhceA8qeI1oAC+tw6NxSobe
         YWJdaBbqb56zUknX389d5dU8Y344wn9XlFI41cdEGJ3znc2NQfLhauSxMsLvuZweiXYp
         HEpg==
X-Forwarded-Encrypted: i=1; AHgh+RqgmUV4cpnXUyvJLZbuhRXNdHA8Azt0eAlco4Q9fPF5eXwQDTe03HO2uyonvv/rDiFXTMr7wZM4vb59@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7B0hsp+k1r0BmRCw8oYfsrgR0MMu2cFuMOH0yYUANS/OUPcoi
	Hr+ZNwkDL7l1afAiolPsX3tV3vwwUSMMyuFR2mdeYsWVyeaz3uOaiudIcbPrfPSPJdcNGEcA7T2
	70kULC08I/6Oai3Cpecu1Biopxmi6yxc=
X-Gm-Gg: AfdE7cmDiTzZfK/5t920dggGz6asmI69X8n/ItlPx4Dev1G0hYi55nOfC5zt/80UtjT
	eej6jxrh5lq+Hd4PgHO6S4mmmuL/7MCmpLAD4X0Iqir51TJw9+cdskg4yxTlhq+dDVzy4sp47ZG
	rGAEChKJzaLoCFqwrhZEhkLkKfa5mX/Mto9tFD/WaHiafMEH7JQi4yTmNazF70XBolasUCSljJn
	bjZz0yJP1rQy9txrXM+uQfmiGzLWqajA6Ql3D5IPaCn1Hkh+jq9koZ0vrE6VycSV9jYA35jV7fE
	L1sX/Y4tayZY+KFjzxFARS0XI1rjH7N63t2YWaMt
X-Received: by 2002:a05:6402:4283:b0:69a:b3ab:dbea with SMTP id
 4fb4d7f45d1cf-69ab4460cf7mr1758244a12.13.1783555934141; Wed, 08 Jul 2026
 17:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604135255.62682-1-midgy971@gmail.com> <20260604135255.62682-7-midgy971@gmail.com>
 <e44b506e-e9d2-48e3-acea-ab28b7be9b37@rock-chips.com> <CA+GS1Y16++cztPxdUGLrPA73ENm4vJGFrjm-jP8r=8OQqcMJGA@mail.gmail.com>
 <0919ffcc-81c3-483a-a3ba-404b455c2040@rock-chips.com> <42f1f39f-ab2b-4473-a82a-7ccefad41fcf@rock-chips.com>
In-Reply-To: <42f1f39f-ab2b-4473-a82a-7ccefad41fcf@rock-chips.com>
From: Midgy Balon <midgy971@gmail.com>
Date: Thu, 9 Jul 2026 02:15:34 +0200
X-Gm-Features: AVVi8CcApkElNM_3Z1d6_PvamEAEJfcZGBI9cxUob9-qJkpZOuLDZsOO_EVsZe8
Message-ID: <CA+GS1Y1i87vkv+9NAdqRGNCNsxjQwat2yqEFxjgDZRAPsQjaQA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/9] iommu/rockchip: Clear AUTO_GATING bit 1 on the
 RK356x v1 IOMMU
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Simon Xue <xxm@rock-chips.com>, tomeu@tomeuvizoso.net, ogabbay@kernel.org, 
	heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chaoyi,

Sorry for the slow follow-up =E2=80=94 and thanks again for the pointers, t=
hat closes
this out cleanly.

I read the two rockchip-linux commits (7f8158fb, 6a355e5f) and the merged
patch you mentioned: "iommu/rockchip: disable fetch dte time limit"
(Sven P=C3=BCschel, From: Simon Xue,
20260428-spu-iommudtefix-v2-1-f592f579e508@pengutronix.de), which Joerg
applied on 2026-06-02. It adds DISABLE_FETCH_DTE_TIME_LIMIT (BIT(31)) and
does exactly the auto_gate |=3D BIT(31) read-modify-write you suggested, in
rk_iommu_enable() before paging is enabled, for every Rockchip IOMMU. So bi=
t
31 disables the DTE-fetch time limit (without it the newer revision blocks
after four consecutive master DTE fetches racing the CPU's IOTLB zaps); the
RK3568/RK3588 erratum is the same one as RV1126/RV1109. That's the accurate
description I was missing =E2=80=94 thank you.

Since that fix is already upstream, I'll drop the AUTO_GATING change
from my series entirely rather than carry a
duplicate: v4 will rebase on top of it and the NPU MMU picks up BIT(31) for
free. For the record, on the ROCK 3B the NPU IOMMU services the NPU's reads
with zero faults both with BIT(31) and on the reset value (0x3), so this is=
 a
no-op on my hardware/workload =E2=80=94 but rebasing past the merged patch =
is the
right thing regardless.

So my v4 IOMMU dependency list becomes: your per-device-ops series, plus th=
e
merged "disable fetch dte time limit" patch. My series no longer touches th=
e
IOMMU driver itself.

(The convolution output is still uniform zero-point / the job times out =E2=
=80=94
that's the separate NPU compute-completion issue, unrelated to this.)

Thanks again, and kinds regards
Midgy


Le lun. 8 juin 2026 =C3=A0 05:40, Chaoyi Chen <chaoyi.chen@rock-chips.com> =
a =C3=A9crit :
>
> On 6/8/2026 9:45 AM, Chaoyi Chen wrote:
> > Hi Midgy,
> >
> > On 6/8/2026 5:05 AM, Midgy Balon wrote:
> >> Hi Chaoyi,
> >>
> >>> As I said, it is v2. Could you please try using the code below instea=
d and
> >>> see if it works?
> >>> [ auto_gate =3D read(RK_MMU_AUTO_GATING); auto_gate |=3D BIT(31); wri=
te(...) ]
> >>
> >> Thanks -- that's clearly the right shape (read-modify-write, before pa=
ging is
> >> enabled, keeping the reset value instead of my clobbering 0x2).
> >>
> >> I rebuilt v7.1-rc6 (with the rocket RK3568 series + your per-device-op=
s work)
> >> using your bit-31 version and tested it on a ROCK 3B: the NPU IOMMU co=
mes up and
> >> services the NPU's DMA cleanly -- the NPU probes, attaches its domain,=
 and runs
> >> repeated conv submissions with no DMA_READ_ERROR and no page-walk stal=
l. No
> >> regression from the write.
> >>
> >> To be precise about what I can and can't show: I tested both ways on v=
7.1-rc6 --
> >> with your bit-31 write, and on the reset value (0x3) -- and the NPU
> >> IOMMU services
> >> the NPU's reads with zero faults in both cases (no DMA_READ_ERROR, no =
page-walk
> >> stall). So I don't have a failing baseline here that bit-31 visibly
> >> fixes. Is the
> >> AUTO_GATING write needed on current mainline, or only under conditions=
 I'm not
> >> reproducing (a particular traffic pattern / silicon rev)? I'll keep th=
e patch in
> >> your form unless you'd prefer to drop it.
> >>
> >> One question so I document it correctly: what does bit 31 of RK_MMU_AU=
TO_GATING
> >> control on the v2 block -- is it a master "disable internal auto clock=
-gating"
> >> for the page-table walker (i.e. so a TLB-miss walk's AXI master keeps =
its clock
> >> to completion)? The RK3568 TRM I have doesn't cover the IOMMU register=
s, so a
> >> one-line description would let me write an accurate comment.
> >>
> >
> > Glad to hear this works. Please refer to the commit below.
> >
> > [0]: https://github.com/rockchip-linux/kernel/commit/7f8158fb41b5cc8e73=
8aaeebc3637c50ebd74cae
> > [1]: https://github.com/rockchip-linux/kernel/commit/6a355e5f9a2069a230=
9e240791bc3aad63b7324e
> >
>
> It looks like RGA needs this patch too, and it has already been merged :)=
.
>
> https://lore.kernel.org/all/20260428-spu-iommudtefix-v2-1-f592f579e508@pe=
ngutronix.de/
>
> --
> Best,
> Chaoyi
