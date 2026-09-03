Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB7E42AF98
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 10:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432768; cv=none; b=GkylL7ka4BtvhEo4IQQPkBEKsL1qoOXhyaf+37CdYFmd3ujYbeD3FT0uLVkZPHbyWVxlh2ARL/Ji26JGZ99PQ40QRwwe1eHHduLDJIR/1mCck51ZISY1ZjBpwSblw8YVKpC34241exLfo15BQRoV/XOrrsejYWDGJM6ec6ez74I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432768; c=relaxed/simple;
	bh=5jvc6Av0ZemDbhYsFUMiqavk+u4r66a2Taa4xh9ECZk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f/PgohT8IaFc1OZI41gOOPqvWiclWh64jmMNKWmDvSDOgCTGna9pNQRkpqD4RpTWQE0VwqHVqEX0q4gIt/wGJCXYij90lf/o3QvzGCnyLWJFxA+NTbUyxmE4Hfm7u4SiwSjiXgH5LrLhqsabQWG4sTD2yW1Sm7qgyoPCOkHn9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgKV/fJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgKV/fJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB241F000E9;
	Thu,  3 Sep 2026 10:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788432767;
	bh=unDjXNBU57jF+tCg30CjbMtwf2lPkq3Z+pQm/qsPOuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hgKV/fJzbHnnqoBMEqFXp5mAj1bHor7Nwc4Xij7tKhZDVZ18KKt4Ii/pVXzh1QfhA
	 qjz8xHxSkJ+K6c2Ws6pgSOOAdFDc/KWE7KN9SPfTaJFySDEmWzkKetFSx7MaNS/RzK
	 4QLM7vonEuWGSV7OF7vRHbZWRLiWM40ows3Lel9pV+/fzwqtYfefWnIhW15QsoNBsR
	 TpnFIeN4S++VEc/sGIotJmQRGTWjNyqOVPkAqPs/VcIHjDWsEXH4cP2w3W6YFHQ+A3
	 ogWo2o75sJGnP35gH9rhZz9LJKjIfE+9bUacRM1RF3nslgJCMB7mZjayBdBbztPIb1
	 UrxW/ZwtuBjKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: power: supply: add adi,lt8491.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <4cf7fe04accbd558c4f0aa3da2f648b8144993be.1788432152.git.johnerasmusmari.geronimo@analog.com>
References: <20250110080235.54808-1-johnerasmusmari.geronimo@analog.com>
 <cover.1788432152.git.johnerasmusmari.geronimo@analog.com>
 <4cf7fe04accbd558c4f0aa3da2f648b8144993be.1788432152.git.johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 10:52:46 +0000
Message-Id: <20260903105246.EAB241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect use of `additionalProperties: false` when inheriting f=
rom a core schema via `$ref`.
--

commit 7d1541cad5388e9c078d722b3be849bc6995fe46
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

dt-bindings: power: supply: add adi,lt8491.yaml

This commit adds the devicetree binding documentation for the Analog Devices
LT8491 battery charger.

> diff --git a/Documentation/devicetree/bindings/power/supply/adi,lt8491.ya=
ml b/Documentation/devicetree/bindings/power/supply/adi,lt8491.yaml
> new file mode 100644
> index 0000000000000..bb364b48fee58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/adi,lt8491.yaml
> @@ -0,0 +1,92 @@
[ ... ]
> +allOf:
> +  - $ref: power-supply.yaml#
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - adi,rsense1-micro-ohms
> +  - adi,rimon-out-ohms
> +  - adi,rsense2-micro-ohms
> +  - adi,rdaco-ohms
> +  - adi,rfbout1-ohms
> +  - adi,rfbout2-ohms
> +  - adi,rdaci-ohms
> +  - adi,rfbin2-ohms
> +  - adi,rfbin1-ohms
> +
> +additionalProperties: false

[Severity: Medium]
Since this schema inherits from power-supply.yaml via the allOf ref, will
setting additionalProperties to false cause the binding to incorrectly reje=
ct
valid standard power supply properties like monitored-battery or
power-supplies during validation?

Should this be set to unevaluatedProperties: false instead to allow propert=
ies
inherited from the core schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788432152.gi=
t.johnerasmusmari.geronimo@analog.com?part=3D1
