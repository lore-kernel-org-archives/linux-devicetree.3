Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280794;
	b=DxmcRKB/w+reyKWPNFl6GcpuH6eKKqkJv5xO1Wgdwuc56G5edncMeTDxnPTi5eKo1Ua3
	 pK1j0/t+Sj0yxtBk6PxjCrtqIbgsMhvWEKDSVIeqDr7sBkDqHYUM6mXYKVIVOvS3JPz2M
	 qpz5VLtPvma/YnIdweBKGwrgwfdub/kXCHysiddnspXUmplijavz1vyHEjZ2wtdWrAivX
	 j1UcilIy7IoZXD+h0NcT1qBkSlqjgfUDj+1JPNqgKhi3qWqosal0TQWKxQceNW9R1w5S7
	 wpnQjxY0WN88os7mFLj9ELdKzDzYCf1hlGjv1gEA2jTY0qcFeG+C1R96uzYc/O1+qeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280794;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Inge+2ACTPy94Sq12r0CWaCaTcBgP985Tt5z2ui+fhE=;
	b=BPSbE03PKWGVChHEtfbHGUo3+KBwXD78VYzAg8ZlfuiiszrMWu/WeKIlSoJUZ4aausZT
	 rPTrpHI7VrhQMxY35fD22tLWY9i+umjg8hmdjWRhU2xkQR7LX1im2olBk86dNDWfZ9VFJ
	 rcxCX91dD205LGpnoCUrXD2OEONzoMMhhLRIcnnTOGewAffB4YO3YS6oGVxkNt1Aam/cs
	 CSPzmQIJN/RtOkHv5RyEKsKYPFOwy09ZEbZWg/MRL1NG2pPmb3AYPEVN5Z/JJfQCBOEYT
	 mxCH+k88sXbfz1j2FXcYt+Sz/FVGrYW3xlngKT558SpZlf7O13jAZ0oEEnP0C/ulpvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otzF8hfX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E07A606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otzF8hfX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30251F01825;
	Thu, 29 Oct 2026 13:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280794;
	bh=Inge+2ACTPy94Sq12r0CWaCaTcBgP985Tt5z2ui+fhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=otzF8hfXdiBATM87yBIYuEuyohDPKmJsIw6Zja4vypg3RNXl5QNaD50NXCi+cS7Px
	 OjvcLN5mjC0iz5GvjrgqgbgZUdVxgVswFBIr+R8inNMoky87rrikuPHwIg/u9faIr+
	 /yg3uXMVO0eQoSZ8820h2Ey/uHbcK+3H95LlxsLKoVLRdHG+K+pTDgD9e31Y7DVPC/
	 +RAjxqW4aLqf3U87b3jqyAxe0Ycd64z9nQwIFEHtF54hDfnhmQsVNAbRi6mM56kZq5
	 T4a0bm+IHzHuEqZGGRZAIz9dBZsjXVWmW9ZC8RQLmaKZLwY69oQojve1fFjCC26I0N
	 W0izWpPUKscxA==
Message-ID: <sashiko-outbox-189388@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 4/4] perf/riscv: Use Sspesa for precise sample
 attribution
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029130917.3714691-5-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
 <20261029130917.3714691-5-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 13:33:13 +0000
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
- [Medium] perf/riscv: stale CSR_SHPMSDATA not cleared in pmu_sbi_ovf_handl=
er()
--

commit 097e5fbeec62109e46a3171d644ba9f822fd792f
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

perf/riscv: Use Sspesa for precise sample attribution

This commit adds support for the RISC-V Sspesa extension in the SBI PMU
driver to record precise sample PCs from CSR_SHPMSPC and CSR_SHPMSDATA
during counter overflow handling.

> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 2991dd92def28..c42122f0e6760 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c

[ ... ]

> @@ -1115,6 +1229,21 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, vo=
id *dev)
>  	else
>  		ALT_SBI_PMU_OVERFLOW(overflow);
> =20
> +	/*
> +	 * Sspesa records the PC and metadata of the overflowing counter in
> +	 * hardware. The PC is precise only for events that support precise
> +	 * attribution; otherwise it is best-effort.
> +	 */
> +	if (overflow && sspesa_available) {
> +		sample_pc =3D csr_read(CSR_SHPMSPC);
> +		sample_data =3D csr_read(CSR_SHPMSDATA);
> +		csr_write(CSR_SHPMSDATA, 0);
> +		sample_cntrid =3D sample_data & SHPMSDATA_CNTRID;
> +		if (pmu_sbi_sspesa_derive_pc)
> +			sample_pc_valid =3D pmu_sbi_sspesa_derive_pc(&sample_pc,
> +								sample_data);
> +	}

[Severity: Medium]
Can CSR_SHPMSDATA remain latched with a stale counter ID and sample PC if a
counter overflows while local interrupts are disabled during a context swit=
ch
or event teardown?

When a hardware counter overflows while local interrupts are disabled,
hardware latches CSR_SHPMSPC and CSR_SHPMSDATA (setting SHPMSDATA_CNTRID to
the overflowing counter index) and sets the pending PMU overflow interrupt.
Before interrupts are re-enabled, stopping or deleting the event via:

  perf_event_task_sched_out() -> riscv_pmu_stop() -> pmu_sbi_ctr_stop()
  or
  riscv_pmu_del() -> pmu_sbi_ctr_stop() / pmu_sbi_ctr_clear_idx()

stops or resets the counter in SBI (clearing its overflow bit in scountovf)
without clearing CSR_SHPMSDATA.

When local interrupts are later re-enabled and pmu_sbi_ovf_handler() runs, =
if
all hardware counters were removed then used_hw_ctrs is empty and
pmu_sbi_ovf_handler() returns early:

	fidx =3D find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
	if (fidx =3D=3D RISCV_MAX_COUNTERS) {
		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
		return IRQ_NONE;
	}

Or if other counters remain active, overflow can be 0 because stopping the
overflowed counter cleared its scountovf bit, which skips the
if (overflow && sspesa_available) block and returns IRQ_NONE after clearing
the pending interrupt. Similarly, pmu_sbi_starting_cpu() stops all counters
and clears pending overflow interrupts during CPU startup without zeroing
CSR_SHPMSDATA.

Because Sspesa hardware does not overwrite CSR_SHPMSPC or CSR_SHPMSDATA whi=
le
SHPMSDATA_CNTRID is non-zero, subsequent overflows on other counters will
fail to capture a sample PC. Furthermore, when the same hardware counter
index is later reused by another event or task and overflows,
pmu_sbi_ovf_handler() will see cur_cntrid =3D=3D sample_cntrid and attribut=
e the
previous task's stale sample_pc and privilege mode into perf_regs.epc:

		if (sample_pc_valid && cur_cntrid =3D=3D sample_cntrid) {
			if (pmu_sbi_sspesa_regs(&perf_regs, regs, sample_pc, sample_data)) {
				sample_regs =3D &perf_regs;
				if (ssplcofi_available && pmu_sbi_is_pesa_event(event))
					sample_regs->status |=3D PERF_SR_PRECISE;
			}
		}

Should CSR_SHPMSDATA also be cleared when stopping a counter whose index
matches SHPMSDATA_CNTRID, on early exits in pmu_sbi_ovf_handler(), and duri=
ng
CPU startup in pmu_sbi_starting_cpu()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029130917.3714=
691-1-mayuresh.chitale@oss.qualcomm.com?part=3D4
