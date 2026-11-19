Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113219;
	b=pU06ld+0KqWcayi6+rGESrXp9sbSyCsK82fMQF2/kmmoKwmxlonM7NQ/9bKG04YaXu05
	 727f0mmJFuvbwvXHhmjPQZWgrbrKaShw8sY9M+umZZ1MCTDwkC85DK1PKbwgYM3tAagHO
	 z3ed+7NF1DuhVrEbmS41nzbHSjnE+f7ah4mdqFjBxrgEpawLgztX4TmUDUIYpgs4CVf4I
	 tq9tnLSzlz4SxTv+7ua2w16FPOVrG5/SQqwmyHdmZVpsy/6tp5+UTaTHECYDwRO9imaC5
	 z8gz81jgU0qAFyFnLDA1rIZUQDjQmwvf+YeRivI5MIdMaWdF/LdYoul5uw1a6zY8FfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113219;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u26Gm1Icee++W8ZDoeBg3dVwDaHR8TF20MxS2lJfJfA=;
	b=Wk52ZjUmISy9T0aGV2bHSv9VLQxVJk9xPeJQaAVMf5u2NIK0TbXY7HHXgc/x3IaXtL+e
	 lJreCHaSpF3F3U1/lTIN/LBtU0uECoFO34FYNduxAqqVzcugCsAOuSURlOqJbRR+c2c2T
	 ENleUryAXI3aO2+W3tmD4+y1x+0CE8NLdOP3U/Zkh+kB+fCtGIZB8ODG+z7LVDfZ0q6we
	 BNJJ+HVPV59V7Let+dw751ukA+nnQqgqlN1CT4py8o5TpUdTvYMTkprGOmLbz755WLk7J
	 p6gkpC2yXTRkc7reBHwL4+UCu1n6XUuT98LeIxbVOJ+jzrUcPvWrxLDu2lOi8MwMeRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+7sG2tu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3828606A330
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+7sG2tu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CC41F000C5;
	Thu, 19 Nov 2026 18:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795113218;
	bh=u26Gm1Icee++W8ZDoeBg3dVwDaHR8TF20MxS2lJfJfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M+7sG2tueS7oTVFMCeBEjPx6Qro3+qoeCsPPxXw6RRi9IvuUs74xozHD1LXXkZBIF
	 y5HpXo9jXhgKhUJqkg80yCkMnala7dumATs/1V7fb1QJ4Orv3A9GNYdJyvneeOYJrN
	 hbC8LRaPB/lbtLngvliImmDfNEmysrvs+pNm6zsJ7g4Bf243AAIlDvm3eXQWxjc4SN
	 heoYTyiWsPkgpECy4L5j7dOxsA1dW1JnriKr7rz/+AATbX/nq9834RKVFt6CvX/k3k
	 fOV6zJ8xldfLLQ4IUMM1M1/yUlrp7R1S+OyAFOjLJ75TIiHTq6Aj6VqobLmVR+dNAI
	 pMQ9Q8qyMxI0A==
Message-ID: <sashiko-outbox-223774@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] ARM: dts: aspeed: Add Intel AVCRP BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Glazik" <dawid.glazik@linux.intel.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <e37637a0be15a3567f0d805d6bdc7b375ebd3a1a.1795114204.git.dawid.glazik@linux.intel.com>
References: <cover.1795114204.git.dawid.glazik@linux.intel.com>
 <e37637a0be15a3567f0d805d6bdc7b375ebd3a1a.1795114204.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 18:33:37 +0000
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
- [Low] ARM: dts: aspeed: avcrp: unnecessary RMII RCLK clock specified
  on RGMII mac1
--

commit 73259580cccaecd0b0979753a09f8fcb15e20987
Author: Dawid Glazik <dawid.glazik@linux.intel.com>

ARM: dts: aspeed: Add Intel AVCRP BMC

This commit adds the device tree for the AST2600-based RunBMC module on
the Intel AVCRP server platform.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> new file mode 100644
> index 0000000000000..02cdeca78048a
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> @@ -0,0 +1,326 @@

[ ... ]

> +&mac1 {
> +	clocks =3D <&syscon ASPEED_CLK_GATE_MAC2CLK>,
> +		 <&syscon ASPEED_CLK_MAC2RCLK>;
> +	clock-names =3D "MACCLK", "RCLK";
> +	phy-handle =3D <&ethphy1>;
> +	phy-mode =3D "rgmii-id";
> +	pinctrl-0 =3D <&pinctrl_rgmii2_default>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Does mac1 need clocks and clock-names overridden here?

ASPEED_CLK_MAC2RCLK (RCLK) is the RMII 50 MHz reference clock gate,
whereas mac1 is configured for RGMII (phy-mode =3D "rgmii-id") and
aspeed-g6.dtsi already provides ASPEED_CLK_GATE_MAC2CLK.  Specifying RCLK
causes ftgmac100_setup_clk() to unnecessarily enable the RMII2 RCLK gate.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795114204.gi=
t.dawid.glazik@linux.intel.com?part=3D2
