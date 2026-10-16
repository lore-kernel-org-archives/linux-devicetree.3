Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369573CEB90
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 20:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181324; cv=none; b=l2bPZtvHQM3rIKEkB9MUVhZrmPnYo2DFEdq48ImIOmAudq2Wb0VsfGAF2AU9gPZA9FagfA3HqIFbu4fKkDNCZIk9Wy2nsGGuTXDA2A+P9KOcbJEcqZoPKcGWuBq4FRxcEz5I5JKtEMBM/Fiv4Dhrbpfs1PdruC2ReDo+p6WO8CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181324; c=relaxed/simple;
	bh=37fFFL0cr73Bep9+Q3+Y9+6ym+j8HtlgtkywBE+jBEc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pBdUV3umbe2H/vYWJNREhPSTHfpizq3I8lsILFhuck/laPC1y0lR9prUBncUhtttHwRey87KmRhvbUVijzTw9HqeqKy/oJNaMQ556sMmt+vnQspoT+5+PDNjPbpHllxn0r+NCMUs/XbPIgFGZ2Bwit7vk37IT34yGwunYqMp+/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqMthOwW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqMthOwW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAA31F000C4;
	Fri, 16 Oct 2026 20:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792181322;
	bh=x76sqhcUsLXgXz5hSs1qqR8ZeisGIWCrasInMaG2s2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BqMthOwWYGmLEfG5zydMAt2fkhlWNENQoL5m+TxAbLXg0sU9LRdeTKzJ+Pt6CWWHf
	 be2JWmb6nHR2fGN284jGsHS/Z6y1KuR5ePN8RVjlni8Uiw7qOUjd8vct8o7WT8OCiW
	 JYmjcvsf+KBRk8pwfD+Fx/3B6a4Q7KqNJui+cYRPP2QKCy64VgTl/T2JkMQ+Ca+2gT
	 NaqyhG1TRc++QX9PpkrRBe3N0Yj4+ZQT4arlx711LmUhTT5Jj23LsNy4d2rMkGDjpe
	 /acGsXIeIkejlqpjbF7cxlhgf1LN3MLCYlgxxzRQ9OHOHTpJRrH1EduNicfNaLdanO
	 kTGrXE45VtApg==
Message-ID: <sashiko-outbox-174893@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document Xiaomi 17 Ultra
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-nezha-v1-1-a39900dfaadd@mentallysanemainliners.org>
References: <20261016-nezha-v1-0-a39900dfaadd@mentallysanemainliners.org>
 <20261016-nezha-v1-1-a39900dfaadd@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 20:08:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: arm: qcom: redundant xiaomi,nezha in 2-item kaanapali =
enum
--

commit 48f6e1cb0f2052f10bc7093b9567a5e4e0437429
Author: Igor Belwon <igor.belwon@mentallysanemainliners.org>

dt-bindings: arm: qcom: Document Xiaomi 17 Ultra devices

This commit adds compatible strings for the Xiaomi 17 Ultra EU and CN
device variants to the Qualcomm arm board bindings.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index 121ca557ce1ef..b0eb7c912b913 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -173,10 +173,19 @@ properties:
>                - qcom,hawi-mtp
>            - const: qcom,hawi
> =20
> +      - description: Xiaomi 17 Ultra
> +        items:
> +          - enum:
> +              - xiaomi,nezha-cn
> +              - xiaomi,nezha-eea
> +          - const: xiaomi,nezha
> +          - const: qcom,kaanapali
> +
>        - items:
>            - enum:
>                - qcom,kaanapali-mtp
>                - qcom,kaanapali-qrd
> +              - xiaomi,nezha
>            - const: qcom,kaanapali

[Severity: Low]
Should xiaomi,nezha be omitted from this two-item qcom,kaanapali enum in
properties:compatible:oneOf?

The Xiaomi 17 Ultra block right above already defines xiaomi,nezha as the
intermediate base compatible beneath xiaomi,nezha-cn and xiaomi,nezha-eea.

Adding xiaomi,nezha to the two-item enum as well allows a device tree root
node with only compatible =3D "xiaomi,nezha", "qcom,kaanapali" (missing the
required -cn or -eea regional variant compatible) to pass dtbs_check. Other
multi-variant devices in this file (such as xiaomi,beryllium) only list the
shared base compatible as a const in the three-item entry.

> =20
>        - items:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-nezha-v1-0=
-a39900dfaadd@mentallysanemainliners.org?part=3D1
