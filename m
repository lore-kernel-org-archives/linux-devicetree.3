Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B330E82E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 01:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783389097; cv=none; b=I9UyLYJvbMuKydIhogw0M7AuLJanN1u05QHjbHiDdGa7LaD6HiQFMubL+sOd4JvtHrRPm/OCkACwABru7cRuUSVuFBZene1sABSrdKQLVR5XYIxcP3UsnkjAjkqBSH8AAIKE8uPbJXGf+3RgrBJL2SWa2QOjQnmr13gqsvORlaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783389097; c=relaxed/simple;
	bh=0yEbIxwwzi6hYJkQs0yfoOSqgGVhLjWV8482yVB6kKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cwz0FwnalwLiSq7n0yvssgmZmr0rDjLXjjp6yWJCBKiKi8kFvtGnA3tm8qXwJU7xZUcpevPexZwTC6/LBC3Qttn8bOuHZF50A3KFu9Bw9R5sS6yRyizeQBDLpqx7l6BZSGVqzbJbR7Us98qNVLNIiw29KYwuRoqX3EYbMe4CdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpu79lxP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpu79lxP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B06B1F000E9;
	Tue,  7 Jul 2026 01:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783389095;
	bh=WfJuW/t29eUkmosFwOFDIm82uPp5/+DBZ+zsFQ1+Yfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fpu79lxPY+myJXLxCfLoViULuXRxy8y0Fgm7x3Io2QardvAAFG12cFMcpwnvR88fs
	 /8T8Ir5aO/AGZi3B7tyhsp2kVCrKKAUbbNcIacY716SIfd6bA7ydcP6br0m9t3wOP/
	 pQiSW+fXdKyJHQZibmVUA2i2QS4RLmVktSLEm81zMDj5t0EvXbb+bsdn01ps3hYpik
	 aZ4sjkO2yWA59cbJdJh+2smVgEm16WkDIHXEHdes2XirfKv2XvwLvX1R7dOcmS83Yb
	 S2y4KocHN8jaJVvL4LG88RWXD26Nn6h9VQYK1Cz3bNvVeYCrzAKk3OYfJ0sTvN3SDT
	 WE0Hi0bckhCDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/5] iio: osf: add protocol decoding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707014525.1015-4-kimjinseob88@gmail.com>
References: <20260707014525.1015-1-kimjinseob88@gmail.com>
 <20260707014525.1015-4-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 01:51:34 +0000
Message-Id: <20260707015135.1B06B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The protocol major version and header reserved fields are not va=
lidated, contradicting the commit message.
--

--- Patch [3]: [PATCH v7 3/5] iio: osf: add protocol decoding ---
commit 4b68faaa805d7ad7aeb0c1d32700ea5abc7cccf2
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add protocol decoding

This commit adds helpers for decoding Open Sensor Fusion frame headers and
supported message payloads.

> diff --git a/drivers/iio/opensensorfusion/osf_protocol.c b/drivers/iio/op=
ensensorfusion/osf_protocol.c
> new file mode 100644
> index 0000000000000..b5749525e4c43
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_protocol.c

[ ... ]

> +int osf_protocol_decode_frame(const u8 *buf, size_t len,
> +			      struct osf_frame *frame, size_t *frame_len)
> +{
> +	u32 expected_crc;
> +	u32 actual_crc;
> +	u32 payload_len;
> +	size_t total_len;

[ ... ]

> +	if (actual_crc !=3D expected_crc)
> +		return -EBADMSG;
> +
> +	frame->protocol_major =3D buf[4];
> +	frame->protocol_minor =3D buf[5];
> +	frame->message_type =3D get_unaligned_le16(buf + 8);
> +	frame->payload_len =3D payload_len;
> +	frame->sequence =3D get_unaligned_le64(buf + 14);
> +	frame->timestamp_us =3D get_unaligned_le64(buf + 22);
> +	frame->flags =3D get_unaligned_le32(buf + 30);
> +	frame->reserved =3D get_unaligned_le32(buf + 34);

[Severity: Medium]
The commit message states: "The decoder validates the OSF0 wire magic,
protocol major version, header length, payload bounds, reserved fields
and CRC..."

Are the protocol major version and reserved fields actually being validated
here in osf_protocol_decode_frame()?

It looks like buf[4] is being assigned directly to frame->protocol_major
without checking it against OSF_PROTOCOL_MAJOR, and the reserved field is
similarly assigned without verifying if it is zero. Could this lead to
compatibility issues if a future protocol major version reuses the same
magic number but alters field semantics?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707014525.1015=
-1-kimjinseob88@gmail.com?part=3D3
