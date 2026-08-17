Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9371C1A6839
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 17:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786987287; cv=none; b=BJjRXdjk+ascXhFT1mLIACoFl9DDK0/Own9MkUrR9jTS2gSaZz8Wodgze9YSirQLA3V8FOWcjxS1zFNyNQc/ITiT6Txj1y8iBiYgVANrJc69IjVF/vcJhoGfYurOaQ3lboneyNB8p7cD0nY9l8LwfSLaLzBYDR1A7IDXpKKvarY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786987287; c=relaxed/simple;
	bh=7G7YBFDfqN1RT8LY3VPTNedhWFtMw99p5CFQi76fwco=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CCAW97uGi62fLe1sI5tt530RwecMJXW5hfhyaKaHKdkbE7W/SemTL7U1oCRJVkiWqq9z2tx+9F/k2fJxM2Oq9UGpXURy38me4EdcoWBKjFV+79w9FhUOkzpTSel8/0HeBf82VOdNGv7fmZgRMx1L/4/rTfv+CW2Gj3JjZK0qBsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vago+MCR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vago+MCR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EE01F000E9;
	Mon, 17 Aug 2026 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786987286;
	bh=R7Lllp4vVJ8fqvHwsgQuPrBPFRIPGg+6oa9PXQzwbYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vago+MCRlggEwf2jcvARLKxdi5CvF191RxYumnH105J2CsgZP4CPXHC4KPLkTcQum
	 bhkqU7fADaDoknZSZFAODvQDPKGngUHOs8GQ1b0/gar1bjyVTHii0DMhSm6o9Yi7hQ
	 HJmSahgUF7vDY5jzOS9f+pRvuOm5BPGBNIpvkO2s+q/g81cX/m0d2qVhrKwWk/9EyQ
	 c88pPKxbXxDCdBU86l03N9QYjFfA1Ofj+w9xfgDUxiB0tklqGf6keYBMxQitCRaRXK
	 eBc7m9ZVbY5B4/1lbSd28jyFV4HRjRaky0OqA4LikUAA06V+eDFoXiD5g4xn24nz4R
	 YlvvJWyOuyyNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/8] iio: light: ltr501: Fix sorting order of device
 arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-liteon-ltr329-v5-7-6f71ab2b0588@geanix.com>
References: <20260817-liteon-ltr329-v5-0-6f71ab2b0588@geanix.com>
 <20260817-liteon-ltr329-v5-7-6f71ab2b0588@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 17:21:25 +0000
Message-Id: <20260817172125.E7EE01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] regmap_bulk_read and regmap_bulk_write are called with pointers to=
 32-bit integers, causing uninitialized memory reads and broken writes on b=
ig-endian architectures.
--

--- Patch [7]: [PATCH v5 7/8] iio: light: ltr501: Fix sorting order of devi=
ce arrays ---
commit f69f1a2e0acaf6c0331bd3c3b614102addd48332
Author: Esben Haabendal <esben@geanix.com>

iio: light: ltr501: Fix sorting order of device arrays

This commit reorders the device array initializations in the ltr501 driver
to use alphanumerical sort order. This helps keep the elements in sync
across different tables and reduces merge conflicts.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 51ab387f24a32..d9b68da2452ba 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but does ltr501_read_thresh() leak uninitiali=
zed
kernel stack memory to userspace on big-endian systems?

drivers/iio/light/ltr501.c:ltr501_read_thresh() {
	...
	int ret, thresh_data;

	switch (chan->type) {
	case IIO_INTENSITY:
		switch (dir) {
		case IIO_EV_DIR_RISING:
			ret =3D regmap_bulk_read(data->regmap,
					       LTR501_ALS_THRESH_UP,
					       &thresh_data, 2);
			if (ret < 0)
				return ret;
			*val =3D thresh_data & LTR501_ALS_THRESH_MASK;
	...
}

Because regmap_bulk_read() reads only 2 bytes into the 32-bit int thresh_da=
ta,
the lower 16 bits remain uninitialized stack garbage on big-endian systems.
Masking with LTR501_ALS_THRESH_MASK then discards the valid device data and
exposes the uninitialized memory to userspace via the IIO sysfs interface.

Similarly, could ltr501_write_thresh() also be writing 0 instead of the tar=
get
threshold on big-endian architectures?

drivers/iio/light/ltr501.c:ltr501_write_thresh() {
	...
		case IIO_EV_DIR_RISING:
			mutex_lock(&data->lock_als);
			ret =3D regmap_bulk_write(data->regmap,
						LTR501_ALS_THRESH_UP,
						&val, 2);
			mutex_unlock(&data->lock_als);
			return ret;
	...
}

Writing 2 bytes from a 32-bit int on big-endian systems writes the top
2 bytes, which are likely 0, rather than the actual threshold value.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-liteon-ltr=
329-v5-0-6f71ab2b0588@geanix.com?part=3D7
