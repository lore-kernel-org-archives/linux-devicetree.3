Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFFE33859A
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579952; cv=none; b=EmgYSbKApW7GNL9Obo3OMmW4QqeuyV7PFYaM4r73rNYmQQezOKjdZ3tr0gb2eDQFv/a00zJy5G9936LXt6AzrTBVjVQdNMN3JwVQdEeXs117EAXt53SRWreG1Pm7C4nWoY41hTCjGSV2N00EJkUKnJSGd4nCo3eI2YPmN//yw3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579952; c=relaxed/simple;
	bh=a7J5PWyhwbCf86971tJB6/XyqXo6F8WErlrzxlu00og=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZCJkDkUiVf6Z2k0kPEXbW3Cyb8krKzk6CGz0rV4PWgzCN5wEmIeiQQzbfig9+cf4TPWXtVjruILJgC6R8g7gTxRc7YxAnrfB/d28NCr8CRLAUlKkck0Xne9MF4FYW5MrCav1eio8xYbP5dKaM+mfn//ETZBWAGH2ZX5dOxjE2fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DML/nR4V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DML/nR4V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2097C1F000E9;
	Sat, 27 Jun 2026 17:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782579946;
	bh=K4WI4JNFybU4WFsL7vQlA+RwqZI+HQ2Xn4ux91C9UoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DML/nR4V5K9ZWN68laLneuWtyZeIrXdS05M5Jdr/3qxEmLmWrrfSgYoAy67AliKlM
	 Gx5w+Hi0a3DD+aZSVokWAjazZTKk2xoL65zqOB049cvVpTb9IWyCm2wWgkZG7hvz+a
	 RIF0/fBUxM+FUiXTtBhXq3DU0lA5hqmqd4M3SSU0sbX6Mg6ShhIIQM0je4R0Kg/jht
	 94a50mHm51i8u5TGDNsYXXPovHLPPl5pteEEgmYncn1vVah2NEPtadAIm0YoD4vV9M
	 S3dewRZpvH0Kxu2nJiiucIQmnxQGEndyRkvYpj2fZURbOEa7fzmTiSE0WuiSij2Ixn
	 oXcUiYXAE9J1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: pinctrl: samsung: Add
 exynos8855-wakeup-eint compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260627171228.2687857-5-alim.akhtar@samsung.com>
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165418epcas5p1186eea5f8dc54d16a88b8298f6cfcf61@epcas5p1.samsung.com>
 <20260627171228.2687857-5-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 17:05:45 +0000
Message-Id: <20260627170546.2097C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Mismatched interrupt initialization callback for the Exynos8855 CM=
GP pin controller instance.
- [Medium] Missing schema constraint for 'samsung,exynos8855-wakeup-eint' i=
n conditional blocks.
--

commit 6b2b84ce35194270a7205c775f4bf99caf377480
Author: Alim Akhtar <alim.akhtar@samsung.com>

dt-bindings: pinctrl: samsung: Add exynos8855-wakeup-eint compatible

Add a dedicated compatible for the exynos8855-wakeup-eint node, which
is compatible with Exynos7 implementation.

> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wa=
keup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pin=
ctrl-wakeup-interrupt.yaml
> index 2b88f25e80a6d..802911e23aff5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-in=
terrupt.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-in=
terrupt.yaml
> @@ -41,6 +41,7 @@ properties:
>                - samsung,exynos7870-wakeup-eint
>                - samsung,exynos7885-wakeup-eint
>                - samsung,exynos850-wakeup-eint
> +              - samsung,exynos8855-wakeup-eint
>                - samsung,exynos8890-wakeup-eint
>                - samsung,exynos8895-wakeup-eint
>            - const: samsung,exynos7-wakeup-eint

[Severity: Medium]
Should samsung,exynos8855-wakeup-eint also be added to the allOf conditional
blocks to enforce the correct interrupt constraints?

Looking later in this file, this conditional block restricts the 'interrupt=
s'
property to a single item for Exynos7 variants:

  - if:
      properties:
        compatible:
          oneOf:
            - enum:
[ ... ]
            - contains:
                enum:
                  - samsung,exynos5433-wakeup-eint
                  - samsung,exynos7870-wakeup-eint
[ ... ]

Is the new Exynos8855 variant missing from this list, which would allow
invalid hardware descriptions to silently pass validation?

[Severity: High]
While looking at the related driver code for Exynos8855, is there a mismatc=
hed
interrupt initialization callback for the CMGP instance?

The exynos8855_pin_banks1 definition configures the banks as wake-up type
interrupts (EINTW), which require the wake-up initialization routine:

drivers/pinctrl/samsung/pinctrl-exynos-arm64.c:exynos8855_pin_banks1[] {
	GS101_PIN_BANK_EINTW(1, 0x00,  "gpm0",  0x00, 0x00),
[ ... ]
};

But the CMGP instance exynos8855_pin_ctrl incorrectly assigns the GPIO init
callback instead of the required wake-up init callback:

drivers/pinctrl/samsung/pinctrl-exynos-arm64.c:exynos8855_pin_ctrl[] {
[ ... ]
	}, {
		/* pin-controller instance 1 CMGP data */
		.pin_banks	=3D exynos8855_pin_banks1,
		.nr_banks	=3D ARRAY_SIZE(exynos8855_pin_banks1),
		.eint_gpio_init =3D exynos_eint_gpio_init,
		.suspend	=3D gs101_pinctrl_suspend,
[ ... ]
}

Does this cause the wake-up interrupt banks to be ignored?

During the driver probe process, the GPIO init function explicitly skips ba=
nks
that are not of type EINT_TYPE_GPIO. Because the wake-up init callback
(.eint_wkup_init) is missing, it seems no initialization runs for these ban=
ks
at all, leaving the external wake-up interrupts completely dead and their I=
RQ
domains uncreated.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627171228.2687=
857-1-alim.akhtar@samsung.com?part=3D4
