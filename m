Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD4C43F0A1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785263204; cv=none; b=D/z5NISBUUzFezaKW0PgmCyys5Evd85RFPjxxgO3zWCkdmsd7m+xmrZ/Cr1wnGsvix4JvoAHxYlef6YnkdxjniZ/UZSoTe41Gw2b97EhqvCajCxpOlBTWuWdGEZtJt95vyjTMh8TdOhOERe+RZZD2vvJKu+bqUHSod1pZsIFzW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785263204; c=relaxed/simple;
	bh=+zIpCFhJ/dV1nJsGybIkWsENTO4PmV3ej9kP0Yx8ejo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KoFzz61CyQYxrm5rNoO6sStmV41Cfs3X7Tg+LEqnkatELo20LYd4q9mBNSyL1Z7qpt83wfDi9TSwPrY0Qu8tuD5AR7d9m9BFK1+gYFoVtSc+p2sJotIsWOxZIf7j5v81gkIhoFGgXwk3V7Ge6pNLZH/1qF6nOhH9HZoepk3l6jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4MLWLWV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4MLWLWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF0E1F00A3A;
	Tue, 28 Jul 2026 18:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785263202;
	bh=oQhkjrnW2lvh2xTNxzYUN/sNUuvdFer3dj8GVdHXoNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i4MLWLWVbcXmMh69kHYHf7eCVoBCOs6xEJIHcZ6vnozFyZt7OE6Hberxhqk9kIs7J
	 NUb78MZSP/mM0dpYTgfs78gTU6urUwyRkzpQhn9SsLh1esfy7dg0W3XdBJ46T4+Rt8
	 /V19zhdbfymMdukw1/XFi4YJIiCEPnjwWdMJJ78aOpKwmRcUtk8OFfIE+iw7ms8v50
	 G3p/hdnad7xvVlMirN9QtUo5ob99FG1P8tC82N0U4M2VmgQoAsC4kjldyn+MDf/4av
	 K4gUlTWSjYq3LMzCDFXaNC1S8pMPKTm93aKF1LoeP7ieKI//v11QPdgmKURkD0cfLg
	 RBrUIC1BbDryQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers
 on NACK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:26:42 +0000
Message-Id: <20260728182642.AFF0E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch adds retry logic for EC NACKs to `qcom_ec_write()` and `=
qcom_ec_read()`, but fails to add equivalent retries for the numerous `i2c_=
smbus_*` calls made throughout the driver, leaving them vulnerable to the e=
xact same failure.
- [High] Race condition during device removal where cooling device callback=
s can execute after debug mode is disabled.
- [Low] Initialized arrays of type `struct i2c_device_id` must use named in=
itializers rather than positional initializers.
--

--- Patch [6]: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transf=
ers on NACK ---
commit 42a41f4860b9d5a24932df8c69069cb7fd89b4d1
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

platform: arm64: qcom-hamoa-ec: Retry I2C transfers on NACK

The patch adds bounded retry logic to qcom_ec_write() and qcom_ec_read()
to handle EC firmware NACKs that occur during busy windows right after
boot or during SCI event bursts.

> The EC firmware NACKs the bus instead of clock-stretching while it is
> busy servicing internal work (e.g. right after boot, when it is also
> emitting a burst of SCI events). A transfer issued in that window fails
> with -ENXIO even though the EC is otherwise healthy.

[Severity: High]
This isn't a bug introduced by this patch, but since the EC NACKs the bus
right after boot and during SCI event bursts, will the un-retried i2c_smbus
calls also fail?

For example, qcom_ec_sci_evt_control() is called directly during probe and
uses i2c_smbus_write_byte_data() without retry logic:

drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_sci_evt_control() {
    ...
    ret =3D i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, enabl=
e ? 1 : 0);
    ...
}

Similarly, qcom_ec_irq() reads events during an SCI burst using
i2c_smbus_read_byte_data():

drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_irq() {
    ...
    val =3D i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
    ...
}

Should these SMBus calls also be updated to retry on NACK?

> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/ar=
m64/qcom-hamoa-ec.c
> index a420a180a1948..122ae27c2b483 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c

[ ... ]

> @@ -281,11 +302,18 @@ static int qcom_ec_read(struct qcom_ec *ec, u8 cmd,=
 const u8 *subcmd,
>  	msgs[1].len   =3D resp_len;
>  	msgs[1].buf   =3D read_buf;
> =20
> -	ret =3D i2c_transfer(client->adapter, msgs, 2);
> -	if (ret !=3D 2) {
> -		ret =3D ret < 0 ? ret : -EIO;
> -		goto out;
> +	for (int i =3D 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
> +		ret =3D i2c_transfer(client->adapter, msgs, 2);
> +		ret =3D ret =3D=3D 2 ? 0 : (ret < 0 ? ret : -EIO);
> +		if (ret !=3D -ENXIO || i =3D=3D EC_I2C_NACK_MAX_ATTEMPTS - 1)
> +			break;
> +
> +		dev_dbg(&client->dev,
> +			"EC busy (NACK), retrying read of cmd 0x%02x\n", cmd);
> +		msleep(EC_I2C_NACK_RETRY_DELAY_MS);
>  	}
> +	if (ret)
> +		goto out;
> =20
>  	if (read_buf[0] =3D=3D 0 || read_buf[0] =3D=3D 0xff) {
>  		ret =3D -EOPNOTSUPP;

[Severity: High]
This is a pre-existing issue, but does the cooling device teardown have a
race condition that could leave the fan stuck in debug (manual PWM) mode?

In qcom_ec_remove(), the driver turns off debug mode:

drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_remove() {
    ...
    qcom_ec_fan_debug_mode_off(ec_cdev);
    ...
}

However, since the thermal cooling device is managed by devres, it remains
registered until after remove() completes. Can the thermal core invoke
qcom_ec_fan_set_cur_state() during this window, which re-enables debug mode?

drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_fan_set_cur_state() {
    ...
    ret =3D qcom_ec_fan_write_pwm(ec_cdev, state);
    ...
}

[Severity: Low]
This is a pre-existing issue, but does qcom_ec_i2c_id_table violate the I2C
subsystem API guidelines by using positional initializers?

drivers/platform/arm64/qcom-hamoa-ec.c:
static const struct i2c_device_id qcom_ec_i2c_id_table[] =3D {
	{ "qcom-hamoa-ec", },
	{}
};

The subsystem guidelines state that initialized arrays of type
struct i2c_device_id must use named initializers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-ec_add_mor=
e_commands-v1-0-771abd65ee1a@oss.qualcomm.com?part=3D6
