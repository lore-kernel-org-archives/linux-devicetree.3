Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9F73EFFDB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 21:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815201; cv=none; b=K1AoLiDUL3BFFPh7vtBKwVCvR+0bP3f5G/baugwRsLq9KVSTNE6UFc0rUL42AZKaDlhKOf+27IFqqpilISFohRpyiAKEt+NyecylL9V7g2y2sckmd7jMvDp+/o/WWVg/DR1iCReGWJAQGYjzrhfDleRfR1qkNpretTREjCfUPCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815201; c=relaxed/simple;
	bh=barZUrkH23afrZ8dGPZqxNWtsofkkh8fA1I4sVr9TvQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H7ny94YWnGrvFFCWU67xUt5SDPm+uF8fi5uMgXOnJhdUS/fjAaG6560FJ5ig5/aVB95XHb9U20aSmHBsMTCRZjvruhX4oDgnoXxscdgmm9NyRJHLwyW3P8pcvRuTvdXWTkDQYM5nkz1c7Z7uChOCTBfATZNQiMUEVoM85hm0h+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDVNS2XB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDVNS2XB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553131F00A3A;
	Mon,  7 Sep 2026 21:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788815199;
	bh=xSSHQUETseDvniKy3jz6PeZ2xVNX0+QP65U9KMm+4Ww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bDVNS2XBSUvoeJGr+PIMa703cRiwURMJnmW/MfMcRUSyNmbeLEs+ud26Z93AcS+cL
	 t4X7moQiKVYpuyIJMNjSBppWnozWmyRAJ8XSt94kS87nEZNOe2ckOfeRRpARiYZL3z
	 4d7bep1D+Z94ElYvFS5JmIczSiYesfifwJOVZu7mET0PuXES/+wb2gGSryikODm0EY
	 BPbN6eWh5jAR1MxsUC/XZq/YOb1HQvjjXhNmkZvYOct++7SY6+dMmgHlku1jhNOIwr
	 39rxL6JW55sCiMBKRPRYQCVIe0o7InpWEi9rZ2lBPJfknGrdjpKVJaGRoBfL/nlsac
	 zQkPPP/QzOKkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: light: add as7343
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chang Yu" <marcus.yu.56@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907210042.32552-2-marcus.yu.56@gmail.com>
References: <20260907210042.32552-1-marcus.yu.56@gmail.com>
 <20260907210042.32552-2-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 21:06:38 +0000
Message-Id: <20260907210639.553131F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#include <dt-bindings/gpio/gpio.h>` for `GPIO_ACTIVE_LOW` =
in the dt-binding example.
--

commit 6fee3afaa3c4f47b1efbffef07588793c6bc1b7e
Author: Chang Yu <marcus.yu.56@gmail.com>

dt-bindings: iio: light: add as7343

This commit adds a new device tree binding for the AMS AS7343 14-channel
multi-spectral sensor.

> diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml =
b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> new file mode 100644
> index 0000000000000..b06d445b92b3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        multispectral-sensor@39 {
> +            compatible =3D "ams,as7343";
> +            reg =3D <0x39>;
> +            interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> +            vdd-supply =3D <&vdd_regulator>;
> +            ams,led-current-microamp =3D <14000>;
> +            gpios =3D <&gpio0 6 GPIO_ACTIVE_LOW>;

[Severity: Low]
Does this examples block need to include <dt-bindings/gpio/gpio.h>?

This gpios assignment relies on the GPIO_ACTIVE_LOW macro. Without the
corresponding header included at the top of the examples block, the dtc
compiler will fail with a syntax error during make dt_binding_check
because the unexpanded macro will be treated as an invalid token inside
the cell array.

> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907210042.3255=
2-1-marcus.yu.56@gmail.com?part=3D1
