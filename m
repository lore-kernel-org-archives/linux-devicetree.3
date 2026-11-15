Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723275;
	b=LqLVFOh+OXqQLOhI/ytIqU+ZIi+Xaq/liKKlUyVLpOOJDNh6H2IZydmBhMFTS4gLNcPa
	 FmV3BdTboHj44JO7vwFsOAb+0FwlMuaXOpsYQhHv0LCfrYpAofh760+pWyZBpsYJBhtmx
	 wmP0ZCrgHnv5BT1Zfg1am12pFO74sMrp02kuZolb4I91sSPktqYBtSfrmQBO04rP3Oh9F
	 4w7ZeT5f80ruIeMl474t388N5ZhzDbaLfIfa7IUlPbKrh8PPAxYRehxJ7/X9DS9iiKJw4
	 aNSCeL8UBXo7EY/CQUSUQ+uMa2ITALtL4NdxfO4U4EEGEOkLxt3dwkSdZxn2SGil4nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723275;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1YX6STtWNAq4C0sSHz2BMv4F2a/yIqZSrsv+OW+2uSg=;
	b=xS4SBQxIvI+hLeQV/hydKSmPG+L6kyCitU+WJkl4tVA1zgH8cS/AgnHL5FXB5IXYJM9V
	 tSOE+aQ84ZaMgNx+EwjFAzgcrtPrRRQjaAI+KomqYWPXp0l+M1aT8uQBtOXZk/gFxi/b+
	 XNHqm//dRUyn0yqS4DvQtN05Z/AzMzhex3VlGEEsbx1ngSEYCN3U+QP/IqGfUHZw2r19I
	 AqWNMZIs3HJMiJpuWrUMWAQ3oGYoi3E5swZmuwW81EykVcrrPDNbY+Ex8W+5I0Y34JAbZ
	 10GWYabWuR5NHINnF6iQehGHL+i7kVTx3x03AVPaJ/Yjv1UPjuyUx6igITZdJnobRgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MvpBJc1K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0529C606A327
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MvpBJc1K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608791F000C4;
	Sun, 15 Nov 2026 06:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794723274;
	bh=1YX6STtWNAq4C0sSHz2BMv4F2a/yIqZSrsv+OW+2uSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MvpBJc1KWxtc1NT/qbdqKBKbF+zDyq1Cff1a0OHPwYHaYOn+tzmm7S6fOGapNtTI+
	 zocOyqg9oUrSMXOreBPfK4oOIm8OBaMki5mCcO93GonzA7B81Epb6Q9Zd4vPEghiwQ
	 uTs0zeizo8f7cj0fGf723dZSkQ6ZmwlWBD1nUtSNlfqWAaJG69NEJH3N0p9+eZ9K2j
	 EMOksgJ9YjynLJUGd0fhyrrrZ2kZhxNgm+QsOCWobLjIBSbU9D/gMa8xwFsl/zYtj0
	 c/aH9Nrupgu5Zjntj0Cl00bqWe/y5DvmXnowospsICHVo3NX9DTfVBZnxjIu3gG3cR
	 3Ju83Q0Xiv3kg==
Message-ID: <sashiko-outbox-215241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: chemical: Add Sensirion SGP41
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshat Chandra" <notmissinge@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115055941.362185-2-notmissinge@gmail.com>
References: <20261115055941.362185-1-notmissinge@gmail.com>
 <20261115055941.362185-2-notmissinge@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 06:14:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] dt-bindings: iio: chemical: sgp41: missing vddh-supply for
  heater pin
- [Low] dt-bindings: iio: chemical: sgp41: 2-space example indent and
  const reg
- [Low] dt-bindings: iio: chemical: sgp41: deprecated GPL-2.0 SPDX
  license tag
--

commit 364f23f4f9b681d905ad97232d6cdcac6d5b17e4
Author: Akshat Chandra <notmissinge@gmail.com>

dt-bindings: iio: chemical: Add Sensirion SGP41 binding

This commit adds a Device Tree binding schema for the Sensirion SGP41 VOC
and NOx I2C gas sensor.

> diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp=
41.yaml b/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp41.ya=
ml
> new file mode 100644
> index 0000000000000..c2bb6818f4390
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp41.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)

[Severity: Low]
Should this use (GPL-2.0-only OR BSD-2-Clause) instead of the deprecated
GPL-2.0 identifier, per Documentation/devicetree/bindings/submitting-patche=
s.rst?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/chemical/sensirion,sgp41.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sensirion SGP41 VOC and NOx gas sensor
> +
> +maintainers:
> +  - Akshat Chandra <notmissinge@gmail.com>
> +
> +description: |
> +  Sensirion SGP41 indoor air quality sensor measuring raw VOC and NOx
> +  signals over I2C.
> +
> +properties:
> +  compatible:
> +    const: sensirion,sgp41
> +
> +  reg:
> +    const: 0x59
> +
> +  vdd-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +additionalProperties: false

[Severity: Medium]
Should the schema also define vddh-supply?

The SGP41 has a dedicated VDDH pin for the hotplate heater supply in
addition to the logic VDD pin.  Boards that power VDD (for example at
1.8 V for I2C) and VDDH from separate regulators cannot describe
vddh-supply in Device Tree when additionalProperties is false without
failing dtbs_check.

> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      gas-sensor@59 {
> +        compatible =3D "sensirion,sgp41";
> +        reg =3D <0x59>;
> +        vdd-supply =3D <&vdd>;
> +      };
> +    };

[Severity: Low]
The example uses 2-space indentation instead of 4 spaces per level, which
triggers an indent-unit-strict warning from scripts/dtc/dt-check-style.
Also, should reg in properties use maxItems: 1 rather than const: 0x59 to
follow standard IIO binding conventions and allow I2C address translation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115055941.3621=
85-1-notmissinge@gmail.com?part=3D1
