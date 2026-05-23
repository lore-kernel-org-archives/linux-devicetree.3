Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3002438229F
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526834; cv=none; b=QRc8WvY39oFnfwotPTpkbKCpAtPorHNSUj9MGDtRfgzIQoumerjzzZWJq+37pZkP45rETmZ2pOTq77tKUkmEqocQxJwsqFXYjioF3JBZUlJRfLnnnkk97N/5uN+AxElO7I+FZTXeqF5JGr9Ifd0Ylo2Nbf+MEhTenys6q7N9ZlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526834; c=relaxed/simple;
	bh=4u71VezuNGUKmBRtScxbs941STYvOMRKs9pBUgWqFVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ieFUw6BYYWk80jyFmezFrk9ck50PSBPnuleyttGUDeqrHE7ORcy+Z3xjlEEXMUMJ9+ddPOmvmB3j7EJ6t5nXXAAwFWREc4vVCnPNyiQp8iA8Z/ikH8oIaNXrQXeCKKkjmK3o8PA5Yz9n6Nrdu0idU+/lW7wLJ4oz1ZuH4CmOJyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIxZvLAs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIxZvLAs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFA91F000E9;
	Sat, 23 May 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779526832;
	bh=QBId1rkPKqxYx/4UV3izaDHq2LjrQseoLmN+JF+GFPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AIxZvLAs57s9PilnVeMZhlNEY4E+FuTab8kHLUq1Mw9bnnBCmZwVCaWNMTWuIdg58
	 VOxkn9JiyjlsYXt8sKIeMT+XsibZjK4mVy+HbNZLzQYjVs8q2OrGg2juXM8yMFJzZF
	 aNzzXjM+fBUhluYTU4E3I+NSG44jLMyS86EHJhoV9m8VOXcFccqlDc6XIgxdIZcrf9
	 D5rKiOoGG0ssXbf9a9JOvjhqNnEz8YvaUx2iRUx24rqrtTnhhkRiWHOctG+csqWvYa
	 c4+OMecvKnlvWLj78prRzKASJpUKzkgoH0abevtBe+SHD3t1pRXvpqIBxzYVso/H49
	 FdMIKrIzj1t+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: tegra: Document Nvidia Tegra
 modem pwrseq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260523085102.51000-2-clamor95@gmail.com>
References: <20260523085102.51000-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 09:00:31 +0000
Message-Id: <20260523090032.AAFA91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Modeling a software power sequence as a virtual standalone device =
tree node, bypassing physical bus topology.
--

commit 5baacde1b782878f582e887bcf988caf135487f5
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: soc: tegra: Document Nvidia Tegra modem pwrseq

This commit documents the Tegra modem power sequence configuration. It prov=
ides
a node to manage interaction between the application processor and the mode=
m,
including control over the USB lines.

> diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra-mod=
em-pwrseq.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra-m=
odem-pwrseq.yaml
> new file mode 100644
> index 0000000000000..3770fd6dc2cf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra-modem-pwrs=
eq.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: nvidia,tegra-modem-pwrseq
> +
> +  enable-gpios:
> +    description: GPIO connected to the modem EINT1 pin
> +    maxItems: 1
> +
> +  nvidia,usb-bus:
> +    description:
> +      Contains phandle pointing to the Host's USB controller
> +    $ref: /schemas/types.yaml#/definitions/phandle

[Severity: High]
Does this binding model a software power sequence rather than the physical
hardware layout?

The device tree typically describes physical topology. Under standard bus
architecture, would a USB-connected modem be modeled as a child node under
the corresponding USB controller or hub port, including its required
power-supplies and enable-gpios as properties of that physical child node?

By introducing a standalone virtual node that points backwards to the USB
controller via the nvidia,usb-bus phandle, does this bypass the driver core=
's
standard bus hierarchy and device link management?

Without a structural dependency established through device links, if the USB
controller driver is unbound, could the power sequencer retain a dangling
pointer to the USB bus device and trigger a use-after-free during the next
enable or disable sequence?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523085102.5100=
0-1-clamor95@gmail.com?part=3D1
