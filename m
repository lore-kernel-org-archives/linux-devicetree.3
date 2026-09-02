Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22E93AA507
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 07:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333089; cv=none; b=Yakc3u8qIyyke0Ragwegf0l+mvZE5m4AbOCSZEKsd4UreYF4NP23oJTFLwst09UaOg4BCJcNxXphQLbhLZfndl3TV576zX3SFwS9Ll8l6I6ca9YuQGuINA/Ir0a15Y+LnjPlZOMLE9+lltKoYlEsfqtZsUhyODt/pw87R4Ve8HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333089; c=relaxed/simple;
	bh=+aRKls+DZ4lOiHEPFVzIk3P6+7i1M+co/aHY6cxwbIA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P9RqcGuaZORJKjX72NnyFuT1+nPyO4iQeY2flwIEpytDttCOqcAyOWV6rty1MsqqhYdf2clFp/J2YmzuJWIorZK4mSI8S8nP8psRe1WW9MuhXYL1Hxy8oXzPEIiOCa/rXrwv/TLJL2jpH/RyOXLtMEj4GlK0dXk5DIE5YO6nCow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPBZI5Xw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPBZI5Xw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC4B1F000E9;
	Wed,  2 Sep 2026 07:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788333088;
	bh=WsJxksjuBvB0IDRnvaBlfw4ual/Bs8IiRmiQ+zIdepA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QPBZI5XwlsM0CwWHeofLTyewnnqDPV4mcCcOWSQJraUyx34xzu2QSrJi8FsAAyR7W
	 YrGZaflJfj0mDhk26xfbAivziSyze5HM+HN/OtV21gLDMCO9Kq+wFGpFVuiL9vh8rp
	 rx0PCmqdM/5lrjwzcdQu4KxLmPhDWT9z9zmK5w/5D0OtqWGgVtg6Hv7flvb8l75Lad
	 DHXIGN5Uen/lFdcH9bbEJfK+wrdSdKXIX8rWX4fSDbnXelzRV74hMU4B7rKafN0bSP
	 aoK+zBeWL8AXxvG5D/ygtL3J7QGwIyXaRTmYr2pSwIqzrOieOcSLYw8/h0V8yfZEoc
	 /4RkXPXVIE6xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mmc: spacemit-sdhci: Add
 clock-frequency property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-07-k3-sdhci-dts-v1-1-4e7909cf4233@kernel.org>
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
 <20260902-07-k3-sdhci-dts-v1-1-4e7909cf4233@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 07:11:27 +0000
Message-Id: <20260902071128.2EC4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Introduction of a redundant custom clock configuration property,=
 bypassing standard Device Tree mechanisms.
--

commit 1745887406b566692891c256f7b9ab7126926f90
Author: Long Wan <long.wan@linux.spacemit.com>

dt-bindings: mmc: spacemit-sdhci: Add clock-frequency property

This commit introduces a custom clock-frequency property to the
spacemit-sdhci device tree binding. The property is intended to define the
initial rate of the IO clock based on board layout validation.

> diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/=
Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> index 34d202af909f2..f35bf7ce08dd8 100644
> --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> @@ -29,6 +29,13 @@ properties:
>        - description: core clock, used by internal controller
>        - description: io clock, output for SD, SDIO, eMMC device
> =20
> +  clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Rate of the io clock in Hz. When present the io clock is programme=
d to
> +      this rate, allowing a board to select the rate its layout was vali=
dated
> +      at.

[Severity: Medium]
Does this property reinvent standard clock configuration mechanisms?

In modern Device Tree design, setting the initial rate of a clock provider
consumed by a device is typically achieved using the standard assigned-cloc=
ks
and assigned-clock-rates properties, which the core clock framework process=
es
automatically.

Alternatively, if the goal is to cap the bus frequency for signal integrity,
the standard MMC max-frequency property should be used. Repurposing
clock-frequency to manually parse and call clk_set_rate() creates a
non-standard ABI for clock configuration and duplicates core functionality.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-07-k3-sdhc=
i-dts-v1-0-4e7909cf4233@kernel.org?part=3D1
