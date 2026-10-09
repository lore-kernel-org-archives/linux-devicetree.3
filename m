Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8527EA59
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 03:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515275; cv=none; b=G0Tat9VB11Z9b+9hTXFS3v8N3CJ4urfpoO35hRH6cQhCmK0wliTRgTAxNJCwK+A7ire4wgdzo0uF9W0YNJmo2rftEME+NhKlFVgqwqVYMOEYW9fxt/u5vo1cWoqrotZkHA5p/knr2DF6V0AT+GC/57hElcDSy7r/T8+Ow4v6ENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515275; c=relaxed/simple;
	bh=KlXOGi59fgxkXRexQSFGEhpu2j1VWBgJZRIUOM5tkOs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=m+cqlImBOQLXmen8PnkItGkzmAPL6ZcBkndXPKLSLQGHdsinBvwPJTjpqqPY54EzsVAEz3PPo8Ow2vn/29TH1u6hUL9RnUsLlF5vllD8vqWHDVNzVUAbw6pyYfMIy+GlxkRk6ZDSnhcNtOnVhUys0S2taL7mmDbqc3Fo7vCb/Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvIAffTF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvIAffTF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB65D1F000FF;
	Fri,  9 Oct 2026 03:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791515274;
	bh=f7bINOkd2S8gzWkCLcMkzOBsMmujigpgHLqJ7qhaZZo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JvIAffTFBeLiPHK+xBTEE6onAKpkGiUxJ+uygW6YMD+fDDX2H9NkX5SmMQnTl2C+i
	 oUYFj1nAofWsm90XAhv1zkGQMte4v9+4KVfquUaSJqR06iPhrJo/Z8sGO4FpZJzi8l
	 Ih/9npIznNJg3PW7jbtVAkpHU4Daan/cUpj0uUnPdMvKQ/znmok5I7MdDMh1dzsmha
	 6EZpovgOyPTlZIE4ATr9NoJMjdCAdMifbR8Z2dxUI+u3VoYKmbayY1t6ki0caAOodt
	 13M9Bno+sFqw0pPYpux4ZNsp8lIiOWjVGTTwXhbP87lCPn6pR7vhfb7x9iffQHIlwN
	 e9nchM3Kv9ykQ==
Message-ID: <sashiko-outbox-164748@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/8] thermal/drivers/loongson2: Add Loongson-2K0300
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <93002842dcf01ec651a9711075f5967026b95987.1791512067.git.zhoubinbin@loongson.cn>
References: <cover.1791512067.git.zhoubinbin@loongson.cn>
 <93002842dcf01ec651a9711075f5967026b95987.1791512067.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:07:53 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] thermal: loongson2: missing delay before reading ADC after initi=
alization
--

commit 97ab3025b749644e2a07310bc78907ed2d3b519c
Author: Binbin Zhou <zhoubinbin@loongson.cn>
Subject: thermal/drivers/loongson2: Add Loongson-2K0300 support

This commit adds support for the Loongson-2K0300 thermal sensor, configuring
it with calibration data read from the syscon CHIP ID registers. It also
introduces a fallback mechanism to use an old fuse formula if the initial
calibrated temperature reading is outside of a valid range.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index dbfb03aa08338..1db61509dbf37 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
[ ... ]
> @@ -83,6 +118,101 @@ static int loongson2_thermal_set_trips(struct therma=
l_zone_device *tz, int low,
[ ... ]
> +static int ls2k0300_thermal_hw_init(struct platform_device *pdev,
> +				    struct loongson2_thermal_data *data)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	data->regmap_cfg =3D syscon_regmap_lookup_by_phandle(dev->of_node, "loo=
ngson,chipid");
> +	if (IS_ERR(data->regmap_cfg))
> +		return PTR_ERR(data->regmap_cfg);
> +
> +	ret =3D ls2k0300_thermal_read_calib(data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read calibration data");
> +
> +	writel(LS2K0300_THSENS_INIT_MASK, data->ctrl_reg + LS2K0300_THSENS_CFG_=
REG);
> +
> +	ls2k0300_thermal_detect_old_fuse(dev, data);

[Severity: Medium]
Will this immediate ADC read return uninitialized or stale data?

The sensor is initialized by writing LS2K0300_THSENS_INIT_MASK, and on the
very next instruction ls2k0300_thermal_detect_old_fuse() reads the ADC
output without polling a readiness bit or applying a small delay.

If the hardware requires conversion latency, reading a 0 or stale value here
would produce a deeply negative temperature that spuriously satisfies the
temp < LOONGSON2_LOWEST_VALID_TEMP condition. Does this risk incorrectly
discarding valid calibration data and permanently enabling the uncalibrated
fallback logic for the boot session?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791512067.gi=
t.zhoubinbin@loongson.cn?part=3D8
