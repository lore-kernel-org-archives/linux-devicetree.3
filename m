Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766812;
	b=jniS/X6qzbg6o2w+LK6x5rURJml8wSKoRdaHSI6P2yr1Uol16FtdZ2OJXzxhrIECz3CF
	 FQgTY2d9i85zuzo66S2YPEV42T24SwJwTlliY0BMDV54pWDiAaZH+L/P+ynVmyPykhz9o
	 MXGyleVLCn3Kq1O87FX6L3n51OLEjj5MPylsyo45N07y12XnoxqrUEmvp04GSh0qGj6XZ
	 he3WBKyuEg0LUAARd0clKkcQR6cF9itd5nBWldxw6XTKMgSvdExYy6sMHtRjmwBZJyfvV
	 LjJ6uvurgJiKMBC3U1AyUFS4aanvarQFySan5jGiL4sg4ylh9NltGLnVkwsPCxO1u3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766812;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=whGkBZSbMuSpd24uDcRJiN4J89s+PXioFAi8U4DruqM=;
	b=Yveyx6OIxQs6JUhKlBsoamujdpo4jzWotLl1VPUBAe0TYv6N97nsKqHJNElUD1j659VJ
	 TfNnndvv/KqZugBMqj2U1IZb4hsD/zOuC4cG/1SzIwhc8g8GOEfFGAwwvWo0zHo7RMLCh
	 IPwEuaEXhJsty3L8cJTW+2EIoRAWRos3mQZrmY/ceftibbpzBQcHFuvWU3d26NMjfIDJU
	 OGZL6llu7eFk1N3JV2bi9UpPEp52bwgjNAqZbtI9u84HH9WXf13v5jEeUvyfZk13irxJ5
	 kmH77VghEyONYzGNz/hu2BToJvfhONQCuk+qh8OHkA3Pr6loqlwDX1TFjz6fXq+SVDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYC49GHz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6DC606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYC49GHz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D49C1F00893;
	Fri, 27 Nov 2026 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795766812;
	bh=whGkBZSbMuSpd24uDcRJiN4J89s+PXioFAi8U4DruqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YYC49GHzWxH9rdXmrrDsHwc3Hy1NEN9vOcft+hS9RRUMCY8jaT8+se8AYH+FxKqUz
	 Nn+nbyyutZTLNTcRjJt8w7Y87q1AbFKSs1uarsN/6P7Owgo6M3kLpi+T0+hCQwWO1d
	 tEgPtme2RAOdIQh9i8v8c1modQe4fXbyFqGziQfWyUOFgA6mZyAaLoOzp0qZKQJMFS
	 zVsN+SSYV0FVq7oi6Qn5qTYsv+7SG4F98zMXOKkZenyjHLKJVhh2HDBiG/kjuZONUb
	 7rZ9T9uhAyAgx/b47E2GrWAHg3GuXI+7EMFNRh5kETRINdBmyqIxdOfyV/XlJVOI8D
	 3bnhvMwhBLIrw==
Message-ID: <sashiko-outbox-236860@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/5] drm/bridge: trilinear: add the DPTX DRM bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Liu" <Luo.Liu@cixtech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127074639.277959-4-Luo.Liu@cixtech.com>
References: <20261127074639.277959-1-Luo.Liu@cixtech.com>
 <20261127074639.277959-4-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 08:06:51 +0000
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
- [Medium] drm/bridge: trilinear: htotal and clock overflow in
  dptx_adjust_mode()
--

commit 121beb945da3bca1311595f6221c3e03dd980739
Author: Luo Liu <Luo.Liu@cixtech.com>

drm/bridge: trilinear: add the DPTX DRM bridge

This commit adds the DRM bridge implementation for the Trilinear DisplayPort
transmitter, handling connector detection, EDID and downstream mode
enumeration, mode validation, and atomic modesetting callbacks.

> diff --git a/drivers/gpu/drm/bridge/trilinear/dptx_drm.c b/drivers/gpu/dr=
m/bridge/trilinear/dptx_drm.c
> new file mode 100644
> index 0000000000000..7a081873560bf
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/trilinear/dptx_drm.c

[ ... ]

> +static void dptx_adjust_mode(const struct drm_display_mode *mode,
> +			     struct drm_display_mode *adjusted_mode)
> +{
> +	int diff =3D mode->htotal - mode->hsync_end;
> +
> +	if (diff < DPTX_MIN_H_BACKPORCH) {
> +		adjusted_mode->htotal =3D mode->htotal +
> +					DPTX_MIN_H_BACKPORCH - diff;
> +		adjusted_mode->clock =3D
> +			div_u64(mul_u32_u32(mode->clock, adjusted_mode->htotal),
> +				mode->htotal);
> +	}

[Severity: Medium]
Can adjusted_mode->htotal and adjusted_mode->clock overflow here when a
userspace mode has a horizontal backporch smaller than DPTX_MIN_H_BACKPORCH?

Because adjusted_mode->htotal is a u16 and adjusted_mode->clock is a signed
int, a custom mode with mode->hsync_end >=3D 65524 wraps adjusted_mode->hto=
tal
to 0..11 and truncates adjusted_mode->clock to 0 (or overflows
adjusted_mode->clock past INT_MAX when mode->clock is near INT_MAX).

dptx_bridge_mode_valid() and dptx_bridge_atomic_check() only check the upper
bound of adjusted_mode->clock, so the wrapped value passes validation and
reaches dptx_bridge_atomic_enable(), where dptx_hw_stream_timing_set()
underflows mode->htotal - mode->hdisplay and divides by zero on mode->clock:

drivers/gpu/drm/bridge/trilinear/dptx_hw.c:dptx_hw_stream_timing_set() {
    ...
	dptx_hw_write(hw, DPTX_SECONDARY_DATA_WINDOW(stream_id),
		      (mode->htotal - mode->hdisplay) * (link_rate / 40) *
		      9 / mode->clock);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127074639.2779=
59-1-Luo.Liu@cixtech.com?part=3D3
