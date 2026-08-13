Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB723382EC
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 03:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786590615; cv=none; b=e+1D+MZAwJgUzM/V7xTDeZXeNdiMxv9ajs5kOmW6TGwOPKbEhG+TKQ8vYm980t0LTp1wuQ6M6kOVWCyZf6pbfVMuc3IXhoouevVsk6ZV6FTHBl6DPjHEk+gBKgXYXkRF82oFN9z71P2FX6ylku9MXSPD3ziWq9WJi55txRI3lPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786590615; c=relaxed/simple;
	bh=1z4CI/+FCQ4buGDYQYjgi1+ZYxo04+P4GSnV2EwvVHM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YNn9z57CthsVQrrHEAUwL+9apKGnqAMe07jS7VmMabxC8eifdwX/AfCX4xyxo4gw+Z/QzESv2V9amW/ulQ6jhwVFrymMZEb3fUJjrxD64cl3MlSudjHJZSFD2zpEK+rRh/qRGzvAADoiboIDLScGIG8TEPbtkd0dN/ISWqWtZgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORdFrgwt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORdFrgwt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6961F000E9;
	Thu, 13 Aug 2026 03:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786590613;
	bh=QJkYzQqF1wDjw1nWKdF157pBr0BlvFMSqJAA5yqD+kc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ORdFrgwtkVWS3wMmn7xX9QFEUMVZRXTbIOe5dT6oGzQKhbKmHutekMSV8TPCnVpCI
	 KJsbrpr4kVrbvJGkhe1PvyqG2QVpzDZv2F/pMfasSbkxzpIYVevIiXmayLlWleTHTZ
	 OaF9Q9NNTPoksbgZ+CwhR0YhzW+ZQujE+BImEt4zWbVcrxj2Vricnj5mytM+JZbV90
	 WfoHJimwEaDoXYVNAOUS35+DZOzlh+du7XHIsHyY4pcN5livnmSRtHrp6BXZ3uANFE
	 vKRkY9qCDCVsvFPnGnW/RwDyj+IBLwswJzAQ9OEhkzCc/zQD6Z9ZGqh8GObBDuX2mJ
	 EBUuWLt57hwkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-ti-ads112c04-driver-v5-1-79dff9e249cd@gmail.com>
References: <20260813-ti-ads112c04-driver-v5-0-79dff9e249cd@gmail.com>
 <20260813-ti-ads112c04-driver-v5-1-79dff9e249cd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 03:10:13 +0000
Message-Id: <20260813031013.7E6961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `excitation-current-nanoamp` property incorrectly uses a YAM=
L list for `items`, defining a 1-element tuple constraint instead of a gene=
ric array schema, which breaks configurations using dual excitation current=
s.
--

--- Patch [1]: [PATCH v5 1/2] dt-bindings: iio: adc: ti,ads112c04: Add bind=
ing for ADS112C04 ---
commit 1aa9d5f5c579fdf57e652aeb671cbcbcce2eaa69
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

dt-bindings: iio: adc: ti,ads112c04: Add binding for ADS112C04

This commit adds device tree binding documentation for the Texas Instruments
ADS112C04 I2C Analog-to-Digital Converter. It includes properties for
describing the chip's channels, excitation currents, and reference sources.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml =
b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
[ ... ]
> +patternProperties:
> +  "^channel@[0-9a-b]$":
> +    $ref: adc.yaml
> +    unevaluatedProperties: false
> +    properties:
[ ... ]
> +      excitation-channels:
> +        maxItems: 2
> +        items:
> +          maximum: 5
> +        description:
> +          Additionally to AIN0-AIN3, IDAC1/IDAC2 can also be routed to
> +          REFP0 (4) and REFN0 (5).
> +
> +      excitation-current-nanoamp:
> +        items:
> +          - enum: [10000, 50000, 100000, 250000, 500000, 1000000, 150000=
0]

[Severity: Medium]
Will this correctly allow multiple excitation currents? The hyphen before e=
num
defines a 1-item tuple constraint instead of a generic schema constraint for
all array elements.

If a device tree configuration specifies two excitation channels and provid=
es
two corresponding excitation currents, won't this schema enforce a maximum =
of
1 item and erroneously reject the valid configuration during dtbs_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-ti-ads112c=
04-driver-v5-0-79dff9e249cd@gmail.com?part=3D1
