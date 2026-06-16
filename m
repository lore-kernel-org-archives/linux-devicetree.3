Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748C27281D
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595497; cv=none; b=VcqQDk5fFkyInxA5h7auNBtEjN4iWgtzx/s18j4WzuXQg7YAS8TFY7kmrAGicapaU0lOPXscLvYGjW00/CYNdiaF+BSQKtzDaY/MOQhVPrDjHjIQqPRWU9uZ5soMQoQc24r2LwHSIx0eDQF6lfPkLG7EGbYWwubHwZNe/gnPbK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595497; c=relaxed/simple;
	bh=Qi34EzotsVF9ZdkP7oYfDcjGdFkGg4im1hdin4xVHyY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ChdPLywdC2lqANf+K5CyLmMi5HekOnXsWvIqCYnyrAGta+DaqSIhyZgIBHdJjDFkd580GjP1mmMU3kR6GZPF23hLFPnOSW3SeJAApKeAsq3rZY+rQC59xYM/RQH/8IlELiW0gtYBcLiwq+XunX0b1tvhMyS0r7EGH8i317L4LKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khgExE7k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khgExE7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA691F00A3A;
	Tue, 16 Jun 2026 07:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781595495;
	bh=Pqa5Mk7NHdIF02aR21NR2DGdjWIwP2Mj5emrJuyuMks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=khgExE7kTuYrzxEHUc1B2EKEUNDRNpdeOEtFsYgHzuP+8bxB6bLQAcLs1BKaCCrCD
	 vwrC9PPSgO2lur11v9p+SW0cSGENmnLrhOn3IiwsOc1u8FrQU0JoTTJ4cxwID4qJX4
	 sRSIFWqRVJXSppa6VLH3j56xO7cWUhiGCPK+i58g23Eu+AEeYxIaWlJlJAujRtXkg3
	 B7MGvr0TIFbTV75rnUYF1cogWhNgwffW0wUE6KLErwXSJ+0lJ0ItjbeuIIrKeDgZO/
	 Y504FbfFxrhrvd2Ap6kbNVc6ZHAZktbI+WZamWp5HrxLmlJBgMT4U8G9yz86R4wpzg
	 qU8xOWR6mHLiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 4/6] iio: osf: add stream parser
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616072242.3942-5-kimjinseob88@gmail.com>
References: <20260616072242.3942-5-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 07:38:15 +0000
Message-Id: <20260616073815.AAA691F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The stream parser discards up to `frame_len` bytes of unauthentica=
ted data on protocol errors (`-EPROTO`), allowing malformed or random data =
to cause prolonged desynchronization and data loss of up to 4096 bytes of v=
alid frames.
--

commit 9d1c984a937aba83c2b56bd0cda78b4b642ec15a
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add stream parser

Add a byte-stream parser that resynchronizes on OSF frame magic, validates
complete frames, and forwards decoded frames to the OSF core.

> diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/open=
sensorfusion/osf_stream.c
> new file mode 100644
> index 0000000000000..957f737160f42
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_stream.c

[ ... ]

> +static int osf_stream_process(struct osf_stream *stream)
> +{

[ ... ]

> +		ret =3D osf_core_receive_frame(stream->osf, stream->buf, frame_len);
> +		if (ret) {
> +			if (ret =3D=3D -EBADMSG) {
> +				stream->stats.bad_crc_frames++;
> +				stream->stats.dropped_bytes++;
> +				osf_stream_drop_invalid_head(stream);
> +			} else {
> +				osf_stream_discard(stream, frame_len);
> +			}

[Severity: High]
If osf_core_receive_frame() returns a non-CRC error like -EPROTO, is it safe
to discard frame_len bytes here?

It looks like osf_protocol_decode_frame() returns -EPROTO for framing errors
before validating the CRC:

osf_protocol_decode_frame() {
    ...
    major =3D buf[4];
    if (major !=3D OSF_PROTOCOL_MAJOR)
        return -EPROTO;
    ...
}

Because the CRC hasn't been verified yet when this error is returned,
frame_len could be an unauthenticated garbage value if line noise happened =
to
match the magic bytes.

Could this blindly discard up to 4096 bytes of potentially valid frames and
cause prolonged desynchronization, instead of dropping just the invalid head
to quickly resynchronize?

> +			if (!first_err)
> +				first_err =3D ret;
> +			continue;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616072242.3942=
-1-kimjinseob88@gmail.com?part=3D4
