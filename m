Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBCC426D32
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434271; cv=none; b=MbLnqne0LA87xl/ym+mlzLGI3scRUMMpRPbju3FDVi4lDVVz/jC0BAK3dbUD/5vujsYinWkVJQ7enb18HdKDVJqubDcI/aDlEUXuiShJshpuXAPPr/Ua89bWGHtScMWGar/cplvO+tHj4DSD7/6uP0BxlHJs5oNhSQHoBVjrnZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434271; c=relaxed/simple;
	bh=6YFhjv7vLYAoBXzQkvmxe77fD3wp3Nf8viS7SYuohOU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gJA+Sj19vwcaUbq1VGjjCnBwQTesEJI3omfB3FHii8LPeffTQe7FOmt49giMlc1MLY4sQCeM9beGgYijyTh8HRb6ncI8kf9TelcXxhZ9iHCtVfM5SEAO+oEWwrwSLSRgMUraHZrM81EtnWHg4acllSFmvW39OQwKT8kuXSYF8Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCgWZAal; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCgWZAal"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C8B1F000E9;
	Tue,  7 Jul 2026 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783434267;
	bh=rRIp9AR0wU+e7TOtRmjPUmCS2deZ8M8R0/yeMVdBN7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TCgWZAaltGRG95IatswSmhnPi+qudUu5pWsGQiT2/U8j2tWWJIQKw+0q7QFDH1kfc
	 LGi4iH3u44BJvWDqGXQhM2/SZ3vDj982j03j1TIn/RliJlH6tPiqW09RpCXvtdNL8Z
	 btlB0gPXzpeWO3HRN0QK7j3azUMogdIiTxJHyAyvpPQa/zeKdiM5xr6N5ysEWp1XLS
	 ebNOoksvserBxWbUHVctTNyWB4O65D41J/o3vaSksXN0yOKA1RSGqWedIpqCzRJq+O
	 Erl8OfL1pmnbXrGh+1fLNsquzubj/OLW3cgS30CdyEUHRKM+AvMTSh/kbp9NeNRlbJ
	 4I6ldZZchzy4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/17] iio: add IIO_FREQUENCY channel type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707-ad9910-iio-driver-v7-4-a4ec30f63700@analog.com>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
 <20260707-ad9910-iio-driver-v7-4-a4ec30f63700@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:24:26 +0000
Message-Id: <20260707142427.62C8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added IIO_FREQUENCY channel type lacks sysfs ABI document=
ation for its standard base attributes (e.g., `in_frequencyY_raw` or `out_f=
requencyY_raw`).
--

--- Patch [4]: [PATCH v7 04/17] iio: add IIO_FREQUENCY channel type ---
commit 7195506587746d2a02e7173a31fe7aaf67096665
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: add IIO_FREQUENCY channel type

This commit adds the IIO_FREQUENCY channel type to the IIO framework to
support Direct Digital Synthesizer (DDS) devices. It updates the channel
type name specifications and event monitoring tools accordingly.

> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
> index bdf3d4c063317..a45277bc5d994 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -99,6 +99,7 @@ static const char * const iio_chan_type_name_spec[] =3D=
 {
>  	[IIO_ATTENTION] =3D "attention",
>  	[IIO_ALTCURRENT] =3D "altcurrent",
>  	[IIO_COVERAGE] =3D "coverage",
> +	[IIO_FREQUENCY] =3D "frequency",
>  };

[Severity: Low]
Does Documentation/ABI/testing/sysfs-bus-iio need to be updated to document
this new channel type?

The IIO_FREQUENCY channel type appears to lack sysfs ABI documentation for =
its
standard base attributes (e.g., in_frequencyY_raw or out_frequencyY_raw),
which leaves the expected base units (e.g., Hz) and precise sysfs naming
conventions undefined.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-ad9910-iio=
-driver-v7-0-a4ec30f63700@analog.com?part=3D4
