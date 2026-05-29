Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1395A405F7
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064869; cv=none; b=p8qwoka9SFtXQQnA8jNhS611wB7eNO9M3AeKe7XByFTi7inA/ZwA161yaYjnV4zpNx3Ls+q/7yvaRNX7NFL8Fn2OKFEO0p7phfQEQV1eHuO/q3FpRHkFNvD0DxEwxNoAiEXCRqSdai9Z9POGV1rirHj9aOvvHsuEZaso4LsVPDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064869; c=relaxed/simple;
	bh=+myjD02MLeI5BaaKv3ttuWXKRVzJrl+8HzSwpel1Rw8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r7J7nGFza9R9j4/SvrKgjalmttkHapBTKYkY0oH0dXeHk3F9jTxvHewWL5vouymLeIIrtt6PPq7mYN8M77FZezRyCEacz475Sf5MIva+sSXEiKWtJKMbKkcCnAuoJ900k4cLFDQikkcZVyw8SwiL81W9RLD5VyNO+V9qV89+UoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aV6gkr3O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aV6gkr3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6184A1F00893;
	Fri, 29 May 2026 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780064867;
	bh=BPXwiKFSm0zW8QbnHOThnDxSK0V+XzbVRh92LoGOLH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aV6gkr3OO89bEjXwcfiMEqGmYG5g8n7Q12t95l0yX1jbCUSIaiNPebKEY1n4NRyOC
	 0S6ACyY+D+qps4QLWtiAwETtnx2cGtkgXtln9SZucmUTQsXXNJ/KOExgddMaag6fOH
	 37j4vOd3Jwm8ofOZap1d75bb9QKY2wOF3F0Vn9noji0vyzPSS8JjFHONbYhTztiK0x
	 7J3mB23Msg8FOeqFth08USweg2XVaqApjtmNGxr/QVQ9KErDbL3zckAuAZwD/rK2Ki
	 tFtuq1Q6usUBQ3BTuzQqyEwZEzQgw4Py62FbDjkYbwMId7PfVLtKas/q/Dl4EzDqN0
	 d0pWjLGPsfoVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: amlogic: meson-axg: Add missing
 nand_rb0 pin to nand_all_pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260529140605.1070764-2-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-2-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 14:27:47 +0000
Message-Id: <20260529142747.6184A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] eMMC boot failure due to BOOT_13 pinctrl conflict. Fix: Add status=
 =3D "disabled" to the nfc node in meson-axg.dtsi.
--

commit c218ae59948e8bab6c68fcfdc539ef678ec3bdba
Author: Jun Yan <jerrysteve1101@gmail.com>

arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins

This commit updates the nand_all_pins pinctrl node to include the missing
nand_rb0 pin for the meson-axg platform. This ensures the ready/busy pin
is properly configured for NAND controller operation.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot=
/dts/amlogic/meson-axg.dtsi
> index f1f53fd98ae25..b7a7f4fae7dc2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi

[ ... ]

> @@ -481,7 +481,8 @@ mux {
>  							 "nand_ale",
>  							 "nand_cle",
>  							 "nand_wen_clk",
> -							 "nand_ren_wr";
> +							 "nand_ren_wr",
> +							 "nand_rb0";

[Severity: High]
This isn't a bug introduced by this patch, but adding this pin exposes a
pre-existing issue where the nfc node unconditionally claims nand_all_pins.

Since nand_rb0 and emmc_ds share the BOOT_13 pin, does this force a strict
pinctrl collision between the NAND and eMMC nodes?=20

If this collision causes the eMMC storage probe to fail and breaks the boot
process, should we add status =3D "disabled" to the nfc node in meson-axg.d=
tsi
to prevent this conflict when NAND is not actively used?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529140605.1070=
764-1-jerrysteve1101@gmail.com?part=3D1
