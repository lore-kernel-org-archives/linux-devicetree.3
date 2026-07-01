Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF77369D6F
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890188; cv=none; b=Ouku2GWhT8XYOAUVHr1u8zR63LAL8A4cBYxb70F0YvLSXo/aoqf1Lmm5bguHUwxUO6m4Qtiz61WlDKi0hcdYnWKTpn0YRDgIbzB+L+qaLQ0786YgFrPd9Ef0CO0IMJ3FQ73Tca0ADHGEzkTqBAwBMJZAZEA7ZdwI3wNXNVKcNCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890188; c=relaxed/simple;
	bh=Q5Mry8b6aIc+v+g6fYfLj9QuYEI1lF4EF2ZLa0CuOqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K4RTHDswx+itpgC54rveTNL3jq0iSATre/3EnBnDIsw4Rids1SZJSlgw+vbVQZwcGHdQFp5QyVnVRnmisNvrfTvYbBhQjrC/SPmxvDciEoANN1tPru1aV7oDiiRD8slhKYAXYqmLNSJz0oCGau3m0TdXTHdYHPAYdYOU0/MASsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJuaUm79; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJuaUm79"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FFB1F000E9;
	Wed,  1 Jul 2026 07:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890181;
	bh=t8lEN/CQ3SSKCD2ZV8UDWfXdk/FdIKSDEkblhguEzPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MJuaUm79h1YWuKZY456wmZ7HKPRTn3TYgf34VGSpPefOxSWYXCRntSFsdXpggIN0v
	 HYlq6/f9IUL84Wil7Qo7m6ncrhHjaXbNgjq8JYPSiJDR7gx0PmxzKB6OuMUK8ZHood
	 /cCzMKP4rH0WBx/BLSCBCfL0BSXFUk3z8zU+NCohs1tL5C77xNv3mjarMU8agXGi70
	 rZjNMzB3+QiAiDEegGsi93ma3ua+YSntioxgBi61BhJhh5c73jD1Dz6WwZ3ju0J8W1
	 Gl4k4cB0ueXM1uI4rex/lIzNyGtBuGnSC1nuZlnGNs9X2GKuJv4iR9m43+D+hu/hlz
	 l63ZqiHkS53QA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 4/7] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260701065755.2067793-5-lakshay.piplani@nxp.com>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 07:16:20 +0000
Message-Id: <20260701071621.43FFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double-unlock and missing error propagation in `p3h2x4x_reg` lock =
guard on `regmap_read()` failure.
--

commit ec428ff479eee2740ff39044d74b67527f18c3e6
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub

The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
functionality. This driver registers the regulators using the MFD
framework and exposes them via the regulator subsystem.

> diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regu=
lator/p3h2840_i3c_hub_regulator.c
> new file mode 100644
> index 0000000000000..781622a6ff467
> --- /dev/null
> +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
[ ... ]
> +static void p3h2x4x_reg_guard_enter(struct regulator_dev *rdev,
> +				    struct p3h2x4x_reg_state *state)
> +{
> +	struct p3h2x4x_regulator_dev *priv =3D rdev_get_drvdata(rdev);
> +
> +	mutex_lock(&priv->lock);
> +	state->restore =3D false;
> +
> +	if (regmap_read(rdev->regmap,
> +			P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			&state->orig)) {
> +		mutex_unlock(&priv->lock);
> +		return;
> +	}

[Severity: High]
If regmap_read() fails here, we unlock the mutex and return.=20

Since this function is used as the lock guard constructor, the caller is not
aware of the failure. Does this allow the caller to proceed and execute the
guarded critical section without holding the lock?

For example, in p3h2x4x_regulator_enable():

	guard(p3h2x4x_reg)(rdev);
	return regulator_enable_regmap(rdev);

Would regulator_enable_regmap() execute concurrently without the lock if the
initialization read fails?

[ ... ]
> +static void p3h2x4x_reg_guard_exit(struct regulator_dev *rdev,
> +				   struct p3h2x4x_reg_state *state)
> +{
> +	struct p3h2x4x_regulator_dev *priv =3D rdev_get_drvdata(rdev);
> +
> +	if (state->restore)
> +		regmap_write(rdev->regmap,
> +			     P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			     state->orig);
> +
> +	mutex_unlock(&priv->lock);
> +}

[Severity: High]
When the lock guard goes out of scope, p3h2x4x_reg_guard_exit() is invoked
unconditionally.=20

If we previously hit the regmap_read() error path in the constructor and
already unlocked the mutex, will this second call to mutex_unlock(&priv->lo=
ck)
cause a double-unlock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701065755.2067=
793-1-lakshay.piplani@nxp.com?part=3D4
