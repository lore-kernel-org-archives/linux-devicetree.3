Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7431FBEBC
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778548411; cv=none; b=HmO2p8djdz9zHBxGUGuwmvXg2RqeYnx33dPgqbi1RbBSHdomNc7E3o2ANoapxCScjZ6ay2+P2okmuDRr2BFMtgdDZjoOu236+t8dH8JXNWwg3/fD3rwstpg2awM7g2DbE8XbMFDKr6KbuWDeoQvKRFbZyeg3CBqFs1oJ1RL8X/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778548411; c=relaxed/simple;
	bh=gN4/sMoIRXaKmiGhPaRAvFKwvZTEbeGGQmu3IFlUBkg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c1sNzb62axgFKjEkuxdmUMzD+GEHM96SXuBH25uMMlrIrDHmjze4DGucClWiO7Kh7j9Sz/w/ZEcrg5+1C10IupbnJdwRGekPOM+RHnHJBusaPI23nxM3mlXlX8Pt4SWqZu4hwCBD/1TvGg/aHCegwl+PhAQPX4zOJ0RxwJ01kvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdpGGXiw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdpGGXiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD609C2BCB0;
	Tue, 12 May 2026 01:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778548411;
	bh=gN4/sMoIRXaKmiGhPaRAvFKwvZTEbeGGQmu3IFlUBkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kdpGGXiwWAkEPJyOoyv9mqjDMxw2X7MnIUApKjQ+3cjjdj/JvHk6kVAIp9tZO7vWs
	 cu7BkPikprg96xT2TC7KZ5MWc43RrjYbvWyF7gymPW+RPdrgE43s/EHgM7iG2kk+i8
	 HxKVKhDfKtsbAVSdkaCjBcoTupgpIljfOw43T2LCyU6dPWLirOrp1o/3XGwaAzZeWi
	 OpLcSx3FQhpfmHhLhjs5xYhgS8Xtuh72X2CrqxF/axuAmNLPxtpUo+ZkN80cUKA/Zb
	 3xG8qDWlYqUwERtEA1JRc9d3c1OuSVXil1sjJ7ecVvl5XRdBzng/MtceLD2NvFd+/i
	 bb1UBWKwla6Gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/8] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Reply-To: sashiko@lists.linux.dev
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-2-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-2-ae48c0b2b2cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:13:30 +0000
Message-Id: <20260512011330.BD609C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect condition used for targeting removable card scenarios,=
 leading to power regressions for SDIO devices.
- [Medium] Missing explicit clear of SD-specific vendor overrides for non-S=
D controllers.
--

commit acf2ed5de9b1d692d653b998c6c50d3cddd4cff5
Author: Iker Pedrosa <ikerpedrosam@gmail.com>

mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation

This commit enables clock generation for SD operation on the spacemit
sdhci-of-k1 controller. It sets SDHC_GEN_PAD_CLK_ON for all modes and
conditionally overrides automatic clock gating for SD-only controllers
to handle removable card scenarios.

> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k=
1.c
> index 455656f9842df..0dd06fc19b857 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c

[ ... ]

> @@ -101,6 +108,12 @@ static void spacemit_sdhci_reset(struct sdhci_host *=
host, u8 mask)
> =20
>  	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
>  		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTR=
L_REG);
> +
> +	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_=
CTRL_REG);
> +
> +	if (host->mmc->caps2 & MMC_CAP2_NO_MMC)
> +		spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
> +				       SPACEMIT_SDHC_OP_EXT_REG);
>  }

The commit message states that the SD-specific clock overrides are intended
to handle removable card scenarios. Does checking for MMC_CAP2_NO_MMC
unintentionally apply these overrides to non-removable SDIO devices?

The MMC_CAP2_NO_MMC flag indicates the absence of eMMC support, which will
evaluate to true for both removable SD cards and non-removable SDIO modules
like Wi-Fi chips.

If the clock is forced to remain continuously on for SDIO devices, could th=
is
override automatic clock gating and cause a power regression by preventing
deep sleep states?

Additionally, does this setup leave the vendor-specific clock overrides act=
ive
on eMMC interfaces if they were previously set by a bootloader?

Since SPACEMIT_SDHC_OP_EXT_REG is a vendor-specific register located at off=
set
0x108, it is typically untouched by the standard SDHCI_RESET_ALL mechanism.

If a prior execution stage leaves SDHC_OVRRD_CLK_OEN or SDHC_FORCE_CLK_ON s=
et,
the absence of an explicit clear in this path could prevent automatic clock
gating on eMMC interfaces.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-orangepi-s=
d-card-uhs-v9-0-ae48c0b2b2cf@gmail.com?part=3D2
