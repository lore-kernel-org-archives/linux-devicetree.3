Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17863998BE
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420367; cv=none; b=J4yTgE9hk8jqJcSMRmgc+767m0xD0XT8baQgEPyoO9OulBNnziA4LTBhjlgQZPDPhlYi+H5fL5690cwb31vHmPaK/uoHsQkZ9C7YoTxNcucexHaKD7RKfXNCGL21W3uXSWXpBp00l8WtLI6Juop14p8cbrkhmOEw+YPKd1Ec8r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420367; c=relaxed/simple;
	bh=eTyFICg3JTE359zxYS96SZhsTuB5qDm/Zo2qttHDVoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dp37iLcE7ORn8+wQo2POr+FnfO+4Q9ull3mtZWftxZNHS3/8itwMAvHiGT9rlwCGqIfSZe4jP6S8qBPm6l2iMTghQunyxrF2n+r6bcBdPfZjOhLcTPPdpzewzLCcx3/s3vW3DsYxPaz539pdrHQxDwu/xJdQsbjiZF8ajixKNxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyMIb0lQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyMIb0lQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BEC1F000E9;
	Thu, 30 Jul 2026 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785420366;
	bh=jT21XeOmz0/Atl0bSB3o2ybF1OhRzFJplktQI969MbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gyMIb0lQ9Q5f006TbW7jOSabXP8Sz/T49vZAfJdDrOyhD34LjQYYyFJDjNWRGxY0r
	 UWJS2RhWAcloQNRiCs7ivi7SGkm16FyvEEK6hNo6kK3gpE0/Hdm/p3sXX59KtNRiNx
	 xosbKlGyFODwrDH8dZTYZaetC0Y8AHnIlKReJmhv+ifFpT00CVE1PBrhNNee/7aiAf
	 8eFq6SAtH82bx7qZztJpiYuuNQ46H9i6nCObuO9mdX93Zk0Z4DLRK1AUMQJOQ3V48s
	 RuS+1xFDsbutkOkPwtO5+ZmMhG7GBSUYf4BjF4URPkoJs0RC/IuiatZ0Yao/KEA4IR
	 Rm9wyy4/eJhwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mattijs Korpershoek" <mkorpershoek@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org
In-Reply-To: <20260730-phy-qcom-snps-femto-v2-8255-v1-1-8b8bf5105a68@kernel.org>
References: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
 <20260730-phy-qcom-snps-femto-v2-8255-v1-1-8b8bf5105a68@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:06:05 +0000
Message-Id: <20260730140606.08BEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing hardware-specific PHY tuning parameters for the Synopsys=
 Femto High-Speed USB PHY V2.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY=
 ---
commit 04bc91a6fe06261e099ae8fda1bb90e34d0f28fc
Author: Mattijs Korpershoek <mkorpershoek@kernel.org>

dt-bindings: phy: Add sa8255p high-speed USB PHY

This commit introduces a new device tree binding for the Qualcomm SA8255p=20
Synopsys Femto High-Speed USB PHY V2. It specifies that the hardware uses=20
SCMI power domains to manage resources like clocks, interconnects, and=20
resets, rather than defining them individually.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-ph=
y.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
> new file mode 100644
> index 0000000000000..09f7ca6e7f727
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - power-domains
> +  - power-domain-names
> +
> +additionalProperties: false

[Severity: Medium]
Since this IP block is still the Synopsys Femto High-Speed USB PHY V2,=20
would board configurations for this platform still need to apply standard=20
hardware tuning parameters (such as qcom,squelch-detector-bp)?

While clocks and resets are abstracted into SCMI power domains here, the=20
memory-mapped reg space is still provided and typically used to program=20
these signal characteristics. With additionalProperties set to false,=20
schema validation will fail for any board device tree that attempts to=20
override these valid PHY tuning properties.

Might it be necessary to include these tuning properties, perhaps by=20
referencing a common schema, so that boards can safely tune squelch=20
detection and pre-emphasis without triggering validation errors?

> +
> +examples:
> +  - |
> +    soc {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-phy-qcom-s=
nps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org?part=3D1
