Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F352D37EFFE
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741583; cv=none; b=M9fPBDMja/sgXP2IRNOBjA/ziYL2OAe9I6HsHOyqBBdfgLqwkXpLpUy8IID969uW/xI6jKekkNx2tK9p1Oc0gDBZLLZ01VQvkNN/ILvuJ0qmyc/HQJc4vhkeQRK58tZVpuL5+bnAE3YScZf51UhT0uFN9nN6X12btqTvpmp0MwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741583; c=relaxed/simple;
	bh=ctsht452c6f88GWXqXKxhn8GsieWgnvTq6eo5zpllUA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kykEe+B6PTVq/nc5+wd9GUL++phUCQCyYNVSbQGYPlkMiFabncHIstDiEppLcBwU74wbe3zVNmrzoQFAgagV+c3R6hmE6Vc8XQbaYXJ0LbnYy1bz5XyJoU28EK7VuFHrnhqXl+ggwSs5xaS/HeXsP8F7jhLVxKV9mtEjGTM+6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3Y3YeFW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3Y3YeFW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4781F0089B;
	Sun, 11 Oct 2026 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791741582;
	bh=0ZMQTZiCDw9lJgp52xiUnajYB/MOzJ8BgGqoO1Ifv64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J3Y3YeFWUF3NqSMMEy9KEkSKRaNKaX3AfumzjEx/fLPuh+wMAfbYZ+CJCR0BkwOQZ
	 QJvuVIsHJ3LnfQsqJWD42GiaFiU3aUJR/oSnEQgXYDLdJfbEpLvjEa79ujHTYGmglf
	 MNCXMO4HI8Ab4JrBjSIeruaLEwW9pQnIbhmnwJvMnFk64Pi2yPrVxuQPXTLqycngt/
	 GuKTm+dbSFgV9v057sYkNNRlFv/MKZJV8zCAcvwUi3oVNLHu8Y7Uihb8daHu58Qtmm
	 xhWGBWWsVYdQjMYRcxrR7HLcSeiDGEarjGfpKoszd5+4kXNHWPObx3xf/Uynv623lf
	 BL2OqWnK76ROw==
Message-ID: <sashiko-outbox-167365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011-dell-xps-9345-ec-v6-1-2a66a364fe70@vinarskis.com>
References: <20261011-dell-xps-9345-ec-v6-0-2a66a364fe70@vinarskis.com>
 <20261011-dell-xps-9345-ec-v6-1-2a66a364fe70@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 17:59:41 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: arch-specific include in schema example breaks externa=
l tools
--

commit 6a2d14c54cd528a2a30745160408a04834bb3011
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

dt-bindings: platform: introduce EC for Dell XPS 13 9345

This commit adds device tree bindings for the Embedded Controller found in
the Dell XPS 13 9345. It defines the required properties for communication
over i2c, including thermal channel mappings.

> diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,x=
ps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/d=
ell,xps13-9345-ec.yaml
> new file mode 100644
> index 0000000000000..3485117b505cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-93=
45-ec.yaml

[ ... ]

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <arm64/qcom/qcom-adc5-gen3.h>

[Severity: Low]
Will this architecture-specific include break external device tree validati=
on
tools?

Out-of-tree schema validation tools or downstream projects using these bind=
ings
(like U-Boot or Zephyr) will typically fail to compile the example because
they lack the Linux-specific arch/arm64/boot/dts/ tree and the associated
Makefile symlinks.

A search of Documentation/devicetree/bindings/ shows that other schema exam=
ples
strictly rely on <dt-bindings/...> headers instead of architecture-specific
paths.

Could this be adjusted to avoid the architecture-specific include?

> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        embedded-controller@3b {
> +            compatible =3D "dell,xps13-9345-ec";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-dell-xps-9=
345-ec-v6-0-2a66a364fe70@vinarskis.com?part=3D1
