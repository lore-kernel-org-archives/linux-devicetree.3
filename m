Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703001;
	b=iUky3uJpRUH9CTeMIuU8v0JkTCup1XzbdIM6MI4Cy7EnTd1lh268bn7tZW+DzMvNhEO7
	 7LTbccurwmZf/wxhBYizTxneoBXd4ccdH+Kyy5jSTOjk+NWTAW7T9MrCgO3D2WMMbPDyq
	 fTBVAuB6weTyAKUbz2q/HZd4NLBKntCSKpgxeOoUA853yRIrmh79U1Pd0NHRnPgMrxurR
	 h1i4uyOE4T+d7iyQnTTnGU4GHxxHDYQyJjjaFjClksJu48UdWduiMSso5foUMHH4lQN3s
	 6h11kQ2YQZMpnRp6BgoNiH1jQO3aQmV8JqDqBNsh/JKTQcGxVybbI/YGiP2AU26/vMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703001;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lv3A+pAmj1n2+N4AoygOt9c5t4HcDckQTMsvz6bCzzM=;
	b=PIZl61ODoa4Tx/yR939uaGvY33Z2p7LSozsf2EjbRNyj2kZ7J9R0yLTdtP75nvrh9s7W
	 rRdxe2YZrrYzIQOG2enporv50iznmX4HYdalDb33LpBmGJQlRD58KTLv/FQ3UF+YuVTMU
	 ajLwNJXXGpaNb/tbTg9/qcjAOyDhfYB9ZUE25XGK1raSdKljLFmQXTT8El2AwryX7oDNx
	 aKDpDXgY4RDKLWescterEudPECT5V0m5F4E0doYsuGMMF2BNFddYoAenCed/X0pB5/HPZ
	 /W4G3n3L547T9JBaK2gkAuArvB+o1DfApoaXuj+fl2mF8CSaC2UKqv2buAZKKF2LLwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cPl+IFX4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9923C606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cPl+IFX4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76C21F000C0;
	Thu, 26 Nov 2026 14:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795703000;
	bh=lv3A+pAmj1n2+N4AoygOt9c5t4HcDckQTMsvz6bCzzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cPl+IFX4JHAaIIYwR6D2uz9OLYBnwLuCJuOBxwE1ikPq6/NSk48B+vvfjTqG7Xrmr
	 JtjMUz04X190sjiI48oRfpkaPcOU8Hy/fKdv/HnSvAhKAOYJlsLdPAO+4XLGivG7Ky
	 zrOfuTrLK2yM4Gw1XSl4lXDbUQ6nHT+qXoA18u73fVvw8dsDZYR5se8JcC9ZD74dYZ
	 ydVqRQE77LnkaVVbr8TUedJAn0yrNHOZqEKCqFJjZNdqTVNmdCDZ396dQpptAzOW2h
	 x5UywdXbPLt61YCDi7KLku+p2rGju9LDE3hgj1UFBtN/uxZ0LijY4iPPoYEHkzznZN
	 vaRSAlD1cnhQA==
Message-ID: <sashiko-outbox-235694@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8180x: add IPA node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Ijtsma" <robertijtsma@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-sc8180x-dts-ipa-v2-3-e919ed1643c1@gmail.com>
References: <20261126-sc8180x-dts-ipa-v2-0-e919ed1643c1@gmail.com>
 <20261126-sc8180x-dts-ipa-v2-3-e919ed1643c1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 14:23:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: sc8180x: undocumented qcom,sc8180x-ipa
  compatible
--

commit 075e27a5ece4a20e3d262887ade0102e1f9c20d0
Author: Robert Ijtsma <robertijtsma@gmail.com>

arm64: dts: qcom: sc8180x: add IPA node

This commit adds a disabled IPA v4.1 device node (ipa@1e40000) to the
Qualcomm SC8180X SoC devicetree.

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/=
qcom/sc8180x.dtsi
> index 7865054a3fafb..149d8062551b0 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -2261,6 +2261,51 @@ ufs_mem_phy: phy-wrapper@1d87000 {
>  			status =3D "disabled";
>  		};
> =20
> +		ipa: ipa@1e40000 {
> +			compatible =3D "qcom,sc8180x-ipa";

[Severity: Medium]
Should "qcom,sc8180x-ipa" be documented in
Documentation/devicetree/bindings/net/qcom,ipa.yaml and added to ipa_match[]
in drivers/net/ipa/ipa_main.c before or along with this node?

Without a binding entry or fallback compatible string, dtbs_check and
checkpatch report an undocumented compatible and skip schema validation for
ipa@1e40000, and enabling the node on a board will not bind to the IPA
driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-sc8180x-dt=
s-ipa-v2-0-e919ed1643c1@gmail.com?part=3D3
