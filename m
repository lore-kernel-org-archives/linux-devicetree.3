Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E6228727D
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780866025; cv=pass; b=V/irYi159e3f4B4pqwJXca63QygrE0K2XNrRjeypEr6F+pDICMnZwTa4oZA7omizo7S/cTQ6dgNIy5ePeUqhcu/grQSSa8H6IUoMKkSk9iEf+iKjlCmhBYVy7w07FYZ4N21r8kYg3CdDErBeNu/1AWapmH0j0AqscBryBIZPjyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780866025; c=relaxed/simple;
	bh=G+HvROUFtSgMmsk49gO9w19nLvoqyb3fxbxS9M8djJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+YPWrl1YBbkTySavhcwf0osrPW6WDlUUCh1oGPonLNqAd6qRpmHZv4Vzwe2atRZSOP8A1dvujqMo3jn1CcRaiAFNDT3DoADcmvkbjTOOCiJ+GI/WqQWempb7IhfgpWHCXHsx+u6PkxWODmyWVwqQ5EKVlvnymkwTm6TVqpDQFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3BXuMjS; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3BXuMjS"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bebc80100efso387492566b.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780866023; cv=none;
        d=google.com; s=arc-20240605;
        b=OPV3O2cU32lyUeDg7lzfw5Y4PsreyfXpKzq3ujkfV9R1MDMDUsfY6DhN+jIJyPKzRC
         8Zq02T9wDqzltBH/xW3/wyStRsT9PXv1EWpZ+WBVe8rIyNKl6ok3T+wrlFJNrLRyPGKp
         NEigbhIUTUWTXHLuf89o+tBIIf+SIpjluUJCJmI1Qb6KbqxiI9uED7UApKHcq9Odd5s7
         FReR8l7cgLvMTJyfOum8aAGULR8y/tMJ1fIc0bEIQXCPgVQ/GEXHyDuJjxedVmcRDQvo
         ljzOVQNzwrrvdtzgmgvMce+Hs+xoKOeR2eGud9+9/mjQNEKp1JQHxoNA2QyZB8oi4unX
         1cOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ab6NkRbgO8MmT1srYNgG1RYGxHSJUAoP80C+AxzOUBY=;
        fh=kKpQPO/D4PtYkqkmv2VVJiGw9xR0NPia164XrtEB/SY=;
        b=T0TrVe9mkZx+WAAf+uo4HBbep4x45MaxogwgQsxKllUDiK5nlA+ZzHTUk+wbGtVBdL
         m0dht5VnWIGJ0rHcIcHk+8HDdCxZGZH3D2iIIT2IKjVSGxGxzUDVL/yq4JDreir276Tz
         wu3Gr1FIkQKslw5a0KyUX+0SBUZx0Yfv2kpF9uskC+QjGPmUkcgyfZI+ZAnimB/wOC4L
         RUt8UEBw6Y9fM6NYrYkm+D4B3Cym+ZnwCSXk+oStPxhEk1x7bU7S9+KsTaDelRSW26F3
         SUuM1vJK2QSsmqTJGUORUSyjEmA5MBv7NP3xVquTA4Bb4/pDotz6PKkb1rQFWyZ/Ctlo
         spmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780866023; x=1781470823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ab6NkRbgO8MmT1srYNgG1RYGxHSJUAoP80C+AxzOUBY=;
        b=R3BXuMjSlMT+xRaaYYGCWTT/Uu43vgjeF3pueSoihDL5xsn1o30vUgCcn17EAH/sta
         pweHcVKR2hUfYPVr1LTRKKlyG9ZNMy4otYqf3D9E4ShzWxl/vDCyLS/9qOeEcxOzocIo
         JMXXCdmmrJj9Q3TxgGB5aMZgs07N1OXN3TTx/g6sWPQj0xpGBoGYa3IE1h0Be5Hx/jaq
         RCFjzudml096kPaj3S1jrT+oynrq8KWJXQPvyUKLF8NEiL9dsS+DzQd7d5Skz4lSYS2y
         aYOW84wFxBmVOAfYGLATeaWyaKpsYrkt+M88OyvpRx+iRuJLAsEsZl2P6hOTcbmrnTgP
         tpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780866023; x=1781470823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ab6NkRbgO8MmT1srYNgG1RYGxHSJUAoP80C+AxzOUBY=;
        b=oeD1fGIw0tIff2/8uKkNTV6l8LTtgIGkDEWCXPivuFpbat1uyfQSDTiQX5zeCIK/bN
         C8Z3XHt1wIfIJQD7STR0juTcBIEfXECYJ1hnn/PRD0EOwDZYXuv81Eonw5fNOo877IOM
         O92dnxb83N6CRglW89TzFsaKi2Br59w5gCFyvf7G6qDrPnmYWxpAYVjicyKFCZV61+Sm
         ae9uPw5T02UT43Ll+ek0xf0dgVq6xwrZ+68YcwRpaUMHJW6eXVIvtaadXEFER30wCmce
         xznYTvpXRQL8XYjbRQJ+sjSuLhmP1wQiRYvtTEA+OwAogSCtp4z1enxgOuHQ4NCpnFQ6
         IWEg==
