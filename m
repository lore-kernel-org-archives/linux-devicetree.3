Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3062DCF45
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779614222; cv=none; b=Oa5lfqfntwoSY4OsMkROWMIreBSDsiBNSO0Ow7RdjGm0z+5rv72jsN3t7/CPInnh88NTsOEt+cVTgThVzMXcvRFZR9jwtjJtNyYY0Kqh/BubBRUj/44bwLzrwlTZ5dyqy9rxxxVT3bbrL/6dVD6FQ+pK+pUT6YqLIFtHYo3w498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779614222; c=relaxed/simple;
	bh=BcW1yxIPo0AQzjke5wsDu/mVVqOW7M26UJLw704xFeA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ebH+JP228FAwruzXgGKdWSQWR4jSI1Zkyyg77l31Xd5TZvK2fUBklPq5sVD3IcR/xOKMuH8VmMgOiTIzjhV8dhRwIvpW72u8N7zByuadjfq+GOhC4Urirpp9JIWk+6s5UynzC0Ql9vhZvZwQj2ocLz0FCffRtY9V/hFEWUo+2KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4Jdo70j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4Jdo70j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D15B1F000E9;
	Sun, 24 May 2026 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779614220;
	bh=+tEyJL3HoVRqOP/MuifunGy0g3RaWsdhuMxr4wOIZJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J4Jdo70j9Ibagpxok5wEw1BeWKRa9xQVhFwy1JEG+vSx3vV8Fz/wKomi+TnvEVKwS
	 U3UzI1ai1Nkljk74MpH1fKm4GNmYc4gNoAR4HCOEEIruDo66CshMDhOs5ZeaAsmK3N
	 +6FJRx4dAldENL8IDEwQWhJ5hnyB2IsvTB2fJpg7cqtD+w1WsAZDMrkxLPLcCBAaKL
	 JQrAwaTtSuowYrRnyiholeqGkmT+OW1/qfk/NtBgXmURhEo40zmhzeZrdOGOlQA4Le
	 NuqhCGGD60OafHXQFx0Wmm1GYOhA/5sQ2JElXUe0WLwGBUiAusdSjLNOR37fzlU83k
	 qt9uzm0DP0olg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 3/7] iio: osf: add protocol v0 decoding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524085312.15369-4-kimjinseob88@gmail.com>
References: <20260524085312.15369-4-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 09:16:59 +0000
Message-Id: <20260524091700.5D15B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The function `osf_protocol_decode_sensor_sample` fails to valida=
te the untrusted `sensor_type` field from the payload.
--

commit 771f82b33a67fcd96de20b3ff22ae83721808219
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add protocol v0 decoding

This commit introduces the OSF0 protocol frame and payload decoders for
device-to-host messages.

> diff --git a/drivers/iio/opensensorfusion/osf_protocol.c b/drivers/iio/op=
ensensorfusion/osf_protocol.c
> new file mode 100644
> index 0000000000000..ac3c37ae28f32
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_protocol.c

[ ... ]

> +int osf_protocol_decode_sensor_sample(const struct osf_frame *frame,
> +				      struct osf_sensor_sample *sample)
> +{
> +	u16 channel_count;
> +	u16 sample_format;
> +	u32 expected_len;
> +	const u8 *payload;
> +
> +	if (!frame || !sample || !frame->payload)
> +		return -EINVAL;
> +
> +	if (frame->message_type !=3D OSF_MSG_SENSOR_SAMPLE)
> +		return -EPROTO;
> +
> +	if (frame->payload_len < OSF_SENSOR_SAMPLE_BASE_LEN)
> +		return -EMSGSIZE;
> +
> +	payload =3D frame->payload;
> +	channel_count =3D get_unaligned_le16(payload + 4);
> +	sample_format =3D get_unaligned_le16(payload + 6);
> +
> +	if (sample_format !=3D OSF_SAMPLE_FORMAT_S32)
> +		return -EPROTO;
> +
> +	expected_len =3D OSF_SENSOR_SAMPLE_BASE_LEN + channel_count * sizeof(s3=
2);
> +	if (frame->payload_len !=3D expected_len)
> +		return -EMSGSIZE;
> +
> +	sample->sensor_type =3D get_unaligned_le16(payload);

[Severity: Medium]
Should this code validate the untrusted sensor_type field?

The parser validates the sample format but assigns sample->sensor_type
directly from the untrusted device payload without calling the available
osf_sensor_type_valid() function.

If an invalid sensor type is accepted and passed to the core handler, it
could be stored in the latest_samples cache. Since the cache has a fixed
limit (OSF_MAX_CAPABILITIES), storing invalid sensor types from a malformed
payload could exhaust the available slots, causing legitimate future sensor
samples to be permanently dropped with -E2BIG.

> +	sample->sensor_index =3D get_unaligned_le16(payload + 2);
> +	sample->channel_count =3D channel_count;
> +	sample->sample_format =3D sample_format;
> +	sample->scale_nano =3D get_unaligned_le32(payload + 8);
> +	sample->reserved =3D get_unaligned_le32(payload + 12);
> +	sample->samples =3D payload + OSF_SENSOR_SAMPLE_BASE_LEN;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524085312.1536=
9-1-kimjinseob88@gmail.com?part=3D3
