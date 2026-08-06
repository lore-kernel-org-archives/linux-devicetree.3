Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FB83F4139
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012322; cv=none; b=j6x14nj6xt8QEzuSEhY3i0XMBDdYgAT9ba6lD1zBZsrhIS/LB5kopUyUz0QWrUBoePdSm64ajdeEUtsRwgHXxw0FJNkuQ/sm2QImslWHkxCD/TP5OvRscofzxISEFtoffFK0XwNMpvldG3G1RjTRf2NpeXma99yBQeX7Kvq+DEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012322; c=relaxed/simple;
	bh=B78AX1Gm4cA9kmo2F3gaG3TZbJAZV3CAbEPDzQRB/fo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sYUQUREJ8I5GAFZ3ia4MH1gclhbmKqjAW8O/9/6uGYtkkxlw+OavNeFttQCF4r8sVtyK/+eFq6tN0hTvdyRD0sxcQJ2cDNPyfTJtndTVpnLSD8xrnab/3Yb8goC6K2YyTUOV+2tfrFCXeqtRrorh0nKReceZCtqHXQablPrldYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uyd5F3MZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uyd5F3MZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5BD1F000E9;
	Thu,  6 Aug 2026 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786012320;
	bh=97HIiI958F8xiDat2XIdroswU1+nCslxC+xaXkTsN70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uyd5F3MZfYbLwqVInvIMxf8xtp9wninv0CQHSoicc053yk7zPe+6yCQ3Q9OxnpHKg
	 qpsPIS8O/pYmBaWkQnQAZ7o18Rm7iR1iQsJkkDTmCOIIGpED7q/o5/dHU59Y8mdUYI
	 BbxzlwVfnZ/Az3koSmT9KncwSuuLBSi1K4zQvmwQqNv1BlvUuvy9vQB8HE4J2IOV0n
	 LYe0jdMr07ZjaMhypqkcvShPcln6sQZHV9jtIqj28hDS9d/Kjc2OoroCOdTDMgHRgy
	 c88ZmTJxkgRBTyY7SZD76D/LH1n7J//QZ32axL6phz/zTNXfdAIAMsN3s6DXO2gbSB
	 fWwgqthzqoeBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/10] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260806102236.149159-3-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
 <20260806102236.149159-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:31:59 +0000
Message-Id: <20260806103200.7E5BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `regulators` object node lacks the `additionalPrope=
rties: false` constraint, allowing arbitrary unvalidated properties inside =
the node.
--

--- Patch [2]: [PATCH v6 02/10] dt-bindings: reset: renesas,rzg2l-usbphy-ct=
rl: Document RZ/G3L support ---
commit e1a3fbe1da9d759b741f1c475a7daaf283958b63
Author: Biju Das <biju.das.jz@bp.renesas.com>

dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support

This commit documents the Renesas RZ/G3L USB PHY controller bindings.
It introduces a regulators sub-node with per-port vbus0 and vbus1 entries
for the RZ/G3L variant, as it differs from the RZ/G3S.

> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy=
-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-c=
trl.yaml
> index c83469a1b379a..9e0c450976573 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.y=
aml

[ ... ]

> @@ -50,6 +51,28 @@ properties:
>      $ref: /schemas/regulator/regulator.yaml#
>      unevaluatedProperties: false
> =20
> +  regulators:
> +    type: object
> +    description:
> +      list of vbus regulators provided by this controller.

[Severity: Low]
Does this regulators object need an additionalProperties: false constraint?

Without it, the device tree schema will not reject undefined properties ins=
ide
the regulators node. Misspelled properties or stray sub-nodes (like vbus2
instead of vbus1) would silently pass schema validation.

> +
> +    properties:
> +      vbus0:
> +        type: object
> +        description: Port 1 USB VBUS regulator

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806102236.1491=
59-1-biju.das.jz@bp.renesas.com?part=3D2
