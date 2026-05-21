Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D2038422A
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 04:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779336923; cv=none; b=VPq+cojEB8mu9d7TqZMFRAOT5K6nAQeJR6AAcpQUf1dgWqy7VUqtLn5U7m4q3XmtimgSHiNUqHc3OHByiYLEC8HiqSiPSHliJOSdF3PG+C9L67XQbovZrpcTjLjHhk00MW3J7PhTXeyfZqPGwHZqELY2XXyKfl/WreA3zbtLQu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779336923; c=relaxed/simple;
	bh=xbniOk9nqT3tKYgM7/R98IXBeNPrjxhNV+8A4WUfdOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SvVDn+/jRrGSzO654JGNglWI0+IxLkg18rWs5LLv8tlnhtwRnYKmkd7Fi0GDlVOSku5weFcSpoUzWgyUQNUv9p4LtZIsDFNSRV+EeYvbnmsqa//A5Erdx0p11OoygzM4TUiIhnAvUgESOgQqMY4jHUE6Omd2EPWzGE4NG0bGZEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2hpcDqO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2hpcDqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84131F000E9;
	Thu, 21 May 2026 04:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779336921;
	bh=aXW5+zQtZ+MABOKoJanBcoirUL929kC3vEj1nDyct4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2hpcDqOBLA+oDSgdT6S2z73v2iCgKclVTPZUQczEtlmjMcNc0gY4zxmTUmuGEh3T
	 vJXh15I4mWbSU4DIPjckCFZDntIpQVOF64dXAy6qEJg6Mv7u+tKiZKMUb61mvoTjvH
	 C91GqB2yl6uYdz9poff2cpDsNbQvnWNb8VaRtjEjvsSdsyZD3rnhn+jXhQTIWrGrWV
	 Nbc8lQQJecZta1NJXe2zojvun8/rJpM1C1EZ9mUHPCEYugGvg2xPnj0C11BC9BEYBD
	 gmG9LHjVx+gzA40V84a8kou3fF/4v1SKbFKD7HM8B/gakxob+Sibdth0RRoUoBRS2n
	 msiw1k8yUck1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: i2c: snps,dwc-i2c: Add StarFive
 JHB100 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521034340.27837-2-lianfeng.ouyang@starfivetech.com>
References: <20260521034340.27837-2-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 04:15:18 +0000
Message-Id: <20260521041520.B84131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The patch introduces a redundant device tree binding schema (`snps=
,dwc-i2c.yaml`) and a duplicate generic compatible string (`snps,dwc-i2c`) =
for the Synopsys DesignWare I2C controller.
- [Medium] Compatible strings are incorrectly used to encode the operationa=
l mode (master vs. slave) instead of describing the hardware IP variant.
- [Medium] FIFO depth properties (`dwc-i2c-tx-fifo-depth` and `dwc-i2c-rx-f=
ifo-depth`) use an invalid and unregistered vendor prefix.
- [Medium] The custom property `starfive,mctp-i2c-ms` improperly uses the s=
tandard `-ms` suffix for a `phandle` reference and lacks an explicit type d=
efinition.
- [Medium] Missing constraints for the slave-only property `starfive,mctp-i=
2c-ms`.
--

commit 7e9b926c17cf1f417236a77e427787e7ba5331b1
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>

dt-bindings: i2c: snps,dwc-i2c: Add StarFive JHB100 bindings

Add device tree bindings for the Synopsys DesignWare Core (DWC) I2C
controller and its StarFive JHB100 implementation. The binding introduces
a new compatible string for the generic IP and two platform-specific
compatibles.

> diff --git a/Documentation/devicetree/bindings/i2c/snps,dwc-i2c.yaml b/Do=
cumentation/devicetree/bindings/i2c/snps,dwc-i2c.yaml
> new file mode 100644
> index 0000000000000..7227f24f7cbe0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/snps,dwc-i2c.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 StarFive Technology Co., Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/snps,dwc-i2c.yaml#

[Severity: High]
Does this introduce a redundant binding schema?

The Synopsys DesignWare I2C controller is already documented under
Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml with the
generic compatible string snps,designware-i2c.

Creating a parallel schema for the same hardware block might fracture the
hardware description and bypass existing constraints. Could the StarFive
JHB100 variants be added to the existing designware-i2c schema instead?

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Generic Synopsys DWC I2C controller
> +        const: snps,dwc-i2c
> +      - description: StarFive JHB100 I2C master controller
> +        items:
> +          - const: starfive,jhb100-dwc-i2c-master
> +          - const: snps,dwc-i2c
> +      - description: StarFive JHB100 I2C slave controller
> +        items:
> +          - const: starfive,jhb100-dwc-i2c-slave
> +          - const: snps,dwc-i2c

[Severity: Medium]
Are these compatible strings encoding the software operational mode rather
than describing the hardware IP variant?

Since the hardware natively supports both modes, shouldn't the operating
mode be dynamically determined by the framework or described using standard
subsystem properties like an i2c-slave sub-node?

[ ... ]

> +  starfive,mctp-i2c-ms:
> +    description: |
> +      The property should contain reference to the master node associate=
d with the slave.
> +      This value is only used in slave mode, especially for MCTP applica=
tion.

[Severity: Medium]
Does the -ms suffix conflict with dt-schema evaluation? Properties ending
with -ms are strictly evaluated as a time unit in milliseconds, but the
description indicates this is a phandle reference to a master node.

Also, is there an explicit type definition missing here? Custom properties
intended as a phandle typically require an explicit
$ref: /schemas/types.yaml#/definitions/phandle.

[Severity: Medium]
Furthermore, since the description states this value is only used in slave
mode, should there be an allOf/if-then block added to enforce this
restriction based on the compatible string?

> +  dwc-i2c-tx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The property describes the tx fifo depth.
> +    default: 8
> +
> +  dwc-i2c-rx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The property describes the rx fifo depth.

[Severity: Medium]
Do these properties use an invalid vendor prefix?

Custom device tree properties must begin with a recognized vendor prefix
followed by a comma. Using dwc-i2c- without a comma violates core device
tree naming constraints. Should these use a registered prefix like snps,
or starfive, instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521034340.2783=
7-1-lianfeng.ouyang@starfivetech.com?part=3D1