X-Forwarded-Encrypted: i=1; AFNElJ/zicIUG3zP86e+/Xi0MV9zcFzCOEJEIuAaYrNSIrMicSogaext99pVEnUVAl4LyBGMloabJZWOCK/J@vger.kernel.org
X-Gm-Message-State: AOJu0YzunjYjn6YlNLtjXEnvL/kMMAVjfqHOkRsCvMiqprOPcTij8qvA
	nBdjMM3ouL1dKMrj3Tmau8mF+Anhwdvxk8MgQIzIAGiMesZps9ZfUKUWWDjPOZ26LzIIwM8qeMg
	AuMY3fGNkU0R4KtcLPVGubhJAm+RA7c8=
X-Gm-Gg: Acq92OFQ3p9N7CZ39pFA2jp0c5HWpDYGkdkaAmOTsowV0TVTX3H5AEeEf3EGPRr+1b4
	8lKecaut9iQt8gz/yMHXEQfY9CvPoqlMvuW/f+5ot5fuokjGk/I6yd2ibIftGhZwPP5+HCubrzl
	z8NDo8WLJVhsTTyilN4R6yywOjMiUCAms8OUFi918ulJdlpObUq0hL7QXBunhFoXhB7i70X19U3
	0NeDV7l/FkMMvFQ+Kg1dW1LdXOWYlrbfyc3/zxfIITFwqWFo94RxkjZW2a/iCyySKRAYjmuHPR4
	BW4et+lDOGiFag65od9r2Jug4+lTKeks1fNzf6jDajDY69QPIYUJWauFNjAJVQ==
X-Received: by 2002:a17:906:8a42:b0:bb8:fdf7:e132 with SMTP id
 a640c23a62f3a-bf370a673a2mr449071866b.18.1780866022378; Sun, 07 Jun 2026
 14:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604135255.62682-1-midgy971@gmail.com> <3d99569e-9c3a-49d1-93fb-1335382523e9@rock-chips.com>
In-Reply-To: <3d99569e-9c3a-49d1-93fb-1335382523e9@rock-chips.com>
From: Midgy Balon <midgy971@gmail.com>
Date: Sun, 7 Jun 2026 23:03:08 +0200
X-Gm-Features: AVVi8CeDCIQ6l1Xo0XYKychXQqz8K96nj5PXcE7mUgH_L3ruXovyZGyMkFh5fkU
Message-ID: <CA+GS1Y1s78PwN63X2YJoS8VEGp7CpTERo_K65yKs00U4VRAw4Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/9] accel: rocket: Add RK3568 NPU support
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: tomeu@tomeuvizoso.net, ogabbay@kernel.org, heiko@sntech.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chaoyi,

Thanks a lot for looking at this -- input from Rockchip is exactly what thi=
s
series needs.

> Hmmm. If I understand correctly, the NPU IOMMU should be v2 rather than v=
1,
> implying it should support 40-bit PAs. Nevertheless, please note that the
> upper limit for DTE is 32 bits.

Understood, and that 32-bit-DTE note is the crux of the trouble I had, so l=
et
me lay out what I see and ask how you'd prefer to solve it.

The mainline node is already v2 (rockchip,rk3568-iommu in rk356x-base.dtsi)=
.
The problem on this 8 GiB board: with the v2 ops the page-table allocations
(gfp_flags =3D=3D 0) can land above 4 GiB, so the DTE ends up > 32 bits and=
 the
NPU's first translation faults with DMA_READ_ERROR. To work around that I h=
ad
switched the NPU MMU to the v1 compatible (rockchip,iommu), whose ops set
GFP_DMA32 and keep the DTE sub-4 GiB. That works in isolation, but because =
the
driver keeps a single global rk_ops, a v1 NPU MMU then trips
WARN_ON(rk_ops !=3D ops) against the SoC's v2 instances (VOP/VDEC), which i=
s why
I based the series on Simon's per-device-ops work.

