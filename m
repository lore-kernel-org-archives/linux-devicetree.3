Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E2538229C
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 08:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778918807; cv=none; b=Vo6it7flAwhP7UVYd9skEshBad1+16w53SXFltqsb3j155Heu7AB0GsDoOcMxCRouKWL3X92QlIPACtI0CbVeDskKCYyZop0erMBRmbFD8VjRS5L+1fbkvGI7fMgI3RUAXnuPiNs4wdLqoMaRrH53J0VB2IyWijKsWcqMBd+FU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778918807; c=relaxed/simple;
	bh=qF4MZwwBe7Ro/PBQvu8/8+FpcPDOLOno9srHVJ8VbAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cmos1U2Y3nDD3Hzkr2RAlKam577gdgUz4XBkoPkSW1tkdB6WVRpQmarf9st5jPU6HD4GzomJn8+gIu7Oa/5aEjN2/o8u4bDjkEA5cn58u2MK8zkDLAJgTC5Ag8UOIqGJBWjBWXuysQZGwZeI3Wfzg/t8nemzSCIZPYs5k0XGkYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeDayqc5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeDayqc5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E4DC2BCB7;
	Sat, 16 May 2026 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778918806;
	bh=qF4MZwwBe7Ro/PBQvu8/8+FpcPDOLOno9srHVJ8VbAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GeDayqc5WxweT7cNVL8jzc2fFYtzcBg9bWi3YTx+zqgizBIkaYmgeoPW7MU3bFa4l
	 NiYxZ9Ef2+lJYCfsdSU9uCO/jb1LMPdsygwVR7lfu/TNbU5IyNzBcav7xbfOGQCnNH
	 vsltlUiXXUpASzs/+6v7mD4aG38IaRjZRxpZrBpUxhWl1qO1PV7Pz4a73Y/RmUDtWz
	 8lFFEw6cPw4buHzfMSvCJY8DTS99rWtYjb0TOTDffQr1th9QnN2jXeNsqEDwrxcl5L
	 j/TKnUsInLPToL4DHvrdDqVzjIUB73pWtfkNNEsB1RGrvSptNbiibzBMSvA/YPV9Ci
	 rZtlopt6zFlfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chukun Pan" <amadeus@jmu.edu.cn>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260516080030.1736836-1-amadeus@jmu.edu.cn>
References: <20260516080030.1736836-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 08:06:46 +0000
Message-Id: <20260516080646.94E4DC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mismatch between node unit-address and 'reg' property for the uboot=
 partition.
--

commit ac1df28fb4536a816c17f35ce989f0804943afb5
Author: Chukun Pan <amadeus@jmu.edu.cn>

riscv: dts: spacemit: enable QSPI for OrangePi RV2

This commit enables the QSPI controller and the XM25QU128C SPI NOR flash
on the OrangePi RV2 board. It also adds a flash partition layout derived
from the vendor U-Boot.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-rv2.dts
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
[ ... ]
> +			opensbi@70000 {
> +				reg =3D <0x70000 0x030000>;
> +			};
> +
> +			uboot@a00000 {
> +				reg =3D <0xa0000 0x760000>;

Is there a mismatch between the unit-address and the reg property here?

The node name uses a00000 (implying an address of 0xa00000), but the reg
property specifies a start address of 0xa0000.=20

This difference will usually trigger a unit_address_vs_reg warning when
compiling the device tree with dtc. Should the node name or the reg address
be updated so they match exactly?

> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516080030.1736=
836-1-amadeus@jmu.edu.cn?part=3D1
