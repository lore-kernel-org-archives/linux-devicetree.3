Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469881;
	b=Y8/PabdVtHh27P2txLuv4E2NXp1ePHYTXI2hn9Bh/JUvyxf4dKeTyf3XHfLUPleMHKYO
	 Rq3Ih4pdFf9fsTetCdYpJXXAu1xP0GKEwj830TE7TNtf0jYFK8+kyxyTJm7jvZlWBAETW
	 +vPE+doq2FVMWXnbMKr7W1qH8/TGufUZdxCrtcfJIO/sUgqFRPOJd8wFdMaiqtOD5ljki
	 HfvuHw15Xf4MOLzu+b8xaEY/YoqPvtA32cUFHHhGo9JaWFdd8mku6/t2F4Hli1c3P2khh
	 rlmMGN7oy7Td7HaPXHUQQKKXZ7K3YRXvU4lB73RWPJsugeXjnHBW9IedzOmf6MO8czw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469881;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4qw6VdqkNjOtW3J+HIRRr7eWntujGMafRnqMySHGEqQ=;
	b=2+eiZPS41NjgObW2UHSFB4EeKJsRJIPq8+L5Pm+Ap9heLTMVWVtF8SaCEQLpyD4SREZ1
	 TZPLDW/1VjB9RqGuD8eXJTBf4gzU21dR0iOHBGsnM5UU820C9aPciOTUsfK2pV2m9Edhz
	 qi878R1+va1VMo/H+hx8a7DQaNfjZvsjb9MN0hCc57yX4X5c2dOcw6ek9LaCap9IoVKk2
	 EkusAhVqdaqVQR0TRqyDkkK236DB4mq0Gz4gbd4CtykVUT6HtrKR2sn70IAM82nCINX2z
	 HOSU8V6jGq1RIHi0zcstFq/usK1Rg6jyQfqiQUHPQKUUaACLsADbjqj6n7OwzwYwJ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ex9iuX7k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96731606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ex9iuX7k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02311F00A05;
	Thu, 12 Nov 2026 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794469881;
	bh=4qw6VdqkNjOtW3J+HIRRr7eWntujGMafRnqMySHGEqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ex9iuX7kBvw5IQ3BrQqgWTm++LXlPSnjbwSPHWAmHyuHZW+vZaMTWIC0RmKH8XJdv
	 Zco26k/FivAqbP9jhWMOjFQxQW/bqykOH00dSDp8gCM5EU2BQT7TqokwitZkDH9Ot0
	 4LgTajYsD5TTuv0ude5a97juG3M+gDWreknxujQpBDpcVwwgRgX1pHkKBY4Ntz+D9s
	 PJ+IRtd1KGwJwz/aRJMTUJQRO3TlKTBoX6mqU/dy6loI6eAKil53wF6MFSMFQ3C074
	 NAuc38ANYdc7X0Gcr3FBQ0RlDSc1etE5DLvtt6qpX2OCb1RnVqwQLsMBhFD89AWvfw
	 8RcEQd5Nn/G5A==
Message-ID: <sashiko-outbox-210631@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine:
 Disable ASPM for TC9563 switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sushrut Shree Trivedi" <sushrut.trivedi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-ik_disable_aspm-v1-1-f43d8ca7703b@oss.qualcomm.com>
References: <20261112-ik_disable_aspm-v1-1-f43d8ca7703b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:51:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] arm64: dts: qcom: qcs6490-rb3gen2: missing wake-gpios in
  &pcie1_port0 [1]
--

commit ba184a8d8b0523b067f0174cb5855f2bdeb4aa59
Author: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Disable ASPM for TC=
9563 switch

This commit disables ASPM L0s and L1 on the PCIe links for the TC9563
switches on the QCS6490 RB3gen2 Industrial Mezzanine platform.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanin=
e.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> index e8780646ab19c..b8d56a216e409 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso

[ ... ]

> @@ -163,6 +175,11 @@ &pcie1 {
>  		    <0x901 &apps_smmu 0x1c99 0x0 0x1>;
>  };
> =20
> +&pcie1_port0 {
> +	aspm-no-l0s;
> +	aspm-no-l1;
> +};

[Severity: Medium]
This problem wasn't introduced by this patch, but is &pcie1_port0 missing a
wake-gpios property in arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
[1]?

In qcs6490-rb3gen2.dts, &pcie1 configures pcie1_wake_n (gpio3) in pinctrl-0,
while &pcie1_port0 only specifies reset-gpios:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts:
&pcie1 {
	pinctrl-0 =3D <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
	pinctrl-names =3D "default";
	...
};

&pcie1_port0 {
	reset-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;

	pcie@0,0 {

Without wake-gpios on &pcie1_port0, the PCIe driver cannot register the
WAKE# interrupt, preventing connected PCIe devices from waking the system
from low-power states.

[1] https://sashiko.dev/#/bug/linux-83ecae7c-c21b-44fd-b7c0-3b2ef2ca245c

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-ik_disable=
_aspm-v1-1-f43d8ca7703b@oss.qualcomm.com?part=3D1
