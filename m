Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB1C547071
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 20:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058349; cv=none; b=dJRe2SlancSyCu13iJkmCYqiFICt2PFen+BBACYIXDC9HZnQeocYIo1HHhj2aYkxQDvneTCLrfQ/nBADmB1p6gH05d66Nb0m4mj8Psas6C0i14mvysEHQR/MHs+ernn82IP+OLfALj4SkGvsB2ImpHm/lOxkXRJ6spoiqYBovuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058349; c=relaxed/simple;
	bh=wDFNDRm2nkEqW2oUnwmWVkt4GCw3jDltql+jKvWHn9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o6gB4YYelhgtRToQLWT9Mrsclcuh6jrNiGmRBYZtm27FS7m7Nj3JybcwmwL1cH79uHqz9kDUu0Q2oFMm4bQ6z18ZXwhaXSOuEXfKTu4fTCeIEwOMCqAymnXZ+3bt4Ag1DHjyqqchsy8Ymcqm834u5JcaVvi3DLtEaPA2k3d2xwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9hxfL4P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9hxfL4P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4A21F0089B;
	Sat,  3 Oct 2026 20:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791058348;
	bh=PETVYlALKVpYI3mZ6kwLDBMO2S9eWoODGUp/4KNKTeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q9hxfL4PvJjthTELW+6DEXd+Qd0x3NLqX8FbXmnPRh9IcZumW4rZ/KRkLQwmR6tdI
	 NZ1/YLiMio24cmxkfw+PWI+AlypJUYZGsshH183I23bNeH34Jv9dDAxzi0X4/wKr28
	 tVdOAM2jWBwkXFRMdL+J8ao6fMknUQQhx2lMb65S2C+NLTtTLrzJ7NLRZwdfbRGthv
	 Zi5+W3jR6XQxDoTd2OBcf4+QGiS7tIxY+pCxmxYS65Fo0kiDt0ZFupJF11J3f6dqp9
	 elgzOEGPuf9ac5ua6Vw2eq8uKph7D/Qw8tSEV87iDkyyYyDPdgo+OKL1Y7SNbdRUFT
	 x9UPJIoFBrpdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8188: Add the MFGCFG
 phandle to the GPU
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20261003200132.866240-4-michal@nozomi.space>
References: <20261003200132.866240-1-michal@nozomi.space>
 <20261003200132.866240-4-michal@nozomi.space>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 20:12:27 +0000
Message-Id: <20261003201227.9D4A21F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/panfrost: missing GPU timestamp quirk on MT8370
--

commit ad326344199c9c294e6415c92318bcef828d8630
Author: Micha=C5=82 Kope=C4=87 <michal@nozomi.space>

arm64: dts: mediatek: mt8188: Add the MFGCFG phandle to the GPU

This commit adds the MFGCFG phandle to the GPU node in the MT8188 device
tree. The GPU driver requires this configuration block to enable the GPU
timestamp counter, which otherwise reads zero.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index 14a320f0c70cb..b4be89bf55bf7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -2266,6 +2266,7 @@ gpu: gpu@13000000 {
>  				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
>  				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
>  			interrupt-names =3D "job", "mmu", "gpu";
> +			mediatek,mfgcfg =3D <&mfgcfg>;

[Severity: Medium]
Since we are enabling the GPU timestamp counter via the MFG configuration
block for the MT8188, does the MT8370 SoC also need its corresponding quirk
updated in the panfrost driver to avoid breaking userspace timestamp querie=
s?

Looking at drivers/gpu/drm/panfrost/panfrost_drv.c, the mediatek_mt8370_data
struct is defined as:

static const struct panfrost_compatible mediatek_mt8370_data =3D {
	.num_supplies =3D ARRAY_SIZE(default_supplies) - 1,
	.supply_names =3D default_supplies,
	.num_pm_domains =3D 2,
	.pm_domain_names =3D mediatek_pm_domains,
	.pm_features =3D BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
	.gpu_quirks =3D BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
};

This struct lacks .vendor_quirk =3D panfrost_gpu_mt8188_quirk.

When the driver probes on MT8370 using the mediatek,mt8370-mali compatible,
the missing quirk means the MFG configuration block is never enabled. As a
result, the GPU timestamp counter will read zero on the MT8370 SoC.

Could this be an omission, or is it intentional to skip the vendor quirk
for MT8370?

>  			nvmem-cells =3D <&gpu_speedbin>;
>  			nvmem-cell-names =3D "speed-bin";
>  			operating-points-v2 =3D <&gpu_opp_table>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003200132.8662=
40-1-michal@nozomi.space?part=3D3
