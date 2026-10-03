Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04D833936F
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 05:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791004378; cv=none; b=FflMT1FXdXAiWBU4yEVO4FKpLQMDoA8plSdvJQQek4AIX0L2n3rIIjMsbiK3elHQFvE24U7B3O1SNmY2lq9erdr+UpTGH5YgrQCmFa/+0ILBGSK/ZlzWxe8Lh0aN/WIP+fsVHm0fdcrCFq+I37+xQypOj+ncAYrh/XCamh6FLq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791004378; c=relaxed/simple;
	bh=i+zsSlGHQ/mhu80dTs0iy+QQknb9G1rEc/7T/qmetGk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fgjdE0V26Sa843IJ0oHEMHIrR/IN6/oUXfvJf0xEy75Q1TgCezQ0NZIl/s2A//m2r5Xz/K+kedHUPnQsV+tSpz0MS58qFyNmxhtV0+OmDoe2kvCJlsxj5Tk98H7IU13+soXBDe0hdJv7/rIEuPr3m6A1xiKYShmfYaAa2GAic9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQVOr75p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQVOr75p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4735C1F000FF;
	Sat,  3 Oct 2026 05:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791004377;
	bh=lIuoW64swvt2cqbpPZoqcAo2d/s1knliaE79WRGiDXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LQVOr75pNVbF9O64f0xRnen9tbTWQ9Q6qcTjJiltNcVBq+C9Cj96oy+HBYogjlYYG
	 Z2nJiaRW43KMU7XqoFU0Oj+nFzYJxyDLu6bY3UdDN+Pu9fALNqVntkNCJb1aGF8/wV
	 Cg6p3A9U6TS323EIryhCXd0ZcplfXXPMBPUpQiPgUUBcDJSIPW2AwD3CIXB0+L0Djr
	 aKVxG8M8YbYYYlkumzUzxI8OfWhvUWXbDoGFJr8qaheUQ+UqgJIVypRfn0SdEKHRUn
	 UNFr+7pA4Akr3qfsKeg4hgwSs9bUpybGE1SIQjtLJJ7f4s4ugtHzf7aHWtYia2/6oy
	 TqIpnYarUdYMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: proximity: Add driver for Vishay VCNL36829
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Yufei" <lyf98405@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261003050453.413700-3-lyf98405@gmail.com>
References: <20261003050453.413700-1-lyf98405@gmail.com>
 <20261003050453.413700-3-lyf98405@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 05:12:56 +0000
Message-Id: <20261003051257.4735C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: proximity: vcnl36829: unnecessary I2C_FUNC_I2C check breaks=
 SMBus compatibility
--

commit 31b66b302335366e3d26270b9301e19d433bfdf7
Author: Liu Yufei <lyf98405@gmail.com>

iio: proximity: Add driver for Vishay VCNL36829

This commit adds an IIO driver for the Vishay VCNL36829 proximity sensor
connected over I2C. At probe, the driver enables supplies, configures the
sensor and VCSEL, and exposes proximity data attributes.

> diff --git a/drivers/iio/proximity/vcnl36829.c b/drivers/iio/proximity/vc=
nl36829.c
> new file mode 100644
> index 0000000000000..c9958a594abe2
> --- /dev/null
> +++ b/drivers/iio/proximity/vcnl36829.c
[ ... ]
> +static int vcnl36829_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct vcnl36829_data *data;
> +	struct iio_dev *indio_dev;
> +	struct regmap *regmap;
> +
> +	int ret;
> +	unsigned int reg;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +		return dev_err_probe(dev, -EOPNOTSUPP,
> +				     "I2C adapter doesn't support plain I2C\n");

[Severity: Medium]
Does this artificially restrict the driver from probing on SMBus-only
controllers?

The devm_regmap_init_i2c() framework natively implements seamless SMBus
fallback for 8-bit register / 16-bit little-endian value devices using
I2C_FUNC_SMBUS_WORD_DATA. By manually enforcing I2C_FUNC_I2C up front,
it looks like the driver defeats this regmap feature and prevents itself
from operating on otherwise compatible SMBus hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003050453.4137=
00-1-lyf98405@gmail.com?part=3D2
