Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CE42F71A
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434499; cv=none; b=X0vCDk9pjXjDPaWOuzaEL7gMjTj1JimaWI6DuGLiDmFSKmDezI6P81pbxIWnC93uEdF3+KLJETCx1fudOC5ED7Ur8cx2Wktv1CxDOGrsZA6yEWVhVPbc/i9zuvguEhVyHWrO0NfrSkm5uVuOHmtrL2zSYjw7vXg/fnAisdtrH/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434499; c=relaxed/simple;
	bh=RnBO8GvLZWBzSRhkDfw0A3UiNTRSY545Ssz20vNwOgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nyJUKIMLWcWOOTkh8kVw3ZK0Wp+rx0SO/23FYWgc4UEPsfXTVvwbpJSg57SN5UYomUOGqatASG/vvMhp6HaQOXBDHmZQ+tfY3YdGx6pZ0f1OAhMMa2IwWQaQObjU0nba33cCHiT+aTeCO2jjG06McBEjE4c/rE6UAsOFgQb0f6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtTgMoTi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtTgMoTi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695821F00A3A;
	Tue,  7 Jul 2026 14:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783434496;
	bh=Nms9/XZgwR9douNdc28TyXxyzdrvEOBewOrL1S/fLgI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CtTgMoTiDmUKRF+AunWWAqJT/IJh/zgOfsCeWoSL4Jewbx9slF4TKppyZR2uLVgy6
	 skc3zofrZAZFq0AOuw/LermFiV38jHg2emZIjUMvkOFKN2rxwh0+ah/fAGcLCvSfFe
	 ntubjONyryzm1SZc8LnHpfT7+V53KcMyo8wSUaWfyKASRsa+aj5dyfnGiqCDfYUmJf
	 bO6mbBIe5puaJ+GNxtEyI3N4WHTsr5x2KZK3lAZbwasii0J1NSPQlZ5+fkh2LMOIXM
	 OEEC/7i++JSaSfLdkzv1nUIY0rQ7mT9wUvH0z3ToH5aIiPPwWF35FP/pSzkzGCbPZ/
	 eTpi/hPtTjyxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/12] phy: phy-mtk-dp: Rewrite and document default
 driving param macros
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707141931.191172-10-angelogioacchino.delregno@collabora.com>
References: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
 <20260707141931.191172-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:28:15 +0000
Message-Id: <20260707142816.695821F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch uses `FIELD_PREP_CONST` (and earlier patches in the serie=
s use `FIELD_PREP`) without explicitly including `<linux/bitfield.h>`.
--

--- Patch [9]: [PATCH v2 09/12] phy: phy-mtk-dp: Rewrite and document defau=
lt driving param macros ---
commit e682fc4989b37eaa003ac03d4d2a9a69b306a63b
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: phy-mtk-dp: Rewrite and document default driving param macros

This commit rewrites the default driving parameters for the PHY using
FIELD_PREP_CONST. It also adds definitions and comments to explain what
these parameters are supposed to set.

> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy=
-mtk-dp.c
> index d0ef8e8f6670c..9a800d6b91c3f 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> @@ -85,51 +85,47 @@

[ ... ]

> +#define XTP_LN_TX_LCTXC_SW2_PRE1	GENMASK(5, 0)
> +#define XTP_LN_TX_LCTXC_SW3_PRE0	GENMASK(13, 8)
> +
> +#define BUILD_DRIVING_PARAM_0(sw0_pre0, sw0_pre1, sw0_pre2, sw0_pre3) (	\
> +	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW0_PRE0, sw0_pre0) |		\

[Severity: Low]
This isn't a bug, but should linux/bitfield.h be explicitly included since
this code now uses FIELD_PREP_CONST?=20

Relying on implicit inclusions can cause build breakages in the future if a
header like linux/phy/phy.h or linux/regmap.h stops including it.

> +	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW0_PRE1, sw0_pre1) |		\
> +	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW0_PRE2, sw0_pre2) |		\
> +	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW0_PRE3, sw0_pre3)		\
> +)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707141931.1911=
72-1-angelogioacchino.delregno@collabora.com?part=3D9
