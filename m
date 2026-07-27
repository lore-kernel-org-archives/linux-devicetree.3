Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A96442BC34
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177748; cv=none; b=OtxrGmwqkb11yv8gGt5/Fe0fRgO8oKME/GzAzRb6b1y33HJFE8Ku8nz7PW092Wval49+t5L8F1gFHxFzLzQ9RtKxxutoSajXsalQsvXoBTBwN7g6IrkEa1V4AxL1l+xR/3QqPhrqUpMAfOuhGTxzmxP1jsvQjP3NKaUV9EONcMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177748; c=relaxed/simple;
	bh=BGTM5j27wZFyEH9taNO1scVHbqWOZdICUTBiLjcpBuA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pGhk8Mq6m23RGu73QQJ87Ab+iPEfhCVNf83MsTG1MWN1W0cjojtoFyK6lyyUcPVww421GPIQsBToLWIYN5PSBksgpjdYphsbqqGS+90f7bA4twhdweppToAF2rk/TO2VFLVvIT0JSGy3kqikZ6JKwQ7ZyuU/zmAQjgg+7TJ7zkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mU5WE+tJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mU5WE+tJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC1E1F000E9;
	Mon, 27 Jul 2026 18:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785177747;
	bh=UxK4xORRV06HhpkqE7U4RIeU4bLaGTxyisGk4ChVrAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mU5WE+tJiKcv6Tpr36bImn5Rxhmq0H1+Mw7YteTicqeUFnzP+N1MiEJNSxlyfWV2J
	 riCe8XwdeWdi9daSD96kpXb2vXNacY4RsZD9idDHkJhUR2Wofch1RAvDMvN4k4ZBIz
	 C8RnScZQSjdt3IdsA2laqeAVeSleIrbPsOGDzuQD9uBvKCKR3+1MeIn94s7QUS0Qft
	 uVh57kxUUOVrfdBIK/ukXXKe/NH2Uua4wMHJGgYD+SVh4DF8CHEdAL8r6zVO4i5pq0
	 ebkLnejslPHZ8qYqnHzMwERvOlFuOcHn/+Vc9lIhmHdp6ueyJuQJVK5itRbYDuDcQ1
	 K2g7Uz0MdsnqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: dac: mcp47a1: add support for new device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727-mcp47a1-add-support-v2-2-d4591a2ce69e@gmail.com>
References: <20260727-mcp47a1-add-support-v2-0-d4591a2ce69e@gmail.com>
 <20260727-mcp47a1-add-support-v2-2-d4591a2ce69e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:42:26 +0000
Message-Id: <20260727184226.DFC1E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Potential off-by-one in DAC scale calculation denominator.
--

--- Patch [2]: [PATCH v2 2/2] iio: dac: mcp47a1: add support for new device=
 ---
commit 38bec2fbb020c3f749c52a26e5cc3e78e72eeaf5
Author: Joshua Crofts <joshua.crofts1@gmail.com>

iio: dac: mcp47a1: add support for new device

The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converter
which communicates via I2C.

> diff --git a/drivers/iio/dac/mcp47a1.c b/drivers/iio/dac/mcp47a1.c
> new file mode 100644
> index 0000000000000..140e93ff2ba01
> --- /dev/null
> +++ b/drivers/iio/dac/mcp47a1.c
[ ... ]
> +static int mcp47a1_read(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int *val, int *val2, long mask)
> +{
> +	struct mcp47a1_data *data =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
[ ... ]
> +	case IIO_CHAN_INFO_SCALE:
> +		*val =3D data->vref_mV;
> +		*val2 =3D MCP47A1_MAX_STEP;

[Severity: Medium]
Does this code use the correct denominator for the scale calculation?

Since this is a 6-bit DAC, shouldn't the scale denominator be 64 (2^6)
instead of the maximum step value of 63? Using MCP47A1_MAX_STEP (63) here
introduces an off-by-one error that could cause userspace to calculate
output voltages with a ~1.5% LSB scaling error when reading the sysfs
attribute.

> +
> +		return IIO_VAL_FRACTIONAL;
> +	default:
> +		return -EINVAL;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-mcp47a1-ad=
d-support-v2-0-d4591a2ce69e@gmail.com?part=3D2
