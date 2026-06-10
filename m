Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1C3344DBB
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110455; cv=none; b=NhICkb3xzr5RDBZBAwdbNNkEUO51dzlDQc5BIb+kfZWAekZQI8AzLjmzqIP/IlqoyuT/NUToHUq0Cw0j9lDvhxOidgffuNtrpFgg4YrPLwao8eTKLBgu8wOi/SRonq/1ME+GPBkJRx3Re8MkzI+qPi0V6+YZELnDG/3CVwS6Ock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110455; c=relaxed/simple;
	bh=CDEbs87qhymATKzQ2lkKVCIvGw+evCCTq9N79cQEPUk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QzPZP4Fz60puD+l9HwF+IhpbgsiaNBmtdTo6ryVuHWhOr+hex+utikzhl9GNxu0vRGG7RwGHTtfmnwZiILDO8hpej9brSO0t++mZODJrIfQsAx+whLP+bS/f1txGggHTymRJ0ozKHOrymVIELTHHAZNkxpnQjtG+LxuJ982oTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4tZFeht; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4tZFeht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE8A1F00893;
	Wed, 10 Jun 2026 16:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781110452;
	bh=ZvZIX8lmkcHbCHcb7V6Ou7kKGR1t8AdqXfXbDIXt2Ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4tZFehtlEkYpUEBX6v2+ysc7Artr8i/PaXy8FSfEA04RFLXI29Ag6mHDj436zu9x
	 Ed19oObVSpO4j9sNvfntL3a5JEQolQE/YHuwqIsh/ZslTkA94mdrIVKOVFkrVaaaai
	 2CH4wBfa7oHOhNUqv+XmFg6D85cV8WZuCxciZmjtJnxH9ij1S9uIgqfh5lfLM4x5ec
	 Jz6oyTPcC6cUdIBQIYop55Dlfhhh710MKmrqgGm+8fOf6h6P0sT2pFhqEEMgBP09Pq
	 SmjnjlXk4E2ofpj+icoQ4Z8vVJK6fNUbYgxqivECh++2eHgnAjWCVysbFrziX1Dy0+
	 HITqakeb0e44Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amit Barzilai" <amit.barzilai22@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260610164428.180091-2-amit.barzilai22@gmail.com>
References: <20260610164428.180091-2-amit.barzilai22@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:54:12 +0000
Message-Id: <20260610165412.8EE8A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing type and value constraints for `rotation` property in devic=
e tree binding.
--

commit 4e4bbc4176c7e781dd970cf6e2d43e667642bddd
Author: Amit Barzilai <amit.barzilai22@gmail.com>

dt-bindings: display: Add Solomon SSD1351 OLED controller
   =20
This commit adds a new device tree binding for the Solomon SSD1351 OLED
display controller. It defines the standard properties and builds upon
the shared solomon,ssd-common.yaml schema.

> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
> new file mode 100644
> index 0000000000000..a7d77132faa63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - solomon,ssd1351
> +
> +  solomon,width:
> +    default: 128
> +
> +  solomon,height:
> +    default: 128
> +
> +  rotation: true

[Severity: Low]
Does this permit the rotation property without enforcing type validation?

Without including a reference to panel/panel-common.yaml# (or a direct type
definition), dt_binding_check will not enforce that rotation is a uint32 or
restricted to valid degrees (0, 90, 180, 270). This could allow incorrectly
typed device tree entries to pass schema validation but fail at runtime
when the driver attempts to call device_property_read_u32.

> +
> +required:
> +  - compatible
> +  - reg

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610164428.1800=
91-1-amit.barzilai22@gmail.com?part=3D1
