Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0D736B929
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701649; cv=none; b=guPJHirqh2cnyebs2ovG0UFs3FV0IoVlXswnl8CBxEmVTT5jA27fa/JocS6KpyX1T9bvIfY0qTVzc9Xu2vIb61sXpSH+x2iLPVm+/uL42misut7HeeXQRO3PtF4zXBTfVVMmWLUyzx9UDSZL9At4RX8JAXWOpwUaYJiT3IGG4+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701649; c=relaxed/simple;
	bh=6nEOuNA3PeUsFghKCfsO4F2Fi7gGQKvtZeeqcpJ6tiA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FZMBlPM3LhIdyqJrd49LP1bJzJqbnKTtq/xQ9w84YTrnzO3U1/DJte8RlA0JVws55GfCpzLiIRwkiNdVzaE5cY39vl7myNMwjInAccTV8UeC17mJSsblCartM2h7KZljCb1ShzkhC3q+VbgPONN/x2oJFb1TPoEOVFfBJmu3r5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFRV0+vB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFRV0+vB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F217F1F000FF;
	Fri, 18 Sep 2026 03:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789701648;
	bh=UClJVo/9LIdHMt+KBJSTC+WHTm00fP0HmsLb7C3eeOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eFRV0+vBJO88xQ3UQ0Dsz0sevOhtqY6NZQzMmOH30fyJ8uYLYURdgyRKCPz8vma3w
	 yR03RIVAJJZQ1w4euFIrOSsgdBltEZDneuQiuGcorcik/gpUTPC7tYwFlr0EV57xv/
	 GPfHKXCiwLWJ1eDnRHQT/ifK8L10tZj9filJIHMS3BsLNjtqK63QWx8ctd8ictvpju
	 +zlTa44qF7/qcByw7TAXR9yVX7lISBPqOAXuls4QRQjU6m9/H2yQBnQgvf7gj1Ay2c
	 RWMeAzGXZ//zCAd1AY904d1BDJwboYP5WCK5muGMFI+cTxbv+EaD+yGPgr7Gme1yb9
	 94m9+2Dxw5G6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] ASoC: dt-bindings: add ESS Technology ES9039Q2M
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Asseily" <karl@asseily.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918031326.68542-3-karl@asseily.com>
References: <20260918031326.68542-1-karl@asseily.com>
 <20260918031326.68542-3-karl@asseily.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 03:20:47 +0000
Message-Id: <20260918032047.F217F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: esstech,es9039q2m: missing power supply properties
--

commit 319b6af08837af1db6a259282cc4b550059341ed
Author: Karl Asseily <karl@asseily.com>

ASoC: dt-bindings: add ESS Technology ES9039Q2M

Add a binding for the ES9039Q2M, a 32-bit two-channel audio DAC with an
asynchronous sample rate converter.

> diff --git a/Documentation/devicetree/bindings/sound/esstech,es9039q2m.ya=
ml b/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
> new file mode 100644
> index 0000000000000..c1d03d3a85527
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: esstech,es9039q2m
> +
> +  reg:
> +    description:
> +      I2C address, selected by the ADDR0 and ADDR1 pins - 0x48, 0x49, 0x=
4a or
> +      0x4b for GND/GND, GND/AVDD, AVDD/GND and AVDD/AVDD respectively.

[Severity: Medium]
Should there be a property for the AVDD power supply in this binding?

The description explicitly mentions the AVDD pin, confirming the hardware
utilizes power supplies that are not modeled as properties in the schema.
Without them, device trees cannot properly model the analogue and digital p=
ower
supplies of the hardware.

If the supplies are dynamically managed, the lack of properties prevents
describing this topology, potentially leaving the device unpowered on syste=
ms
where the bootloader does not leave them enabled. Adding them as required
properties later would break backward compatibility with device trees writt=
en
against this initial schema.

> +    enum: [ 0x48, 0x49, 0x4a, 0x4b ]
> +
> +  clocks:
> +    maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918031326.6854=
2-1-karl@asseily.com?part=3D2
