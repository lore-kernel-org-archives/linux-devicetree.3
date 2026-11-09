Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264221;
	b=TiZ9hUE9UszcbvHnVnVYl8O01IM4M/U2k8U+SnQyr2JpGh/AcF1v7FtVq/dQoVNBsbe1
	 fOLcObA45G13/Qhd2ARa8n1S5N1CxxmGduXSctaDLXj9YwIZIGeqWmsNqR3uVOVo7/o23
	 rumbstw8sMSPIXhwVkPvA40kSfhgzS5XBTkVZ0/1tEz9Nua7DAMiTvhxEMkrNLWQbKyak
	 II22Ys41rhK/tmur+UEAipNjqxA/YLTDqItCaTt1a1Af/HeN8qYYycXkRU6KLTQIXXeA7
	 27fKeXf+eeRh1Zlq7ffVm1TypZpcrAoYoM40wbRr4iy6HCS4HP/mGx5qlu8kV9lz50Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264221;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k54hs5AF/8ORygfL5gFRIndiw2dmyAZ1qfDtU2SyrqE=;
	b=voWWZL1QvHLnw0vxPk7MDo6rzEUcNdj1QrWBcZlEXCUJjwl1L6f57w8I+28G68cWWqnd
	 9RS6JFhZcdFpRGqLJLlxcPTNJwaNID96FLxT9BQNzX4p/kMjNTSpb0DaAX6ZXigy1Mfw0
	 hIehOlO+qwrMIyQAJhghbj/gmYxEtOBhAZlML3TgKwEzinzSPiezrlAovMnFOQDT441cG
	 Heniws0Skp5DcOBI5xZQuxYW+HCPN0rfHNWRPdJzJJWG1FE7BknWt5Eexwi9/yCmXyAUj
	 6mYjWj9xN6pRTieDh0lQgDyWk7jAnPbO2Cgor6TjKlbHm/P23e3a/d3YX7vTjGIc60g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eceiMtyy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E48F606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eceiMtyy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F381F008A1;
	Mon,  9 Nov 2026 22:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264221;
	bh=k54hs5AF/8ORygfL5gFRIndiw2dmyAZ1qfDtU2SyrqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eceiMtyyqPOzBXUvZblhsaECT2/2OdTpNFz73g62CFgN2mMcvjKfDUtq0q9x/1YP3
	 Rip5Nb+3qYFBtEbBDY4l7/dfMEugH5+b73PR0yezOPHyuhAKPs9O/wlUCLvX8sDy0E
	 /saoOUJXwo+pY1xk6sdkTdFj3FMMVkHyE2NXrMMAqOuk96T+EAeX0gJjJbzBWAuZX0
	 MPgApbZNLJlqHDHTb4e6EShULlXtRjat7ZqgdbDYwuUD5IIPphYmsMHkUN3Dz8GnIh
	 64gMATXRDOyz/H3i19QXw2hMQ9j0xx2dhp1U4CU66h8W2oCJN3uvSGCh4s22PPTaa6
	 ES41GOBYQYLNQ==
Message-ID: <sashiko-outbox-205766@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: media: i2c: Add Samsung S5K3M3 image
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Suman" <gauravsuman007@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261109-sm8150-camera-v1-3-3d2e7b407516@gmail.com>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-3-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:43:40 +0000
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
- [Low] dt-bindings: media: samsung,s5k3m3: description refers to driver
  support
--

commit 4922a603dc5707d1a4718e4be230c423c1f7953c
Author: Gaurav Suman <gauravsuman007@gmail.com>

dt-bindings: media: i2c: Add Samsung S5K3M3 image sensor

This commit adds the Devicetree binding schema for the Samsung S5K3M3 13MP
image sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.y=
aml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.yaml
> new file mode 100644
> index 0000000000000..434f5d4326b72
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3m3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S5K3M3 Image Sensor
> +
> +description:
> +  Samsung S5K3M3 (ISOCELL 3M3) is a 13MP image sensor controlled over a
> +  serial camera control bus. The driver supports 4160x3120 at 30 frames =
per
> +  second, RAW10 over a 4-lane MIPI D-PHY interface.

[Severity: Low]
Should this description describe the hardware capabilities of the sensor
rather than what the driver supports, per
Documentation/devicetree/bindings/writing-bindings.rst?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-sm8150-cam=
era-v1-0-3d2e7b407516@gmail.com?part=3D3
