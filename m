Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796478;
	b=eMhFm7E6naS6W6Wbym9uduEYzQ4yLktdE4vU9+s8deQW2v2dhtzsUURv9unBPP1GFYvr
	 tCO2mdGHFw0pwvHwcurb6o2E1HpxjL7nPoSehD1h9/rNFpHjKpVLKVvbq3zk3R4vRzNp8
	 OwTnr0J+JR7xBqeIV2hj/LinxAdrbAS3vVnv6Fa2gXxVrViFiJ2UDJf4bxWHQ8UYjX5b8
	 1Xgvy5UM/tPsNT38jyCzWN/99yNdV1JOli1lOGrfAL/sAWsTQ7re48BOa3oQ4mitpqwFK
	 Aob/S6xg4ou6e1StH8WkBh3ELGEd7c7YxkREhc1fz3SQvLM4Vfc4HwxcSLvFQVx+8Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796478;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4bUSZ5fY0Bht2N6RwM6W93VN/oWn6p/LY4lW15Lo2MQ=;
	b=ab4agjRudZnwB+J0eRNZxBeA/qj8mh9wHaMt6YqMz5U9F4JpND7AF3ULLdjNBKB1dgeW
	 V/ioUH9aZZR/30L+DrFXLV/o1KkXX4rAjNCj7vx0lnPKN2dIVPjTGdsB9ibfznQ3HRF6j
	 QukqVD50bdRuajemsWjMd1q1mN8jRl6ZcQ+oDmWYIIbfccxrelEl9xvK7Rzl5jvDIOTHn
	 0koxXRASekahDT6/TjEsP5syp55X5kABeHCg3cTNICSRqfiaI58Sxgq6ImbxNn/tyZmxA
	 bKM0uLujZNEER7QFZ2aEMQcAD44kDwR9G2A1l3O5GytpnM9PO0SeNIw/8H+RkpmFidA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWRxEY97;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565E606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWRxEY97
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F9C1F00919;
	Wed,  4 Nov 2026 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793796478;
	bh=4bUSZ5fY0Bht2N6RwM6W93VN/oWn6p/LY4lW15Lo2MQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EWRxEY97ndQ16cmOkyPl+xSINyeSwcxMKD+nHV8jT/g5qzNJ7j73GqK6XScWrEgFR
	 IUMGYVjZP2TOqhe/NY/zjNy1b6/F7GQfdO6WtemNOaPtoeBG3KUZ0kRQgNNubZZrUv
	 ip7Skz919S3ZU7RSXQgxeQD2tZbCHBUA7Q9YiDhuxm4rQBSsnAE3fbFQdlX1fFtaDC
	 UPM1MS4S5br8xQtEcfR8JY0+aRVr/bOU+na9rvPqxnek7MD4ItVKXphA+LhhPVzjN2
	 7tsOZI/R7lUev931Hm9vxdRRjI6bKJrCIbXPiBMW13WAGrxRDgVVYZEcotO+aK4ofo
	 dXuE/hSu0+2/w==
Message-ID: <sashiko-outbox-197300@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: st: add PSCI idle state to STM32MP23 CPU
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrick Delaunay" <patrick.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
References: <20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 12:47:57 +0000
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
- [High] arm64: dts: st: stm32mp231 cpu-sleep local-timer-stop conflicts wi=
th always-on
--

commit 54de3bc82d13d38707edd20793e9450770876715
Author: Patrick Delaunay <patrick.delaunay@foss.st.com>

arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains

This commit adds a PSCI CPU suspend idle-state node to stm32mp231.dtsi and
references it from the STM32MP23 CPU power domains so the CPU power-domain
governor can manage them in OSI mode.

> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts=
/st/stm32mp231.dtsi
> index fefbf6f4f1537..27231e140fbb5 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -24,6 +24,19 @@ cpu0: cpu@0 {
>  			power-domains =3D <&cpu0_pd>;
>  			power-domain-names =3D "psci";
>  		};
> +
> +		idle-states {
> +			entry-method =3D "psci";
> +
> +			cpu_sleep: cpu-sleep {
> +				compatible =3D "arm,idle-state";
> +				arm,psci-suspend-param =3D <0x00000002>;
> +				local-timer-stop;
> +				entry-latency-us =3D <150>;
> +				exit-latency-us =3D <200>;
> +				min-residency-us =3D <1000>;
> +			};
> +		};

[Severity: High]
Does setting local-timer-stop on cpu_sleep while the timer node in
arch/arm64/boot/dts/st/stm32mp231.dtsi still specifies always-on cause CPUs
entering cpu-sleep to miss timer wakeups and hang in idle?

In arch/arm64/boot/dts/st/stm32mp231.dtsi, the architected timer node has t=
he
always-on property:

	timer {
		compatible =3D "arm,armv8-timer";
		...
		always-on;
	};

Because always-on is present, arch_timer_of_init() in
drivers/clocksource/arm_arch_timer.c clears arch_timer_c3stop:

	arch_timer_c3stop =3D !of_property_read_bool(np, "always-on");

and __arch_timer_setup() omits CLOCK_EVT_FEAT_C3STOP from the per-CPU clock
event device.

When a CPU enters cpu_sleep, local-timer-stop sets CPUIDLE_FLAG_TIMER_STOP,
so cpuidle_enter_state() calls tick_broadcast_enter() ->
tick_broadcast_oneshot_control(TICK_BROADCAST_ENTER). However,
tick_broadcast_oneshot_control() in kernel/time/tick-common.c checks
CLOCK_EVT_FEAT_C3STOP first:

	if (!(td->evtdev->features & CLOCK_EVT_FEAT_C3STOP))
		return 0;

	return __tick_broadcast_oneshot_control(state);

Because CLOCK_EVT_FEAT_C3STOP is not set, tick_broadcast_enter() returns 0
without arming a broadcast timer and without returning -EBUSY to fall back =
to
WFI in cpuidle_enter_state():

	if (broadcast && tick_broadcast_enter()) {
		index =3D find_deepest_state(drv, dev, target_state->exit_latency_ns,
					   CPUIDLE_FLAG_TIMER_STOP, false);

		target_state =3D &drv->states[index];
		broadcast =3D false;
	}

As a result, the CPU enters the PSCI cpu-sleep state where the local timer
stops, without a broadcast timer armed or a fallback to WFI when no broadca=
st
timer is available (stm32mp231.dtsi defines no lptimer broadcast timer node=
s,
and bc_hrtimer cannot wake a single-core STM32MP231 or dual-core
STM32MP233/STM32MP235 when all CPUs enter idle).

Should the timer node in stm32mp231.dtsi replace always-on with
arm,no-tick-in-suspend, matching commit 9ec406ac4b7de3 ("arm64: dts: st:
Replace always-on by arm,no-tick-in-suspend for timer in stm32mp251.dtsi") =
on
stm32mp251.dtsi and stm32mp211.dtsi?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104133023.1.If=
2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid?part=3D1
