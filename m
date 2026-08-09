Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E064D309EE9
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306640; cv=none; b=o/HMNZ1AND/hUahdZvJ4jVoB2KqSEgaCNi9KsLqt6AxjUkukE2qQIXAfMh7M/sqjSTsKnBWssMr0x2gIQ0X8TaEVPlv5dbxeU1oL09vk/YEMdV0N3kdY1ZtoN8Dcjl/5J3UF9PHguSHQsOMgG+pa31yzaDsFmxsxAoN+Lu+NX0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306640; c=relaxed/simple;
	bh=mYnoknxooikhEGp59tQwcThBql3ZNGy0/p55rs9Mup8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aOUyqgxqSW/1k969nv7/ujpeM/U5rQyB+PmXJAqvf0VpwzEdM33Fwb3d6Y72fhIsYQsp7ZJlRXcVZeWSIW/tNBlXAoTTPmLQD7N1UOKm/Ux1NoAlLS+AC9t0sqoyt9DJwGfmU4yXULCkouonhOL3DX6G/Ei/Vy9WYit9AyaBPCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCLfi2lN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCLfi2lN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDF41F000E9;
	Sun,  9 Aug 2026 20:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786306638;
	bh=qQyTAwnkEOdAypyH9vKKuSv4GvuvP8c6s+t9W6np4D0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cCLfi2lNVycTOzCua8N4oL87dJCgGc66vAjwJjtpm+nw5TlYcTbI530sYeyqks1/9
	 fqRHC1fBw3B54DQHxzdfU/1BzOFiVTAhmxgZ2Pty5G22J5IOIlzFqsRByxTcfm2q1/
	 QNQDgX88Lm8Bp9DDrD+hWFtPQLJadAUV+pwItiyY0/VccjBuFEJINmTUTDIQrbfCqq
	 rNKP6PhbFu0DOVJxDrNgfYoFwfmddisruqu1qUszJ5fkYkhmcgNEGy/zm6dA3UtsT0
	 pNdrfP4Cuxg0kiIugPbSxFrrTX2H9Ps3F70C23jF2JqGCS4e9euIxy8CKAh86df67K
	 zoADgBY08hJhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Document 10" Raspberry
 Pi Touch Display 2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>
References: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:17:17 +0000
Message-Id: <20260809201717.BDDF41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect use of `additionalProperties: false` when inheriting f=
rom a common schema via `allOf`.
--

--- Patch [1]: [PATCH 1/4] dt-bindings: display: panel: Document 10" Raspbe=
rry Pi Touch Display 2 ---
commit 24ac9b0c966cb6294b25fc745f5c098627bda264
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>
Date:   Sun Aug 9 19:58:50 2026 +0000

dt-bindings: display: panel: Document 10" Raspberry Pi Touch Display 2

This commit documents the 10" Raspberry Pi Touch Display 2 MIPI-DSI TFT LCD
panel based on the Ilitek ILI79600A controller.

> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili79=
600a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili79600=
a.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.ya=
ml
[ ... ]
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
[ ... ]
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Medium]
Should this use unevaluatedProperties: false instead?

Because this binding inherits from panel-common.yaml# in the allOf block,
using additionalProperties: false will cause the schema to reject any valid
inherited properties (such as rotation or port) when evaluating a device tr=
ee.

Using unevaluatedProperties: false would correctly evaluate the properties
provided by the $ref, which would also allow the redundant local declaration
of backlight: true to be removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809200107.8429=
45-1-marek.vasut+renesas@mailbox.org?part=3D1
