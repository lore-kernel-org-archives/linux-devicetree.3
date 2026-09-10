Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019D23A9632
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034601; cv=none; b=kDyBHqxdvBTxjlQZD/l58I6F4m0+t+Pm0wtV944V/N/0IOnVcwDTcb9UyAXD7u4bIi3iSa72z/SkTgSJ1ga77FhcoxKZdNCt/Zs/5/7+81X9wbrWbjXw0CfV1QWhAK7apnfLzQVzoy+Seyr8AgIDogCVY6pGxqgai8DF0+3cBlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034601; c=relaxed/simple;
	bh=Kez68FNap52UC0iDZan255r/zLb9MvhhP+8cDax9ITE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ExzAJx6Nc2GdwpuE4sgSWhXmWDXBrsofEH9mOuLS+CCMbhRepWWA6Js38lcFVcvgMY89PJaYhJcCb5zleelRmpTX1ApwDr9Fi7HoTOG6Mw3OXspIjK267t3W6b0ggLZrcT0zoTRnYEaOyNZf/fF/e9Acx4vmTRJ29Y5rf+nDRLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7bfYMgO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7bfYMgO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3746F1F00898;
	Thu, 10 Sep 2026 10:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789034599;
	bh=X2TvJb7Z9OKZG1qhLVwHtfrG1feMidZTIcJ+agqUgiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B7bfYMgOCdxVNKO8XZYpVjiPmwQyv0fiN6pRNkU9Szpb0kQ2T2RJ9CzShgp0+lgPF
	 7MgGNLRHgFSEqL3F56UO6rH21afhvu8OhPfIoZnrYvKVUm9Gjzt59/VR9H4eVnkMu7
	 orMh+0ntKSrvsSWG3lUv1c8DwA3E43YPB2NxorvWfdIAhVTKzzRK154kJC5V5ao0fL
	 dxnI9rDxnQioEa6wChkSFJArOJ7gTt6sV1yKpUuDlGGOf7aSt4X8Efri4h7dhznpWg
	 Zo/PsKUm+jfwZr7nieLSkfzb9vyLnKrSnyBnQQQ2c0dnm4Jrt9Q1DlYXyztgaGjgTH
	 9bAUwS2e30wkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-add_shikra_support-v2-5-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-5-fdd2129c696c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:03:18 +0000
Message-Id: <20260910100319.3746F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] 36 new ADPT configuration registers are missing from the va_is_rw_=
register() whitelist, causing regmap to silently drop their defaults during=
 initialization.
- [Medium] The FS counter is enabled before it is bypassed, which contradic=
ts the hardware initialization sequence stated in the commit message.
--

commit 7975fbfb906db9ea84cf327e35c78c8a83584393
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add shikra compatible

Add shikra specific VA macro data and register programming needed by
the LPASS codec v4.0 implementation. This includes adding the v4.1 ADPT
blocks and required FS counter bypass initialization.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index a3b3af0d7db3c..8353921f718e3 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
[ ... ]
> @@ -357,6 +405,127 @@ static const struct reg_default va_defaults[] =3D {
>  	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
>  };
> =20
> +static const struct reg_default va_4_1_defaults[] =3D {
[ ... ]
> +	/* ADPT blocks */
> +	{ CDC_VA_CDC_ADPT0_ADPT_CTRL, 0x51},
> +	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_0, 0x11},
> +	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_1, 0x01},
> +	{ CDC_VA_CDC_ADPT0_DH_FSM_CTRL, 0x02},
> +	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0, 0x77},

[Severity: High]
Are the newly added ADPT configuration registers (such as ADPT_GAIN, DH_FSM,
and CUTOFF_FSM) accessible by regmap?

Because these 36 registers are missing from the va_is_rw_register() whiteli=
st
below, they will be treated as non-writeable by the regmap subsystem. During
probe, when regcache_sync_region() is called from va_macro_mclk_enable(),
regmap will silently discard the default values specified here in
va_4_1_defaults, leaving the v4.1 adaptive filters unconfigured.

[ ... ]
> @@ -430,6 +599,10 @@ static bool va_is_rw_register(struct device *dev, un=
signed int reg)
>  	case CDC_VA_TX3_TX_PATH_SEC4:
>  	case CDC_VA_TX3_TX_PATH_SEC5:
>  	case CDC_VA_TX3_TX_PATH_SEC6:
> +	case CDC_VA_CDC_ADPT0_ADPT_CTRL:
> +	case CDC_VA_CDC_ADPT1_ADPT_CTRL:
> +	case CDC_VA_CDC_ADPT2_ADPT_CTRL:
> +	case CDC_VA_CDC_ADPT3_ADPT_CTRL:
>  		return true;
>  	}

[ ... ]
> @@ -471,10 +665,14 @@ static int va_clk_rsc_fs_gen_request(struct va_macr=
o *va, bool enable)
>  		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_MCLK_CONTROL,
>  				   CDC_VA_MCLK_CONTROL_EN,
>  				   CDC_VA_MCLK_CONTROL_EN);
> -		/* clear the fs counter */
> +
>  		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
>  				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
>  				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
> +
> +		if (lpass_macro_get_codec_version() >=3D LPASS_CODEC_VERSION_4_1)
> +			regmap_set_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
> +					CDC_VA_FS_CNT_BYPASS);

[Severity: Medium]
Will this sequence enable the block before bypassing it?

The commit message notes that the hardware requires the FS counter to be
bypassed before it is enabled. However, the preceding regmap_update_bits()
call asserts the CDC_VA_FS_CONTROL_EN bit prior to the CDC_VA_FS_CNT_BYPASS
bit being set here. Could this open a window where the control block is
enabled without the bypass, potentially placing the ADPT hardware in an
invalid state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-add_shikra=
_support-v2-0-fdd2129c696c@oss.qualcomm.com?part=3D5
