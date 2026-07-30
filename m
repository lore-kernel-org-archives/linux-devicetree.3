Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84E237EFE5
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405930; cv=none; b=fAf2bnubRbEIY+ldaGNYxmFyuBUeKHS8EIkdC2kTbLGI1sUtJ9+OdhdiHMdC34LjJlyxwJn/tqQOepQOn5BHr0UFEAHckzDmIDcenQNOTfFpjKzXaBAwEAizMVHwHEwwz7vOzC230Kl6JGkrHR23uEMzoEaL1k0A9Y9TlA9MFYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405930; c=relaxed/simple;
	bh=chOkzH8fwSo8ZsHaeLtb8Jstk95wLF+BWX1y31kvOU8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T59LTjSLewmq2c+5mLqf47837gXnFtymOhsaXnEpD1bVsRCEeLoDCT+rwLEp/9jXiuteXAExUKLEPDn2Y9hbguNCItJrfKdh8T7vfFdrSM1Tada6bVMEIsDl7CN+p5MxTZ4Qy12R00cg8tsHMa9Jm0kPlYjrfadENr6ZwtCwtVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuwJhKe0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuwJhKe0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604A61F000E9;
	Thu, 30 Jul 2026 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405928;
	bh=ja7sKeIcMMr40p/PX6afQa8om4Ao3bieHhCBfhc64h0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SuwJhKe07QRxDB+/asE3C2xbpJx+T+z+EWOa1HfIm8jpF+U4+fpsSHbA2clcKXtQ/
	 Qw9U1rw1wV44bII0yrMX8+KDSThCZBzBi0mMnRxTvvgyfXzKda1LvWTiBxZt1wRY8N
	 C7+mziiNKbuTSu5T+3s1hr/T+w2JfvcXdKsi7kL8Cq9msfV1VPk6qAst1ue4kqH2FH
	 1LtlQZyiByn1KSpRFLNX9iCXDxJpJXtU2PZt+nFlWZtnl8g7uaGVAXO95xexSqyynV
	 T2/8jTm3mmcD3+tg8JpfSZIN5U53iNOXWHPy2Y1WkV7YayIJk9nQC6CjH/ilWDJgp9
	 ndvROVjZQComA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/24] dt-bindings: clock: mediatek: Make
 '#clock-cells' required for MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-1-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <20260729-mt8189-clocks-system-base-v4-1-e356b813a64c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:05:28 +0000
Message-Id: <20260730100528.604A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The `#reset-cells` property is defined in the schema but is not =
conditionally enforced as a required property for the `mediatek,mt8186-infr=
acfg_ao` hardware variant, which acts as a reset provider. This is a direct=
 violation of the Device Tree Bindings Subsystem Guidelines ('Hardware Vari=
ant Required Properties').
--

--- Patch [1]: [PATCH v4 01/24] dt-bindings: clock: mediatek: Make '#clock-=
cells' required for MT8186 ---
commit d082742287ef7b48509a30300eb93b62072332ca
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8186

This commit adds '#clock-cells' to the required properties list for both
the MT8186 clock and sys-clock device tree bindings. This enforces that
clock provider nodes properly define this property during validation.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-=
clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-cl=
ock.yaml
> index 1c446fbc5108c..f8acc02cafeeb 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.y=
aml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.y=
aml
> @@ -45,6 +45,7 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - '#clock-cells'

[Severity: Medium]
This is a pre-existing issue, but while we are updating the required proper=
ties
here, should the schema also conditionally enforce '#reset-cells' for the
mediatek,mt8186-infracfg_ao variant?

The '#reset-cells' property is defined in the schema but lacks an
allOf: if-then block to conditionally enforce it specifically for the
mediatek,mt8186-infracfg_ao hardware variant, which acts as a reset provide=
r.

Without this enforcement, device trees configuring the
mediatek,mt8186-infracfg_ao variant but omitting the mandatory '#reset-cell=
s'
property will silently pass schema validation when running dt_binding_check.

> =20
>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mt8189-clo=
cks-system-base-v4-0-e356b813a64c@collabora.com?part=3D1
