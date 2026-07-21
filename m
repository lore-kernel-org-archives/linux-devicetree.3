Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DBA446C09
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628333; cv=none; b=VDF6Nvq1p1+T2sL4lmdSho0xxuYBDbVxWl3KdvvGcnHVfTxEeiMss89cI+UN1J1nVnpddyKcGxutv/Sr/qoO/S14BfTthlOQzhay7TZmHCWW4JUY4PJLJ5/28JAwl1O2gl+1ub+cEdKRHyezEAxeP9DZyLNOFdXJIHP5RGX0Xls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628333; c=relaxed/simple;
	bh=7EHV4UDfpm2HmFsUSfh4KBuoruAy0LTgVZMwQ5+56oQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FMmXVMLkf5POCsk/Ed76jzbBrOE3NMAreIIk9BoN506jpi2h/v1C39xO9VnJjanUJilZQEwldYy//ZsKfpvgiDORX0afekBCQ3wogVYCeflsbUIKfGlTaCkHCoy+sD3r9V0TVRFLEBKEIxIlAoSSfCobZ5FxF0RmjH/n8uB8hag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogW3d5y+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogW3d5y+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915661F00ACA;
	Tue, 21 Jul 2026 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628330;
	bh=BZQl9MskvlL8jY+qDGLb/xXCEDGc9b+McW4/6KBgaP8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ogW3d5y+oIV5seGGZt/LW9THC8tAh0nRgbSO7Kb9PrT1ayPDkBRG7NRHiibP5Utc+
	 umnhww+S7bbCTsToWR4GA7lBpxesxU4+EwIqLSFHW75p4UV1JYIIjEbGs5/EeO9rj/
	 Xj4henI81z51crFHRzS9GI3Hmxvtc77oWUPKdvUH1Bqc0hURFlnkFcEhCJVTx4p6MO
	 uKswy9ek9WZP+eho5H8mIAame+Ahka2D5SdTNt2go9b+hsKDw7NQQg7sbCvqgNyf87
	 ILbuSLST8EJeCV1h3aO9/JkALD5apxc755yMPGScRQHpH/v7DmUe3SbGwbIzkdPZPq
	 /9le5sJyRwPhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/18] dt-bindings: clock: mediatek: Add MT8189
 system/base clocks and resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-8-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-8-8e6d99ab3ad2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:30 +0000
Message-Id: <20260721100530.915661F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `allOf` conditional block uses `enum:` instead of `contains:=
 enum:` to match the `compatible` property array, breaking schema validatio=
n for nodes using `#reset-cells`.
--

--- Patch [8]: [PATCH v3 08/18] dt-bindings: clock: mediatek: Add MT8189 sy=
stem/base clocks and resets ---
commit 616648b8742d465d98b3a1aab07efa4362f930aa
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: Add MT8189 system/base clocks and resets
   =20
Add compatible and binding headers files for system and base clock
controllers and reset controllers support of MediaTek MT8189 SoC.
Also, add compatible for frequency hopping and spread spectrum clock
functionality.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> index ab9f8cb7dd6ee..380dab8f4e983 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
[ ... ]
> @@ -133,6 +146,8 @@ allOf:
>              - mediatek,mt8188-imgsys1-dip-nr
>              - mediatek,mt8188-imgsys1-dip-top
>              - mediatek,mt8188-ipesys
> +            - mediatek,mt8189-ufscfg-ao
> +            - mediatek,mt8189-ufscfg-pdn
>      then:
>        required:
>          - '#reset-cells'

[Severity: Medium]
Does adding these compatibles to an enum block instead of a contains: enum
block break schema validation for nodes using #reset-cells?

Because the compatible property is evaluated as a JSON array, checking it
with enum attempts to match a string against an array, which always fails.

Will this cause device trees that correctly specify #reset-cells for
MT8189 (and existing MT8188) clock/reset controllers to be improperly
rejected by dtbs_check when the condition evaluates to false and applies
an else clause that unconditionally sets #reset-cells: false?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt8189-clo=
cks-system-base-v3-0-8e6d99ab3ad2@collabora.com?part=3D8
