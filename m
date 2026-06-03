Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79824481666
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500349; cv=none; b=TxOrFqELl7bCnpdkIkIyZNrqraRW6vntKGQvWNLpLKzTJn8Zld26UM8sp51Ha4dIc/1t4/rVJnBvjRqH2GPHby0LcxvM7puSabsAHJrAMvBlnZ+iKl30Lru0MGg0Z6SYJXo2mEz24PuvcUX9YjRWeaef9dAVNdGXn4gen0zQYN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500349; c=relaxed/simple;
	bh=kKloFVCaiKG+kGGB8rUxNo34buj3l6r5bwHP0aGTF7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WAzvvugvPLNeMhiOkRdd+48Y2ACYNl4MUx5fETg+lk9LdqB2rvo1pV0PhBAsTqhu/hNUdzViG88fyTHCRk39x4n/gBlZX0Vicumw2jJ5f9ST/rGgkbu2nxk8Aeq5a4HiAVlDLjEBDRWb72fqrFjKfTrMSZ7EgorDKI+vFI16dN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k968FMKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k968FMKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3A21F00893;
	Wed,  3 Jun 2026 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500348;
	bh=ofPmF4+K8UqFjEK/81C7AUMVRYErpaCgt/ByZosArsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k968FMKeN6Q7LG+x5BqtlUjtoCTT+HRfscSKVMO5IXb3ZXWFRREzXnse1GKpDg3uJ
	 CNe3h6NLMpK8DfcFg1zz2EsM/ybbBKVtfXH2eB4ocdlamjBnzW0BnsmJxshvfMTRFM
	 sFjJDQUw9y3/kRg0HzPW8+UmdZ0RANvf+pVRsg+QzkrWRy9PeFzDKHSh08QlahF5Yk
	 VYToI6YBa1M11Y0e8fUepxgjopiYW6vnTESxG8eDnUbTx0tnUYTpps6HdUbIjkRuqG
	 fQisf8woHCawJ+rH/50mUySvGxjH2IxirgYKFHc2pWWoy+/iXtX01cUWiKO2cDlnDr
	 aZ03H8KJOCesg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
References: <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:25:47 +0000
Message-Id: <20260603152547.CB3A21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The binding incorrectly defines and mandates generic clock confi=
guration properties (`assigned-clocks`, `assigned-clock-rates`).
- [Medium] The compatible string `qcom,clk-gp-mnd` is too generic and lacks=
 an SoC-specific identifier.
- [Low] Generic pinctrl properties (`pinctrl-0`, `pinctrl-names`) are marke=
d as strictly required.
- [Low] The `pinctrl-names` property is restricted exclusively to the `"act=
ive"` state, omitting standard states or an inactive state.
--

commit 3c2905ca3a8455710ab289217cbf668b7b5c48ce
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider

Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
clock divider. The hardware generates a fractional output frequency
from a fixed input clock with a controllable duty cycle.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
> new file mode 100644
> index 0000000000000..c1688bb3d68d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: qcom,clk-gp-mnd

[Severity: Medium]
Should this compatible string include an SoC-specific identifier?

Devicetree guidelines usually require an SoC-specific compatible string
(e.g., "qcom,sa8775p-clk-gp-mnd") even when a generic fallback is provided.
This ensures that future hardware quirks can be handled without modifying
existing shipped device trees.

[ ... ]

> +  pinctrl-names:
> +    items:
> +      - const: active

[Severity: Low]
Does restricting this to only "active" prevent the core framework from
automatically applying the pins?

The standard pinctrl framework usually expects a "default" state to apply
the configuration upon device probe. Omitting it forces the driver to
manually apply the state. Additionally, this prevents defining a low-power
state (like "sleep" or "idle") for suspend or driver removal.

> +
> +  assigned-clocks:
> +    maxItems: 1
> +    description: Parent clock phandle used to set the input frequency.
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +    description: |
> +      Rate for the parent clock in Hz.
> +      Supported rates: 19200000, 9600000, 6400000, 4800000.

[Severity: Medium]
Should these generic clock configuration properties be explicitly defined
here?

Properties like assigned-clocks and assigned-clock-rates are common core
device tree directives. Defining them in the binding enforces software
configuration policy rather than describing the hardware.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - clock-output-names
> +  - pinctrl-0
> +  - pinctrl-names

[Severity: Low]
Is it necessary to strictly require the pinctrl properties?

Since pins can sometimes be pre-configured by earlier boot stages or
firmware, mandating them as required can reject valid hardware descriptions
unless the hardware is fundamentally non-functional without OS-level muxing.

> +  - assigned-clocks
> +  - assigned-clock-rates

[Severity: Medium]
Should generic clock configurations be mandated as strictly required?

Because these define software configuration policy, requiring them will
wrongly reject valid hardware descriptions where the bootloader has already
configured the clock or the driver relies on a default rate.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-pdm_clk_gp=
_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com?part=3D1
