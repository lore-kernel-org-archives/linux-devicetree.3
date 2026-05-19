Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61873DCDB9;
	Tue, 19 May 2026 07:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176996; cv=none; b=ktMHwKnaSZ2c3D9Q2qOtliMLgaoO/W0Ixomo2kzsvfLcwOxT2m8YTBT3oXcI0uBYikpEMHzEcbIyXqYw4vn4MYl2LKP3UkqpcYYuQ4x2gBiuApVOX2m0EsAsXk3ApB3Pn4O4n+WsU9osEnHa2cwisriy44nsWLXEolFNi03JtRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176996; c=relaxed/simple;
	bh=cLd4m57mpBaYoihLDOXHvCVLW+dfMd03GgAYoXpqAxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHKghSQoTTB+w6vhkuKb0M99AKeh0OJiuOv8KoB+GxrhEhHMCyS5yMV/qwWhYJnQmSqNbZDVNKbpyi8Wj5LGK/idwiO3kn4GsvMl8u6IHYq/QjssIZ9j/nztCVVekzK7+4pWUc7h9R02NFs8mhiQLoeJg5zpVY9TubY/tJEkTo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuD7cT3H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuD7cT3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4602C2BCB3;
	Tue, 19 May 2026 07:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176996;
	bh=cLd4m57mpBaYoihLDOXHvCVLW+dfMd03GgAYoXpqAxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZuD7cT3H1YbwslTeLkh/rkyhWE/ENWEoExr/YeakuKViGflTn6HjG6/OYEfI8zZJS
	 vS2nzyUVaaHjILg0Gap4IRD0TVwZfo+0QW1y69Qbu5TM4gq+uZg6pDG/+dldUNyNrs
	 c7CTjMvk5lGeAh4/gGEwT+8z3P15HcoKuGOilqFkQT3xzLvrSXZ+fyOZeYkOTkqj8g
	 BSPoFMvRoMEHNTW37yTzQjCM1d/28cWfRbN7putRJPQV3JCibTo+7tlxKBMpX1FQlC
	 k9sAf6W8QjRHs1A4tdH0L6ep7e/S1pPEYN7yZu//jyJlTudeNN6u16ALYfgdRrL2ve
	 u3Dtp7Gvkxfuw==
Date: Tue, 19 May 2026 09:49:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Message-ID: <20260519-classic-victorious-marmoset-45cecb@quoll>
References: <20260518-sc2730-regulators-v2-0-9a5b3a7b1e49@abscue.de>
 <20260518-sc2730-regulators-v2-1-9a5b3a7b1e49@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260518-sc2730-regulators-v2-1-9a5b3a7b1e49@abscue.de>

On Mon, May 18, 2026 at 05:59:47PM +0200, Otto Pfl=C3=BCger wrote:
> Add bindings for the regulators found in the Spreadtrum/Unisoc SC2730
> PMIC, used e.g. with the UMS512 and UMS9230 SoCs.
>=20
> Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> ---
>  .../bindings/regulator/sprd,sc2730-regulator.yaml  | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/sprd,sc2730-regu=
lator.yaml b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regula=
tor.yaml
> new file mode 100644
> index 000000000000..1d460bf90fbd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator.y=
aml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/sprd,sc2730-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unisoc SC2730 Power Management IC regulators
> +
> +maintainers:
> +  - Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> +
> +properties:
> +  compatible:
> +    const: sprd,sc2730-regulator

As I requested last time, please drop the compatible completely. Not
needed and you do not have any dedicated resources here which would
suggest it is a standalone or reusable device.

Best regards,
Krzysztof

