Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55058242D88
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674766; cv=none; b=uNRBdhBNiFG1gUWGzj+FTJ2OwSllr4u618ggY0izpVHE+NkNetjxiBVoIu2wFzSCSiXLHmyCvXLfrFK2xHBvktfoG0qZheMXoVPCWqMlJbQvWM7zMoGA2QDqzhXIgJnsm7DIEcIuZg5WUzCXxg7PlCtg4/fP06SeS8iyYQ9GR4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674766; c=relaxed/simple;
	bh=Rr30RNitn0Qcvz8u+NAHlrfJTEumgm6j4X5yI+zWzmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F4Br/ksZjn6LqpZEhM+0Ank+NI3PFtglyakpEXpID6WUTeBCnRexgjue8hxWviZw+3JvkMVNUbjKEhfHgRvAr/GBrBk8J6jTVdajCXhGvSCxqlX5N7aZtZg+vDjvW1rJvA9ZTt+zXkXM0mI9qQbBOQifmrb072iW1I+Tw56784E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1P+PD00; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1P+PD00"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83AB1F000E9;
	Sun, 28 Jun 2026 19:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782674765;
	bh=oTLdS8oiU10F14K77/6kWTS+1F9BaL67QeEP+ZoQLQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G1P+PD00kqtQCMmV0HJtoFFwfJZfZdu0n0pk/zYVxUoQOZpX1Bno30b3llLAkLl/I
	 5zqL0FZQz9A4ws12hqTuA4gshP5IUji2rVpHGFANGJXyvULd/YxXJVdpf3HwBasm6X
	 W4s4cMTSo3c4XakA/eQRUwPOxkf2eVoRNxOU/p6SNTLD4j6XVwvr5rPMp3it0xU51A
	 fzqe0i4gM/IlN65KRiv+IOFaeM6b9DTxDHv4s7Igv/3QMOhCQRlBgQzOOZLLj7Xs63
	 M+An+7WcCHtdmP9VZou30yPflFnMsJ5lU6hWJ7lOik1LDXyjQP74dIyzssFI61ncQu
	 fXBVq1Vg5qALA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 5/5] iio: osf: add UART IIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260628191337.937-6-kimjinseob88@gmail.com>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
 <20260628191337.937-6-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 19:26:04 +0000
Message-Id: <20260628192604.A83AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Propagating application-level errors corrupts the UART transport s=
tream state machine. In `osf_stream_process()`, if `osf_core_receive_frame(=
)` returns any error, the code assumes the frame length is untrusted, drops=
 only 1 byte, and forces a stream resynchronization. However, `osf_core_rec=
eive_frame()` returns errors for valid, successfully decoded frames under a=
pplication-level failures, such as `-EOPNOTSUPP` for unsupported frame type=
s, or errors from IIO buffer pushes (e.g., in `osf_iio_push_sample()`). Tre=
ating these application-layer errors as framing errors causes the driver to=
 drop the first byte of a perfectly valid frame, destroying the UART parser=
's synchronization and causing it to discard the rest of the frame and pote=
ntially subsequent frames.
--

commit ecab881e8156b9200eed2042dbafce633317b27f
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add UART IIO driver
   =20
Add the Open Sensor Fusion serdev transport, driver core, and IIO
registration path as one complete driver patch.

> diff --git a/drivers/iio/opensensorfusion/osf_core.c b/drivers/iio/opense=
nsorfusion/osf_core.c
> new file mode 100644
> index 0000000000000..207de03dbcdef
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_core.c

[ ... ]

> +int osf_core_receive_frame(struct osf_device *osf, const u8 *buf, size_t=
 len)
> +{
> +	struct osf_frame frame;
> +	size_t frame_len;
> +	int ret;
> +
> +	ret =3D osf_protocol_decode_frame(buf, len, &frame, &frame_len);
> +	if (ret)
> +		return ret;
> +
> +	if (frame_len !=3D len)
> +		return -EMSGSIZE;
> +
> +	switch (frame.message_type) {
> +	case OSF_MSG_SENSOR_SAMPLE:
> +		return osf_core_handle_sensor_sample(osf, &frame);
> +	case OSF_MSG_DEVICE_STATUS:
> +		return osf_core_handle_device_status(osf, &frame);
> +	case OSF_MSG_CAPABILITY_REPORT:
> +		return osf_core_handle_capability_report(osf, &frame);
> +	default:
> +		if (frame.message_type >=3D OSF_RESERVED_MSG_FIRST &&
> +		    frame.message_type <=3D OSF_RESERVED_MSG_LAST)
> +			return 0;
> +		if (frame.message_type >=3D OSF_VENDOR_PRIVATE_FIRST)
> +			return 0;
> +		return -EOPNOTSUPP;

[Severity: High]
Will returning an application-level error like -EOPNOTSUPP here corrupt the
UART transport stream state machine?

If osf_core_receive_frame() returns an error for a validly framed but
unsupported message type, osf_stream_process() appears to treat it as a
framing error:

osf_stream_process() {
    ...
    ret =3D osf_core_receive_frame(stream->osf, stream->buf, frame_len);
    if (ret) {
        ...
        stream->stats.dropped_bytes++;
        osf_stream_drop_invalid_head(stream);
        continue;
    }
}

By dropping 1 byte instead of consuming the full frame_len, the transport
state loses synchronization. This will likely cause the rest of the valid
frame and potentially subsequent frames to be dropped while it attempts to
resynchronize.

Should application-layer failures (like unsupported message types or failing
IIO buffer pushes) be absorbed and return 0 here to ensure the full frame
is consumed?

> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628191337.937-=
1-kimjinseob88@gmail.com?part=3D5
