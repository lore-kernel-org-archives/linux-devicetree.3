Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2583BE645
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 16:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785687323; cv=none; b=T9QZj5b3biePWMFNy3KeIsvm7pPTU3MgLAvFT93NrVbP+UTVvDiwAob/tBl92C9eJHXve5doDJdvFlD85hqzy/IsujY6btP7O6cb4/mV4GC+3CluTH+KM3MZt2Zq3vOAN5VOb6eGel/C27h365dQvrvwWsi/zZQCp385pfTMhXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785687323; c=relaxed/simple;
	bh=7aClf8xw97F0dDVXOFos75tkOabNskoprOw+nUHUh+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lZ+hom7/X+9PceIttZLHsw2sjlKC7q2SJS3t3bQkNSaB/Ep3LmN2cNmqWiigRIeeXLZ4Z0PWiR9pRbStHWX6cf8juO24PFA1bJAsEB8gKnoPl4jDgjLE94RtfeU26xwr1R80sUmbnwnjuw4geAuMRCIRHfTozpE8nQ2enhfEtJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtF6J47M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtF6J47M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD9E1F000E9;
	Sun,  2 Aug 2026 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785687322;
	bh=5T6jtj6L+h+dXQblZ+PbzGpT4aN4Tt6jZJkZiW8MJ2k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TtF6J47M6bz5ywAMf+4aOwu71m+a+EeTr4OBVf8CUolMTG1Zc4Sj4soIGxF+AsNC7
	 VPrOxihUi5lCJWihM0921gtL5g2peFoPpt9RJigbdKu3SihHG9XCXjUXzimwWF82yK
	 Rlt2H2pJ8gvj8s+EqOQQM+xmML49Mg5zacKC3HG+aahOpi8yRDnzT1B2h6N9u3ug5L
	 Je0AM3zbY6n8xH9kLhOFy0kMZPMnzmA+f73vFiLDwFSrjQz8SGnj33fFZASSCZb55x
	 fOpZkv0GYdzsyd5wLfFF7xIefq3zV2MM4uVcf0Tp54ghfMOv5ROoSoquUbMvpyCJuG
	 StV2Es5LCoQCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add DAC8163
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukas Metz" <lukas.metz@gmx.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260802-dac8163-work-v3-1-3ecc7bc66d0d@gmx.net>
References: <20260802-dac8163-work-v3-0-3ecc7bc66d0d@gmx.net>
 <20260802-dac8163-work-v3-1-3ecc7bc66d0d@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 16:15:21 +0000
Message-Id: <20260802161521.CCD9E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding defines `vrefin-supply` instead of the standard `vre=
f-supply` property for the reference voltage.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: iio: dac: Add DAC8163 ---
commit 027b4225a7fdd9879cb23634eb3bd5c71623e616
Author: Lukas Metz <lukas.metz@gmx.net>

dt-bindings: iio: dac: Add DAC8163

This commit adds a device tree binding for the Texas Instruments DAC8163
family of digital-to-analog converters. It covers devices such as DAC7562,
DAC7563, DAC8162, DAC8163, DAC8562, and DAC8563.

> diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac8163.yaml b/=
Documentation/devicetree/bindings/iio/dac/ti,dac8163.yaml
> new file mode 100644
> index 0000000000000..ba4099c78e064
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/ti,dac8163.yaml
[ ... ]
> +  ldac-gpios:
> +    description:
> +      Pin needs to be asserted permanently when updating the DAC synchro=
nously.
> +    maxItems: 1
> +
> +  vrefin-supply:
> +    description:
> +      External reference voltage supply for scaling. When no vrefin-supp=
ly
> +      is present the internal voltage reference is used.

[Severity: Medium]
Is there a specific reason to define vrefin-supply here rather than the
standard vref-supply property?

The IIO naming convention typically uses vref-supply for reference voltages.
Diverging from this standard establishes an inconsistent device tree
interface and might complicate integration with generic subsystems.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-dac8163-wo=
rk-v3-0-3ecc7bc66d0d@gmx.net?part=3D1
