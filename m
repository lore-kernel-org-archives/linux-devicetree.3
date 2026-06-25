Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485533DA5AD
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386318; cv=none; b=ElDnyhs2sv6+bkILBxbi3dIQISlo6xeEEtVdlGNqis8rPIq3vfthoF+73mc56FxV7F4o1jwiGHN0wyus7l8oJFXFW1WN5/sZhEpk7l0JJxX2CYW62m1clZ1G19Y3L1dDn4xbHWvbYqg7nxXBdC6D/2QgDKX/daHl510xrBLtNXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386318; c=relaxed/simple;
	bh=xp9aKdXYDUqHSeLZ47Kh03QM4ilxZ03UaX17WKMzmV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X3mAZslaK093za6ifb1JgHWN4vP+hu+WjSgCDIb+gra6alJlnFqANklKvQqRnDDj6Yt2CJpGPqKpAtJqnXtu/u0BxldqmY02xFvKfQQinSuXeUMSwjiH3vSlyxkFYkrZo2fdlxuUqqBGdTSmBrqomsFpoYJ3eNNF56SU+/wYFpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzfdEp29; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzfdEp29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22B51F000E9;
	Thu, 25 Jun 2026 11:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782386312;
	bh=FTlFv5wOZiYCFjzHs5UXZSWg4myGoj7qa9O2ZY39FuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hzfdEp29C1TnmYJ4J3yhx5qaDGAxWNXvqpqeY+LOzPO2AOrNDnzF1mw500TwFBAJD
	 +jEmvGHumrEtAHLhSzonj69gKllBQIfJ8d1FsuvezZNQdzzf+pYTwLIn9U49jB3Y4y
	 zdnC7SWG+vUjp2BFI5uHkxQrLheFeyzdyhWMitb8UOzn6ontvVd1xnKFZiV5R/LKTj
	 D5T+avNlrzvErbLASEcIPeidzxIlGFIYYt4VlZBLvIOP620U7Vf527GrEVOMIBKBn5
	 9mT0Z4j+gbdPK3bRwASOVcZqKAC2gZ05t7rmRFE2SOtHHVndIcIqKOrt4J3MvRDrKm
	 V4likf5X5zCuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260625110638.38438-2-cwweng.linux@gmail.com>
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-2-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:18:31 +0000
Message-Id: <20260625111831.B22B51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `resets` property for a hardware block that has a dedicated=
 reset line.
--

commit 1f48c0ec2f3eb7b2358c1e0e2db87a26859d5fc5
Author: Chi-Wen Weng <cwweng@nuvoton.com>

dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC

This commit adds the devicetree binding for the Enhanced ADC controller
found on Nuvoton MA35D1 SoCs. It describes the register region, interrupt,
functional clock, and standard channel child nodes.

> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-ead=
c.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> new file mode 100644
> index 0000000000000..ae7ad0f7689ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-eadc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1

[Severity: Low]
Is the resets property missing from this binding? The Nuvoton MA35D1 SoC
explicitly provides a reset line for the Enhanced ADC block (defined as
MA35D1_RESET_EADC0 in include/dt-bindings/reset/nuvoton,ma35d1-reset.h).

Should the resets property be declared here and added to the required list
to accurately reflect the hardware dependencies and avoid dt-schema
validation errors if a board uses the reset line?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625110638.3843=
8-1-cwweng.linux@gmail.com?part=3D1
