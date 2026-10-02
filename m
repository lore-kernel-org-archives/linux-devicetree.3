Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C993E1CF8
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942514; cv=none; b=Shqwg3j2UgRxyfQZFYgo8FfU+KXnnGo06SDGVc1pYTOk3NlGxNASCp20D1XZUs6UJBiTBQJ5Bq/8ZbuUB5tA11CJIKcX9k0GDKqGBYlSo7byjWJOlz15XxJYBlnkq9w6bwvD7QBpvoMArYGUOfgll6aUNHbj2u548L6SFwk/1EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942514; c=relaxed/simple;
	bh=+O95WuCfDMCYDbZqLXgm0CJvjePJcpzKewWu7O7gU+Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t1zqx1XN1DEVCuY/9qQ4Z9vNxFG+7OAPhXyzpItUfsdbWUGxy1QUR/PO2BZOx+oqfNY51Kplw/C1kxbpErfhLOrxISCa3q/5/NZen1YRH7Xaq3PJS6tQGDBe4IAsTCAG0+uHcX4nlYNG3fEkwEcsgLVjyKJ6CIaRQWImq8mkLi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fv3u9BRO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fv3u9BRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BAB1F000FF;
	Fri,  2 Oct 2026 12:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790942512;
	bh=mjylOiSzBIQsVkdLluaP9pCITD4qzxRKfS5H9/z0hWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fv3u9BROBhjXTC65D9rLPvWJiN98vXM2OMeg9cUWe0xDKv26n3hRRMJkjDX0YR59h
	 RSSABv3yn8btX8xUzSLCUef/pdAzUDDjzmY1kJlzJ5hKCfxGeeBx7P9oa23oaOk2f3
	 f+9QRfJRTQO5yt0lafkumdJ81UHAIG6hdWp14dgFkZgY1wm4UBcGCZj7Ua5CEGIA5j
	 0LZuDpu4kFDSkXY5pHBpSXUZFBnPCDq8Ewn2j1ZGIbaqpAVwfBRr48jaTQb6jbMyrK
	 gVi+yBD7w8NbiGxUZCj94J0xpWZ226USjcfL3Tx4RyywOV4WOJG8owUOWJ9OjnpXh4
	 Za6faAC4XOmnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: iio: imu: icm42600: Add ICM-42670-P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261002-b4-inv_icm42370p-v5-1-c65281b745c9@axis.com>
References: <20261002-b4-inv_icm42370p-v5-0-c65281b745c9@axis.com>
 <20261002-b4-inv_icm42370p-v5-1-c65281b745c9@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 12:01:52 +0000
Message-Id: <20261002120152.86BAB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: commit message incorrectly references 'ICM-42670-P'=
 instead of 'ICM-42370-P'
- [Medium] dt-bindings: incorrectly mandates 'interrupts' property for icm4=
2370p
--

commit b386c122ed876ee19ff8c304b5e2727ae3a6b215
Author: Kanak Shilledar <kanak.shilledar@axis.com>

dt-bindings: iio: imu: icm42600: Add ICM-42670-P

This commit adds support for a 3-axis accelerometer to the existing
invensense,icm42600 device tree binding. It updates the device description
and introduces a new compatible string.

> dt-bindings: iio: imu: icm42600: Add ICM-42670-P
>=20
> TDK Invensense, ICM-42670-P is a 3-axis accelerometer. The device can
> support I2C, SPI and I3C. This device has very similar properties as
> that of the icm42607/p. Add this device to the existing dt-binding and
> update the description to match the devices.
>=20
> Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370=
-p

[Severity: Medium]
Is there a mismatch between the device name in the commit message and the
actual hardware supported? The subject and body mention ICM-42670-P, but
the datasheet link and the added compatible string use icm42370p.

> diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm4260=
0.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> --- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
[ ... ]
> @@ -81,6 +82,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - invensense,icm42370p
>                - invensense,icm42600
>                - invensense,icm42602
>                - invensense,icm42605

[Severity: Medium]
Does adding the compatible string to this specific conditional block
incorrectly mandate the interrupts property for this device?

Device tree schema validation will falsely reject valid hardware
configurations that omit the interrupt line, preventing dtbs_check from
passing for those setups. Since the driver can operate in a polling-based
model for raw reads, it seems an interrupt might not be strictly required,
similar to the icm42607/p which was intentionally omitted from this block.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-b4-inv_icm=
42370p-v5-0-c65281b745c9@axis.com?part=3D1
