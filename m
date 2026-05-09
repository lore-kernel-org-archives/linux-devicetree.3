Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD21A3160
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 01:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778289672; cv=none; b=lid7QSzf1LwhdG6DlJhYWKWNlsWbiLLYgi4RFpDRIVAwCDUaubC5tT+eht7CqlEZRkcmfBboqh1vtgapPEU3RYCy8X2KJURc73H0lOvgK7KxqwDhJ3C9107eDBeRbqs+u2H2qVYmspaTaF1xegmXWKd/PwDnWIqZlqoZsPJIUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778289672; c=relaxed/simple;
	bh=D7OZ42SK4pI9b3Uof8eAwD54MtSUTquzyNJ4PAWCOXs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l8GBB78ZrY71NQs2zaM2Yd0185KFA4tPH5dAxVgrl7prauf2ffdkp6jV3cyRsq9HhpzAjd1J6CiV6gEATPkpvYAIr1K+EcTZZqWFlnAw2bo2a6UxHU65jardI54+HH9r1F2tKjTK8UGpUGKAeRCzoAXU+CfSja/2UhvGlUSYVkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c648u9Ow; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c648u9Ow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56957C2BCB0;
	Sat,  9 May 2026 01:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778289671;
	bh=D7OZ42SK4pI9b3Uof8eAwD54MtSUTquzyNJ4PAWCOXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=c648u9OwhiQD6/+XMA/kMEKMaEljIQij+gyQhFZKat+fqE8vi7ZFHFddaRixZZVqX
	 SOsifv30cC1mJGu9QTMVQJJgERtm1KdAXU70lDvwsvJMOhN+D3gdCGsVfbAb99t3Nm
	 nkBrZnAR8MItI0vop2fDkbKKANEnjNsAg3wTUZVvHZRjqDQ77twcU9JD2RIvdsdyEe
	 rErYy+3zZKJYkD7mDcsuqeCvQf5/AtgiAsTodevqQTZJgROjsduQTfC6o3ESKb+05d
	 /JZ2Q/5nDxrRW+zp3ogI5fJ9chFZ8mXfHNrEfZOnVXo6UOGzra2CyU+iYL2QOki9v8
	 pq+N2lFT7ewdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 10/10] docs: iio: add documentation for ad9910
 driver
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260508-ad9910-iio-driver-v4-10-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-10-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 01:21:10 +0000
Message-Id: <20260509012111.56957C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The parallel port channel ID used in the usage example does not mat=
ch the documented channel hierarchy.
--

commit 734cfe5a204649de75b2933d43b7a6c5df484c59
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

docs: iio: add documentation for ad9910 driver

This commit adds documentation for the AD9910 DDS IIO driver. It describes
the channels, DDS operating modes, attributes, and provides ABI usage
examples.

> diff --git a/Documentation/iio/ad9910.rst b/Documentation/iio/ad9910.rst
> new file mode 100644
> index 0000000000000..7c5dad054d5fa
> --- /dev/null
> +++ b/Documentation/iio/ad9910.rst
[ ... ]
> +  * ``out_altvoltage108``: ``profile[7]``: Single tone control for profi=
le 7:
> +    frequency, phase, amplitude
> +
> +  * ``out_altvoltage110``: ``parallel_port``: Parallel port modulation c=
hannel
> +
> +  * ``out_altvoltage120``: ``digital_ramp_generator``: DRG control: enab=
le
[ ... ]
> +Usage examples
> +^^^^^^^^^^^^^^
> +
> +Set parallel port frequency modulation with a scale of 16 and a 50 MHz
> +offset:
> +
> +.. code-block:: bash
> +
> +  echo 16 > /sys/bus/iio/devices/iio:device0/out_altvoltage113_frequency=
_scale
> +  echo 50000000 > /sys/bus/iio/devices/iio:device0/out_altvoltage113_fre=
quency_offset

This isn't a bug, but the parallel port channel ID used in the usage example
does not match the earlier documented channel hierarchy. The example uses
out_altvoltage113, while the hierarchy section documents the parallel port
channel as out_altvoltage110.

Could the example be updated to use out_altvoltage110 to keep the
documentation consistent?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-ad9910-iio=
-driver-v4-0-d26bfd20ee3d@analog.com?part=3D10
