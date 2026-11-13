Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561255;
	b=IQgMKSHIt0orzuVYdejXNuzo1gKpuqfCREw9l8tcBnJyxzZJw21b7VA558WVK+Ii1N3o
	 wzhWx1enAcSIxWCJHgJCf7flsRHpL5sZeGJYlkm0QtS+s7ihgvdQt2EbXeLIcdsGJS6iw
	 djbEHMuTeiCrPPCzC9MfpZnnrhPXfCZmnfM+qqJ5xeSPbH7oUA8eIuzdwp9arCMwdRJU6
	 qs04iuWxo1ysNULwpKzeWZOF7dhTGrojPWbRr8tq2czgRb8sCIQ3R5r9o2MdhwM5YMale
	 M8FkAGrz+oJMh99bB3FFjLH3emexvMpkDrIuNdW+C+KjLwTP9iwIKo52SU3iXJGeXqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561255;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A/SIYr+Ltyg8G6Y7jDcEs+eIvWf85SYWdYvP4zr9YsU=;
	b=hCIzSE+p2xKoS5Hxgzn8YItXvO1GDOiD4Fm3wdG1jzsHmaAPwgk2ub8SRL+4iR7d1pkV
	 wi0XbDXvVNlPEJltUFARQZilkXeExUSVIAk6dUPZp+ocOjf+78zkIlrTte2asOq2N7ZS2
	 N4gnGOLZc8hkhRbOD+QqRSrw151iBabQaLD2RnMjKWvj662p3jbWemc3PzZPHSl940xNG
	 Dk4SqcPXRQbK2DuD3HjMsH5H2jk50E06l0SLU9xwvRqxAstqsEPfMJiFVkLpJVNQirvcO
	 ft20voGDNpq6iKNiRBgHDNnppDjKIoMYGFrB5O/EeuKvWnW2UocrMLJPH8ZGUD99Wvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LWGpDBCM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E20606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LWGpDBCM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C3C1F000C4;
	Fri, 13 Nov 2026 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794561255;
	bh=A/SIYr+Ltyg8G6Y7jDcEs+eIvWf85SYWdYvP4zr9YsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LWGpDBCMmI69wpPgMHrFz5jr7/vX9mH2AW/QuOf7B7qG6v0KwKNo8/Bcmz7iBnFUX
	 FNakPrkRNW61NnGR4PEcvvOHa1G/t2VuEKi4oFdBWQ7KCNSOOsa/LUHYKVpxz/pqmJ
	 4yc4yw5+LMmUc5pRb0sdRxm1xMULYMr9LDK8UdgyozE15QZHxeYBSmOYXVk6cIDvMu
	 TxNdcec0/mT307ZQbms2QqnatCX37sL4dfaRmBsKvZ4uG0LrbczgkTGdKivGODFvfX
	 wumaYpNO3qdkVsp/lJF58MuvxLudHT25WPf7LZRDeVaGTpqN/m3E355kH1wukD15Z9
	 jVDn0FIJC3Cug==
Message-ID: <sashiko-outbox-212526@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Santhosh" <vishnu.santhosh@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
References: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
 <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:14:14 +0000
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
- [Medium] net: wwan: qcom_bam_dmux: lost PC edge in bam_dmux_probe()
  with IRQF_NO_AUTOEN
--

commit 4515119c8a0e425457d7366d017600d0d4e872df
Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor

This commit assigns a restricted DMA pool to both the local and remote
execution environments via SCM when qcom,vmid is present, reclaims the
pool on teardown, and defers enabling pc_irq until the end of probe.

> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index 1479f8362e04e..04f3d46d4c3f3 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
[ ... ]
> @@ -821,7 +913,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>  		goto err_disable_pm;
> =20
>  	ret =3D devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_=
irq,
> -					IRQF_ONESHOT, NULL, dmux);
> +					IRQF_ONESHOT | IRQF_NO_AUTOEN, NULL, dmux);
>  	if (ret)
>  		goto err_disable_pm;
> =20
> @@ -838,11 +930,14 @@ static int bam_dmux_probe(struct platform_device *p=
dev)
>  			bam_dmux_power_off(dmux);
>  	}
> =20
> +	enable_irq(dmux->pc_irq);
> +
>  	return 0;

[Severity: Medium]
Can requesting dmux->pc_irq with IRQF_NO_AUTOEN drop a power-control edge
between irq_get_irqchip_state() and enable_irq(), permanently inverting
dmux->pc_state?

CPU0                              Remote modem
bam_dmux_probe()
  devm_request_threaded_irq(...,
    IRQF_NO_AUTOEN, ...)
  irq_get_irqchip_state(...,
    &dmux->pc_state) -> false
                                  toggles pc line (0 -> 1)
  enable_irq(dmux->pc_irq)
    smsm_unmask_irq() / smp2p
      caches remote_state =3D 1     <-- edge lost, pc_state stays false

With IRQF_NO_AUTOEN, dmux->pc_irq stays unstarted in the underlying
Qualcomm shared-memory irqchip (qcom,smsm or qcom,smp2p) while
bam_dmux_probe() samples the initial line level and handles initial power
on.  Neither irqchip latches transitions that happen before enable_irq():

drivers/soc/qcom/smsm.c:smsm_unmask_irq() {
	...
	/* Make sure our last cached state is up-to-date */
	assign_bit(irq, &entry->last_value,
		   readl(entry->remote_state) & BIT(irq));

	set_bit(irq, entry->irq_enabled);
	...
}

drivers/soc/qcom/smp2p.c:qcom_smp2p_notify_in() similarly updates
entry->last_value for all bits while only delivering interrupts for bits
already set in entry->irq_enabled.

Because bam_dmux_pc_irq() tracks state by toggling
new_state =3D !dmux->pc_state on each edge rather than reading the line
level, missing an edge before enable_irq() leaves dmux->pc_state inverted
for the lifetime of the driver, breaking power control and DMA pool
reclaim on remove.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-qcom-bam-d=
mux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com?part=3D2
