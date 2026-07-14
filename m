Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E42035F60E
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784062243; cv=none; b=CIAeeebr1LqK2lbP6gzOrH2QXCpLav6UJ15m8Z1gswiv4MSiXHsxoCDil4xey1xMGrzyhtD839T55/sNalULniQQVzIXJSDK8J6XlfVDUwQyo4TP88c9Pr1ZPprtgsfYL8pYO+pcDrsa5F8bbRvOzOXx6eNIeWigGm8uMYwRBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784062243; c=relaxed/simple;
	bh=TtNZwFDHlvab1YzXtjcL3Rv5TWQMXZUH2HNhjNv5qBk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lBgAw0wHrjL6nYUH1olbDFOsSMUKr3au7fYRD4PrEBlDftO8v74Sz5xuNZMwxnRG0vmzGB0tNhBi52drBWdjkXAoPp0UVK5tQGzSA4M405KM9Jq6Ijx/fCuknvYT80AVg9dlmwOkxtuQxWKBBMtfLMZ21kTt03MoGoblipIgDQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJqlp0Qi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJqlp0Qi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7C51F000E9;
	Tue, 14 Jul 2026 20:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784062242;
	bh=ZHdwRRc9b1ILwlDWzLf5cUbjGMNk0Bd2hEoEODSJuzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VJqlp0QiiOhXf/+1bDt/zkrcxbFgAX5OMFPja1SsRN9a4THr4CAVdhbG9NiCO3Xdz
	 Qsbkjg91Of56lsTp9Mo2CDk057tw9zD3z4LzFixJ2UnjyJjZ2hWke0b2DOh6TazWsk
	 wak490gZHorwZjJqH6iEVx3Vx9vf4Dcd3Nm7YzV95oX+ZizDZy7cbYyftWheoGe368
	 pb9vo3W1wjKo0OnDkcAz8q4rU/6n1KmeOfuvh57dmkVs/H9FfXDf1jKRcNKT3gPJzR
	 GVOkgob3KELV6TQkhTNQT6UZ2WUeRDngLUOobJRA5Hq9Z1jEc+C9rRwIkfy6REE2iK
	 U7OidKjGbi6uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: rockchip: Add Luckfox Pico
 Mini B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714193656.2196447-6-sjg@chromium.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-6-sjg@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:50:41 +0000
Message-Id: <20260714205041.CB7C51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string block for 'Luckfox Pico Mini B' is inserted o=
ut of alphabetical order.
--

--- Patch [5]: [PATCH v2 5/6] dt-bindings: arm: rockchip: Add Luckfox Pico =
Mini B ---
commit 61521ad6f3be156c0a561b23d28c5db096f06212
Author: Simon Glass <sjg@chromium.org>

dt-bindings: arm: rockchip: Add Luckfox Pico Mini B

This commit adds the device tree binding compatible strings for the
Luckfox Pico Mini B board, which is based on the Rockchip RV1103 SoC.

> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 1a9dde18626d0..711029ee78af2 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -813,6 +813,11 @@ properties:
>            - const: netxeon,r89
>            - const: rockchip,rk3288
> =20
> +      - description: Luckfox Pico Mini B
> +        items:
> +          - const: luckfox,pico-mini-b
> +          - const: rockchip,rv1103
> +

[Severity: Low]
This isn't a bug, but is this new block inserted out of alphabetical order?

The file generally maintains entries alphabetically by vendor prefix.
Should this luckfox entry be placed alongside the other luckfox entries
higher up in the file, rather than here between netxeon and onion?

>        - description: Onion Omega4 Evaluation board
>          items:
>            - const: onion,omega4-evb

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714193656.2196=
447-1-sjg@chromium.org?part=3D5
