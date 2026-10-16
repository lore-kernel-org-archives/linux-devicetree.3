Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC037D123
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162167; cv=none; b=OEuxIYocGTxrTFAlmHZEQlC/91sZt5SdD1RDVHFYH/FxMJQLmyO5PkHdE5BuJ0F+E46MuJwURNE1BErxVZW7gc3EuUfazLSjg/NZQB58N+5N5LW/QtFdkAJ7CW9WmGy9FgSErrFHek79SSht49MpL8GAn7/Yy8/LyL0OYqLOcmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162167; c=relaxed/simple;
	bh=01wV+ZOrkXLuqYIGKRB7P7P3TN7kx6JicH/NY8Ox3ds=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eFqA+kbD0Jy8SJ0YdNF43MTcwn9yyUYYSkj27FO4W9ZF4GAj5GNdabsuqZLnLITdmyGX8hReZO1mEYW3Ptx0B827pmoLBmeILsefvTrkkw8w/D+9zk/clnmeq6EW9g0FSrj+BO8J77zcdXeU4goLFHULL5Q/0zJmb/01mDhTl7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUE0P6vs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUE0P6vs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27191F000C4;
	Fri, 16 Oct 2026 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162166;
	bh=+O0kuj1YjKx+IYu4WBLRJEl7zzNkKpnl1/vJIfjcYYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EUE0P6vsa5SH3SuYYFRwS51O92Si9kIbK/Eq8kTzqL3fSmpnYcKwZq5Fpzsi36bte
	 v0MP692sN0P6vs1mVt2ewWU0xOktSOv+q+qVP/WfNNw3qCoYypX4YWM1jweYlFt2C6
	 wHWHPstLD00lLE0PFPmEWTTe3zI02hk9j2jAplk49Xq1eQYtmpMuwqK7DjlMq+uQ91
	 Cd4avQvz1Zuh0q8qKv916yY11BBsTF8rDYpT5iD2k7GSmwG9xmLWVz6celHws+3sXN
	 Gad2A/vVVI/I/g9FmtVd2RaJbfgbHpJir5FqQCzqIemaInE7CVLH0JMUPLlHdgJGL5
	 ZD4sRAMqTHB6A==
Message-ID: <sashiko-outbox-174490@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] iio: light: Update DT bindings for GP2AP002
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christoph Rudorff" <chris@rudorff.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-iio-light-gp2ap002-v1-2-7c93312fa8d5@rudorff.com>
References: <20261016-iio-light-gp2ap002-v1-0-7c93312fa8d5@rudorff.com>
 <20261016-iio-light-gp2ap002-v1-2-7c93312fa8d5@rudorff.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:49:25 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: gp2ap002: vled regulator leak in error paths
--

commit 999604192c18f52748ad72ac0d26233473334acf
Author: Christoph Rudorff <chris@rudorff.com>

iio: light: Update DT bindings for GP2AP002

This commit adds the missing vled-supply regulator to the device tree
bindings for the Sharp GP2AP002 sensor.

> diff --git a/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.y=
aml b/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> index 99bddf31cbed2..2b5025043168a 100644
> --- a/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> +++ b/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> @@ -33,6 +33,9 @@ properties:
>    vio-supply:
>      description: VIO power supply a phandle to a regulator
> =20
> +  vled-supply:
> +    description: LED power supply a phandle to a regulator
> +
>    io-channels:
>      maxItems: 1
>      description: ALSOUT ADC channel to read the ambient light

While reviewing this binding addition, I noticed the corresponding driver
code might be missing cleanup for this regulator.

drivers/iio/light/gp2ap002.c:gp2ap002_probe() {
...
	ret =3D regulator_enable(gp2ap002->vled);
	if (ret) {
		dev_err(dev, "failed to enable VLED regulator\n");
		goto out_disable_vio;
	}

	msleep(20);

	/*
	 * Initialize the device and signal to runtime PM that now we are
	 * definitely up and using power.
	 */
	ret =3D gp2ap002_init(gp2ap002);
	if (ret) {
		dev_err(dev, "initialization failed\n");
		goto out_disable_vio;
	}
...
out_disable_vio:
	regulator_disable(gp2ap002->vio);
out_disable_vdd:
	regulator_disable(gp2ap002->vdd);
	return ret;
}

[Severity: Medium]
Does this code leak the vled regulator? If initialization fails, the error =
path
jumps to out_disable_vio, completely skipping the disablement of vled and
leaving it indefinitely enabled.

The same sequence appears during runtime resume:

drivers/iio/light/gp2ap002.c:gp2ap002_runtime_resume() {
...
	ret =3D regulator_enable(gp2ap002->vled);
	if (ret) {
		dev_err(dev, "failed to enable VLED regulator in resume path\n");
		goto out_disable_vio;
	}

	msleep(20);

	ret =3D gp2ap002_init(gp2ap002);
	if (ret) {
		dev_err(dev, "re-initialization failed\n");
		goto out_disable_vio;
	}
...
out_disable_vio:
	regulator_disable(gp2ap002->vio);
out_disable_vdd:
	regulator_disable(gp2ap002->vdd);
	return ret;
}

[Severity: Medium]
Does this code similarly leak the vled regulator during a resume failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-iio-light-=
gp2ap002-v1-0-7c93312fa8d5@rudorff.com?part=3D2
