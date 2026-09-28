Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F0946EC98
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583294; cv=none; b=PbUdQzehgde4NDDbqlotWuj02MbB2Eq7WJKkmWvrnZa/JHsMpnP38RdWTVrE5bIPog9rj5kb5diQ83vw04XNMw4n+TOvgekl1z+V4LiQUdhDrM3glurIzXFmNVQMrbXjaMjFzaHVxu2AEZN51gTqSPcytORvZP4xHQwPQpYimUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583294; c=relaxed/simple;
	bh=PanpZAlIisAxSNyyBizqqgcxrsZqzdMxJ0QoxbRbFQo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DFNmT+NTHQtdsPK2NAiF97sTJUcXOD0nnrAN0ewTS0pDCgtZzBlIfM6hwAtVf7tq+qcMt7CeUnT6CEEfxVR2j2HXpKat6PXrHbDlXFBg9/EeLZ2ocazcE2QKpuEAqSzxCKZodt/sAT2rBxgBhjxGXtF7wIU3jJ39WlND9CJjJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XD79rTLn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XD79rTLn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DC01F000FF;
	Mon, 28 Sep 2026 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790583293;
	bh=0p07U3/WDfnMkQLGTGilceTwXHDFjsDAB2US9bD8jZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XD79rTLnh8DOaIeSifbgcZiVAOHFgwsU2E3CZ6/qpJWZUAivsHQY+3vvvsBAU9LDm
	 PmZQ8eOXuprSZL6fmg+hbzBgcpBCwT67sYNcQb9RFFAbbB4bSN5rpOYsAgD79vSmSz
	 fN0a3wxwdUP+tf4UOd+eflTkPx1eoJ0Mmho+QSn9YbuoCK/tbOxP0zvVEEeYkje0iA
	 1DAuLaq6fCOY5kgBSKjrXm3eWKyvz01kJ5A9JRk8fy6VpXOjjzEL2GLKWwB8LJGGqo
	 zeK156eCrpl5ppmNy17QOo3tFQECFBsj4fSu9H7ch8YmLqb7QL7lqM77/K2f9Jt8IX
	 kW7LTzlSc0x9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: Add Samsung S5KJN5 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260928-sk5jn5-v5-2-19aa0a0a68eb@oss.qualcomm.com>
References: <20260928-sk5jn5-v5-0-19aa0a0a68eb@oss.qualcomm.com>
 <20260928-sk5jn5-v5-2-19aa0a0a68eb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 08:14:52 +0000
Message-Id: <20260928081452.F1DC01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: i2c: s5kjn5: incorrect hardware reset and clock sequencing
--

commit a671bdcf1777ec3f49c4fcba2384ef8b1cb05ef7
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: i2c: Add Samsung S5KJN5 image sensor driver

This commit adds a V4L2 sub-device driver for the Samsung S5KJN5 50 MP 10-b=
it
RAW MIPI CSI-2 image sensor. The driver supports standard controls and expo=
ses
a 4096x3072 streaming mode.

> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
> new file mode 100644
> index 0000000000000..2b925a21f7274
> --- /dev/null
> +++ b/drivers/media/i2c/s5kjn5.c
[ ... ]
> +static int s5kjn5_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct s5kjn5 *s5kjn5 =3D sd_to_s5kjn5(sd);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(s5kjn5_supply_names),
> +				    s5kjn5->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(s5kjn5->reset_gpio, 0);
> +	usleep_range(8000, 10000);
> +
> +	ret =3D clk_prepare_enable(s5kjn5->inclk);

[Severity: Medium]
Does this sequence correctly initialize the hardware? The s5kjn5_power_on()
function de-asserts the hardware reset line before enabling the input clock.

Standard MIPI CSI-2 image sensors typically require the input clock to be
stable and running before the reset line is released, and to remain running
until the sensor is put back into reset. Leaving the sensor out of reset
without a driving clock can cause internal state machines to hang, fail
initialization unpredictably, or draw excessive current.

This might work accidentally on boards where the bootloader or platform lea=
ves
the clock running, but could fail otherwise.

> +	if (ret) {
> +		dev_err(dev, "failed to enable clock: %d\n", ret);
> +		gpiod_set_value_cansleep(s5kjn5->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(s5kjn5_supply_names),
> +				       s5kjn5->supplies);
> +		return ret;
> +	}
> +
> +	usleep_range(10000, 12000);
> +
> +	return 0;
> +}
> +
> +static int s5kjn5_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct s5kjn5 *s5kjn5 =3D sd_to_s5kjn5(sd);
> +
> +	clk_disable_unprepare(s5kjn5->inclk);
> +	gpiod_set_value_cansleep(s5kjn5->reset_gpio, 1);

[Severity: Medium]
Similarly, s5kjn5_power_off() disables the clock before asserting the reset
line. Should the reset line be asserted before the clock is disabled?

> +	regulator_bulk_disable(ARRAY_SIZE(s5kjn5_supply_names),
> +			       s5kjn5->supplies);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-sk5jn5-v5-=
0-19aa0a0a68eb@oss.qualcomm.com?part=3D2
