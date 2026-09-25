Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B32D4AE13F
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343832; cv=none; b=UgqNYO4pjRLywgXzzRqDIE9CiAx3fyAIWrNunhJWXdF1lbyVce6zNabmUNCR4BrYiGMkKyBygHiLejvyCUv2g5P0n51LbOYdiX0gDLJQa69tJtNZGs0uh2pDabOZt9SG7MdsffFHnYA7OvU44aTiasOWwh/S1Dnizsg7Eu+qkEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343832; c=relaxed/simple;
	bh=UFnMOhOqGu20gjOROuSzY65b2gVhJdhC3O8ey2MMykA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QCRzcCLpaX8/xMdtX7MdC+oJ8IO0CHAX7iwE0atDvYxFkLS6NKARjqB1R2sKz2nXVzSNTKMrA9mElNOHSuiJQYTm5Xu5F7LNOy7fhC0P9nWFzE9EF9E3ZVPh/6q+5p2sBnmIi8+rseU/YVHBC0OngpjdC61NSw7uM8NLzpDlDDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V39hWFWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V39hWFWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5021F000FF;
	Fri, 25 Sep 2026 13:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343829;
	bh=eGDHXGLh3Pxb9MGbYPwZr2HqFAaQX3GvmHt1xfmf9jI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V39hWFWu1hWtalBKPt1bLcAyV1+aAb9n2McQmyYxnPXIft/StT81EiqNnV6UyIAKj
	 86/4C7YLePF47IN0vEq2J1ZLPy/VK9zEXvuFwU40l88fTWLNisoNlqHa093Dy5fsI0
	 Z0cZIPRPafcI0+h20pJtoWdWLGIbgziBo9dIJbCAWVFalhBeZDUoaEr3f/qjM4T88n
	 hqy5AziDgS43vpDIOLWpx+/6fiOUhIs4oXRHQgUUjDJ6MCCPLRWGzZWOhrk0dBfNab
	 kn/hvfXXn+pXGV8/Qck8BnYzqlVrKDAIthYYGg5MKIuTfewjyBFQW7fTCp+uFPbiDJ
	 YNtWiK9uxd4GA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 7/8] arm64: dts: ti: k3-am62a7: FPDLink overlays for
 LI OV2312
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260925133001.2780868-8-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-8-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 13:43:49 +0000
Message-Id: <20260925134349.7D5021F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt: ti: symbol collisions and copy-paste errors in ov2312 overla=
ys
- [Low] dt: ti: incorrect header comment and dead code in ov2312 overlays
--

commit 03b11364fb4760c865618c43b8a6138373b8795b
Author: Jai Luthra <jai.luthra@linux.dev>
Subject: arm64: dts: ti: k3-am62a7: FPDLink overlays for LI OV2312

OV2312 is a raw (4x4 RGB-IR bayer) sensor, the LI-OV2312-FPDLinkIII-110H
module [1] packages it with an FPDLink-III serializer (DS90UB953) for
use with sensor fusion setups using FPDLink-III deserializer boards.

Link: https://www.leopardimaging.com/product/autonomous-camera/ti-fpdlinkii=
i-cameras/li-ov2312-fpdlinkiii/li-ov2312-fpdlinkiii-110h/ [1]

> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso b/arch/arm=
64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
> new file mode 100644
> index 0000000000000..0829f01a0f903
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IMX390 FPD-Link 3 Camera Module

[Severity: Low]
Does this description explicitly name the wrong camera module? It looks like
this might be a copy-paste artifact that should be updated to OV2312.

[ ... ]

> +&deserializer_0_ports {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	/* FPDLink RX 0 */
> +	port@0 {
> +		reg =3D <0>;
> +
> +		ub960_fpd3_1_in: endpoint {

[Severity: Medium]
Does this label use the index 1 despite being for port 0? Also, since the
device tree compiler exports overlay labels to a global symbols node, will
using an identical label across multiple camera overlays cause symbol name
collisions and silent overwrites when loaded simultaneously?

[ ... ]

> +&deserializer_0_links {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	link@0 {
> +		reg =3D <0>;
> +		i2c-alias =3D <0x44>;
> +
> +		ti,rx-mode =3D <3>;
> +
> +		serializer: serializer {

[Severity: Medium]
Is this label too generic? Redefining a generic label like serializer in
every overlay can pollute the global symbol namespace and lead to collision=
s.

[ ... ]

> +				port@0 {
> +					reg =3D <0>;
> +					ub953_1_in: endpoint {
> +						data-lanes =3D <1 2>;
> +						/*clock-noncontinuous;*/

[Severity: Low]
Should this commented-out dead code be removed entirely, or is there a need
to evaluate and enable it?

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso b/arch/arm=
64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
> new file mode 100644
> index 0000000000000..06cba8c7397fe
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IMX390 FPD-Link 3 Camera Module

[Severity: Low]
Is this header comment metadata incorrect here as well?

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso b/arch/arm=
64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
> new file mode 100644
> index 0000000000000..7d377dbe5bbfb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IMX390 FPD-Link 3 Camera Module
> + * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&deserializer_0_ports {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	/* FPDLink RX 2 */
> +	port@2 {
> +		reg =3D <2>;
> +
> +		ub960_fpd3_1_in: endpoint {

[Severity: Medium]
Is the _1_ suffix incorrectly duplicated for port 2 here? As with the first
overlay, this identical label will clash with the other overlays.

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso b/arch/arm=
64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
> new file mode 100644
> index 0000000000000..f74bff5f12b02
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IMX390 FPD-Link 3 Camera Module
> + * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&deserializer_0_ports {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	/* FPDLink RX 3 */
> +	port@3 {
> +		reg =3D <3>;
> +
> +		ub960_fpd3_1_in: endpoint {

[Severity: Medium]
Is the _1_ suffix incorrectly duplicated for port 3 as well, leading to the
same symbol clash when multiple overlays are loaded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925133001.2780=
868-1-r-donadkar@ti.com?part=3D7
