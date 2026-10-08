Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE4E3859F5
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451310; cv=none; b=imOayFbixf52cVD8ga6RnIWF00hoMhlDW/AFFFNcCRG3l1M46Cm9vElpEiZyL1Y9Xw2RMGrZo9H+/U3W2/nAJulc6LsotEPdFUcASxHT8LhG1SzaNPKfh3UrMSwF1/6uEDF9b89uZu65+NWUxY0IJA5GJ+cy96/CuS7V/05IFIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451310; c=relaxed/simple;
	bh=WcKQJkF3nojUAwMZhVXNUskbKMssC6LAmZB0sXsN3es=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=upXX8Mzp7C7og9hNz+R3AUlREH+c/7EIgmr83daLLO0wry2GBfDhJafw8GHZnc1D3yPf0KmoxGR+wuqlW+j8I4TYh9PEnQRyPcjKhzUbKRv1k2ScYlBJiCmEkdr+0DaQOixzEo5cin9gq5HXw5upzN/cAgTyhEJFMEVcjy0TV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/a/skY0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/a/skY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227C61F000FF;
	Thu,  8 Oct 2026 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451301;
	bh=FWpuYGz+qN93y5t+97jnqZcIUbZGLbH2mZpK0ZBBapI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l/a/skY0PF8quh9BoFNVLOF9iBXH1nX8nTDqaJEF5NwE3I7gk/fWzisCDV9Rh7Rcp
	 S6UZhAGMIvRgFv+XNhGNey6SIAPn5hPuQ2a/AA2oU0kuwmAvKIyhnk9CqTOiH0SgOG
	 mMDGY9+YBvZMs2GyFk+jQgQ33i9KTcLeVpabzxZWYKdoXXiKPnAUcQTR+Bg+9/C1i+
	 pQM1i157HcM62NUCCDKR5vsL+4hnquktmlYZ9jzhOwmxhmJqb+eZ6VPWtNm1O2Ret8
	 U2FqURhgGOXX6Gkd3NeBAqxsHTcxJBlqkS0F1a8fVoBibW7ZSVpNFyZcFwjG1LaCck
	 35hqfbnVYy4cw==
Message-ID: <sashiko-outbox-163927@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-08-dts-v6-2-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
 <20261008-08-dts-v6-2-f9c4ec8664d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:21:40 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: undocumented SoC-wide thermal limit reduction
--

commit 0651d4639f9454796e2f9ce2439efba04746c6c9
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file

This commit refactors the RDP504 board configuration to extract common sett=
ings
into a new shared file. It enables board-specific peripherals like USB, PCI=
e,
and SPI NAND.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 161b5bb5a7f74..3183182d1cc71 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -823,7 +823,7 @@ ethphy-thermal {
> =20
>  			trips {
>  				ethphy-critical {
> -					temperature =3D <125000>;
> +					temperature =3D <120000>;

[Severity: Medium]
The commit message solely describes extracting common board configurations =
for
the RDP504 board and enabling board-specific peripherals.

Is it intentional that this modifies the base SoC device tree file to lower=
 the
critical temperature trip point for ethphy-thermal?

This alters the thermal characteristics for all IPQ5210-based boards. Should
this undocumented SoC-wide thermal limit reduction be separated into its own
commit to avoid unexpected regressions on other boards?

[ ... ]

> @@ -859,13 +859,13 @@ cpu0-thermal {
> =20
>  			trips {
>  				cpu-critical {
> -					temperature =3D <120000>;
> +					temperature =3D <115000>;

[Severity: Medium]
Does this intentionally lower the critical temperature for cpu0-thermal in
ipq5210.dtsi?

This impacts performance throttling and shutdown limits for all boards using
this SoC, rather than just the RDP504 board described in the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-08-dts-v6-=
0-f9c4ec8664d8@oss.qualcomm.com?part=3D2
