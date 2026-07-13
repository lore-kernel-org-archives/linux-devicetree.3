Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8873A2475D0
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945062; cv=none; b=PioW0zB+dRAnWQLIFrU9hbRecl3nYFoZwsstMlLi8JR/AEgeNRjiK09LFnDgognaeYdwPZ95rD4RWJECT1nw9vVnBSIQWnQYhYqLIjGUxPyht9wgzfx5rH6jOjwQFhFMejw7nSPnLfSOXozKXChq/1sXtq7SQrpONQun0GR4ffQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945062; c=relaxed/simple;
	bh=OxWWQ+ynGDOA69hSfPGUvWAdcHnKmXhIWLMifQTZiXs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ct6uOzl+WvQVZcMFwaMTzfPmYea8cPUs3tB4D4saUiaPLKARZE2x0T3S91WsxxegMq9YJWov2+eih8r4yZHa8VLe+yEj/T26UihL71/xxaMu3ULwCbeObT1Cc4xthuTZiUzr9VwRbtsZBtXzC+uO4TRJs+OU1Hdy3Rz6iR7gRjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddp1L5xO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddp1L5xO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CD21F000E9;
	Mon, 13 Jul 2026 12:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783945061;
	bh=mkQHbCMc6SDw2eSjotofN8EK6/m7hBEUL3Uw6zC2+Ow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ddp1L5xOrmb5Eg9ekQHhf3iJXyK46uFFagA2WIg1OytYGE3NzquAYQNkQP4SLvH6K
	 UV9sOslqvSCEUcfFYcAQXcHRGl7C+JRvFxedUQ1WQhHH+n6rSkxBAqIlFITsah51Lb
	 8eAbVPo/Cs+0vwwF/iD0ANvIfosT1zHpIPi+lHOWue7HpgEfbfVqGOYG3n+5d0MEQv
	 aIIxiEpucRkgcFwIMPQm8Y0FA/SNlgRC48YRA50FUCVNbUhb6ohO8ClsPBuJ9T21NH
	 XWlAoKmxiKG0oveclWC3kMXJ7EPWxyFJcjsZwd3BmEHkBs8uiuMKbxkn/P8cnh//U3
	 lTgh15xFRyeew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260713120226.90303-3-stefan.popa@analog.com>
References: <20260703102941.1141341-1-stefan.popa@analog.com>
 <20260713120226.90303-1-stefan.popa@analog.com>
 <20260713120226.90303-3-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 12:17:40 +0000
Message-Id: <20260713121741.02CD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `dev_set_drvdata()` in `max40080_probe()` causes a NULL/ga=
rbage pointer dereference in `max40080_resume()`.
- [Medium] Missing bounds check on hardware register read causes out-of-bou=
nds array access in `max40080_get_oversampling_ratio()`.
--

--- Patch [2]: [PATCH v2 2/2] iio: adc: add MAX40080 current-sense amplifie=
r driver ---
commit 0eea8e710f553ebc05e51c736e312f8a7ed070f6
Author: Stefan Popa <stefan.popa@analog.com>
Subject: iio: adc: add MAX40080 current-sense amplifier driver

This commit adds a direct-mode IIO driver for the MAX40080 bidirectional
current-sense amplifier. It exposes current and voltage channels, handles
selectable input ranges, and features PEC-protected register access.

Link: https://www.analog.com/media/en/technical-documentation/data-sheets/M=
AX40080.pdf

> diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> new file mode 100644
> index 0000000000000..87d2665151eda
> --- /dev/null
> +++ b/drivers/iio/adc/max40080.c

[ ... ]

> +static int max40080_get_oversampling_ratio(struct max40080_state *st, in=
t *val)
> +{
> +	int tmp;
> +	u8 filter;
> +
> +	tmp =3D i2c_smbus_read_word_data(st->client, MAX40080_REG_CFG);
> +	if (tmp < 0)
> +		return tmp;
> +
> +	filter =3D FIELD_GET(MAX40080_CFG_FILTER_MSK, tmp);
> +	*val =3D max40080_oversampling_avail[filter];

[Severity: Medium]
Can filter exceed the bounds of the max40080_oversampling_avail array?

MAX40080_CFG_FILTER_MSK is GENMASK(14, 12), which allows values from 0 to 7.
However, the max40080_oversampling_avail array only has 6 elements.

If the device hardware enters an unexpected state or returns bits 6 or 7,
will this read past the end of the array and potentially leak kernel memory
to userspace?

> +
> +	return 0;
> +}

[ ... ]

> +static int max40080_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct max40080_state *st =3D iio_priv(indio_dev);
> +
> +	/*
> +	 * A suspend may have cut power to the device, resetting it to its
> +	 * power-on defaults. Reprogram it from the cached configuration.
> +	 */
> +	guard(mutex)(&st->lock);

[Severity: High]
Does max40080_probe() need to call dev_set_drvdata() before returning?

If the system suspends and resumes, max40080_resume() calls
dev_get_drvdata(dev) expecting an iio_dev pointer. But since max40080_probe=
()
doesn't set it, will this return the I2C core default (the i2c_client point=
er)
instead?

If so, casting it to struct iio_dev * and calling iio_priv() will return a
garbage pointer for st, causing a crash when the lock is accessed here.

> +
> +	return max40080_init(st);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713120226.9030=
3-1-stefan.popa@analog.com?part=3D2
