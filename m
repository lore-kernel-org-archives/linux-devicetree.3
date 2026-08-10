Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C663C13EF
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361294; cv=none; b=svjAn6NabeApTuPx0w3VGOTtjeegebz/VNxXWwcUU5c5iUHbYomwwOR4n7QyKUul2jOUb0uRpSCGT4d9/RLGqQdJDJ/LSZgHn5OTaT8Y7IpCJLkrC+3an/dr2/n1CWTaZA2wRX+tp+c8OJjopiC38sp3wW7eAYeJ4Twq6/NYWP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361294; c=relaxed/simple;
	bh=D7cy/3N9/q+h+gwam/7GSFkWL9rMf7bT09+rMtLpa30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dhM7vEL4LMBln4hGe0ddN2YNGQZAsHg53YbD+8xfzhED4AC2LVJo+rDYs10VUpMIp1wQNK34uqQBZ2h8cUhGG3b8qS6yhceZnXnSPxZozTIFNb/KiGSdCe/ARk6V+UQdxQ8u1+bVINVOYhNJnOaCt7sTGmk7PQ40UC20RQwewB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdXoJXTP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdXoJXTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39C71F000E9;
	Mon, 10 Aug 2026 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361293;
	bh=pTixcwcg8ot13jBkSZ1Gh/YjIUWQkb7b11MBBPIPNb0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZdXoJXTP6/yr4BbOqnOHdzxOXeQshrzaa5vgpfni4YQ1awkPebEvGiBj7uUUGy9Vu
	 RIFeiCcNtFjToP6LEsl9BXWkLfm6TGMEshPfnxr7dIainHur+i/R1ByLio5gJ8wdpC
	 6MPIlLr3Ez5BSP+74xYJoC+k6219dmdF5io0IRwMV1lqu71/0stGhUEPtEIuZ0VdZZ
	 zWn+m6DS4tHJN6ioNN3O+qgNXx7x88HiNf99moCWuL5gp+qufkgHqI4DYPBSKNZ/9i
	 b2yv9RgCpdkoXluuQrsEGIp/65eW6pc/acXNZ3cmZ1eHe6uXU+qa3NHRZLRlFE/52d
	 dFWLyyfsj5y9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] iio: light: stk3310: support the Sensortek STK36C61
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810110423.41697-4-jorijnvdgraaf@catcrafts.net>
References: <20260810110423.41697-1-jorijnvdgraaf@catcrafts.net>
 <20260810110423.41697-4-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:28:12 +0000
Message-Id: <20260810112812.E39C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The IIO device is unregistered before the threaded IRQ handler is =
freed, creating a Use-After-Free race condition during device removal.
--

--- Patch [3]: [PATCH 3/3] iio: light: stk3310: support the Sensortek STK36=
C61 ---
commit c621ace8607632002893d3b296ea6bb5b3e8c5f1
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

iio: light: stk3310: support the Sensortek STK36C61

This commit adds support for the Sensortek STK36C61 ambient light,
proximity, and RGB color sensor to the stk3310 driver. It introduces the
new chip ID, registers, and intensity channels for color data.

> diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
> index 17b1ff42bf6e1..289900aeafa78 100644
> --- a/drivers/iio/light/stk3310.c
> +++ b/drivers/iio/light/stk3310.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential
use-after-free race during device removal in this driver.

In stk3310_remove(), the IIO device is unregistered before the devm-managed
threaded IRQ handler is freed:

drivers/iio/light/stk3310.c:stk3310_remove() {
	struct iio_dev *indio_dev =3D i2c_get_clientdata(client);

	iio_device_unregister(indio_dev);
	stk3310_set_state(iio_priv(indio_dev), STK3310_STATE_STANDBY);
}

Since the interrupt is requested with devm_request_threaded_irq() in
stk3310_probe(), it remains active until after stk3310_remove() returns.

If an interrupt fires during or immediately after iio_device_unregister(),
the IRQ handler can call iio_push_event().

Because iio_device_unregister() frees the event interface, could this result
in a use-after-free when the active IRQ handler writes to the freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810110423.4169=
7-1-jorijnvdgraaf@catcrafts.net?part=3D3
