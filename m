Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F14346AC3
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784262541; cv=none; b=gYDH25EarsJv+7BU9DgGDC9quBVM8b9Hs35BYPMlQfbVn2rXNTJpdngPDVmaYJw+UgUgpMm8+VT7w9IbufM9DQj1PjGkAGHeansyhY+xK0Ph+xx/hpsGkrGLbn0dPqyP/EuhXh6Ox/A/ELo2boFBudk/WL0Ibx3zn3lc3HdQfUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784262541; c=relaxed/simple;
	bh=BFEhPfeBCNnOU+FbmFs0+zp9Cj13s/K7O+e3M5OUbTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TE6I0IVTOHCkUFaraYDRNv58ms4SZUOSihf8AsbGtsD+Z8RQDIxaE1DegUWJ4pOv7tlLh8OUHBQzBQgk5ZdKQbZlKbIdBMLiDZ4i7hHP031y1UstSnaQ+wX5pbr9bD1IP7GcSh98s6Y4IacGNdfeHjU1HNUB4bbwqNFwLkGczuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOnSm/Ik; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOnSm/Ik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6ECD1F000E9;
	Fri, 17 Jul 2026 04:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784262540;
	bh=PxM8HeRAPsMb0szA4U+PlLNDHOmQrWYINEIAiUvlRdM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eOnSm/IkFKUL5+jp00It0X3lzkeZYSRigtPDzm3O1SitGHCY7Pv8N1ubbeUBOqoyq
	 dkXIOFFZYUf+F6vVnISWnwVLVgW4AkixRrKydRVTnQ5ycETJFqXCt6MSfJvAwo7QaR
	 2EWOp2FZwGxA39cNBB0XetmGh85VQRfY9g+0Y+M5/C1u4BHe1oSbWofKer5bUqe9k4
	 5E9xt6X7e2ZnWaKx2O3VBLdtRCe3O4A91zLO4vp1J898Mjb3nJ9tQOTccitqjE3jt4
	 gN7NsRNqPowRKV8K1xE3x6HzNwRR9CljdQsQQij3Pc5PIn5F3nzVA3AM/bGdOqyiVY
	 iVK28szOdEwNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] clk: qcom: Add support for videocc driver on
 Qualcomm Maili SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jagadeesh Kona" <jagadeesh.kona@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717-maili_videocc-v3-2-6656694b06a7@oss.qualcomm.com>
References: <20260717-maili_videocc-v3-0-6656694b06a7@oss.qualcomm.com>
 <20260717-maili_videocc-v3-2-6656694b06a7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 04:28:59 +0000
Message-Id: <20260717042859.C6ECD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] CLK_MAILI_VIDEOCC incorrectly selects CLK_HAWI_GCC instead of a Mai=
li-specific Global Clock Controller.
--

--- Patch [2]: [PATCH v3 2/2] clk: qcom: Add support for videocc driver on =
Qualcomm Maili SoC ---
commit 3279b9315bb8b961f7460eb907c8f81979b2b267
Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

This commit adds support for the Qualcomm Maili video clock controller
driver. It introduces the new videocc-maili module and its Kconfig entry
for devices requiring video encode/decode clock functionalities.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 63f271aff1771..690f0b6fe227c 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -181,6 +181,16 @@ config CLK_KAANAPALI_VIDEOCC
>  	  Say Y if you want to support video devices and functionality such as
>  	  video encode/decode.
> =20
> +config CLK_MAILI_VIDEOCC
> +	tristate "Maili Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_HAWI_GCC

[Severity: Low]
Is this select statement accurate? The CLK_MAILI_VIDEOCC config appears to
select CLK_HAWI_GCC, which seems to be a Global Clock Controller for the Ha=
wi
platform rather than Maili.=20

Could this be a copy-paste error that should instead select a Maili-specific
GCC?

> +	default m if ARCH_QCOM
> +	help
> +	  Support for the video clock controller on Maili devices.
> +	  Say Y if you want to support video devices and functionality such as
> +	  video encode/decode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-maili_vide=
occ-v3-0-6656694b06a7@oss.qualcomm.com?part=3D2
