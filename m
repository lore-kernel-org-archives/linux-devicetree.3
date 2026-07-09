Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119FC29DB64
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585098; cv=none; b=RGg15EWy2ixNLmV9UIOPDLDJJagFSwdZTo4oiCh9gaJw3LJpAkRPFCqtOVwM3Vp5a5tHT6n7ZJupe070t90ttcEo49n6wGwYYaIBaKL0IfQubuHSE0CfjCnK70sLsSKME9CnjTfh8UCsh4QFas2FxogG1WB/zcuWj8QH6En4hKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585098; c=relaxed/simple;
	bh=ajkEBXAjpA1ZpqDt4IMgDH5OQTNTmZskafEtOoSynhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dMjx0wOAwviJx4Kcdo62KPVvo/asMy2D87tkFBpfE2A7qgMphc3VR4xWFPWkLk8MwkSMiLD/DQ1roZRXhHji2jVcfV/xwUQsPIvEaip5cuLooU5oATdyol9ctXJM4gJwQwYIOshoXv0f7xgFSx3eNHNoEpP2MXcdr0GIoXouIs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANj/CGe+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANj/CGe+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A941F00A3A;
	Thu,  9 Jul 2026 08:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783585096;
	bh=PJhUb4Q8hnbK291ddFFjSMce0CeKhvn0I/ZxWyhGnCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ANj/CGe+v9mSvLkJDOAfeSYNCcGWMt56WXMpiJ2K6NReMufJpGF+oDYiLZ8Bl3KTO
	 9AvlFq4lyN9du7XklDil/LqZ84EMCI2FXb7YjSRuzKGoRTYWcKOeSMl+TnwvnHL/nB
	 j2ShKf9ooY4gzZ0yjmBQ7lyKIOmy7zPJY3SloDDNRRjJBx5k40D4o4MgWUPWfEodqM
	 esTOpSumPmda+I7DQVs4WhHjhsSd1fn1cKqXZn6x63eVnz5cA3ep/NC+siNt/lynM0
	 uIo/e3RKaTqSntbBqs0oH8wk72dxrD9jUfTTCCOs6QF7vgSKihB/XfdwCcB9xQb3rv
	 tZJO4UxU6aiZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ramshouriesh R" <rshouriesh@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-hm1092-driver-v5-1-a1f5baa6fe08@gmail.com>
References: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com>
 <20260709-hm1092-driver-v5-1-a1f5baa6fe08@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 08:18:16 +0000
Message-Id: <20260709081816.A3A941F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `data-lanes` property is unconstrained in the MIPI CSI-2 endpoi=
nt, allowing invalid hardware configurations to pass validation.
--

--- Patch [1]: [PATCH v5 1/2] media: dt-bindings: Add Himax HM1092 NIR sens=
or ---
commit c0fd35985ccc449c8ccfd7a8009b9fa4c8298ef0
Author: Ramshouriesh R <rshouriesh@gmail.com>

media: dt-bindings: Add Himax HM1092 NIR sensor

This commit adds a device tree binding schema for the Himax HM1092, a 1
megapixel monochrome near-infrared CMOS image sensor. The sensor streams
10-bit RAW data over a single MIPI CSI-2 data lane.

> diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yam=
l b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml

[ ... ]

> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        required:
> +          - link-frequencies

[Severity: Low]
The commit message mentions that the sensor streams over a single MIPI
CSI-2 data lane. Should this endpoint definition include a constraint for
data-lanes (for example, maxItems: 1) to prevent invalid hardware
configurations with multiple lanes from passing schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-hm1092-dri=
ver-v5-0-a1f5baa6fe08@gmail.com?part=3D1
