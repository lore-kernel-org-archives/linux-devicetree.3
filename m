Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D57D2FD681
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 01:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783389024; cv=none; b=RcIwZq9G1lK12tNSQZ+bA+9LVQiS1iTJWizDuqRDdHacplhCmacbcfHRIIQMSyRwLsJz+DS8gXr/VML90WVkCG1EPBVU2VqQgYA25OT43TcobaANh4agZEK2yysMLV6RCw+YeuIB7YsO+etNkcLQdRrctfsdeHoyXW+npHV2MN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783389024; c=relaxed/simple;
	bh=vP0UyOKNWOXYV6HdVW9ujavbfawHOOe6a5sO5H3NaaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mTWov+pfDCF875Qa+DCTTIywcWpdWJEcZiHImtbocuJqEo9qL5FUbyzHG+QQYPlsg7bTasPqM/TXovoYXbUWXXKTswXGs7NrDDCgkEERljqf5TL2G5UoVrFyar+N0hRYyfDD5A8nXDIyRRYIr4+rSQ2EWGfHSjIQ6+QITBV7gpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSNxmuyx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSNxmuyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B3E1F000E9;
	Tue,  7 Jul 2026 01:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783389022;
	bh=hGqIEXgFSsqKvgvOSeiO0nqA3HmD2zaCOt88ddpKjdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SSNxmuyxEQ+3hbaZpdRwAVE+8iJ0Dfo50She3SefiMOfxbiOErmykc2LMM36nLb79
	 nO1hHv2gkEfB5jIY6wI/VAh0+VhJhMovoDy/q/aoAT4X03mNAXBWpTpnFpu9C1aYrF
	 vr4pcVbDzblSGp/HxvL6WEaxE2Xb16vQ0YM4C6S/yizbhmUaLOxSdlJ+Kmr9bXIRgZ
	 81yqxKPHk6MsI1bqQHw1RngL/RVaTz0L97fa3DRc1UwGVsF0udnY9Sv0ciEllkFzIQ
	 lBo1atCDvUvcmVRXEWJzRvuoTuC/elGFmyNqRF2iHgSXPoR/1KbJ4QQx4PLw01sry8
	 uL78xtnxjSwIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/5] dt-bindings: iio: add Open Sensor Fusion device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707014525.1015-2-kimjinseob88@gmail.com>
References: <20260707014525.1015-1-kimjinseob88@gmail.com>
 <20260707014525.1015-2-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 01:50:21 +0000
Message-Id: <20260707015022.06B3E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Device Tree binding intentionally omits the specific hardwar=
e product identity, restricting the `compatible` property to a generic prot=
ocol-level string.
--

--- Patch [1]: [PATCH v7 1/5] dt-bindings: iio: add Open Sensor Fusion devi=
ce ---
commit 427a1ffc9a3a61dc0d7c28ad4dfc48f800f94f69
Author: Jinseob Kim <kimjinseob88@gmail.com>

dt-bindings: iio: add Open Sensor Fusion device

This commit introduces a binding for the generic Open Sensor Fusion host
interface. It specifies that sensor channels and protocol versions are
discovered at runtime, and sets the compatible string to a generic protocol
identifier.

> diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.y=
aml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> new file mode 100644
> index 0000000000000..3998390828cc0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
[ ... ]
> +allOf:
> +  - $ref: /schemas/serial/serial-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: opensensorfusion,osf

[Severity: Medium]
Will omitting the specific hardware identity prevent the kernel from applyi=
ng
hardware-specific quirks in the future?

The commit message notes that OSF GREEN is a product identity and intention=
ally
omitted from the compatible string. However, device trees are expected to
describe specific hardware, not just the generic protocol it speaks.

If the specific hardware requires workarounds in the future, such as power
sequencing adjustments, delays before the protocol responds, or errata
handling, the kernel will have no way to apply them because the device tree
only identifies it as a generic device.

Could the binding be updated to allow specific hardware compatible strings
alongside the generic fallback, rather than restricting it to a single const
value?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707014525.1015=
-1-kimjinseob88@gmail.com?part=3D1
