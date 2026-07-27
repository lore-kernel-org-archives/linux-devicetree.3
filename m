Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA3273803
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138766; cv=none; b=NlZzAywtonCV16MKEA41aPpO0SnTk0Po1WWFevJvkg/siP5lUct8CWfM3ssCzR+bsATguzdeL/xkgZnDvh5xIoc25MtkfarebSZd3C2VEXp2sD1BrrXnsA2ATG+Ah6VPig4xKxCWUgTj/eAH0HXhXXIqHrwDAz012jpyCSRMQXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138766; c=relaxed/simple;
	bh=0YzvwP1KqgQEt9rmirEJaABpauB7eZUw3yr1UFyd/S0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N8qySN7NjwjyDx8QsJ5EXcVK7umXsRHukrwJnSVDGpbcegIxjBqxvlAkb1B9XI5ff2093FSQyzHPLc0nkUnbnmxbVEeagaeH38y0YVRwjkmJ+JG4syteZUjiOI5Bzl6oDycT3X/6/JZA73Kf4ct7K2UqScyOUk5cGCAnIYMvkBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWrCSasm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWrCSasm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2891F000E9;
	Mon, 27 Jul 2026 07:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138764;
	bh=p+jF+DZBLsyUiLH1GLcUKmfUlDfs2W8xPjlyMey+0Fo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fWrCSasm2lP10MJN9tFLEOywEA1g4gLACBS7iB4mAFA/C+k6LwxImg4gS7v85FV7Z
	 /aUEIILlnHaBD5L2MZT3pkrHbNIWDxNgEnnthRsVTyDc5ipm8b5JtqE44CRuC0Afud
	 kARGDb9Ikw9PJMvUk5FfGM67usYQA0HMF9chcapABKGB4loXWcV3j6rh/eShEzfc2i
	 +RRBxVMJFTJJtkETj+iTS2XRyuOL3UFIxIn3B9TeFkBeccXrmNmb4Kd2M3aZfQjWMp
	 cPUViuzIRvOjdaubcziTaYoTKsdzQJnQP9uyIPf6eS97WSxmcfDB6nVXA4cqhggBzX
	 JLfjxjwVe33AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/34] pinctrl: airoha: an7581: fix misprint in
 bitfield name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727074234.3761170-5-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-5-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:52:43 +0000
Message-Id: <20260727075244.7B2891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `an7583_mdio_func_group` incorrectly applies `GPIO_MDC_IO_MASTER_M=
ODE_MASK` to the `REG_GPIO_SPI_CS1_MODE` register, causing hardware configu=
ration corruption.
--

--- Patch [4]: [PATCH v7 04/34] pinctrl: airoha: an7581: fix misprint in bi=
tfield name ---
commit 69c3ff6d2f6ded4cac1d3fa356dd0e46f67e9ed4
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7581: fix misprint in bitfield name

This commit fixes a typo in the bitfield name for the GPIO_2ND_I2C_MODE
register, renaming GPIO_MDC_IO_MASTER_MODE_MODE to
GPIO_MDC_IO_MASTER_MODE_MASK.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 04b4424c688b2..63c82268aa823 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -1051,8 +1051,8 @@ static const struct airoha_pinctrl_func_group an758=
3_mdio_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_SPI_CS1_MODE,
> -			GPIO_MDC_IO_MASTER_MODE_MODE,
> -			GPIO_MDC_IO_MASTER_MODE_MODE
> +			GPIO_MDC_IO_MASTER_MODE_MASK,
> +			GPIO_MDC_IO_MASTER_MODE_MASK

[Severity: High]
This isn't a bug introduced by this patch, but is it intentional to use
GPIO_MDC_IO_MASTER_MODE_MASK with the REG_GPIO_SPI_CS1_MODE register here in
an7583_mdio_func_group?

It appears that BIT(14) in REG_GPIO_SPI_CS1_MODE maps to
GPIO_PCM_SPI_MODE_MASK rather than MDC IO master mode. Could this fail to
enable the MDC IO master mode for MDIO and unintentionally alter the PCM SPI
mode instead?

>  		},
>  		.regmap_size =3D 2,
>  	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D4
