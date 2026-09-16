Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EB04EC651
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557796; cv=none; b=ub6AGcwe+0o2TW2kdo4AYNeaM39+7I6wNLJSViwerb/Wxn35M+1mBjceSTVwk2OTuYOjcXZVIBrSn4ATXEaZNyMOIy/VkjoYHa4TzU1h+fPSAQ4usrVAVC6zNYNRPHWAQo0KnAWSkdBFuyN1qO5WOM4uBxzq3BZMprUDhb5tuXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557796; c=relaxed/simple;
	bh=jEFWMKHywTlbxpSfb7dBq80XXJNdrT2J6jT1d1vSAVk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bcoQkNSve82QKNgeqRjeR0qPp1h62zePPPaX/KxKoWM5aWu+ttkB8DsruD033gDfF0VeL6ku0OJQgMHRO/+pdsqjgqDqOGqg98i8141qWS6hNIllSogoyy1jh9unkwSzlh0lStvZyWUTNg8MxQ5dxUmJid9S4PD/Kus6qY2Hr/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTmMqofP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTmMqofP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4241F000FF;
	Wed, 16 Sep 2026 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789557785;
	bh=Adbh1ecah3sOu9eD+7BLkpVzebe1+E/4oKJafRQWb+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QTmMqofPY5WYaigiPhXXrxIT1akwrvsVvPG9ipHIkgJKuHzbhn9xkGEGCv3Frirgu
	 c8dyBbouO1CrdNHiOs64qwRhD2tgQnRhy/Hrb24argNO855JSmUj1B1zDAEtm9exAu
	 uRo1hU9AoYZ1LdDloqsNzip+n9UF/tARO25qPjINl37NGYucE5WihdcoPbeFAm2AaG
	 VBhg2R/CX3itbKpmfwWCSgalg7JtTp+Artjp0hSIlqnO1WvkaeC9pi3MyQ/TWnzvhL
	 pb60DLHTPe1geRqie2LR/o9pCqHulEw8UyxDPAKLSwDg/32gQDsfJWusiYw2FHZ3gv
	 CkALc7zIlw2oA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/17] dt-bindings: iio: adc: Add AD7768
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260916-ad7768-driver-v8-2-27aa24db5225@analog.com>
References: <20260916-ad7768-driver-v8-0-27aa24db5225@analog.com>
 <20260916-ad7768-driver-v8-2-27aa24db5225@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 11:23:05 +0000
Message-Id: <20260916112305.AB4241F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: iio: adc: ad7768 missing gpio provider properties in r=
equired list
--

commit 8814b3f3517006545039f4ea86c2f40654d4c3d3
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: iio: adc: Add AD7768

This commit introduces the devicetree bindings for the AD7768 and AD7768-4
simultaneous sampling ADCs operating in SPI mode.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
> new file mode 100644
> index 0000000000000..d8e489fa1f6ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
[ ... ]
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - avdd1-supply
> +  - avdd2-supply
> +  - iovdd-supply
> +  - ref1p-supply
> +  - ref2p-supply
> +  - io-backends

[Severity: Low]
Should gpio-controller and #gpio-cells be appended to this required list?

When hardware provides capabilities such as a GPIO controller, subsystem
guidelines specify that the corresponding standard properties must be expli=
citly
enforced. Without these in the global required list, incomplete device tree=
=20
nodes that claim GPIO controller capabilities but omit the required cell=20
properties (or omit the provider properties entirely) will silently pass=20
static schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-ad7768-dri=
ver-v8-0-27aa24db5225@analog.com?part=3D2
