Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F0D531AE2
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074481; cv=none; b=dwJx7aANRv1kCYyAalS+u0r8OnBHZpTl44tzHzVs0eu83wIfQjTe1JU38xOdM2TCN0SqZpfY30hSdhFUxujQajlZjvWfuVGyUnRDqjYM0u64r5yG2CxHk2DTi8dvY9X/c/UKetLJ5FY+Il4Do6vMr68E68iyL9BXVndU68FQ+5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074481; c=relaxed/simple;
	bh=Ry8X665u45KaEpcy+8n7/bkBLUBeb1sZgvF62ASGjnY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tVpAHXT+aiRz9ExpNnSMFsRq99cbpmzkV2If+5fyxEQNbhohmia8oEvr+aR0f/wvldyHpLhiylT5x0duj28WnJIiedb9pkLW2zRKCQrBctvqdqr/CkE1leBvEPrfvdHF9RmZ97ATdeYdyDiSwiTY5l/JC5SNRtNASNdimFHvN1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxTkw/pK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxTkw/pK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7741F000C4;
	Thu, 15 Oct 2026 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792074479;
	bh=w5ecIJMRD8CIiJRRiHNPKVYU5tzDuxTSBJeOFjzK9l0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WxTkw/pKjvlQDT+emv+D6xZkvTguAhAEVgCFMRbwA5nIcqBWClfFYSB+3Po09kbJI
	 Ubct/AC2FUeU62Jh4HTDUWdg6g5vAOrZ/Fk907PlYU1lrshrL0v5kA2fkU+0jUpjI3
	 QzIr94d3HjIjYO8FQp8msz8fN9GrcxZcS3HfekgtgB3ArMVnewKuaFMYoU/Wswsrbg
	 dFmSIiphljin9Nt4jzp4s9CrwV0nkyhJAy0ID/tMH8g7CRCbMpIBC11dsvKHmwWlCz
	 IdVoDKdn78gH5J955+SZpW7IBYyyO0YL2xdWXq26gj2QuKLu8zLKYQdJhDpdbU1R/u
	 Xw6+K6Kt2PT/w==
Message-ID: <sashiko-outbox-172958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/4] ASoC: codecs: pm4125: Add the MBHC callbacks
 needed for jack detection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-pm4125_mbhc_support-v1-4-8bc1212db6f7@oss.qualcomm.com>
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
 <20261015-pm4125_mbhc_support-v1-4-8bc1212db6f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 14:27:58 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] sound: pm4125: Build failures due to undefined function and missin=
g struct member
- [High] ASoC: codecs: pm4125: pm4125_mbhc_program_btn_thr() OOB register w=
rite
- [High] ASoC: pm4125: missing lock for concurrent micbias and mbias initia=
lization
- [Medium] sound: pm4125: Data race and hardware state corruption in micbia=
s control
--

commit a2d3fc28945c83703320008a102f99781fb6c008
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: codecs: pm4125: Add the MBHC callbacks needed for jack detection

This commit populates the remaining wcd_mbhc_cb callbacks required by the
MBHC framework for jack detection.

> diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
> index 2100f4e36bbbd..6dd5ce0f4bab3 100644
> --- a/sound/soc/codecs/pm4125.c
> +++ b/sound/soc/codecs/pm4125.c

[ ... ]

> @@ -995,9 +1004,187 @@ static void pm4125_mbhc_program_btn_thr(struct snd=
_soc_component *component,
>  	}
>  }

[Severity: High]
Does pm4125_mbhc_program_btn_thr() write past the button threshold register=
s?

The function writes to contiguous registers starting at 0x060 in a loop up =
to
num_btn. The device only has 5 button threshold registers (0x060 to 0x064),
but num_btn is configured to 8 (PM4125_MBHC_MAX_BUTTONS). If this loops to =
8,
won't it write to 0x065, 0x066, and 0x067, silently clobbering
PM4125_ANA_MBHC_MICB2_RAMP, PM4125_ANA_MBHC_CTL_1, and PM4125_ANA_MBHC_CTL_=
2,
breaking the functionality added in this patch?

