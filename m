Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4540539A04F
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281256; cv=none; b=hL8zOem8fEYy2Ci21LMwBBxDioVCE0JO8l04CSFYEYM0zIGyKwmoWkSu5SmH4Qp/KYpxLuZxTf1cVj+CL3X53OS7qz7nFbStNqqYiDvS3xnDM4Rf74xVUgdGIaLWn9MioA1ei0uLe4BQ1yULyQgePT3z2gCYxU75GiY8e0B7oRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281256; c=relaxed/simple;
	bh=R6bMZljamRsGDZMsDZKMiWWzGJiUWemVvTq5eOZdhXo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OCm587+YzbFUkdPOdKrFquFuqeH/6eMsM3yLzlcN6ZPZtEIyVSk2rlHXvEv+6slSwNTbDugEPFsXLlpc94e8FsJ51cDWmfDA2NUfpZSHPPaZf6Vr/xMBNoSKT1momjHs6OiB6A5LFuZ0T+YHEFnbN3CREli68910isufcewKf/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPsZ5UQh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPsZ5UQh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C27C1F000FF;
	Sun, 13 Sep 2026 06:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789281254;
	bh=C9lDiKB1orARPBiTE7x7OtoR/p5Kk9Vpxvw9xQtsOY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HPsZ5UQhQAwtohJrOH++LasSMso3F+4rc3FkJyaJRPyc8l9Xr1zJztS9kg5xz9E7h
	 lOsaI7GoVpNoNNFPVM6vQCr1kJw1cvtWNbiUkiip00o6ind5xJr2pUsngDZrdDqIHd
	 8FAazGgQXW3ipq9aBaaNjlGlYdFHdFAtdDJ+paysyK9W1MNhduZSSlPgdjmX9w4obO
	 l3qC3/Q3YiljvhhnjMkzlEi1idQvO/0pHXZycYXfhP//QzUZyzYg0MrH+qC0T0X06p
	 B/413St3bR9ADUHzNVt/aC03+Wu2KpClvD+EgP/YoW4g5KM2jgkTftdvZ2R4GSgksP
	 /35nGt2OnkXww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/9] drm/panel: novatek-nt36672a: Add 3 panels used in
 Xiaomi phones
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Minnekhanov" <alexeymin@minlexx.ru>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260913-nt36672a-panels-v1-6-ce097402c6ea@minlexx.ru>
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
 <20260913-nt36672a-panels-v1-6-ce097402c6ea@minlexx.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 06:34:14 +0000
Message-Id: <20260913063414.8C27C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Duplicate execution of DCS display off and enter sleep mode comm=
ands, causing redundant panel instructions and excess delay.
--

commit 84de747d38c5834c233f3124ad401f35b9b4af2b
Author: Alexey Minnekhanov <alexeymin@minlexx.ru>

drm/panel: novatek-nt36672a: Add 3 panels used in Xiaomi phones

This commit adds support for three new DSI video mode panels based on the
Novatek NT36672A controller, used in Xiaomi Redmi Note 6 Pro and Note 7.
It introduces shared initialization and de-initialization sequences for
these variants to minimize code duplication.

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu=
/drm/panel/panel-novatek-nt36672a.c
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
[ ... ]
> @@ -361,6 +361,90 @@ static void tianma_fhd_video_send_deinit_cmds(struct=
 mipi_dsi_multi_context *dsi
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
> +}

[Severity: Medium]
Could this result in redundant panel instructions and an excess delay?

When the panel is disabled, lavender_tulip_deinit_cmds() is called as the
panel-specific deinit sequence by nt36672a_panel_unprepare(). However,
nt36672a_panel_unprepare() already unconditionally executes these exact same
display off and sleep commands, along with their corresponding delays,
immediately after the panel-specific sequence completes.

This appears to result in turning off the screen twice, incurring an
unnecessary 140ms sleep and redundant DCS commands being sent to the panel
during every power down operation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-nt36672a-p=
anels-v1-0-ce097402c6ea@minlexx.ru?part=3D6
