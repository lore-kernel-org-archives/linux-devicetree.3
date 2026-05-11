Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F16B1EA65
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778536032; cv=none; b=HTpPsBI9f/NtpleoDgpyNwoSmU5gxVY+xeK8B13QwQk/WhIeSx8dH7nxX9+t89NGHrmOrtsuEwHYnB06h84X5zluUZgWNpfDSjzZOhFfADZhhBCBckShrQUCMmRnSM09mVV6FYB0wgwehAm9gQVu8TAwccoQT3e7Se3pWiolj2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778536032; c=relaxed/simple;
	bh=FNCwYQztjoJac11Kky1tQ1Q2rfIcAFI0TjnvztGohSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rO+CszIdgh4tPIkjz3BfyrYTwVYK8gaTlCv9lJE8NQ9Htc4BOmXjrkgL5VMfFrrwJS3SsxBy5pq6fAIl0zp3O1cWQzVdO5ggPFPK2yND91wjRJZnHkj5zqhkYdAFH3kPLzl6VPuC1T7xZrbCUIBv+yOD9DYOfgakL8KtUfMiKT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYvI5tc8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYvI5tc8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08AEC2BCB0;
	Mon, 11 May 2026 21:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778536032;
	bh=FNCwYQztjoJac11Kky1tQ1Q2rfIcAFI0TjnvztGohSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=EYvI5tc86de2uigRAAffH/roHDoYZv48HGkoDisF2wWaiQyan8HsSGkoDcNyE+nfK
	 Jmcaq8YbAN9tlrfwBUOd/ltFddIqd8geQX9u/eOEsP9tHGgeztBaWScyF0PVnFBEvh
	 HEk7GvC+rNHJ7A3QsyL8+yOYIaIXbWu5/pcapkbb4vg+lL6h+SWXrhy3Kv/0FMnG0W
	 t+0xT33XQS5EX2G7bIsdbLP11VDz1dYOf0wHZCkhgbmCi9/FgBW7FuusP+IqtNNBcW
	 6nmGO5WCPBbo2X9uwRHo2nVDCO+lz6ezB0HoY/Mmv+eKW4OkChw5JFxTPKl1b7GEnI
	 3BUS1K2Vh2JGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: light: Add ROHM BH1730FVC binding
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-bh1730-v1-1-e0df1f499135@gmail.com>
References: <20260511-bh1730-v1-1-e0df1f499135@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:47:11 +0000
Message-Id: <20260511214711.E08AEC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The regulator supply properties `als-vdd-supply` and `als-vid-suppl=
y` use a redundant and non-standard `als-` prefix.
- [Low] The description for `als-vid-supply` incorrectly claims it is for a=
n "LED indicator supply (VID)".
- [Low] The description for `rohm,opt-win-coeff` contradicts its schema def=
inition by asking for a "flat list".
--

commit 54cb92717c1eb05d5ed9e2a6d74a2b1e27c4482c
Author: CTCaer <ctcaer@gmail.com>

dt-bindings: iio: light: Add ROHM BH1730FVC binding

Adds a YAML binding for the ROHM BH1730FVC ambient light sensor,
documenting required properties, regulators, and calibration coefficients.

> diff --git a/Documentation/devicetree/bindings/iio/light/rohm,bh1730fvc.y=
aml b/Documentation/devicetree/bindings/iio/light/rohm,bh1730fvc.yaml
> new file mode 100644
> index 0000000000000..6273b69e82ab2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/rohm,bh1730fvc.yaml
[ ... ]
> +  reg:
> +    maxItems: 1
> +
> +  als-vdd-supply:
> +    description: Regulator for the analog/digital supply (VDD).
> +
> +  als-vid-supply:
> +    description: Regulator for the LED indicator supply (VID).

This isn't a bug, but should the als- prefix be dropped from these supply
properties? Standard device tree conventions typically use vdd-supply and
vid-supply directly unless the hardware pins are explicitly named with the
prefix.

Also, is the description for the VID supply accurate? The ROHM BH1730FVC is
an ambient light sensor without an LED. VID typically stands for Voltage for
Interface/Digital. Does this description need to be updated to reflect the
hardware?

[ ... ]
> +  rohm,opt-win-coeff:
> +    description:
> +      Optical-window calibration coefficients. Specified as a flat list =
of
> +      triplets <rc cv ci>, one triplet per window region, where rc is the
> +      visible/IR ratio cutoff and cv/ci are the visible and IR weighting
> +      factors used in that region.
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix

This isn't a bug, but does the description contradict the schema definition?

The text instructs users to provide a flat list, but the property is defined
as a uint32-matrix. If a flat list is provided, schema validation will fail
the maxItems constraint.

Should the description specify an array of matrices instead, to match the
example below?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-bh1730-v1-=
0-e0df1f499135@gmail.com?part=3D1
