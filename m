Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB85411F93
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220576; cv=none; b=fZ7k3V0IuRKqjU4sHnC81ZSE1+u292VPBSo94jo9eILZ6dQEhTT+I49S9qvY8ccd5fGjXxSKnwi2sfNKABD6uAg+2STNIqCeLxHXoLNyqwTyKI9pj/zwZC5QV++A2aR8r/y6QrAxEzUYmq/w8y3hFXAzoucrrHlC4LbqnUNJCD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220576; c=relaxed/simple;
	bh=d2M+ppqL4KdUZjH0kPJ9u/6WLbyBpKvn5yUbL6GgJFE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PAsD89SQpdqAh3S+BrrLMk1run9dkIG2dKR3KaaWlhRDfqUrnjalZTGOt1oDmKXwnA9DkrZAbhSiSl11D0ePnNgKtADcbxvr7aHlRFlH1LVgLdaNAo7iFcBymhPPZsm2hbzP5uIdPCJQeMXAPukBB5gCzCnwzi+gv5puuLwmi4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1Ouk8yp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1Ouk8yp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3581F00A3A;
	Thu, 20 Aug 2026 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787220567;
	bh=ZwyQNCRPy2vrN7DkZ/3c4ztYfBQrfBuQLHybXC5bz+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a1Ouk8ypdgTTgZid1VCoMRP+52VC2hKEi0Z6l37MtfQ5Yqth1trKKozNW+aocZRuT
	 reWuZjYsP/oQjRo7R/c1Bl1n7LuN2Q4XES9bgy5g8W8Hi6wmLK2t9JNv2hOwk+eWg8
	 E/xo/rR347eFH6xbVQ58oSZe9IhGYMEaYAoK9jVk02GxQMb9IbDdU5+bHqow9YzQa9
	 IMX8rtaySmI/QqFfFaGMEGH119aS/NBJjBs8v/qZfi5punXfQ1PYRPut1eVzfEc3tn
	 QQx2N3jy5N+G+GIrkerRtpkrw4c1dGYXTgMYoIQf1yiX1swvg48OIEJ7YBg9Z5z0SA
	 qjFOg4skd0RHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: sound: renesas,r9a09g047-sound: Drop
 #clock-cells from required
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tommaso Merciai" <tommaso.merciai.xr@bp.renesas.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260820095742.3094558-2-tommaso.merciai.xr@bp.renesas.com>
References: <20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com>
 <20260820095742.3094558-2-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:09:26 +0000
Message-Id: <20260820100926.CD3581F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Dropping `#clock-cells` from the `required` list violates subsys=
tem guidelines for hardware blocks with provider capabilities.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: sound: renesas,r9a09g047-sound: Dro=
p #clock-cells from required ---
commit b7bf878068dfd3a3e9a8e0e64533cd2629a71799
Author: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

dt-bindings: sound: renesas,r9a09g047-sound: Drop #clock-cells from required

This commit drops the "#clock-cells" property from the required list in the
renesas,r9a09g047-sound device tree binding schema. It is intended to allow
boards that do not wire AUDIO_CLKOUT to omit the property.

> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-so=
und.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.=
yaml
> index d7fa165546985..e91de2db071da 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> @@ -298,7 +298,6 @@ required:
>    - reg
>    - reg-names
>    - "#sound-dai-cells"
> -  - "#clock-cells"

[Severity: Medium]
Does dropping "#clock-cells" from the required list conflict with the
subsystem guidelines for hardware provider capabilities?

The device tree binding subsystem rules indicate that when a hardware varia=
nt
retains clock provider capabilities, the corresponding "#clock-cells" prope=
rty
must remain in the required list. Will removing it allow incomplete board
configurations to silently pass schema validation?

>    - clocks
>    - clock-names
>    - resets

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820095742.3094=
558-1-tommaso.merciai.xr@bp.renesas.com?part=3D1
