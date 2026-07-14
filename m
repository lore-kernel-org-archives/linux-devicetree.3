Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C42FBE1F
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030209; cv=none; b=TiZpQG9Bj5qcsopxZOzRjxE1mcKtSlDngrnQb+I3Da6xFpdw2vI6lXrF4jJlhEhhgSOzI4qbzSewrefZIL3xsOb3Hif0JDz5i81VTX6R1gc/I0nGz7jQ4+Pox+3+JvEQPsZtKJcyVHfKTEIqi0QCFohICYfCOpwOeOfz8p+yH4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030209; c=relaxed/simple;
	bh=k+8aQBLdAJtv6RN+Bo9nDfaV7RCeFidHUKwlf0dYj/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T8EVwShG8qC67WNrt7MzxzLMNRJdLmmRKRWi7u31Af6M2d7aQZbTykaVr0hZ44zQ816W/uyvcHBzmiDPPwxVEJloV8/wvZ6gXiXJnAPlzJa5OyZ/kEe0RQHr9Ro01UHr+N75Irwl6tIdf7TONdic7qV9pF+5DhoDW30T9n7lzM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbBmtGaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbBmtGaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1F11F000E9;
	Tue, 14 Jul 2026 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784030208;
	bh=A70o6ny6N8xHNETraJzkrlU6hF3vVWkSiOeMJiM96f0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AbBmtGaHgJV7ZRwCVM55j+DJclF5NzhPt4usLqgczbygcIupvtB/cFSAN+l1V5U6B
	 TcGhbiyR8ArI5+EEL6FPKkn4udycQeO52eioq3bXkY4jINtlhF72FL3KkVld4O0rp3
	 KPMMTl96ApJtRJ9iwqN80flpwviBbepGss/z++foQa/57ATeVm6et1RmubceyUQf85
	 nEW2BwSTVS18BmZSgdT3LYRXMZP0GXYDZLM81t8+zNnnTW7I+vKiooFZ1Vz+kRO/fq
	 LcR7sXB0yaLhAaJWyJrWuvVcLEkgFjCFG0iA9BTX9nVmeNqsBorUpRb7YrvrSTilrk
	 WbgeAZA0q7A0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260714092053.2461482-9-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-9-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 11:56:47 +0000
Message-Id: <20260714115648.1C1F11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unprotected shared state modification after exposing the I2C adapt=
er creates a race condition that can overwrite slave registration state and=
 drop IBI data
- [Medium] Mixing goto-based error handling with scope-based guard() cleanup
--

--- Patch [8]: [PATCH v14 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode supp=
ort ---
commit 8afab6d0ec8653574d5df430584d53ab5ca6d8cb
Author: Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: i3c: hub: p3h2x4x: Add SMBus slave mode support

This commit adds SMBus slave mode support for the P3H2x4x hub SMBus target
ports. It sets up the receive path via IBI and forwards payloads to the
registered I2C slave client.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> index b991c46f3ed59..89e94f551b31f 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
[ ... ]
> +void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
> +			 const struct i3c_ibi_payload *payload)
> +{
[ ... ]
> +	for (i =3D 0; i < P3H2X4X_TP_MAX_COUNT; ++i) {
> +		if (!((payload_byte_two >> i) & 0x01))
> +			continue;
> +
> +		if (!p3h2x4x_i3c_hub->tp_bus[i].is_registered) {
> +			dev_dbg(&i3cdev->dev, "IBI for unregistered SMBus port %u\n", i);
> +			regmap_write(p3h2x4x_i3c_hub->regmap,
> +				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> +				     BUF_RECEIVED_FLAG_TF_MASK);
> +			continue;
> +		}

[Severity: High]
Could there be a race condition with synchronous slave binding here?

When the I2C adapter is exposed to the system in p3h2x4x_tp_smbus_algo(),
a slave driver can bind synchronously and invoke p3h2x4x_tp_i2c_reg_slave().
This would enable IBI in hardware and set ibi_en to true.

However, right after i2c_add_adapter() returns, p3h2x4x_tp_smbus_algo()
overwrites ibi_en to false and sets is_registered to true without any locks:

drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:p3h2x4x_tp_smbus_algo() {
    ...
    ret =3D i2c_add_adapter(smbus_adapter);
    if (ret) {
        p3h2x4x_unregister_smbus_adapters(hub);
        return ret;
    }

    hub->tp_bus[tp].is_registered =3D true;
    hub->hub_config.tp_config[tp].ibi_en =3D false;
    ...
}

If an IBI arrives during this tiny window, wouldn't the handler drop the da=
ta
because is_registered is still false? Also, won't the blind overwrite of
ibi_en to false corrupt the newly registered slave's state?

[ ... ]
> +static int p3h2x4x_tp_i2c_reg_slave(struct i2c_client *slave)
> +{
[ ... ]
> +	guard(mutex)(&hub->etx_mutex);
> +
> +	if (!hub->i3cdev || !hub->ibi_ready)
> +		return -EOPNOTSUPP;
> +
> +	if (bus->tp_smbus_client)
> +		return -EBUSY;
> +
> +	mutex_lock(&p3h2x4x->protected_reg_lock);
> +
> +	/* Unlock access to protected registers */
> +	ret =3D regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			   P3H2X4X_REGISTERS_UNLOCK_CODE);
> +	if (ret)
> +		goto out_unlock_mutex;
[ ... ]
> +out_unlock_mutex:
> +	mutex_unlock(&p3h2x4x->protected_reg_lock);
> +
> +	if (!ret) {
> +		bus->tp_smbus_client =3D slave;
> +		hub->hub_config.tp_config[bus->tp_port].ibi_en =3D true;
> +	}
> +
> +	return ret;
> +}

[Severity: Medium]
The cleanup subsystem guidelines suggest avoiding mixing goto-based error
handling with scope-based guard() cleanup in the same function. Could this
mix create confusing ownership semantics here?

> +
> +static int p3h2x4x_tp_i2c_unreg_slave(struct i2c_client *slave)
> +{
[ ... ]
> +	guard(mutex)(&hub->etx_mutex);
> +
> +	if (bus->tp_smbus_client !=3D slave)
> +		return -EINVAL;
> +
> +	bus->tp_smbus_client =3D NULL;
> +	hub->hub_config.tp_config[bus->tp_port].ibi_en =3D false;
> +
> +	mutex_lock(&p3h2x4x->protected_reg_lock);
> +
> +	/* Unlock access to protected registers */
> +	ret =3D regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			   P3H2X4X_REGISTERS_UNLOCK_CODE);
> +	if (ret)
> +		goto out_unlock_mutex;
[ ... ]
> +out_unlock_mutex:
> +	mutex_unlock(&p3h2x4x->protected_reg_lock);
> +	return ret;
> +}

[Severity: Medium]
Similar to the registration function above, does the use of both guard(mute=
x)
and goto out_unlock_mutex in this function violate the cleanup guidelines?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714092053.2461=
482-1-lakshay.piplani@nxp.com?part=3D8
