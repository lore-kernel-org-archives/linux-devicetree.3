Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E93A0E80
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 19:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440318; cv=none; b=pBFvbuS2Xyv2HcGgv/kSj6gzdfDuxWoAS5yuTq/Yl9USgTr5Hd2tnnKy2xFAir5Y5RlE6pq2yqaO/cupdh0BrlTq6DvyVKEnsp3oK8Wzbk5bpvLb3CFoo0ILw6tq4w4AvdTJlOhBc+uuvfg6ZSKjRvqKUlfcz7ypeSfEu7FdIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440318; c=relaxed/simple;
	bh=vMf9K4hXh9JT/FqIRHA9O2qTrH5e3TMBUaoKhImhkN4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aXwk0tE/oa4TpeCth/aBYxsF26VCQ5uyR68C4GJsLOTSycOuwj3Lkt88PJWttKephLYWT14MITij4T9W/m4gicpMEZGcevctk4JwisnSbU3z8MdeZUZXJEQEjAo5c2SY4Sh21kkIU2G9bd/LFvdb0WFGov15gi4X+QchdDFTb64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcV0FhXP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcV0FhXP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1F81F000E9;
	Thu, 30 Jul 2026 19:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785440317;
	bh=aOtu2pft52UdgsapuT6p4ghIbZMbmyHE6OueF15cDVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcV0FhXPIii6SWIU3LG44ihNVD/ZAnKQRUOyn9dZbb/7J8J4oUkJ9PG+5+TVOzFRN
	 hmS3IxTug9iqu4cXfMG436tJoMWkxolNiAMjRXx6rxys4Uox5oq2lVtsJ9wJrIoiFX
	 C1I35CLHp1d9f1+bCaLAGcryOCVUrjuFbkIBiltJ7O3LIGLAJS5iWXq19DmLJjV5nq
	 ofPksMOfJ3nsz4DHhpPLRRJEliQPBCFLsnyqZTKNsNNunfm6Q/KFQkSfLLBJ1Ss7wi
	 PC4qufWpjFk1/ocH2JX5klO97sg9mpfDZYFqaIKYp/LAydoPhdY3nFfWc7226onSti
	 6Ae2kxPuh6LxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731-gp2ap070s-v2-1-1bdfee07d5ea@disroot.org>
References: <20260731-gp2ap070s-v2-0-1bdfee07d5ea@disroot.org>
 <20260731-gp2ap070s-v2-1-1bdfee07d5ea@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 19:38:36 +0000
Message-Id: <20260730193837.0F1F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The hardware voltage supplies (`vdd-supply` and `vled-supply`) a=
re not marked as required, despite the commit message stating the hardware =
explicitly expects them.
--

--- Patch [1]: [PATCH v2 1/3] dt-bindings: iio: proximity: add Sharp GP2AP0=
70S proximity sensor ---
commit 96d4a5f0f4aeeedf39b25cab70844620180ba231
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

dt-bindings: iio: proximity: add Sharp GP2AP070S proximity sensor

This commit introduces the device tree bindings for the Sharp GP2AP070S
proximity sensor. It defines properties for the voltage supplies expected
for the core and infrared LED, as well as the interrupt configuration.

> diff --git a/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap0=
70s.yaml b/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.=
yaml
> new file mode 100644
> index 0000000000000..bcae68303b3f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml
[ ... ]
> +  vdd-supply:
> +    description: Voltage supply for the internal circuitry
> +
> +  vled-supply:
> +    description: Voltage supply for the IR LED
> +
> +  proximity-near-level: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

[Severity: Medium]
Should vdd-supply and vled-supply be included in this required list?

The commit message notes that the hardware explicitly expects two voltage
supplies, one for the core and the other for driving the infrared LED. If
they are omitted from the required list, an incomplete device tree
configuration could silently pass schema validation despite missing
properties that the hardware fundamentally requires.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-gp2ap070s-=
v2-0-1bdfee07d5ea@disroot.org?part=3D1
