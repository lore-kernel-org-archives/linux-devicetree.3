Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5832B108
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784066787; cv=none; b=MvWwA6lczcVh3QZfEbBvycmpEcw55opAsXHBYnsF0WXvR9YmiMjNdzgprk8KAb4uoaJTO7YQzRNXC4Ywlh+hu4Fbb4AvqaJ8IZsNDlxKFqRAMx00VgxYtZOA9TuKBLb8r4XjF174VrldDu6/7Jia61EpaHwL3rpmV6Zli4TsnqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784066787; c=relaxed/simple;
	bh=lz27EZ+9ZtXNvvHmiEaHmuGxc4F9WgcsMwu8LNgW6jY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tk5a7W9VPBns0O5u4U57YZPKmTNKSVIi+vRE19cPFf9WWeA6gWMzWjRX/Q8j4P4QBNspCQ9FTUK3fLbWyPYrE9jJsf0p6Qj9E1CVAH5MPdTpskQbPIsfHPmVLGA9mm1B/mS/4z3qNY32TN+bAe4btZy+k4+aa8f0HHuJEB2oUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9dj1NK4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9dj1NK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966F21F000E9;
	Tue, 14 Jul 2026 22:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784066785;
	bh=B3Zbur4dfu3msund7THyceV0YPa4iw0/k/Dn+MnlSpA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O9dj1NK429reRgL5pTqyDOxXf5cnvHAdIltQLNO99Jhm9+wFagAOjn2DLXtIqSjMx
	 DyMnwQzT0aU6fI4wkFJlnayfkVdEVBG44NhVJd09hO4zRjnqIl3DI4ynD/IAErZiVj
	 xNhuTZ+xYlVYZxWEPZEsZaOPVT8TZLgKU9dyoRJRor2gGw1oVY1755mF46cAGfabb+
	 +Pse3KfO5L3u12wwIOVe4slJIxwIq/rQodYGkA2n08y8HrU98oZAH1E6WboClVMFvh
	 uyADUYNFQrNoD9H04NVwn9EIpQxh6TM4NgGpagNpiuJcd0oAicV46YhgGXHpHPfIYl
	 n9YUgLn+VwcbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out of
 trivial-devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Gobbi" <rodrigo.gobbi.7@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
References: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 22:06:25 +0000
Message-Id: <20260714220625.966F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Making `vdd-supply` a strictly required property in the new sche=
ma breaks Device Tree validation for existing valid device trees.
- [Medium] The binding schema omits the previously allowed `interrupts` pro=
perty and fails to document the mode-control capabilities, contradicting th=
e commit message and breaking compatibility.
--

--- Patch [1]: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out =
of trivial-devices ---
commit 19408504da4434cc55f5f0ccb25c557b08078221
Author: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>

dt-bindings: iio: proximity: move LIDAR-Lite out of trivial-devices

The PulsedLight LIDAR-Lite v2 is moved out of trivial-devices into a
dedicated binding file. Support for LIDAR-Lite v3 is also documented as
a fallback compatible.

Link: https://lore.kernel.org/all/c39a2980-f5e5-44aa-9fd3-20e0658f62dc@gmai=
l.com/

> diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,=
lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsed=
light,lidar-lite-v2.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-l=
ite-v2.yaml

[ ... ]

> +  powerdown-gpios:
> +    description: GPIO that can be driven low to shut off power to the de=
vice.
> +    maxItems: 1
> +
> +  vdd-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply

[Severity: Medium]
Since the device was previously defined in trivial-devices.yaml, which
explicitly disallowed vdd-supply, no existing valid device trees could have
included this property. Does making vdd-supply strictly required here
introduce a regression by breaking backward compatibility during
dt_binding_check for legacy device trees?

> +
> +additionalProperties: false

[Severity: Medium]
The commit message mentions a mode-control pin used for PWM distance output,
but there are no properties defined in the schema to describe it.

Additionally, trivial-devices.yaml previously permitted the interrupts
property, but it is omitted from this new schema. Because
additionalProperties is false, wouldn't legacy device trees specifying an
interrupt fail validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714215433.4125=
9-1-rodrigo.gobbi.7@gmail.com?part=3D1
