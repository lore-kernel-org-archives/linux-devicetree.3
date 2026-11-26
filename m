Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675232;
	b=g5jKDDaqllo4AlFuaxq/4l6+mwk6UqYuBFOTlikv9xuizXrsKM3dG5JHJZODXntyQnF7
	 22ImnZxouNYO7nxfVMk9PAgpYxx5EFnnsu9IxquB5zM4Unwch7bri3v8Kp3epazwYFZIO
	 qHsMJihS13ofDtU02w+CkdAU8kimTGCJDMGNPVCpCGKA5Ft4JkGQZnTvWCsR4OoR+t0lc
	 UJzN2Z0o4SWFwOBPlOFj/r1NrhtYmr6O7bd0b1CxMsM8WPN8agf93Zku3nAVOJ7elaAjG
	 /ZwkuLp0OIupmrsFHofMO6N5UiYCX3EEK1f27vW05EFHMJxRkjY3vxlFKIrumNLEk2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675232;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=blq4xNLREr8k88dpzUX5hBq/oGQ1KO/MNO42Ak7DyLo=;
	b=Nq2UIMZ6i4VTSUCBK715J/sYgbBACw4LoBdbSa+nqxQPofvwwqcHu3u+aImwIU/6whc2
	 avVZLGMiYsx8AkEt8bLxKF3bLouxG59TUqzCJvW8U7gPbDmhuz0+uwjDoBAsVGR8WkVQE
	 XMmE3K6wTnt9/82LLuMevQc3CDU3HD3YqJEhHL/o0BkDh9fUfzmtpWZ3ciSb0x45wLRrh
	 6vY3n3cs4ZKwV2XUd2YG+Kernb6Q8gaLa6BlkqNg35D2GvZrWqzjFZAiaxN5Ihz+gBpj3
	 mdcFc21W66tvIpuuyqBeoJs6lAMYkDkRd90a++/Bahj/xqsAYD5Xj+H0srwCuAVJgJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVwHVfxk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CED606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVwHVfxk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114551F000D2;
	Thu, 26 Nov 2026 06:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795675232;
	bh=blq4xNLREr8k88dpzUX5hBq/oGQ1KO/MNO42Ak7DyLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dVwHVfxkPblGWq/fxQgHF8+ok/jj2G2xA+15RX/eShDo2G2xNJLBNJ6eHEl5QOMkC
	 olUk2ljeguMxpRElddLtA504vuUD5HFp8Evhrx/+6cHXpmjnwTi5uOzXJlxrE7jm3j
	 9YyKVQCcclZMDCIFncqrAokOEYivQv9sXRtgWyVVpY4qSLPka6tenUJdTNAjfFUPt8
	 egWjtO2abHVKCg/lV9+/K41nKyFpigd6PWd7act3ZDhR0ScyrbF+O1d0zCj6BEERIA
	 qLELg/nF42zblksyvzcQdHtD3gockxG92qtLaMX0yiQgV5slYiwOO7vr57UJ6wO5FG
	 2tq83P8KDUb4A==
Message-ID: <sashiko-outbox-234874@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/21] drm/msm/dcp: Add HFI panel definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jayant Shekhar" <jayant.shekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-5-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
 <20261126-jshekhar-v3-dcp-v3-5-f1e9d7505039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:40:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/msm/dcp: decimal values prefixed with 0x in
  hfi_panel_dcs_command_type
--

commit d279d718168d7206eea3327b3e453bdfb0781ec8
Author: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

drm/msm/dcp: Add HFI panel definitions

This commit adds HFI panel command IDs, property identifiers, and panel
configuration structures for DSI panel initialization and DCS transfers
through DCP firmware.

> diff --git a/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_panel.h b/drivers/gpu/d=
rm/msm/dcp/hfi/hfi_defs_panel.h
> new file mode 100644
> index 0000000000000..a38d778898b2d
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_panel.h
[ ... ]
> +enum hfi_panel_dcs_command_type {
> +	HFI_DCS_CMD_PRE_ON                      =3D 0x00000000,
> +	HFI_DCS_CMD_ON                          =3D 0x00000001,
> +	HFI_DCS_CMD_VIDEO_ON                    =3D 0x00000002,
> +	HFI_DCS_CMD_COMMAND_ON                  =3D 0x00000003,
> +	HFI_DCS_CMD_POST_PANEL_ON               =3D 0x00000004,
> +	HFI_DCS_CMD_PRE_OFF                     =3D 0x00000005,
> +	HFI_DCS_CMD_OFF                         =3D 0x00000006,
> +	HFI_DCS_CMD_POST_OFF                    =3D 0x00000007,
> +	HFI_DCS_CMD_PRE_RES_SWITCH              =3D 0x00000008,
> +	HFI_DCS_CMD_RES_SWITCH                  =3D 0x0000009,
> +	HFI_DCS_CMD_POST_RES_SWITCH             =3D 0x00000010,
> +	HFI_DCS_CMD_VIDEO_MODE_SWITCH_INS       =3D 0x00000011,
> +	HFI_DCS_CMD_VIDEO_MODE_SWITCH_OUTS      =3D 0x00000012,
> +	HFI_DCS_CMD_COMMAND_MODE_SWITCH_INS     =3D 0x00000013,
> +	HFI_DCS_CMD_COMMAND_MODE_SWITCH_OUTS    =3D 0x00000014,
> +	HFI_DCS_CMD_PANEL_STATUS                =3D 0x00000015,
> +	HFI_DCS_CMD_LP1                         =3D 0x00000016,
> +	HFI_DCS_CMD_LP2                         =3D 0x00000017,
> +	HFI_DCS_CMD_NOLP                        =3D 0x00000018,
> +	HFI_DCS_CMD_PPS                         =3D 0x00000019,
> +	HFI_DCS_CMD_ROI                         =3D 0x00000020,
> +	HFI_DCS_CMD_TIMING_SWITCH               =3D 0x00000021,
> +	HFI_DCS_CMD_POST_MODE_SWITCH_ON         =3D 0x00000022,
> +	HFI_DCS_CMD_QSYNC_ONS                   =3D 0x00000023,
> +	HFI_DCS_CMD_QSYNC_OFFS                  =3D 0x00000024,
> +	HFI_DCS_CMD_MAX                         =3D 0x00000025
> +};

[Severity: Medium]
Were the decimal values 9 through 25 in enum hfi_panel_dcs_command_type
prefixed with 0x000000 by mistake?

This skips 0x0a..0x0f and 0x1a..0x1f, shifting every command ID from
HFI_DCS_CMD_POST_RES_SWITCH onward and setting HFI_DCS_CMD_MAX to 0x25
(37) instead of 0x19 (25).  Beyond sending wrong command IDs, sizing a
HFI_PROPERTY_PANEL_DCS_CMD_INFO array of struct
hfi_panel_dcs_cmd_buffer_info (8 u32 words each) by HFI_DCS_CMD_MAX would
produce 296 u32 words, overflowing the 8-bit word-count field in
HFI_PACK_KEY().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-jshekhar-v=
3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com?part=3D5
