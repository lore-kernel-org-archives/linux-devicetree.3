Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141792;
	b=bCEs+yfBfju1ItocWJGQagKZq5snsv8tNKVBAVRfKXstedkHRd2bxv5N259KIGSb9pcP
	 aEtemr2xIj6vgZjDp2sntGUL4RuExC18dxFhCec290o8U200EQ1wBy7470wjii2Y9nAws
	 bDgI58XnYUjA/Ln7jtJ7uKO5qRBi2Urwd+5uHw3rTtAwasPChbIX3FNacPFGkHGCN+Zwr
	 4x6tPfyuSeE1dvCDAO/lidPzz5k+k5cAMpT3y3TcZpCigZ2Nqa9sYlxqa2Trp5eTWgpWS
	 eDz/uDCrBTrdxWhjX+pzt1OaqHW3n4Wo7DnxGfSAPQ+N/1c3VbQCQWLSYMYuZkiMzaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141792;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pwLIRt8oLHmQi2GBVAVONFNIfIao7k665Kov0Bzqz1Q=;
	b=24FW/izsYkDkb1juih5bsgQCo5licD/ssdFosOMTGQaVluCbSiL6cmFqJHSnEH9JWjgy
	 i9LOjJHioZTf11God9l0tAXRHUzXW3Ccnzl/VX1UUTsyYJw42Qvm+Q37oTW7wjAx7xuke
	 WIDscpcg1AhHoljS40Onfm/v5lUuMqpfhkzvabq56XmrS6Z+NNIw5CnMskjBFl3l9p4d8
	 Zr4rTLvz5mD40/XW5HVenseCLsT2sXgg3xi7G4fswMRi5X8NkxPLW03AtPOMclcetpw8x
	 mcXt80H0ZsXy58MOjOK8s0K7PlKCtrX9dE83tcn+krMDzlTSyIxm/zlzqZNka0Zchrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klZbEdh7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F27606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klZbEdh7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7AF1F0089F;
	Sun,  8 Nov 2026 12:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794141791;
	bh=pwLIRt8oLHmQi2GBVAVONFNIfIao7k665Kov0Bzqz1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=klZbEdh7UcPPn7KeKgR5l/lEC9oEdxLLUOYpvC0n3Acjd5BxVB486lu8Tdnus2ja+
	 EHw4EHvVmfj8XDSkW45i9+MVgcv/VMa2sh6m4SAtERH+5wb4cXrj6Yy3X3uxcorYGA
	 NnbDcGYdaSIDNxAfvGblfh6N/5+Hwqx+RYOGEU7H0gzDyk0ItdUZEQ9uxbXQkVBBZ9
	 zIVjsGPcJuyDEdygVSZemD1CPudy9BXB/ZXj1Wy/+LyI/KCewE4BUXInvhmgVN0HhK
	 ElhT6jFNM4IcLHMb/tUZnNmUox/XjnZHTXB71WTXTusr+NKhafsyWhaB1PEbPoGKN/
	 cJPVknZl45UhQ==
Message-ID: <sashiko-outbox-203741@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Update panel compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108-crosshatch-panel-v3-8-87dd4ec4f7cc@ixit.cz>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-8-87dd4ec4f7cc@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 12:43:11 +0000
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
- [High] arm64: dts: qcom: incompatible panel@0 compatible and
  reset-gpios change
--

commit 73ab76c040fc6673b910317ac87e836c9478306e
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm845-samsung-starqltechn: Update panel compatible

This commit replaces the panel@0 compatible string with
"samsung,s6e3ha8-amb577px01" and changes reset-gpios to GPIO_ACTIVE_LOW in
sdm845-samsung-starqltechn.dts.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/ar=
ch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index bd59f1dcd96dc..c156ed3733b4e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -267,13 +267,13 @@ &mdss_dsi0 {
>  	status =3D "okay";
> =20
>  	panel@0 {
> -		compatible =3D "samsung,s6e3ha8";
> +		compatible =3D "samsung,s6e3ha8-amb577px01";
>  		reg =3D <0>;
>  		vci-supply =3D <&s2dos05_ldo4>;
>  		vddr-supply =3D <&s2dos05_buck>;
>  		vdd3-supply =3D <&s2dos05_ldo1>;
>  		te-gpios =3D <&tlmm 10 GPIO_ACTIVE_HIGH>;
> -		reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_LOW>;

[Severity: High]
As reported by Krzysztof Kozlowski on v2 [1], does replacing the
"samsung,s6e3ha8" compatible string and inverting reset-gpios break DTB ABI
compatibility for existing kernels and DTB consumers?

Existing kernels and trees that only match "samsung,s6e3ha8" and expect
GPIO_ACTIVE_HIGH (introduced in 70005c18c9f7 ("arm64: dts: qcom:
sdm845-starqltechn: add graphics support")) will no longer bind or reset
panel@0 when booted with this DTB, while the panel driver already handles
the legacy compatible and polarity via broken_reset_polarity.

[1] https://lore.kernel.org/r/20260929-spirited-umber-hedgehog-300ebd@quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-crosshatch=
-panel-v3-0-87dd4ec4f7cc@ixit.cz?part=3D8
