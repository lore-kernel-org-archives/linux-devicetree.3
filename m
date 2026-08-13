Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744B5415F2E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616845; cv=none; b=FXE49MmzK7700TKT+/6g+OD8RqDuT38r+60SJok3lA37ltw2C0KZKhc4FNCrsKKt4O8rdv5knZ4CZ9ZVcxE4rLzQBTbRR/+hu4TeyND+ZJ4vuWs3u9ZaXAxL2EFEjHDEaUSFq4juFuB9GQSH/AVCN6wRWmW7UD5BO64+/gI8i+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616845; c=relaxed/simple;
	bh=AcApdRYHtZaiyQyoMqu8QaAvfnvNVJi/WTYHg2YXRhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FFz0H/molR2dyuiDSZiEnIPTcfyHjkZI7C8/rbq7lwvPvVJulJsvTiKsU4V7Jkdb5eTY9Svkveued390PK4FTL2lr6AKFSDD+/F+SS+d3TTXP084vLlc4Ah6tXMoFs+uC/iAZCwepiGItEYtRKSgmOkV0XMDYMXu/w+m+SNvVD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdWnIJkd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdWnIJkd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02291F00A3A;
	Thu, 13 Aug 2026 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786616842;
	bh=JkxZwzzi9NUML0DQ27r8QPf2AphW+L6pyKrcO4BvWtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SdWnIJkd6PEFrDSjP9E7WrguURsFbcMSJHUpdiXaHu2SR1BQZ9IVg6baGfN53MvrP
	 xb9P1o6b4k7vhyjipN5GcYQPPDhLBixCBJGy4X/NLPdTFqEGxZ+/CSbB6LbEcynDPR
	 y8hX4Ca4FHwpV5XJxUP7G19ZBTy2++l8MhD8yo8MzXuCxNE8+qBxLlbjsyHS/L9a6Z
	 1ce1gz7XvlFf2VSAsP4XyaFhQBWTcZ4vwg2R18aTECoWpOo4sJYj0yXsmdci8Vlbjn
	 UQFTWYirpzKZNf4S4T0t8ZW7LAPUKcL1E3SO9hAaSeX6oSk1ZaoJ47dXD2MacpyDsd
	 wbVFohJyNCa0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-cv75-v3-b-v3-1-1d82e18da09b@ambarella.com>
References: <20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com>
 <20260813-cv75-v3-b-v3-1-1d82e18da09b@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:27:22 +0000
Message-Id: <20260813102722.B02291F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The vendor prefix `ambarella` is used in the compatible string and =
custom properties, but it is not documented in `vendor-prefixes.yaml`.
--

--- Patch [1]: [PATCH v3 1/3] dt-bindings: pinctrl: add Ambarella CV75 pinc=
trl ---
commit 5b88d5c225a30fdaad8b8cfdef550c4ad783f17b
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: pinctrl: add Ambarella CV75 pinctrl

Document the CV75 pin controller binding using generic function and
groups properties for pinmux configuration.

> diff --git a/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pin=
ctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctr=
l.yaml
> new file mode 100644
> index 0000000000000..9d65da32d3d28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.ya=
ml

[ ... ]

> +properties:
> +  compatible:
> +    const: ambarella,cv75-pinctrl

[Severity: Low]
Does the ambarella vendor prefix exist in vendor-prefixes.yaml?

Running make dt_binding_check will fail because this vendor prefix is not
documented in the device tree bindings registry. Should this commit (or a
prerequisite patch) add it to prevent validation errors?

> +
> +  reg:
> +    maxItems: 1
> +    description: IOMUX registers
> +
> +  ambarella,drive-strength-syscon:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-cv75-v3-b-=
v3-0-1d82e18da09b@ambarella.com?part=3D1
