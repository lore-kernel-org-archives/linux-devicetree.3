Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C542D3AA50A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286644; cv=none; b=uCIyaHxAQTUgczZ8BddaVJXNh+pHkxXnIFwp/gNpwYlcLwMNf2UX435ln6t38ubaOCQ3syjbsc3SBhfbwOamO5RgXzWjfKlVuBi87rLXHj7BI9hEwd7i6oT2Sa9rYA6w7RO2n0xWbj95kXSfGbHkYv/6QdnKzxKlLKEFi8NeL7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286644; c=relaxed/simple;
	bh=LinDNEQSdchdKnLboPS5A7mOdsrX9dN9gW7TfyKTsBY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QKpQRTJp7OaENrnfiLQqG6l6l/Csi4+urIdfoqoHS0M2MQgYO4xbJFw/olwUeiLJTIicJDKM/cDQ3ENalLynqt2NRM2QFZ/BwkE824iOvLUPzu4T5/lhFN4Kzwxzp8Srwx/lRxFUksSUPqSCcRBr5BV090lH1dgN3jXAcvznkT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6lJyKjZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6lJyKjZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2921F00A3A;
	Fri, 17 Jul 2026 11:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286642;
	bh=cwwY2OZpkNKIB4qmNeRcaCgRMJwuI8rUnOERUeFhDKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E6lJyKjZkXuV9U2deRpfqwWwivoQYmFQkXPTnW6d8rEd8CJGjKyAdw4apT30R1y6Y
	 +W3MdrtHFGAS1+fpuEodo6GO7kjLJpI782K1CPMvnkKAGdMPm/GIBlfSqfdlrZ4YZN
	 r1X82rJ/C8YDvykSl/ykgxM6KchBp90bY3x71HSxUaHA0h9Qkcz9h9F8eteFIlbfBi
	 jcch3yx+gmJbTR7EBWCBJ58tPZuGgXFFUhdCLOmpgIcDAGdMyFSg7x1mxQ1F2oLuFK
	 tM95EGkwbXCQ+QC29731jvT1O7EBZHrJPXUIvbmRIm7x4IpMbdegYFh8OaojrS0wxM
	 fCGycjW540Gag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: i3c: dw: Document missing optional core
 reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260717105829.567522-1-shubhamsanjay.patil@amd.com>
References: <20260717105829.567522-1-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 11:10:41 +0000
Message-Id: <20260717111042.3C2921F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The dt-binding specifies the APB clock name as 'apb', but the driv=
er attempts to fetch it using the name 'pclk'.
- [High] Mixing devm_clk_get_enabled() with manual runtime PM clock togglin=
g causes unbalanced clock disables.
--

--- Patch [1]: [PATCH] dt-bindings: i3c: dw: Document missing optional core=
 reset ---
commit 3d9cd37483dab62bf65ce3e70bf1ff17d3bd87d7
Author: Shubham Patil <shubhamsanjay.patil@amd.com>

dt-bindings: i3c: dw: Document missing optional core reset

The DesignWare I3C master IP supports a core reset input, but the
binding is missing the corresponding reset description. Document the
reset property and name in the binding. Keep the reset optional because
the reset line is integration-specific.

> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index e803457d3f554..822faf8d221b8 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -38,6 +38,12 @@ properties:
>    interrupts:
>      maxItems: 1
> =20

[Severity: High]
This is a pre-existing issue, but I noticed a potential mismatch between the
DT binding and the driver for the APB clock while reviewing this file.

The binding enforces the name 'apb':

Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml:
      - const: apb

However, the driver requests it by the name 'pclk':

drivers/i3c/master/dw-i3c-master.c:dw_i3c_common_probe() {
    ...
    master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");
    ...
}

If a device tree is created strictly following the binding using clock-name=
s =3D
"core", "apb", won't dw_i3c_common_probe() fail to find the "pclk" clock?

Since it is requested as optional, the probe will succeed but subsequent
register accesses will occur without the APB clock enabled. Could this lead=
 to
a synchronous external abort or system freeze during operation?

> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: core_rst
> +
>    power-domains:
>      maxItems: 1

[Severity: High]
This is also a pre-existing issue, but I noticed a potential runtime PM
imbalance with how the clocks are handled in the driver.

The clocks are acquired using devres, which ties enablement strictly to the
device lifecycle:

drivers/i3c/master/dw-i3c-master.c:dw_i3c_common_probe() {
    ...
    master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
    ...
    master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");
    ...
}

However, they are manually disabled during runtime suspend:

drivers/i3c/master/dw-i3c-master.c:dw_i3c_master_runtime_suspend() {
    ...
    dw_i3c_master_disable_clks(master);
    ...
}

And runtime PM is disabled on removal without waking the device:

drivers/i3c/master/dw-i3c-master.c:dw_i3c_common_remove() {
    ...
    pm_runtime_disable(master->dev);
    ...
}

If the driver is unbound via sysfs while the device is idle in runtime susp=
end,
the clocks remain disabled. When the devres actions fire during cleanup, wo=
n't
they attempt to disable the clocks a second time?

Could this unbalanced clock disable turn off a shared clock and affect other
active peripherals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717105829.5675=
22-1-shubhamsanjay.patil@amd.com?part=3D1
