Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEC844AB7A
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842956; cv=none; b=bdAMzubunXhipFXWLb6zhwuLjy6dN6Q8r3AlOIrww2iSyN5YYohnDjva+TYXfDXxjvvKFWoMJIqMp41WtNkRFKL2wdz27nE7q7NMW6dTHu8hjIucbiQJUR4cmASJaT0nzgUo/g/L38YvJUEwVQkg7Zt9C4kaRAmf46D1d06AhYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842956; c=relaxed/simple;
	bh=Jo4RHsc/1hkU8vc4Ld+INuF5x3Ahncpz4DviK4WoyQk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rKHPCfI7tKQq2mU6gWPE69rs8nyY5IiVGA3w5idxTBVncsGLiO9pf3TYS0z/RcAvSBv8WbwcAOiJw/C3pbfaZVJyEa7YAUr+1ULFSrqspGDtsYD80b+TmFECAKPayS5TKoIX8boIK0Y6mwLSzbm2G4yMtHuJHelc1DGACwqmKHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o23aRFvc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o23aRFvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6611F000E9;
	Tue,  4 Aug 2026 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785842954;
	bh=6JcNQs2WlbVMgSSl8SoLHT4nH7Wq2k3BE/RZ/sKOpEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o23aRFvcJR9SkFnXPwZ0HQEIJ/nEKCpj+Y4qXjX8aPsUxhN6VvHMQF1u7h/MDaqcp
	 Lla1SgbR/GVQEFMAcDxjvpwngs8Foqdw6FF4rI7S91DgHDPzwzttcEkM0nQFLNB8Ej
	 jJmw0IH51Eac+J/5syOUV8b/eVNFuRU4aoDpycQiqKxIOdMvZNVT6PTLVB6GxQwZsu
	 Pa72dVsTQqhWFQUX9Bbo3LSsbGr2AtDN6uf4Ivpc9kWhKjvE3u5FRu4/C0DV1oygVH
	 othYYgePFH+xqZVDU1d7XBLJ8Jo3NM5lTSAhJ47CqUOLf8lVwR5HfcWrdULZyrDzxE
	 JBWDUIvpwvkOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: phy: ti,phy-usb3: document aspcie
 reference clock setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Oberhollenzer" <david.oberhollenzer@sigma-star.at>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260804111849.92046-3-david.oberhollenzer@sigma-star.at>
References: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
 <20260804111849.92046-3-david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 11:29:13 +0000
Message-Id: <20260804112914.5A6611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Error handling in `ti_pipe3_acspcie_tx_rx_mode` breaks probe defer=
ral and causes warning spam on older device trees
- [Low] Schema Validation Incompleteness: `syscon-acspcie-tx-rx` allows inv=
alid device tree configurations
--

--- Patch [2]: [PATCH 2/2] dt-bindings: phy: ti,phy-usb3: document aspcie r=
eference clock setting ---
commit c7627fd3448f76b00b303ca95c47a9daed73d133
Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

dt-bindings: phy: ti,phy-usb3: document aspcie reference clock setting
   =20
Add syscon-acspcie-tx-rx property to the PHY bindings.

> diff --git a/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml b/Doc=
umentation/devicetree/bindings/phy/ti,phy-usb3.yaml
> index 84f538aa587c4..4fb017df28985 100644
> --- a/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
> @@ -52,6 +52,15 @@ properties:
>        enum: [wkupclk, sysclk, refclk, dpll_ref,
>               dpll_ref_m2, phy-div, div-clk]
> =20
> +  syscon-acspcie-tx-rx:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +    items:
> +      items:
> +        - description: Phandle to the system control module
> +        - description: Register offset of CTRL_CORE_SMA_SW_6
> +        - description: Setting for PCIE_TX_RX_CONTROL
> +

[Severity: Low]
Does this allow invalid device tree configurations to pass validation?

Because this is defined in the top-level properties block and lacks an allOf
conditional if-then block, schema validation (dt_binding_check) will silent=
ly
pass if this PCIe-specific property is incorrectly added to SATA or USB3 PHY
nodes.

Should this property be restricted exclusively to the ti,phy-pipe3-pcie
compatible string?

>    syscon-phy-power:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1

Also, looking at the corresponding driver changes that implement this new
property in drivers/phy/ti/phy-ti-pipe3.c:

drivers/phy/ti/phy-ti-pipe3.c:ti_pipe3_acspcie_tx_rx_mode() {
        ...
        regmap =3D syscon_regmap_lookup_by_phandle_args(np,
                                                      "syscon-acspcie-tx-rx=
",
                                                      2, args);
        if (IS_ERR(regmap)) {
                dev_warn(phy->dev, "can't get syscon-acspcie-tx-rx\n");
                return -EINVAL;
        }
        ...
}

[Severity: High]
Does this error handling break probe deferral?

If the syscon provider is not yet ready,
syscon_regmap_lookup_by_phandle_args() returns -EPROBE_DEFER, which is
converted to -EINVAL here.

Additionally, if the syscon-acspcie-tx-rx property is missing (which is
expected on older valid device trees), it returns -ENOENT, leading to
warning spam.

In the caller:

drivers/phy/ti/phy-ti-pipe3.c:ti_pipe3_probe() {
        ...
        if (phy->mode =3D=3D PIPE3_MODE_PCIE) {
                ret =3D ti_pipe3_acspcie_tx_rx_mode(phy);
                if (ret)
                        dev_warn(dev, "failed to set ACSPCIe TX/RX mode\n");
        }
        ...
}

Because ti_pipe3_probe() ignores the error code, does this mean probe
succeeds even if the syscon provider deferred?

This could lead to silent hardware initialization failure on systems where
syscon is deferred.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804111849.9204=
6-1-david.oberhollenzer@sigma-star.at?part=3D2
