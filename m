Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E954399C4
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786987096; cv=none; b=GtlM2aUdYeBX6j8QqF8Efh74e7SbzV+DDRLQEroL2UIAo4JsvWDNVvI+/n7sVPpCc385W1lcg8n4VprgmH+3tl8p35gV2ul1jHQzcOCYy16Omzt8NOL3MHFLB8OIQV6D824WTTo8OKfVIyEd0Ak4wc+Mujih9gdyPPyoecrDFN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786987096; c=relaxed/simple;
	bh=bE9ADmabbFx5rapVGAlrqlhavCOQPROynDpRd3jTfx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gELbOb8HYbyhVLTXMvE60VfkjQCRRF/k6KKOlH/kxy7mEt21/8rs0Qp2Ax3MitR1raz+9FRAf+cexcFGWwZpPFptP41G/8tom8S8VvKPUerRR+VCAE82U6eqmiafXafV1c6v519E0et1iKSlVZ7UPeFvzm5Wd8S649uwMH8bWnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXKwas5y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXKwas5y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A191F000E9;
	Mon, 17 Aug 2026 17:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786987095;
	bh=HDwPE2bVMyHGtfoXHNU3EKL116Vzly4uFwGHTAoAKJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXKwas5yjRjue6m3j950brG7KzW5dMUcD5ct4CllIV0cI84teBzFpTrJOexV9a8JA
	 M36jExvA0znwAZ6B7C7kadkAWBU7oW/FlXZnaXoNQ4rqU95mGKwip7vckLA3Vd7sw3
	 mwWgvlmiZ0vy0nLWoYgaUhDrixLpuz5aH3i/71LbuVPc8pv5D7NycYVFndLkF/ceIS
	 ESs0NOCx1XKjDQ7Tk776RBdtAp2KjjfYxsrdQOTtc0AQiDW5nKaQqR0jkfP+C1/9/A
	 31STMLBOQJlG1yHIBGDsTD5wBQhXFKftdHPU1aHVY4vyezxvXUfIyK57wRlPJ8c26s
	 xFbSfswmqsFIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/8] iio: light: ltr501: Power down chip if request
 irq fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-liteon-ltr329-v5-4-6f71ab2b0588@geanix.com>
References: <20260817-liteon-ltr329-v5-0-6f71ab2b0588@geanix.com>
 <20260817-liteon-ltr329-v5-4-6f71ab2b0588@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 17:18:14 +0000
Message-Id: <20260817171814.F2A191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver incorrectly uses pointers to local `int` variables for =
`regmap_bulk_read()` and `regmap_bulk_write()` when accessing 16-bit regist=
ers. On big-endian systems, this accesses the most significant bytes, leavi=
ng the least significant bytes uninitialized. This results in returning ker=
nel stack memory to userspace (info leak) or writing invalid zeroes to the =
device.
--

--- Patch [4]: [PATCH v5 4/8] iio: light: ltr501: Power down chip if reques=
t irq fails ---
commit b2aeaca1f2b62b80b38b3ac186edef1f0457ea0a
Author: Esben Haabendal <esben@geanix.com>

iio: light: ltr501: Power down chip if request irq fails

In case devm_request_threaded_irq() failed, we were leaving the chip
powered instead of powering it down again. Power down the chip switching
ALS and PS modes to standby.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 7d045be78c6df..7746d374688fa 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
> @@ -1540,7 +1540,7 @@ static int ltr501_probe(struct i2c_client *client)
>  		if (ret) {
>  			dev_err(&client->dev, "request irq (%d) failed\n",
>  				client->irq);
> -			return ret;
> +			goto powerdown_on_error;
>  		}
>  	} else {
>  		indio_dev->info =3D data->chip_info->info_no_irq;

[Severity: High]
This isn't a bug introduced by this patch, but there are a few pre-existing
endianness issues in this file related to regmap_bulk_read() and
regmap_bulk_write().

In ltr501_trigger_handler():

	if (mask & LTR501_STATUS_PS_RDY) {
		ret =3D regmap_bulk_read(data->regmap, LTR501_PS_DATA,
				       &psdata, 2);
		if (ret < 0)
			goto done;
		scan.channels[j++] =3D psdata & LTR501_PS_DATA_MASK;
	}

Since psdata is an int, regmap_bulk_read() will populate the upper 16 bits =
of
the integer on big-endian systems, leaving the lower 16 bits uninitialized.

Could this cause the bitwise AND to operate on uninitialized stack memory,
which is then pushed to the IIO buffer?

A similar issue appears in ltr501_read_thresh():

		case IIO_EV_DIR_RISING:
			ret =3D regmap_bulk_read(data->regmap,
					       LTR501_ALS_THRESH_UP,
					       &thresh_data, 2);
			if (ret < 0)
				return ret;
			*val =3D thresh_data & LTR501_ALS_THRESH_MASK;

Here, 2 bytes are read into the local int variable thresh_data.

Will this cause the function to return uninitialized stack memory to usersp=
ace
on big-endian architectures?

And in ltr501_write_thresh():

		case IIO_EV_DIR_RISING:
			mutex_lock(&data->lock_als);
			ret =3D regmap_bulk_write(data->regmap,
						LTR501_ALS_THRESH_UP,
						&val, 2);

The val parameter is an int.

Might writing 2 bytes directly from it on a big-endian system send 0x0000
instead of the actual 16-bit threshold values?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-liteon-ltr=
329-v5-0-6f71ab2b0588@geanix.com?part=3D4
