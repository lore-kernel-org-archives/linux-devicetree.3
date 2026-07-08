Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645383FFAA6
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513860; cv=none; b=YX//bMtfewPAPc653bSw2ULPHBLmt9LqoIqV1IXz7iIwinAJwAhQD4mfa6xmPd5c+YFaB5INx7QUAWfEfvbYW84pPTPDSe6sV1R07M5JoS6HU4pQOHa681T2lpnJzZyMJFRGeH9hg3EjN7QadtKr1zKM5xkOImeo2fWCiTldAxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513860; c=relaxed/simple;
	bh=M3MSOtvVshAXs53n51GfAYLh4uYgUHaD6Amk/OKTUDM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mte3C1deYFEub5QnNpRpMUSghbwvHyo1DHke79qqJiOPBEmNd8GLt1db8jR/WsHNr8wDNWh758tRvFOOzSsykAXF8Q1jO2rRBDGvAtky09W/vPRGKoqlgUyhq+02WMmNxUxw43Tf0lr+lonI7rCqK2a4TYZFBa3mNIm3EdV+Adw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ay1zj8vZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ay1zj8vZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887D01F000E9;
	Wed,  8 Jul 2026 12:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783513859;
	bh=IlRUXPFk2vbTLOIm+kuVmkj1sw5VqyQ4MktpZxd7404=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ay1zj8vZYSav8wjcQ6wosWFhTht8HqV4gL9USLz0d5pLvF5Fbytqzd6zGF7Tt7YuY
	 oUaq8w5bH9DW6RTd/GLtT1o2AHSWbUTPGfzAF6sVHIkX7ZjF5kOvWmBWeQK34TQSLy
	 rsDsf3wLalkYLy0nSt+O64v9Wm2iUY35FeKPEv5eLdsmqm9uZU0+W41psOjRg2rtu1
	 Rr7rdTOHYPq63vmLlRl03MR5NDBZ87+/on/ipWIJDtYSQKyBbGnzvPXY9Le3r3uJoP
	 o6uN0/zmZ93CZdSzVhcA/QKE51JpjA5/XkOc3avCtdlxDDw8/Yqiku7OmbpXqeFiwY
	 sDW3znjm/MGpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com
In-Reply-To: <20260708-shikra-dt-v7-4-977b65a300c1@oss.qualcomm.com>
References: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
 <20260708-shikra-dt-v7-4-977b65a300c1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 12:30:58 +0000
Message-Id: <20260708123058.887D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The top-level GPIO keys node is incorrectly named `gpio-key` instea=
d of the standard `gpio-keys`.
--

--- Patch [4]: [PATCH v7 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM plat=
form ---
commit e39fa2dd470c78fd482e4061f2bce87250dda523
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: Add Shikra IQ2390S SoM platform

This commit adds the device tree include for the IQ2390S variant of the
Shikra System-on-Module. It includes the common shikra.dtsi and adds
PM8150 PMIC regulator definitions specific to this variant.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-iqs-som.dtsi
> new file mode 100644
> index 0000000000000..73945bf42112d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +#include "shikra.dtsi"
> +#include "pm8150.dtsi"
> +
> +/ {
> +	gpio-key {
> +		compatible =3D "gpio-keys";

[Severity: Low]
This isn't a bug, but is this top-level node named correctly? Devicetree
conventions typically use standard generic names like gpio-keys across the
subsystem rather than the singular gpio-key.=20

> +		label =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vol_up_n>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-shikra-dt-=
v7-0-977b65a300c1@oss.qualcomm.com?part=3D4
