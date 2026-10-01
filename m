Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3D552E07C
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867916; cv=none; b=UrQF/7GFbT9AsZN9u7G3Jbsfe3/1p9N32Fayg3skBJakI4tKSKjzcPBVSCY9jMl2L5JFH2Z2DUYIZbKfhEwvsXb6KTFTeFdXPYMx/X5Ewx5Z8jSmxpkGdg2HOsipoWxPRyGvzhTHUc9+rr3dCLve+yTEa4CyV/PE2mA1Ao+ngag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867916; c=relaxed/simple;
	bh=Mcj2WFUvxQUtGgRM/LxRnjK5IplMGpZF6REVf1LiSCA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f3HyQmaEI2zzFKqn07AtsRQ9K59KkkGOUmf2xZTN2QMVJ/AKU43Sn+ApMjXZ+ZYkBwAhkVuXEEZQc4YOFr6TzZLY7AvnTHDGWwNf+/8h3aUjF9zwgTyB6ywE3ef8GcpRtofymaeeCPUCRbZTVqHOuO2WAtU0lZnPkkwBJFpBMQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLGSit7f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLGSit7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DED1F00898;
	Thu,  1 Oct 2026 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790867914;
	bh=H5N7bVhuf4J+vTu77/bBj7DOteg0lSjOvjFV4KaKL4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KLGSit7fNiVHYkQ8dYvZ5FC4MMrZhXujas9k8IqgUDVJ0eGdZrPOFa6VmICtzHvoA
	 XFTVhGJHTIq9hbD+orKyR9Yb+jCJqwShLhx837fUI899244xE5mmGwJBL85J/aDJnW
	 l07tXdXVM7SGNhy+GSJ141lFDgW9cCVsbiu2s8weExD6MYmRKNZ+SzBpKT1NKbwdiA
	 69vIJLsf699Q/28NaqBkGq9sr2LcO4TXlmuHIjft3WYZaGSWYs1rEHH4uj8viKnP9+
	 W91mLNhshDW/yiC8aQs57t58haPTVOnvRex3R5D9OuBki+GOiYjn84fxITTJatTTNe
	 2t7T0Fr5jCWZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: ipq9574: add support to get
 watchdog bootstatus from IMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001-imem_restart_reason-v1-4-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
 <20261001-imem_restart_reason-v1-4-79f516906010@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 15:18:33 +0000
Message-Id: <20261001151834.31DED1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: unit address vs reg mismatch in restartreason-sram node
--

commit 4b33adc218a1891c7f1ef39e3eac2b1ba37f9136
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq9574: add support to get watchdog bootstatus from IMEM

This commit adds the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, and creates the required
SRAM child node to map the restart reason memory region.

> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/=
qcom/ipq9574.dtsi
> index f7cc6f274ca91..2156911876cca 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -760,8 +760,16 @@ usb_0_qmpphy: phy@7d000 {
>  		sram@8600000 {
>  			compatible =3D "qcom,ipq9574-imem", "mmio-sram";
>  			reg =3D <0x08600000 0x8000>;
> +			ranges =3D <0 0x08600000 0x8000>;
> =20
>  			no-memory-wc;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			restart_reason: restartreason-sram@7b0 {
> +				reg =3D <0x7a4 0x4>;
> +			};

[Severity: Low]
Does the unit address in the node name (@7b0) need to match the first addre=
ss
specified in the reg property (0x7a4)? A mismatch here typically triggers a
unit_address_vs_reg warning from the device tree compiler during the build.

Should the node name be updated to restartreason-sram@7a4, or does the reg
property need to be corrected to 0x7b0?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-imem_resta=
rt_reason-v1-0-79f516906010@oss.qualcomm.com?part=3D4
