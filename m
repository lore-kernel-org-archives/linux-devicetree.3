Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E04E37B3F2
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778877812; cv=none; b=QjnKwLfr9dNIKZVr9ZgfNmPU+RioT4mpDbYYcNHfG1RMXqpKlKmyTtRvqiTxJR0CLCC/nV20VznSO2GWC/miYMhaSws5FP0viT7F/q50PRbFRFUe8bpaZ9ZTRBfbC4pUsOCjBAcfFx+0GHG0bMzHmXiaSijbGQLY9SQPrZ1jKQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778877812; c=relaxed/simple;
	bh=fSbkO66drQxDXBEkBWJUSYj6dJyJWqK2hwHpjEhCbbI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lz5lFj8f6lE03jCWoHqk2EUa5kiW/ISKiNOsYknaRQRfDpz4rIJsH8qLdI2G8uouTvBY+uqkzZQq8kGWs6kBPr7SdwFPcK4XZvn4pT7B4oIuF4IRTLrZIQLoi4GdUtmP8Kucpx8rwSwni5IUmgtpxL6ARqZdJDv5rUGWmXQaHec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ab8qBBh3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ab8qBBh3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C20C2BCB0;
	Fri, 15 May 2026 20:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778877812;
	bh=fSbkO66drQxDXBEkBWJUSYj6dJyJWqK2hwHpjEhCbbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ab8qBBh35lbGb+hJEWLKDYLaQgHIFBB4em2lH7JQSfDDAm+cZfh61A9+/DHFzxWpE
	 bBQWCUnKEhdBWK+EAi4YZ1WZaFkngTzvxf7YOBtnj/X/+gCMq8HaCHJ9X+LaRYwSUk
	 /KcXgv+XDbRJDRmKqrYuujFFyBAWx+8jS2fhHwCJjlJyIA4QeUR6rMNLexRXRkR/u8
	 jHTxqEYvm0rrsartaiWboV/fIvkhzJhiX2/CgatXPUorFLMZEfpjGGNhGoyVnb35n/
	 DsE3ZdqhXZHvNDVTYC00wOT/MMAw2OhhtNYYtboFGjuf/LQOK0F2TxPPRHQGQ3Xk3m
	 JvpKqkrBbwE6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] spi: dt-bindings: tegra: Support IOMMU property for
 Tegra194 QSPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-tegra194-qspi-iommu-v1-1-57dfb63cd3d6@gmail.com>
References: <20260515-tegra194-qspi-iommu-v1-1-57dfb63cd3d6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 20:43:31 +0000
Message-Id: <20260515204332.13C20C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrectly allowing the `iommus` property on a device node that=
 uses an external DMA controller.
--

commit 7b9b9a70107dbc216f12066e863bde3029e71a0d
Author: Aaron Kling <webgeek1234@gmail.com>

spi: dt-bindings: tegra: Support IOMMU property for Tegra194 QSPI

This commit updates the Tegra210 QSPI device tree binding to allow the
iommus property for the Tegra194 QSPI compatible string. It states that
this is supported via an external DMA controller.

> spi: dt-bindings: tegra: Support IOMMU property for Tegra194 QSPI
>
> This is supported via an external dma controller

If the Tegra194 QSPI controller uses an external DMA controller, the extern=
al
DMA controller acts as the bus master while the QSPI controller is a periph=
eral
slave. Because the iommus property specifies the IOMMU master interfaces fo=
r a
device that performs direct memory access, does this property belong on the
external DMA controller's node rather than the QSPI controller's node?

> diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.y=
aml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> --- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> +++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> @@ -78,7 +78,9 @@ allOf:
>          compatible:
>            not:
>              contains:
> -              const: nvidia,tegra234-qspi
> +              enum:
> +                - nvidia,tegra194-qspi
> +                - nvidia,tegra234-qspi
>      then:
>        properties:
>          iommus: false

Allowing the iommus property on the QSPI node here appears to misrepresent
the hardware architecture for an external DMA topology. If the operating
system attempts to attach an IOMMU domain to the QSPI device based on
this binding, could the actual DMA transfers fault due to the DMA controller
itself not being mapped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-tegra194-q=
spi-iommu-v1-0-57dfb63cd3d6@gmail.com?part=3D1
