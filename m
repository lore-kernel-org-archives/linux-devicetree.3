Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC789221723
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780746561; cv=none; b=XjivM1a0aWpxXPCLARuQsTxiPV8bSfRo1RAYhcOD6bt75/zFUsVFGmEFM+OwG4+87B9V1wzFqivO+ERJWE+XmlR3BbxnZRnnMscjYibkGFJvDR33pge7CK9bb4+qKPUGy7iRe+OxM7VKdAOvOG0MIZw3waGfXe6KcDYy0TMegqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780746561; c=relaxed/simple;
	bh=+sgciOfX/5DtcUjVo7WBsQ8KitXhVbGyMTaqn5/vLJU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NMGcXwa2uZEPahDLbyXQuqDCcTa6Jv9ZnwY6mIoMiPPqkVeb3O/12nuk1+QKbr6DyZ9ni2pwUGRlDtPMvQMtxf2Xez+nHq0ChUNqGRztn5sUcrUy+pMimfREXvj7/fV/Co2jdkBaO4KiHgog2hqZzXDsEVkzAxArxuYXauQOY1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPQhM9bO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPQhM9bO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6CA1F00893;
	Sat,  6 Jun 2026 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780746560;
	bh=b8Lpbnc0quocKbCjRw4GZYiu6nix+4mWQd4HsGebYOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JPQhM9bOqC1xZ0Ze1DSIq396qAbtYIKbCt+qac47zqcWM9aPcILCdQq/hb7wLGSzm
	 5MED+HSRjDLlC0osT3vxBciUAoefcEQBIsr4DrPGa6+6XeFSFnhxdk8/bDDhks1bN4
	 IF1T5dDkDRwyBisJ+kLZ27Y/FAmyiVHiMDBu2ku2W0J2SRlkObu8zQuzKEaykrH3LX
	 vrG+IikGSAtrPuiqZzZRMF5ZQIOZ+YLNfTO+PxrURr/KiZB0HQXlQHXk9lopVHYYKM
	 RBiwcF44YJMwQjYsAMTABRFXlZZinkft2pLD7mdxnIw1PpFBlRNtvA0RrDBKPWaGQy
	 ssynLy/6gndIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: net: add Realtek r8169 family PCIe
 Ethernet
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Pardini via B4 Relay" <devnull+ricardo.pardini.net@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-1-8a8857b39daf@pardini.net>
References: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-1-8a8857b39daf@pardini.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 11:49:19 +0000
Message-Id: <20260606114920.2E6CA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding uses `additionalProperties: false` alongside a `$ref` t=
o `ethernet-controller.yaml#`, which incorrectly restricts inherited standa=
rd Ethernet properties and forces their manual duplication.
--

commit 766e9c110aa2222534264bb4b3a784c0a71fcff4
Author: Ricardo Pardini <ricardo@pardini.net>

dt-bindings: net: add Realtek r8169 family PCIe Ethernet

Adds a device tree binding for fixed/soldered Realtek PCIe Ethernet control=
lers
driven by the r8169 driver. The binding supports Open Firmware PCI bus bind=
ings
so board DTs can validate attached properties.

> diff --git a/Documentation/devicetree/bindings/net/realtek,r8169.yaml b/D=
ocumentation/devicetree/bindings/net/realtek,r8169.yaml
> new file mode 100644
> index 0000000000000..6923211ff4c93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/realtek,r8169.yaml

[ ... ]

> +allOf:
> +  - $ref: ethernet-controller.yaml#
> +
> +properties:
> +  compatible:

[ ... ]

> +  reg:
> +    maxItems: 1
> +
> +  local-mac-address: true
> +  mac-address: true
> +  nvmem-cells: true
> +  nvmem-cell-names: true

[Severity: Low]
Is it necessary to redefine these properties manually? Since the binding
already includes a $ref to ethernet-controller.yaml# in the allOf block,
these standard Ethernet properties should be inherited automatically.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Low]
Does using additionalProperties: false here prevent the inheritance of
properties from ethernet-controller.yaml#?

Using unevaluatedProperties: false instead would allow $ref schemas in the
allOf block to be evaluated properly, which would remove the need to
duplicate the mac-address and nvmem-cells properties above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-rk3588-dts=
-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net?part=3D1
