Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747F1368D4F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432950; cv=none; b=k2bAqCGrWRs6VnYmikTuJ17BaT3i0sIgmwXzbGRmaokKjsEWkObQpVFMdDnPX47NQ4+6W/V4sZnKKJjVyzOAILyHlC6nQFbhh71UuPx0V5BkZTFYMSoZt3p2iGnsOBFUp6lZmvgzMFmOJf7v+Jtlv91lgy5UIZYSDS+l79jpU7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432950; c=relaxed/simple;
	bh=uNCxDCpMpzHxJ8/5r3ebQMoPZBFfZnYC4w1fJOA3vkE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AfZ5JoCR5I1ExEtS6LyoMyU7ampDUu2rZSfohwxGku1/CiOdO+nS6ZCWNiTy+52ByYOmI8QMfDJNe+WcoTkrsESIMZ3E6DyvnXzqluhlUb8ke8aR14BHbQWj6SsLueAsruX2vHvobEEY9jSUhE/QMa31DoscS9O+p3cg01DXOUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVvcbE7X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVvcbE7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCD81F000E9;
	Fri, 22 May 2026 06:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779432948;
	bh=MlbSjA1hFlreJCmeQaA/vW0m2sPkHeM6UigEMkWmLec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IVvcbE7XVVhPqJKPTTVB/246PyZnsno5PlVD5CErTsAzt0Etk/V3XJH1NQMCeWgzP
	 qwDU6TtH/ft8VY38HAUfKtaZaCr53wXlBDKrCWo2PMyetjGQcYiTOZ6A89RMHQ0wVK
	 SchzduCO0RwuYI7a6tvmViMexs4F/O9Fqd7UeBl4xutxTJYWmaTgb7g/dipfWzx3xt
	 m9bjv+BTibN7Ski7gAeZaqPoclSgBNVLlZ2sQRNx++bLV7bByX9qz3/oPuS5ZcRAu1
	 zXYwcz+27PwAo1j4s2aQLYrLNZRTjxnG6VnxbeQVblSmQWnVAlNMfKcFL6qbpr2lws
	 PQZX9E247Gp8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] drm/msm/dp: Limit voltage swing level to 2 for
 RA620 bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3JhaGFtIE8nQ29ubm9y?= <graham.oconnor@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260522060645.4399-4-graham.oconnor@gmail.com>
References: <20260522060645.4399-4-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 06:55:47 +0000
Message-Id: <20260522065548.2CCD81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] A device-specific workaround for the RA620 bridge is applied globa=
lly, capping the maximum voltage swing and pre-emphasis levels for all DP d=
evices using the MSM DP driver.
--

commit cfc03fd78122eb643ca94e4cccdc197ffa9a8de0
Author: Graham O'Connor <graham.oconnor@gmail.com>

drm/msm/dp: Limit voltage swing level to 2 for RA620 bridge

This commit reduces the maximum DisplayPort link training level to 2 to work
around a link training failure specific to the RA620 DP-to-HDMI bridge used
on the Radxa Dragon Q6A platform.

> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp=
_link.h
> index 76125e9c07e9c..ff0d8e99d87c9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.h
> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
> @@ -24,7 +24,7 @@ struct msm_dp_link_info {
>  	unsigned long capabilities;
>  };
> =20
> -#define DP_TRAIN_LEVEL_MAX	3
> +#define DP_TRAIN_LEVEL_MAX	2

[Severity: High]
Does this change globally cap the maximum voltage swing and pre-emphasis
levels for all DisplayPort devices using the MSM DP driver?

Because the DP specification supports voltage swing up to level 3, which is
often required for signal integrity over long cables or at high bandwidths,
removing this capability globally can cause link training failures and
unstable connections on fully compliant displays.

Furthermore, since maximum pre-emphasis is calculated as DP_TRAIN_LEVEL_MAX
minus the voltage level, capping this macro at 2 means that if a voltage
swing level of 2 is used, the pre-emphasis level is strictly constrained to=
 0.

Could this hardware-specific workaround for the RA620 bridge be implemented
conditionally (for example, via DPCD OUI detection, bridge properties, or
device tree matching) rather than permanently degrading global subsystem
capabilities for all platforms?

> =20
>  struct msm_dp_link_test_video {
>  	u32 test_video_pattern;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522060645.4399=
-1-graham.oconnor@gmail.com?part=3D3
