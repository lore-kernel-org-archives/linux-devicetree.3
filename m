Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73873E49D5
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373913; cv=none; b=K3WRUD0P/2IcYWdEjfJvKlwChyoj5PtmBbZxmpqq0QpgNvDVkfxhdaAo1sbhWZ542Ul/zlhthnDin5gEB0VuOEAqMq9PcsBzkW47akbG0xm24OhKyRpaV0jMq2ARdo4HmrJDXd8UeBh44fmOM47gN/+2H7stAv3tcjrQD+9lq/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373913; c=relaxed/simple;
	bh=TOyqk6tlM++NyuEHduVL4U6k4VicetTrmdKrsFK5wq8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gdQ5BKLrhnSF18hwDFZV0sHvkNmWBCFrWr+DHPNX6cvMid7DhsslS6/sHYgM5fONQkEHhiaI9Y5hKJm+HYOggikQSa3eRp3h28BIzUhse55oDGP2zY5UH13DHd5lvK20RhphGU0Whyn7zu5COBWZeVP4gj0efhTqCrH+qTYt5i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLA4qhPr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLA4qhPr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BD21F000FF;
	Mon, 14 Sep 2026 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789373911;
	bh=O8+G9Pfm0w/9ObqOmZ5zn/uEd7znjr7CLXiwl43func=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kLA4qhPrTwqBND/PydyTIGQmXVJ2lZGcTqKWEviINOJkI2mo+fbavRQRfTi3TWeQm
	 nWX6STo72C0htczBarYa9i8Tu3gHGA7DzZiE9IeNkjs+noKwS1tEt5BcACYaQfdcQ2
	 7+iIIhDXSof5E4yN/GvqrhpqWqOVh1kRFnLh6e1QgLQfzuaVxxHsyjhAJrhipXOYBH
	 jCLDvm16QoJxPFrX9BU1kFSHUdRhs+8An+LQTvX3FeI4SOHFdD1IYVrkNxs02yYO1Z
	 eKKexUOR5h83cerL6eDt4tR/6HzIjm7OcYeLYh6dFFLDPdmsnzPJIP17Bg/6jEmYb9
	 ONVhBoXk/mYJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:18:30 +0000
Message-Id: <20260914081831.12BD21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete schema validation constraints for `interrupts` and `i=
nterrupt-names`
--

commit 783cc9cba9c938896ba8c6cfc5dc0ca5686d85fb
Author: Zhentao Guo <zhentao.guo@amlogic.com>

media: dt-bindings: Add Amlogic V4L2 video decoder

Describe the initial support for the V4L2 stateless video decoder driver
used with the Amlogic S4 (S805X2) platform.

> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml=
 b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 0000000000000..d350b3e68a389
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml

> [ ... ]

> +  reg-names:
> +    items:
> +      - const: dos
> +      - const: dmc
> +
> +  interrupts:
> +    maxItems: 2

[Severity: Medium]
Does the interrupts property also need minItems: 2? Since maxItems: 2
implicitly allows minItems: 1, the schema allows a single interrupt.

However, the driver explicitly requests index 1. A device tree with a single
interrupt will pass schema validation but cause driver initialization to fa=
il
at runtime.

> +
> +  interrupt-names:
> +    items:
> +      - const: core_hvdec
> +      - const: core_vdec

> [ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - amlogic,canvas
> +  - amlogic,secure-monitor

[Severity: Medium]
Is interrupt-names intentionally omitted from the required list?

Other properties like reg-names and clock-names are required. Omitting
interrupt-names makes it optional, which fails to enforce explicit hardware
description for multiple interrupts.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
> +    #include <dt-bindings/power/meson-s4-power.h>
> +    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
> +    video-codec@fe320000 {
> +      compatible =3D "amlogic,s4-vdec";
> +      reg =3D <0xfe320000 0x10000>,
> +            <0xfe036000 0x20>;
> +      reg-names =3D "dos",
> +                  "dmc";
> +      interrupts =3D <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
> +      clocks =3D <&clkc_periphs CLKID_DOS>,
> +               <&clkc_periphs CLKID_VDEC_SEL>,
> +               <&clkc_periphs CLKID_HEVCF_SEL>;

[Severity: Medium]
Should interrupt-names be included in this example? Omitting it provides
an incomplete template for device tree authors.

> +      clock-names =3D "dos",
> +                    "core_v",
> +                    "core_h";
> +      power-domains =3D <&pwrc PWRC_S4_DOS_VDEC_ID>,
> +                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
> +      power-domain-names =3D "dos_v",
> +                           "dos_h";
> +      resets =3D <&reset RESET_DOS>;
> +      amlogic,canvas =3D <&canvas>;
> +      amlogic,secure-monitor =3D <&sm>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-b4-s4-vdec=
-upstream-v9-0-72fdb0d71b02@amlogic.com?part=3D3
