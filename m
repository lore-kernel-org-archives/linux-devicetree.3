Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF51F3CFF46
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140297; cv=none; b=i0+sZwlTOcycotI66pT+NRYFlvl5Zx/gtjBcTYq6kNhJekhDiI6YieksSF3SMMN4KIaHpHwpFxDeWehZZHPqE3AkzWAFi6O0plhCI12k62+iv+rmOXemRFzjY3+IxBWY2cfcqnwz2ncP/jhFXxuMHx/9FbfcmCYu6KMf5p441d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140297; c=relaxed/simple;
	bh=y2Jsu8fXXdK2nPux9ZL4eEE1TFfPO3b1KEuPBD6UDLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CuYsgJzmrSH8kPKnii49VpUOKsYA1vEsDLr+lB9DqKATtO3479IlNix6CNyAn7z0jV4g9oRoKVEe9R71lmdtLESe/I4sV7q3cfRKNxv2mv4s+dPKxjliuhoFyhLQn5cC4Lz6SnhrDIoeFGsPCdwGwE1M/tYSh/pSfND4b5Xy0Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEYayM4x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEYayM4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099501F000E9;
	Mon, 27 Jul 2026 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785140296;
	bh=jX8uGb6g78yUXdaGPWIY2g3Aa4+opdNsQNLbaJRXx8M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UEYayM4xLXhpq9IfBQuxXI15LJKd0lNKU9NiP58TzmZZX3G42ib+BoWc+QN9Cqnr2
	 YlgpHsdg45qay0VVpy8ULCCGgayPdE5hdyok/YV3nps2I+x18SLS4aegqxPs97nxEI
	 mD0d00Wo19X8YWE5BfOdtnsucBzQhxBJkzCO8YcFFopi0aSMQ8mkCrLkRJMI74jUF1
	 gIlVo/UguaZexwwrhtmILR5ckT9Hkxso8Uj5KDUjFhbpsCsSaBrmn+2LlHb8Kd8WdH
	 Y9UsmROh63oXIu6lwgP7x2YhcHMC1W6Fr/ZQF7q8nfFgSqZ8Ke3Ak3CCIEwYTKEn6+
	 X2cECnWf93FEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: display: panel: Modify reset gpio
 number constrain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Nie" <jun.nie@linaro.org>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-1-c042266b9eeb@linaro.org>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-1-c042266b9eeb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:18:15 +0000
Message-Id: <20260727081816.099501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The patch relaxes the `reset-gpios` constraint in `panel-common.=
yaml` to allow multiple GPIOs, but fails to update the global `gpio-consume=
r-common.yaml` schema, which strictly enforces a maximum of 1 item.
- [Medium] Replacing `maxItems: 1` with `minItems: 1` entirely removes the =
upper bound from the `reset-gpios` property, violating the dt-schema meta-s=
chema requirements for phandle arrays.
--

--- Patch [1]: [PATCH v5 1/6] dt-bindings: display: panel: Modify reset gpi=
o number constrain ---
commit bef64e9dd2f24e3eff4806992787382fb7261e4b
Author: Jun Nie <jun.nie@linaro.org>

dt-bindings: display: panel: Modify reset gpio number constrain

This patch modifies the constraints for reset-gpios in the display panel
bindings to support panels that require two reset lines, such as the
Synaptics R63455. It replaces the maximum item constraint with a minimum
item constraint.

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
[ ... ]
>    reset-gpios:
> -    maxItems: 1
> +    minItems: 1

[Severity: Medium]
Does removing the maxItems constraint violate the dt-schema meta-schema rul=
es?
Array properties ending in -gpios generally require maxItems or items to be
defined to provide a strict upper bound. Leaving this unbounded could cause
the binding to trigger errors when validated against the core meta-schema.

[Severity: Medium]
Even with this local change, won't panels specifying two reset gpios still
fail schema validation due to the global gpio schema?

The global schema restricts reset-gpios:

Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml:allOf()
    else:
      properties:
        reset-gpios:
          maxItems: 1

This implicitly overrides the relaxed constraint in the panel schema. Does
gpio-consumer-common.yaml also need an update to allow for multiple
reset-gpios in panel nodes?

>      description:
>        Specifier for a GPIO connected to the panel reset control signal.
>        The reset signal is active low and resets the panel internal logic

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-sm8650-7-1=
-bonded-dsi-v5-0-c042266b9eeb@linaro.org?part=3D1
