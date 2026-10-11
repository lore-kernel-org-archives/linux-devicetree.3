Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89414345EBE
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791761380; cv=none; b=kWcyOebd+mRyTlqqLVEZx6du0M9dTsCHh035sQFEYRpCWUBSZNSz0h0S+YJnzI17baqYE2wYdPB74WizIpsPe9hv5rqW19X7GmmhO7We0ROGhpJlRo3y+rRKZvvYZJZjGrjXqMUBMRnruXAmLV03TlG67S8+X+FXFHlGzYSF6lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791761380; c=relaxed/simple;
	bh=taLWNhGO13B0OQMaOXNIRHpZI3mLNqtU+xkZG1Obl8o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TgnHBMPkv0TwDh1KS80lb6BhaxXKI6d+xc67hsSNdUqbejEhHDcGKURPygZaIKMRPRYFZyzY0kEVIxMYIZz9JqOT0f5abBnmDDX1RgHJo+zsj4DKYz1qF3V0jggIgQxsxBOn9uTC8y+zZwUPI5hAM5+tBjYsZDbJzpI9qBJRcb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qq+Y0LP5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qq+Y0LP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28BE1F0089B;
	Sun, 11 Oct 2026 23:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791761379;
	bh=XrVyKqFMfbqFkBcInyvND/K+kn+scQAVO7bGvzkcoLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qq+Y0LP5Xi5h/b/XgobXFGobskV/dy0NzpZbS6PU/qz/E/rwMHcjERZw+V1UraYkW
	 fm9zuk2Cmws4cLWdU8nOTroHfmfaV7D9CHEoNh5VIpmX/Sim5+Eb+Qfz2+HrSEdZs/
	 JJhq4Z1IhdTf7YI0THANW8AWjCyuelI35WH304BDtvn2R6IVH7q2XeTiXExoZC6ma9
	 EYq+SqXwH/31Fu4MkMH+GLvIl6cUrOy6qNxpPe/SLWipdDrznbOBdZW/m2zi24HT/p
	 HNb+M4WvnbKaeXfVMQjptHXDAjgQ5J+CHgLXdomtwpDRIvXn0RKOFoc/XKJV0LlsyV
	 YA5C/I0BD0A6Q==
Message-ID: <sashiko-outbox-167513@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/8] iio: osf: add IIO devices from capability
 reports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011231340.42885-7-kimjinseob88@gmail.com>
References: <20261011231340.42885-1-kimjinseob88@gmail.com>
 <20261011231340.42885-7-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 23:29:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: osf: dropping valid frames and breaking sysfs cache on full k=
fifo
--

commit 615eea31301059211a3c98d8229f156971694125
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add IIO devices from capability reports

This commit registers IIO devices from supported capability descriptors and
exposes RAW, descriptor-derived SCALE, and initialized active-scan buffers.=
 It
validates complete inventories and sample meaning, and faults incompatible
bound sessions.

> diff --git a/drivers/iio/sensorhubs/osf/osf_core.c b/drivers/iio/sensorhu=
bs/osf/osf_core.c
> index b76619335335f..4f73ff5e9572b 100644
> --- a/drivers/iio/sensorhubs/osf/osf_core.c
> +++ b/drivers/iio/sensorhubs/osf/osf_core.c

[ ... ]

> +	/* Serialize publication and cache admission with the session fault. */
> +	guard(mutex)(&osf->latest_lock);
> +	if (osf->session_fault)
> +		return -EPROTO;
> +
> +	ret =3D osf_iio_push_sample(indio_dev, values, sample.channel_count);
> +	if (ret) {
> +		dev_err_ratelimited(osf->dev,
> +				    "failed to push sensor %#x:%u sample: %d\n",
> +				    sample.sensor_type, sample.sensor_index, ret);
> +		return ret;
> +	}
> +
> +	latest =3D osf_core_find_latest_sample(osf, sample.sensor_type,

[Severity: High]
If userspace falls behind reading from the IIO buffer and the kfifo fills u=
p,
osf_iio_push_sample() will return an error (e.g. -EBUSY from the IIO core).

Does returning early here mean we drop the frame completely and skip updati=
ng
the latest_samples cache?

Since a full software ring buffer is a normal timing condition and not a
malformed hardware packet, should this code perhaps ignore the buffer push
error and proceed to update the sysfs cache so direct reads continue to wor=
k?

> +					     sample.sensor_index);
> +	if (!latest) {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011231340.4288=
5-1-kimjinseob88@gmail.com?part=3D6
