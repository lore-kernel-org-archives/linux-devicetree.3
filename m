Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D290396D2C
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905768; cv=pass; b=GaYQQiSisQ5/0LD3oYsh1j90JBnLCHG1fx23JQIrWAdpv0bTk8nFEu8Om+UD6DiKnCBzVn/NyDlJya+a6OwxL56jRXlq8GXEht7k+exTi02kyRq4pYNl9j+CiisKncrwtkt7mw0U2DqJJknkf0TgykS7POPFILG6/VRKrsOwS3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905768; c=relaxed/simple;
	bh=L+PASBKZU5VOSi5OLxHETsujAKlLOtM0nYg9yVoQr/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nas0tYUNijdScw2Dso7jr5SyjdV9Tfakr6RGZemq4tUaPTJGsCeSbeCf7BRX7BEIo0JSjnlVEmX9Lp6oBjG3fPZma6DAFuptMq1njQQSQsXOxNAbsm9CD9pY9Q2bUWQal3WRlDpegaUOnTGOl1GGqx6fzyiyd4Ad5hLjKVUtryQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3mUZx+b; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3mUZx+b"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec429c2bb1so568334466b.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 01:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780905765; cv=none;
        d=google.com; s=arc-20240605;
        b=XusyA5XqI6NKjxDR+0pTqPSnFhnWmL63mpDVGVt1xLmB4Sa9bU/X2SrNx3+eymZsT5
         TLU0lp5gkrKTE2z2IysXdXcgao0kyWzyBd6hKtJwE0EPaR503A4R+3WyNNacc1MyOKON
         LYRSYJK31BzKOMt56h6fRnoe+NP/Qg7jmtQrY/RAKihEK7IFLG2L+T5gfyaZ4Mj2GYjV
         vk6kOy8fXnJqJut4V3UKNwGsBleSNNVUFS6K0xSTsExUM3/dTK/fkcg35db/TZ0cGgPt
         AoJfQUyVzriYUFMUbEVnXIKXpKeueKMjzNnSFTgIi8+6miGKVzhX11GocceO6J38BSSb
         RbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bLq1D7uP5MxHvai6FqrEhNmJ5qKAoR2b/ce+Jxe1kds=;
        fh=7g46qar8gXXV1fuDH4fN7bxddHi7lBV/aQYTGQ/orXg=;
        b=Op0eNmABdZjVPCDWlTVEhjNYwxlYtfC50fGv3PguD4OFT71HV3ADw87lyipXs+c+l6
         yB2OUf4riMz+pQcSRgzFIqUjWUJvZGFBfqazlnpsQjlCrBk7I87b8Netl8lP0QBJwLzs
         ZYiRbl+/ZIKYbSZNmtToi4u/wKWO+biMY0EaA2kKG8J0cPHNZNEhtCa4gl42mWbp8BIs
         9A9i1HhZXoqobFE8y/PFmn3qHGQLHpXO6/6iNlNces7HVYQQYhvXHhtBRpkeb8cL6Lfz
         5DMfNaZHkn6TrZK/gkv4lOzjtjVtWigR75zpUX64uIPDtczulpSKNAsszyc9hLfxGYPM
         AcIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780905765; x=1781510565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLq1D7uP5MxHvai6FqrEhNmJ5qKAoR2b/ce+Jxe1kds=;
        b=I3mUZx+bUK6WAj95ROGBkhZJT797XM1i2nP9SuhjRZn4XHakc9lmFtvHt0j1wUpPLj
         lgciAdF7dJwOrmcaA/qbc+mBcDzHjPa3R+dhn9s7r5pcZ0WUf+NvCvBI44vApAvn3/il
         sBP3wTvrYUWUvMdaX7/G+/mZ4u64pS4apKLwhf5wArbZqaMhBG9EPbAkV2auUFwyVXLn
         R4o7xSLJzOT6z2rf77FRWapu6od33LGC3n4Ftc1Qa7FboLYnw5BqDIIlKbppMP37mPel
         0FG93sb7SqnIl23uMU/197sphtuIOUR4bzvdv+GbNcS1DgvGJAPEue0g9jUy7GH0MfQo
         v2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780905765; x=1781510565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLq1D7uP5MxHvai6FqrEhNmJ5qKAoR2b/ce+Jxe1kds=;
        b=cMHDADpEYO2BHyTJ/BPpDFQT9A9mycPlJ/bxTkwGeX9PwKElybpQZcPcUiOOPYKY1t
         ffpo0j5QEeLVxq8WFIoFRtzkWh/JUX6TmrzpjVaDfm1bzqaduoKC+40jqXUlNxah5mAZ
         W1kL62D3jNYCvVLB4qZjIqgj5q2YoV0Vfoexco4nS0M3+/BuXexIDq1vDruFKkijMBKa
         mNFYQxVkGh0IP8Is8ABhqALfCG/6UFJDrTC68lX7LdKykmoh0ed+xxY4RUqwt11UrSQq
         yT4IXGMwEbr1kcKkVtJz2vPCIgNpu++kHAYFukDNsSH2bcRtbRu7Uwj4Fr9MPw6UFJRH
         pYmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rWoA5dllVl4Lf3KrpEkYIraI0EwenjuMyrVIASmSiDksJCgZP5eUecqVFFoX1lgpSHklz8k9l0tph@vger.kernel.org
