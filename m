Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896620;
	b=zisRejP40MBtiArYOVvC1E1OrZIikQHb+vzrn7H5Lw5N34/GBAVyOz+CLOi5Dqp+02fo
	 L3HRm3XfySwFG2kL1Es7gdeq2qUZDHBMfUpM48JxVk/aQL5+WuG9yHgc6ZGqbZJXt4JFI
	 TvbUDZeA6G/GzmybdjWa26ZkL4nI6iEjntcTZWSpgJQi9ZPb2/M9GvgGOaIhUk+ly6UME
	 q6tjxi6ObSr5JvsD/YGMJy/UKBcOEDYuNrXFKkb0yaHQTBXv0GONos/TFcma3dzxzNXmJ
	 fNdXyAZ6ClKboIY/1HIfHZs2ollFUR6Pu5EPsuHOWcbX/BKM1MK8ECZNIm7dZMmlFcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896620;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JXBvWWgyvpBdIRIUvSLpfSCkt0UywFxhzKseDMBXZ5k=;
	b=dpsKUqq6aMx/1Bcap9RAHx/sSWHKS4+/p/eR3+ecz3UL5Egf7Lcjm2NmGJhYhCUWFb/X
	 BXjUJKowe86g8+t399sBIDgrTCp8Qql8kJnl1ibAY4dzRzfLgLgWBBIsGi1DqY2+S5aKM
	 QupU6ugSc59D4cAwrAXKLVPqZ3h+p1SYU101WoVk+oWBx5c+MFFYL1OhPSxTmVUuai0BG
	 a/T5ui+mI7aCsPCCeZYmePoSBv6+ZfisMTR3VKmHUVH4mSWZ1HVCKZfw0O43oiV13Pabv
	 jAEPoxdwMMsXUf+JnGBUUGvG1RFMAsu2FbEZXQ+DSM5e4wOlgoQTxS7RzDU8KPna6aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AIxaDXMw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C93E606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AIxaDXMw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AD11F000C4;
	Tue, 17 Nov 2026 06:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794896620;
	bh=JXBvWWgyvpBdIRIUvSLpfSCkt0UywFxhzKseDMBXZ5k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AIxaDXMwVDwoEZxyont4PFwCgYvspYPvlxVqrPyHD5h/sJcI08UMZ6JzU3HEDpFD5
	 XwQ6v2oLrBWhSS4P5Fdm/14J6G9W1VtarBUNkhdQ7ubFzWxiFJvlpqEX+zX+zCStHz
	 ZlWFr1EAZbLuveGQsxI/LApWe9XAtG0896O2PzM01DrhEO6BtYhk2KVJH7LuBDNTAS
	 wZGtZsZE7RNCPTDRMBMi3MpdIFfpaCCwrulZ1anhhtneNPQJjOvCCgsFIKan//I0TW
	 zGNfn0SbO9kex6XbhxiyHXFcWMw4SpEa8xhVAF1/Az8yl8uq93DhkOAaF4ndEHSISC
	 SapKN6hq6j33w==
Message-ID: <sashiko-outbox-218249@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117060501.2611071-4-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
 <20261117060501.2611071-4-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 06:23:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] thermal/ma35d1: undeclared devm_kzalloc_obj() in
  ma35d1_thermal_probe()
--

commit 7c4743b2d7c9ded9bc14984d2384e4a19e5bfbcd
Author: Zi-Yu Chen <zychennvt@gmail.com>

thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal sensor driver

This commit adds a thermal sensor driver for the Nuvoton MA35D1 SoC,
instantiated as an auxiliary device by the MA35D1 reset driver and
accessing the sensor register via a syscon regmap.

> diff --git a/drivers/thermal/ma35d1_thermal.c b/drivers/thermal/ma35d1_th=
ermal.c
> new file mode 100644
> index 0000000000000..453f57d236ecc
> --- /dev/null
> +++ b/drivers/thermal/ma35d1_thermal.c
> @@ -0,0 +1,149 @@

[ ... ]

> +static int ma35d1_thermal_probe(struct auxiliary_device *adev,
> +				const struct auxiliary_device_id *id)
> +{
> +	struct device *dev =3D &adev->dev;
> +	struct thermal_zone_device *tzd;
> +	struct ma35d1_thermal *sensor;
> +	int ret;
> +
> +	sensor =3D devm_kzalloc_obj(dev, *sensor);
> +	if (!sensor)
> +		return -ENOMEM;

[Severity: High]
Does this fail to build when CONFIG_MA35D1_THERMAL is enabled?
include/linux/slab.h defines kzalloc_obj(), but there is no device-managed
devm_kzalloc_obj() helper in the kernel, so compilation fails with an
implicit function declaration error.  Should this call
devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL) instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117060501.2611=
071-1-zychennvt@gmail.com?part=3D3
