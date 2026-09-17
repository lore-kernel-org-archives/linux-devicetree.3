Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA86F515967
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 16:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664106; cv=none; b=tOx/xH37oOWeSJpeSITdrL7eBcTwOzJbfY2RC96XeLBCbzl8TAunJlhOfDw7+blKM2hi4R7jkptmh4gBFXysPTplh1QCzv/s4/Sooeba5YAe0nGKP0oHetyclUQN9Ps4YPdASG+aRhFxAXXiQJhT2YbC1z5a+7PWXQro4ghD7O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664106; c=relaxed/simple;
	bh=fBf74C73MIUC8YdSArDBlEUCkhjS2WHp2awQQW/hEZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a9me0yVfvlqNrl/89+HzT7f6t7lLowLcxJvnE8oy/1FsvCDqxzDBrUdqQ++kizx6g1h0HPxnh/H+3UDZKOVaKl5ymDA1rV7bwe6kIMBYTcuvv2STTMsv8Mw/O/2aKmJ4vPwif94Z3rxerXakZCx8yzXp5rlE3IUpm5g66E+DazQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HngNrs3+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HngNrs3+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10AF1F00893;
	Thu, 17 Sep 2026 16:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789664105;
	bh=hdMWxFaReQNrBONPks9rCkvr9HbAFCBDYi2fYllmLK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HngNrs3+7AqsdPTj2xsxgPM08gtyUtsRMirNbMtGLWHLN2yU6zwxXmPum8C96E4em
	 q8vfWkIMYGC+o1XaKXppPbG/KIQsmLdwRZMvaCFKDtAdzfqqW0sozBlgmvS184PqpQ
	 A0M9dIZ+yQFrPLJZ3YH0n+72oyvpY0cBiheLI0rMQtqbEwk70G2CbdTkegfo6fUVDR
	 I57Abrmwi/lKV0AFVYUq3g0jqw7KMVzE56lIWCs+PtUQiNr+2hFFHaIymlHKvMNix/
	 ACckVQSLxCfAiWSwKUHPfr/KJr5ZvPxzcC/kOmZfC/EYvWWOP4s5LSPIR/qt3K3nNN
	 MZTZ4sXQLBE3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/9] drm/panel: novatek-nt36672a: Add 3 panels used
 in Xiaomi phones
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Minnekhanov" <alexeymin@minlexx.ru>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-nt36672a-panels-v2-6-f8de8be5b86f@minlexx.ru>
References: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
 <20260917-nt36672a-panels-v2-6-f8de8be5b86f@minlexx.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 16:55:04 +0000
Message-Id: <20260917165504.F10AF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/panel: nt36672a: skipped power-down sequence on partial comm=
and failure
--

commit dfbf7416bcb60d153c91f5ee831680912a52282d
Author: Alexey Minnekhanov <alexeymin@minlexx.ru>

drm/panel: novatek-nt36672a: Add 3 panels used in Xiaomi phones

This commit adds support for 3 DSI video mode panels used in Xiaomi Redmi
Note 6 Pro and Note 7, which share the Novatek NT36672A controller. The
panels use a common initialization and de-initialization sequence with
minor variations.

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu=
/drm/panel/panel-novatek-nt36672a.c
> index a445c8067aa5f..d356348d39608 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
[ ... ]
> +static void lavender_tulip_deinit_cmds(struct mipi_dsi_multi_context *ds=
i_ctx)
> +{
> +	dsi_ctx->dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 20);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);

[Severity: Medium]
Does this sequence introduce a regression by skipping the hardware power-do=
wn
commands if the initial display-off command fails?

If mipi_dsi_dcs_set_display_off_multi() encounters an error, it sets
dsi_ctx->accum_err. Because accum_err is not reset to 0 before the following
commands, mipi_dsi_msleep() and mipi_dsi_dcs_enter_sleep_mode_multi() will
immediately return without executing.

Bypassing the panel's sleep sequence and mandatory delays before cutting
regulator power can cause visual artifacts like flashes or fading, and might
violate hardware power sequencing requirements.

Should we reset dsi_ctx->accum_err to 0 after the display-off command to
ensure the sleep mode and delay commands still execute, similar to what is
already done in tianma_fhd_video_send_deinit_cmds()?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-nt36672a-p=
anels-v2-0-f8de8be5b86f@minlexx.ru?part=3D6
