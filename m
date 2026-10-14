Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E8331A63
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970138; cv=none; b=cMgkDWlVa92MTGDwFH6OlnlfHsenFZgaDFRlew6hT95BMfUQJAwiZ5qjIphLoSToLzvhf6HZiB2B54E6+DzMi30XrKhrYBB4faIit9bLqyqKyc5mZAUG2nSSYbe19QCKA94eSyEGpSfyuNs9o4lUJVgfR1BJi926dh2B6fiKSew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970138; c=relaxed/simple;
	bh=ZKCyhM1Puo3FQhH39O7CIK/74+DLzuZY2cACb01ZSNI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pDWmDfkH6kZFkNZbu/UjHuHWcP/E6t4wYFbNIqjYtWHfUJ0K4cuWJu3PgCp2TcGOEa9VbSFqBnvznz+FRNFfFcn5RxKMm6k/UAvWygQdG7JhAKetXPTCeqigHaqte91DY9TvCcmbOBOTHfRbKjSR0k0+GvyPEnBKruGi2keoWZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZpJ8edqG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZpJ8edqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA361F000FF;
	Wed, 14 Oct 2026 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791970136;
	bh=BXjJP6ku8gEp490hRQDLlp6lCRYU9eL77sY/90xFAhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZpJ8edqGq4VsVSxEZuqupw7h6QIaad0upD2YnsAu0ZwiBI/LnCAOJ8v5gTLJQFMpR
	 F7M+F6Di2+gajNsHQWiZgc2NEZyN2OyoknXCnWt2Hfd3UUmFRBmFS2hmclBzgCkKji
	 wJU9r0xWmJzuau+HvU0H8Xun5Ma+yBg1e69rr8eLiCghQtKy92akHpDQTzcMWE+A7a
	 4DAWpac+EVZRNXZw2zEsZ4MhnDnVDsAx8ck7P0gs1/ZX15IHBuDt83Fj9IyG6DoK8p
	 DUajEL/6glThHo2t00iHxK6rZHUotie2DXm5hO3Vx+dkCKzaPyF9P2kp5PnLAxcm71
	 F0F/gwnfn8V9w==
Message-ID: <sashiko-outbox-171072@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/9] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-add_shikra_support_v5-v5-3-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-3-fb9f0667e613@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:28:55 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] sound/soc: data race on rx_mclk_users leads to premature MCLK di=
sable
--

commit 3e23cc050d00484d829b0a64e250b4871e497cc8
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-rx-macro: Add shikra compatible

This commit adds the shikra RX macro compatible data and hooks it into the
LPASS codec v4.1 flow. It reuses existing v2.5 register access helpers and
configures the FS counter to be bypassed before MCLK is enabled.

> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-r=
x-macro.c
> index c41eb8de61609..93ceee878b78a 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c

[ ... ]

> @@ -2041,20 +2044,25 @@ static int rx_macro_mclk_enable(struct rx_macro *=
rx, bool mclk_enable)
> =20
>  	if (mclk_enable) {
>  		if (rx->rx_mclk_users =3D=3D 0) {
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_MCLK_CONTROL,
>  					   CDC_RX_CLK_MCLK_EN_MASK |
>  					   CDC_RX_CLK_MCLK2_EN_MASK,
>  					   CDC_RX_CLK_MCLK_ENABLE |
>  					   CDC_RX_CLK_MCLK2_ENABLE);
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
> +
> +			if (rx->fs_cnt_bypass)
> +				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
> +						CDC_RX_FS_CNT_BYPASS);
> +
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_EN_MASK,
>  					   CDC_RX_FS_MCLK_CNT_ENABLE);
>  			regcache_mark_dirty(regmap);
>  			ret =3D regcache_sync(regmap);
>  			if (ret)
>  				return ret;
>  		}
>  		rx->rx_mclk_users++;

[Severity: Medium]
Could this function be susceptible to a data race on rx->rx_mclk_users?

It appears that rx_macro_mclk_enable() can be called from two different
concurrency domains without internal locking: swclk_gate_enable() and
swclk_gate_disable() (which execute under the clock framework's prepare_lock
mutex) and rx_macro_mclk_event() (which executes under ALSA DAPM's
dapm_mutex).

If the rx->rx_mclk_users counter is checked and modified non-atomically,
could concurrent stream start and clock enable events cause a lost incremen=
t?

If an increment is lost, when one stream later stops, rx_mclk_users could
drop to 0 prematurely, disabling the MCLK hardware while the other stream
is still actively relying on it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-add_shikra=
_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com?part=3D3
