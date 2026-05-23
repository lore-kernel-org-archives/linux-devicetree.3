Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB10C3A3E8E
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779546002; cv=none; b=OzkV0P1v3tc5Tnt4dnx4raDKT2X1gpfRyxDPRaoz/6bwCrt8sOtvw61BCqngmsRBlZopH7d9TTRqVq/ZyWKitJPFbEI128EcK/6e2ZvltvPpRhVr+SR0863aJMpRF/A+QAF/ZVnV/FU/HMmWl1cAD27B7PZkAucnA6M957DcGHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779546002; c=relaxed/simple;
	bh=1V7wKYvXWJw3XHDpkC90s3NR8cUV00dla1GHSXHQ1ZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RIcjv9MiKPrQIdxtLcq32TPOFBxFjwzVxBPBK7Op4XUNUAsAaOJiZcJKfa6fQdDErlsgO727kfM10mpzPNxdeIJOeE/7BVXkouRnC0HArFm9PvT0+MhPZI0YajludovcBJ0jn0W0o0zd7v2vEyfysAlNbv2CjS5npxZq1Q5O2A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzA5NND2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzA5NND2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FA81F000E9;
	Sat, 23 May 2026 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779546001;
	bh=Lpr2UPgZXVHyF3xBxkxk96PjZYOZn0e8p6n0vmx3PsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZzA5NND2PtrDRbS/DDReFJ/98xAePezqxi5NDDKw/ar5rVlfhHR/mNcmaeGktpESY
	 OJ7ePqD4rB2zl86IJakGF/grxUcSjXwaHElDu/IJX7gwcaEkjWzwa0xAQAqajaz7C0
	 RYMdzOIHCQNN6R/Dpl3HmQA+WonMrpGLGJGGdGOBO3UzxodmsehnulB+dKwz73lKlg
	 3WhZ77lmz01W4EquwmftzJwAXFT20Vsv5HU8WhP2hWxMYvEnJIQPBdMkTpWo/B/tGh
	 2PmXkwiLwnr/dbQyWKaimOVNnoIEBtgx6jtlbPVlKdffIQba+fQ2Xx1a1LT9LLpz24
	 PUtTw3yWaoH4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/17] arm64: dts: realtek: Add EL2 virtual timer
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Zyngier" <maz@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260523140242.586031-15-maz@kernel.org>
References: <20260523140242.586031-15-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 14:20:00 +0000
Message-Id: <20260523142000.E1FA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The EL2 virtual timer interrupt (PPI 12) in `kent.dtsi` is incorre=
ctly configured with an active-high trigger type (`IRQ_TYPE_LEVEL_HIGH`).
--

commit f079ad98f64e8cdedfbfede9fd625a2762e0efa9
Author: Marc Zyngier <maz@kernel.org>

arm64: dts: realtek: Add EL2 virtual timer interrupt

This commit adds the missing EL2 virtual timer interrupt for ARMv8.2 based
Realtek SoCs. It also addresses a conflict on the kent platform by changing
the EL2 virtual timer assignment from PPI9 to PPI12.

> diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/=
realtek/kent.dtsi
> index ae006ce244205..4147e4269247a 100644
> --- a/arch/arm64/boot/dts/realtek/kent.dtsi
> +++ b/arch/arm64/boot/dts/realtek/kent.dtsi
> @@ -23,7 +23,7 @@ timer {
>  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_PPI  9 IRQ_TYPE_LEVEL_HIGH>;
> +			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Should this interrupt be configured as active-low?

ARM architected timer interrupts are universally active-low, as seen in the
other interrupts for this timer and the newly added PPI 12 in rtd16xx.dtsi.

It appears the update changed the interrupt number but kept the
IRQ_TYPE_LEVEL_HIGH polarity that was used for the GIC maintenance interrup=
t.
Could configuring the GIC with the incorrect trigger type lead to missed EL2
virtual timer interrupts or an interrupt storm?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523140242.5860=
31-1-maz@kernel.org?part=3D14
