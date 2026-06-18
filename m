Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905293546FF
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806162; cv=none; b=B5SYP14Z5zA2V7Sj6PNknG4Yn9HZTlJ4eeJmtoQHVghQCbASiBgWhdoxxMLzL87O8z8rKdmFOb3sXdEQW92dXCdagpM4z5wMBi0p95N4lG7Np9YRSqSFf9pyRMmXZ+bY+75ESK0qjr8LCi1evJdlLc8QRi7DbKHJZUFVvml4G0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806162; c=relaxed/simple;
	bh=gC6zWzgcp8IW3lL4PELkADfPt/M8kCKuchaclBIBryg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=myRT3ulW18+rFVw77Ha/5O0m4yEWaa+/rS9pplibQrRjTUsvbY8ANHuxIeVe/2t+4R9joqnddlFNhyv6lFPxnpe1M86qIXu7l0lZW+BNgqIbMuVmP92knBDUWPKOVLc+F0T1IO6euVfDabz1FOjg8NBpTt26qN4FUW317TLZkKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8R6Clm1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8R6Clm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E3A1F000E9;
	Thu, 18 Jun 2026 18:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781806161;
	bh=zFdOYlTBvp3DOEvewhYJC0IXX5/THnlrmj7cmPeboZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F8R6Clm1EUqf7tWHGNxLzHuxqvQ2Ukvn61nvcN/rpZ3ok80vCS/QTW760cZnecGsv
	 ELq/kjMRo02PM1mnOWO4wqkdOZty7vb1i5WaBg3em59UkKnTa+nnm1fAWoRfpGw/r2
	 h+befrRPcHr3eSJybC5IQaMybVm0hqcizblFI8TlkAXAbjQ+/6Z1ZRgStmGcy5955k
	 R39fsxXi8gtMf/3UxKhaLV07f71MFkeCLAgD6Wo4Xt/DRriGaku78s7sXQU7ptq3pB
	 bDm5Qt4VtR0ef5X7ghvesFl4WFLV1XS/qqW/74iY9lHliLRdpMW1YgTtPXWdbhj+Je
	 rXnRxKe0Ir+7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] spi: dt-bindings: octeon: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618180149.475658-1-ninadnaik07@gmail.com>
References: <20260618180149.475658-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 18:09:20 +0000
Message-Id: <20260618180921.09E3A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect maintainer attribution in the converted devicetree bindin=
g.
--

commit 4c13bfaa3139030f2d12bf30e37ab22833e428f3
Author: Ninad Naik <ninadnaik07@gmail.com>

spi: dt-bindings: octeon: Convert to DT schema

This commit converts the devicetree bindings for the Cavium OCTEON 3010 SPI
controller from plain text format to YAML schema.

> diff --git a/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi=
.yaml b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
> new file mode 100644
> index 0000000000000..f0b708e1ccbbf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
> @@ -0,0 +1,61 @@

[ ... ]

> +title: Cavium, Inc. OCTEON SoC SPI master controller
> +
> +description:
> +  The Cavium OCTEON SPI controller is an SPI master controller found in
> +  OCTEON SoCs.
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>

[Severity: Low]
Is Rob Herring the intended maintainer for this specific hardware binding?

Typically during text-to-yaml conversions, it is preferred to list the actu=
al
hardware maintainer, platform maintainer, or the patch author here rather
than the core devicetree maintainer. This ensures get_maintainer.pl routes
future hardware-specific queries and patches correctly without sending
unnecessary mail to the core devicetree maintainers.

> +
> +allOf:
> +  - $ref: spi-controller.yaml#

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618180149.4756=
58-1-ninadnaik07@gmail.com?part=3D1
