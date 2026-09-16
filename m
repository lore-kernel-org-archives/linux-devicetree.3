Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9324F4EA39D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557965; cv=none; b=Gfp4HYvADfly0XmGVLSHqOP31yH6DAx8ZZcjLXVqZaXkTAuN6RvuTf7oYGO2unXbGs0Xd1fnu8N3tnMjDGG964MJrWLFgxEA/T9pBIvmyKbOnSmTlZfaA47mVSLwtMULf1u6+k4j/M/eX83skxQNn9Ru17XQ7Riq+lPlTJq9TsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557965; c=relaxed/simple;
	bh=AbguamMgPZYv7LsM+vjS44k49DgTIF2mitGYmGY/fmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bYcRPpC/loKRpqBiaGQK8gIHMTOZPO13k27TNnUbgwLl78FQv5y3DuDDTXUc1E6+6Ulg14gbDPC/Ij+kEs6HJvCWWCNzSbfs0DhyiR84WP9+8vMQ4g0v8eQbgL0PgFoG110THJ1BDAdyYiFFbwOmo7bmPqx+I0yRC9oHWiiAwCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5iprS3M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5iprS3M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C591F000FF;
	Wed, 16 Sep 2026 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789557941;
	bh=R1CEThK9wK5CGIoxflqWp7wKCU6FenNoFhP5SsImQOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G5iprS3M5EPsNjCW0wZTtMIx3xAlI7IO1y6pxI1zAy/+cG1tOwgjUXv2foo1em/EE
	 XGGNOAyQGoaZ6HmSw+INwUImiJNP2cfE7Xw09Pc4wxWyak3QZWmfjvuqEmxV4jKRrx
	 3UIAmTL9Zn+WmLnT+C9BMxsYZSvUozfN/vG0uJoLFsX1Q6paFuUwl8Wn76UJf+0JBl
	 Bd8ENy+teYTWz5FtOhwYNnE7VbJF0NgpthzTcXgrkWlPh8EK4JxwM4eK2OwfyRgJz7
	 FUssF70yVfilX5x5KfGF5DYJkUFqrjA8qH4xUlFURBquggXA+UeU/f/rVNa4S1vTvb
	 q9WkvrYprv9JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 04/17] iio: adc: adi-axi-adc: Add support for CRC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916-ad7768-driver-v8-4-27aa24db5225@analog.com>
References: <20260916-ad7768-driver-v8-0-27aa24db5225@analog.com>
 <20260916-ad7768-driver-v8-4-27aa24db5225@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 11:25:41 +0000
Message-Id: <20260916112541.80C591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: adc: adi-axi-adc: missing CRC callbacks for AD485X and AD40=
8X backends
--

commit f224f9607f0c702705dd0b16aa9e1c0051158452
Author: Janani Sunil <janani.sunil@analog.com>

iio: adc: adi-axi-adc: Add support for CRC

This commit adds support for enabling and disabling Cyclic Redundancy Check
(CRC) processing in the AXI ADC backend. CRC provides data integrity
verification for high-speed ADC data streams.

> diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
> index fc7cc92b35f0a..8b7c45d51dbe8 100644
> --- a/drivers/iio/adc/adi-axi-adc.c
> +++ b/drivers/iio/adc/adi-axi-adc.c

[ ... ]

> @@ -644,6 +663,8 @@ static const struct iio_backend_ops adi_axi_adc_ops =
=3D {
>  	.num_lanes_set =3D axi_adc_num_lanes_set,
>  	.debugfs_reg_access =3D iio_backend_debugfs_ptr(axi_adc_reg_access),
>  	.debugfs_print_chan_status =3D iio_backend_debugfs_ptr(axi_adc_debugfs_=
print_chan_status),
> +	.crc_enable =3D axi_adc_crc_enable,
> +	.crc_disable =3D axi_adc_crc_disable,
>  };

[Severity: Medium]
Are these callbacks also needed in the adi_ad485x_ops and adi_ad408x_ops
structures?

The patch adds crc_enable and crc_disable to the generic adi_axi_adc_ops,
but omits them from the variant-specific ops structures like adi_ad485x_ops
and adi_ad408x_ops.=20

Since the CRC enable bit is documented earlier in the patch as common to all
AXI ADC cores, omitting these callbacks might cause iio_backend_crc_enable()
to incorrectly return -EOPNOTSUPP for the AD485X and AD408X variants.

Would it be safer to wire these callbacks up for all backend variants that
share the ADI_AXI_ADC_CNTRL_3_CRC_EN_MASK bit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-ad7768-dri=
ver-v8-0-27aa24db5225@analog.com?part=3D4
