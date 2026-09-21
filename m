Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237153C9ED9
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033683; cv=none; b=sJakGWBOSfr6wXSuR844cBZcu/uWTTMy0rZUvvmS7aZAApFXN+S6d1ExT+qE4huHa1i2FRd96SUhhb+bEFS81GJdy9ZSXww+L/UWJoWQhvIXRvqDmshNiJEmNAaNGbObJHNjHFE3s9d0Bu1Iall9QkzmMNkPnEK+OmbvsxpoKWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033683; c=relaxed/simple;
	bh=IEmO1LyDeISoFMS4pdXVrZ3Lfox8HKhO3o6g4pIbuzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tUzNU0RQoxLgcslXr+yJCisq8Bw0EEMrXSC/JVIyaOPYa4xdPtU/85lEVoUIh2XAHznS91x9xb3GbcueJkYmKulGxboRqjhTqJ6vso/heNYv7UJJLyQH1thUFbOpbB/b8MelS97dnZSWpqcVNVXnQImcoIQRsP/75mgsXE4XcT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtqNL5oZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtqNL5oZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81351F000FF;
	Mon, 21 Sep 2026 23:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033674;
	bh=WtjYQ55EbW4QR+FUo8hn5ZlYo0bJf4Aptlpjo6SzzyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZtqNL5oZyeBmJeRuxJN4DFHwDhoFPXV1ze0jyvYZxc3pPy4LUi1me3g1Fetu5pGhG
	 ApG7vN332D04Xd0vt/skoYcRn6PL7jK2dXt4EGK9/qoCim5RDQav8O0DSQsLfUxWdx
	 U6ejslVPqCxRKyt2xlz1jmCGjpxgMKVloSlCQlWtctYhpB0Kky/tXUMGJwvXooBdMm
	 LxjasWEFV3LuVDQmi/xAWoTYNPGC4q2DZoyi2qqvBON14+S117SXAK6P5OayQi4xcH
	 T9KTiOH1uL/fZooDxzecvgRZkUd7IovPgySQmbp3KeJ6lxYKd0gmnoI4/6FANGHx6D
	 W7zaoLrUUb7DA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260921232551.3129244-1-robh@kernel.org>
References: <20260921232551.3129244-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:34:33 +0000
Message-Id: <20260921233433.D81351F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: rzv2m: driver rejects power-source leading to silent prob=
e failure
--

commit d9bace34984ccb180f68f3bb012d8d6364147a69
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: pinctrl: renesas: Allow power-source

This commit updates the rzv2m-pinctrl device tree binding to allow the
power-source property. It officially permits configuring 1800 mV and 3300 mV
I/O voltages.

> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.=
yaml
> index 88b2fa5e684d8..f24d05136f197 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> @@ -73,6 +73,9 @@ additionalProperties:
>          bias-disable: true
>          bias-pull-down: true
>          bias-pull-up: true
> +        power-source:
> +          description: I/O voltage in millivolts.
> +          enum: [ 1800, 3300 ]

[Severity: High]
Does this cause silent probe failures for devices using this newly allowed
property?

By adding power-source here, the device tree can now officially configure
PIN_CONFIG_POWER_SOURCE, but the driver actively rejects this configuration:

drivers/pinctrl/renesas/pinctrl-rzv2m.c:rzv2m_pinctrl_pinconf_set() {
    ...
		case PIN_CONFIG_SLEW_RATE: {
			...
			break;
		}

		default:
			return -ENOTSUPP;
		}
	}
    ...
}

When the device probes, pinctrl_bind_pins() attempts to apply the state, and
this driver callback falls through to the default case returning -ENOTSUPP.

The pinctrl core (pinconf_apply_setting() -> pinctrl_select_state()) treats
this as an error, un-applies the mux setting, and propagates -ENOTSUPP.
Finally, pinctrl_bind_pins() ignores the error, frees the device's pin
container, and allows probing to continue without configuring any pins.

Will this leave the device with unconfigured pins, resulting in successfully
probed but non-functional peripherals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232551.3129=
244-1-robh@kernel.org?part=3D1
