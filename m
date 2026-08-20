Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2174D33D506
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212921; cv=none; b=aD3ysEDl+VdQUFzdFAnycM9lZWNIaJPsAIUSABupoarCAlJpF7Sa6igzI9TBtYdJopQWu6XpDr5DCiWEhF9Tp3Bh6w/x165epMIwnaFqXyJfYd/SYA1zduBHlEUbsJxWFN9OyY9trtZ7zKXAVaUeAE+3VFU+xGyDH7jmuWkfvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212921; c=relaxed/simple;
	bh=Kj/mYCqKtjKOX1tTTCrVF1TealxXHHWLe/qpEVPBXZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lA5tsx/9R7WG5fsecOp8YAJDEgWsEv7PHhz/riGKdFb9uc4QtqM66sYo2raQFr53mdTAaBkDgOJjco5dmXWqp+saHRAy0T9RCS866J4+FF/+Ay1VCHoRueTCUju/pQf7BGom59GgdXZrqa6amFtzjBMLAT/qE6qwP1UV7o9ww3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVaKqp3x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVaKqp3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5676F1F000E9;
	Thu, 20 Aug 2026 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787212919;
	bh=mdhlwyC9Tjn0RsijLBwHKCn2aHrwVbP6dgzSg1V7Q1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WVaKqp3x0qexngedD2sFNDNFR/Rq0seJ5z5bHq8IJue3MQdz0oXBqDEUOfZacwzhJ
	 3r7c8vpruUUZ6PusHjC0g3ZgOl8L4S6yP9VvJF5zrXMflRNrOsKqotghFbemraEIVD
	 SB0YHC0ZjW7kLyzuy9mP8HMnrA68d5PeSvcPgDW0TAL8oiaKOxyazN3Z3aw0A/iGif
	 fxidZsGURNOCmTxD0CuiJWRY8xKh1ZpFQVWUIYf1fZ4cRFQ+CxV+VGkuF0jy0FLwLp
	 rCAhcbnQej7HU3WVFSmSzHekXklER97f68NaZRGFHD4UYiujcrNI64x6/0ed5L8L/a
	 VoJlTstbHZwzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Shiyan" <eagle.alexander923@gmail.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260820075524.2056029-2-eagle.alexander923@gmail.com>
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-2-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 08:01:58 +0000
Message-Id: <20260820080159.5676F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The dt-binding schema uses `additionalProperties: false` at the =
top level alongside an `$ref` to `video-interface-devices.yaml`, which inco=
rrectly rejects standard video interface properties.
- [Low] The hardware power supplies (`vaa-supply`, `vdd-supply`, `vddio-sup=
ply`) are omitted from the `required` list.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 im=
age sensor binding ---
commit 9f105de6fb0990c272e7a588c7c4aea9fe0b6566
Author: Alexander Shiyan <eagle.alexander923@gmail.com>

dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding

This commit adds the devicetree binding schema for the onsemi AR0234 CMOS
image sensor. It defines properties for clocks, supplies, reset GPIOs, and
the CSI-2 transmitter port.

> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml=
 b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> new file mode 100644
> index 0000000000000..ee321acf22b59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> @@ -0,0 +1,121 @@
[ ... ]
> +allOf:
> +- $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
[ ... ]
> +  vaa-supply:
> +    description: Analog (2.8V) supply regulator
> +
> +  vdd-supply:
> +    description: Digital Core (1.2V) supply regulator
> +
> +  vddio-supply:
> +    description: I/O (1.8V-2.8V) supply regulator
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port

[Severity: Low]
Should the hardware power supplies (vaa-supply, vdd-supply, vddio-supply)
be included in this required list to ensure the physical power routing is
fully described in the device tree?

> +
> +additionalProperties: false

[Severity: Medium]
Since this schema uses an allOf $ref to video-interface-devices.yaml, will
using additionalProperties: false incorrectly reject standard properties
inherited from that schema? Should this be changed to
unevaluatedProperties: false?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820075524.2056=
029-1-eagle.alexander923@gmail.com?part=3D1
