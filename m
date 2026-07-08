Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58EA3B776C
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522329; cv=none; b=HhPhqaOefVxXdEcD2/RmlEX80J6lwYHTWNuulDBjk2Xc+zDaS+gy/HClwL6tcNdieC8W0vdgopLk0wQumh1M8hciX0VLQt4NQS7NcKqnZ69TrCdtBpHlnD5g50e/VpYIT7xttzoAzX9JCITGOcO82esPl+w6nUAqglofzY76NEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522329; c=relaxed/simple;
	bh=e8u7hQQOGfzCek6z8hSNDt06rCYnVIfuSJwS0y7HFWk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZK9VzkJPxzwdysKSUzu8ZvmhwqRmkOC2eFZdMs+ErCRcRCjZ3rPMKVjgzM2sjOeWdwzoWk6h/XV8YpB1PMCMuCB5sGQuJVFZfx+cP5J5zJfoPL/9qr0O27mFBZ+nYydpGTpBKo4J7KXffaePMqqsElBQiUaxVoRNNIn2Fd8Tky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2sXiy3n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2sXiy3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E17F1F000E9;
	Wed,  8 Jul 2026 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522328;
	bh=N6i5LF+0LxyLYZkXfeMpN5/dS19ueJg4x87DdmebEXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n2sXiy3nnGAp5EGW2MylgAKBdq0oXWsIncy+CSz5J4nJF+kSWSdPjWkvUkFb4ChkT
	 pla4yBUnMOaVflVj5gVRogDzZq4ak2hyH83oth1ScR7901ZPnRMtkjWuYAC8SxpZ5J
	 2PXWq41JD1QRFr5XEtU5KN8XuI9Q4U+C1Zil1Ji17RfFJoWoVGa1ZVynphrXPGntiH
	 3lgvI8dm6IQw5NIIg4tL1EOtrMOmi5M5/U4K37gXZCrpx8/mzdQVf8fxredG41AfCM
	 4OI5Y5kmOHOTtauqs1R9vpckd18uAsmlLsYlwHda3ZQDfzbSD62T/UJ/yBvncQKOOP
	 GZk/CqlCIebRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] dtc: dt-check-style: Expect first device_type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-dts-style-checker-v4-4-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-4-c175e6401150@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:52:06 +0000
Message-Id: <20260708145208.2E17F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The `compatible` string in the YAML example does not match the sche=
ma constraint.
- [Low] Copy-paste error in the comment of the 'good' test fixture.
- [Low] The docstring for `_property_bucket` missed an update for the new `=
device_type` fixed slot.
--

--- Patch [4]: [PATCH v4 4/7] dtc: dt-check-style: Expect first device_type=
 ---
commit c078538281e29a1c935623ba80b1e47b07008331
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Expect first device_type

Adjust the DTS coding style rules to expect the device_type property first
and improve the dt-check-style script to handle this correctly, along with
new test fixtures.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index bb9ec5b82319e..23cdfe78b1890 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -558,28 +558,31 @@ def check_child_name_order(ctx):
> =20
>  def _property_bucket(name):
>      """Return the canonical bucket index for a property:
> -       0 compatible
> -       1 reg / reg-names
> -       2 ranges
> -       3 standard properties (no vendor comma in #-stripped name)
> -       4 vendor-specific properties
> -       5 status
> +       0 device_type
> +       1 compatible
> +       2 reg / reg-names
> +       3 ranges
> +       4 standard properties (no vendor comma in #-stripped name)
> +       5 vendor-specific properties
> +       6 status
>      Plus a sub-key inside the bucket for fixed slots (compatible, reg,
>      reg-names, ranges, status). 'standard' and 'vendor' return None for

[Severity: Low]
This isn't a bug, but should device_type be added to the list of fixed slots
in this parenthetical?

>      the sub-key, signalling that the within-bucket key is computed by

[ ... ]

> diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-typ=
e.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
> new file mode 100644
> index 0000000000000..433afb731dded
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/test-bad-prop-order.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Test fixture with device_type
> +
> +maintainers:
> +  - Test User <test@example.com>
> +
> +properties:
> +  compatible:
> +    const: example,test-prop-order-device-type
> +  reg:
> +    maxItems: 1
> +  device_type: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    device@1000 {
> +        compatible =3D "example,test-prop-order";

[Severity: Low]
The compatible string used here in the example doesn't match the const
requirement defined in properties.compatible above. Will this cause the test
fixture to fail standard dtschema validation if it's ever checked directly?

> +        device_type =3D "cpu";
> +        reg =3D <0x1000 0x100>;
> +    };

[ ... ]

> diff --git a/scripts/dtc/dt-style-selftest/good/dts-property-order.dts b/=
scripts/dtc/dt-style-selftest/good/dts-property-order.dts
> new file mode 100644
> index 0000000000000..0e183e3459cdf
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * Test fixture: Incorrect property order

[Severity: Low]
This isn't a bug, but since this is the "good" dts file, should this header
comment be updated to indicate it is testing correct property order?

> + */
> +
> +/dts-v1/;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-dts-style-=
checker-v4-0-c175e6401150@oss.qualcomm.com?part=3D4
