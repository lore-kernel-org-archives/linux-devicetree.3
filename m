Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B0343D4FF
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785313352; cv=none; b=EgnSqoqm4Cq6ZQeGveLrxT4e4Jd7yonm/BqX1q/YT61Mj8z9cXGq3hHT9sHyXhvlyvKmzRSjzfxV+5BIbhMxUxZzJWVUG3bDBzY7VGDeGSwNpc147hRvjkFGf0dSWE59GebgZ3A21pV7JouUvdzIFKQP7XEdr5gu1S0ERTO6l4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785313352; c=relaxed/simple;
	bh=axX7gKKOHk1YW+RtZKclI+E6KyFiOiLKwFFLmh3AX7g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iuj+GeKtzRGjGKQkwR2CAks1/5em7XcL24dogYmOZ0U6fMq0g1B5vXTOnYpslLJkX0MKAtGK9h4NF2bqMakw8yoMERi13UrsyddU+8g62qJDC+F36qh+OnA9T4h2LZZmkUobzxo1vPQx5wIzL7kI8cIrIEgSjVm8m5+h5IZMXpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hsy9ttj6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hsy9ttj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9461A1F00A3A;
	Wed, 29 Jul 2026 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785313337;
	bh=tqKuUG4JRKq+XxC9umJMKRbK9NDvv+i1824XarU7c6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hsy9ttj6g6sxE3VUBjQqXID677pyICSCI6SyDRtCzVAa5SRtQC8pZDBUZ6CoGj1K0
	 t0MWPQfNOzhfMh1oJLnwJChXqJ1MAkH8N8HOZDrXLAk8dAzvozBaBgDuJsyDorwNuI
	 BjKYD1FqHjMpndt5rLxv5uLml1/kZQKn8KK/SoFopVl9hqLB5I1fyna+NsEEfA5S/0
	 ClPdVLsoq/3+5cRs1OwFdlD2v3Giouyp7Yz5sI/xId17ZxDGuiHjS65cMRvTjwymtd
	 tQmIbozRko2nSgtS3qpRkC1P6921YaLNseF2Bx4d9vi+ZyEYLA51aqfvr1CSpI8WJp
	 OIeILOuJXPGow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-og0va1b-v4-3-ec7e7ed87b2b@oss.qualcomm.com>
References: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
 <20260729-og0va1b-v4-3-ec7e7ed87b2b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 08:22:17 +0000
Message-Id: <20260729082217.9461A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Build failure on 32-bit architectures due to 64-bit division withou=
t kernel math helpers.
--

--- Patch [3]: [PATCH v4 3/4] media: i2c: og0ve1b: Introduce per-sensor dat=
a structure ---
commit 44a11606f1ac2c69b89a34ee20cb6650216651a9
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: media: i2c: og0ve1b: Introduce per-sensor data structure

This commit refactors the driver to separate sensor-specific data from the
common driver code. It introduces a sensor_data structure, populated through
i2c_get_match_data(), to hold chip ID, MCLK frequency, link frequencies, and
supported modes.

> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index da5c8e49d4a81..df428137cfdc1 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c

[ ... ]

> @@ -330,10 +354,19 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops =
=3D {
>  	.s_ctrl =3D og0ve1b_set_ctrl,
>  };
> =20
> +static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
> +{
> +	const struct og0ve1b_mode *mode =3D &data->modes[0];
> +	unsigned int bpp =3D mode->code =3D=3D MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
> +
> +	return data->link_freq_menu[0] / bpp;

[Severity: Low]
Will this 64-bit division cause a linker error on 32-bit architectures?

Because data->link_freq_menu[0] is an s64 and the bpp divisor is evaluated =
at
runtime, the compiler can no longer constant-fold the division. On 32-bit
architectures (like i386 or arm32), a native 64-bit division by a 32-bit
variable results in an undefined reference to __divdi3 or similar.

Does this code need to use div_s64() or div_u64() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-og0va1b-v4=
-0-ec7e7ed87b2b@oss.qualcomm.com?part=3D3
