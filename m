Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24D143C7DE
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 18:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448679; cv=none; b=Ly09/XahZP7rVooWqfkBCCTg1OTg0iOZeKZW987UKjNrG24SoIVC8G75lGx4pnRu7AtBSjDCn5Hl1bGXkcJaBF/mZ48lgdVAFJ9Av+GkTW2QzUnowZiqq7UW8b00jXW0MiPYIFT1pfTpXVwUakTjVC03DpbwOkzhmuXDJlDv8ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448679; c=relaxed/simple;
	bh=PQzBjNLMTdV0ZLdQHiUbm2yt96vGvbxUcnLx+/e+Df4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qLowiqtFJveCJer6Ajd+gn11r5Vd5RDNZkvJWMeTiK+6qJcqafLV+fBVkzBhMxP8v4ponK7KeuPrdR/+ZXs8rAl5mv/AM8UPcgQ1tMUE6AmCRwOQ7ThR3EJ3fQyz9nV1FtRHQu1d7ovY7mmg92gpLTzWm0LhwqjMLjBf5CdIHfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAzTEjPi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAzTEjPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E5C1F000E9;
	Tue,  7 Jul 2026 18:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783448678;
	bh=uf2+YXtPE7pU+q12DEVXaMNeFEp2m9G5ZPDzmIk48oo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LAzTEjPi+qIKJgEMrFMilAioEdU+lKjR3+r3An50UD0/67V1mhg9qxuYtLQXs963e
	 7JPSwPEIjIvC6Sonku3+hLHzEP83jLPhhlV+6V756O/ZkdzjwYP05LcUmgyicL0EOQ
	 sBfe5TQVljOK5vbzdzHUGXERo2wZ1uTSjuD8Lx5EhOhqp8Q4Rb0fj4RB7YEOVsv4n4
	 SZjshTc60/aQMj6Wie2vGAHaF2p98LWaLkyp+73A3LRmM0D+T6rpqzpDYSI22L7AxS
	 7QOTwnSiY4M1z2CBhiCbq1ueEdtW3ItkbP/zsijYyy65a+Hv2rH6CMlll1FpFdKB6Y
	 7VK5hUKhDoxXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Add support for videocc driver on
 Qualcomm Maili SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jagadeesh Kona" <jagadeesh.kona@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707-maili_videocc-v1-2-ef0828c0bf6e@oss.qualcomm.com>
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
 <20260707-maili_videocc-v1-2-ef0828c0bf6e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 18:24:37 +0000
Message-Id: <20260707182438.01E5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] CLK_MAILI_VIDEOCC incorrectly selects CLK_HAWI_GCC instead of a Mai=
li-specific GCC or its underlying dependencies.
--

--- Patch [2]: [PATCH 2/2] clk: qcom: Add support for videocc driver on Qua=
lcomm Maili SoC ---
commit d724606f8f1c3ef24540393df8039a38c743824d
Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

This commit adds support for the Qualcomm Maili video clock controller
driver, allowing video clients to request videocc clocks.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 6fd4aac1b6cf1..0409a2e604b0c 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig

[ ... ]

> @@ -156,6 +156,16 @@ config CLK_KAANAPALI_VIDEOCC
>  	  Say Y if you want to support video devices and functionality such as
>  	  video encode/decode.
> =20
> +config CLK_MAILI_VIDEOCC
> +	tristate "Maili Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_HAWI_GCC

[Severity: Low]
Is this select intentional, or could this be a copy-paste error? It
appears CLK_MAILI_VIDEOCC is selecting the Hawi Global Clock Controller
instead of a Maili-specific GCC or its underlying dependencies.

> +	default m if ARCH_QCOM
> +	help
> +	  Support for the video clock controller on Maili devices.
> +	  Say Y if you want to support video devices and functionality such as
> +	  video encode/decode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-maili_vide=
occ-v1-0-ef0828c0bf6e@oss.qualcomm.com?part=3D2
