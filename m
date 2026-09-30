Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D023A874C
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754615; cv=none; b=SVZ7WyzHP0D8tf1Ku3EKRZbdkS4WaYHrQD+d+m8fOadM2Blm10dOsM8E9EkuiPhDZnI1yYUwi9utPpXu56ztl0tN+1p9Mvcc07bJnhUgyZChm5Dh9Y6w5gRAB1Banuz76p3uWRT9rsWy98VkeBRtDYc/V/mfgJiQEMuojUP3Dpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754615; c=relaxed/simple;
	bh=H2sF0OpNZNUUbxMuicZU5pUCVOcYOKEoTG9k+0jLd8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EIJM2rFok3BWxvSGoA7PGc9cjVm8X3Xr8kRz/t8iNzongJPJpQdrrqgf8c5bzs8rtikle7R0Q0hVr4/GFFg177JYdHFsRm3ivZiXSI0kNB+12nzB4b37yYSiMax5AEIiFh/xbuMU5lsJwdW2lhf94bih83KeAgsfb9X1UbErJq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwsHpFFv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwsHpFFv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6291F000FF;
	Wed, 30 Sep 2026 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754609;
	bh=a9zDRIz+mu+BMVyGwPEmVh8VMXwBW7i3RviZARKWBLY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XwsHpFFvY6f7Lbt8LnppL5LI2hW4imyWGUgBSfo/HDFjk446iOREfwl7gLQJkpWDg
	 H7elrIPD0+sspvE3HJb43enz/NndbsjrJrJDfSVHoQdvKx8ydrEh6tf/9rUS9B9v56
	 b1+fU8xkpEH0RSfsumP02cxmdG5HoWwBzH5JMUTllY4ryM/TTM+Y7B9Bc0t4wGsgOz
	 gjBFU44OjQhlfa/bh2cFmCwHQfjY4jhWNHuFyTd2cOK8ayhTdhWMPgIhwjyj71d7Pk
	 yqbGVKKwkV//Z7eH0GjO/kTLDH4NbwyBFP+wOAUDr6sXsZfZ2h6QI4JzUDKiH/gg+B
	 b7HIsF255Ko0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 2/9] dt-bindings: net: lan9645x: add
 LAN9645X switch bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929-dsa_lan9645x_switch_driver_base-v13-2-827c2d3617f2@microchip.com>
References: <20260929-dsa_lan9645x_switch_driver_base-v13-0-827c2d3617f2@microchip.com>
 <20260929-dsa_lan9645x_switch_driver_base-v13-2-827c2d3617f2@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:50:08 +0000
Message-Id: <20260930075009.3C6291F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: strict property validation disabled by additionalPrope=
rties: true
--

commit 37a55f2415392987ad4b328233f6c32282b21103
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

dt-bindings: net: lan9645x: add LAN9645X switch bindings
   =20
This commit adds bindings for the LAN9645X switch, which uses a fallback
compatible for the smallest SKU microchip,lan96455s-switch. The switch is a
child of an externally controlled parent that hands out one regmap per
register target.

> diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455=
s-switch.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan9645=
5s-switch.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switc=
h.yaml
[ ... ]
> +  ethernet-ports:
> +    type: object
> +    additionalProperties: true
> +    patternProperties:
> +      "^(ethernet-)?port@[0-8]$":
> +        type: object
> +        description: Ethernet switch ports
> +        additionalProperties: true
> +
> +        allOf:
> +          - if:
> +              properties:
> +                phy-mode:

[Severity: Low]
Does setting additionalProperties: true here introduce a validation regress=
ion
by unintentionally defeating the unevaluatedProperties: false strictness
checks inherited from dsa.yaml?

Because additionalProperties: true causes dt-schema to mark all unknown
properties as evaluated, it allows any undefined or misspelled properties
inside the child port nodes to silently pass validation.

Could this also cause a regression in the conditional if-then logic below?
If restricted properties like rx-internal-delay-ps are specified on
non-RGMII ports, the if condition fails and the constraint is skipped, but
instead of being rejected, the property is silently allowed unrestricted by
additionalProperties: true.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-dsa_lan964=
5x_switch_driver_base-v13-0-827c2d3617f2@microchip.com?part=3D2
