Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6113B38B14C
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658318; cv=none; b=Af63lhAQpWLUQ49z4TO+Q5cK/iTge0VcYAXuCR/Ebq6CtgP9ZvFmFrh+BncZwDdIiMmONDEw8x85smztgC9n5TXtm8RdfkQzHpWxFAdm1dp/C4CPm6uhP9aAuzu2XL6qBDJS2vjRynpHi+8Z5dqLI3+162dhHwoZ7hUziqSCUVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658318; c=relaxed/simple;
	bh=NQZSTPXfadmEpAfxokXnJuMz8QjMMpk78l0xtZc6VTc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bRP+3mxIVhORa1W0SYIAtRHDi6mcC7U7B9IwN/NiuYCdv8VyOg21o77ccuWSmRqwMk5nCvoUZj5XlngVVLDh1/zMt4f/LHFR/J6In4IFOaoNk3AB6wENY1L9BH2MVsUVTZPJBsk9gj9uBbMb/cJZdHQocJntXwO7/TAQ4gtafmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJez3G4h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJez3G4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3F21F00A3A;
	Tue, 21 Jul 2026 18:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658317;
	bh=dkElu3+MMyKqqrmpRaS0dT6/e/xT9Y7BOafJ7Xg7T+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bJez3G4hQF76vEoJ/ekscxX+IIuio3g5bEcb4J3W+snna0nrc5k5Gu3N7WaAbLfSm
	 bw+hAeV7bEzYQ8XwkqQjySeR5eouwMMAANu7El356e7LcCUl/qjxrPPRpQEuCc2abi
	 ZoS3OvvGyZnkugfHHwGqwP4nz50EocdWF+gxu4Xdr3PO2JZ0dImPuS7Z3X2RsxlE0F
	 /MIgYyWqQ06ZbKT7xWvOFTmReRi/XMAnTCBqii6Sj9Q0cY0AiNfObAVeXNJm3LzBZ1
	 2o8lC3pmv1dYcSBXrpfJzGT6uOyC1pyaZhZCHHOYgupUU8httg9doRui1Ah4bYQ8f/
	 h3T+5oo84c2Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:25:16 +0000
Message-Id: <20260721182516.AB3F21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Removing SND_SOC_STORM leaves SND_SOC_LPASS_IPQ806X without any =
selectors, rendering the IPQ806X LPASS CPU driver completely unbuildable an=
d unreachable.
- [Low] The device tree binding documentation for the removed google,storm-=
audio driver was left behind.
--

--- Patch [1]: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver =
---
commit 76b009b0b947fd2197dab876d7f10fb5105c7935
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

ASoC: qcom: remove ipq806x Storm machine driver

The Storm board machine driver targets Google's IPQ806x-based Storm
reference board. This driver is removed together with its Kconfig
entry and Makefile rule since it has no upstream device tree and no
active users.

> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index e6e24f3b99222..68e3146bf2307 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -47,15 +47,6 @@ config SND_SOC_LPASS_SC7280
>  	select SND_SOC_LPASS_HDMI
>  	select SND_SOC_LPASS_CDC_DMA
> =20
> -config SND_SOC_STORM
> -	tristate "ASoC I2S support for Storm boards"
> -	depends on GPIOLIB
> -	select SND_SOC_LPASS_IPQ806X

[Severity: Medium]
Does removing SND_SOC_STORM leave SND_SOC_LPASS_IPQ806X without any selecto=
rs?

SND_SOC_LPASS_IPQ806X lacks a prompt in Kconfig, so without any selectors it
cannot be enabled manually or by COMPILE_TEST. This leaves the IPQ806X LPASS
CPU driver (sound/soc/qcom/lpass-ipq806x.c) and its Makefile entry as
unbuildable dead code.

Should SND_SOC_LPASS_IPQ806X and lpass-ipq806x.c be cleaned up in this patc=
h as
well?

[ ... ]

> diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
> deleted file mode 100644
> index 1e0eda8c24c4e..0000000000000
> --- a/sound/soc/qcom/storm.c
> +++ /dev/null

[ ... ]

> -#ifdef CONFIG_OF
> -static const struct of_device_id storm_device_id[]  =3D {
> -	{ .compatible =3D "google,storm-audio" },
> -	{},
> -};

[Severity: Low]
Does the device tree binding documentation for "google,storm-audio" still e=
xist
in the tree?

Removing this compatible string might leave behind obsolete binding
documentation, such as Documentation/devicetree/bindings/sound/storm.txt.
Should the corresponding binding file be removed alongside the driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-drop-sound=
-storm-v1-0-23ae4a689ffe@oss.qualcomm.com?part=3D1
