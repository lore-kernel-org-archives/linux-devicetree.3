Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEC225B09B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715019; cv=none; b=j8tEXHlZ9+Syc4OWIGf7ijN6KxbKBR4lGqrOEINdlS+jWDGShSnZsMAudwYZxMNCjH1WDsCmEZQQjtl8ImWtuoVG2QFrNR4IAc63y9oqI9lyhDDICkuZZELhTKMyiq5KR9DSA4WxMsNTbKnzghSt23dOuHr0surolH3Pb21cH7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715019; c=relaxed/simple;
	bh=56JO3GUpv3Cra4S9lKjZU5u80IsY0FCBf/wPjtK2L5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vmu6YlgkML1p20pSbqV36rHFd7n3GAn71Us82xYPIeiZC3nxBO0SDP8oqjbQohRrTSsVfEE2giNT3LLHdmtMGPXtMN5A5Y23W1phlp36qH9lxpKtcjqzxo7yck4FIAuS2+/MaI5n57rzLiPlAQeHBkfbbWYX0UzZiIzRbloicoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3zPuNwv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3zPuNwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EA1C19425;
	Wed, 13 May 2026 23:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778715019;
	bh=56JO3GUpv3Cra4S9lKjZU5u80IsY0FCBf/wPjtK2L5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=E3zPuNwvRscpsuaGOdrJJMeX3TAwAOsr02AGqgQq1t1LUj8cdkQp7dQP7UzKqx2G7
	 UeiO9k62tVIUzd3itYt6uYT/LFnZx7IILBjbDG+vYwfK70nLhdBFDXe84wUcjBHsJc
	 YPeZ0E8p+yORdKWPUHLaziAoEya6HC5UWwQEqQZT4v8MY3gYcn3ktfcZFP6DRjRWkg
	 abeAwl5f99pZs0+qok910U765AHre/GaqWbXS4HM+KHbWsafFUHT+crZzeZ6oedC+j
	 pYIDMsk+c1bQT+Q9Qggjt6UFwSDJ9+sny/jLm3GDV6Ad9AotaRH3xV5H4MDB2IC0gY
	 W2CjwqKtwRyjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: fpga: altr,socfpga-fpga-mgr: convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512165058.64049-1-manishbaing2789@gmail.com>
References: <20260512165058.64049-1-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 23:30:12 +0000
Message-Id: <20260513233015.E2EA1C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The 'maintainers' list incorrectly includes Steffen Trumtrar and Ro=
b Herring.
--

commit be1c0ecc6a9857f9aa82bd84bf85fccfa1cb035c
Author: Manish Baing <manishbaing2789@gmail.com>

dt-bindings: fpga: altr,socfpga-fpga-mgr: convert to DT schema

This commit converts the Altera SoCFPGA FPGA Manager bindings from the lega=
cy
text format to a YAML schema.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/fpga/altr,socfpga-fpga-mgr=
.yaml b/Documentation/devicetree/bindings/fpga/altr,socfpga-fpga-mgr.yaml
> new file mode 100644
> index 0000000000000..d09d552dde5e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/altr,socfpga-fpga-mgr.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/fpga/altr,socfpga-fpga-mgr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Altera SOCFPGA FPGA Manager
> +
> +maintainers:
> +  - Steffen Trumtrar <s.trumtrar@pengutronix.de>
> +  - Rob Herring <robh@kernel.org>

Are these the intended maintainers for this specific binding?

Steffen Trumtrar does not appear to be the original author of the text
binding, and is not listed in the MAINTAINERS file for the FPGA manager
framework or the Altera SOCFPGA architecture.=20

Additionally, while Rob Herring is the general Devicetree maintainer,
the general guidance is to avoid listing him as the dedicated maintainer
for specific vendor schemas unless he authored them.

Would it be better to list the FPGA subsystem maintainers (such as Moritz
Fischer or Xu Yilun) or the original author of the text binding here so
the get_maintainer.pl script routes queries to the right people?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512165058.6404=
9-1-manishbaing2789@gmail.com?part=3D1
