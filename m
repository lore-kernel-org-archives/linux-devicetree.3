Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D304746B7
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837158; cv=none; b=ZtAcyE2Zzsi+6mPPJ62P4iLCwx4/+CvvEwtGxm5Z1A+PQzS4VMw+dUyu5H+tGGdQb4B+MTK6nEZC2re4AvoJSmM8ykXv+7fjn1IZojGou7+mab9b3/QDIiZ6e0RQ1i2fWwF9f/jF1N+nLx11/yDUYLoUhSw49LCBRYvM9d1W5RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837158; c=relaxed/simple;
	bh=ZUEGUhz7L09GA5WM4RB9U2/ZNHD8geRXZFCgW1urNA4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UC9jCVThizy0V8LFOVxzHPreHwXBqTxt3pz2zQEC5MxurKrBAi0e3fZ9hMP6wxf2uENBl1Eai0SVDOLH+we2Jp+SUJ+WXO7MpDARfcXSWHYvSpH4UuVn06c2U/EN5GSzrsNfMNajXYVvcz7Jes2vwayLsVwoQjiJ+o7iN4V4Kl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZAT5MI4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZAT5MI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED271F000E9;
	Thu, 27 Aug 2026 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787837145;
	bh=pYrE83waRIALS8ZqemhmdSchGWWe64y/PP05TR6d+SQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nZAT5MI4ooJh3Me7SVYdVEYoQw6gK0X8cmABfG0Dnblo2xVSnOCuCzp6WutRMsngu
	 JYbfJEJNQMu5JXNOP9nQef5vWc3C1hp4pkx/4GYfPfxV2R2Ceh91IirLY4kTvXRijg
	 5m/xZRR5KBceBNH1wwk8TTrwmDo5goSV5X/eFYOf5ZXloTFDtDz/9NIe5qCtOEZ2+U
	 wFpGkiTTAfbNxTMiEae2ls8LT0dhRPBpaO77O6f0oUMdqM6QGrtnqPlWmxXgVcSBtQ
	 vAIZW9sHWWqHk5TpZ9PLNYmfG4U5qqcK9jCCqMT0obHQgY8VqCq6KNkdyDr5Tipe/K
	 A6l8/D+pXokUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: airoha: Document support for
 AN7583 USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260827131551.26725-2-ansuelsmth@gmail.com>
References: <20260827131551.26725-1-ansuelsmth@gmail.com>
 <20260827131551.26725-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 13:25:44 +0000
Message-Id: <20260827132545.0ED271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Malformed character range in patternProperties regex allows inva=
lid unit addresses.
- [Low] Typo in the binding title and grammatical errors in the description.
--

commit 4a5fe874f5d1686d215561949399a35ae4b5a15b
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: phy: airoha: Document support for AN7583 USB PHY
   =20
Adds documentation for the Airoha AN7583 USB PHY for the USB controller.
The binding details support for up to two USB 2.0 ports, optional USB 3.0
modes via Serdes configuration, and monitor clock calibration.

> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.=
yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> new file mode 100644
> index 0000000000000..7ec655253a8ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7583-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7581 SoC USB PHY

[Severity: Low]
This isn't a bug, but is the title targeting the correct SoC variant? The
compatible string and filename target AN7583, but the title mistakenly
says AN7581.

> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  The Airoha AN7583 SoC USB PHY describes the USB PHY for the USB contro=
ller..

[Severity: Low]
This isn't a bug, but there is a typo here with the double period at the
end of the sentence.

[ ... ]
> +patternProperties:
> +  '^usb2-phy@[0-9-a-f]+$':

[Severity: Medium]
Does this regex correctly restrict unit addresses?

The regex [0-9-a-f] contains a hyphen after a completed range (0-9), causing
the hyphen to be treated as a literal character rather than part of a valid
hex range. This incorrectly validates malformed device tree node names
containing hyphens in the unit address (e.g., usb2-phy@0-a).

Should this pattern be updated to [0-9a-f]+ to enforce proper hex unit
addresses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827131551.2672=
5-1-ansuelsmth@gmail.com?part=3D1
