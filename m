Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518932;
	b=ENc9IOg2NcCpZZQ1VYaix6U4aUSxaRdxi09PSv5zzkgGaGSPpav9Tby5PHx/yzxdrkr/
	 bnvFPrhBNivEz6CrVlGY3teIykEopBE3KAbwEdVLV9yESn8RsbpETORBX1yUrDo+t7GsE
	 Rsfu27w50q4tBcLpQDp5pmEhS+RZalgmorXKpI0Ns1/vMUvw+PqJ1ovJBii5qZltNbmUj
	 edAVd40899820NPzYxtAxisCc1wREfKGw+2cpAS6n0MJ5pkfKfatKm26QP2EMheRYSu0J
	 cTzHMY4ulPMyKQYnKD+Hg4kH1yYQ8pa8XKEJP/yDdooWfPYjO/7hWH4AJY30kNvb+gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518932;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RKSCee2Aszf6j0g+knhPcyxstTjRmFPSs6d1e2GUygk=;
	b=zBssrqRgVCQM89djmkEOxAGA4aIthDPc5MjqolimzbSuX8ODeyZL+qSqKKBxo0FBzRIM
	 JiQUeJ2iSGT8j/45ORnViuwRMinfZwM/ASygy0m8LTk4mx0KVFrXKJKqAphGajQxiaRlp
	 YgThWIXSiXhX6AoDVew5YuQ6RhMIowPJpN4TOsN8jPb592V0vDyjd6yVl/1teczg/oQVq
	 0ZOTb8pm7FoYVf4F3y4WDHnJhCcI5Rarn+Lk0xkBes15K0L8YWpbLI0D9mTrzt4xKNkmb
	 pKbGVsWizsoDYpZKvrXY9I58AIykIFMlHnU2RYA2Qx3cxLZA45DzSuvIiVxwEg1X3cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zik2Qiyt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3373606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zik2Qiyt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A878B1F000C6;
	Tue, 24 Nov 2026 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518931;
	bh=RKSCee2Aszf6j0g+knhPcyxstTjRmFPSs6d1e2GUygk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zik2QiytfHydpdQBhVNqRtQ2Xbuj7+7pJYDmD+h0KxJnVpsQzcXGsrW2fiuq3To5Y
	 ZTuZF1XdSJEz8Nv0HFgpV3TkGQHl55QzMQyjBGeMpSt8/SOEuCij0HX0ytiEAnAvnZ
	 WG+1YZ8TMU40OojnCHjPcJ8x0alLb/acPbmoh8brZfmZopyn2lghdNmgoTwgMnEZlq
	 Y358ti1ijnNVAW8Sijg/mDQFjRCbb4xj4/CazMx31b8BxdiTYw9ivZ3BtVTNmkJIp9
	 nHMIGUwGFN2eNU63l6e+PxT2Wo+T1dHbG0fe4Y3Er4Ge9P2dG6NuXtI51BtlWU62Ok
	 EecusU49OSheQ==
Message-ID: <sashiko-outbox-231027@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: spi: Add compatible for Qualcomm Seca SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yadu M G" <yadu.mg@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <358f1284a656582ef0ea0e2b7bc07224372f9fdf.1795517702.git.yadu.mg@oss.qualcomm.com>
References: <358f1284a656582ef0ea0e2b7bc07224372f9fdf.1795517702.git.yadu.mg@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:15:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: spi: duplicate items list for qcom,sa8255p-geni-spi
  fallback
- [Low] dt-bindings: spi: compatible qcom,secaau-geni-spi mismatches
  Seca SoC name
--

commit 464544f1593e8abf1a94ce46421917fb0c48d295
Author: Yadu M G <yadu.mg@oss.qualcomm.com>

dt-bindings: spi: Add compatible for Qualcomm Seca SoC

This commit adds the qcom,secaau-geni-spi compatible string with a
qcom,sa8255p-geni-spi fallback to the SA8255P QUP GENI SPI binding.

> diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.=
yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
> index 33eddb395a0a9..7eb8b02253f1f 100644
> --- a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
> @@ -16,6 +16,9 @@ properties:
>        - items:
>            - const: qcom,sa8797p-geni-spi
>            - const: qcom,sa8255p-geni-spi
> +      - items:
> +          - const: qcom,secaau-geni-spi

[Severity: Low]
Should this compatible be qcom,seca-geni-spi (or an sa8xxxp model number
like qcom,sa8797p-geni-spi) instead of qcom,secaau-geni-spi?

The commit message describes the Qualcomm Seca SoC without mentioning the
"au" suffix, and Documentation/devicetree/bindings/arm/qcom-soc.yaml uses
base SoC codenames without internal variant suffixes.

> +          - const: qcom,sa8255p-geni-spi

[Severity: Low]
Since both entries share the qcom,sa8255p-geni-spi fallback, should this
be merged into the existing items list above by using an enum for the
first entry rather than adding a second items block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/358f1284a656582ef0e=
a0e2b7bc07224372f9fdf.1795517702.git.yadu.mg@oss.qualcomm.com?part=3D1
