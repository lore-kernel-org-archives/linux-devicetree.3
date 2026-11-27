Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772611;
	b=Lzi9ZolEGOGLPQrKmfbVerEXBsnl/bUi7pe4eAG8HfsLSABuQD+1B9IZ/9ReC9/ElFEF
	 cG2xpVaGz4pGtCf+3YC1m1RvPUGQHF4Hr6yN+hDzGnwruHLJm2qgRDnE0HB/AyOiQHIso
	 C/YM+jrV98VEwbb6A84mcv7VTP0X8cMhWe1EB2Sf7gmtPhqZ8JMcG4Xb44HzjE+KIFAeW
	 UF7Uh/NhVriq4UgJOnMaUP9t9bqlJJzSarCTaka4vICP63awCnat9pVrjaqQ/VrqWn73r
	 EeXBHOgRZoao5PrF36tdJStFzYxJcagsL93bADcvPic8EUE2s2UVUcj8/z4GOEtZMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772611;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lyJ0DkrYSbzKUwxlx9On3DuyC11SmaAVgWaN1Xvb6O4=;
	b=SNn+XUmpx9lKpmqvmML4dypgt+4trJdZCfvQuoAI72zsShcQqP5ysAGMqq5ODM+hcLRP
	 wxNRPQGDeqxQF7dcpPUhvVWUmofIkMtZaAlZetFE7So8ekw+nJMdMs7bLnylVjNdN3j22
	 LrUMT+LVEiEp5bZabIoOAVLjj6cFfyTusP7Ts1MOFwIcGqY/34QSPwyWnzWGbRZr6VdY2
	 U0N18JIEgEzfF8q0IiNEbVccLsxyYRVj93LMtwzknSvz9ed6muScf2pwXUxJW0LybcTIJ
	 ACEttbk+OfVOhqRMRXTgO1nkN0rt3U7DDOPatH3Vm0y+dcvJoR2E5vFf3VEkqnJIGcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wurnn06p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97E2606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wurnn06p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB54F1F000C1;
	Fri, 27 Nov 2026 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772610;
	bh=lyJ0DkrYSbzKUwxlx9On3DuyC11SmaAVgWaN1Xvb6O4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wurnn06pJ3uJn4MlSCAgMn9Xv51nZ1ABtifB0Pn4MwKqs0+rC0wz0DLGIvnUaTc5W
	 eHFKubY81jQJugYaIe9NXmyA3SlE6yu+I5rbu50m+Cuph9ClsQaMZTshytQE0NTqOC
	 LzmNsrXv/OpW4RHTuWLorMYivhQurxca+pFgU7z60u9w1LqSiwV/VOxiSt7F5nX+uW
	 4r1Ures2dlVD9gnKM9IBRHQ72pAcSJtmZUpXG7xBXDZjxxZQfi7fHjXlk9CYi0It99
	 Pl5GHNYGxbQPXUJmmRdg2GsWsigqTm5wWL5tV4yAfl7VI7sQmTu4xVDlpCdpnYxr55
	 eYvcRZwyhnrig==
Message-ID: <sashiko-outbox-236996@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: gaokun3: Disable the cluster idle
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: getfeus@gmail.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <CA+m4KrB1p2u_y92phm-xpn3up=kebi1OmiVc3X4CCdFzHT9-5Q@mail.gmail.com>
References: <CA+m4KrB1p2u_y92phm-xpn3up=kebi1OmiVc3X4CCdFzHT9-5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:43:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: qcom: stateless cluster_pd overflows
  rpmh_rsc_write_next_wakeup()
- [Low] arm64: dts: qcom: cluster_pd placed out of alphabetical order
  before apps_rsc
- [Low] arm64: dts: qcom: missing Fixes trailer for gaokun3 s2idle
  resume fix
--

commit 90b3f916cd4d3d2e0549d9889472f17cc73097cc
Author: getfeus@gmail.com <getfeus@gmail.com>

