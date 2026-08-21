Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ACD3769ED
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308613; cv=none; b=eLUbNQiC1rGMvStfCQK4ig51pbze+sPEdoxw37Dq0RkZf0UNScNuGeweFev4n+d0HwZbaDFkbq7n1aeb3cGuLFoRXyXNRRK3QCn6b25EmWdEwXDyPmP7ePAjUY/Glakpu/dkZVVW5tLISrjeaaijkVobQl8n18emXAjnPLVNJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308613; c=relaxed/simple;
	bh=/ys9Jt0rv/db4Rj6xcBenBkhqjrK2oDVnnxynzbI1Bg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mdrGiYiEUGGst9xltRLb+Xovrpv37g0EtWJPFR1RxOVUFp9wXI5N/beIEt88dWma7A/tHRmrOR5dzI5cq9RnB5WCHTqsO41g/xS5I6c6k7qTWsaQDRnFqnjbQeo8eXC7+ABMKgK5/FwtocmynofceUHgWRaBnvp8yAYp361IePQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBFz233W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBFz233W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4671F000E9;
	Fri, 21 Aug 2026 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787308606;
	bh=kXwlBK6i9c15F/7DfhuMy62kR9N1sB4chnmJ2b/t+j0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZBFz233W15to9Zv5bk1mqNQhP9Jib9z4HGMBKftb5SlWZnfsvvhHkwKxBCLaobZ5w
	 duNYfAyCm7xGtBZD8s8Pyb3CW+K0ZSUQMrCYF50pOh9eOePlStdDbmN57E8Ml1HeFz
	 hq/LLlyU/rX6ac1uzLpPrBwgzGs9kf3PS/U7mBYv6BBenVbDXC0g/BSTXKae9N9BI0
	 xmb+XlFi16X+35H1a3QUeXuIk5zxFHPtsBessdI66sHYALl2uhg4bhq7vSqMW4+XWZ
	 it3UMznD0xlCeHrcwb5rCwRX3BvpAgVku9Sh4ixlcBmFFkSWPh35WLs+n3Kx8BDXCu
	 Krp5Sti4ZiUjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] iio: dac: ad5504: remove legacy platform data
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taha Ed-Dafili" <0rayn.dev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821102452.37407-5-0rayn.dev@gmail.com>
References: <20260821102452.37407-1-0rayn.dev@gmail.com>
 <20260821102452.37407-5-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:36:46 +0000
Message-Id: <20260821103646.8A4671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver unconditionally dereferences `spi_get_device_id()` with=
out checking for NULL.
--

--- Patch [4]: [PATCH v5 4/6] iio: dac: ad5504: remove legacy platform data=
 support ---
commit 71e5a82418860f4a272cfaab189a444dee114159
Author: Taha Ed-Dafili <0rayn.dev@gmail.com>

iio: dac: ad5504: remove legacy platform data support

This commit removes the legacy platform data support from the AD5504 driver
since there are no in-tree users. It drops the ad5504_platform_data
structure and updates the probe logic to treat the vcc regulator as
mandatory on non-ACPI systems.

> diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
> index 830b8ea8eaebf..96ab6d456d80e 100644
> --- a/drivers/iio/dac/ad5504.c
> +++ b/drivers/iio/dac/ad5504.c
> @@ -296,16 +294,11 @@ static int ad5504_probe(struct spi_device *spi)
[ ... ]
>  	}
> =20
>  	st->spi =3D spi;
>  	indio_dev->name =3D spi_get_device_id(st->spi)->name;
>  	indio_dev->info =3D &ad5504_info;
>  	if (spi_get_device_id(st->spi)->driver_data =3D=3D ID_AD5501)

[Severity: High]
This is a pre-existing issue, but does this code unconditionally dereference
the return value of spi_get_device_id() in ad5504_probe()?

If a privileged user writes an unmatched device name to the driver's sysfs
bind or driver_override interface, it forces a driver match via
device_match_driver_override(). Because the device's modalias might not be
in the driver's id_table, spi_match_id() would return NULL.

Could this sequence lead to spi_get_device_id() returning NULL and causing
a kernel panic when its name or driver_data fields are accessed here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821102452.3740=
7-1-0rayn.dev@gmail.com?part=3D4
