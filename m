Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEB441CB5A
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827913; cv=none; b=az4lqn/1/D9qh3ZFs7UapckfBZ/kFt8JmnDk2LheJ2l6xM8F6uECjVFVg1pRJy85OdhXnm2wmNtFAdCSw8KprPSsFv1uKP4RNth4kEa3tGyiGSDvqBB8E+myBLFHznHxlvWAtE6YI3/0VOOnuzND9uP6xhHAu9zGgVnQTnMy8qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827913; c=relaxed/simple;
	bh=I2RaX+0V6VZMccmZk5NftOnmyJb1AgmmsCI3WgzqUVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G+Fe6hCwCY7thX1sP/KogLNUKdbWm11uW+2eajnpRUhm7P0tkQxuSKePvI7YCgyebQNLtUYONedGi8HH/U2yDjk8cY2CmdCJDgCNJHm2LXh0MH5ZvjFt7x+igKE7lixnRfPRzz51PdWeV7oT7UysxSwIsBN6Ng6hdlju9V3Zvdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cub68JWs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cub68JWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28641F000E9;
	Tue,  4 Aug 2026 07:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785827911;
	bh=emlaIePgj1kGxnoScoahxri95JZjKaePp/TVTxAooa0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cub68JWshEJubiXt1Rc+z6pr0OWCtndjqVxYrL+TnZs2vuHAVe0LOycjF0TTVS2xL
	 V50pSqWIssaw0vkSUe7CGwEAtgpRgDUHwHpjmDrlNs29emGg72zd+3ZgobmHRe+yTm
	 FsXGk4eShOmM1HlJ5XHClR7j+5tFonQvjsBcJC8GZROomct2h+kUcbIyr8qGKd3KcH
	 Qg0oM4iENH9y7E+W6wdCL2N2Ch4UW6Ma0go2MKaVez77C7O+2J8jSxykr+ZGxlnA9k
	 eRR0CC37FoD2xdybdAiFXGaLF2K+m/BDNtMW/xo66ZHuQMvbBFcVqP5RjNGPRdZmKY
	 vFQrxkAZrnzMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/7] ASoC: qcom: common: add DAI-node TDM slot
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804070307.117119-7-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-7-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:18:31 +0000
Message-Id: <20260804071831.B28641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Silent masking of device tree configuration errors due to confla=
ted error codes.
--

--- Patch [6]: [PATCH v7 6/7] ASoC: qcom: common: add DAI-node TDM slot hel=
pers ---
commit 59f92682a3e73f6ecf0f09ddbbaa5f3be6fc0e76
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: common: add DAI-node TDM slot helpers

Add common helpers to parse standard dai-tdm-slot-* properties from the
CPU and codec child nodes of a backend DAI link and apply the result to
the active DAIs.

> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index f8782e5cfaaea..d231024206dbf 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c

[ ... ]

> +static int qcom_snd_normalize_tdm_slots(struct qcom_snd_tdm_slot_cfg *cp=
u_cfg,
> +					struct qcom_snd_tdm_slot_cfg *codec_cfg)
> +{
> +	unsigned int slots;
> +	unsigned int slot_width;
> +
> +	if (cpu_cfg->slots && codec_cfg->slots && cpu_cfg->slots !=3D codec_cfg=
->slots)
> +		return -EINVAL;
> +
> +	if (cpu_cfg->slot_width && codec_cfg->slot_width &&
> +	    cpu_cfg->slot_width !=3D codec_cfg->slot_width)
> +		return -EINVAL;

[ ... ]

> +int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct qcom_snd_tdm_slot_cfg cpu_cfg;
> +	struct qcom_snd_tdm_slot_cfg codec_cfg;
> +	int ret;
> +
> +	ret =3D qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
> +	if (ret)
> +		return ret =3D=3D -EINVAL ? 0 : ret;

[Severity: Medium]
Will this silently ignore invalid TDM configurations in the device tree?

When qcom_snd_normalize_tdm_slots() detects an invalid configuration, like
mismatched slot counts or missing slot widths, it returns -EINVAL.

However, it looks like qcom_snd_apply_dai_tdm_slots() conflates this -EINVAL
return with the "not a TDM link" condition (which qcom_snd_parse_dai_tdm_sl=
ots()
also reports as -EINVAL when a link node is missing) and unconditionally
converts it to 0 (success).

Does this need to differentiate between a missing link node and an invalid
configuration to avoid masking configuration errors?

> +
> +	return qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804070307.1171=
19-1-prasad.kumpatla@oss.qualcomm.com?part=3D6