> arm64: dts: qcom: gaokun3: Disable the cluster idle state
>
> The Huawei MateBook E Go fails to resume from suspend-to-idle when the
> SC8280XP cluster idle state (PSCI parameter 0x4100c344) is available.
> In a same-kernel and same-initramfs comparison with the RTC alarm
> disabled, the power-button wake led to the boot menu with the state
> available. With only the cluster idle state reference removed, the
> system resumed in the same boot.
>
> Remove the cluster's domain-idle-states property from the gaokun3
> board description. Keep the CPU power-domain topology and per-CPU
> idle states. This also removes the shared cluster state from runtime
> idle on this board.
>
> Verified on a GK-W7X with firmware 2.18. Using the same local kernel
> and a DTB differing only by this property, the system resumed in the
> same boot after 5 minutes and 19 minutes on AC power.
>
> Signed-off-by: Lee Youngjoon <getfeus@gmail.com>

[Severity: Low]
This fixes suspend-to-idle resume on the Huawei MateBook E Go.  Should
it include a Fixes tag for the commit that added the board devicetree?

  Fixes: 1401ae5c28a2 ("arm64: dts: qcom: sc8280xp: Add Huawei Matebook E G=
o (sc8280xp)")

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/=
arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> index 37d2cb3ddf0f4..2115d48588df4 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> @@ -311,6 +311,14 @@ vreg_pmu_rfa_1p7: ldo9 {
>  	};
>  };
> =20
> +/*
> + * The cluster idle state prevents s2idle resume on this board.
> + * Keep the per-CPU idle states available.
> + */
> +&cluster_pd {
> +	/delete-property/ domain-idle-states;
> +};
> +
>  &apps_rsc {

[Severity: High]
Does deleting domain-idle-states from cluster_pd while leaving
cpu_pd0..cpu_pd7 and apps_rsc attached to cluster_pd cause a regression
in runtime idle and overflow rpmh_rsc_write_next_wakeup()?

Without domain-idle-states, dt_idle_pd_alloc() leaves pd->states NULL, so
psci_pd_init() initializes cluster_pd with pd_gov =3D=3D NULL and
cluster_pd->gd remains NULL:

drivers/cpuidle/cpuidle-psci-domain.c:psci_pd_init() {
	...
	/* Use governor for CPU PM domains if it has some states to manage. */
	pd_gov =3D pd->states ? &pm_domain_cpu_gov : NULL;

	ret =3D pm_genpd_init(pd, pd_gov, use_osi);
	...
}

Because apps_rsc still has power-domains =3D <&cluster_pd>, rpmh_rsc_probe()
attaches rpmh_rsc_pd_callback() to cluster_pd.  During runtime idle,
whenever the last online CPU enters a per-CPU idle state,
genpd_power_off() cascades to cluster_pd.  With no governor attached,
genpd_power_off() skips cpu_power_down_ok() (bypassing cluster residency,
PM QoS latency, and pending-IPI checks) and unconditionally powers off
cluster_pd, firing GENPD_NOTIFY_PRE_OFF -> rpmh_rsc_pd_callback() ->
rpmh_flush() -> rpmh_rsc_write_next_wakeup():

drivers/soc/qcom/rpmh-rsc.c:rpmh_rsc_write_next_wakeup() {
	...
	/* Find the earliest hrtimer wakeup from online cpus */
	wakeup =3D dev_pm_genpd_get_next_hrtimer(drv->dev);

	/* Find the relative wakeup in kernel time scale */
	now =3D ktime_get();
	wakeup =3D ktime_sub(wakeup, now);
	wakeup_us =3D ktime_to_us(wakeup);

	/* Convert the wakeup to arch timer scale */
	wakeup_cycles =3D USECS_TO_CYCLES(wakeup_us);
	wakeup_cycles +=3D arch_timer_read_counter();
	...
}

Because cluster_pd->gd is NULL, dev_pm_genpd_get_next_hrtimer() returns
KTIME_MAX.  USECS_TO_CYCLES(wakeup_us) then overflows 64-bit unsigned
multiplication and writes a wrapped wakeup timestamp into
RSC_DRV_CTL_TCS_DATA_LO and RSC_DRV_CTL_TCS_DATA_HI.

[Severity: Low]
This isn't a bug, but the label overrides in this file are sorted
alphabetically (&apps_rsc, &dispcc0, &gpi_dma0, ...), so &cluster_pd
should be placed between &apps_rsc and &dispcc0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/CA+m4KrB1p2u_y92phm=
-xpn3up=3Dkebi1OmiVc3X4CCdFzHT9-5Q@mail.gmail.com?part=3D1
