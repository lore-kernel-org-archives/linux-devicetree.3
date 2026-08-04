Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F7D34AB14
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857247; cv=none; b=Qi3v9opQIWxfhxm4DBv4/oU7rMyiU8WDe2oRWqFr0XlHL9SI0X/XY45BdN9lL/XHF6Pl3+a2ZAKpO7j5/0F+40R/HssMyJHy12Gm8rMSNYph5yCjSJUEVopvFxua/jEEVniFaaI7MImbylQ1zpsfyzg556a5dScEhgaWbZH43U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857247; c=relaxed/simple;
	bh=EVKEVz/HgkMRCWzJawjGWD6na/IIelZSkE+d1xfTXMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vspl9PN/Mcab5CdumEhoOpWaUaMMidYtm8DieoqyExsfdxTS8riMCgpPOuFoyoTlRxVu3Qsty/lsTs8g2Dc06rLrGOyC2lD5309azzreHY+6Sv3RquGcZjMACiZ0k47hB6bogofVjv/Rgo3cfAx3ZZbTuTsfbi2La5J3ZoXeq3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+SE+0pG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+SE+0pG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E671F000E9;
	Tue,  4 Aug 2026 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785857246;
	bh=sJbIU10sAhMlD8ZJMf6rSDTgzhscmxxfwhLRHAl+c3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i+SE+0pGgmgfNvCGDRYM7ScnHyi0iJr0ZZ7ze/5A6m3xq6iBvg0gf49J5gLhRZDmO
	 YHutdPdO7BuqncqchE6XKBgObzup7LGf3SvF7JVwrKFm92/0gCm9qYd7Ww3b6JpSSE
	 1FfPh+H4k1qdN7D/jtl+Ik6C0wBYnmUk6UOLePADqRCSkzF3DvBsBC6ejOONQmEPS3
	 UzmqGO/3hsaUnwki8m/lnBZnybSdOh8mJOKLDNFoo8PSXyTU29JJLOOiDKiB0sIVUD
	 svXyHsHRhPy0vraTVpyrmUwcYTC1hupyARjWSTB3Os/FsSKB8oi8g/2/11D85uS/d5
	 zNqdXmeu2Srgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: regulator: ti,tps65219: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804-regulator-syspower-v1-1-b05af2081184@nxp.com>
References: <20260804-regulator-syspower-v1-0-b05af2081184@nxp.com>
 <20260804-regulator-syspower-v1-1-b05af2081184@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:27:25 +0000
Message-Id: <20260804152725.E4E671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch references a non-existent generic YAML schema `/schemas/p=
ower/power-controller.yaml#`.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: regulator: ti,tps65219: Use generic=
 power-controller schema ---
commit cf2a7a6bb686cde6c0c0239ec4f30d1057f13e9e
Author: Peng Fan <peng.fan@nxp.com>

dt-bindings: regulator: ti,tps65219: Use generic power-controller schema

This commit converts the ti,tps65219 binding to use the generic power
controller schema by removing the local system-power-controller property
and referencing power-controller.yaml.

> diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml=
 b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
> index 7c64e588a8b54..d3a82aa7319f0 100644
> --- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
> +++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml

[ ... ]

> @@ -99,9 +94,10 @@ required:
>    - interrupts
>    - regulators
> =20
> -additionalProperties: false
> +unevaluatedProperties: false
> =20
>  allOf:
> +  - $ref: /schemas/power/power-controller.yaml#

[Severity: Low]
Does this generic schema actually exist in the kernel tree yet? It appears
the target might still be power-controller.txt, meaning this reference could
cause dt_binding_check validation to fail with a schema resolution error.

>    - if:
>        properties:
>          compatible:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-regulator-=
syspower-v1-0-b05af2081184@nxp.com?part=3D1
