Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353ED3A2E2B
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561798; cv=none; b=QF1ZuZwHMXe4nvbqLQLF01Voym2VYTgAKCxi257Q6jRnOa/nH/x78orco9SVwJnglFvmLTyXm1mPQ3qqcVtEMg+ZRkWaE8BQuxqOGKn2+zlcnSfAHkf4rYCpIBKo0sSQyCB/ybKAAWDs+DLpTvhmSHuXywYm/Uz8xslTBBBWr8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561798; c=relaxed/simple;
	bh=LZTDuZVI9wEaFObz5paDwIGcVsYJDg3WW7KCLvRQKlc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t3iDf31o430ExqgxnNRh26lJyUqxHJNgrzpV5kew0Hyy3q3VAUoUuWQfHQwirjImMX+ZCbg1FnbbghHsd99jjHAeiS8P81BiI9fiwI0GrApmjuyXCQlIoAmZj96V/8kkHBc/faI7lsPPsL9ByovqRiK5VOUoAU0OdJz2waLl3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQ1zBTLb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQ1zBTLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14C11F000E9;
	Mon, 24 Aug 2026 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787561796;
	bh=Ym7ZEM2aYrrmN2xSX7P4ADfz1d6rMVA2WYv/CLrcJ54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mQ1zBTLb/KPbVgBSCvlvtuCjmthAunl9UG03fIeuPjTI5fN2P08FdQ0a2QKlTH9aV
	 GoOAlnzt+3J6+KsdQ7XVoeQszggtP/wiwPlYecjt3U5Nz74WsRG0CitseT7ZwWyCbC
	 nNHHPlOnclsvhFHKVv7FNlZmdxXxvGfu+tmUxpwl29+3qgo2xnrSb87EXPgYR4nsga
	 2KeqlKRSrwy2OfrXjTDJ+/fQD2Zb1j+tB8gNyZkyL382eU8ohN8sGeuetS5oiIchyG
	 rR1kdfJfm99e0n3Zob4jL9JMjL90WdAcCySdTh6Z8AuB5nG02SFisMX+irM56+YJCy
	 hoeZ46HpuvGsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-ti-ads112c04-driver-v7-2-6b3c9c87d0e4@gmail.com>
References: <20260824-ti-ads112c04-driver-v7-0-6b3c9c87d0e4@gmail.com>
 <20260824-ti-ads112c04-driver-v7-2-6b3c9c87d0e4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 08:56:36 +0000
Message-Id: <20260824085636.A14C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incomplete device reset sequence on unbind/rebind or warm boot.
- [Medium] Missing reset line assertion on driver teardown creates a backpo=
wering risk.
--

--- Patch [2]: [PATCH v7 2/2] iio: adc: ti-ads112c04: Add support for TI AD=
S112C04 ---
commit 9f7a1feb19e31e75ff62fee357a6a2a6f50b0866
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

iio: adc: ti-ads112c04: Add support for TI ADS112C04

This commit adds IIO driver support for the Texas Instruments ADS112C04
16-bit delta-sigma ADC. It implements single-shot conversions, dynamic
channel parsing, and hardware reset via the reset controller framework.

> diff --git a/drivers/iio/adc/ti-ads112c04.c b/drivers/iio/adc/ti-ads112c0=
4.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c04.c
[ ... ]
> +static int ads112c04_probe(struct i2c_client *client)
> +{
[ ... ]
> +	reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset), "failed to get reset\n");
> +
> +	if (reset) {
> +		/* Datasheet: tw(RSL), the RESET low pulse, is 250ns minimum */
> +		fsleep(1);
> +
> +		ret =3D reset_control_deassert(reset);

[Severity: Medium]
Is it possible for the hardware reset sequence to be skipped entirely on
driver rebind or warm boot?

If the reset controller is present, the software reset in the 'else' block
is skipped. However, if the reset line is already deasserted, calling
reset_control_deassert() without first calling reset_control_assert() (or
using reset_control_reset()) means no reset pulse is actually generated.

This could leave the device with stale register settings from prior
operations (such as continuous conversion mode) when the driver is bound.

> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to deassert reset\n");

[Severity: Medium]
Does the reset line need to be explicitly asserted when the driver unbinds?

The devres framework will automatically disable the AVDD and DVDD regulators
on driver teardown. Because there is no cleanup action registered (e.g., via
devm_add_action_or_reset()) to assert the reset line before the regulators
are turned off, the SoC might continue driving the reset pin high while the
ADC's power supplies are disconnected.

Could this violate absolute maximum ratings and create a backpowering risk
for the ADC?

> +	} else {
> +		ret =3D ads112c04_write_cmd(client, ADS112C04_CMD_RESET);
> +		if (ret < 0)
> +			return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-ti-ads112c=
04-driver-v7-0-6b3c9c87d0e4@gmail.com?part=3D2
