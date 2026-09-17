Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A39938B124
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611976; cv=none; b=YT2+f65b27UPk33aaHg01QU69Z9HvJT9/t5w74NUBEg0RQ+SYW/2V8/1DqGT26Zv8hblcWsHJwDZ9rAK4YwP+sULFirHlmuAaFLiLYniGfWbdMEYXzKJ5AM6Q9WODrhZ4QWi7COLU2qz2wg/wBN6Hrwgu9d9bCrB7FgYGdgCr/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611976; c=relaxed/simple;
	bh=P/IouUy+dJhvec9wA2VeUlpOQ3y7Q+dVNbZj7mcbiTI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sEPysf/Vz3yDaKf1xf74lCMS/9fzEt3QM0MUOnSP2xvcMnCkBDL+o8/ozz5cjN85Zx1+/ShpZW30ayl6R3Edb1RtFZptx+bvPg5r1r25af+6RsZkcZCZpTNg13ngnV8htp59w241WFueW0bsvz+mBG2H4IolaZnWY3l0jqd+n5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZc0QKHV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZc0QKHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9099E1F00899;
	Thu, 17 Sep 2026 02:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789611974;
	bh=viQ7vXOAcSekx8wh0ADDPLnT7tWvkC23owmU2KD40jE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UZc0QKHVsOXyRlem0GZ1exZk9mfreQE0DUc+n5szzKEOgRHgstTzUY56zFJIoPIsV
	 O+wKvqQRfSOHtm7pvC90/RUy8BwImqzXQpUK86AYVyURi/yYNiADv6AghXCTpqbFI7
	 nCCuQO0K1n5LP8DOcDcSy3pUMNlmnvYBfeOvbI939+CU3/U8W57PzOe87xlEkeh4kl
	 KQ3SecJ6EiVFeQdXyFEOoKHlhaqEawIAOiccfmW16OO62MT0OPlcrpmuWc8Lz3R1Ir
	 KJowruj2X0d3tqiyeywhi2a7JWaN3zCxazhRPxujbPkHiwUzZYT7F/oho6HRKLVFu4
	 yXBnahdNrZhFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 v3 4/5] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-add_shikra_support-v3-4-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
 <20260917-add_shikra_support-v3-4-fc0e79c341aa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 02:26:14 +0000
Message-Id: <20260917022614.9099E1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: qcom: lpass-va-macro: missing ADPT registers in rw_register =
whitelist
- [Medium] ASoC: qcom: lpass-va-macro: missing hardware version cross-check=
 in probe
- [Medium] ASoC: qcom: lpass-va-macro: out-of-bounds regmap access on legac=
y compatibles
--

commit 42f7a2d6f53039bff05f1711df839aaf55658481
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add shikra compatible

Adds shikra specific VA macro data and register programming for the LPASS
codec v4.1 implementation. It extends the VA macro with four adaptive filter
(ADPT) blocks and concatenates the new registers with the common defaults at
probe time.

> The register layout has to be chosen before the regmap exists, i.e.
> before CDC_VA_TOP_CSR_CORE_ID_* can be read, so it comes from match data;
> probe then cross checks it against the version reported by the hardware.

[Severity: Medium]
The commit message states probe cross-checks the version reported by the
hardware, but does the implementation bypass this check entirely?

Looking at va_macro_probe(), if data->version is provided (which it is
for shikra_va_data), va_macro_set_lpass_codec_version() is skipped,
meaning the driver blindly trusts the device tree compatible string
rather than verifying the hardware CORE_ID_* registers.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -430,6 +601,10 @@ static bool va_is_rw_register(struct device *dev, un=
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

[Severity: High]
Are the other newly added ADPT registers missing from this whitelist?

The va_4_1_defaults array defines 40 new registers (including ADPT_GAIN_0,
ADPT_GAIN_1, DH_FSM_CTRL, and CUTOFF_FSM_CTRL_0..5 for all 4 decimators),
but only the 4 ADPT_CTRL registers are returned as true here.

Since va_is_readable_register() falls back to this writable list, the
remaining 36 registers will be strictly rejected by the regmap subsystem
and regcache_sync() will silently drop them, leaving the adaptive filters
unconfigured.

[ ... ]

> @@ -772,6 +974,10 @@ static int va_macro_enable_dec(struct snd_soc_dapm_w=
idget *w,
>  		/* Enable TX PGA Mute */
>  		break;
>  	case SND_SOC_DAPM_POST_PMU:
> +		if (va->has_adpt)
> +			snd_soc_component_update_bits(comp, adpt_ctrl_reg,
> +						      CDC_VA_ADPT_CTRL_EN_MASK, 0x00);
> +
>  		/* Enable TX CLK */
>  		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,

[Severity: Medium]
Will this cause an out-of-bounds regmap access on legacy compatibles?

If v4.1 hardware is booted with an older fallback compatible string (e.g.,
qcom,sm8550-lpass-va-macro), data->regmap_config is NULL. This means regmap
is initialized using the fallback va_regmap_config which restricts
max_register to 0x07A8.

However, because data->version is 0 for those older compatibles, dynamic
hardware detection correctly identifies v4.1 and sets va->has_adpt =3D true.
During audio playback, this block writes to adpt_ctrl_reg (>0x0800), which
regmap will reject for exceeding the 0x07A8 maximum limit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-add_shikra=
_support-v3-0-fc0e79c341aa@oss.qualcomm.com?part=3D4
