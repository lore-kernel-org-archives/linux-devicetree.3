Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739862;
	b=nx6xJbXtRpTWtNdvjF+9vc97dnWXgLOLno1VbfMTMfKJzddOibDZHWwCcFMZ1tK80dGQ
	 t6HL6RJ82HiUBGqKpXkMH8vyyPztC6ObBnzZZpAIR7XOy8DnTrI11yC1GCbo3TrD3e2H2
	 9f2nMiUhETRYJRAlWqQYd1ouS6gSxy8fM/OaRTJ8ZRaV8AcqWJYrwTSjxtIUiFvzUZo1C
	 mjCwZ06Rjw/UXrVqFl+lEGekGuzQ/vfeffIMHtH9UOu78zBkOw6TOB4sjaow12Vi+/zXO
	 Du6hSm+xEDJPXWXq3MMOY6Tx3QXMML0aqptniZ15RBgacggb7rFhAjezAiDffiqXH+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739862;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oDo1sirqUHWZkPceJf1cPDGxOi9QVrjmK0DBW2JH0KQ=;
	b=IcDu8FnwgGT/uSWz2kK7B3uDIXdAq45Or/i14hUNtgTrqNwHpwi+04Si0DYnAmqjUl1F
	 Ehqf5U+ejPEWuVTjZkI1jZLNA9qxBPwjBme/0FYFD2yqFXWAtO0Q+SPVr2YBNX3rqZSpK
	 EbSh1sCLkFVUepgkQ52B3rLGZrSOdPCR7Hf1W3IMFGnObbcKaHty5ulMByhhjGYTF2eGl
	 I17HQnequlf/UTvrgHDPZ2afFWFhkltgEXEOElwASwJss/ugJZEL4xzpRmLISxaz8uwnW
	 VWs0DQP/w4sE3dG8c0cdcR70/mKqzOAgN1NTub95LE9aHhTuzj7MY9uf6ZdfvxHQqhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UncHcpjc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30524606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UncHcpjc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE651F031E4;
	Fri, 23 Oct 2026 07:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792739861;
	bh=oDo1sirqUHWZkPceJf1cPDGxOi9QVrjmK0DBW2JH0KQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UncHcpjcWcDVBVzqMa1qkhxyq8XbTxgESUO0/LqW7Y9TlW4zbrH20GzL4bqKhUbDb
	 xy79yUj7S102S0y1bicx/k82ELJMxqXn/8RU6MXl31FGtfSTMhW/GKGzSAv9diG3x/
	 sfqHT8wG7PAYXYW00wVTgb8Hs485CKC8Z7DVIYsCvE2PpuFMzqAPnKJQ6jUO0hQhEb
	 M6SVLmT5e2zHYByQO+hGOZwJiCvP62Hx4ea2934rJSwOCP4xgIZTUCwQaGRDmCmn1I
	 Di/t/dED68Ft3J2z/5SSZuKBCuDuVBZdqlCZrsJQOnsB/H+tufDyiTXIz8MjYrghyA
	 RiPf+SxwaPGQw==
Message-ID: <sashiko-outbox-182398@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 16/16] arm64: dts: ti: k3-j722s: Reference the power
 domains of the C7x timers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomeu Vizoso" <tomeu.vizoso@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261023-thames-v3-16-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
 <20261023-thames-v3-16-3ab40aa17157@tomeuvizoso.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 07:17:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: ti: k3-j722s: C7x timer power-domains hack leaves time=
rs unpowered
--

commit 245f841e18148c5c992f99bb10260a30c9c5baf8
Author: Tomeu Vizoso <tomeu.vizoso@gmail.com>

arm64: dts: ti: k3-j722s: Reference the power domains of the C7x timers

This commit adds power-domains and power-domain-names properties referencing
the timer1 and timer2 power domains to the c7x_0 and c7x_1 DSP nodes in
k3-j722s-ti-ipc-firmware.dtsi so the firmware can use the timers.

> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/=
arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
> index 611220ff26555..7639081dc9133 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
> @@ -166,6 +166,14 @@ &c7x_0 {
>  		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
>  	memory-region =3D <&c7x_0_dma_memory_region>,
>  			<&c7x_0_memory_region>;
> +	/*
> +	 * Both timers on each core: core 0's firmware drives TIMER1 and core
> +	 * 1's TIMER2; two entries also keep the platform bus from attaching the
> +	 * domain to the K3 driver's device.
> +	 */
> +	power-domains =3D <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
> +			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
> +	power-domain-names =3D "timer1", "timer2";
>  	status =3D "okay";
>  };
> =20
> @@ -174,5 +182,8 @@ &c7x_1 {
>  		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
>  	memory-region =3D <&c7x_1_dma_memory_region>,
>  			<&c7x_1_memory_region>;
> +	power-domains =3D <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
> +			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
> +	power-domain-names =3D "timer1", "timer2";

[Severity: High]
Can specifying both timer power domains on c7x_0 and c7x_1 leave the timers
unpowered while the C7x DSP firmware is booting or running?

Because two entries are listed in power-domains, genpd_dev_pm_attach() skips
attaching the domains when k3_dsp_rproc_probe() probes the platform device:

drivers/pmdomain/core.c:genpd_dev_pm_attach() {
	if (of_count_phandle_with_args(dev->of_node, "power-domains",
				       "#power-domain-cells") !=3D 1)
		return 0;

	return __genpd_dev_pm_attach(dev, dev, 0, 1, true);
}

Meanwhile, k3_dsp_rproc_probe() leaves rproc->auto_boot set to true, and
thames_core_init() defers probe until remoteproc has already booted the DSP
before calling thames_core_get_timers():

drivers/accel/thames/thames_core.c:thames_core_init() {
	if (rproc->state =3D=3D RPROC_OFFLINE && rproc->auto_boot) {
		rproc_put(rproc);
		return dev_err_probe(core->tdev->ddev.dev, -EPROBE_DEFER,
				     "%pOF: remoteproc has not booted it yet (auto-boot pending)\n",
				     core->of_node);
	}
	...
	err =3D thames_core_get_timers(core);
}

As a result, there appear to be several paths where the C7x firmware runs
without its timer power domains powered:

1. rproc_auto_boot_callback() -> rproc_boot() -> k3_dsp_rproc_start() boots
the C7x firmware before thames_core_init() -> thames_core_get_timers() ever
calls dev_pm_domain_attach_list() to attach and power on power domains 37 a=
nd
38.

2. In thames_platform_probe(), if c7x_0 has finished auto-boot
(RPROC_RUNNING) while c7x_1 still has auto-boot pending (RPROC_OFFLINE),
thames_core_init() on core 0 attaches power domains 37 and 38, and then
thames_core_init() on core 1 returns -EPROBE_DEFER. The err_fini_cores unwi=
nd
path calls thames_core_fini() -> thames_core_put_timers() on core 0, which
detaches power domains 37 and 38 via dev_pm_domain_detach_list() and powers
off power domain 37 while c7x_0 firmware is actively running.

3. When thames is unloaded or when a core runs non-Thames IPC firmware (such
as the TI SDK IPC firmware for which k3-j722s-ti-ipc-firmware.dtsi is
included by k3-j722s-evm.dts and k3-am67a-beagley-ai.dts) and fails
thames_core_wait_handshake(), thames_core_fini() drops the rproc reference
without shutting down the DSP while detaching the timer power domains:

drivers/accel/thames/thames_core.c:thames_core_fini() {
	rproc_put(core->rproc);
	core->rproc =3D NULL;
	thames_core_unmap_ipc(core);
	thames_core_put_timers(core);
}

Likewise, when CONFIG_DRM_ACCEL_THAMES is disabled, nothing attaches to pow=
er
domains 37 and 38, so of_genpd_sync_state() will power them off once k3_pds
consumers finish probing.

4. Since c7x_0 only uses main_timer1 (power domain 37) and c7x_1 only uses
main_timer2 (power domain 38), listing both domains with TI_SCI_PD_EXCLUSIVE
on both DSP nodes also misdescribes the hardware in the device tree and cau=
ses
c7x_0 to claim main_timer2's power domain even if c7x_1 is disabled.

Should the timer relationship and power domain lifecycle be managed by the
remoteproc lifecycle (or via a dedicated timer phandle property) so that ea=
ch
DSP core only claims its own timer and keeps it powered for as long as the
firmware is running?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-thames-v3-=
0-3ab40aa17157@tomeuvizoso.net?part=3D16
