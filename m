Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4546841A510
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528132; cv=none; b=SX6DvOlgUGXxMkMaTuWXwVp1dGxnpPrTh+dM7ePV4FASv7m88N6FFm5nNiaGwol+q9BxEv+E12BQuhyBdCOpJJzPUnrfljCOUxAD0Ym/ag+0LamC7bGhc+fuCoR0ZpOiYLB0iGhOni71vi35uljevkoq5ec4bWo4jyoy0mLQ32o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528132; c=relaxed/simple;
	bh=T/yVHyFP9yHH6qgMgoFpBmDajFP9+BgLsOsj4SJn2Hc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nwlyyyWNc+BHlZr88XAn1XyJ4FqA0R2je5SLBwGQqFEA6pZQS8M2AB70GhccAGB7XIXoj1v4ZbaUljOC3FNmt3wPWH7WSnDABuIPiwG4ZQl529SoTTQDXU4nZCHQ6O3KoKJCiu9287rcLhTSieBeYFPn8WAgjPLF2CY5R3EgEZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGT917WG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGT917WG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FF21F000E9;
	Wed, 12 Aug 2026 09:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528131;
	bh=kqNfyoyxNaaq/80IMNzBVgqTcMDS/utTw6jVH68aNUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nGT917WGE0XCotdsMi7Qbvsi/pSrD9nwCzP7NRoqRob3ZO0Ox2lKCsWbRZGa3Y+xQ
	 rWTRSRbvcbscQzPgaxfTfcv6wMCZ04GUFJRWXiZUUBjY+MqtauiPWakFDPLUajdcYg
	 mRz4XBPXk9/e4u3TKtYRszJXHdc+DOMWiICumna5WFaouwcZe2lwFWC4s+SfBaUbpv
	 7cWZfGX6Ht2Vg878aHmSS3xzNfG8epwgtsO8wV5LXkXUiCum4Yz1IB+lkR5cRgUuQ7
	 6cyfjS+SocVBJ5O8+87QYNCvU+GMRfW09Yc8CgNcscuC+cvZMWdP6VYAtXoH3BXOv4
	 g+KX2Hfu6RcdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/14] arm64: dts: qcom: ipq5018: Add clocks required
 for USB3 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260812-ipq5018-usb3-v2-9-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-9-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:48:49 +0000
Message-Id: <20260812094850.89FF21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds `assigned-clocks` and `assigned-clock-rates` to h=
ardcode specific clock frequencies, which is completely undocumented in the=
 commit message.
--

--- Patch [9]: [PATCH v2 09/14] arm64: dts: qcom: ipq5018: Add clocks requi=
red for USB3 support ---
commit 339a6b4d83bd552f4fe80b1ff4d6d41390119b3a
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5018: Add clocks required for USB3 support

This commit adds the auxiliary and LFPS clocks to the USB controller node
in the IPQ5018 device tree to enable Super-Speed (USB3) mode. It also sets
default assigned clocks and clock rates for the controller.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5018.dtsi
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -591,11 +591,21 @@ usb: usb@8a00000 {

[ ... ]

>  			clock-names =3D "core",
>  				      "iface",
>  				      "sleep",
> -				      "mock_utmi";
> +				      "mock_utmi",
> +				      "aux",
> +				      "lfps";
> +			assigned-clocks =3D <&gcc GCC_USB0_MASTER_CLK>,
> +					  <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
> +					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +			assigned-clock-rates =3D <200000000>,
> +					       <200000000>,
> +					       <60000000>;

[Severity: Medium]
The commit message mentions adding the aux and lfps clocks for USB3 support,
but does not document adding these assigned-clocks and assigned-clock-rates.

Could the commit message be updated to explain the rationale for forcing th=
ese
specific 200MHz and 60MHz frequencies during initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D9
