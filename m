Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465CA4BF922
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846110; cv=none; b=Mtd3p1WW0W7TaJyqQRfpxvnNN/cYg6Bx6X9mDnjTXZSk+yEoKsPD2KHR5NunCY+JWxj9cybKmqbhrIAFaNkpnOtd2P2G0Cqie6Ds26JaIYB7HpWG/OKd+eE3aA5DJ8dHUR7SrMIsfyTtR69i/Fcpf7D2GZv3VhSTUP5gu6+Gz4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846110; c=relaxed/simple;
	bh=l0FHoCb1SivaYWmPaG/RUmwSUu9cnzQdYfEXwshRhnE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q1qST2ySfX28S6YfmiUE9XGOp82Smb8VlE9Z3AU7Ki2oqVyGXa986m11wBATA4BPBaVz/7S5x7lIJ62PtdDauBFEqinVJTZ/zDEdjn40/aQ53tkJqkJ9sCdPWAiRQfT1U0VLAYms8/AMwsfmcKYyPUFc6zK3SFX9Kp97PmA16aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+nS4eFZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+nS4eFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0021F000FF;
	Thu,  1 Oct 2026 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790846108;
	bh=j6VwoLQT4dFvoym2gNgzpzKzKmNqW1yb4zlPKSL0heA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D+nS4eFZpCw3l3XJkmyP7gyufqVH6zM0CkR0WHNjKf+0l0FThasBRrMFVcKn+KDVS
	 QQS/7+ijtGiCn+D5tfBVcU2X9q2ogyRQZuxZGS0hZ8X03JyCurFuj+k/luQ+z9+AWU
	 JNEfoMPBizvuhns3OKZFVSqqLgWfF9alU6wbncRBNsZUsAgA4NCmoqM3aEjkH2uI8x
	 W6RotDjzi8ZGb7JlCzBp+zCkHWostViu8TOz8aNyhoyhiYB8cie2ya9JsCgpgfUT4v
	 EG/d2jrUymQ8gbVRQpAs4uODS91nXdYhLYpgN4gpjFfAlXuwxeFnK+CitLmp8VVkJ4
	 eXTnyNB97FqZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: imu: Add bindings for ADI
 ADIS16607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001-adis16607-v1-1-9c89cee35d56@analog.com>
References: <20261001-adis16607-v1-0-9c89cee35d56@analog.com>
 <20261001-adis16607-v1-1-9c89cee35d56@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 09:15:07 +0000
Message-Id: <20261001091507.DE0021F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing adis16607-1 compatible string claimed in co=
mmit
--

commit 1526b61216e35843822d77abd26ffb5b695890a2
Author: Radu Sabau <radu.sabau@analog.com>

dt-bindings: iio: imu: Add bindings for ADI ADIS16607

This commit adds device tree bindings for the Analog Devices ADIS16607
Precision MEMS Inertial Measurement Unit. It defines the required SPI and
power properties, as well as optional clock, reset, and FIFO configurations.

>     Three compatible variants are supported: adis16607-1, adis16607-2,
>     and adis16607-3.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16607.yaml=
 b/Documentation/devicetree/bindings/iio/imu/adi,adis16607.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16607.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adis16607-2
> +      - adi,adis16607-3

[Severity: Medium]
The commit message explicitly claims support for three compatible variants
including adis16607-1. Is it intentional that adi,adis16607-1 is missing
from this enum, or was it accidentally omitted from the binding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-adis16607-=
v1-0-9c89cee35d56@analog.com?part=3D1
