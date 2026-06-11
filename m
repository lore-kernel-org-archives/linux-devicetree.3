Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760232BE7D1
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155529; cv=none; b=qeIUoWUePNWxqZ+H3RfL0ch2/Rr0ehNZBQT2IlVwoUpXJ+JYGo5usqpEFwDD/cri2dy27/f6+NddCk2h7mQskvsedLDAPv4j1NopjXdNvOB2xmQqeHas5R7c09MgFSQA4SpjM0N5ubnugZKkc811esf0Q1OOpW4FH0JA9pgm200=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155529; c=relaxed/simple;
	bh=BgKqMYr8Fm6Wquqq7jwdAlDh3DLJdmpXOmPeUN+NqTs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sbZ3m4J6+ueXG8jL05yLBAMDsEz62onC59JKhdy+ndugIXwUGx7/gpIlrf296vwMFxqS2/TTq04FPJ7mz6OOZsaSI/fBK9BW1DBcSV3Ddp89vVwsVBBvGFc9rcuaJVtRlGVXD6W0wmAKAa29xl51V9g/Agrq83to/7BbqcWtdMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUNB6KXk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUNB6KXk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3DB1F00893;
	Thu, 11 Jun 2026 05:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155524;
	bh=GWpi6YPNM1TIcT6BPIxnYY+fZli3agzw50CwiZxB0ew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mUNB6KXkQ5//H0tWZf1nhuPKEWRDKk2gEbvvZeKgSxHxsXmPY+Cli5kSmjoxHHljP
	 9EO4f7KYOOZ/houMmWRtAOeLcZHW6i3tDVzkOp9bA6BmQWu+AoiYRXwxD79/yQJm2j
	 X6V8QEc0xF8W0bAVxSsKCBxoBNkUiE9lEA3sjtGbE0n9LeextTTdkue5LLdLatdoF3
	 mnoPHdBGBFZ3TPpNGSllpXCkWz/IZ1K5tguF1wMxff6XMHEklaYAwf4ctwxMOt3MWg
	 k5DgA65vWByMOBttINspevy4S+pA/vS9YICYyVdPzDRrpoOnoywR2d6DTDPcS7w1TU
	 lFrRHZsn1kmcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 33/37] arm64: dts: qcom: sm8550: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-wake-v2-33-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-33-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:25:23 +0000
Message-Id: <20260611052523.CF3DB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims that the `phy-names` property is moved=
 to the root port nodes, but the property is actually deleted.
--

commit 0b50a2794d4f364375fa966171b8c7483fa1b1b6
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs to root port node

This patch moves the PCIe phy reference and the perst/wake GPIO properties
from the root complex controller node to the root port node. It updates
several sm8550-based device tree files to reflect these moves and renames
perst-gpios to reset-gpios.

>     Move phys and phy-names from the controller to
>     the existing pcieport0 and newly labeled pcie1_port0, allowing

[Severity: Medium]
The commit message states that both phys and phy-names are moved to the root
port nodes. However, phy-names was removed from the controller but never
re-added to the port nodes. Does this omission introduce a regression, or
was the property intentionally dropped?

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 912525e9bca6f..a8eccaebcf2d7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
[ ... ]
> @@ -2100,6 +2097,8 @@ pcieport0: pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				phys =3D <&pcie0_phy>;

[Severity: Medium]
Should phy-names be included here to match the commit message, or should the
commit message be updated to reflect that phy-names is intentionally droppe=
d?

[ ... ]
> @@ -2288,7 +2284,7 @@ opp-32000000-4 {
>  				};
>  			};
> =20
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> @@ -2296,6 +2292,8 @@ pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				phys =3D <&pcie1_phy>;

[Severity: Medium]
Similarly for pcie1_port0, should phy-names be added here as well?

>  			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D33
