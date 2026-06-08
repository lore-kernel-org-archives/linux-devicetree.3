Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140AB352012
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780940598; cv=none; b=RCkIsi6cVGbNn/kJMNHi9yZBFE7Trb1gdHGofwqan4dPLyAX879JfEYq0hWvE1brrGHUxCOcyon7tBT2Dslk2IWoV1ROPDuVXxjzAjuShl3YAG0j8FtFjM2JwSeJtllkXN+7k9GQ0WdlGFSlpj25eZ3aRmwiOfYOWQfaOSMrQyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780940598; c=relaxed/simple;
	bh=pMHZyv7nxbA+MPdpe+QmqitHDRCFb7TTbWR7EQfMRI0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iCoYwtvFBePV0yMVwyr2iaKXDSb6R9eFUOx1nFFB1WNUOgIfKw/PRXmHlrlxx5s8ryhigQdznG7jnIPXYsY4JS57EBuKWVGe355DYHcoMDpVezW+HNt9QluKMaPb8ERkfwMWw6p5ocJPZRbHV4WW8n1Ab9gbeGD56aDTAdjoO8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NubHyy5F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NubHyy5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DCA1F00898;
	Mon,  8 Jun 2026 17:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780940596;
	bh=JsoshNtrthiZrX7ONFqAnX16Po0XltdJzuPSmVNc9IA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NubHyy5FdWN1c89rY3oLDmkWnZ0F5v6JLIGY5d2+4ORd8bZttVMKEfcV0dt7k9eZ5
	 ijg9xhdRcXYIX6dYXNvBKfDiMCzR53O4uHyBnExvauOY0arazTnQLPQdULXgK7lFAK
	 TuYWwSdDsWSPmHU3Dr7gNpKp5cDIKbHGOrvHfjJhPVPvivJi2Vj0hAdvDaPq+OBynF
	 TywPMq5AoUVWpS+PEjKIj+y4eMvliF0OIf65S+mAMUq213v3NnLqyA0O+dJNRNbs8B
	 pX0hjq/zl58MN1k0nJVIhNGO3zfYi8yh9UGYUQMO38q2ngOnEdXybb6PKUgxxFbBLM
	 V3MXLbnqOF1Jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 17:43:16 +0000
Message-Id: <20260608174316.77DCA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition on `rx_mclk_users` reference counter between ALSA D=
APM and the common clock framework.
--

commit 7e806c720683c8e53a8ab54c5095d11f817bb75e
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-rx-macro: Add shikra compatible

This commit adds shikra RX macro compatible data and hooks it into the
existing LPASS codec v4.0 flow. It maps codec v4.0 to the 2.5+ RX register
handling paths, and enables the FS counter bypass bit during MCLK enable
when requested.

> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-r=
x-macro.c
> index 6233aa9f5bc6d..3a3dec6b14cda 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
[ ... ]
> @@ -2043,6 +2045,11 @@ static void rx_macro_mclk_enable(struct rx_macro *=
rx, bool mclk_enable)
>  					   CDC_RX_CLK_MCLK2_ENABLE);
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
> +
> +			if (rx->bypass_fs_control)
> +				regmap_update_bits(regmap,
> +						   CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
> +						   0x80, 0x80);

[Severity: High]
This is a pre-existing issue, but is there a race condition on the
rx->rx_mclk_users reference counter in rx_macro_mclk_enable() in
sound/soc/codecs/lpass-rx-macro.c?

The rx_macro_mclk_enable() function checks and modifies the rx->rx_mclk_use=
rs
reference counter while updating MCLK hardware registers. Since this is cal=
led
from two disjoint locking domains, the ALSA DAPM event callback
(rx_macro_mclk_event) holding the ALSA dapm_mutex, and the clock framework
callbacks (swclk_gate_enable or swclk_gate_disable) holding the clock
framework's prepare_lock, could concurrent executions clobber the reference
count?

Without a shared lock or atomic variable protecting rx_mclk_users, could th=
is
data race result in the underlying hardware MCLK being incorrectly disabled
while still in use (causing audio failures or SoundWire bus hangs), or never
disabled (causing power leaks)?

>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_EN_MASK,
>  					   CDC_RX_FS_MCLK_CNT_ENABLE);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608172023.2965=
292-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D2