So my question: with per-device ops in place, what's the intended way to ke=
ep
the NPU MMU on v2 *and* cap its DTE at 32 bits on boards with >4 GiB of RAM=
?
A v2 ops variant carrying GFP_DMA32 for this device, or is there a register=
/
config bit that constrains the DTE address? I'd rather follow the Rockchip
intent here than carry the v1 workaround. (Simon, cc'd -- this is right nex=
t to
your per-device-ops series.)

> Can these operations not be completed via the pmdomain driver?
> If some operations are controlled by TF-A, are you using open source TF-A=
?

Most of it is in pmdomain already. Power-on and NoC de-idle are done by the
RK3568 NPU power domain (genpd) at power-on -- the driver no longer pokes t=
he
PMU directly. Two things remain outside it:

 - vdd_npu: I mark it regulator-always-on in DT rather than wiring it as th=
e
   domain's domain-supply, because as a domain-supply it created a device-l=
ink
   to the I2C PMIC (rk809) and genpd's power-off QoS-save path then hung
   reading the NPU QoS registers behind the (gated) NoC. If there's a clean=
 way
   to let genpd own vdd_npu without that I2C ordering deadlock I'd much pre=
fer
   that -- pointers welcome.

 - the NPU compute clock (PVTPLL): set from the driver via SCMI, and only
   needed for actual compute, not for bring-up.

