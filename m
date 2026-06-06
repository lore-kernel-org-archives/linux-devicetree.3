Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D847A26AF4
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 05:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780722976; cv=none; b=X68ypMl4zUkR06LqtJJU4snslLOONugbch4KXDdDr2qWbnx+gt7/yT1qr1Ido9iuzECAtpJsNZ0yElnnbusRDXYFQB7MCo55MYSI904r/vfkxLhIZuVA0U9kS3TRDe+IDSf7ylq85tGH+4igJbyDC+yjL9150p2DcP9iQsLZ2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780722976; c=relaxed/simple;
	bh=4tPSnMJVqLYT9TfTPi+lCp0CEMPde0K/cBY0Iwm12oQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fjFly1RRHBM6CnfOCcg+uC6O9mV9EhnOMkXCnj3o3a/ZyHqto8dF/owaAj5VeqOxfMopeMnMet3wdBgxx4pdb4m5zlSWE4FAccS/dVzYMXEEEHWy/uYCYcKgkPcCrRk+UdZtzB9qIB28lImjQyW7xKD4/qQBgAEushKzowaZU2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1be7EkD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1be7EkD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863691F00893;
	Sat,  6 Jun 2026 05:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780722975;
	bh=Wb86LIcW+yhIiS+7sG8Qz8KjwaGsiHYLAC4YUvLIZMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V1be7EkDRyMKntKdr8vZgEj84Dk5Y3Ontbmj43lmnP+LMpeQ1t6AD8I2meaJa55G/
	 oqjNgBuCyxiPHJJp+5I25qk+Xp48EP4XgnfskVR+gX+K3k2KgLMz6YjpSBQZxYLA6U
	 LBfqqN8WtTuQ35SsINTWoeohpYWtAZdkY2R5uDZZ+Jk24JMy56tC9CEl83ALJxP9uu
	 zy8Gq25Tv0+d8CFdufKl9Jbo8fH96s1cJ2n2U/DpE2+Kz0Hu1pEMlnCwfFPx5LLHQo
	 uDT0uEqyz5H+Z4g5K1x2kATJ/2FE7AzS0eEzNUkTOyqmLtbUMpR92j9dXoT6B6rgRZ
	 abMCa7vXIvqKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/14] video: backlight: lm3533_bl: Set initial
 mapping mode from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260606045738.21050-13-clamor95@gmail.com>
References: <20260606045738.21050-13-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 05:16:15 +0000
Message-Id: <20260606051615.863691F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Sysfs show functions `show_linear` and `show_als_en` incorrectly h=
andle the boolean return value of `regmap_test_bits()`, causing them to ret=
urn early without formatting output when the bit is set.
--

commit be155a9e9c191a4d2a13bb2df4a54c1332803f87
Author: Svyatoslav Ryhel <clamor95@gmail.com>

video: backlight: lm3533_bl: Set initial mapping mode from DT
   =20
Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured.

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index 9ad7ea1bbbccb..4f8cde9f290d0 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c

[ ... ]

I noticed a regression in show_linear() and show_als_en() (modified by the
patch 'video: backlight: lm3533_bl: Improve logic of sysfs functions' in
this series) where regmap_test_bits() is called to check if a specific
bit is set:

drivers/video/backlight/lm3533_bl.c:show_als_en() {
	...
	ret =3D regmap_test_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
			       CTRLBANK_AB_BCONF_ALS(ctrlbank));
	if (ret)
		return ret;

	return scnprintf(buf, PAGE_SIZE, "%d\n", ret);
}

[Severity: High]
Does this code handle the boolean return value of regmap_test_bits()
correctly?

Since regmap_test_bits() returns 1 if the bit is set, this error check
triggers when the bit is set and returns 1 directly instead of formatting
the string.

Returning 1 from a sysfs show function signals to the sysfs core that 1 byte
was written to the buffer. Because the sysfs buffer is zero-initialized pri=
or
to the call, doesn't this return a null byte (\0) to userspace instead of t=
he
expected string "1\n"?

The same pattern appears in show_linear():

drivers/video/backlight/lm3533_bl.c:show_linear() {
	...
	ret =3D regmap_test_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
			       CTRLBANK_AB_BCONF_MODE(ctrlbank));
	if (ret)
		return ret;

	return scnprintf(buf, PAGE_SIZE, "%x\n", ret);
}

[Severity: High]
Will this also fail to format the output string and return a null byte to
userspace when the feature is enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606045738.2105=
0-1-clamor95@gmail.com?part=3D12
