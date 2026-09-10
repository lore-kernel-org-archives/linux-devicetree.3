Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB5832E151
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 01:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003087; cv=none; b=ZBoDge9Up497z5XCymUuV5PPhozM9rfN7fomm24FToypupd/Sz2EkhelkJKmOZMH5WwBt1xcAGxCtrtCzPo73qCKFj/F9L3Q9dGoSMIPzLZBLDYWk/D2LNh+xSOdsBt346J2x5X883ZxrGx3Eyq6hia+vqsmFcyRJXvSrLhuv3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003087; c=relaxed/simple;
	bh=mkYeWQW7WFqvCsJXDRtlBPdgOQ/fQiWEbTEVTcXu+lo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kzEQS3evBBaqa5DjedaiDssV96agg3ePYsfTdXq4W0wQrLKg6ldGSMkVLNP7tltKFcKGdfEXNl4yGlDkfqjriKhuZjs2Q03T9ILLf4SjhDOJNpdI08AxBeHwGSKPv0y9vXWAvTkHBlBYEdIGyHznplCdcctz6LI7t1JEVY3chLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inIdVKET; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inIdVKET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBDE1F000FF;
	Thu, 10 Sep 2026 01:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789003082;
	bh=xwUJFAUZZKPxPx7LFSGrmQ9GhgaU/Pee4qowFd/juQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=inIdVKETUiDCWez6jBiPwpuHF5und7fDUZU6tCbimrzvuU28NqWGPpDIa0V5bBfxW
	 bpi/reeTpDWnmNyU9r8k8GYREpQhfpqU1du8hV9CXFKYkrEdVXxNykVeggZNIzjp1m
	 TduxtZqINnK4YjvbSxZDTh1hBr68B9etNu8V1vnF1ic5DVPzDxSiEkNJVN4jArX+kK
	 JO4ay5hJTUNhtQxKbgBVrPi3dZ/bJNEhCkqN8y7ydVV7v5LX8fwmklsoofdHrrEm6m
	 Eo/Jz0uDn9ViYJVz3rolUQWPk2QqjRSvz6D6lFJnXCB5o7qRxyVwKLDwwB92qH+xAQ
	 ijxJgUtAshUaw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 5/6] dt-bindings: firmware: add OP-TEE over the
 RISC-V RPMI TEE service group
Reply-To: sashiko-reviews@lists.linux.dev
To: marouene.boubakri@oss.nxp.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910012057.106966-6-marouene.boubakri@oss.nxp.com>
References: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
 <20260910012057.106966-6-marouene.boubakri@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 01:18:01 +0000
Message-Id: <20260910011802.3EBDE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Local interrupts are disabled for an unbounded duration during OP-=
TEE calls, breaking preemption and causing lockups.
--

commit c55e76cf03e17b2745cdf1b4ab9a24f5373ec194
Author: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

    dt-bindings: firmware: add OP-TEE over the RISC-V RPMI TEE service group

This commit introduces a new device tree binding for OP-TEE on RISC-V
platforms. It enables OP-TEE to run as a supervisor domain isolated by M-mo=
de
firmware, using the RPMI TEE service group over an SBI MPXY channel.

> diff --git a/Documentation/devicetree/bindings/firmware/linaro,optee-rpmi=
.yaml b/Documentation/devicetree/bindings/firmware/linaro,optee-rpmi.yaml
> new file mode 100644
> index 0000000000000..1c3dffc331ff9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/linaro,optee-rpmi.yaml
> @@ -0,0 +1,79 @@

[ ... ]

> +description: |
> +  OP-TEE is a piece of software using hardware features to provide a Tru=
sted
> +  Execution Environment. On RISC-V, OP-TEE runs as a supervisor domain
> +  isolated from the Rich Execution Environment (REE) by the M-mode firmw=
are.
> +
> +  The REE reaches OP-TEE through the TEE service group of the RISC-V Pla=
tform
> +  Management Interface (RPMI) [1], carried on a channel of the SBI Messa=
ge
> +  Proxy (MPXY) extension [2]. Each call into OP-TEE is a TEE_CALL service

[Severity: High]
This binding relies on the SBI MPXY mailbox channel, but does the underlying
implementation cause issues with preemption?

Looking at riscv_sbi_mpxy_mbox_call() in
drivers/mailbox/riscv-sbi-mpxy-mbox.c, local interrupts are disabled for
an unbounded duration during OP-TEE calls:

drivers/mailbox/riscv-sbi-mpxy-mbox.c:riscv_sbi_mpxy_mbox_call() {
	...
	local_irq_save(flags);
	mpxy_mbox_send_rpmi_data(mchan, msg);
	local_irq_restore(flags);
	...
}

Will this cause hard lockups or RCU stalls?

Since mpxy_mbox_send_rpmi_data() issues an unbounded sbi_ecall to OP-TEE
while interrupts are masked, this seems to break OP-TEE's preemption model
(RPC_INTR).

Hardware interrupts cannot be taken by the calling CPU, so OP-TEE cannot
yield correctly to the host OS on foreign interrupts.

Since any OP-TEE invocation (e.g., from unprivileged userspace via the
/dev/tee* nodes) routes through optee_rpmi_invoke_fn() which calls
riscv_sbi_mpxy_mbox_call(), could this create a reliable local
denial-of-service vulnerability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910012057.1069=
66-1-marouene.boubakri@oss.nxp.com?part=3D5
