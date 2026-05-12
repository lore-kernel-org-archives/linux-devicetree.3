Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CF435A398
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628589; cv=none; b=tqjt/qCUuyqQrx5qDJQOStrbJPj0RWZjiEmimWw1yoQyhvUZgGiJb2IeZAEe4gVv4iDSUFh+7zhcKnFOcVnM2tOzJLxJl6vFc5/cF5o33xk9s2LqUNfczZQxMP5psCD6EpSij5JE9xwCkoq73e9qCpIEBrOaww1oYZEIIpE+sYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628589; c=relaxed/simple;
	bh=hDGHq5g8jROhclV+0ARV69u62kgBnJESy6IHiEclmRo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VqkTk4VlYmmYF0dnnh18PEPSjumfeMLTi9d467noG4WsljA/PxoAvQ0teKB5ZRjljf/Jezwsetf/26ro+fxSwEEqZaq/8GP+MIL7Tt9nxk5MrpCXgR0O8YFaFra9qFZ5nbBtUpyyOt4RhQQqEhDUYj5WSOwJMf6hKecNRdGUtXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0jk+2Ct; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0jk+2Ct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0879EC2BCB0;
	Tue, 12 May 2026 23:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778628588;
	bh=hDGHq5g8jROhclV+0ARV69u62kgBnJESy6IHiEclmRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=X0jk+2CthWs//Zw61HDIEQpMIVsTvYgA3boP0ds0iNk/gS+j2pvWNUbxOSPpRfOAe
	 fEllWHxiSYieYEXiDXCIr10s+Li/GYkGvJNZmrk+JrLRQw63sNCq/J7SClvH3mPZZD
	 H/uO6WbILklRUDw3h+tD4WsbUHJI1M4zvVWrH/OJ8kTxeEaDTwjZr95TETNaHrg6+J
	 1dAlpnQLAZhyLY/SNm56dGDsk8Xa2948zBIL6RASytaM5PSje3Y6KXzWRQugclG+zj
	 XqS5EuJWtw3heDS/kv+MlLPFYjjGfjskUBibGt0diVlyyluxyxR1Yir7wotuS2pKcI
	 38ZxO/e7qKr/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/6] dt-bindings: usb: ci-hdrc-usb2: Document
 nvidia,external-control property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260511135703.62470-2-clamor95@gmail.com>
References: <20260511135703.62470-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:29:47 +0000
Message-Id: <20260512232948.0879EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The vendor-specific property `nvidia,external-control` is not const=
rained to NVIDIA-compatible devices.
--

commit 2fc8a800ab9c1409217fd7f6b370e99b9cc6d3e7
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: usb: ci-hdrc-usb2: Document nvidia,external-control property
   =20
This commit adds the nvidia,external-control property to the ci-hdrc-usb2
binding. It is used to indicate that the controller is configured externall=
y,
such as by a modem requiring precise bus control.

> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Do=
cumentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml

[ ... ]

> @@ -75,6 +75,13 @@ properties:
>      type: boolean
>      deprecated: true
> =20
> +  nvidia,external-control:
> +    description:
> +      Indicates that the controller is configured externally and that th=
e host
> +      should not attempt to touch it. Usually used by a modem which requ=
ires
> +      precise bus configuration.
> +    type: boolean
> +

Could this property be constrained to NVIDIA-compatible devices using an
allOf block with an if-then statement?

Because it is defined at the top level of the shared binding, unrelated
device nodes could incorrectly include nvidia,external-control and still
pass schema validation.

>    ulpi:
>      type: object
>      additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511135703.6247=
0-1-clamor95@gmail.com?part=3D1
