Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737B53537E5
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786099013; cv=none; b=vBA3Hs38wXIEkGlm6AWF9YvdChs/SCRFPkJtWeI+z2XTRPfVMU1Tm45sW1zCdwuio/RlIWxc0eFYZxkdFsGRf9g0MVPH+4RVxcZd3CsZzdm4eMkRQR9xmw2/teEV3kBcRbgy6FYzFyuDkpZU38Ai9A40c1K5LvSJQR084SaAvZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786099013; c=relaxed/simple;
	bh=DC5ZsLYqApA58+kdP0tFqfWYsGsyDk91yk0GPK0aMeY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tx4w0fW2ox08nhKJOhF0p6HEe4fW1Ve2qjzcfkALhL2FB297zI8rcHxqp/ci9NM+v/A2EVnmfOUs6xdVz8Qmq3u04h5JLAaspCzAh5+pzcc+CxGQr8gPwpbZVomoj2iVrW8XgqkXOf55agA3UdtvZyggN+dsbLhi0cs2DxDvK5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9T3nHI2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9T3nHI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC251F00A3E;
	Fri,  7 Aug 2026 10:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786099009;
	bh=ohDt7Y0IOLgI13Zv+4IdggUbtmYyS/iWEAnZe9jPFvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f9T3nHI294LepAWHcU+Yc9XPRYsOYIx+kRV0uxSiO7EFZAZtOwjCibO87UEKbTcXq
	 v9bCCQ4v1UmtT8vaByf9T6CXH+Y/RunngieQxte0MA6Ryysm8jXVzRx3nEvnmVettv
	 CJG4usGJCiNpYEJPX7ZVU22njJnIiz2YLhbU4293z0m70wbKJTJThWmkpV41Ds2lJd
	 m1QKtM1Zai7thPR7PXR3mISOeunUpuOsXEW6DGynLOK4qNDvbF2kMT7hrJdv82+JsU
	 UbTopP/k3b3t93c9MsKYTueU8KgOGgUi9hVS5YqXwsY9HW83rjZmmmCTEp+XqcaNIN
	 MwEDW093rkjVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Shiyan" <eagle.alexander923@gmail.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807102847.1813059-2-eagle.alexander923@gmail.com>
References: <20260807102847.1813059-1-eagle.alexander923@gmail.com>
 <20260807102847.1813059-2-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 10:36:48 +0000
Message-Id: <20260807103649.5BC251F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Standard properties 'orientation' and 'rotation' bypass standard ty=
pe validation.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: media: i2c: Add onsemi AR0234 im=
age sensor binding ---
commit d490efc51c8d22ea84e9e5b16150e2d9e4816d7b
Author: Alexander Shiyan <eagle.alexander923@gmail.com>

dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding

This commit adds a devicetree binding for the onsemi AR0234 CMOS image sens=
or.

> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml=
 b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml

[ ... ]

> +  vdd-supply:
> +    description: Digital Core (1.2V) supply regulator
> +
> +  vddio-supply:
> +    description: I/O (1.8V-2.8V) supply regulator
> +
> +  orientation: true
> +  rotation: true

[Severity: Low]
Does declaring these standard properties as 'true' bypass the strict type
and enum validation defined in video-interface-devices.yaml?

It looks like this is done to circumvent the 'additionalProperties: false'
constraint, but it would allow device trees with malformed values for
orientation or rotation to silently pass schema validation.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: CSI-2 transmitter port

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807102847.1813=
059-1-eagle.alexander923@gmail.com?part=3D1
