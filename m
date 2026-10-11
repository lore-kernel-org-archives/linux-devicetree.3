Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928F536194B
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745065; cv=none; b=VL8N/lTRSVdXTmfO+77CroiWxp0W8l8Xtz7bVs5gspEWOHUiJ+F9FiUulqnJs/VkSbu4o+KrnQUmNu+8Vi2n7mr3EYl7wD/2GlcEBV1atBkN6VVhjpGtvftDYhazmHisjXFYP0OigNUDtrbqd/hp7qQjGbM7wcFqy3bSy2KWNy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745065; c=relaxed/simple;
	bh=wPL+F2VwdFt88P1Qu06soIQMQM48cS+4Bk8dZ7vqQhU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lj0ZcdsARLAQ+gka7EKebd4BRsDgPjZs72AZtNtoTdowQZK37jCtHf3NTUXM0fZraevURkQWFU+Pe5Una1o4QksNEDI8fkCWK2i1/XkaGUx7XCTcqFCCeDy3PCfX50EE4v3g6wcQKh6fQdJPvaUSwFPjc2/7MHhDVw5fDw2DpJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5vrxDws; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5vrxDws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000E31F0089B;
	Sun, 11 Oct 2026 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791745064;
	bh=PQGJrl4MytMTi5rqREq5PVwSXMRGTVeNuPMGqZSL00Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a5vrxDws9fSHERKZQagX0y6Mv0m7KulcNEPGEySLSs1bWYjxMUFcrXL6XGK8RsZBN
	 pnOzOnwJJQwH7SRmD+EEB3Gx3wbm11xxKFIsZKROe30DJfGBGAfpJXfDtbFHmS2hWn
	 smXD1XP2ZQ5v9/Ezz/ciekErq2DRQaegIZMCHLustVIa1zoPR81jK0evJXive9O7w5
	 jPZTDl0sWu3hsFgHp7fq9sF3qt0D1Kymt6n4yBiRL3xmK0HiQwb2eA7yoCpkqlloDi
	 yfp8m9ZEf5z6WOFJZiKGTuPEMfrPnXbdfjHSlZm19kIg5gLt+KBPpBPOb3bbdimXyR
	 04/scSL8BGKeg==
Message-ID: <sashiko-outbox-167389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] pmdomain: mediatek: mt8188: Enable the GPU
 timestamp counter
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011184755.2058017-4-michal@nozomi.space>
References: <20261011184755.2058017-1-michal@nozomi.space>
 <20261011184755.2058017-4-michal@nozomi.space>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 18:57:43 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: ABI breakage for MT8188 older kernels via access-cont=
rollers
--

commit 67ac5bbd1956b4f1ebf5fa4f2f96f5fd7b231689
Author: Micha=C5=82 Kope=C4=87 <michal@nozomi.space>

pmdomain: mediatek: mt8188: Enable the GPU timestamp counter

This commit adds MFGCFG as a second MT8188 access controller to maintain the
GPU timestamp counter. The counter loses its SoC system timer configuration
when the MFG1 power domain is turned off. Setting these bits when MFG1 is
powered on fixes always-zero timestamps for GPU jobs.

> diff --git a/drivers/pmdomain/mediatek/mt8188-pm-domains.h b/drivers/pmdo=
main/mediatek/mt8188-pm-domains.h
> index 3a989e83e9b79..88035cc6a808b 100644
> --- a/drivers/pmdomain/mediatek/mt8188-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
> @@ -14,8 +14,21 @@
>   * MT8188 power domain support
>   */
> =20
> +#define MT8188_MFG_TIMESTAMP			0x130
> +#define MT8188_MFG_TIMESTAMP_EN			GENMASK(1, 0)
> +
>  static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8188[] =3D {
> -	BUS_PROT_BLOCK_INFRA
> +	BUS_PROT_BLOCK_INFRA, BUS_PROT_BLOCK_MFGCFG
>  };

[Severity: High]
Can adding a second bus protection block cause a regression on older kernel=
s?

Older kernels hardcode soc->num_bus_prot_blocks to 1 for MT8188. If they bo=
ot
with an updated device tree containing two access-controllers handles,
scpsys_get_bus_protection() will fail because of its strict equality check:

drivers/pmdomain/mediatek/mtk-pm-domains.c:scpsys_get_bus_protection() {
    ...
    num_handles =3D of_count_phandle_with_args(np, "access-controllers", NU=
LL);
    if (num_handles < 0 || num_handles !=3D soc->num_bus_prot_blocks)
        return dev_err_probe(dev, -EINVAL,
                             "Cannot get access controllers: expected %u, g=
ot %d\n",
                             soc->num_bus_prot_blocks, num_handles);
    ...
}

Will this strict check return -EINVAL and prevent power domain initializati=
on
entirely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011184755.2058=
017-1-michal@nozomi.space?part=3D3
