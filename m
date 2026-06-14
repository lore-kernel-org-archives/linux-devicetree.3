Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116D439B95C
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 10:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781433656; cv=none; b=slIGkHcW+jvYHxKCPGarwHzDyP0tvVCyPt9LBOqjIAn+wdx8P2ljjNMHfmGsosSiNTHMpa8YODI6q+0Q96eQ1VdgT9aGYoDyq05UFBIfQ4dEFAK/HRNlinYLYUiyJblxkvjiBUsStxaEFZ1dktnAMxmTXtt2D97hEwmTTNU+Oi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781433656; c=relaxed/simple;
	bh=636b0kti8B/PhDIC7sBV7d143QGgf8arQBQMrf5skoM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W7A6b72WSjUCF8+scVCpMqllxXY+yBWIMHCcSHqA7kPp3VjoddZlIGs/CR4OmN3JDwiySWjAsRarG0O2eF+yfuEzi60ahs4eqssXEquDk/jvcc4sBS1j9a+z9kvtFxbe5vD4bSxgASS7r3gdKN6YgRg6aAFrYTNHFKYO+sa3w4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZcJYSM0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZcJYSM0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D651F000E9;
	Sun, 14 Jun 2026 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781433654;
	bh=kRz/OO9Y9Hj4qqaonkS5NbQy8Jkb1+dCXFxiNHnwbeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GZcJYSM0eJhHdmOQhutUVjUXMXsUeZaWXnZYH2kHJ0uLastAVp1ugIUid9u7cjCnY
	 DrROk9JLwHBZSJKRDUQ4cQMBBJKXO28+t6ECX5Mdqu+n/GVoqq5igYCCUb2qboNzLR
	 JqyUUad1lY9t6QqWKvPh2xq2IrsxRRcaHI6Nenv6AxeKIUSGImtf2XsIAKkUsJ/Gzq
	 n0JEAYL7AkJiMuGnmntqcjwJgFKohvTPxiSayP5KSSHjpuu/uUPtOpHpkf0ciMwq4z
	 YlxjbC9xPTaLYETfYjQ6pAhm/ZmC3Fl63VUmL/UX+WcCgNR2/UQ1I3kqlu1ztDWqR3
	 f7HkZH2ZZJhlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] spi: dt-bindings: qcom,spi-geni-qcom: Add property
 to force GSI mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260614083424.464132-1-mitltlatltl@gmail.com>
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 10:40:53 +0000
Message-Id: <20260614104054.44D651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `qcom,force-gsi-mode` property dictates driver software beha=
vior instead of describing hardware configuration, violating Devicetree pri=
nciples.
--

commit 0692b669eca2d4de46bd91bb83f4d52a4fe1f11d
Author: Pengyu Luo <mitltlatltl@gmail.com>

spi: dt-bindings: qcom,spi-geni-qcom: Add property to force GSI mode

This commit introduces a new devicetree property, "qcom,force-gsi-mode",
to the Qualcomm SPI Geni binding. The property is intended to instruct
the driver to prioritize DMA (GSI) mode over FIFO mode during initialization
on platforms where FIFO mode isn't explicitly disabled.

> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yam=
l b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> index edf399681d7a9..80e394c1c7159 100644
> --- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> @@ -45,6 +45,11 @@ properties:
>        - const: tx
>        - const: rx
> =20
> +  qcom,force-gsi-mode:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Use DMA (GSI) mode, even if FIFO mode is not disabled.

[Severity: Medium]
Does this property violate the principle that devicetree bindings should
describe hardware capabilities rather than software behavior?

The hardware's capability to use DMA is typically already described by stan=
dard
properties like dmas and dma-names. Since qcom,force-gsi-mode acts as a hin=
t to
override the driver's default fallback logic, could the driver instead make
this decision internally?

For example, the driver could default to DMA when the resources are availab=
le,
or apply a quirk based on the board's compatible string, avoiding the need =
to
introduce an OS-specific policy flag into the devicetree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614083424.4641=
32-1-mitltlatltl@gmail.com?part=3D1