> +static bool pm4125_mbhc_micb_en_status(struct snd_soc_component *compone=
nt, int micb_num)
> +{
> +	if (micb_num !=3D MIC_BIAS_2)
> +		return false;

[ ... ]

> +static int pm4125_mbhc_request_micbias(struct snd_soc_component *compone=
nt,
> +				       int micb_num, int req)
> +{
> +	return pm4125_micbias_control(component, micb_num, req, false);
> +}

[Severity: High]
Are there missing locks for concurrent micbias and mbias initialization her=
e?

By hooking up the mbhc_micbias_control callback, pm4125_micbias_control() a=
nd
pm4125_global_mbias_enable() are exposed to concurrent execution by the jack
detection workqueue and the ALSA DAPM power-up thread.

In pm4125_global_mbias_enable(), secondary callers that hit
atomic_inc_return(&pm4125->gloal_mbias_cnt) > 1 will bypass the 1ms wait and
return immediately, using uninitialized hardware.

Additionally, in pm4125_micbias_control(), the micb_ref array is modified
non-atomically, leading to reference count corruption.

[Severity: Medium]
Can this also cause a data race and hardware state corruption?

pm4125_micbias_control() modifies PM4125_ANA_MICBIAS_MICB_1_2_EN and the
software reference counters without taking the newly introduced micb_lock.
Since this can run concurrently with pm4125_mbhc_micb_adjust_voltage(),
won't this corrupt the reference counts and clobber the register state?

[ ... ]

> +static int pm4125_mbhc_micb_adjust_voltage(struct snd_soc_component *com=
ponent,
> +					   int req_volt, int micb_num)
> +{
> +	struct pm4125_priv *pm4125 =3D snd_soc_component_get_drvdata(component);
> +	int cur_vout_ctl, req_vout_ctl, micb_en, ret =3D 0;
> +	unsigned int pullup_mask, en_mask;

[ ... ]

> +	cur_vout_ctl =3D snd_soc_component_read_field(component, PM4125_ANA_MIC=
BIAS_LDO_1_SETTING,
> +						    PM4125_ANA_MICBIAS_MICB_OUT_VAL_MASK);
> +
> +	req_vout_ctl =3D pm4125_get_micb_vout_ctl_val(component->dev, req_volt);

[Severity: High]
Will this cause a build failure?

The function pm4125_get_micb_vout_ctl_val() is not declared or defined
anywhere. Should this be using the shared WCD common helper
wcd_get_micb_vout_ctl_val() instead?

> +	if (req_vout_ctl < 0) {
> +		ret =3D -EINVAL;
> +		goto exit;
> +	}

[ ... ]

> +static int pm4125_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component =
*component,
> +					       int micb_num, bool req_en)
> +{
> +	struct pm4125_priv *pm4125 =3D snd_soc_component_get_drvdata(component);
> +	int micb_mv;
> +
> +	if (micb_num !=3D MIC_BIAS_2)
> +		return -EINVAL;
> +
> +	/*
> +	 * If device tree micbias level is already above the minimum voltage
> +	 * needed to detect threshold microphone, then do not change the
> +	 * micbias, just return.
> +	 */
> +	if (pm4125->micb2_mv >=3D WCD_MBHC_THR_HS_MICB_MV)
> +		return 0;

[Severity: High]
Will this access to pm4125->micb2_mv cause a compile error?

struct pm4125_priv does not have a micb2_mv member. Based on pm4125_probe(),
should this be pm4125->common.micb_mv[1] or pm4125->mbhc_cfg.micb_mv?

> +
> +	micb_mv =3D req_en ? WCD_MBHC_THR_HS_MICB_MV : pm4125->micb2_mv;
> +
> +	return pm4125_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-pm4125_mbh=
c_support-v1-0-8bc1212db6f7@oss.qualcomm.com?part=3D4
