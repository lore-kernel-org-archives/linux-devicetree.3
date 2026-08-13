Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6950B369D5C
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636894; cv=none; b=Ufc0lH9fbP+Jx66EuFaJHKnQ/HKfh/RwNvcJNca//DSpBec1rmKAPIPX0ekyGPbc72AhIyzq+pKQjxLuYQ7gMZvrr3bsF11Qf2tQZnyn72d5q+rhD/HJnhca6tEQDTltUnwxkeyDN0wqWOhUq83aILv3h285kZL3t02ARSc9UB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636894; c=relaxed/simple;
	bh=TGwkcinbuwau43H5MH57S0sldYCfJklnSf1RqAEP3qM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z8scdzGqO0xMJP+85ZcLmQfu6AGFW2o4K9sPoSto5zCHn7kYUY/u2HlsM8KVxJz1dp6LPy3YdSwyLU0a3cFQW34ISo2DvqU2KMU2zGc+seXsAmAYnIW/L1sScgN5QlU541Kw4KOVTF4JSzNjvWBC5pr7/Sa7Ljrcx8NYvy7UV+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZ2Jzypg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZ2Jzypg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F8D1F000E9;
	Thu, 13 Aug 2026 16:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786636893;
	bh=ywQiAaQAMC8Ddl/lEYCVKomfWsFAdcGmLqRlDEYM5DE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BZ2JzypgqFs+zeQdbK2QIcRyHp3G66x3x0IhJ39d6P424fO4CAoPuqcvPkFFSv32X
	 7kdT/eYMG+pwZSfPd29l3l6bLnv9Y12lnR/ht0Sugd2bzc19Gn1Ft5wrbUHB+c34SC
	 OAeWiYkJrO5/yNs1YXoqedAgEpDWRgx+/XtZxZkbiZehphke56y3ISevePqtjgs+m8
	 a30jOJg5YNw9fGDD208PstCR0XgSYn60jaURuVoaX+vM7yvklJOce2Tz4YUQhmUHzS
	 xrlRY0G/oXoBdrsxX53L1MqMrdsepvMn0zXheGzIrw8ppg+lLWHNk5h0bURjzhot4s
	 tJxCLKlHrowPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-i2c-qcom-slave-v3-1-1d3742e2ad47@oss.qualcomm.com>
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
 <20260813-i2c-qcom-slave-v3-1-1d3742e2ad47@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 16:01:32 +0000
Message-Id: <20260813160132.D8F8D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The I2C target controller binding prevents instantiation of I2C =
slave backend child nodes by using `additionalProperties: false` and omitti=
ng `#address-cells`, `#size-cells`, and a reference to `i2c-controller.yaml=
`.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: i2c: Add Qualcomm I2C target con=
troller ---
commit 554673beb1cac58de736368fdfcb491254cb8342
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

dt-bindings: i2c: Add Qualcomm I2C target controller

This commit adds a device tree binding for the dedicated I2C target
controller found on QDU1000 and related Qualcomm SoCs. It documents the
MMIO region, interrupts, clocks, interconnects, and pinctrl states.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-targe=
t.yaml b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
> new file mode 100644
> index 0000000000000..9a6b08f0ab0e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - interconnects
> +
> +additionalProperties: false

[Severity: Medium]
Does this strict additionalProperties: false prevent the instantiation of
I2C slave backend child nodes?

Because this rejects properties like #address-cells and #size-cells, any
device tree that defines I2C target clients (such as slave-24c02) as
child nodes to this controller will fail schema validation.

Should this schema reference i2c-controller.yaml and use
unevaluatedProperties: false instead to allow standard I2C slave backend
instantiation?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-i2c-qcom-s=
lave-v3-0-1d3742e2ad47@oss.qualcomm.com?part=3D1
