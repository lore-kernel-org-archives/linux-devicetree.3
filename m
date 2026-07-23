Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA173B2FE4
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798238; cv=none; b=VvbpWI/V7vCOwmp/hGxCSt1nHuuh3lP5Krb6Wf98BnZ3BYhDYYfIkMmgsjXtolxtTanXhNFs0WVe/9Xl0sZn90/ueKT7YDy5UGB6Xt2QZxSjzSAP0njfM4NcPcNuYgQQlJuGnVhJgO4kZHw7OpO3JcYHHbozTxYzYnmycxWmTC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798238; c=relaxed/simple;
	bh=VMFXoitcxZrxhZuOm4cIu/g+n66tr0+kmYgWOy3vzcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qfRJZZZ2NoMF/xchmBMSpee38cQ/Z3WAczrKn+1Sqsma1igMZXZP/Y1dOgWz8Ur0iQxlSoVPfVhyZzyfhwWv5GQ6p7HovuD1BaYhRrkb+rCP4V/ItPn4G0orttjM8eipSzCsDCCAIIlEQWsp+KASjxAUx24IxqZamRVobTHHdSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4MkrJT6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4MkrJT6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AE71F000E9;
	Thu, 23 Jul 2026 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784798230;
	bh=VMFXoitcxZrxhZuOm4cIu/g+n66tr0+kmYgWOy3vzcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m4MkrJT6DNK6rdIYpdmRIrFqoIZGoFuvu7Kx18ZeBKDNZjTn8+HMScAOqR1Gf547G
	 hVHczI4W//4IRCpNbKZuza9d8KHl2qHCcwnGLEL20Zv3s/SLIRTrmHBptiZJIEmLXI
	 yKZCnFH4dy18EqWM5PapdbGccGymIrrbkClt4rWgLPAFOjUScqdTGU2eE8yOrLxxsE
	 553e5xegSb5GCgne5QVdzY5iFiKl5E9ZJQ0xl1OMJTF4M8lhytlKGKftzr0KR7EKE2
	 6OA6MmyMNKX4o6g6Wbv9H8YzrWHJ/9eKCpZTbHUgGeVB2DFJporuyIz/EA7D/cQIXD
	 SaKExdv3wKATQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-08-dts-v3-2-074eb131f382@oss.qualcomm.com>
References: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
 <20260723-08-dts-v3-2-074eb131f382@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:17:08 +0000
Message-Id: <20260723091710.87AE71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit deletes `ipq5210-rdp504.dts` without removing its corres=
ponding build target from the Makefile or introducing the promised replacem=
ent variant DTS files, which breaks the build pipeline.
--

--- Patch [2]: [PATCH v3 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504 c=
ommon DT file ---
commit 99961f95ec5ae7b25b1fb15a9e2cd99c99fc0456
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file

This commit renames the IPQ5210 RDP504 device tree file to a common .dtsi
file to allow sharing configurations between EMMC and NAND variants. It
also adds fixed USB regulators, PCIe reset GPIOs, and QPIC SPI NAND nodes.

> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> and include it in variant specific DTS file.

[Severity: Low]
The commit message mentions including the new common file in variant-specif=
ic
DTS files, but it looks like those new variant .dts files were omitted from
this patch. Are they meant to be included here?

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boo=
t/dts/qcom/ipq5210-rdp504.dts
> deleted file mode 100644
> index 941f866ecfe95..0000000000000
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> +++ /dev/null

[Severity: Low]
Does deleting this file without removing its entry from the Makefile cause a
build regression?=20

Kbuild will likely fail with a missing target error because
dtb-$(CONFIG_ARCH_QCOM) +=3D ipq5210-rdp504.dtb appears to still be present=
 in
arch/arm64/boot/dts/qcom/Makefile.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-08-dts-v3-=
0-074eb131f382@oss.qualcomm.com?part=3D2
