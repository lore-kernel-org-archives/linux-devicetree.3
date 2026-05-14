Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF042848BA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 23:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778800684; cv=none; b=ckHD5+Prg8totzjAkGb6uyiAbT17CN8rgK86NfcffJBD8XfI7KB+SBVECi5802LhWQV+QIQlnpoYdvG1x1FwlSDIreqo1r1yUFRM787rnVRlCQ7tYeckbeMXyvrRpmaxGMGeqOnundRImPbgFHYJukZJ390TvXAeS3BXiFrULVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778800684; c=relaxed/simple;
	bh=5VwjrLrDHL9YUhDU6anPFwxWK88/mP9nZhw41n1Kt7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P24J5w4/tG7XMcbNnRHds/1tShFzzq//LinZf2ylYL1MG6UY+Fw9MNv2yXe6k/PDl4i1Jt2XZTM1NenRGHGhM0IJY1CRIPgBQIh2oHTmvhziUq1BtkbmjmYOsRW7PntOdOzarxKtl51zXUo4EMgKaiEipi9ZDDf6YnKskSG0vw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJ0QAxrj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJ0QAxrj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000CCC2BCB3;
	Thu, 14 May 2026 23:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778800684;
	bh=5VwjrLrDHL9YUhDU6anPFwxWK88/mP9nZhw41n1Kt7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AJ0QAxrjR4uDma2uUvvZIE1bCymWUOh3VPsDEdPzxj+fQdBqi36j+NeqZf1+VvksZ
	 za3EHAFGt38HVec6t0ks0SnXx/HVADucasA6bJTOpaaDi+XH82HiLDQwuYh2pJe+bj
	 +8HkrcEC2bZCBEAnsttvWC9TUzt7MzhUOlzms0dypXegXxMIoHAzdOF1ipE3radubD
	 xOsWppnLErhpLSYZj4gY9KCuftW3zVm8dIN2tHVL2SJtj39bA71cZ31u4Ib0hfB9SL
	 2e60Y/G0IE3kb22cYz9hcysOJvvBXipAtY6cYpxYbiekF53V4yfyyq1oCjzYxIczcn
	 27kr/js+fXL8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/17] arm64: dts: realtek: Add EL2 virtual timer
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Zyngier" <maz@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514150945.3917510-15-maz@kernel.org>
References: <20260514150945.3917510-15-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 23:18:03 +0000
Message-Id: <20260514231804.000CCC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete implementation: missing update for Realtek Kent SoC fam=
ily which specifies an incorrect EL2 virtual timer interrupt.
--

commit 3b73638950a28ecc324e1c28fa4fb9fcb13d5567
Author: Marc Zyngier <maz@kernel.org>

arm64: dts: realtek: Add EL2 virtual timer interrupt

This commit adds the missing EL2 virtual timer interrupt to ARMv8.2-based
Realtek SoCs. It updates rtd16xx.dtsi by adding the fifth timer interrupt
with GIC_PPI 12.

> diff --git a/arch/arm64/boot/dts/realtek/rtd16xx.dtsi b/arch/arm64/boot/d=
ts/realtek/rtd16xx.dtsi
> index 3a7f6e35b7f74..43b13d133c324 100644
> --- a/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
> +++ b/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
> @@ -105,7 +105,8 @@ timer {
>  		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
>  	};

Does this update miss another Realtek ARMv8.2+ SoC file?

Looking at arch/arm64/boot/dts/realtek/kent.dtsi (used by RTD1501, RTD1861,
and RTD1920), the fifth timer interrupt is currently defined as
<GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>.

PPI 9 is the GIC vCPU maintenance interrupt, rather than the EL2 virtual
timer interrupt which should be PPI 12:

arch/arm64/boot/dts/realtek/kent.dtsi:
	timer {
		compatible =3D "arm,armv8-timer";
		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
			     <GIC_PPI  9 IRQ_TYPE_LEVEL_HIGH>;
	};

Another patch in this series (clocksource/drivers/arm_arch_timer: Default
to EL2 virtual timer when running VHE) changes the driver to use the EL2
virtual timer by default on VHE systems.

If the kernel uses the EL2 virtual timer on these Realtek SoCs, could it
request the wrong interrupt (PPI 9 instead of PPI 12), causing timer
interrupts to not be delivered and resulting in a boot hang regression?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514150945.3917=
510-1-maz@kernel.org?part=3D14
