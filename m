Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE2A37A83C
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015572; cv=none; b=JocZA/1r/tCheSKmP2fHs3iZzWTLN6pj+Y+SDi4k8cFatSLh2cay475jPGTXzU5M1Zukr7ugewqjvZbrIPKsDONsE4LxwqH/NrxnAiBhRuDGApTBWREtEQf61yFzFxULesbzM97dpwslaip6F6HgVXf5+YDP22EEj/0VJZkgo0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015572; c=relaxed/simple;
	bh=/2wget4tWb7mHOG+UEM5zkuQe6wL6vzKIPsPnbOMSYk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hx0XyYU/yK65fE53hLYP5kOJtr40Rp18U7aqxNSKl12zes+02QBAhGtQCjUB16Do/EdSaKpHQGESZDaO3dt+vdVWeTRknZJdF3zwRHuIo04P8fmEf0Q2yxaA5LcjIyMlO4lxXfiSjqI94QbYuUXOgt6vX2KLx5ufysHL8lwGCTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2dPzCs/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2dPzCs/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839F01F00A3A;
	Thu,  2 Jul 2026 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015571;
	bh=UN/XaitSv8DiW50N6n82fEBa5kiTu8a0p4GBslqIHJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2dPzCs/B5dxV6fgDEwrc7MUHkALsE2S8d9fAs+fQxVOV1AyLma+CdWhV5ZzrkyMp
	 tbyt/DWmwtCtihniw0ftXgQ8euxk8m7tFT2Y6MBfMI8xMgHzpGih86Q5jY6EMDKB/Q
	 v9u4ab+shhciJYUPwPzy7XGEqZMaOrL6WCkr2Ye/gqiBUUBaN3xUhOWTMCl2w5YX0F
	 cLZ49OsFxDPnbPaYyZernMPQjeQTfhPV5uhGd15+VBfQgy3NA4QMOcAXRGzndrBT6A
	 jOAW8VPLtMQMoZeUgRjSWzqZ1onQZRh/H1vVx6FPcdCU9CFKoXK8bs8JfCf1MBGfbi
	 9drC0xe+jlGMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/15] clk: mediatek: Add MT8189 scp clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701-mt8189-clocks-system-base-v1-14-2b048feea50a@collabora.com>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
 <20260701-mt8189-clocks-system-base-v1-14-2b048feea50a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 18:06:11 +0000
Message-Id: <20260702180611.839F01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect status register offset (`sta_ofs`) in `scp_cg_regs` caus=
es the clock framework to read from the SET register instead of the STA reg=
ister.
--

commit 8d1a0c988f3fa1bfe741cdb400dead04bed09d17
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 scp clock support

This commit adds support for the MT8189 scp clock controller. It provides
clock gate control for the System Control Processor.

> diff --git a/drivers/clk/mediatek/clk-mt8189-scp.c b/drivers/clk/mediatek=
/clk-mt8189-scp.c
> new file mode 100644
> index 0000000000000..75197cd98b521
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-scp.c
[ ... ]
> +
> +static const struct mtk_gate_regs scp_cg_regs =3D {
> +	.set_ofs =3D 0x4,
> +	.clr_ofs =3D 0x8,
> +	.sta_ofs =3D 0x4,

[Severity: High]
Should sta_ofs be 0x0 here instead of 0x4?

Looking at the register offsets, sta_ofs shares the exact same offset as
set_ofs. When the clock framework evaluates the clock state during driver
probe and initialization, it will read from the SET register instead of the
STA register.

Since SET is typically write-only on MediaTek clock gates, could this return
garbage data? If so, it might cause the clock framework to incorrectly track
the state and fail to disable unused clocks left on by the bootloader.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-mt8189-clo=
cks-system-base-v1-0-2b048feea50a@collabora.com?part=3D14
