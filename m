Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1038B7DC
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787203644; cv=none; b=QNrZxOudM7zRY4BJTrHSZS07HvAZsiPwIrcMec+Dg+SxJep2VJc3ytEiPbmdQlELUrkFiOZ/jYWxt5Tk68qTV+pkqUX1cQmiSokwAykB7bcm2qf8TdN8dD7cTLcTeKALxHPjF8nJ45IZsWVoe6uTTAszUbbbWObLJuw4TqAF/Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787203644; c=relaxed/simple;
	bh=6gXyHo8XUCoAKISuXI9bvNfeyPk4rtFSs1k4nKhIhUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vCJF58z9i686alJ5M5Dmb+m8Ox5zPGggWQItB23Y9ielC0iLEuwL9xoUSpi7c9bq/lzN7MAOGMm/UuBOFIwNIlYbYwZoedBLq0zxjNAMueJWe4lqMFOFE2qybL2evG2y2HLrNGfrl9dClgBo9dPO/ytnFAwBPMAYdgiRwvOmI+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOEnRnbf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOEnRnbf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73391F000E9;
	Thu, 20 Aug 2026 05:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787203643;
	bh=XKSbNfLvTnuUCP7oB4yU0B9TQ7CYBy9wpR5csrSw70M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WOEnRnbfSzFh/JNPPDYw/c6GCeowJx31l+pJMylMINsiJUAFWX9Jq30eAalmB640R
	 UJQri7E9KzY87xLVkdldtqM1Wryf0eIQFWUjSPgU3nkWx2XCgEsqR6+TAdX6y9i2Q3
	 Q2JtGiWHVDe2OQvvGF35ecPmE8x4vudqIjugDkVM7Fx89oTHHq1ut7BrDA7ssQiem6
	 XjWz00QeRPOPoeBiUWNkbFE+LkuGo9IH3PhRLgadv/ZkGK71mGXqf0KPl+MsfsmvF0
	 acoFuDoFDeGM9g4fZR9+IWSdIKVeWfDKVLLExQllFidYPGJA+Tn1NCks0RvuSufsuI
	 pRfJif0Xpa1Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/5] iio: osf: add UART IIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260820050608.5440-6-kimjinseob88@gmail.com>
References: <20260820050608.5440-1-kimjinseob88@gmail.com>
 <20260820050608.5440-6-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 05:27:22 +0000
Message-Id: <20260820052722.D73391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware Initialization Order: Regulator enabled before UART is co=
nfigured, risking loss of initial capability report.
--

--- Patch [5]: [PATCH v8 5/5] iio: osf: add UART IIO driver ---
commit 9c6fb720e1ae8c10cafcfaeb63c04248f654050d
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add UART IIO driver

This commit adds the Open Sensor Fusion (OSF) UART IIO driver. It handles
receiving OSF frames over a serdev UART, registers IIO devices based on
capability reports, and exposes sensor samples via direct reads and buffers.

> diff --git a/drivers/iio/opensensorfusion/osf_serdev.c b/drivers/iio/open=
sensorfusion/osf_serdev.c
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_serdev.c

[ ... ]

> +static int osf_serdev_probe(struct serdev_device *serdev)
> +{

[ ... ]

> +	serdev_device_set_drvdata(serdev, osf_uart);
> +	serdev_device_set_client_ops(serdev, &osf_serdev_ops);
> +
> +	ret =3D devm_regulator_get_enable(dev, "vcc");
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to enable vcc regulator\n");
> +
> +	ret =3D serdev_device_open(serdev);
> +	if (ret)
> +		return ret;
> +
> +	baudrate =3D serdev_device_set_baudrate(serdev, OSF_SERDEV_BAUD);

[Severity: High]
Could this hardware initialization order lead to a race condition where the
sensor's initial capability report is lost?

Since the vcc regulator is enabled before the serdev UART port is opened
and its baud rate configured, if the sensor boots quickly and transmits
its capability report immediately upon power-up, the host UART might not
be ready to receive it.=20

Because the driver relies on autonomously transmitted capability reports to
register IIO devices, missing this initial report could leave the driver
completely non-functional.

Would it be safer to open and configure the serdev UART before enabling
the regulator?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820050608.5440=
-1-kimjinseob88@gmail.com?part=3D5
