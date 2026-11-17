Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876796;
	b=yaA7SRQ56S/d+qSZSA1AuFP3nwinoETLEc9HVm+53NgQCodx4CcZlKAI7HX5q3EGm+uW
	 ah0tkCTmfAgVSrVK+dO83eEk9+HFIL4LNKcKmNZePIKCcZdNBPsItRttdpUn5z2v4CcOc
	 ACvGyow80DZY49Zox6+iWZugdZxkmmTLZLyKCw30OWelAXrbVzIt7dJ0jXz7HqNkExfcu
	 yJA3isxHi14ZHSrCW7WB0O4TxsqN4aWBeqkKJCv/YaKWNOjJXNrmm+W5BfuGcyZVwy2bb
	 gsCvSkKHAFBsJdPpVR5GCzwBrGp06g1UEVzxhPDsee1ClGB8bTNTQc08plvULRy0xzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876796;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cZKrqKKU0Zn/4482SS6UmQ97SbQVJzWFNH6cljGk8Iw=;
	b=nYmn4+l76XtHcVsGwz+inDZpeGDHWfKp+Ncgu7M7BgJmHSnaCd1TXWrjJc32RJHtFyD9
	 ApLDN6XmryiWH0hK93R/DOwwKwZDDAlaU7ny3UtWrF/mlPZHpD621nJUVgkLW6zFvHw0w
	 QSBH+vp0eG2+wwDteYJiSKGEjMIh32l+IrM0N0Q/SceSeiyWGc91W4/rBkaQLqeQ2wbhx
	 sbeDWOn08fL5SsLisEE3KHNP+BgTF52TvTeFaVNECPKiJpZW1P4CgP0GuX2w/Zf4miUAG
	 vL/LHKYva9nD7ofvSRLzZiw3HJRt+rFvvAW90PSdPZwPITvSg7qeDFNgMGIRU26N+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWbFHhRs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B12606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWbFHhRs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F37D1F000C4;
	Tue, 17 Nov 2026 00:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794876796;
	bh=cZKrqKKU0Zn/4482SS6UmQ97SbQVJzWFNH6cljGk8Iw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SWbFHhRsx/xCAeUztMQl9llLhJQ4cLqgH4mLu+iWR3P+N4U1qPXzMOtgvi/LSbXOh
	 i9peVaVJ1tkcxIcCCZ5xncmbfY9RpIyy+bSEmro0Xw5OQJ5LV47QbvecjB7ilrdzT7
	 lmjXQZ29gK4pjHsshI7/lslY7EJeLORmnpdgZhY7nDPOSOS5sNxiusJMLcRCTNEXRm
	 X86A9TJXsorLJNYQiIuNk2vlV8bt46mGW472II9g79F94R+d9pScpMReITm/gn3lB2
	 FAnJTSxR3oJ2p7ikIWhc64LwtnMKuvKBtPcwUUC+450yXXm/TJWCqgwltBzNPSrlff
	 Dl/nAXMme7HTg==
Message-ID: <sashiko-outbox-218030@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] phy: siflower: Add SF19A2890 USB 2.0 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261116-sf19a2890-usb-phy-v2-2-df3ce9d23f5a@telaak.dev>
References: <20261116-sf19a2890-usb-phy-v2-0-df3ce9d23f5a@telaak.dev>
 <20261116-sf19a2890-usb-phy-v2-2-df3ce9d23f5a@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 00:53:15 +0000
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
- [Medium] phy: siflower: undefined Kconfig dependency
  MACH_SIFLOWER_MIPS
--

commit 202f638a2bcc34b802f82ced18e112090e99c627
Author: Chuanhong Guo <gch981213@gmail.com>

phy: siflower: Add SF19A2890 USB 2.0 PHY driver

This commit adds a driver and Kconfig entry for the Siflower SF19A2890
USB 2.0 PHY.

> diff --git a/drivers/phy/siflower/Kconfig b/drivers/phy/siflower/Kconfig
> new file mode 100644
> index 0000000000000..5ae1f83d14494
> --- /dev/null
> +++ b/drivers/phy/siflower/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config PHY_SF19A2890_USB
> +	tristate "Siflower SF19A2890 USB 2.0 PHY driver"
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST

[Severity: Medium]
Is MACH_SIFLOWER_MIPS defined anywhere in the tree?  Because that Kconfig
symbol does not exist, it evaluates to n and prevents PHY_SF19A2890_USB
from being enabled unless COMPILE_TEST is set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-sf19a2890-=
usb-phy-v2-0-df3ce9d23f5a@telaak.dev?part=3D2
