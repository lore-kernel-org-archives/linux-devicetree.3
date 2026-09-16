Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBB14E1C7A
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592596; cv=none; b=GHx7cPgphoeT7NEhWj+BGhYzieb/AytbMKmlTvyUDDwpEITPUIjdPVMJMHB0FLjIUNeilmxgdIEukHchpOklTxBjN0DSxmWlw5xcQATgv2UdFYvN0MgAb4RNBb800aynwGNBNdb+AEZl80bV23ZesmkcX5wKj14fjo0ohi5tD8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592596; c=relaxed/simple;
	bh=BzpCGQkUgZF7sEIB3bdKUMigjAiApt2t7+0FsbIPJJ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WpGLoV7J+QZ+Ym2BtDrlMU4xCmddjzdDWaMi9019U1TR59bCYyaViGc7Xuf9eF/d7eh0WXmNkXHTAriccMz8CKWYm6O8oGfy7uFVLP41mrkKL9dXTUbKylChJpXg6zkHnFUUSs+ycmZyhi3oR/3zP+q1upaglOTripsaWArzhhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzeN1Not; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzeN1Not"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24D11F00893;
	Wed, 16 Sep 2026 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789592574;
	bh=z00vZnWT0m+sDE3zhJtVavTq3m0lPjjObr5IgylE5zc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WzeN1NotZRiqUSf2jQ01qAiRMoTuQ3Eea0pK8dUh3tb/kz7BGZAt4OdeM1jf//Lq2
	 Tye66SHA3Hg4dosejEk6L+Qh7X4/13QJxn2z+ACUaJcRdiI/KCue8bccFbl5xNuTZF
	 Tqfz3Loe0IDXeYSFz9yVaG/iAx0Ll68McqlmiTxt39fRaRnlUTjILiYMyMNF6pcXaf
	 wpLi4Q5SCCNjrjT906brDQGGgQ9UW1oBixR0wJhPJKOYzW+cr0CEAlrS18cY2+nRzw
	 1Jzr0sZYE6SDpE+H+S8lRxRbmIl/9A2ux1+Xq25F2icOBfH2/vpbSZdlGhSlcgtoPQ
	 chdzFJO6G6O7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos: Add initial support for
 Samsung Galaxy A21s (SM-A217F)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thomas Turner" <tturner@lineageos.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260916205522.159393-3-tturner@lineageos.org>
References: <20260916205522.159393-1-tturner@lineageos.org>
 <20260916205522.159393-3-tturner@lineageos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 21:02:53 +0000
Message-Id: <20260916210253.F24D11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: unintended override of mmc_0 compatible string
- [Low] dts: build failure due to undefined gpu label
--

commit 5ffd2971505c8c2076142840ef189e608c1e56c2
Author: Thomas Turner <tturner@lineageos.org>
arm64: dts: exynos: Add initial support for Samsung Galaxy A21s (SM-A217F)

This commit adds initial device tree support for the Samsung Galaxy A21s (S=
M-A217F) phone, based on the Exynos 850 SoC. It defaults to the 3GB RAM con=
figuration and includes support for simple-framebuffer, buttons, MMC, USB, =
and watchdog.

> diff --git a/arch/arm64/boot/dts/exynos/exynos850-a217f.dts b/arch/arm64/=
boot/dts/exynos/exynos850-a217f.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos850-a217f.dts

[ ... ]

> +&gpu {
> +	mali-supply =3D <&reg_dummy>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Does this cause a build regression during dtc compilation?=20

The gpu label is referenced here at the root level, but it appears to be=20
undefined in the included exynos850.dtsi file. This would result in a=20
syntax error for the missing label when running make dtbs for this board.

> +
> +&mmc_0 {
> +	compatible =3D "samsung,exynos7-dw-mshc";
> +	mmc-hs200-1_8v;

[Severity: Medium]
Is this generic compatible string intended to override the SoC-specific one?

The exynos850.dtsi core IP block definition properly includes the -smu suff=
ix
for IOMMU integration. Overriding it in the board file with this older gene=
ric
string drops the IOMMU matching. This might cause DMA handling issues or
missing functionality for the MMC controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916205522.1593=
93-1-tturner@lineageos.org?part=3D2
