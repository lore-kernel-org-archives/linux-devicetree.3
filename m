Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D4E45563D
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752550; cv=none; b=FOwZOMT6iYf762HvvYqZR3+6qVtd+CGvo4LuAk3zkX+f8QyTrl1Z3HE06PckWacdtSPONRKXSK7z2MGq0udOzGmyIJkyMM2K6vj7/8z2sftWsNOQBtWDhtPv6qvyemHpEZQbI3SkHlhl2VpvrPf4lXkHvWBp0Tho7mL9sdic0W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752550; c=relaxed/simple;
	bh=/DfoPdGWeb9/mlFZ2GApG4C21FK0unX0TicoXXV1lm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rclvkwnKX1nTsc9VTadTLXJeVj9Lj9uUAgWD6UA4Kff0CzzAgC72VhbSiNIIlD3eWNck9aTpty7k/pSE+VCY4DhLoc76cvV5Fe/9BpLhKhtw4PA1x/aD5DL2wOUobfFB2kBhFRKrBk5EEKxAHluQD1uU6vNRCgfS34CANXphO5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5ZkTKzg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5ZkTKzg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875EF1F000FF;
	Wed, 30 Sep 2026 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790752540;
	bh=5Xx1GSGA4K5lgEyX28lC6Z89+NbfaIUkMXFybynLM5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d5ZkTKzgsClo3qUiGMvithvIwAh1mA2SKCwmOqeZ6QyxJG0hwsVwdrBYd/6V1fUim
	 cnDGn4R7VJjQZTzAZj7BvT9vgbxn0+T9wI8auFmgQvAM9eIltAg4C6RgMFpdpIky2J
	 qyTyNdk5mppZoR/wywPGqCUZl/h2etLPuxH+gM45FsyUR1moUCiw2MPYW7aUADdcTl
	 mwDxM7qx3/xYyPwUgCYrwcZ+LKjEpRDJcWgsbKT2rLyo7nTEqKm7/rvhqBWeNDTHSE
	 LA5/qOsfaejj/1J6CJHNyOIK15n70+gyodvCb7IEY8TutKbNt+/NUkUNV2q/zlEz9F
	 s6HQQ6vuyJFEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/6] drm/tegra: dc: Expand available registers
 layouts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260930070535.47130-2-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
 <20260930070535.47130-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:15:40 +0000
Message-Id: <20260930071540.875EF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/tegra: suspected typo in V_PULSE2/3_ENABLE bit definitions
--

commit e8ce1bb59e056f4559d5bb8b73b971c10b8c4d5a
Author: Svyatoslav Ryhel <clamor95@gmail.com>

drm/tegra: dc: Expand available registers layouts

This commit expands existing display controller register definitions with
additional fields in preparation for adding an 8-bit CPU interface.

> diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> --- a/drivers/gpu/drm/tegra/dc.h
> +++ b/drivers/gpu/drm/tegra/dc.h
[ ... ]
> @@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
>  #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
> =20
>  #define DC_DISP_DISP_SIGNAL_OPTIONS0		0x400
> -#define H_PULSE0_ENABLE (1 <<  8)
> -#define H_PULSE1_ENABLE (1 << 10)
> -#define H_PULSE2_ENABLE (1 << 12)
> +#define H_PULSE0_ENABLE				BIT(8)
> +#define H_PULSE1_ENABLE				BIT(10)
> +#define H_PULSE2_ENABLE				BIT(12)
> +#define V_PULSE0_ENABLE				BIT(16)
> +#define V_PULSE1_ENABLE				BIT(18)
> +#define V_PULSE2_ENABLE				BIT(19)
> +#define V_PULSE3_ENABLE				BIT(20)

[Severity: Low]
Are the bit definitions for V_PULSE2_ENABLE and V_PULSE3_ENABLE correct her=
e?

The other enable bits follow a spacing pattern of +2 bits, like H_PULSE0 at=
 8,
H_PULSE1 at 10, H_PULSE2 at 12, V_PULSE0 at 16, and V_PULSE1 at 18. However,
V_PULSE2 and V_PULSE3 break this pattern by mapping to BIT(19) and BIT(20).=
 If
the pattern held, they would be BIT(20) and BIT(22).

Is this an expected irregularity in the hardware layout, or could this be a
typo?

> +#define M0_ENABLE				BIT(24)
> +#define M1_ENABLE				BIT(26)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930070535.4713=
0-1-clamor95@gmail.com?part=3D1
