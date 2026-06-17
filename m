Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DF83CBE96
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730476; cv=none; b=JsmivswP89osg85CIm/AsvuBXfG+7examq/i3Fh9dLZo4myAs6BQoyON5eY8xJ9XW0fkskfsO9A1ZjPDew9Lbg4/Mga0dtbIizIw5KAn4UVyU8m9BrG+U1dedyqF7Bgbs4Nj99CsWuHRB4B4meet7NKre4+Cr+3GFYPUpf7H1hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730476; c=relaxed/simple;
	bh=XrsQltUzhtkgObU73Q5jXfCEznunukpap83F45G24/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pC+95n8R4GYOlUJx7geEagaeTNG2kx6PuvmPSCbVYu49o0/2tP7kiy9ZnFD4R9/8r8/HtNkbQfikrTEbkeMa/b9opceLCG38CGe500s72EGClwEjzjypZVYJcqNf/XcLJ7E/U7rzmuEZGdVojhHwitRQMVXgwDeMtmeA+L+Oe4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7DvgiFS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7DvgiFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343BC1F000E9;
	Wed, 17 Jun 2026 21:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781730475;
	bh=NJ4lYUCEjyrYDM6pNalyxbaPcJU7Nhew/JNbXv75rXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L7DvgiFSgUGX2Xftiz57cofZPix5/RNI14lm0Cci4gsTF43saufuwG+heJqAxqWAt
	 8Ona47WEEgjsml4KSVm4QR/wQ1qmMBe71bmlS/MVIx6DLs5wpGL84iUbmCIfbzUfL1
	 7MhO1FHxPlewUITMMjw5IS/VrgBwFtA40itdyFwS6+UW0pdMFqOgRtmJPuz/W7gqE7
	 THn3V9si/TWdq96doT1dDx2AxkENyaNccCKFrdGlCyDcTaKWQE5Lategpxy/IiUwJC
	 CdKhMHbIt44wUoyP9t6ZfDnQ4F42Mt6fVqbYE1Pl+28xgXiP4QXtVFwO5YQ/PFLqeU
	 y/Etp1S8oYXDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/5] iio: adc: versal-sysmon: add oversampling
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617180147.3370346-6-salih.erim@amd.com>
References: <20260617180147.3370346-1-salih.erim@amd.com>
 <20260617180147.3370346-6-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 21:07:54 +0000
Message-Id: <20260617210755.343BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Software cache for oversampling ratios is unconditionally initia=
lized to 1, potentially causing desynchronization with the actual hardware =
configuration.
--

commit 81ca0dc5aa386dec0337a8e068370935d45ea78e
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add oversampling support

This commit adds support for reading and writing the oversampling ratio
through the IIO oversampling_ratio attribute. The hardware supports averagi=
ng
2, 4, 8, or 16 samples, plus a ratio of 1 for no averaging.

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index 19a8edd89198c..16f474c1bffae 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> @@ -832,6 +981,8 @@ int devm_versal_sysmon_core_probe(struct device *dev,=
 struct regmap *regmap)
> =20
>  	sysmon =3D iio_priv(indio_dev);
>  	sysmon->regmap =3D regmap;
> +	sysmon->temp_oversampling =3D 1;
> +	sysmon->supply_oversampling =3D 1;

[Severity: Medium]
Could this software cache initialization become desynchronized with the act=
ual
hardware configuration?

The oversampling variables are initialized to 1 unconditionally, without
reading the SYSMON_CONFIG hardware register or actively writing this default
value down to the hardware.

If the bootloader or a previous kernel instance (such as through kexec)=20
configured an oversampling ratio other than 1, will the hardware continue=20
averaging samples while userspace incorrectly reads '1' from the IIO=20
oversampling ratio attribute?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617180147.3370=
346-1-salih.erim@amd.com?part=3D5
