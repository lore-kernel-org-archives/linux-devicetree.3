Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DCA339366
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 22:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789858504; cv=none; b=V/XW9jawhAyzje+zKMRIFD0o2l/6NkuQixPi8uhNOdwRIYnYmeMU+z06Uol2YcS1uVeoGfM8q0R5nAqC6tWXmHlUCQjaBkh6o1lDjHz8WagTcjrzTyHNKCcima6YBHZzvbdt3JOwDMWb1utbYyCwRh7QAngBLg23RiMzJF2EjBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789858504; c=relaxed/simple;
	bh=FRnHQhgqxaK/hUZiNOj/nhXjorX+voDZphbryGj8RfA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ofXapIGnSsBnn7L8QCdhdN22G+cSNqz4Ed3b2EkquCzURFVMsyUhlywwgdT+A5c8pWK6jJCnr+UOyaYBPWlx848m4bCvD2KR/q7oLy1Ir6juhYrpKbxvqmadaOFlNfK4VSJOU5PXjx/gJxW3Me87l2WFcfC0SI0ey/msUFOaAVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0ns8fV7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0ns8fV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FF91F000FF;
	Sat, 19 Sep 2026 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789858503;
	bh=W60/a2xc/poVgA4ZmqOElX6SM9z/Vmytyrt7Up2Wywg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a0ns8fV7t/3p1dRMmhZSLXBxT17aM62s0bR1odfc0scWQuEln3LrxESAcphKzPGaT
	 OcfuIu6D7hKgAjYCErWCun3K/OGx1aPpHDfPb1ZI3OC0box1FyMQ5ailz7lsYVnx6t
	 5H4tUaj50SDktblsjBNa3p0h0D8KDFMe8qCllFFL5F52ZOlc058OcQBq2ZqFxmEAxX
	 3asG8YhU6lOAKpb9lQ2Tw5Uykkcn8n8MFtfIFPXbduDgo0033HVA4OADVzLF7r6GyY
	 dOHsDxKuxOzk//DcZJ21O5Kpiaf1HR1zH53Y97FzVheOA+GLiSZMD9yNFqHVFqPs7i
	 ZlPrkdSD+jOtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: pressure: add Sensirion SDP31
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muhammad Abu Bakar" <m.abubakar365@yahoo.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260919223854.13437-2-m.abubakar365@yahoo.com>
References: <20260919223854.13437-1-m.abubakar365@yahoo.com>
 <20260919223854.13437-2-m.abubakar365@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 22:55:02 +0000
Message-Id: <20260919225502.C6FF91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: iio: sdp31 omits vdd-supply from required list
--

commit 61ed9cca92b973d2ff70fa365d3b2d923c296955
Author: Muhammad Abu Bakar <m.abubakar365@yahoo.com>

dt-bindings: iio: pressure: add Sensirion SDP31

This commit adds device tree bindings for the Sensirion SDP31 differential
pressure sensor. It defines the properties compatible, reg, and vdd-supply
for the I2C device.

> diff --git a/Documentation/devicetree/bindings/iio/pressure/sensirion,sdp=
31.yaml b/Documentation/devicetree/bindings/iio/pressure/sensirion,sdp31.ya=
ml
> new file mode 100644
> index 0000000000000..fc646eca2d6f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/pressure/sensirion,sdp31.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: sensirion,sdp31
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +
> +required:
> +  - compatible
> +  - reg

[Severity: Low]
Should vdd-supply be added to this required list to enforce complete device
tree configurations?=20

Since the SDP31 physical sensor requires a power supply to operate, defining
vdd-supply: true but omitting it from the required list means incomplete
device tree nodes missing the power supply definition will silently pass
schema validation when developers run make dtbs_check.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919223854.1343=
7-1-m.abubakar365@yahoo.com?part=3D1
