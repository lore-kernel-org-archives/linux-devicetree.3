Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCDD46EC6F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658839; cv=none; b=IOvRgcprUb70raLzwy5keAMCclPD9RdyN/E60OhA9OAiLTVYpbdGbCCVb1m+2JXK+coXxsBlQcDg8wLaCqNFpMyDFB29dr19CEAKbm8exznlZ2xOf6qgSyE6Wudm25iEiDSBTn1SrSzcZ0VxqnphH7PM3E/zKOgPwjtXlWQWogM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658839; c=relaxed/simple;
	bh=m/+TcfdW+wLbKhE09ROF2KTLQpZXzWKNQ/qrYNmhITg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F+YQidiW2cdbWMS5jW6Ppkp49S2BE6vhMbYoeBT8MXx1BVYf3lQ8Lpsvs+Qe5LQ1GDEV1/FYoXFilbkBxRNr+clFpCkz+LYmQf2uXGkvQ1L6rPssHEKXkBaWpah7twmIMIYQcgZZ6eant7PZVPZdmZqt9NddvmfSS5KPgi4xWU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFyrEA8S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFyrEA8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E151F00A3D;
	Tue, 21 Jul 2026 18:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658838;
	bh=kQTV41r4SiXc/h3Eldc7ITZccFLiVMmdpkjr/pCl+34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZFyrEA8S3b2uVif8fTnUEIcfFMeyZqXj18H/XhLpfG4DdU1NON7fNIJLgbEcS6SMx
	 +MCQmDkreJ/0PmT2PuuDqS7Jl7qC3/ZfE/l7wu8wEbMv8WcHIEhiD4CAQyeIPnpTd9
	 fnk8tDGjf6VuFqmsRfYtEv3GgS5fP7YT5IfYgOqP0Jp4govAnQQvkRqWAseMMwzvzQ
	 4N5pgBwX8zTy/kaDoN0Omree9WlSBi5Ws9CPdgwtA6YoPNprxbYBbjZvOrjehjJbzB
	 T6UIt4nuVMSm2De5kuF6j+ClpdBf5gAsNIcwyow8QYvFdWLYAAU62GzS8oHyQl8OY5
	 JnlM7/YkTfejw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: add support for mcp47a1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-mcp47a1-add-support-v1-1-da045a2567e3@gmail.com>
References: <20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com>
 <20260721-mcp47a1-add-support-v1-1-da045a2567e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:33:58 +0000
Message-Id: <20260721183358.67E151F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding incorrectly requires `vref-supply`, but the MCP47A1 =
likely does not have a dedicated VREF pin.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: iio: dac: add support for mcp47a1 -=
--
commit d1dc3c2e573f4f52e69aabeb608ccb23acd5a123
Author: Joshua Crofts <joshua.crofts1@gmail.com>

dt-bindings: iio: dac: add support for mcp47a1

This commit introduces the device tree bindings and MAINTAINERS entry for
the Microchip MCP47A1, a 6-bit volatile digital-to-analog converter.

> diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.=
yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
> new file mode 100644
> index 0000000000000..3322fca03b3a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - vref-supply

[Severity: Medium]
Does the MCP47A1 actually have a dedicated VREF pin? Standard Microchip I2C
DACs in this class (such as the 6-pin MCP4725) typically use VDD as their
voltage reference.

If there is no physical VREF pin on this hardware, requiring vref-supply
here forces device tree authors to define dummy regulators in their
device trees just to pass schema validation.

> +  - vdd-supply
> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-mcp47a1-ad=
d-support-v1-0-da045a2567e3@gmail.com?part=3D1
