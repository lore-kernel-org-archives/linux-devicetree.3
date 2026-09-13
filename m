Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DE84BEE5E
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 06:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281063; cv=none; b=BAcTrMDYvKCUqTYw5VSJVlWWPa8nDJwGVT24mC36rsSsf8f2Oab4un4TY6drQeMAFlWgcfQZn2HaRCyGQOYO9jVNjKZ9KFvq49b/S6BYtWtnV7fOQ0rE8Txf/eqNWUtuAR7khYj24nhvFqcMLUqqd03PqlvojBL2c2c5KJXB4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281063; c=relaxed/simple;
	bh=tfoQhbG4vwKUZsu8auG2w2ylvnBBsEedbeQAcznLsBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sH9uyEMR9himSbgUo2IimZ4wO/Hwht1B0LNVfWOP2mxUDsiVLdkvTsq+5+4XiMXn/eDecffd7Ms4M5JCkxcMDDTpEeVlf0d5Th04oPh7eWlgV7qTtWqo90tYibrqIHcc2iBjsieTT7Mt5JaVN0vdWRG4qwFPlIb5tBkWx+itGHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnX6kLpE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnX6kLpE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEC71F000FF;
	Sun, 13 Sep 2026 06:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789281062;
	bh=7i/oFh4h/tpmmXPumfzT59n1pQpIo8OisQguARBrfVM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WnX6kLpEAQWdFIGcT8WzhS+U0kg2n9t+cue28m3Vym9rs7badvu0BC1KI3ln4uWCH
	 nHjt7p4zkYnmqAADzcsHJgcm7BYYqfLrksREboiy0SR8Rhcj7xCUM4E0Bub0RlMQKN
	 xw1RqdIYlHlOBTJayjhAnaa6829TIZ4UBTH/aKj9gG8fCes5x7Texzeu2qqzbo5aTs
	 wLwBEJcFlpznaa8LYb4QlgA671W6bU2OjX7QgQpDLLo2985vfQMu/RgztBjrd2EDLn
	 x/cDc8JaLv/Hb0nF1St+1GWhJZFtFG0GlM1lhaclKA6BdXbimuh7ZT80TX9ngIHzYL
	 9wIwLq43RWolQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] drm/panel: novatek-nt36672a: Add Tianma panel for
 Xiaomi Mi A2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Minnekhanov" <alexeymin@minlexx.ru>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260913-nt36672a-panels-v1-7-ce097402c6ea@minlexx.ru>
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
 <20260913-nt36672a-panels-v1-7-ce097402c6ea@minlexx.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 06:31:01 +0000
Message-Id: <20260913063102.0BEC71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Direct use of `usleep_range` instead of `mipi_dsi_usleep_range` byp=
asses multi-context error tracking.
--

commit 883b76cff93d823c9430acc0b7cfca0a77f61ed2
Author: Alexey Minnekhanov <alexeymin@minlexx.ru>

drm/panel: novatek-nt36672a: Add Tianma panel for Xiaomi Mi A2

Add support for Tianma TL060FVXS16-00 video mode panel based on
Novatek NT36672A, used in Xiaomi Mi A2 smartphone (xiaomi-jasmine).
It shares some code with already supported panel in this driver
for xiaomi-lavender, so we can reuse the same panel deinit function.

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu=
/drm/panel/panel-novatek-nt36672a.c
> index e6971ba6ef464..1bfa808365874 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -445,6 +445,29 @@ static void lavender_tulip_deinit_cmds(struct mipi_d=
si_multi_context *dsi_ctx)
>  	mipi_dsi_msleep(dsi_ctx, 120);
>  }
> =20
> +static void tianma_jasmine_init_cmds(struct mipi_dsi_multi_context *dsi_=
ctx)
> +{
[ ... ]
> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
> +	usleep_range(5000, 6000);

[Severity: Low]
Is it intentional to use usleep_range() here instead of mipi_dsi_usleep_ran=
ge()?

Using usleep_range() directly bypasses the multi-context error tracking in
tianma_jasmine_init_cmds(). This causes the unconditional 5-6ms sleep to
execute even if previous DSI commands have failed and set dsi_ctx->accum_er=
r.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-nt36672a-p=
anels-v1-0-ce097402c6ea@minlexx.ru?part=3D7
