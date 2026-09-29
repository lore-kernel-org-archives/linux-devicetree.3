Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A039A43DEB2
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722319; cv=none; b=WYvUikFRGHY8GGSf5p8IU7koMXdkjWf4V3nfB1+bSJXPHtsqjz8GgTZGK+AZQfDZUz4pMNLLwLqTAwvvZO6FG6qFIOJG6tBSg5DjdHdjv0H5hHoavqDJS2QEbSQvVWC7Ur57hxdtFCqYZHXubmR50yd5PmUZjcpJU3gBZkESfAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722319; c=relaxed/simple;
	bh=m2UDf6AIE4aFkR4rECttGJj6cGwUpHeR40C8xTL5Y64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KimsFC39oC2hObHr2mRnM80CAAUPAR6QRa5KNGmD8kmqCNVn321XRKCAz+vrz+aApnDBlZJR83CZp0W8jUiAMfih6TrS8riiKW36rzpK5yk9McwMWTYWuzGCDuxadSzXvkmDUv031X0xiT9Yc2Lnf2dQiexd6SdlK7nROQaojHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKKyOkpa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKKyOkpa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018BB1F000FF;
	Tue, 29 Sep 2026 22:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722314;
	bh=41PEpIp0WfbaIeOEo1fuPtzt1ythtEWaZWL0f1kJMuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TKKyOkpaYtbq9nxRhouipx7Brlpj4xTh13g81CfhIljoPaFpKeF1ZjVb8QVKacC4Q
	 QjMe75hDUoaPaHpbf1pg1Vw0udVil1LvSsA1hLtXOEDCIrM8WlQxhXGo1ZTauO/Ilq
	 hf9fbYVXnipXJrPwkaynosd7eg/xTuQLLDIg515quEdq7KzEJvI1RZTkvH0Y9UtOoy
	 jVGBu/sXxm8nmqUgXNYEw3WECdRNcp2vmX1mDS7235kVXn3x/tkZIGxiQ+Rgwlgrs3
	 /b3uowTQhqv3JoTAAuTHx7c0XRGzLN1k9m4XuHG33Fhedmm+COI/uHLTbIUHIpovFG
	 sR/fbX/ezsdUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 19/23] arm64: defconfig: disable deprecated MAX96712
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-gmsl2-3_serdes-v18-19-43117818f499@analog.com>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
 <20260930-gmsl2-3_serdes-v18-19-43117818f499@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:51:53 +0000
Message-Id: <20260929225154.018BB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] defconfig: missing replacement for CONFIG_VIDEO_MAX96712
--

commit 199fc94712dcbf34a3d3c53d618a1ee2650d65b9
Author: Cosmin Tanislav <demonsingur@gmail.com>

arm64: defconfig: disable deprecated MAX96712 driver

This commit removes the deprecated staging MAX96712 driver from the arm64
defconfig, since its functionality has been moved to the new MAX96724 drive=
r.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index fce418fe6ff65..cbcbc0ba1e247 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1433,7 +1433,6 @@ CONFIG_GREYBUS=3Dm
>  CONFIG_GREYBUS_BEAGLEPLAY=3Dm
>  CONFIG_STAGING=3Dy
>  CONFIG_STAGING_MEDIA=3Dy
> -CONFIG_VIDEO_MAX96712=3Dm

[Severity: Medium]
Since the old driver is being removed from the default configuration, shoul=
dn't
the replacement driver configuration (CONFIG_VIDEO_MAX96724) be added?

Without it, arm64 boards that rely on this deserializer hardware (such as
Renesas Falcon, White Hawk, and Gray Hawk) will lose out-of-the-box support
when the kernel is built with the default configuration.

For example, arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi relies on:

    compatible =3D "maxim,max96724";

>  CONFIG_VIDEO_MESON_VDEC=3Dm
>  CONFIG_SND_BCM2835=3Dm
>  CONFIG_CHROME_PLATFORMS=3Dy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-gmsl2-3_se=
rdes-v18-0-43117818f499@analog.com?part=3D19
