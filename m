Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110705;
	b=NQ82WKKJ4/SLIhNFCZsmVvq2Bvnpd+ZRkcs+xHOQpsAhz8l2RipbifgXTs9+lpLtp3Sl
	 nxh3g6p89Z803DZo5m1QTnYETekFsfWHLrMZwSWL1c8iMXog/7i+jQMKuXatZHZn7TaKC
	 CpF55bBHIO0XgFrohSJeBy17o/qjJTu07DuNVI+SLbMjkqAM3NjmBq4gfp37Lnnijy6xf
	 FMLZd5tO59+asfcL8hcdhtJuovZXn6JFndFonD2rOCSJo/Pnao5FpSVcJR/uaIVzOtkOB
	 z8MTx7mL/siVexnvTkp1OeYKZ98IrDdBWS2mPAXomibuFGxkKmu6pfhv/TCTo1Biz8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110705;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=muE1ZodhCKnxkOlaECP/UZwk6wG0PuDyIawyk47SDPc=;
	b=V6t6pUG/BhSoYHyTzf/ekWnosFOIBI7xW0LtcCDgN5TKYhnr8ORnfJXRYypbpQuoGQN/
	 t/jVbHPtCXVLYfQLPN5Fn86baajJ+GC4FXIPisGUxtLRUaje3sJxhlXkz+0kWMkip3ceH
	 XfX9VOOTtWXXM4injlJmKWrmM75CNXPNJFGlQBv7aLGCKTzgPJTLIyvJYF4wYq1bGkhqD
	 ul4cinvlQ50NkMXeeZjDN8lsOe02M7Ct8IeIEugSPhqHXfuJFfIlOAgvEe8chHP74VvZ+
	 gM8w4vcl27SdcA4T6MwCrp29pO2NWOtLtchyMFpyegHgWQn/Tpg3YS4gSKVVg8rOXpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ay1jMPTp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5584C60A3807
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ay1jMPTp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53EF1F0092F;
	Thu, 19 Nov 2026 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795110704;
	bh=muE1ZodhCKnxkOlaECP/UZwk6wG0PuDyIawyk47SDPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ay1jMPTpBA4Zhkf/t6YhfMY7d3139mTa6DdQ368Hw5DPYOrRuRTnwPBuWZGskWGSF
	 UD8v5hwJ/HfcJe2ODP/2i1LB+XBziceoma/SJ0WhJSuLFR538rClui3ahWWpzKyBeA
	 NY6jyJ97x/CCDppCSOCUdWMKWpurK091T1c2t2yjvvG/zWPMYE6IuwavGcWVFHGqNr
	 Yli6yPx4oZpiQt9IVe2AiBuWUpUsuX9v54pu38wvphmx9zoEopkTyzv+CVqe+5bREp
	 HKAAVpbx0HzyUXvgsGU1znkJ+b8CTgGPcnxIFQKAbEgRVCjJbuRLoYUXbaTmJBKFkD
	 3G5YsbivXjM4g==
Message-ID: <sashiko-outbox-223728@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: st: add PSCI idle state to STM32MP23 CPU
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrick Delaunay" <patrick.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119184209.v2.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
References: <20261119184209.v2.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:51:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: st: stm32mp231 cpu-sleep local-timer-stop conflicts
  with always-on
--

commit 7e079de649dbd4d8c4228cc0cad8b0197a5e36f1
Author: Patrick Delaunay <patrick.delaunay@foss.st.com>

arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains

This commit adds a PSCI cpu-sleep idle state and references it from the
STM32MP23 CPU power domains so the power-domain governor can manage them in
OSI mode.

Link: https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368=
382d93e98cc36ee25@changeid/

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
>  	};

[Severity: High]
Does setting local-timer-stop on cpu_sleep while the arm,armv8-timer node in
stm32mp231.dtsi still has always-on cause the CPU to enter PSCI suspend with
its local timer stopped and no broadcast wakeup timer armed?

arch/arm64/boot/dts/st/stm32mp231.dtsi {
    ...
	timer {
		compatible =3D "arm,armv8-timer";
		interrupt-parent =3D <&intc>;
		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
		always-on;
	};
    ...
}

Because always-on is present on the timer node, arch_timer_of_init() sets
arch_timer_c3stop to false and __arch_timer_setup() omits
CLOCK_EVT_FEAT_C3STOP on the local clockevent device.  When
cpuidle_enter_state() enters cpu_sleep, tick_broadcast_enter() ->
tick_broadcast_oneshot_control() sees CLOCK_EVT_FEAT_C3STOP clear and
returns 0 immediately without arming a broadcast timer or returning -EBUSY
to fall back to WFI, leaving the CPU asleep until an external non-timer
interrupt arrives.

The commit message adds a Link: to the separate patch "arm64: dts: st: mark
STM32MP23 timer as stopping in suspend", but that prerequisite is not appli=
ed
in this tree (and is not pulled in when backporting via Fixes:).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119184209.v2.1=
.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid?part=3D1