One more pmdomain observation from testing, possibly relevant to how the NP=
U
domain should be modelled: the domain's power-off/on cycle doesn't reliably
re-de-idle the NoC. If the NPU is probed after genpd has already powered th=
e
(unused) domain off, the power-on de-idle fails ("failed to set idle on dom=
ain
'npu'") and the NPU IOMMU then takes an external abort on its first MMIO ac=
cess.
Probing the NPU before the unused-domain power-off, or marking the domain
always-on, both avoid it. Is the NoC de-idle expected to work on a genpd
re-power here, or should this domain effectively stay on?

On TF-A: yes -- bl31 is built from upstream arm-trusted-firmware
(github.com/ARM-software/arm-trusted-firmware, RK3568 platform), providing =
PSCI
and the SCMI clock service. The only closed blob in the boot chain is Rockc=
hip's
DDR init (rkbin), which is the standard situation for mainline RK356x.

Kind regards,
Midgy

Le ven. 5 juin 2026 =C3=A0 03:36, Chaoyi Chen <chaoyi.chen@rock-chips.com> =
a =C3=A9crit :
>
> Hello Midgy,
>
> On 6/4/2026 9:52 PM, Midgy BALON wrote:
> > RFC, not for merge. End-to-end inference does not produce correct outpu=
t
> > yet (see Status), so per the v2 discussion this is a request for design
> > feedback. It now probes, attaches, and submits cleanly on a stock
> > v7.1-rc6 tree; what remains is one hardware-internal issue.
> >
> > The RK3568 has a single NVDLA-derived NPU core, the same IP family as t=
he
> > RK3588 NPU the driver already supports; the register layout matches. Th=
e
> > RK3568 differences are a 32-bit NPU AXI/IOMMU (vs 40-bit) and explicit
> > PVTPLL/PMU bring-up to power and de-idle the NPU before it is reachable=
.
> >
> > Patches:
> >   1-2  rocket: per-SoC data struct, then derive DMA width and core coun=
t
> >        from match data (refactors, no functional change).
> >   3    rocket: RK3568 SoC data + PVTPLL/PMU/NOC bring-up.
> >   4    rocket: reset the NPU before detaching the IOMMU on a job timeou=
t
> >        (the detach otherwise stalls a wedged AXI master and WARNs).
> >   5    rocket: keep the IOMMU domain attached across jobs instead of
> >        re-attaching per job (the per-job rk_iommu handshake on the idle
> >        NPU MMU is slow and noisy).
> >   6    iommu/rockchip: clear AUTO_GATING bit 1 on the RK356x v1 IOMMU s=
o
> >        the page-walker keeps its clock (else a TLB-miss walk never
> >        completes).
> >   7    dt-bindings: add the RK3568 NPU compatible.
> >   8-9  arm64 dts: add the NPU and its IOMMU, and enable them on ROCK 3B=
.
> >
> > Dependency. The NPU MMU is rockchip-iommu v1 (32-bit) while the rest of
> > the RK3568 uses v2 (40-bit). They cannot coexist until the driver carri=
es
> > per-device ops; this series is developed on top of Simon Xue's
> > "iommu/rockchip: Drop global rk_ops in favor of per-device ops" [1].
> > Without it the NPU IOMMU fails to probe on a full RK3568 boot.
> >
>
> Hmmm. If I understand correctly, the NPU IOMMU should be v2 rather than
> v1, implying it should support 40-bit PAs. Nevertheless, please note that
> the upper limit for DTE is 32 bits.
>
> > Power bring-up. The NPU is brought up through the power-domain layer (n=
o
> > driver hack): the NPU power-domain keeps its clocks but drops the pm_qo=
s
> > phandle (qos_npu sits behind the gated NPU NoC, so genpd's power-off Qo=
S
> > save faults reading it), and vdd_npu is marked always-on so the rail is
> > up before genpd de-idles the NoC at power-on. The PMU de-idle then ACKs
> > without PVTPLL running; PVTPLL is only needed for compute.
> >
>
> Can these operations not be completed via the pmdomain driver?
> If some operations are controlled by TF-A, are you using open
> source TF-A? Thank you.
>
> > Status. On v7.1-rc6 the driver probes, creates /dev/accel/accel0,
> > attaches an IOMMU domain, and submits jobs; the program controller
> > fetches and broadcasts the command list. Inference output is still wron=
g,
> > and the cause is split across three layers:
> >   - kernel (this series): the RK3568 differences appear handled;
> >   - mesa/Teflon userspace: still emits RK3588-tuned config, wrong for
> >     RK3568 (to be filed separately on mesa-dev);
> >   - hardware: with corrected config the NPU's DMA reads the full input
> >     and weight tensors (confirmed via its DMA bandwidth counters), but
> >     the MAC/output stage never completes, the job times out, and the
> >     output stays at the buffer's zero-point. I have not found the missi=
ng
> >     step; it is not in the command list (replaying the vendor's
> >     byte-exact command list behaves the same). Pointers welcome,
> >     especially from anyone with RK3568 NPU experience.
> >
> > Known residual. On the first IOMMU attach the NPU MMU is idle with pagi=
ng
> > already enabled; the rk_iommu stall/reset handshake does not complete i=
n
> > that state and logs one burst of timeouts before the (kept) domain
> > settles. It is harmless here because the job times out regardless, but =
it
> > points at an idle-MMU reconfiguration corner the rk_iommu code does not
> > handle on this block.
> >
> > [1] https://lore.kernel.org/linux-rockchip/20260310105303.128859-1-xxm@=
rock-chips.com/
> >
> > Changes since v2:
> >   - Tagged RFC; now tested on a stock v7.1-rc6 tree.
> >   - Bring-up moved into the power-domain/DT layer (no initcall hack).
> >   - Added the IOMMU detach-on-timeout and attach-once driver fixes.
> >   - Split the driver patch (Heiko): soc_data / match-data / RK3568.
> >   - Derive DMA width and core count from match data; drop the DT rescan=
s.
> >   - Binding describes the hardware; added the missing $ref on rockchip,=
pmu.
> >   - Disclosed the per-device-ops IOMMU dependency.
> >
> > Midgy BALON (9):
> >   accel: rocket: Introduce per-SoC rocket_soc_data
> >   accel: rocket: Derive DMA width and core count from match data
> >   accel: rocket: Add RK3568 SoC support
> >   accel: rocket: Reset the NPU before detaching the IOMMU on timeout
> >   accel: rocket: Keep the IOMMU domain attached across jobs
> >   iommu/rockchip: Clear AUTO_GATING bit 1 on the RK356x v1 IOMMU
> >   dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568
> >   arm64: dts: rockchip: rk356x: Add the NPU and its IOMMU
> >   arm64: dts: rockchip: rk3568-rock-3b: Enable the NPU
> >
> >  .../npu/rockchip,rk3588-rknn-core.yaml        | 18 ++++-
> >  .../boot/dts/rockchip/rk3568-rock-3b.dts      | 14 +++-
> >  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 38 +++++++++++
> >  drivers/accel/rocket/rocket_core.c            | 22 ++++++-
> >  drivers/accel/rocket/rocket_core.h            | 19 ++++++
> >  drivers/accel/rocket/rocket_device.c          | 15 ++---
> >  drivers/accel/rocket/rocket_device.h          |  3 +-
> >  drivers/accel/rocket/rocket_drv.c             | 66 ++++++++++++++++++-
> >  drivers/accel/rocket/rocket_job.c             | 35 ++++++++--
> >  drivers/iommu/rockchip-iommu.c                | 12 ++++
> >  10 files changed, 219 insertions(+), 23 deletions(-)
> >
> >
> > base-commit: 52c800fdcf11888ebeb50c3d707f782cc15b66eb
>
> --
> Best,
> Chaoyi
