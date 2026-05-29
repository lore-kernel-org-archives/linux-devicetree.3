Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9131DDC1D
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060129; cv=none; b=goB7XOYr3uTqP7+/go8p/96gQlrA2qspRLVaFGAxdKTxCBO75rZi/b87NEr1LvZnWLreyL0+tqjdo4JhK2omKpDDBU+BC0FnQC1bV8wwbdx07sk2QHP28eCPJMDs1rSCF4DXT955MbNkMbFE/Pk89qWu1laZh3lq97mJmfgMQUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060129; c=relaxed/simple;
	bh=UQLsr2qkcqb60El/5BD//D40gKMg5Oi0BtFd3/8rIJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EK7HOlG7qVGGDoyNUTskxnygvzLMgXgPix+MaP2H4u0lSQHoCsmPjQqjX8bi9HcFFfZq0bDjgehfnn+h+U6NwlDrIDH81yH/xRq9LfcXoHwP1H/QdTdcxm5HjVvO7ccV+Ctl032HS64GFZprXrqnOPRHQa/mSPVBylRKbg/EXdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIyrWRnY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIyrWRnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9822F1F00893;
	Fri, 29 May 2026 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780060128;
	bh=qMVo8MFwoKQ+TpaKmIOnFow7Hz/InrHpnfIBEPPxcI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AIyrWRnYXWmXhZCCrCUxV/wh/P/Lyot8NnNG5p5/OpENfh9/2AxNtbRrOacejdfxv
	 6f3skLXRAmoKjF+RwMra3CrYr52RXCJypKJbL1lahhhz+4Du21YfSeD1fp61KFpKOu
	 if/XkwoaFI12psPsw5mzChJjOY9VukpvEGpkwbzcyA29JRGM6srsP6mW8ZdADpccrD
	 K4D0w9xl6LLLBDzDFAhB+eIgVekP938VC7yYDMiyroJPauW7SCZNhyl2ZlEdLmxYY2
	 6SQ2+Keze/CtzaVkS+wO+EHJp1SWdGnArCaQGd3QMY3KeMdkMqp5dmXU3Q2tOUukMy
	 aH2xIE2wsUXlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 4/6] iio: osf: add stream parser
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529121005.1470-5-kimjinseob88@gmail.com>
References: <20260529121005.1470-5-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 13:08:48 +0000
Message-Id: <20260529130848.9822F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `partial_frames` statistic incorrectly increments multiple t=
imes for a single valid frame during normal stream reception.
- [Medium] Frame is fully decoded into a local structure that is subsequent=
ly discarded without being used, causing duplicate CRC and parsing overhead.
--

commit 8eb00bef4725c351a5a3267078dfac541b5f3a1b
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add stream parser

Add the byte stream assembler and resync handling for OSF0 UART frames.

> diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/open=
sensorfusion/osf_stream.c
> new file mode 100644
> index 0000000000000..a2739c987da3f
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
> +		if (discarded) {
> +			stream->stats.bad_magic_resyncs++;
> +			stream->stats.dropped_bytes +=3D discarded;
> +			if (!first_err)
> +				first_err =3D -EPROTO;
> +		}
> +
> +		if (!stream->len)
> +			break;
> +
> +		if (stream->len < OSF_FRAME_HEADER_LEN) {
> +			stream->stats.partial_frames++;

[Severity: Medium]
Since UART receives data in small chunks, will osf_stream_receive_bytes()
repeatedly hit this break condition while accumulating a single valid frame?

It looks like this might inflate partial_frames into a count of receive wait
states rather than actual truncated frames.

> +			break;
> +		}
> +
> +		if (get_unaligned_le16(stream->buf + 6) !=3D
> +		    OSF_FRAME_HEADER_LEN) {
> +			stream->stats.dropped_bytes++;
> +			osf_stream_drop_invalid_head(stream);
> +			if (!first_err)
> +				first_err =3D -EPROTO;
> +			continue;
> +		}
> +
> +		payload_len =3D get_unaligned_le32(stream->buf + 10);
> +		if (payload_len > OSF_STREAM_MAX_PAYLOAD_LEN) {
> +			stream->stats.dropped_bytes++;
> +			osf_stream_drop_invalid_head(stream);
> +			if (!first_err)
> +				first_err =3D -EMSGSIZE;
> +			continue;
> +		}
> +
> +		frame_len =3D OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
> +		if (stream->len < frame_len) {
> +			stream->stats.partial_frames++;

[Severity: Medium]
Similar to the check above, does this increment partial_frames incorrectly
when simply waiting for the rest of the payload and CRC to arrive over UART?

> +			break;
> +		}
> +
> +		ret =3D osf_protocol_decode_frame(stream->buf, frame_len, &frame,
> +						&decoded_len);
> +		if (ret) {
> +			if (ret =3D=3D -EBADMSG)
> +				stream->stats.bad_crc_frames++;
> +			stream->stats.dropped_bytes++;
> +			osf_stream_drop_invalid_head(stream);
> +			if (!first_err)
> +				first_err =3D ret;
> +			continue;
> +		}
> +
> +		if (decoded_len !=3D frame_len) {
> +			stream->stats.dropped_bytes++;
> +			osf_stream_drop_invalid_head(stream);
> +			if (!first_err)
> +				first_err =3D -EMSGSIZE;
> +			continue;
> +		}
> +
> +		ret =3D osf_core_receive_frame(stream->osf, stream->buf, frame_len);

[Severity: Medium]
The frame structure is fully decoded and its CRC calculated by
osf_protocol_decode_frame() above, but then the local frame struct is
discarded.

Does passing stream->buf directly to osf_core_receive_frame() cause the
frame to be decoded and the CRC to be calculated a second time?

> +		if (ret) {
> +			osf_stream_discard(stream, frame_len);
> +			if (!first_err)
> +				first_err =3D ret;
> +			continue;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529121005.1470=
-1-kimjinseob88@gmail.com?part=3D4
