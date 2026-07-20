Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B06233AD8F
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546555; cv=none; b=C+jIaDIkJpYLgH89J6vuNWxvDwieeSi4pgB0cYP8/85vl3B6NBFlTEbrrTOE0V1fWmal1TQcyMc2bQhZ/N7YNWMixtYkz8BVfSu7LaE844Pg+cYE3e/d4QA9QfHzX4rja97cTrjYq7vk4B6WAdlKFG2oohp7pemmpxGYvKn8/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546555; c=relaxed/simple;
	bh=ii+c/XC1wIyapAGI32bLvL17q5p0lsBx3AIZibKmLis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D1SOVkhUgZ449mMIYXGOx+X6mt/UQopQ03Q48TuV+Z1N+8NH7Hk7r+kaN0OSi4/CpZlwhWKyznQVJhQeu0geXBjDP7dv26axzIEN7/gi/wJUZXBUlLSe1oBj5aRdJKTNiUlxu/TV4Zd8GwgyzeHyZk9UFGfTDYhiKwHzdlUxjX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPPc8/2z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPPc8/2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166E01F000E9;
	Mon, 20 Jul 2026 11:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784546554;
	bh=LDOPuwwlxoXFoeHVGEIk9vysslyFX5D0VzSO1nqD1zw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPPc8/2z/qVWYXZX42xA+Dq/36hM2LDGuLeNkhHcFwenbLaOm9+QwdB9z9wpjAUH7
	 LJs9RSh50okv3NmROoJJU0i0+VEGM7qBEBPoDKTlf+Kgl93rILeI9lwQl0p9BWbbVC
	 ocExV9F+AIfiOpcE3QjW/sZ0d3ixdgFhEBPxbfhWc/dO4nXdxWk44FUBszmnhOGrtX
	 yB+nA4+wqcPmRc/gEqHLBElQoETCQJcGvmKDKj1RvW5WWom5qqH6t/a0VAMdXtrIN7
	 zSIbnw008vQ0S99VUzosLSRrbTpj9/+MZOUieXa+97XQISoA2IIZ/HUbJK1ZNVRDgk
	 4x2Z0x0P/qHVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] iio: adc: ade9000: add support for ADE9078
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720110754.7674-4-antoniu.miclaus@analog.com>
References: <20260720110754.7674-1-antoniu.miclaus@analog.com>
 <20260720110754.7674-4-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:22:32 +0000
Message-Id: <20260720112233.166E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Duplicate and overlapping `scan_index` values assigned to phase B =
and C channels break the IIO buffer subsystem.
--

--- Patch [3]: [PATCH 3/4] iio: adc: ade9000: add support for ADE9078 ---
commit b9467a190f2a74b5ff3993276ef11d90860fe13b
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

iio: adc: ade9000: add support for ADE9078

This commit adds support for the ADE9078 polyphase energy metering device,
which is register-compatible with the ADE9000 but lacks dip/swell detection.
It introduces a dedicated channel table to omit those events and adds match=
ing
chip_info for the full-scale codes.

> diff --git a/drivers/iio/adc/ade9000.c b/drivers/iio/adc/ade9000.c
> index 52ad87ef05d0c..0d5aa26f6667b 100644
> --- a/drivers/iio/adc/ade9000.c
> +++ b/drivers/iio/adc/ade9000.c
[ ... ]
> +#define ADE9000_DECLARE_CHANNELS(_name, altvoltage_rms)			      \
> +	static const struct iio_chan_spec _name[] =3D {			      \
> +		/* Phase A channels */					      \
> +		ADE9000_CURRENT_CHANNEL(ADE9000_PHASE_A_NR),		      \
> +		ADE9000_VOLTAGE_CHANNEL(ADE9000_PHASE_A_NR),		      \
[ ... ]
> +		/* Phase B channels */					      \
> +		ADE9000_CURRENT_CHANNEL(ADE9000_PHASE_B_NR),		      \
> +		ADE9000_VOLTAGE_CHANNEL(ADE9000_PHASE_B_NR),		      \

[Severity: High]
This is a pre-existing issue, but does this channel declaration cause the
driver probe to fail during IIO device registration?

Looking at the channel macros in drivers/iio/adc/ade9000.c:

ADE9000_CURRENT_CHANNEL(num) sets .scan_index =3D num
ADE9000_VOLTAGE_CHANNEL(num) sets .scan_index =3D num + 1

With ADE9000_PHASE_A_NR (0) and ADE9000_PHASE_B_NR (1), Phase A's voltage
channel gets scan_index 1, which perfectly collides with Phase B's current
channel (also scan_index 1).

Since ade9000_probe() calls devm_iio_kfifo_buffer_setup(), the
INDIO_BUFFER_SOFTWARE mode flag is set. When devm_iio_device_register() is
called, the IIO core invokes iio_check_unique_scan_index(), detects the
duplicate scan_index, and unconditionally returns -EINVAL.

It looks like ade9000_waveform_buffer_config() expects Phase B Current to
map to BIT(2), so shouldn't these macros use num * 2 and num * 2 + 1
instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720110754.7674=
-1-antoniu.miclaus@analog.com?part=3D3
