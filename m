Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BEA23EAB0
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123201; cv=none; b=eyP/Aer3ebC6FaDznrRaSGmRSfrvTv/U8+jOAJg1wQRsvAMtnyae1W/KKLBQG4iV3T9XyXtTgOusvEG9/mOt0hJpOEqbizI0soO243K/0Ug4QiMgMv3hZlorL/FPJvhJZ0E/Jrh84mANVUzd9fU7r++Rfjox9Rx+AiQDf2e9jco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123201; c=relaxed/simple;
	bh=uvlMJ5vILQYD/9BxBJObF0RLvq7HjSAR/xC42Jf9VJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s5oeKKw+ZGwWJ7IE91a94/qUMw+79AMWtc/X6hUy2FZ+KEUmnU864OPHipFG/Nz68Db1bMTYbyVaSpPM1/ePT2v4aYfumL98vEad7PvMgkc8mOdfkY7GYmP5o2nWYwD5plYU7/D7q+dmrB5GA8E/eAIZKWDA1RmeOuN8ww/1Lgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc71g7Ef; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc71g7Ef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E668EC2BCB7;
	Mon, 18 May 2026 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779123201;
	bh=uvlMJ5vILQYD/9BxBJObF0RLvq7HjSAR/xC42Jf9VJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jc71g7EfMXc4bzg9VFQV9Mlk84uTkXY6aeOlFuf0QljEEXCEjEXvKfxWIqk6Sl2AF
	 J2/xYRURflW+X7csc5vALIKRBgdn2MwCy9LrTzz3yc6fkVLqw2/+BByx5yjvm5pEDL
	 svKfe8a776k7VK6dmwggbIyj4EQAwnIcLk7Aw4M2i91RGC0Ay/tBlip7u0FanJ8gF2
	 gpp8e5No6v3vXecf0WQZFdG0rOWPFg/FJR7maY85RjjjxAhCW2taUF2vToqtYRla5R
	 iFekdpKdRN5lvGn6PFJ09FgofxN+r/0+hen/Gjg68cDkaTMB/pa6Xccq2pUcqD5fBN
	 7xPiLixuzrWhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] regulator: Add regulator driver for Unisoc
 SC2730 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T3R0byBQZmzDvGdlcg==?= <otto.pflueger@abscue.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518-sc2730-regulators-v2-3-9a5b3a7b1e49@abscue.de>
References: <20260518-sc2730-regulators-v2-3-9a5b3a7b1e49@abscue.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 16:53:20 +0000
Message-Id: <20260518165320.E668EC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Suspicious register offset for SC2730_LDO_VDDCAMIO_VOL likely caus=
ing hardware corruption.
- [Medium] VDDSIM0 and VDDSIM1 regulators are defined in the ID enum but mi=
ssing from the implementation.
--

commit 4ec7f05ad02ea803e08d80518802d7f53f87381d
Author: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>

regulator: Add regulator driver for Unisoc SC2730 PMIC

This commit adds a regulator driver for the Spreadtrum/Unisoc SC2730 PMIC,
used with SoCs like the UMS512 and UMS9230. It is based on a downstream
driver provided by Unisoc and the existing SC2731 driver.

Link: https://github.com/MotorolaMobilityLLC/kernel-sprd/commit/30be0ddfe6b=
9a877fc9c328fbd2bae84e645eb31
Link: https://github.com/MotorolaMobilityLLC/kernel-sprd/blob/android-13-re=
lease-tla33/drivers/regulator/sc2730-regulator.c

> diff --git a/drivers/regulator/sc2730-regulator.c b/drivers/regulator/sc2=
730-regulator.c
> new file mode 100644
> index 0000000000000..18c1280330ef9
> --- /dev/null
> +++ b/drivers/regulator/sc2730-regulator.c

[ ... ]

> +/*
> + * SC2730 vsel register
> + */

[ ... ]

> +#define SC2730_LDO_AVDD18_VOL		(SC2730_REGULATOR_BASE + 0x104)
> +#define SC2730_LDO_VDDRF18_VOL		(SC2730_REGULATOR_BASE + 0x110)
> +#define SC2730_LDO_VDDCAMIO_VOL		(SC2730_REGULATOR_BASE + 0x28)
> +#define SC2730_LDO_VDDWCN_VOL		(SC2730_REGULATOR_BASE + 0x120)

Could this offset be missing a leading 1? This offset places the register
in the pre-DCDC space rather than the LDO block that starts at 0x100.

When adjusting the VDDCAMIO voltage, could writing to 0x28 corrupt
unrelated PMIC registers instead of setting the intended voltage?

[ ... ]

> +enum sc2730_regulator_id {

[ ... ]

> +	SC2730_LDO_VDDCAMMOT,
> +	SC2730_LDO_VDDSIM0,
> +	SC2730_LDO_VDDSIM1,
> +	SC2730_LDO_VDDSIM2,
> +	SC2730_LDO_VDDEMMCCORE,

Are VDDSIM0 and VDDSIM1 supposed to be supported by this driver?
They are declared in the enumeration here, but are missing from the
regulators[] array implementation below.

There is a 36-byte gap between VDDCAMMOT_PD (0x170) and VDDSIM2_PD (0x194)
in the enablement definitions, which would perfectly fit a standard 12-byte
stride for two missing LDOs.

If these regulators are managed directly by a modem or intentionally
excluded, should they be removed from the enumeration to avoid unused
identifiers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-sc2730-reg=
ulators-v2-0-9a5b3a7b1e49@abscue.de?part=3D3
