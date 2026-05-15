Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301183F7A9C
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778884005; cv=none; b=GaEPVY+kWQbol3E8y3ad8aTwmBncp0MpHb8lTPgxrdR0EGABn08VZZRtz4ncjjEZ55SJqSrD/xYHYS0YhiS0LE2Ouv6RKTFXptezl89HMskzL1ysaN58tY/PoxiM+R/ZaXGDWlQJ0etDw/ZdhcNMAixPTrmRXcGO66lnrrllgI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778884005; c=relaxed/simple;
	bh=UI2/fh3cPIy0ZWf+Df7OdgC7cX6FZmlDLV+JeaA7/YQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TVWcyL17+YqILPkbZEOJwRNZr7A3XHRLGGsKaNjIf1wX4/4xYnEKVH5/kJI8jg1OY1NjiqFJmQ1GWmH6odvzk/0K9g0T6RyKwmd/8sCruIlXoukLmCmDz1UVZnbaNTyM6mHv82S9QwFnsL3Yd6zO8qUj9y3gKdauSvS/AN9NAd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=px/dk5XN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="px/dk5XN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D355AC2BCC7;
	Fri, 15 May 2026 22:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778884005;
	bh=UI2/fh3cPIy0ZWf+Df7OdgC7cX6FZmlDLV+JeaA7/YQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=px/dk5XNZqXWnDTNbJVxsNJJyl4qVJ+DXEJHe+uu2RGeMZaIOJkY6qSoHK1zc/vJn
	 o/yTgVG8c7sM1lF6cQNxV5RI3bqPA9iLkADL45CH/+FpXWhebra63jCH3K+LYH4PPk
	 tVDCKEaRSfhCQKiru+e06T/wrqbIuyH5yF6H57eib6AQNDfP9MXJjTNoxb13zHFdqG
	 78VnF1/2mXQFGBCKojTQgE5nC6bl50xEB0TDDQam81NVjJ5rsosoIfm+abzc51B1kf
	 c8s9uKVUU/hGf0NjTR7ynm4w9FlbrH9gFKZk7DIkQsMgdpqAB7j3jYiw43sTHGCSBL
	 n+4M8rQoZreAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 1/6] dt-bindings: power: supply: sgm41542: document
 sgm41542
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515221947.299229-2-macroalpha82@gmail.com>
References: <20260515221947.299229-2-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:26:44 +0000
Message-Id: <20260515222644.D355AC2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `$id` field in the YAML binding does not match the file path=
, which breaks the schema cross-reference system.
--

commit e462413669a11b133f4d59f276a9c7d14b146226
Author: Chris Morgan <macromorgan@hotmail.com>

dt-bindings: power: supply: sgm41542: document sgm41542

This commit documents the device tree bindings for the SG Micro sgm41542
single-cell battery charger and boost controller. It establishes properties
for the hardware's input limits, interrupts, regulators, and monitored
battery values.

> diff --git a/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41=
542.yaml b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.=
yaml
> new file mode 100644
> index 0000000000000..fa0d31e496f79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/sgmicro,sgm41542-charger=
.yaml#

Does the $id path need to exactly match the file name? The file is named
sgmicro,sgm41542.yaml, but the $id includes an extra -charger suffix.

A mismatch here can break the schema cross-reference system and cause
dt_binding_check to silently skip validation.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515221947.2992=
29-1-macroalpha82@gmail.com?part=3D1
