Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C109290DBB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576674; cv=none; b=HlIaYafm0cBgnw7wrNJUtMqfiY3CdGaIEP6KU8UJwCe98dwLGit/i591Wb10XPHAXioZaG+BtY3KkSMDWWC7KYrT3y0jI1xpHj2Fm2OE4StnjRluGXe3JF9s5GOn1JxfUlhtCb4RqMJlvNOy251LVRJVd2NmVBuYbWZajqjZUCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576674; c=relaxed/simple;
	bh=3ZjuJjQQEhyvgxZGZ4c56Hl0C8NH56It/JKy3iIdffY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uj/nRl68bJTSsJPLCzIbzwuPYEr/wrO0TV6ZLHVWjOg2G6E6GePcZP1pOxml+h0Q1Jv8lpCcFX7ziflLudTQcH405LFftpdMio5kqfh36vyc1DmZ9sYUR/mAQboLljWkwywlb5x5dg+FLT5Sb95ZApS7ckSa6PcbGsCcsd7YnGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeicU7Jm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeicU7Jm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478461F00893;
	Thu,  4 Jun 2026 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780576673;
	bh=g3/wPjLX+NvIcLEd83j/U6N9jwKUNb84DHbR+3oB1bM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PeicU7JmyecBEaYw1X9Z02eioKabD2fw0M1GX9TR3Q2einSCmufldj8QfOxJbkdJn
	 AiOUCib9m1cE2rzfvy7dN4xq9x6QMqQJ5WB5eNV9Pivhgm9aMC4IDa5gI5DCfILh3N
	 1zMPsyIEFDfCIBDVkTHCz9ama7o9lsWm+iXtX3DjXudZHJzoSz7V3o789cz87lYGhx
	 ZshXB2Sc4QoLolboPuCfT0ODs3Dd6BkhUcN5qqKEsgLSD20Y+o9myMgvG1vi3kI+X/
	 ZiVGc1xFDNdGbdK6th6gZG99QI9LsINmzsF17qBlICCsW/zZYaFHvEc4puUSNKrmR8
	 wkXhmGSq3ZAKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: defconfig: Enable ILI7807S DSI panel
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
References: <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 12:37:52 +0000
Message-Id: <20260604123753.478461F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit adds the Kconfig symbol CONFIG_DRM_PANEL_ILITEK_ILI7807S=
 to the arm64 defconfig, but the symbol and its corresponding driver do not=
 exist in the repository or within this patch series.
--

commit f1a3e380ead347531475952759052c8bc5c76b54
Author: Nabige Aala <nabige.aala@oss.qualcomm.com>

arm64: defconfig: Enable ILI7807S DSI panel driver

This commit enables the ILI7807S 1080x1920 video-mode DSI panel driver as a
module in the arm64 defconfig for the Shikra CQM EVK board.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 909f3c188e755..a6d72ff63e571 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
[ ... ]
> @@ -1005,6 +1005,7 @@ CONFIG_DRM_MXSFB=3Dm
>  CONFIG_DRM_IMX_LCDIF=3Dm
>  CONFIG_DRM_NOUVEAU=3Dm
>  CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=3Dm
> +CONFIG_DRM_PANEL_ILITEK_ILI7807S=3Dm

[Severity: Low]
Does this config symbol actually exist in the tree yet?  It appears that
CONFIG_DRM_PANEL_ILITEK_ILI7807S and its corresponding driver are missing
from the repository and this patch series.

Without the driver being present, will the config tools just silently drop
this addition during make defconfig?

>  CONFIG_DRM_PANEL_LVDS=3Dm
>  CONFIG_DRM_PANEL_HIMAX_HX8279=3Dm
>  CONFIG_DRM_PANEL_HIMAX_HX83112A=3Dm

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-shikra-dis=
play-v2-0-b3c1b2b67edc@oss.qualcomm.com?part=3D2
