Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471575;
	b=FxYPQUjTBKtnfZ9Jt8XSdX9JkjjltM1ZFPFSiYBBbspIW3y5rZ9MHNkEj2dwTNPePv26
	 JZ4fJtRqV863UHZFP9qIq962mIscZxjN/OmM9gbq2Ds/wdzDNpspRxb5+rTL6Ps1qGlMx
	 UQXAMGnIwaXBqOGLTcyy9hAeXvmclmIR1kZK0oIjwshM+aqjLPvkunS6J7/A9gKhs6TEe
	 qHrYcq5rmjt9LBOzXsdKHd2qIMW65jYRZdxMA6DjNwUl38HN4UEfMrFclVa/1TBdCQ0Ag
	 0+1RUIMYPhM1j3O3oewuwUjwEjPL/JcnnqbNRHEb7vS5o1AJnvGWveq8Rw77629d8dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471575;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RFGhhGQ6PBux9zmRB3Gemrt1WdhUOA1/RGS2FuQ4TmA=;
	b=kksDheX/n+Xypak2UGw3jqXS4MMabaE+KKSk896EOEOpyM0Q3tNqeN/oL+0IC4a4mNv4
	 FYWf6WeDVyxjuLdO2XH1g94XbCXY99QCzoTjykwcLD7r4nYJ1X7Qfwkg+YdiznrFr/J/p
	 l4FP4NbHEGQKDgRiAqu3a3UjouCSkQRnxxivyhVmmYDhNywGiWQfrAeX/UlCKpPtnrM3X
	 9Lsq+NSNiogvqWjztJdPKJq5QKaFPPZoBD8N3JJaH5a/f2LhVcBXOQoRwmE0mkPUMYkjF
	 DJXG5YMypTxFZ0Jh1wKZ5p0CXylvBWLL4Nr883+cilDtVfO74ImygALVFXHJJWgfdHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=faEpnOHQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25B0606A32D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=faEpnOHQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0BE1F00A05;
	Thu, 12 Nov 2026 08:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471574;
	bh=RFGhhGQ6PBux9zmRB3Gemrt1WdhUOA1/RGS2FuQ4TmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=faEpnOHQaXVVGEjH3IWGe1a0icCBY32qSR4wbO2VRtRNmzYM4gaiLc1RlIvRULoJS
	 O7/0jjBWnSra8dWD8T/XIKSyXPkS2kUFUmokpOqQ9nCOrTbMdW/fibgbPtvlg76Hek
	 i3zyQm7xMItRso5viSUS1T9dN/DD6beE8mul1DWlifY5VceCyHmsae00tj4w32at1A
	 kV60Z83ct/BjL+/A9n7K+rPzMkegse/YJo7KbCN15y9p3N6AhgsuR6QrMoRx8JKfMd
	 2SiAuypSOAvxTXjoxuoz7IxjTP6UPjGYIUPDHT8F0RorZflgA2OwYaqS2Hq60IoGc+
	 1jVr3Qr2SueHw==
Message-ID: <sashiko-outbox-210688@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] soc: ti: k3-socinfo: Export SoC registration
 helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Moteen Shah" <m-shah@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112081047.1550471-4-m-shah@ti.com>
References: <20261112081047.1550471-1-m-shah@ti.com>
 <20261112081047.1550471-4-m-shah@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:19:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] soc: ti: k3-socinfo: missing header for k3_socinfo_register()
  breaks build
--

commit 50190b242a0586e1caa40c20a83d5610007110d5
Author: Moteen Shah <m-shah@ti.com>

soc: ti: k3-socinfo: Export SoC registration helper

This commit splits the JTAG ID decoding and SoC device registration out of
k3_chipinfo_probe() into an exported k3_socinfo_register() helper.

> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
> index e21a2cd14c811..bf0829fb1d61c 100644
> --- a/drivers/soc/ti/k3-socinfo.c
> +++ b/drivers/soc/ti/k3-socinfo.c
> @@ -5,6 +5,8 @@
>   * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
>   */
> =20
> +#include <linux/device.h>
> +#include <linux/export.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/nvmem-consumer.h>
>  #include <linux/of.h>
> @@ -12,6 +14,7 @@
>  #include <linux/regmap.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/soc/ti/k3-socinfo.h>

[Severity: High]
Was include/linux/soc/ti/k3-socinfo.h omitted from this commit?  Without
that header declaring k3_socinfo_register(), compiling
drivers/soc/ti/k3-socinfo.c fails with a missing header error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112081047.1550=
471-1-m-shah@ti.com?part=3D3
