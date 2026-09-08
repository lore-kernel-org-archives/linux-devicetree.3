Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2635F184
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885289; cv=none; b=pyfgYyquznR+iz0y8kvWXmZRJqzmJRSjyPJv0zn1X7iWDX6Xye/j6d+GHQqR02U6kqLM+IHjkL7xZMKwcTDJ9u0nLj+FrTncD91xJiUdM33iYqd+nyl/ag7cK3rt6U+1yYKfIkXqMHPwJYZgeb92lh6Gud48Ezt3+3qHajRb1lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885289; c=relaxed/simple;
	bh=AC0X1cQYKDBtol1MvnM30RcZwiE2sQT9WkfJgh6xubo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hk7dNj2n8eWpZueVAlaM1PKHcISGUKcpXl26r9HR7xdOFIzKdRfRhESqoAcCrEexX27JUQoKh0AywKK17OxjIQnR6guajPFYUro064613nGZL8EDXhdPDnPr8cqBJDzreGOD+6g5eJV8R11QRzHFOkNWlQ+78l4e5VTn/k/n8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZV3IwOab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZV3IwOab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8311F00A3A;
	Tue,  8 Sep 2026 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788885287;
	bh=Ys7CtGdd2a8EYRUNIdQ162kPP4g7aaKQPXeqbHRTzMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZV3IwOabqIlPbt85uWTXSvBsnPZZGc0CQOIIlAiMGmbVTrp5xc0GWnSoKtohGEGYb
	 V0JwCRmzK2r0lMlSX/KsAP0NLH+CE1h9fqW1ipbXt/wFxf3qYJ65TPX+ciSOrRUnks
	 NVsySd7jQFfmVEsOI5649nwauOUMVqwnmeSOlxBD8Ck0JtFT1nYayRsJ0GP9ZqCXbU
	 Tbf1hTLHZ4LW8oMrWt6D8y7LR3bfu/o92N/CowQm8ADwC03UvWwT8K0aK9HC7xRGwn
	 rG6CcnPcFhgi3j2F/6TYg9FtcIARrqo/V1t/pOBwWqzuxmFSayOUCuoNGhMyeJT0KC
	 T9OHf6ae3YUfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3
 ITS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
References: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 16:34:46 +0000
Message-Id: <20260908163447.6C8311F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Overlapping GIC ITS Device IDs between multiple PCIe controllers o=
n a shared ITS.
--

commit 480ed2e1324d5757b3d3c7171448aba530293913
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>
arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS

This commit updates the GICv3 ITS node by adding the missing #msi-cells =3D=
 <1>
property. It also updates the PCIe nodes to use the correct msi-parent
phandles and adds a 1:1 msi-map for each PCIe controller.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index ee3fd0df4fca6..70ea9c021f933 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -809,7 +809,8 @@ pciec0: pcie@e65d0000 {
>  			resets =3D <&cpg 624>;
>  			reset-names =3D "pwr";
>  			max-link-speed =3D <4>;
> -			msi-parent =3D <&its>;
> +			msi-parent =3D <&its 0>;
> +			msi-map =3D <0x0 &its 0x0 0x10000>;
>  			num-lanes =3D <2>;
>  			#address-cells =3D <3>;

[ ... ]

> @@ -857,7 +858,8 @@ pciec1: pcie@e65d8000 {
>  			resets =3D <&cpg 625>;
>  			reset-names =3D "pwr";
>  			max-link-speed =3D <4>;
> -			msi-parent =3D <&its>;
> +			msi-parent =3D <&its 0>;
> +			msi-map =3D <0x0 &its 0x0 0x10000>;

[Severity: High]
Does this msi-map configuration for pciec1 overlap with pciec0?

This maps the downstream devices of pciec1 to the exact same ITS Device IDs
(0x0-0xFFFF) on the shared ITS that were assigned to pciec0 above.

If the hardware assigns distinct sideband Stream IDs to each controller,
won't MSIs for pciec1 be dropped by the ITS due to incorrect Device ID
mapping?

Alternatively, if the hardware aliases them, the Linux ITS driver's
its_msi_prepare() will reuse the same its_device (and Interrupt Translation
Table) for downstream devices with identical RIDs on both controllers.

Since the ITT size is fixed by the first probing device's vector request,
wouldn't subsequent MSI allocations from the second controller exceed
capacity and fail with -ENOSPC in its_alloc_device_irq()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908162323.1644=
0-1-marek.vasut+renesas@mailbox.org?part=3D1
