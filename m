Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F1B3B5842
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533027; cv=none; b=R5dwyHXlUIffxfMTbG/P4KOWXk/Lw1Yoi52va+zLluxfQmjldoaOKEDIb1SAXehRh2LwGf/Rg3cvSoGaTwuujndIYTkLViCtMFdUbPvjpT6PbkAZVI4lbZLhU9sTOIH5POFHF9MlQFRTSrnJ3jAjY4rm3dAgxT24QaZGtfZ2KE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533027; c=relaxed/simple;
	bh=syg3a4fqqTCm+l9z1Qw5jBsJv+VK+Tqc4xPUCgHBH/U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kV1lnugSfAaLoNYyvO8Y9oZb7Uo9re3bUH+09FpIc5QdO1jZFxIwoz8P1JzTVeIXvDKYCScg7MI0iCRre6+hlgOwXLAom9nDEFHLqad23T9eN86zYq5b1BxEavr5/VnM0aRVsJ0T04wYTNsdMQIqdIsMqTels3xFi8c1vV6Sz7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEmkR1Qv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEmkR1Qv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4868BC2BCB0;
	Mon, 11 May 2026 20:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778533027;
	bh=syg3a4fqqTCm+l9z1Qw5jBsJv+VK+Tqc4xPUCgHBH/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=MEmkR1QvJVjf1N0e189O9v+p3xgHKmaOaSr4RRa2kvT+JcC6y71ABDTlc/hEyyQxC
	 T/ijIzT/ZQWX6TN2rBtPg8Y++sOmG6dtEf8YiPV7Sh37DGdCJsizoiTE0VxRMYeM8I
	 gigvVaVjijub7AZiHYCIl2s3cXfNbkfg3Edb2PXy1kX0TZ/BcP787svE/l27zdotaB
	 QveG+7txBEQa846U9Lq24raUHJcO3mm3vVegugZO44Ly+5Tr0fz2tk9nC3LMOQWI58
	 07CKHfjO06jks4FxamW7TzySq/4IGfkzMsnc61OcYTi/6c6XEmiKhNrjMl73/jz5AN
	 HO6h72zc9w2fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner A523
Reply-To: sashiko@lists.linux.dev
To: "Michal Piekos" <michal.piekos@mmpsystems.pl>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
References: <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 20:57:06 +0000
Message-Id: <20260511205707.4868BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect fallback compatible string 'allwinner,sun20i-d1-gpadc'=
 violating backward compatibility guarantees.
--

commit 48f3b1ab2ee7aee8d556d5b6595c00af83e47dad
Author: Michal Piekos <michal.piekos@mmpsystems.pl>

dt-bindings: iio: adc: Add GPADC for Allwinner A523

This commit adds device tree binding support for the GPADC on the Allwinner
A523. It updates the existing sun20i-d1-gpadc binding to accommodate the
A523's requirement for two separate clocks instead of one.

> diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml
> index da605a051b949..89da96cd705f0 100644
> --- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
.yaml
> @@ -17,6 +17,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun50i-h616-gpadc
> +              - allwinner,sun55i-a523-gpadc
>            - const: allwinner,sun20i-d1-gpadc

Since the A523 requires two clocks (bus and mod) and the D1 only requires
one, does using the D1 compatible as a fallback violate backward
compatibility guarantees?

If an older kernel boots with this new device tree, it will match the
allwinner,sun20i-d1-gpadc fallback and bind the legacy driver. The legacy
D1 driver only fetches and enables the first clock listed (the bus clock).

Will this leave the required mod clock disabled, causing the ADC hardware
reads to timeout?=20

Should allwinner,sun55i-a523-gpadc be defined as a standalone compatible
string without a fallback instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-sunxi-a523=
-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl?part=3D1