X-Gm-Message-State: AOJu0YycfyWqMHwySSWhuNTJefi44F2tL9rKJGrjxhjBz8bDOQ779b+G
	v+9geYuiWRvkn2X79pdKNFPOwyaOGfg1LLLIpT5yxopZousolL+4Onbj/xtPiKNVDF9SxqsxhlA
	su+6J8R6kLkKcpvDnzWaDTuk5WGLeixQ=
X-Gm-Gg: Acq92OFgaumq20ZghyPgrkfKN3RHlB95mj/YUtk4Jrwnxi8ulSzPWeFLFcpRbMuBJW4
	smCNPxJaVqbL4eAWD3nh7IGRrcjo5ZEEP1wxklqwpUGlc7AmXXcJX8QD3mgJXSa2kUAE0Uuhb61
	X3sssdKpfXcDyMbZIpb4eCYlHyJuqqEwsoEtoLQ+PRFk7KAIYIxHwU9Qzxt0fxt+FsMDX+2gjXJ
	gZD6bQ5FEZZ0JWhPAVT7P9dV6avNA+4081746JFzyT1chS52M49QmgoQSSDKV87arnIc/dTzh6J
	o78vSJk6mTekOFqu6g==
X-Received: by 2002:a17:906:8a46:b0:bec:4b96:5fb9 with SMTP id
 a640c23a62f3a-bf3701806dcmr422529166b.3.1780905765057; Mon, 08 Jun 2026
 01:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604135255.62682-1-midgy971@gmail.com> <3d99569e-9c3a-49d1-93fb-1335382523e9@rock-chips.com>
 <CA+GS1Y1s78PwN63X2YJoS8VEGp7CpTERo_K65yKs00U4VRAw4Q@mail.gmail.com> <e5058919-9485-4de5-8eea-331ebfc2987c@rock-chips.com>
In-Reply-To: <e5058919-9485-4de5-8eea-331ebfc2987c@rock-chips.com>
From: Midgy Balon <midgy971@gmail.com>
Date: Mon, 8 Jun 2026 10:05:33 +0200
X-Gm-Features: AVVi8Cc-kS2uobepJQqeen5fwApM6uunQz9mBN_BXk5X1LlYp7Vi43yabrw2ZY0
Message-ID: <CA+GS1Y3ysdWZ3qCq3ip_Pbw+v4LxHZd95aBo=jwB+orYaMBBNw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/9] accel: rocket: Add RK3568 NPU support
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: tomeu@tomeuvizoso.net, ogabbay@kernel.org, heiko@sntech.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Simon Xue <xxm@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Chaoyi,

Thanks -- this is exactly what I needed.

