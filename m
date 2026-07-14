Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ABC2C11FD
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035461; cv=none; b=MJZGlIbloIwGdBaykoIyQq/DdcRmjCBmxtBR8xlgNJ1QObzISn8lkc49Y0qdtSocTnPNZIceeCSRGCvna1rrAtBYIhvEqUu5vhLzT/MLBYs87b8B9I9nvTulzMIzqJLrvmhyOeeWYxRcNBn3XsDYjapt50JJgJ/g9S0epu+08Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035461; c=relaxed/simple;
	bh=BqSsuOBbFdWtY4cEmSxeyiw96wMBimZYo87vcmLcTcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q2p25BgeAKOymFAzCL6JJ5LrTLMAc+wPKwXsKKT3WGdRNq+oAzifyG7k/9kkM81Q2hpCYX6NmNiEoKsY87V7JoLbSkHKuKRQWZj6jbyXJtwsykO1RJKrCNf+j+ugUyZWXNGjALSYjArppUdTPItXZVLOK5B4oQhNLQwLbsk/pQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4RyA26Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4RyA26Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7C71F00A3A;
	Tue, 14 Jul 2026 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784035459;
	bh=5Wr2hqswUi+9/4bFTyoMer2pNaPp4fDsZBsQri+BcLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h4RyA26QOt8JzgHX8D/l3Lw/puoEHMHOgpjhDcy9V6j9BAdWXzVGTJSJNtdHhZ/9P
	 Oglb7BkKFl7ETEmtoywz102YCiyv3JspDpQuPXfW0d0S1hZtTx3LIZyK1Oh4veS/Ci
	 bDqxoWxO13MjzvFFlfPauPOorarvSaDbVOkZTwaQbOWtIsIHhm8vAjq2GiQJiU6awP
	 wnP0w8u33mcMOwreyQi0eGj+8D2U/cM32MDoNTaetUWVvdCOOtdn4S6kDdIglO+wxk
	 Rt9FKyPf44GYGapyUGuhQFA1YsBb1uaMPbfrboEdICU7zVZAtlGT3AUiVNf2rzdBtl
	 mSZKYGlKFGUKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] soc: mediatek: pwrap: add mt6572 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-6572-pwrap-v1-3-d8e5a39cf7ef@protonmail.com>
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
 <20260714-6572-pwrap-v1-3-d8e5a39cf7ef@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:24:18 +0000
Message-Id: <20260714132418.AB7C71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional dereference and access of `wrp->slave->dew_regs` in =
MT6572 clock initialization can cause a NULL pointer dereference or uninten=
ded PMIC register overwrite.
--

--- Patch [3]: [PATCH 3/3] soc: mediatek: pwrap: add mt6572 support ---
commit 27b1606815262a3356b161758ca5a4ebb413b4ab
Author: Roman Vivchar <rva333@protonmail.com>

soc: mediatek: pwrap: add mt6572 support

This commit adds mt6572 registers and platform data for the pmic wrapper.
It reuses the mt2701 SoC-specific initialization function since they share
the same GPS_INTF settings.

> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> index a4b10b0a97cbb..4b8a5dc80a36e 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c

[ ... ]

> @@ -1733,6 +1824,11 @@ static void pwrap_init_chip_select_ext(struct pmic=
_wrapper *wrp, u8 hext_write,
>  static int pwrap_common_init_reg_clock(struct pmic_wrapper *wrp)
>  {
>  	switch (wrp->master->type) {
> +	case PWRAP_MT6572:
> +		pwrap_writel(wrp, 0x8, PWRAP_RDDMY);
> +		pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_RDDMY_NO], 0x8);

[Severity: High]
Could this unconditionally dereference wrp->slave->dew_regs if the configur=
ed
slave PMIC doesn't populate it?

If the mediatek,mt6572-pwrap device node is configured with a PMIC that
doesn't populate dew_regs (like PMIC_MT6380), or leaves PWRAP_DEW_RDDMY_NO
uninitialized (like PMIC_MT6397), this array lookup could either
dereference a NULL pointer or evaluate to 0x0.=20

This could lead to a kernel panic during driver probe or an unintended
SPI write of 0x8 to PMIC register 0x0.

Would it be safer to validate the slave PMIC type or check that dew_regs is
present before accessing it here, similar to how it is handled for
PWRAP_MT6795 below?

> +		pwrap_init_chip_select_ext(wrp, 5, 0, 0, 0);
> +		break;
>  	case PWRAP_MT6795:
>  		if (wrp->slave->type =3D=3D PMIC_MT6331) {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-6572-pwrap=
-v1-0-d8e5a39cf7ef@protonmail.com?part=3D3
