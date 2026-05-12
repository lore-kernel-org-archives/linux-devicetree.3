Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15F135A398
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628592; cv=none; b=obO9jpJl3v0U73jHA8jKH1tKrtOcMx8tVz4oDqI7EvB30409Tn8pI5LJlp7wZ7lGRu1wuLH0qQ1x5jx4LsFPtw271NDxYVP+9WEQk+gj0Eff6nY2kZQ38q0j0sI/P3xrHjg9J/LZw6WaqZhETcroCgdwnxaoNj8GbiTEf8DIVN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628592; c=relaxed/simple;
	bh=syKLuGDRGscz2GehBpsOZA1GkzCsscUZh27M1QouD1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XiSoPilk2sQlpHk8/T59RbBTa+7rvUnp5un+ADoa7BHeAL9GdPVqTZXC5C+oeewN81NKmhnsQCMNz36Wg7CPmuYBxZtt97STu4YjYrv9//JxVSSo0ZtXnmUKklejFXQ9sPbLB2o6+FclisI9ykR8yZsZgEtUxLnkalT+HPjNsCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aanX5/0j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aanX5/0j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E53C2BCB0;
	Tue, 12 May 2026 23:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778628592;
	bh=syKLuGDRGscz2GehBpsOZA1GkzCsscUZh27M1QouD1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aanX5/0jra4bYTzK84s1EysU/5Qfk9f+VBt4aYs7QJgxEh3OzIWAG+RMan9BmyOq3
	 7pMaUQU7tSdoEHSoNzrtDXjNlJvtpkb413MhuWLWQmsSXZRENojgVmaSAQAtJeWDPv
	 UM1qlSv4Mf0CYzctKIFjXyu9Lzjvk59bK2gyy29AFk0QnliogH5ZsUWZ2z8v1fG1oJ
	 WTCZlgbEcZQT97ujQ+p2kaeGTEtQaSTvW5hgmKOdIUlwZ1JSdk6S+hZxz93z1V8WQI
	 oU43/BL0r73Ars7Gk0y7T+JmIjQLmGL1b50BZMDyy3FcbPEGtbia2v62PdPJsNageC
	 Y6nJHaNJ541FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/6] dt-bindings: phy: tegra: Document Nvidia Tegra
 XMM6260 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: krzk+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260511135703.62470-6-clamor95@gmail.com>
References: <20260511135703.62470-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:29:51 +0000
Message-Id: <20260512232952.02E53C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The binding models an external USB/HSIC modem as a standalone, vir=
tual 'PHY' node instead of representing it accurately in the hardware hiera=
rchy.
- [Medium] The `nvidia,usb-bus` property groups two unrelated phandles (USB=
 controller and USB PHY) and introduces a reverse-dependency.
- [Low] The compatible string `nvidia,tegra-xmm6260` uses the incorrect ven=
dor prefix for the hardware it represents.
- [Low] The `nvidia,usb-bus` property is defined as a `phandle-array` but l=
acks the necessary `items` description to define the cell count, leading to=
 a `dt_binding_check` validation failure.
--

commit 9a3c0eae039eb5a94c2d0ec7ecce7c586c326f99
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: phy: tegra: Document Nvidia Tegra XMM6260 PHY

This commit documents the XMM6260 PHY binding, a hardware configuration
used in Tegra SoCs to control power sequencing and manage the USB lines
for the modem.

> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.y=
aml b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
> new file mode 100644
> index 0000000000000..0346433c97725
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/nvidia,tegra-xmm6260.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nvidia Tegra PHY for XMM6260 modem
> +
> +description:
> +  A hardware configuration used in Tegra SoCs to provide proper interact=
ion
> +  between the application processor and the modem, as well as control ov=
er
> +  one of the SoC's USB lines for the modem.

Is modeling this external modem as a standalone virtual PHY node the best
approach for representing the hardware topology?

The device tree should describe physical hardware hierarchy. Since the
XMM6260 is an external modem connected to the host via a USB or HSIC bus,
it would traditionally be modeled as a child node of the USB controller.

Handling power sequencing by creating a virtual PHY node is a known
anti-pattern. Power requirements are typically managed by the USB subsystem=
's
device tree bindings or a generic power sequencing framework.

> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra-xmm6260

This isn't a bug, but the XMM6260 is a modem manufactured by Infineon/Intel.
Should the compatible string use a vendor prefix corresponding to the actual
manufacturer (e.g., "infineon" or "intel") instead of "nvidia", since this
represents an external component rather than a Tegra-specific SoC block?

> +
> +  enable-gpios:
> +    description: GPIO connected to the EINT1 pin
> +    maxItems: 1
> +
> +  nvidia,usb-bus:
> +    description:
> +      Contains two phandles; the first is pointing to the Host's USB con=
troller
> +      and the second linking to the controller's PHY.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 2
> +    maxItems: 2

Does this custom property introduce an unnecessary reverse-dependency in the
device tree?

Standard bus hierarchy dictates that relationships are established naturally
via parent-child nodes. Pointing an external device back to its host
controller via a custom phandle is a non-standard way to represent a bus
connection. Additionally, grouping two distinct hardware components (a host
controller and its PHY) into a single phandle array mixes unrelated
references.

Can this property definition cause a validation failure during
dt_binding_check?

Because this is typed as a phandle-array, the dtschema validation framework
will attempt to parse the array elements by looking for a
"#nvidia,usb-bus-cells" property on the referenced target nodes (the USB
controller and PHY). Since those target nodes won't define that custom cells
property, the example schema validation is likely to fail.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511135703.6247=
0-1-clamor95@gmail.com?part=3D5
