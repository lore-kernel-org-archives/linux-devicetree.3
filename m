Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48B93148D2
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073243; cv=none; b=OXt8wHqydJPBE+617RcVZtETNjnvyhLbHkzIcaSw7eWIejWNkGGB5JdYSqdTnvo2cY0yLChqFBfES5AzErutoByl2YgJBjYUa5M9VyT5h++D7ImGBVMztFFelTxJJklpmGGz3VDmLd36DcxErCDBB6pyB2UGNzT6CTcL3E3R/oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073243; c=relaxed/simple;
	bh=n+613qr3rnBRzjVYDLSlm3G3tZF7QgTh33qpW2pZDjE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CbxI3AdMc8onC11LtEHd1Es4Xw1DVFpSQaxxM7vL5wIVGthfn3sjZ8q+FdLKfYM4wdoks8JuicS0ySo3kbIDr3ViJWMrfv+c//OsxB+0p59vJup8268wCfZ/ze4JelrU4terwuULZ4PuIGZvjl8Pp5YqK7ugRrHHYMbSZRgeHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZ0DpScP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZ0DpScP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFF41F000E9;
	Fri,  3 Jul 2026 10:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783073242;
	bh=VjD6XcueyyWfqRSyFpPA74oYc06aN7sTkwuPbmHbuOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NZ0DpScPD/U9yPMqdDjx3wxuRuxYWkT2raTmjr5DQTggVQV+S5B9KoJ7dlkdqS714
	 OQklNc3NHDdZ2SyLvvywYxXw7TCCyiZC0tpL7dVKtivsjJeXTp3zA2af2EZ5YbimZu
	 YCWhPP/jRVIpz++kHHHM/Qvz6oDBZJr8LBEwcagwVigh/M+HUb99KfY09XP49Xfv1f
	 iI+t9RdBU2w2jpl2bYoXvGld/ONFx+FgqaNAdNy4nmwR7TWA3fDH4nPqSzdCMzeEis
	 OG+cEyiQNO5liNKA5sNPadZgO8asK6kIAqDYB91fUp+psgmrRdZnUF0VydzzjtG19a
	 Jiw7hTh52WsVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703-ec_support_for_purwa_evk-v2-2-c59aac5c6aac@oss.qualcomm.com>
References: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
 <20260703-ec_support_for_purwa_evk-v2-2-c59aac5c6aac@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 10:07:21 +0000
Message-Id: <20260703100722.1FFF41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Configuring the EC interrupt as IRQ_TYPE_EDGE_FALLING causes a stu=
ck IRQ line and lost events.

Pre-existing issues:
- [High] The driver registers all cooling devices with cdev_id =3D 0, break=
ing multi-fan thermal device tree bindings.
- [High] Probe function fails to disable EC SCI events on error paths, lead=
ing to corrupted EC state and unhandled interrupts.
- [High] qcom_ec_read() ignores partial I2C block reads, causing callers to=
 use uninitialized stack memory as hardware state.
--

commit 30f797509dd26f2c0981b525ba3d62d1173ae857
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

arm64: dts: qcom: purwa-iot-evk: Add Embedded controller node

This commit adds the embedded controller node for Purwa IOT EVK boards.
It configures fan control, temperature sensors, access to EC internal state
changes, and suspend notifications to the EC.

> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3d..491ea7769cd71 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> @@ -837,6 +837,16 @@ eusb6_repeater: redriver@4f {
[ ... ]
> +
> +	embedded-controller@76 {
> +		compatible =3D "qcom,purwa-iot-evk-ec", "qcom,hamoa-crd-ec";
> +		reg =3D <0x76>;
> +
> +		interrupts-extended =3D <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;

[Severity: High]
Does configuring the EC interrupt as IRQ_TYPE_EDGE_FALLING cause a stuck
IRQ line and lost events?

The EC asserts an interrupt while multiple events are pending, but the driv=
er's
interrupt handler reads exactly one event and returns without looping.=20

Because the trigger is configured as edge-falling, the persistent low state
of the line does not trigger another interrupt, causing the line to stall
permanently.  Should this use level-triggered interrupts instead?

> +
> +		pinctrl-0 =3D <&ec_int_n_default>;
> +		pinctrl-names =3D "default";
> +	};
>  };


While reviewing this patch, I also noticed a few pre-existing issues in
drivers/platform/arm64/qcom-hamoa-ec.c that handles this device tree node:

drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_probe()
[ ... ]
> 	ret =3D qcom_ec_sci_evt_control(dev, true);
> 	if (ret < 0)
> 		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
>=20
> 	ret =3D qcom_ec_thermal_capabilities(dev);
> 	if (ret < 0)
> 		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");

[Severity: High]
This is a pre-existing issue, but does the probe function fail to disable
EC SCI events on error paths?

If qcom_ec_thermal_capabilities() or the subsequent memory allocation fails,
probe returns an error. The previously enabled SCI events are never disabled
because no devm action was registered and remove() is not called.

The EC is left actively generating events, but the OS interrupt handler is
freed by devres. The EC will assert the IRQ line, which goes unhandled,
potentially stalling the EC and causing battery drain.


drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_probe()
[ ... ]
> 	for (i =3D 0; i < ec->thermal_cap.fan_cnt; i++) {
> 		struct qcom_ec_cooling_dev *ec_cdev =3D &ec->ec_cdev[i];
> 		char name[EC_FAN_NAME_SIZE];
>=20
> 		scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
> 		ec_cdev->fan_id =3D i + 1;
> 		ec_cdev->parent_dev =3D dev;
>=20
> 		ec_cdev->cdev =3D devm_thermal_of_cooling_device_register(dev, 0, NULL,=
 ec_cdev,
> 									&qcom_ec_thermal_ops);

[Severity: High]
This isn't a bug introduced by this patch, but does hardcoding the cdev_id=
=20
to 0 break multi-fan thermal device tree bindings?

By looping over fan_cnt and passing 0 for every fan instance rather than
the iteration index, the OF thermal core cannot distinguish between multiple
cooling devices under the same node. =20

This breaks thermal zone mappings and can cause undefined behavior when
binding thermal states.


drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_read()
[ ... ]
> static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
> {
> 	int ret;
>=20
> 	ret =3D i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
> 	if (ret < 0)
> 		return ret;
> 	else if (ret =3D=3D 0 || ret =3D=3D 0xff)
> 		return -EOPNOTSUPP;
>=20
> 	if (resp[0] >=3D resp_len)
> 		return -EINVAL;
>=20
> 	return 0;
> }

[Severity: High]
This isn't a bug introduced by this patch, but does qcom_ec_read() ignore
partial I2C block reads?

i2c_smbus_read_i2c_block_data() returns the number of bytes read. If a short
read occurs, this returns success (0) because it only checks if ret < 0,
ret =3D=3D 0, or ret =3D=3D 0xff. It does not verify if ret matches the exp=
ected
resp_len.

Callers are then exposed to using uninitialized stack memory as hardware
state for firmware version data, fan counts, or thermistor masks. This can
lead to out-of-bounds memory allocations if a bogus fan count is read.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-ec_support=
_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com?part=3D2
