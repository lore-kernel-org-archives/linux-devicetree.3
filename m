Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463BD3EDAC1
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739151; cv=none; b=A3yjjM1B+jc6GrlKGBc9z8G7L34NrKPuD9bm4PouNJSMultYmsVNCgIfvcMgaUl4XDL8ePrg1DoBqKsT0TX5zU2KZPtQqPjZg4eG0QHrGlmOlctuQicogd+QdYsrD42GO0trir/SJHIB71n+gBZjDti6NF/uwUJtH9hI9HCp+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739151; c=relaxed/simple;
	bh=K+MyjNCcnwvZN4KmanqAo5+DTdsqcpEiqREqOUW4hLY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ML/Q7a86SH2o43rlS3jz3Pv/Lccvb8O+yvWKiJwTxKf0rKErZXRO6evl8voPWW9LU6Q7ZsuoHEdC7seQMyzx0kseg48L5S69hUZY0nR6fWyPABO08mEy/9QlMdhlXVCoU06Q7Vgj/0NGkSQGh8+EoWc0o7lrzOU7z1gsmmSnOsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UetiWuWK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UetiWuWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FEC1F00A3A;
	Wed, 22 Jul 2026 16:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784739148;
	bh=439jY9zy2N/WIjyHfAt8DK3NNeJ3Q1NARW9oSamHhr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UetiWuWKmFsiYxF8Adr+tczJa5hrpT+EphiYmj2KzDbNsE3K7IMZauB/ZOBye1Rmg
	 hNRIJ2KDsSH/DkmOlNaf87aGDZnbOLB1EoHoJlZiSalGGK9tK7HCk+TjKKeQb2UugW
	 usMxNa+t+dFMmPXfOlIQILSw7g+1S+SpEm4q871tjidMZiJhzvoFyD0qV+j0DqkB7a
	 UxYDAq2q0VnoYoo/7PJygi7HhzB8sLHv+QkRdyNQvdzJOfpDnysRFpD7wPh/8ShrP0
	 9LutKaQCfwFcQSv47VotfWcl5S2ao+788//0a3TLPHMZHz4xuNE4igMVeBdcbFzhd5
	 CnPzghkkGABwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 15/17] iio: frequency: ad9910: show channel priority
 in debugfs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-ad9910-iio-driver-v9-15-459d1df5ac56@analog.com>
References: <20260722-ad9910-iio-driver-v9-0-459d1df5ac56@analog.com>
 <20260722-ad9910-iio-driver-v9-15-459d1df5ac56@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:52:27 +0000
Message-Id: <20260722165227.F0FEC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Lockless access to `indio_dev->active_scan_mask` in debugfs call=
backs leads to a Time-of-Check to Time-of-Use (TOCTOU) Use-After-Free or NU=
LL pointer dereference.
--

--- Patch [15]: [PATCH v9 15/17] iio: frequency: ad9910: show channel prior=
ity in debugfs ---
commit fd59307766b0ba216861518edba7f7cf6e5c6e92
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: show channel priority in debugfs

This commit exposes frequency, phase, and amplitude source attributes in
debugfs for the AD9910 driver. These attributes indicate which channel
is sourcing specific DDS parameters based on the device's priority table.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 49a70909bf5fe..32bd1e6cf14f7 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c

[ ... ]

> +static inline const char *ad9910_frequency_source_get(struct iio_dev *in=
dio_dev)
> +{
> +	struct ad9910_state *st =3D iio_priv(indio_dev);
> +	bool ram_en, mode_en;
> +
> +	guard(mutex)(&st->lock);
> +

[ ... ]

> +	/* Parallel data port enabled and data destination is frequency */
> +	mode_en =3D FIELD_GET(AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> +			    st->reg[AD9910_REG_CFR2].val32);
> +	if (mode_en && indio_dev->active_scan_mask &&
> +	    test_bit(AD9910_SCAN_IDX_FREQ, indio_dev->active_scan_mask))
                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: Medium]
Is it safe to access indio_dev->active_scan_mask here without holding the
IIO core mlock?

If another thread concurrently disables buffers, could the mask be freed and
set to NULL between the if check and test_bit(), leading to a NULL pointer
dereference?

While this appears to be a latent regression since the driver currently only
sets INDIO_DIRECT_MODE, could this cause crashes if buffer support is added=
 in
the future?

> +		return ad9910_channel_str[AD9910_CHAN_IDX_PARALLEL_FREQ];

[ ... ]

> +static inline const char *ad9910_phase_source_get(struct iio_dev *indio_=
dev)
> +{
> +	struct ad9910_state *st =3D iio_priv(indio_dev);
> +	bool ram_en, mode_en;
> +	u32 destination;
> +
> +	guard(mutex)(&st->lock);
> +

[ ... ]

> +	/* Parallel data port enabled and data destination is phase */
> +	mode_en =3D FIELD_GET(AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> +			    st->reg[AD9910_REG_CFR2].val32);
> +	if (mode_en && indio_dev->active_scan_mask) {
> +		if (test_bit(AD9910_SCAN_IDX_PHASE, indio_dev->active_scan_mask))
                                                    ^^^^^^^^^^^^^^^^^^^^^^^=
^^^^
[Severity: Medium]
Could this also be affected by the same lockless access issue with
indio_dev->active_scan_mask mentioned above?

> +			return ad9910_channel_str[AD9910_CHAN_IDX_PARALLEL_PHASE];
> +		if (test_bit(AD9910_SCAN_IDX_POLAR_PHASE, indio_dev->active_scan_mask))
> +			return ad9910_channel_str[AD9910_CHAN_IDX_PARALLEL_POLAR_PHASE];
> +	}

[ ... ]

> +static inline const char *ad9910_amplitude_source_get(struct iio_dev *in=
dio_dev)
> +{
> +	struct ad9910_state *st =3D iio_priv(indio_dev);
> +	bool ram_en, mode_en;
> +	u32 destination;
> +
> +	guard(mutex)(&st->lock);
> +

[ ... ]

> +	/* Parallel data port enabled and data destination is amplitude */
> +	mode_en =3D FIELD_GET(AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> +			    st->reg[AD9910_REG_CFR2].val32);
> +	if (mode_en && indio_dev->active_scan_mask) {
> +		if (test_bit(AD9910_SCAN_IDX_AMP, indio_dev->active_scan_mask))
                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^=
^^
[Severity: Medium]
Does this also have the same lockless access issue with
indio_dev->active_scan_mask?

> +			return ad9910_channel_str[AD9910_CHAN_IDX_PARALLEL_AMP];
> +		if (test_bit(AD9910_SCAN_IDX_POLAR_AMP, indio_dev->active_scan_mask))
> +			return ad9910_channel_str[AD9910_CHAN_IDX_PARALLEL_POLAR_AMP];
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-ad9910-iio=
-driver-v9-0-459d1df5ac56@analog.com?part=3D15
