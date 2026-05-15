Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB533EEACF
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883909; cv=none; b=dQZYtHhDKrWsUAGJyrkj8H0Z94n+g0njDKCl2vOjPFF1fDzcY0nf6DXJFY4y02EeJFTw+gaMnsULlEyclwG0k0Hgy0fVKt8xu7QbH2G2u8/mtwFuelscxCyf/OEGq2TsLkQHkf8bh1tur0VIYBiuEsRmmFmcXUdtJpHFMYKFvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883909; c=relaxed/simple;
	bh=FSWWESR5GvjhE5r0sweSi6Eqd6oxZaLlaYikJb1zix4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ioVZVfmr+Sxj++zP2cysBh6EzvS5G+lSAHq6YEjjtgR1cQtojs5iusGJPG5WnyerxKR5U6S4KHq16hOvMRkX+1iQN31XbX4/bJUCF8Pj8isCrXPLYgYg6H2xjW2Akhxcp8ROipKkeApfG4k69Yhh5QZqbWNHdMRbUCFfSMJf4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVtVVUlA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVtVVUlA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4ADC2BCB0;
	Fri, 15 May 2026 22:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778883909;
	bh=FSWWESR5GvjhE5r0sweSi6Eqd6oxZaLlaYikJb1zix4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TVtVVUlAIhMq/uWBO8dQ/U6S9D3nrag09oNQyv3e4pDN00CvutEFVNJYuh997l67/
	 1U4mKz4sHbDbULP8g44dxLlUqnbkRhE3B3SvSNw9dO44d2tzo4X0jKROtdjA98SxWC
	 xkuNLPGiBmTgnYPbauP94C+JwcdPXvVbpXZaAAxoyF0c93uVqio6G98VSHLADtXcsc
	 nyLyKymHgWdq/rjXMmWvDl9ImYnw7phaXD14cTwXsoENj6yZBwLdktQimt3hwpFh5E
	 XUuevxTG24+SjpLn/vtOml8OYlqi5PvBlG1r8rW6vx2p+oyfhx6TQls5v9xVNf7cCS
	 mB+EdKrQbBvPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/10] mfd: sec: add support for S2MU005 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260516-s2mu005-pmic-v7-4-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-4-73f9702fb461@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:25:08 +0000
Message-Id: <20260515222508.BF4ADC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `.use_ack =3D true` in `s2mu005_irq_chip` causes an infini=
te interrupt storm.
--

commit 6e3b1141ae78b94854e84436a682b1574f6933ac
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

mfd: sec: add support for S2MU005 PMIC

This commit adds support for Samsung's S2MU005 PMIC. It introduces a new
device type and handles its specific revision register fetching, as well
as providing its interrupt chips and child cell definitions.

> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index 133188391f7c2..42862807be1a0 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c

[ ... ]

> @@ -337,6 +397,16 @@ static const struct regmap_irq_chip s2mpu05_irq_chip=
 =3D {
>  	.ack_base =3D S2MPU05_REG_INT1,
>  };
> =20
> +static const struct regmap_irq_chip s2mu005_irq_chip =3D {
> +	.name =3D "s2mu005",
> +	.irqs =3D s2mu005_irqs,
> +	.num_irqs =3D ARRAY_SIZE(s2mu005_irqs),
> +	.num_regs =3D 4,
> +	.status_base =3D S2MU005_REG_CHGR_INT1,
> +	.mask_base =3D S2MU005_REG_CHGR_INT1M,
> +	.get_irq_reg =3D s2mu005_irq_get_reg,
> +};

Does this structure need .use_ack =3D true?

In s2mu005_irq_chip, .ack_base is not explicitly set, so it implicitly
initializes to 0. The .status_base is set to S2MU005_REG_CHGR_INT1, which is
the first enumerator in s2mu005_reg and thus equals 0.

The regmap-irq core framework relies on the condition if (chip->ack_base ||
chip->use_ack) to determine if it should write back to the hardware registe=
rs
to acknowledge and clear the interrupts. Because both evaluate to 0 (false),
regmap-irq assumes the chip is clear-on-read and completely skips the ACK
execution.

Since Samsung PMICs require a Write-1-to-Clear sequence to clear interrupt
status registers, without the ACK write, the hardware PMIC continuously
asserts the physical IRQ line.

As the interrupt uses IRQF_ONESHOT, the moment the threaded handler complet=
es
and unmasks the interrupt at the controller, the still-asserted hardware li=
ne
will immediately re-trigger the interrupt.

Could this loop cause an infinite interrupt storm, starving the CPU and
leading to a hard lockup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-s2mu005-pm=
ic-v7-0-73f9702fb461@disroot.org?part=3D4
