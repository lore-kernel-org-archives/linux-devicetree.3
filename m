Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C643546E5
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389815; cv=none; b=NfoqGXsH5a55pqSE/K7TJAYVzAQEfi0moGPYVoHEQ9IKDv+kQauCjX+QsHK+OQZ1oHcWhZUwh87WB8vmkMDdI3dslKxgcb148mROt4VZfMs09Idi8oURnn1QgjNkrj+mAxyVBaWZvBmOq4JZhKNjjnagTMp2JKNYNv66u4CZE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389815; c=relaxed/simple;
	bh=sR6QARBBoCr1cbu7YoKCwLRJcUmzoU6nHiyGATjDNvA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aYz6Yh3VGwiJLEm0Yy4ouJ9oXToF77yUliHdzTzCPR8xKL7LMllWnArHeJ1GWFX+nMLkvnlPULBacV9HEZa7lfI3/fDmkzdGmkU5gs3K8QVFM3QIotOYF3Dfxn2sXizGd8nAK+AktCEiPFQqrNJ7sz69hsszo/L08dw7B3pK7Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmUSwrsV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmUSwrsV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB221F000E9;
	Sat, 22 Aug 2026 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787389813;
	bh=McoomtCVwdo04oKv46vI7BzzP8aEKF45X/ArPLjHG0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PmUSwrsV1SGhMdqsCSRACgk92tHQdFyIkaLsr08xmxgYJahr3XWcFpfnPyhMN/sZh
	 h8OUmgxt6cZoVIpxLORSNVnHFR4IcRZyBubvvuVUu7K6lj4h61qOtfWFatfNXtzqyF
	 VdaMmlYiZDhEe4vnJv3XioPyF6LZHh/JNaJNF6Jf4l9iWUkMOH02IsagsM4tHnKkGD
	 dY5Ou0meynyoN5XAgyhpafXNBO+cUkJ35WRHpVK5RSPYTr3KUePUfNAwtRy1QxS3MB
	 ykh/RC0XoGwNDFZmTR+vun3txB3ye0QMHNCiUJGd3yY9Dk6yFBtUclCuhKGKI3RUqP
	 v9Dd44lvrcEsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/6] iio: dac: ad5504: support scale via
 output-range-microvolt property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taha Ed-Dafili" <0rayn.dev@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260822085850.17527-7-0rayn.dev@gmail.com>
References: <20260822085850.17527-1-0rayn.dev@gmail.com>
 <20260822085850.17527-7-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 09:10:12 +0000
Message-Id: <20260822091013.6CB221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver ignores the unified 'output-range-microvolt' device p=
roperty for ACPI nodes.
--

--- Patch [6]: [PATCH v6 6/6] iio: dac: ad5504: support scale via output-ra=
nge-microvolt property ---
commit b4531e8367c77df3a5fc929eab7e4b61b58ad05a
Author: Taha Ed-Dafili <0rayn.dev@gmail.com>

iio: dac: ad5504: support scale via output-range-microvolt property

This commit introduces the output-range-microvolt device property to
configure the vref_mv scale directly from firmware. It provides a fallback
to the vcc regulator voltage for older device trees that do not have this
property.

> diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
> index d22bb16e911b9..9ad9d0666e271 100644
> --- a/drivers/iio/dac/ad5504.c
> +++ b/drivers/iio/dac/ad5504.c
> @@ -315,12 +316,30 @@ static int ad5504_probe(struct spi_device *spi)
>  	if (is_acpi_device_node(dev_fwnode(dev))) {
>  		st->vref_mv =3D AD5504_VREF_ACPI_DEFAULT_mV;
>  	} else {
> +		if (device_property_present(dev, "output-range-microvolt")) {

[Severity: Medium]
Does this structure prevent ACPI devices from utilizing the newly added
output-range-microvolt property?

Since the device_property_present() check in ad5504_probe() is located insi=
de
the else block of the is_acpi_device_node() condition, an ACPI platform
specifying this property via _DSD will have it silently ignored. The driver
will instead always use the hardcoded AD5504_VREF_ACPI_DEFAULT_mV value.

Should the firmware-agnostic device property check occur before falling back
to the legacy ACPI-specific default?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822085850.1752=
7-1-0rayn.dev@gmail.com?part=3D6
