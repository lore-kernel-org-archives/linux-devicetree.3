Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895603EB0FD
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781030557; cv=none; b=PCZh2Mw1JyuSsergWfzFftDoA5c3JGGo2ZHNbIbmV3+mZghallglZYRdzoif+9/vcyDG7EqGUEAKHr2wO7GtzRayRDHsJNgPmPkJX6ai27Hm/U7om3lJb/zURUj285DcItQhxB2Q/bYBGPxJ7fR6LY2WRA/3ba7cK8s8JoC43U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781030557; c=relaxed/simple;
	bh=qCIowo6q21wIkLU1RqMFJOEAeXrA3k+bRT2fKTt/gvs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gboPXyAUU6YQO36DPlk5kGTAWJplu2hqtX4KKGhFR2yFlylZrDiTsESq9pQeqnYeQTNgif9pNWkGNieXo4Cf9ImvHUhYYjj/7prBJxpLHrTIfHHWgP1SMw+swmjxiGqtUWUFgDZhw4+BLoDVhRuPxl9UDtOvKqrcnhQmechw3VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nyukhxck; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nyukhxck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335711F00893;
	Tue,  9 Jun 2026 18:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781030556;
	bh=/+tWBtn5m6sUpr15bCJiRz2e5aX6lI86mYHVqAAw2NI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NyukhxckzBY2YK/5lndQEBOEAn711GWDA8YAcjTz0ZOQMxt7nwgLK8guWFYcFJu5j
	 4+T+14/0NJlwPGO1nmpYiqVXXPeoAb1fG8QkaaN+ycFqpKDB1390Zw08WJNl4119rc
	 SXkoJhLnE6t3UBboWNdiWz7ilPjlXjw13ZcO9e4ljFsNAmirzNg9/o1jz9cZNaTWGB
	 Tmc5LcUXHZuU/380UNGar4mEKh7j2RWkGu/E845uxXgInsSYTSbDkZHmpkSd9CS/IQ
	 D78Gf1aN7l+Hds8H4+PGcTZHUld4N69GVw16S+unQlGyd0LADBVwAbgoNX95uVURC2
	 PUGPf1QVGcXrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: bcm6358: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609181731.1379846-1-ninadnaik07@gmail.com>
References: <20260609181731.1379846-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 18:42:35 +0000
Message-Id: <20260609184236.335711F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The LED sub-node uses `additionalProperties: false` alongside `$=
ref: common.yaml#`, which silently rejects standard LED properties.
- [Low] Unused `#include <dt-bindings/leds/common.h>` in the device tree ex=
ample.
--

commit 7f21f3b199b43205368512a4bc4314dd320036e1
Author: Ninad Naik <ninadnaik07@gmail.com>

dt-bindings: leds: bcm6358: Convert to DT schema

This commit converts the text bindings for the Broadcom BCM6358 LED
controller to DT schema.

> diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yam=
l b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
[ ... ]
> +patternProperties:
> +  "^led@(0|1?[0-9a-f])$":
> +    type: object
> +    $ref: common.yaml#
> +    description: Each LED is represented as a sub-node of
> +      this device.
> +
> +    properties:
> +      reg:
> +        description: LED pin number (0 to 31).
> +        maxItems: 1
> +
> +      label: true
> +
> +      default-state: true
> +
> +      linux,default-trigger: true
> +
> +      active-low: true
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false

[Severity: Medium]
Does this restrict the child node to only locally declared properties,
rejecting the standard LED properties inherited from common.yaml#?

In DT schemas, additionalProperties does not consider properties evaluated
via a $ref. Could this cause validation errors if standard LED properties
are used in the device tree? Should unevaluatedProperties: false be used
here instead?

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>

[Severity: Low]
This isn't a bug, but the header is included here without any of its macros
being referenced in the example nodes.

> +    led-controller@fffe00d0 {
> +        compatible =3D "brcm,bcm6358-leds";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        reg =3D <0xfffe00d0 0x8>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609181731.1379=
846-1-ninadnaik07@gmail.com?part=3D1
