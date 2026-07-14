Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C0D37A82E
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058864; cv=none; b=Lt6G9GuaaFCSVYGEEtM1mcDYvidT2gdWuVLWn7wXbvpiFKtPeyUdJ2S8zWWyY6DO//CqPAvn6JubhF/JuJJRtlQa1HOvIAF0URbjGZarNUehgq5wkf8gwB8illFkJNEMC68OInAE4YOxdduHtF1fZ/XEZl9rw/t869EV/+TluJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058864; c=relaxed/simple;
	bh=Gn9tsKry83ji8PwASB4DrVWd/Vr8drgvmYIWlir3Fac=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q0aNn7KhcHNmMf800MJ/J+VKuMjSI/zSCs477mXIU+H1iu6sl+gPKWlVEp0w77UnjnJWLITo53NCfrGl0/500cVNi6lHURd4eW/Ic96lY5LNX/DBiuEjeeosXCJn+WAXQbBNi1q45egL2Fh57GXVG0tSzvBsaKpJ3m8J9rDsQRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqPZ37DF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqPZ37DF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AAF81F000E9;
	Tue, 14 Jul 2026 19:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784058863;
	bh=s/KvqzxcWs/7su47Q1EwEWhx6tIn+6b/KZnY1PEoZhM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VqPZ37DFxW5W6VJ4MNJitpuztSRX5F+9HQOXCW5r79daEl9/jrO/t1qIZnj9d4yhF
	 qzRYfQFGPb1p/rxVPoFx8NmGRuK+VcS6/4YDNz7/FR7uzx0XwnO5pyPull24wKPQE0
	 M+mZ/QNJLXv63ijT5tOCMcWofSYwXCAt1dvCEoIWAXoCIscgJo/+gs4EfaGdkxYqqT
	 ip27leYQ2dVWojmra7wi/7C6mgsOVP9rNNWfnSHoi6iRpYrzFXbJ86sODWlVS4seI7
	 kpOzyraEmZVMLgsZOFMLXO66YLdpnQ52Xk7qMWidXfMHHH5WFmnn0vpDDeahYt9pd3
	 moHPc0G2L6Ccw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: rockchip: Add RV1106 CRU
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714193656.2196447-2-sjg@chromium.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-2-sjg@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 19:54:22 +0000
Message-Id: <20260714195423.0AAF81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dt-bindings header defines clock IDs but omits all reset macros=
 (e.g., SRST_*), despite the YAML schema explicitly requiring #reset-cells.
--

--- Patch [1]: [PATCH v2 1/6] dt-bindings: clock: rockchip: Add RV1106 CRU =
support ---
commit 6d501c2edd443b968951f83a3746f9eddc260735
Author: Simon Glass <sjg@chromium.org>

dt-bindings: clock: rockchip: Add RV1106 CRU support

This commit adds the clock binding header and schema for the Rockchip RV1106
clock and reset unit. The RV1103 package variant also uses this same CRU.

> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.=
yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
> new file mode 100644
> index 0000000000000..b99dce9ff9356
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"

[ ... ]

> diff --git a/include/dt-bindings/clock/rockchip,rv1106-cru.h b/include/dt=
-bindings/clock/rockchip,rv1106-cru.h
> new file mode 100644
> index 0000000000000..6b13e98b8d549
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rv1106-cru.h

[ ... ]

> +/* mmc phase clocks */
> +#define SCLK_EMMC_DRV		278
> +#define SCLK_EMMC_SAMPLE	279
> +#define SCLK_SDMMC_DRV		280
> +#define SCLK_SDMMC_SAMPLE	281
> +#define SCLK_SDIO_DRV		282
> +#define SCLK_SDIO_SAMPLE	283
> +
> +#endif

[Severity: Low]
Since the YAML schema explicitly mandates "#reset-cells", should this header
also include the corresponding reset macro definitions (e.g., SRST_*)?=20

Without these macros, device tree nodes consuming a reset from the RV1106 C=
RU
will be forced to hardcode numeric reset indices instead of using readable
names.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714193656.2196=
447-1-sjg@chromium.org?part=3D1
