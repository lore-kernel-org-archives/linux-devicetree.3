Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081983;
	b=4UEyBQpttxCG6opkY57OZps8eg1plz4MFo8Ut+rLUhg6HiEslGVLrgxz8A4xiCmHlXgX
	 swryl/dT4yEyygQV1UBqKegrhYglx8gE/HwbcheKdKABYuIJprKVKywKubyoIDlHQDQlZ
	 hcn/dQ9TjJjyZUjdFkUMicHZU4WxP8Nk+kRaH9UcxxLxuJEVtebEGQ/ER36r//+z3wI3V
	 5hmJs77zEGTFDGjKQvkqIk9rHxSN81xkyT4x0g6T52vIx7EnVDzl0V7sDeP1/DjW0OZNn
	 7uF4BA3FTYgLrHc3W1xoTY/BUs8unTlTDV+Qqc+XcDWv+uzfWPKM4lEWgmqbClmaOpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081983;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NE6MUHnhVbOqEDE3yAYTiGYoybfhJBcA12/tsTG31IY=;
	b=AanKvEqTEix/EBhrH0l3ORhXh7YmIBw+d/cowQAPgRIN91cUzf8qezwlLFmx7drhcbWx
	 UDSFluIuNqVNVVFNz5FRlig+6skShYCVaOV8mhP9fQDBepMEFdWOs1Z3/CLVn2iQmCPk6
	 eoL1whQ+pbsp3NhMSQ/F+V8ZLDhtzgUQykOumVQ23YiZghuYgi8KZ292zY/k2+j8j8lwT
	 p+sdKbWxLF5h47redDZN0UTgDVTXGKrNmiHLiWzbq8XT+vF9a97AxQh3gp6fCqdj3devW
	 B+R8F/EjUj+s1uOse06M2sHRsBsixCYDMU68l2ITjWYrUaCPH8PzqwEcNzkuODN0W/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WwfRH/zd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81AF606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwfRH/zd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6FB1F000C4;
	Thu, 19 Nov 2026 09:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795081982;
	bh=NE6MUHnhVbOqEDE3yAYTiGYoybfhJBcA12/tsTG31IY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WwfRH/zdjmzQCVHmbGZIql0Iwja7nxSatI1GMio4m+hpAZd/RmF9A4gQqTjJu8UHB
	 jIfsHhkeAikn84DK3ZPRfou9ShI4MOmg81NuJGC0HhJF58HAISl+3ZaacwkC2aQVCf
	 u4gQ4E+tINXveYylmWSLGGpe/DHGyHOkQR290HnGwcQoan0qMKNSnQaMaerSA0CwwB
	 WcFSRb0cdRGbp94J3YNndozKLXAP/yn6Wl2UHOerlaoJJ1kRuNrDwcLcVQVwRXbyk5
	 83wg2LJI4jSKBmE6mJSzbsPNhtYSmaWRzyfWHwLzMVXyLIyWDe4y+9QT7ShIbFoF0u
	 IyD+pJFDWGwqQ==
Message-ID: <sashiko-outbox-222877@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] mmc: sdhci-cadence: abort failed tuning command
 on SD6HC
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-sd_cadence_ddr50_v3-v4-1-95a94a0aaaf3@altera.com>
References: <20261119-sd_cadence_ddr50_v3-v4-0-95a94a0aaaf3@altera.com>
 <20261119-sd_cadence_ddr50_v3-v4-1-95a94a0aaaf3@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:53:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mmc: sdhci-cadence: missing Fixes trailer for SD6HC tuning abort
  fix
--

commit a8aaab09c291bdfaa53fb0d273b4f4c7266bb280
Author: Tze Yee Ng <tze.yee.ng@altera.com>

> mmc: sdhci-cadence: abort failed tuning command on SD6HC
>
> SD6HC uses a software tuning loop that calls mmc_send_tuning() for every
> tap but never aborts a command that fails. When a CMD21 fails with a
> command error the eMMC can remain in the Data state and reject the next
> command, so the CMD6 that mmc_select_hs400() issues right after tuning
> times out.
>
> Request the command error from mmc_send_tuning() and, on a command
> error, abort the tuning command with mmc_send_abort_tuning(). This
> matches the generic sdhci tuning path. SD is unaffected because
> mmc_send_abort_tuning() only acts on the CMD21 tuning command and is a
> no-op for the SD CMD19 one.
>
> sdhci_cdns_execute_tuning() is shared with SD4HC, so limit the abort to
> SD6HC (SDHCI_SPEC_420 and later); only SD6HC has been tested and SD4HC
> can opt in once validated.
>
> Suggested-by: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> Reviewed-by: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

[Severity: Low]
Since this fixes SD6HC tuning support, should it include a Fixes tag?

  Fixes: 882fb340a956 ("mmc: sdhci-cadence: add Cadence SD6HC support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-sd_cadence=
_ddr50_v3-v4-0-95a94a0aaaf3@altera.com?part=3D1
