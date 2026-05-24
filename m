Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CECF1FB1
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779615718; cv=none; b=dFlPu51rl2RJE5B++oa8+gGYkPCJto6OIOKx+NXY7ktOv/2f8CHzqA4QTQtOWjJbLXghVt+uiA9SoyL1ANokP73qYZb/kukZXSBicKyads9Kbhuq8NOjfyi3VMqD0U7o5DRoQKvXvroVO+RQr3RA3hFDprGnDh7ye+h5yPfy1xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779615718; c=relaxed/simple;
	bh=xHVae84KgPkCPSqEbzuXwq0KRlnsddffK6oq0JltY/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ot6WGLXilZgQsS/6GwMWHJe7I2tPI1NART71AC9v1PlS20Zv01VYT2WzmSKO0xCJntQ1nEpH7+UAaddrl/H9GIWZCPrfvu4mdBaUlnNJbK2aleSIRm6cQWcnHlvRhqCiOc5L/ovx5Nah22Thm3Dl1byS8OWQMBvHmVmzza+xSxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmxOStzd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmxOStzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B1E1F000E9;
	Sun, 24 May 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779615717;
	bh=RK1CqKtlPOAXmyK5G1x20M/Q/KAo6x9vR6jJmSZIBhc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QmxOStzdKuVWFNnLE8xiQRfFNQVFnhC5TInlESaPZP/ZzfGVKsRyV94QlVH+RxY3M
	 k7JqjI3N/2bV0Bg1AdONNdhVTfECd26v+o8JByQVPsjoCNasvUVWkjxNNf38C+HCBB
	 /GyQZikxQGeLZ2MpTKHeLhiCiJLchiDlFRhJufEBxVkH+BIugJ6xPTfT2bKaew9Bjm
	 b4CyZoJYCISa6phrCGARwn3dGVNRCwlIZ5UOBmfkowCu0vMccILnl4lIShHg0UUNhO
	 +kRdaPyMhxtrYybyLRdc5pu19WJXZxX12Of/xuNbmmT4ltS+ZDZCAqLInsKs9lN1UF
	 hNdEtBYwww3sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 4/7] iio: osf: add stream parser
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524085312.15369-5-kimjinseob88@gmail.com>
References: <20260524085312.15369-5-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 09:41:56 +0000
Message-Id: <20260524094156.D7B1E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 'partial_frames' statistic is incremented erroneously during=
 normal chunked data reception, making the metric artificially spammed and =
useless.
- [Low] The frame is successfully parsed into a stack variable, but the pop=
ulated structure is ignored and completely unused.
--

commit f278438df751263938f58f94af6a218883f9f11f
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add stream parser

This commit introduces byte stream assembly and frame synchronization
capabilities for OSF0 frames. It handles buffering, magic sequence matching,
and payload validation before passing frames to the core.

> diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/open=
sensorfusion/osf_stream.c
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_stream.c

[ ... ]

> +static int osf_stream_process(struct osf_stream *stream)
> +{
> +	struct osf_frame frame;
> +	size_t decoded_len;
> +	size_t discarded;
> +	size_t frame_len;
> +	u32 payload_len;
> +	int first_err =3D 0;
> +	int ret;
> +
> +	while (stream->len) {
> +		discarded =3D osf_stream_discard_to_magic(stream);

[ ... ]

> +		if (!stream->len)
> +			break;
> +
> +		if (stream->len < OSF_FRAME_HEADER_LEN) {
> +			stream->stats.partial_frames++;

[Severity: Medium]
Is it intentional to increment this statistic during normal chunked data
reception?=20

Since stream data often arrives in partial fragments, breaking here is expe=
cted
behavior while waiting for the rest of the stream. Incrementing an error
counter on every normal yield might spam the metric and make it less useful
for debugging actual issues.

> +			break;
> +		}
> +
> +		if (get_unaligned_le16(stream->buf + 6) !=3D

[ ... ]

> +		frame_len =3D OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
> +		if (stream->len < frame_len) {
> +			stream->stats.partial_frames++;

[Severity: Medium]
Similarly, does this falsely increment the partial_frames statistic while
simply waiting for the rest of a valid payload to arrive?

> +			break;
> +		}
> +
> +		ret =3D osf_protocol_decode_frame(stream->buf, frame_len, &frame,
> +						&decoded_len);

[ ... ]

> +		if (decoded_len !=3D frame_len) {
> +			stream->stats.dropped_bytes++;
> +			osf_stream_drop_invalid_head(stream);
> +			if (!first_err)
> +				first_err =3D -EMSGSIZE;
> +			continue;
> +		}
> +
> +		ret =3D osf_core_receive_frame(stream->osf, stream->buf, frame_len);

[Severity: Low]
Does this code need to pass the raw buffer to osf_core_receive_frame()
instead of the parsed struct osf_frame?

The earlier call to osf_protocol_decode_frame() successfully parses the fra=
me
into the stack variable frame, but it appears to go unused. Passing the
already-parsed structure to the core might avoid redundant decoding
inefficiency.

> +		if (ret) {
> +			osf_stream_discard(stream, frame_len);
> +			if (!first_err)
> +				first_err =3D ret;
> +			continue;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524085312.1536=
9-1-kimjinseob88@gmail.com?part=3D4
