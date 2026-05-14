Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16F525B0BB
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778789813; cv=none; b=aAiUPHVkm7Z1Bwdu9smsBsp8mNbvmxqKn5O9FKerCzmj31/W+6f7aUIsRi/C6ksm07rxFTRJyrl6/kORji52r6B6Ac4UbD3gALyQuhqRnx1ldPRT1XAlarRODhT204nb+rQwJ16NYBGm36WHqcWQNMqtW3zqaFfczmWz6gjpQGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778789813; c=relaxed/simple;
	bh=s+rFl6lzNlBK9ot5ZFiqHvGocKIbbnpbTAvkc0JxJYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CPzJpid2hjtohxC25BPj1vBvi1x70nFAUsqSz73jUNyylPiyF5Y5p/Gu7+sj28MoUO3Ur4qZa1F/MQdnZFJYR1u1c8GOFX9F1sKNfhf9/074wHOgCAdaGS9q+xzkfpVZpoIylYXy3lmgfNjPUUubNMm6zZiqLF5AL9Vq1Bur/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0BVIM4a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0BVIM4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCBAC2BCB7;
	Thu, 14 May 2026 20:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778789813;
	bh=s+rFl6lzNlBK9ot5ZFiqHvGocKIbbnpbTAvkc0JxJYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Z0BVIM4a1C/bBlsaOeV5hWIyc4gmf6P2/I1PK0gwGmWs/xHxl4N9zfEBhsF1B/0fd
	 cHnRrxnglAXKFGiKHzyvoIoT4j6hJk8I0FZEgwa3tENT/JxAF4S4t51xQqkenNO5wp
	 oNbQAXxz8QvWNEj4KaVQ6ud6cW9XX5E80BI0rq6qVduuX3kQlltgiBmBlpG4cXKSkB
	 eo4angUZpUN53xiAD83lLALMa2LJM6T86slnurjjOgf0qalrQsejQlpxr5tTKWaU6Z
	 niAsGfkwJpsSyivOMMKwSz/nfFJxswo4ZrN0VVpoYBhe4TNUQi5kWREKTFwjz8n76f
	 jHpWCvp3vfVTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] iio: core: Add IIO_COVERAGE_PERCENT channel type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Stan" <liviu.stan@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514144712.64374-6-liviu.stan@analog.com>
References: <20260514144712.64374-6-liviu.stan@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 20:16:52 +0000
Message-Id: <20260514201652.EBCBAC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Embedding the measurement unit ('percent') directly into the IIO=
 channel type name violates IIO UAPI design principles.
- [Medium] The new channel type `IIO_COVERAGE_PERCENT` was not added to the=
 `event_is_known()` switch statement in `tools/iio/iio_event_monitor.c`, br=
eaking the tool for this channel type.
- [Low] The new ABI documentation specifies an incorrect and outdated Kerne=
lVersion.
--

commit 705b17eefc8a8d4b3eadfd2e4bd4137ac5a8e6eb
Author: Liviu Stan <liviu.stan@analog.com>

iio: core: Add IIO_COVERAGE_PERCENT channel type
   =20
This commit adds a new channel type for sensors that report fractional
coverage as a percentage. The first user is the ADT7604 leak detector,
where the value represents the portion of the sensing element that is
wetted.

> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/=
testing/sysfs-bus-iio
> index 4fc9f6bd42812..73aa5ac4a91a4 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
[ ... ]
> +What:		/sys/bus/iio/devices/iio:deviceX/in_coveragepercentX_raw
> +KernelVersion:	6.15

Is this KernelVersion correct? Given that 6.15 was released in 2025,
shouldn't this reflect the upcoming kernel version for this new interface?

> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Raw (unscaled no offset etc.) coverage reading. Used for sensors
> +		that report fractional coverage as a percentage, such as leak
> +		detectors where the value represents what portion of the sensing
> +		element is wetted. Units after application of scale and offset are
> +		percent.

[ ... ]

> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
> index 22eefd048ba92..4329d28f78b09 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
[ ... ]
> @@ -98,6 +98,7 @@ static const char * const iio_chan_type_name_spec[] =3D=
 {
>  	[IIO_CHROMATICITY] =3D "chromaticity",
>  	[IIO_ATTENTION] =3D "attention",
>  	[IIO_ALTCURRENT] =3D "altcurrent",
> +	[IIO_COVERAGE_PERCENT] =3D "coveragepercent",
>  };

Does embedding the measurement unit into the IIO channel type name conflict
with the IIO UAPI design?

Typically, channel types represent the physical quantity, while the unit
is determined by applying scale and offset to the raw values.

If a future sensor measures coverage using a different scale, such as a
fractional value from 0.0 to 1.0 or parts-per-million, wouldn't the
coveragepercent string become misleading and inflexible?

[ ... ]

> diff --git a/tools/iio/iio_event_monitor.c b/tools/iio/iio_event_monitor.c
> index 03ca33869ce85..1ba0386133839 100644
> --- a/tools/iio/iio_event_monitor.c
> +++ b/tools/iio/iio_event_monitor.c
[ ... ]
> @@ -65,6 +65,7 @@ static const char * const iio_chan_type_name_spec[] =3D=
 {
>  	[IIO_CHROMATICITY] =3D "chromaticity",
>  	[IIO_ATTENTION] =3D "attention",
>  	[IIO_ALTCURRENT] =3D "altcurrent",
> +	[IIO_COVERAGE_PERCENT] =3D "coveragepercent",
>  };

Does this omit an update to the event_is_known() switch statement?

If IIO_COVERAGE_PERCENT is missing from the switch block in event_is_known(=
),
the statement will fall through to the default case and return false.

Would this cause the iio_event_monitor tool to falsely flag events from
this new channel as unknown and fail to parse or print their information?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514144712.6437=
4-1-liviu.stan@analog.com?part=3D5
