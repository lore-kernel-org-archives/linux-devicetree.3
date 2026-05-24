Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B3F27A12F
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779613431; cv=none; b=oYmisMJ3VfsTaxbTYEmQYLfFMtYa72XOfhOUcJ7qpRFQQUGCNGPPq60ftJQZf4PCV9TU9lQSmgo8g/nJnfVuxm0FNGwL9dSm/Q83Z1adVx8k79S4mpP1EFlaJ9Svt/Bn6pgTcrHBtkBoE1tUFl08rUpQeKnXkF+qpQDFMXKyoGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779613431; c=relaxed/simple;
	bh=e8hb3h8YsLYpnOZbDdRPWiuVd8wbD+JISLBftwWgDvM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UBsVUK0kYXAmcX6vZfzFEmiBuPVo/MJwmdmEbwBipO9qLjsP4wfPpJLfj5IDaFmB1uQ6tUgKD3CftIQE4dTCA9ZkDxv0a0p/O3EragudveyU75V6bz6VqZxK8EAJvKoK8BTKHtPC/HEi+4k4Je2pljvXMeXsbZmgEp2bXLVfYXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7nr5fq/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7nr5fq/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E43C1F000E9;
	Sun, 24 May 2026 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779613430;
	bh=xgRdl7N4TnLwGPcab8XBKDFbITxtsPKfVlIg0VzyO4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c7nr5fq/rWkiqbDSlXf1WoKPX38WMMNi/OiP+0hppUwVYwfF8+kunihJD8IXN3tmN
	 GDw+nEjMMlli8W276wm3C+sAtruhtkJWFgsCsZc+i73IgJJniOOrYbYNUB1Uv4F9uF
	 JYMjmTI1VslnWgo4cBBjz8efyV7jKvhA6Qqw5bVotK1PR/8uBX8B42H3Xe4OMj5mJB
	 xM4Shnmn5bFQSlIDZ5e6y6Ih7WgmPHv0E15uubZ1Sz75+Qlk2Go6bfXyO8NeFiDKYE
	 qiblEnrus1CXcTSkDh0x/5pRKMX0i4BD0hlp2Uv7Ve6CfKzo4NPKJD3uiJ8GyKFJhs
	 ikS/cYCOIMxNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 1/7] dt-bindings: iio: add Open Sensor Fusion
 UART device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524085312.15369-2-kimjinseob88@gmail.com>
References: <20260524085312.15369-2-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 09:03:49 +0000
Message-Id: <20260524090350.0E43C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The binding lacks a reference to standard serial peripheral prop=
erties, restricting valid UART configurations.
- [Low] The new vendor prefix 'opensensorfusion' is inserted out of alphabe=
tical order in vendor-prefixes.yaml.
- [Low] The device tree example uses a specific, non-generic node name ('os=
f').
--

commit d7438989beeea74dd5628fa3759c1cbb1ffb5900
Author: Jinseob Kim <kimjinseob88@gmail.com>

dt-bindings: iio: add Open Sensor Fusion UART device

This commit adds a device tree binding for the OSF0 UART-attached sensor
aggregation device. The device communicates capability, status, and sample
frames to the host via a serial connection.

> diff --git a/Documentation/devicetree/bindings/iio/imu/opensensorfusion,o=
sf-uart.yaml b/Documentation/devicetree/bindings/iio/imu/opensensorfusion,o=
sf-uart.yaml
> new file mode 100644
> index 0000000000000..d4a8f68192e9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-uart=
.yaml
[ ... ]
> +required:
> +  - compatible
> +
> +additionalProperties: false

[Severity: Medium]
Since this is a UART-attached device, will board device trees need to speci=
fy
standard serial properties like current-speed? Without a $ref to
/schemas/serial/serial-peripheral-props.yaml and setting
unevaluatedProperties: false instead, setting standard UART properties will
cause schema validation to fail.

> +
> +examples:
> +  - |
> +    serial {
> +        osf {

[Severity: Low]
This isn't a bug, but does this follow the devicetree specification for gen=
eric
node names? Usually, node names should reflect the primary function of the
device, such as sensor or imu, rather than the specific product name.

> +            compatible =3D "opensensorfusion,osf-uart";
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66ae7ba..121b83f7046ad 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1239,6 +1239,8 @@ patternProperties:
>      description: OpenRISC.io
>    "^openwrt,.*":
>      description: OpenWrt
> +  "^opensensorfusion,.*":
> +    description: Open Sensor Fusion project

[Severity: Low]
This isn't a bug, but is this vendor prefix inserted out of alphabetical
order? "opensensorfusion" should alphabetically come before "openwrt".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524085312.1536=
9-1-kimjinseob88@gmail.com?part=3D1
