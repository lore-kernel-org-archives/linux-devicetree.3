Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A111CD1E4
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273735; cv=none; b=NL9ZpZ7qwO2vYEQH3KzqCZE93MiPFDoy4TI7q52JLN621oZS0JaMmcKXu56BsLutmih7fLWNXnGZFqbrF6xCn8Bvwo01pYwjBkTMakAIbXIZiDVshuosHsPvEkwdj4Vk3oXcmrjN+R7yrzKcaZGtXoU/MyXuK4VHScYHAUsWJUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273735; c=relaxed/simple;
	bh=sLj33mExnmkUohVhK+vWwIRfsnEYScZP3i1i64Ujgi4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L8KhjXGBgaQhHsSRWXd0ryoF1plF3mM73TYCFZkhudpguE2go78jSlObErgv/xOqhyifdBZZ+slrWK0yfcGHWuHheuQdZ9Kh/gotUDfsY3PIEyLnlDy0UUjTqHsmO1NLQmK2rWioQilAaeZD3x3v4W68ea+DnfPdmPs1GtHBL6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPpS/Ypc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPpS/Ypc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E6B1F000E9;
	Tue,  1 Sep 2026 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788273734;
	bh=bjmEWWk74C8yhWHJ1JjwRd3UbgL22SN3h6lSoAEt7oQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YPpS/YpcZbpLf0DQLA12qXDNoSOs0J0yApPPcSCvJSphQT75tdDWC+EIRU7l2h7or
	 8S9bK/sLQQEw89umFU+qCt8zQzzHDTxOP67kZWSOtnnOWu+A9VpFcsx2px1lacp/dN
	 UeYdO0jALAe7MaKFGHoveYQJff+deEoMuepADcx/czoDabweVLQ49ILuI4p/ly1K3U
	 kcmnTIoDV9CZ3AsIrMf2DXRyQwrYmvJ2j9qTzV9X7GcrT4RUcCeyN1AO3J/GjJTfAv
	 w0msbPfsuT0apAThV8Op4lhwhHDF663JvUyW72ggl8KDk3pdzSWBpfB9ZDBTX6MG/5
	 n13Kfd+8/RZIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/8] dt-bindings: Add InvenSense ICM-42370-p
 accelerometer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-b4-inv_icm42370p-v3-1-77cc31642115@axis.com>
References: <20260901-b4-inv_icm42370p-v3-0-77cc31642115@axis.com>
 <20260901-b4-inv_icm42370p-v3-1-77cc31642115@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 14:42:13 +0000
Message-Id: <20260901144213.C3E6B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema includes SPI properties and unconditionally reference=
s the SPI peripheral schema, directly contradicting the commit message whic=
h states only I2C support is being added.
--

commit df5e4c67004b6299d9c5cce9f57c0acaa91c89bb
Author: Kanak Shilledar <kanak.shilledar@axis.com>

dt-bindings: Add InvenSense ICM-42370-p accelerometer

This commit adds the devicetree binding documentation for the InvenSense
ICM42370P 3-axis accelerometer. The commit message explicitly states that
only I2C support is being added, leaving SPI and I3C for future work.

> diff --git a/Documentation/devicetree/bindings/iio/accel/invensense,icm42=
370p.yaml b/Documentation/devicetree/bindings/iio/accel/invensense,icm42370=
p.yaml
> new file mode 100644
> index 0000000000000..d519dc7e63dd0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/invensense,icm42370p.ya=
ml

[ ... ]

> +  vddio-supply:
> +    description: Regulator operating range between 1.71V to 3.6V.
> +
> +  spi-cpha: true
> +  spi-cpol: true

[Severity: Medium]
The commit message states that only I2C support is being added and leaves
other protocols for future work. Are these SPI-specific properties intended
to be explicitly permitted here despite the stated omission of SPI support?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - vdd-supply
> +  - vddio-supply
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#

[Severity: Medium]
Does unconditionally referencing the SPI peripheral schema here allow inval=
id
device tree configurations to silently pass validation? Since the binding is
currently scoped to I2C, this might inadvertently allow I2C nodes to define
SPI-specific properties without causing validation errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-b4-inv_icm=
42370p-v3-0-77cc31642115@axis.com?part=3D1