- v2/DTE: will do. I'll keep building on Simon's per-device-ops series -- w=
ith
  that in place the NPU MMU can use the 32-bit-DTE ops (the per-ops GFP_DMA=
32
  that's already in mainline) without the global rk_ops conflict. I'll
keep it as
  a stated dependency of the v4 cover letter.

- vdd_npu:  I'll switch the RK3568 NPU
  power domain to need_regulator + domain-supply =3D <&vdd_npu> and drop th=
e
  regulator-always-on workaround. I suspect that's also the right fix for t=
he
  power-off/on de-idle issue I described -- the always-on was really
just papering
  over the domain not being modelled with a regulator. I'll confirm on
the board.

- AUTO_GATING: thanks for the commit references -- I'll keep the bit-31
  read-modify-write form with your Suggested-by and write the comment
from those.
  For the record: on v7.1-rc6 the NPU MMU also completes translations
on the reset
  value (I couldn't reproduce a page-walk stall without the write), so I'll=
 note
  in the commit that it matches the vendor clock-gating handling rather tha=
n
  fixing a failure I can reproduce here -- happy to drop it if the iommu
  maintainers would prefer.

- PVTPLL/NoC: I'll follow up with Finley. First I'll check whether the
  need_regulator change resolves the NoC re-power de-idle on its own;
if it still
  I'll bring him the details (the genpd power-on de-idle ack and the
  BUS_IDLE_ST state).

I'll send a v4 with these. Thanks again for the quick, detailed answers.

Kind regards,
Midgy

Le lun. 8 juin 2026 =C3=A0 03:40, Chaoyi Chen <chaoyi.chen@rock-chips.com> =
a =C3=A9crit :
>
> Hi Midgy,
>
> On 6/8/2026 5:03 AM, Midgy Balon wrote:
> > Hi Chaoyi,
> >
> > Thanks a lot for looking at this -- input from Rockchip is exactly what=
 this
> > series needs.
> >
> >> Hmmm. If I understand correctly, the NPU IOMMU should be v2 rather tha=
n v1,
> >> implying it should support 40-bit PAs. Nevertheless, please note that =
the
> >> upper limit for DTE is 32 bits.
> >
> > Understood, and that 32-bit-DTE note is the crux of the trouble I had, =
so let
> > me lay out what I see and ask how you'd prefer to solve it.
> >
> > The mainline node is already v2 (rockchip,rk3568-iommu in rk356x-base.d=
tsi).
> > The problem on this 8 GiB board: with the v2 ops the page-table allocat=
ions
> > (gfp_flags =3D=3D 0) can land above 4 GiB, so the DTE ends up > 32 bits=
 and the
> > NPU's first translation faults with DMA_READ_ERROR. To work around that=
 I had
> > switched the NPU MMU to the v1 compatible (rockchip,iommu), whose ops s=
et
> > GFP_DMA32 and keep the DTE sub-4 GiB. That works in isolation, but beca=
use the
> > driver keeps a single global rk_ops, a v1 NPU MMU then trips
> > WARN_ON(rk_ops !=3D ops) against the SoC's v2 instances (VOP/VDEC), whi=
ch is why
> > I based the series on Simon's per-device-ops work.
> >
> > So my question: with per-device ops in place, what's the intended way t=
o keep
> > the NPU MMU on v2 *and* cap its DTE at 32 bits on boards with >4 GiB of=
 RAM?
> > A v2 ops variant carrying GFP_DMA32 for this device, or is there a regi=
ster/
> > config bit that constrains the DTE address? I'd rather follow the Rockc=
hip
> > intent here than carry the v1 workaround. (Simon, cc'd -- this is right=
 next to
> > your per-device-ops series.)
> >
>
> If Simon's method works, please use it :)
>
> >> Can these operations not be completed via the pmdomain driver?
> >> If some operations are controlled by TF-A, are you using open source T=
F-A?
> >
> > Most of it is in pmdomain already. Power-on and NoC de-idle are done by=
 the
> > RK3568 NPU power domain (genpd) at power-on -- the driver no longer pok=
es the
> > PMU directly. Two things remain outside it:
> >
> >  - vdd_npu: I mark it regulator-always-on in DT rather than wiring it a=
s the
> >    domain's domain-supply, because as a domain-supply it created a devi=
ce-link
> >    to the I2C PMIC (rk809) and genpd's power-off QoS-save path then hun=
g
> >    reading the NPU QoS registers behind the (gated) NoC. If there's a c=
lean way
> >    to let genpd own vdd_npu without that I2C ordering deadlock I'd much=
 prefer
> >    that -- pointers welcome.
> >
>
> Please refer to the patch below regarding the RK3588 NPU pmdomain.
> In short, you need to set a "need_regulator" for the RK3568 NPU pmdomain.
>
> https://lore.kernel.org/all/20251216055247.13150-1-rmxpzlb@gmail.com/
>
> >  - the NPU compute clock (PVTPLL): set from the driver via SCMI, and on=
ly
> >    needed for actual compute, not for bring-up.
> >
> > One more pmdomain observation from testing, possibly relevant to how th=
e NPU
> > domain should be modelled: the domain's power-off/on cycle doesn't reli=
ably
> > re-de-idle the NoC. If the NPU is probed after genpd has already powere=
d the
> > (unused) domain off, the power-on de-idle fails ("failed to set idle on=
 domain
> > 'npu'") and the NPU IOMMU then takes an external abort on its first MMI=
O access.
> > Probing the NPU before the unused-domain power-off, or marking the doma=
in
> > always-on, both avoid it. Is the NoC de-idle expected to work on a genp=
d
> > re-power here, or should this domain effectively stay on?
> >
>
> Not quite sure what's going on with PVTPLL and NOC.
> Maybe @Finley knows about this?
>
> > On TF-A: yes -- bl31 is built from upstream arm-trusted-firmware
> > (github.com/ARM-software/arm-trusted-firmware, RK3568 platform), provid=
ing PSCI
> > and the SCMI clock service. The only closed blob in the boot chain is R=
ockchip's
> > DDR init (rkbin), which is the standard situation for mainline RK356x.
>
> --
> Best,
> Chaoyi
