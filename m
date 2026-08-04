Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED92D47E9
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847081; cv=none; b=Q8HsGOUUp0buxCL4vdD94VKaILItHORQYY8aF/UUej5x47BaO0DLlx4Qz/RDWy2volyIJNOqStEppBCf4Hi5orTgZ8mHauIchUlPnwAB1P/dLTelbTeLPOsOFbGvfqenOlMKP5lgnTHnElNFvHmGV9cY1lQVIKAQLyIJsSVSTxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847081; c=relaxed/simple;
	bh=FIW7OFnr9P29gV4CItWODEzfvrhMV6h2XDv6xojMso8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mxHNGQGSqRTSnCYRU4frehQXY9ruZlNh58sPqp+pQDpyJh0ErrACxrVNm09UnU+b30y7IQTyKtruXIMkxBxJEE+eSJsQTE/M0BwmQ9e/gZPqFEfLL1gjzyH6jTqeI8GQIDHnVap3YXaOZpE+Ym6n+33/V+bpTpxn9Vm+E48+48M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHFu3I2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHFu3I2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745AE1F000E9;
	Tue,  4 Aug 2026 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847080;
	bh=Cu24YGS4maiUjZkGccStrwbYvf6/k7R6LXMY12zR6x4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lHFu3I2NZiYiFySTEEycEDKunrGtp1EieOEmyK0/N91ushoFi64pA+NKFR+ktuV1d
	 f8ThxhZK66Ht/ItbR7ZFbm+nCfK85FQxFE+vkt2r/Iyn30gzU18vDKW9Y1h1JpVSyB
	 A1VMS+5m/0zhUnBs7AVjYxXDamuvzBHfV9SPSk+jy75GEqnorPcrF7qkkAZbChNfj0
	 aoauTxB+ateZ1vDMNEYSCqxmcPk26HO12WpYku2G0ZqasFFHZh35NwoVwlogsF6YaR
	 yV/1Un2feroGHOMecPm7KNs1cJ+T4GrCi4enqJ9PSlfftOu4QhZLDVnAZcT2SgfHgc
	 b8tPuNxfDzKNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 1/2] arm64: dts: qcom: Add SD Card support for Shikra
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260804122054.3462145-2-monish.chunara@oss.qualcomm.com>
References: <20260804122054.3462145-1-monish.chunara@oss.qualcomm.com>
 <20260804122054.3462145-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:37:58 +0000
Message-Id: <20260804123759.745AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `interrupts` property for the `sdhc_2` node specifies 3 cells =
per interrupt, but the interrupt parent requires 4 cells.
--

--- Patch [1]: [PATCH V4 1/2] arm64: dts: qcom: Add SD Card support for Shi=
kra SoC ---
commit 83ca6e70b2f615f092668ff7fd7effef71d8d1fa
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: Add SD Card support for Shikra SoC

This commit adds device tree support for the SD card interface on the Shikra
SoC. It configures the sdhc_2 controller and provides the necessary pin
control, clocks, interconnects, and operating points.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi

[ ... ]

> +		sdhc_2: mmc@4784000 {
> +			compatible =3D "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
> +			reg =3D <0x0 0x04784000 0x0 0x1000>;
> +
> +			interrupts =3D <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Does this interrupts property provide enough cells for the interrupt parent?

If the interrupt parent for this SoC requires 4 cells (such as=20
#interrupt-cells =3D <4>), parsing this 3-cell definition will fail during =
boot.

This could prevent the sdhci-msm driver from obtaining its interrupts, caus=
ing
a probe failure and leaving the SD card non-functional. Would it be correct
to add a 4th cell here, matching how sdhc_1 is configured?

> +			interrupt-names =3D "hc_irq",
> +					  "pwr_irq";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804122054.3462=
145-1-monish.chunara@oss.qualcomm.com?part=3D1
