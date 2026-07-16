Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B276379EE6
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784175559; cv=none; b=ocoA0xOCzfgWicjpehp4cHC6o/HU1yHHqx6aPm5DyNTYooHqzhrcgR2htigPyyHiLRSH8dehon2rJ8LAA75pylcBnc3wKWtAjJ+7XOJfLgw86ez8ECRoCelIIeSmqTXHQfPZAzQTFAA4ySZhzbnTldOZ+U8MOp0gMqCVQa7bWo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784175559; c=relaxed/simple;
	bh=1jyzjRau6gXJS7nqtmg3JWYskJrEGNqQdmNEyudnou8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G3ANQu4PFgM5LIql0P7zcNfH8uJL3+Dw6poL2XL+Kek6KBTSlgkd694PVL4RIqcZAfk3L6jWYq6FAbUT5ywwNhb+XjSdxtL0mZw96Szzkh9bTaAX7+4zEOZfs284pDfkrLU6xycWIrxPFQNonP4xDW2rH8qcO14I4BPGizRGKVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDuUgx9a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDuUgx9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E5D1F000E9;
	Thu, 16 Jul 2026 04:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784175557;
	bh=jbltSY8VRNdM6rBL9Jbm0efOBLVgnoZYY+ugD3VZTGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aDuUgx9a9ETlUxKzaU/WdNGc7cxZf83x8wpviLDRt6WRFb0HuUXEboUv6BnbmZT69
	 INEaYnmRr0hF5gbihxMngCqfT2hmxGQrH+BKKjS8MLseM+iUJWEescs8oFTmg00Wkw
	 E16Mqa8UoujBhuE/AoUZl80wOu5PAHCux/nWGZdm/NmNyyBqhcvAfhzymle/nxw5bG
	 9prnX9euYJ71zrV9tpUi1bFOvkeepNyxCKy3XGLuHPmiBQ03Ks7sck9Qw0nXwIptiu
	 5X0TPISksomXxonXMAk0OWawPj1z8ywGhGEARmcLewXc4xutQpOgJFpcYGLbLZ8Uwv
	 1oy7RKNY+oH+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for videocc driver on
 Qualcomm Maili SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jagadeesh Kona" <jagadeesh.kona@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260716-maili_videocc-v2-2-7ed5ab140770@oss.qualcomm.com>
References: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
 <20260716-maili_videocc-v2-2-7ed5ab140770@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 04:19:16 +0000
Message-Id: <20260716041917.65E5D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Kconfig symbol CLK_MAILI_VIDEOCC incorrectly selects CLK_HAW=
I_GCC instead of a Maili-specific GCC.
--

--- Patch [2]: [PATCH v2 2/2] clk: qcom: Add support for videocc driver on =
Qualcomm Maili SoC ---
commit aa207bbe10b80dabb8f5f04613d0738a36c1da76
Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

This commit adds the video clock controller driver for the Qualcomm Maili
SoC. It allows video clients to request video clock controller clocks.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 63f271aff1771..690f0b6fe227c 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
[ ... ]
> @@ -181,6 +181,16 @@ config CLK_KAANAPALI_VIDEOCC
>  	  Say Y if you want to support video devices and functionality such as
>  	  video encode/decode.
> =20
> +config CLK_MAILI_VIDEOCC
> +	tristate "Maili Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_HAWI_GCC

[Severity: Medium]
Is this select statement a copy-paste error? It appears to pull in the GCC
driver for the Hawi SoC instead of the Maili-specific clock controller.

Should this be selecting the Maili GCC driver instead to ensure the parent
clock controller is present during runtime?

> +	default m if ARCH_QCOM
> +	help
> +	  Support for the video clock controller on Maili devices.
> +	  Say Y if you want to support video devices and functionality such as
> +	  video encode/decode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-maili_vide=
occ-v2-0-7ed5ab140770@oss.qualcomm.com?part=3D2
