Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B233DEC0
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658061; cv=none; b=eKMGSPUacCzE2bkzd+tKBnvRC73Mfqlxsc92lPNuCLOH5ztgaYxonJs4a5DanlaPgv/pg1vmRaL6UbrhBKb8iiG+UBFpwsJIRKaKr/wHADUJNS6Pq5qRkDulnt9zKbDb6KdzKbA/y3jhx6od4/1OsrLnoQi0/uSOt/tRprhg2Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658061; c=relaxed/simple;
	bh=56D6iKAzMLlOYnK3SP36RY8eaqiNULQiQtpKVqIxMp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jbz6IFWMimrPNGVxzA/Oiepw8MjQs4vzcFME2ByggXxLoCNbkyJb/78HrPOzFKEow99CPl+DNsR8aLymAFrEUJd1JyGFAcn4scMSiU+erehOkS7fHQM6XoTgl6bvPB0sdpKPmBIjcO+i9ZTpBJhcBeldrDhkxl6DK+nYPuC5MQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbGST0xr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbGST0xr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CD51F000E9;
	Sun, 28 Jun 2026 14:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658059;
	bh=J1dM9F8Pe16Hsi0iTu10ZA2J8xs67YZqnQ4BzVKZ234=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lbGST0xrdUI2Gef3dTaZnMARdUdvnUxn7D2NV3Z6UPuBOPvY0WXQd8kFdi/MY51On
	 n/W3sjwSEBwXOoqdwBmAutc6U3oz3Ihrr31SuqJ3evNIxerSuNwFBWpQXM0mHhrqSb
	 LX2GcSqSr3ysOSAr4POfYmNdSGSPe1plzF3tHTI1UsRxUrcvFWWmzYKVt1qoswilDK
	 NppvAOCc7tYvm4FQpSISxg6UHqsQ+8tXYccqfkFozpaa5YbG5TRu5/EkhFcDG4D6m7
	 OrlXwBWjlHrABDKy7pN5PmmtP4KMUiax6+oQHvPX14yp4aO6qaa7R4tsMny0fwXP1I
	 Z2KkWIPcI9Ocg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: i2c: Add Qualcomm I2C slave
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 14:47:39 +0000
Message-Id: <20260628144739.96CD51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The binding conflates the I2C controller and the logical I2C slave=
 device, violating the standard Linux I2C slave device tree model.
- [Low] The compatible string `qcom,i2c-slave` is overly generic and lacks =
an SoC-specific identifier.
--

commit cd018ae5e3845f1ec68c4429fb88f4e263862a30
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

dt-bindings: i2c: Add Qualcomm I2C slave controller

This commit introduces a device tree binding for the Qualcomm I2C slave
controller on the QDU1000. It defines properties for the slave address,
clocks, interrupts, and interconnects for a hardware block that operates
exclusively as an I2C slave device.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml b/=
Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/qcom,i2c-slave.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm I2C Slave Controller
> +
> +maintainers:
> +  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> +  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> +
> +description:
> +  The Qualcomm I2C slave controller is a dedicated hardware IP found on
> +  Qualcomm SoCs that operates exclusively as an I2C slave device on the =
bus.
> +  It supports FIFO (PIO) mode for data transfer and does not function as=
 an
> +  I2C master.
> +
> +properties:
> +  compatible:
> +    const: qcom,i2c-slave

[Severity: Low]
Is this compatible string overly generic? Including an SoC-specific identif=
ier
like qcom,qdu1000-i2c-slave alongside a generic fallback is standard practi=
ce
to handle potential future hardware variants or quirks and avoid ABI breaka=
ge.

[ ... ]

> +  qcom,slave-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The 7-bit I2C slave address programmed into the controller's device
> +      address register. This controller operates exclusively as an I2C s=
lave
> +      and has no child nodes, so the standard 'reg' property cannot be u=
sed
> +      to convey the I2C address (it is already used for the MMIO register
> +      range). The address is configurable at runtime via a hardware regi=
ster.
> +    minimum: 0x08
> +    maximum: 0x77

[Severity: High]
Does this custom qcom,slave-addr property bypass the standard Linux I2C sla=
ve
device tree model?=20

In standard I2C slave bindings, the address is specified via a child node
using the reg property with the I2C_OWN_SLAVE_ADDRESS flag. This allows
standard I2C slave backend drivers like slave-eeprom or slave-testunit to
attach correctly.

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - qcom,slave-addr
> +  - interconnects
> +  - interconnect-names
> +
> +additionalProperties: false

[Severity: High]
By setting additionalProperties: false and implicitly forbidding #address-c=
ells,
#size-cells, and child nodes, are we entirely locking out the standard I2C
slave framework?=20

This design appears to conflate the I2C controller with the logical I2C sla=
ve
device, which could force driver implementations to bypass standard reg_sla=
ve
and unreg_slave APIs in favor of registering non-standard adapters.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-i2c-qcom-s=
lave-v1-0-8b0a5c01f9f6@oss.qualcomm.com?part=3D1
