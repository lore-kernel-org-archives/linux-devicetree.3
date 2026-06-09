Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5C71DF25C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 02:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973367; cv=none; b=SB/eAnkuS6f0ycXznBetBp0t8dg2LUgMhEP9VqAEElDTZtG7lf8/uDXu5TUz3sXV1rW4SdhHvEDX+KxhcX7ZV7gO9M07k7isSZcfwYDfcboSFK/DT6XTf4hr8QH4r+UI4tEZag/Y6ldHnDjcvvCstEQLj57oa7I7ogOlqdAtses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973367; c=relaxed/simple;
	bh=RmHW2D51ot7hQJAFEe1t/y2lwAi0v4/izXIb8MZ06/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S+kEMk/r/Z+OxORyJ8n7vXyBFhGRZltrwmTxN0kLNKc10PYuXcXkZALbqSRKXw/+uAfCIfZ05wQegzwTn9HscQSvftxnVuIYYY0a1n48Pwyh8G7dgqCUGCJV5OlZbPOtwKNK6qvaRfTuPU0gkUj1sMDKaZmlSV5qP+rv5Y4uYeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOsQx/5K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOsQx/5K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDC51F00893;
	Tue,  9 Jun 2026 02:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780973366;
	bh=GCiSJMXC2bv+wjPJUof4t+nEeRYvcD4tYvkdfYEVBnA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IOsQx/5KOfIxU814WlK6NbmUod+Y8/bJN0x85otrXzV+/PiptHZ6GsUj5hGWZHICv
	 266A0viX/0vcQPtEWuabUImmusE98ci8UgjCyadCrpIMET9n3GyGCvvZ4eevDRmmbk
	 mkjxp6cgRE1KOQCVgJrpvB17ky96WruF29ESE+bikMJ3GhlEMFQtXnSxx6sf5xpENa
	 R2/8qnaGDJZWXtUd2RFNV9mKFDL3fFOO+xfCrqi3ZQJIyAiPIq+0b9dkvOD2heQzOg
	 lqVAJ7yA4cC7RcJSUfKplxrZl1ZA2A++3e1I8YVeTYM7NiNGlYh8Ya9PFRdT4Pk5EF
	 Rzss6Ithtp5yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609024128.585938-2-YLCHANG2@nuvoton.com>
References: <20260609024128.585938-2-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 02:49:25 +0000
Message-Id: <20260609024925.ADDC51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Multi-line bulleted list in the `reg` property description will be =
incorrectly rendered as a single run-on sentence.
--

commit 8aebb4f09e40762bba8c3a19ef3a2fd493c6de6d
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60

Add device tree bindings documentation for the Nuvoton NAU83G60
audio amplifier.

> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml=
 b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
> new file mode 100644
> index 0000000000000..2d19aedf1419a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
> @@ -0,0 +1,83 @@
[ ... ]
> +  reg:
> +    maxItems: 1
> +    description:
> +      The I2C address of the device. The address is determined by the ex=
ternal
> +      hardware configuration of GPIO1 and GPIO2 pins.
> +       - 0x1a (GPIO2=3DLow, GPIO1=3DLow)
> +       - 0x1b (GPIO2=3DLow, GPIO1=3DHigh)
> +       - 0x4a (GPIO2=3DHigh, GPIO1=3DLow)
> +       - 0x4b (GPIO2=3DHigh, GPIO1=3DHigh)

[Severity: Low]
This isn't a bug, but does this description block need a block scalar liter=
al
indicator (`|`)?

In YAML, plain scalars that span multiple lines fold newlines into spaces
unless a block scalar indicator is used. Without the `|` indicator, this
bulleted list of I2C addresses might be concatenated into a continuous,
unformatted string in the generated documentation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609024128.5859=
38-1-YLCHANG2@nuvoton.com?part=3D1
