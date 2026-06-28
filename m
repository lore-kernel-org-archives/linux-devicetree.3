Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E8242D88
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674777; cv=none; b=udyu+lb1gnR+qVzzjSp4xtKpkV+12aQ7qo6wN8Goiyyrl7dXboZvIOdDwepeO8K/3gT+7RPWwsnarkRnsbTbYG1u+Yf+lwZjrFg56tkJknMYxQWhZp1oQjN9E6fvtzOXthiANj5zDN9B1DDR+AqfAZW2U2Mo27HnFTAJ7HsbOu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674777; c=relaxed/simple;
	bh=L9dmEOAn6Y+Gx6lBNEsB5NVjo0Ctpd17U/4vFHV/c8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xv1qLwglvk/S8dJInYuDVA2AnlwVvYXgB415jSYoMF4smxAkZs6anEO/dSiZ2Li9nAWFyFpmAydtDyTFEmka2Uo+fGxelYkkyJcdoivRRl+NwfXzswSvMOOWXMs95G5yg356FfdUG9V4vlx+HZSfwntt9gTnCdJMSWNjkbS/b3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnU6/VT0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnU6/VT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770311F000E9;
	Sun, 28 Jun 2026 19:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782674775;
	bh=gRQVK36APWshsTu2qbTIe1KxSSh6M6wa/XRv2Fo6TWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PnU6/VT0wz1OtFxsGoDgx2OIMChhRyTrN72rLnUp41PSNja6NykMWMG/kBv216243
	 oogagfc5jSp6V2e2xp8r5gmZ9UiXly/z3W/Z0o7eKfB+lXVYmzlvFI3mwBENAFhHT+
	 T0nfXpINaGjTkwO+U0rsllCay4AcjAR4g5V7RDwdR49GUEcyMzobrG6cw1pRjwzaL9
	 MOOeDe8mWDMJysv66NB6RXrydGO78qn+qPyickYv1C7WmFyxwy0bbsH+f+MhKZowZj
	 hzQVszCKf7WKJB+/bgf04seklz0DfPFeH5CFJPJKB4t0lGPgaek2Uq9NV6Z+yu8rPo
	 zP8FRkUrMCr1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 4/5] iio: osf: add authenticated stream parser
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628191337.937-5-kimjinseob88@gmail.com>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
 <20260628191337.937-5-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 19:26:15 +0000
Message-Id: <20260628192615.770311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Frame Smuggling / Unauthenticated Injection due to dropping only 1=
 byte on application-level error.
- [Low] The `partial_frames` statistic is defined but never updated.
--

commit c420661e9f0f330fb78aaadf3e5695f6b7ee7947
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add authenticated stream parser
   =20
Add a UART byte-stream parser for Open Sensor Fusion frames.
The parser searches for the OSF0 wire magic, keeps partial frames
buffered, checks header length and payload bounds, and passes complete
candidate frames to the core decoder.

> diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/open=
sensorfusion/osf_stream.c
> new file mode 100644
> index 0000000000000..470b4ec1f1370
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_stream.c
> @@ -0,0 +1,189 @@
[ ... ]
> +		frame_len =3D OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
> +		if (stream->len < frame_len)
> +			break;

[Severity: Low]
Does this code miss updating the partial_frames statistic?

When the stream parser encounters a partial frame here and breaks out of the
processing loop, it appears stream->stats.partial_frames is not incremented.
This will leave it reporting 0 in debug outputs.

> +
> +		ret =3D osf_core_receive_frame(stream->osf, stream->buf, frame_len);
> +		if (ret) {
> +			if (ret =3D=3D -EBADMSG)
> +				stream->stats.bad_crc_frames++;
> +
> +			/*
> +			 * Until the decoder accepts the frame, payload_len is
> +			 * untrusted. Drop only the current head and resynchronize.
> +			 */
> +			stream->stats.dropped_bytes++;
> +			osf_stream_drop_invalid_head(stream);

[Severity: High]
Can this lead to an unauthenticated protocol injection if an application-le=
vel
handler rejects a valid frame?

If a legitimate frame has a valid CRC but osf_core_receive_frame() returns =
an
error (like -EPROTO or -EOPNOTSUPP) because the payload is rejected by a
handler, this path drops only the first byte of the outer frame rather than
discarding frame_len bytes.

Could this allow an attacker to embed fake OSF frames within the payload of=
 a
legitimate sensor frame, which would then be parsed as a new frame after the
single-byte drop resynchronizes?

> +			if (!first_err)
> +				first_err =3D ret;
> +			continue;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628191337.937-=
1-kimjinseob88@gmail.com?part=3D4
