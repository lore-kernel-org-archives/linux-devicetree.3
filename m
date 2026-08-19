Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF42D1DF736
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 21:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173629; cv=none; b=QE4yGs1GAwuKbQ8hxv8sptiw9yTEI/vYLiFfBfPRhxdj8lxeWuWRYHScVR/YL6PHVL/XZKDB2hKdcT5hdmRTu/Dg2KvVLVxQ1JTzWZ2RAB0SFvCEkpyYmQpAeX82R7fYhBVPPNbc+kVvH3lr4+/m/dKliJn1Hu/xp4J+pxJjx7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173629; c=relaxed/simple;
	bh=F670sIl5HZjLzvfSwhQn5yFKHi98WSrqruthhwyKoJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HYzM75UOaXVTVmuKfVNshIQW5XPmV8qwwwrKJbF7Ku24twWw67S0GQn6p3sRovyk/pWu6OlcrFJESbDbaYSSSAtfsCMjZFqsvP/2HmE9k2MIgx9gVfOOLsnM2YvTFot2ufi7aZPNzVQ72MmFd7iGFoFG6zwqkUuAxL0ioMi/h/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjW55E7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjW55E7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FE11F000E9;
	Wed, 19 Aug 2026 21:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787173628;
	bh=of3+t46EF97mwJUhsRdbW4TdLlfTZA2jJ26QpWsP2KY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jjW55E7mzV7GXEqdyo8P5Ktw2DCDoPYaZ7pAuxDBzRe93ADHZqARIrOkcuhaxEomC
	 hGGGHzd0Gr97qqXO8QLo/msVPkiMXrhJoyunS/5d153vbfn3JXTHkiSPxy2Os/PO9x
	 kpIJ3nVWjPzPZMzxVJWO3Tw7K9D+IffQPxU2mLSWnSDnTOKUFD+aYvRQHvV/nRs5Ui
	 ru8/T5YIsHqtW0WiqkG7bhXoitNJoCaRm68LzVzncRCmxAl+zQHjzVUMWUW0fPhRmm
	 UPatKvgVANHilg0UeVp5m7vtwjHjrLaKxQfF6HTGDsHSTC0ynmiZBBVp3HFjCHIaoM
	 fVRAdSKrC8CbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: iio: proximity: move LIDAR-Lite v2
 out of trivial-devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Gobbi" <rodrigo.gobbi.7@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819205751.166030-2-rodrigo.gobbi.7@gmail.com>
References: <20260819205751.166030-1-rodrigo.gobbi.7@gmail.com>
 <20260819205751.166030-2-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 21:07:07 +0000
Message-Id: <20260819210708.48FE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Making `vdd-supply` strictly required breaks schema validation for =
all existing valid device trees.
--

--- Patch [1]: [PATCH v6 1/2] dt-bindings: iio: proximity: move LIDAR-Lite =
v2 out of trivial-devices ---
commit a1ef458d9c0cdfc9e29367cfdc33a99254dccf2e
Author: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>

dt-bindings: iio: proximity: move LIDAR-Lite v2 out of trivial-devices

The PulsedLight LIDAR-Lite v2 is moved out of trivial-devices into a dedica=
ted
binding file to document its power-enable, power-supply, and interrupt
properties.

> diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,=
lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsed=
light,lidar-lite-v2.yaml
> new file mode 100644
> index 0000000000000..491960bb3a0e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-l=
ite-v2.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply

[Severity: Low]
Does making vdd-supply strictly required break schema validation for existi=
ng
device trees?

Since this device was previously validated against trivial-devices.yaml whe=
re
this supply was not defined, running make dtbs_check with an older, valid
device tree containing pulsedlight,lidar-lite-v2 but lacking vdd-supply
will fail.

Should this property be optional to maintain backward compatibility with ol=
der
device trees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819205751.1660=
30-1-rodrigo.gobbi.7@gmail.com?part=3D1
