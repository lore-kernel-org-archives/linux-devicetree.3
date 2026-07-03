Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EFB3C9EE4
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075372; cv=none; b=A26W9c9IxfK/hZwmsqwyMwxgIAuKYrIn9IFZiAA6Sl8NnJZdkRj7llv8Dw7zTCCVvSiSJm2qwGT/iXCLShrd7qTt4TPW1mhA6e5N+M0c9GQpWe7dbmnF0DkKN6Xd2mPloWoqxKCIWmZbob1z7iDzr/mxP6xLKmfOg3JD3swbazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075372; c=relaxed/simple;
	bh=SZBzJTCPDftcYUSRS4ZEOkG6oDwN2TOZpizWuYixoBI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rTwTM2/YaKvrfpuEIfdjLQLfH8buAqnR0gHkA2Mftg3vtzOvaD+SNGuIQgg6Qna1M99PZCcn3QFzpWeonka32kmcntRs1LvfSfw6uZBeJi1zR4BRPbH/0fUPO9m1Zh5zjUWSUv8Fh6LYMYCIDV6hlorWMWCFW3OXRRNa+51/T1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LF61YmWN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LF61YmWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3B31F000E9;
	Fri,  3 Jul 2026 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783075370;
	bh=JNIsbrHcEqmq9krlP/4zHfHdTKaX9MMzhAsMQc00b24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LF61YmWN4BuRuXHlrN0K+y9saiQrWSe3sogvhlyQxf7x8Mb6ya1IF6eOGLeYqePaD
	 g4nZtFfHzxBRMt8iGqyYULbIG9kA2cfOkRqftBtHXmHlE573nQXCDjD+lzz/NFjg8A
	 4yqhxc3RO/+j2RaoONH0VgJ+oGrLnNPVwhs3BASNbrsrWHSTtcE4aq7JZHMqig2zac
	 s1oY5VwCmzR1jkCkNnpJyShR6UxmwKrHmdWQrMB6SesBQJ7bd5KjGObJaPSKCg5484
	 WrTsXZhGD8VyBvmssHCImQyOuSHQ1ITblGWu/b6TpGVlv71WYDuhWMGVg/WWFS8uJB
	 GhKH3lUIUxg1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703102941.1141341-3-stefan.popa@analog.com>
References: <20260703102941.1141341-1-stefan.popa@analog.com>
 <20260703102941.1141341-3-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 10:42:49 +0000
Message-Id: <20260703104250.2B3B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver enables I2C PEC without verifying adapter support and s=
ets the I2C_CLIENT_PEC flag before configuring the device to expect it.
- [Medium] The driver modifies volatile hardware state during initializatio=
n but lacks PM suspend/resume hooks to restore this state, causing device f=
ailure after a suspend cycle.
--

commit 7c1a04214c6c99c028e92e65daff698c598ebaff
Author: Stefan Popa <stefan.popa@analog.com>

iio: adc: add MAX40080 current-sense amplifier driver

The MAX40080 is a bidirectional current-sense amplifier with an
integrated 12-bit ADC and an I2C/SMBus interface. It measures the
voltage across an external shunt resistor and the input bus voltage,
storing the results in an internal FIFO.

> diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> new file mode 100644
> index 0000000000000..441e1ce3dcffd
> --- /dev/null
> +++ b/drivers/iio/adc/max40080.c
> @@ -0,0 +1,587 @@

[ ... ]

> +static int max40080_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct iio_dev *indio_dev;
> +	struct max40080_state *st;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_WORD_DATA |
> +				     I2C_FUNC_SMBUS_I2C_BLOCK |
> +				     I2C_FUNC_SMBUS_QUICK))
> +		return -EOPNOTSUPP;

[Severity: High]
Should this check also verify I2C_FUNC_SMBUS_PEC support?

If the adapter lacks PEC support, it will not send PEC bytes. However, sinc=
e the
driver writes MAX40080_PEC_EN_MSK to the device during initialization, the =
device
will expect a PEC byte on all subsequent transactions and discard any write=
s that
lack it.=20

Won't this render the device unresponsive on adapters without PEC?

> +
> +	client->flags |=3D I2C_CLIENT_PEC;

[Severity: High]
Is it safe to unconditionally set the I2C_CLIENT_PEC flag before the hardwa=
re is
configured to accept PEC bytes?

Since the device powers up with PEC disabled, it expects a standard 2-byte =
SMBus
word write. If the host appends a 3rd PEC byte during the initial configura=
tion
in max40080_init(), won't the device NACK it, causing the initial configura=
tion
to fail and probe to abort?

[ ... ]

> +static struct i2c_driver max40080_driver =3D {
> +	.driver =3D {
> +		.name =3D "max40080",
> +		.of_match_table =3D max40080_of_match,
> +	},
> +	.probe =3D max40080_probe,
> +	.id_table =3D max40080_i2c_ids,
> +};

[Severity: Medium]
Does this driver need PM suspend/resume hooks to restore hardware state?

max40080_init() programs the device into MAX40080_SINGLE_MODE, enables PEC,=
 and
configures the FIFO. If the system enters a sleep state where power to the
sensor is cut, the device resets to its power-on defaults (STANDBY_MODE, PEC
disabled).

Upon resume, any subsequent read would trigger an I2C Quick Command (which =
the
device ignores in STANDBY_MODE) and poll indefinitely for the data valid bi=
t,
resulting in a timeout.=20

Additionally, the software would send PEC bytes which the reset device would
reject.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703102941.1141=
341-1-stefan.popa@analog.com?part=3D2
