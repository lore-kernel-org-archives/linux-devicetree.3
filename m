Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81D42F7445
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013151; cv=none; b=OtOmDoLUlAE5sI5i5Jm5skCpnfK6fBnM0RU+8PbDUyJiXBYZ7ZZ+8dU4vhOUEPMBZ/YFp43Tb785au8aDp4vQ0luTj66Hr0V/nTD1Oqkk37F0Pd53pFk/kzxAuqOAyURLs5Jr5fo1tShxv1LxXWG+tYF2a1zoFnAnUHW3Ggewp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013151; c=relaxed/simple;
	bh=hcVH+4fTklELC/JooRV9p52iiJ9nwT59whT/kGkmIu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HWKpvS2hMW67X/CTwou4x+Mk5bg0o2o1oZGUMw1SnYiHfk1xUMutDytRUbSgBRDwERbmHzY7kVUwAfOGhZ5UpiAMKbwv35U1jOLoFpA6Bsr2jKuEA2Tsm0XMMPSGg38drodJGpf7UIf8yhZOQmchTevLysHZmRZisWapCqyPnu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAyYJBkA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAyYJBkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8731F000E9;
	Thu,  6 Aug 2026 10:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786013150;
	bh=uM/ACu/MVWeUwyN0h3jCVTt6c7K7Xszi3+tCJby86DQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QAyYJBkA0x6D1E19wNkE3qmgZS9+ckNwDx0w9MI55RALFyhTtchBgmzb1ozvScSxK
	 w89IPwWx/7P4aPqaBbrt9XTS+uw5BxrKeIS4fYKmVa5lfVa5INKpAP9dE6e3FvLwR4
	 QkfQ3IPmz4PEwrs+lN6XOY13Q57+9TSNCt/ficfZBA0+RYRXNlBZWze7x3LKOx0o55
	 feSa+03jKqW3sbGsAP2AjVcKmhpaeeFI0VE3I9mV56K4v6WEPjnuqcU57NInU6bjny
	 az7nq9VyIrxoiZ8c6XXRFO8JrLJAYqDnBZv2PeYVkwETgJTDECWbCsgXG6tgSa0KBy
	 lFzraxFZIBw6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/10] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G3L PHY bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260806102236.149159-7-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
 <20260806102236.149159-7-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:45:49 +0000
Message-Id: <20260806104549.CD8731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The RZ/G3L USB PHY reset driver unconditionally depends on an undo=
cumented power sequencer ("usb-pwrrdy"), which will cause permanent probe f=
ailures because no such provider exists.
- [High] The `renesas,usb2-phy-r9a08g046` compatible string is documented b=
ut not implemented in the core PHY driver.
--

--- Patch [6]: [PATCH v6 06/10] dt-bindings: phy: renesas,usb2-phy: Documen=
t RZ/G3L PHY bindings ---
commit a462eb0d761f5dd25e491d745273497a33e90308
Author: Biju Das <biju.das.jz@bp.renesas.com>

dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings

Add device tree binding support for the RZ/G3L (r9a08g046) USB2 PHY.
The RZ/G3L USB PHY is almost identical to the RZ/G3S USB PHY, the
difference being 2 OTG blocks on RZ/G3L compared to 1 on RZ/G3S.

> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml =
b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> index 9740e5b335f93..d6b9d08ceec6d 100644
> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> @@ -16,6 +16,7 @@ properties:
>            - enum:
>                - renesas,usb2-phy-r8a77470  # RZ/G1C
>                - renesas,usb2-phy-r9a08g045 # RZ/G3S
> +              - renesas,usb2-phy-r9a08g046 # RZ/G3L

[Severity: High]
Is the core USB2 PHY driver implementation missing from this series?

The new compatible string is documented without a fallback, but there appea=
rs
to be no match entry for it in the core USB2 PHY driver:

drivers/phy/renesas/phy-rcar-gen3-usb2.c:rcar_gen3_phy_usb2_match_table() {
	{
		.compatible =3D "renesas,usb2-phy-r9a08g045",
		.data =3D &rzg3s_usb2_phy_priv,
	},
	/* MISSING: renesas,usb2-phy-r9a08g046 */
	{
		.compatible =3D "renesas,rzg2l-usb2-phy",
		.data =3D &rzg2l_usb2_phy_priv,
	},
}

Without this entry, the core driver will not bind to the RZ/G3L device.

[Severity: High]
Does this platform also cause permanent probe failures in the reset driver?

Because the DT binding prohibits the renesas,sysc-pwrrdy property for this
SoC, the code falls back to requesting an undocumented power sequencer:

drivers/reset/reset-rzg2l-usbphy-ctrl.c:rzg2l_usbphy_ctrl_pwrrdy_powerseq_i=
nit() {
	...
	priv->pwrseq =3D devm_pwrseq_get(dev, "usb-pwrrdy");
	if (IS_ERR(priv->pwrseq)) {
		/*
		 * This platform requires a sequencer. If we can't get it, we
		 * must return the error (including -EPROBE_DEFER to wait for
		 * the provider to appear)
		 */
		return dev_err_probe(dev, PTR_ERR(priv->pwrseq),
				     "Failed to get required power sequencer\n");
	}
	...
}

Since there is no power sequencer provider in the kernel tree that registers
a usb-pwrrdy target, the core pwrseq_get() will return -EPROBE_DEFER. This
results in an infinite probe deferral loop for the reset driver, preventing
the USB PHY from being initialized.

>                - renesas,usb2-phy-r9a09g057 # RZ/V2H(P)
> =20
>        - items:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806102236.1491=
59-1-biju.das.jz@bp.renesas.com?part=3D6
