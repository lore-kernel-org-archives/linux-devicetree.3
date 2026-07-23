Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AE647ACEF
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822105; cv=none; b=b2IqnqyIX0tLWv4QiLUAM7F/Fo0s46NNwSwbZDh/eA4ykQpryFkC7TJ1pzP7q/A5bTUfUwNtXQcqrnlf23mSkv/rX1/riI7DOd8jxMKNn1SAb+lh2WlMiKNUPNTzyfqbiy2GsWlY0xefT9KuQuptppozrOSsP235pqypFA4zsNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822105; c=relaxed/simple;
	bh=Ea+qgor4INJY8XkI4NeJdMhor9c5RwSKtg/1N50dv24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lFYElB2JaiJWGNyYMw6KrkPv+AWlx+W5BVv3kqNSigqB3tyIKKcBbEBhUuThhUzSHd0KWvVpXhaVr7wk8zExEeVtLQ2vRfUcUnfs3ZXAhIG3lTnel++mLsa9qbO4oWpR0etBI/1PpeoTOxQrVJgyLRwWzdsHFilWViO5XXbXMyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igUx56Zh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igUx56Zh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58951F000E9;
	Thu, 23 Jul 2026 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822104;
	bh=u+HKT74TUcPmfzCXDus6MU+AcFK0t/zJo7zaNWR5U34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=igUx56Zh/RVJevzQZ4bQ5qOwx5ySlN1FMW5njt9Wz3yWY8GRb2G3FzLi96kFbsu0O
	 99vV9y+A4hPpBWoRTBG07X/3bj6h583lRXnT4MSjFSm+VyzsGxtPgcR/epZ1qktQ+h
	 vxE1+gerUhml8ApcKwWJYpwVnGGvfCv+7RTzV/FXXkADixO/IJjM5Iw0kp5vw5f7gl
	 7/++A3hNJjbjxvVlvZyYepkVohj7MykPky2PSkyfLoOvV+BB/wCld7MTtoY8QqOyRy
	 MozHY8eoAxQDg2kixLMnZFmogX9Hnwn0nO19wOqFgOHmPaZBUsjW9it2OKysmF4gur
	 jtK1iGLXHpFtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 3/4] arm64: dts: renesas: rzg3l-smarc-som: Enable
 SD/eMMC on SDHI0
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260723154154.319674-4-biju.das.jz@bp.renesas.com>
References: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
 <20260723154154.319674-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 15:55:03 +0000
Message-Id: <20260723155503.A58951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Inconsistent use of the RZG2L_PORT_PINMUX macro in a file that othe=
rwise strictly uses RZG3L_PORT_PINMUX.
--

--- Patch [3]: [PATCH v19 3/4] arm64: dts: renesas: rzg3l-smarc-som: Enable=
 SD/eMMC on SDHI0 ---
commit dcc213ca53944f7a953171eac4a8625b70907250
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0

This commit adds support for enabling SD card or eMMC on SDHI0 on the
RZ/G3L SMARC SoM. The selection between SD and eMMC is controlled by the
SW_SD0_DEV_SEL macro in the board DTS. By default, eMMC is enabled.

> diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3l-smarc-som.dtsi
> index 091a227233cba..c365b8087520b 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
[ ... ]
> @@ -216,7 +234,134 @@ i2c0_pins: i2c0 {
[ ... ]
> +	sdhi0_usd_pins: sd0-usd {
> +		sd0-cd {
> +			pinmux =3D <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */

[Severity: Low]
This isn't a bug, but should this macro be RZG3L_PORT_PINMUX(5, 0, 8) inste=
ad?

Since the rest of the file appears to use the RZG3L_PORT_PINMUX wrapper,
would it make sense to keep the styling consistent?

> +		};
> +
> +		sd0-clk {
[ ... ]
> +	sdhi0_usd_uhs_pins: sd0-usd-uhs {
> +		sd0-cd {
> +			pinmux =3D <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */

[Severity: Low]
This isn't a bug, but the same question applies here regarding the use of
RZG2L_PORT_PINMUX instead of the RZG3L variant.

> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723154154.3196=
74-1-biju.das.jz@bp.renesas.com?part=3D3
