Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6024D372071
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 05:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788760290; cv=none; b=DZYh8FQyDtD5+oj1ZzBauvSd4BQmDeuY0ZIb9+gJQBxdwMf3PrQ0YnkKGdHMYnymaRElzXddvd4QHRcgcJ40rrDaJjWWfO6s2/hFsBPBpDZpeMgdjB36ePWKFxWHwgwXI5t1YeOWw9tpP/Sw8t16YNmbKTtqaJ2TdDvlhnmhHTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788760290; c=relaxed/simple;
	bh=RFkY56bB0iz5bdGpmz835JecdqcDJ5JwgwFiStT4eCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gc0N/dygY4o1rMNVLPLhDasSEmcXU1Laywp+/OHbCMcw427I48CXEeXy53j98J9bveZwuujqNESnus16azkGdbBplZFxArZvOZOhjMl7wL6Aal0x6TAPc4+hVfNEWOsiDWuIjOdf6DPCFQ8sZsI85kDWKLu3cF3dITi+/srvaK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0/9Wj+q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0/9Wj+q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010E71F00A3A;
	Mon,  7 Sep 2026 05:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788760289;
	bh=7a43IoAxzSCi/F870wJy3J6QT8dts89B5dxOa68wUa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i0/9Wj+qQ9SKiYijKCQJP9Sk+f5Fs+X2lfph4+TlDMC6LHWcgj9uxvd/oOwnB9OZB
	 JtkQT+efME5JuHTnRZAVF5EoCfLd+G6OFIGxuJPKiUWDu3ZNUFQ7p6T9dWyqbEkBFZ
	 xsKvPpLjuydXQXEnXH139Jf1X8c0zCnD8lO7ptr5Rsr5gbkRqVOUkwC0tqsSsxtM3z
	 baYLtOIEGs7K0EyRTXKrQPsE7jOret6qHOu9dOP9FFQdgy2H4Yagscjs3cH8t2WhGs
	 lGSBwiRmtUnKycl0HLVQzTiQI/A/xAQOtOfkZwF+RN+qWWzWF0AbMYRMTfzX/SKU/d
	 ImKVIHrTvdxNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shashank Maurya" <shashank.maurya@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 05:51:28 +0000
Message-Id: <20260907055129.010E71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The 'vcc' regulator is enabled via regulator_enable() but never di=
sabled on probe error paths or device unbind, leading to an unbalanced enab=
le count and a kernel WARN_ON.
--

commit 8a9dbdb2e982cccc3d4ff2c75ec2e1c0cd6c0e7e
Author: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

regulator: rpi-panel-v2: Add required vcc-supply support

This commit adds external power rail support to the Raspberry Pi 7"
touchscreen panel V2 MCU. It obtains the vcc supply and enables it at the
start of the probe function.

> diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulat=
or/rpi-panel-v2-regulator.c
> index 30b78aa75ee38..e54d675962e71 100644
> --- a/drivers/regulator/rpi-panel-v2-regulator.c
> +++ b/drivers/regulator/rpi-panel-v2-regulator.c
[ ... ]
> @@ -66,10 +67,21 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *=
i2c)
>  		.parent		=3D &i2c->dev,
>  		.reg_set_base	=3D REG_POWERON,
>  	};
> +	struct regulator *vcc;
>  	struct regmap *regmap;
>  	struct pwm_chip *pc;
>  	int ret;
> =20
> +	vcc =3D devm_regulator_get(&i2c->dev, "vcc");
> +	if (IS_ERR(vcc))
> +		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
> +				     "Failed to get vcc supply\n");
> +
> +	ret =3D regulator_enable(vcc);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret,
> +				     "Failed to enable vcc supply\n");
> +

[Severity: High]
Does this leave the regulator enabled indefinitely if probe later fails,
or upon device unbind? The regulator is enabled manually via
regulator_enable(), but it is never disabled in the subsequent error paths
or device unbind sequences.=20

When the devres framework later releases the regulator during cleanup, it
will detect an unbalanced enable count and trigger a kernel WARN_ON in
_regulator_put(), leaving the physical regulator on.

Would it be better to use devm_regulator_get_enable() instead so that
the disablement is handled automatically?

>  	pc =3D devm_pwmchip_alloc(&i2c->dev, 1, 0);
>  	if (IS_ERR(pc))
>  		return PTR_ERR(pc);

[Severity: High]
If devm_pwmchip_alloc() fails here, does it leak the enabled regulator?
The function returns directly, bypassing any cleanup of the vcc supply
that was just successfully enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-rpi_reg-v2=
-0-0c59aa60d31f@oss.qualcomm.com?part=3D2
