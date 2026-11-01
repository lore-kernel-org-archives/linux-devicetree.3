Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576517;
	b=Af4HfLim3Y+v7zKIjLfLr7pE+kaHu5B2DtbzU23Lo7iMEUSR3N8EBa0CkRszK4nbYS7d
	 SFXcYEDlLgSCLTG/38fSaCizRpDFFknrCAV6o9GbGB9l8mq1jTPnGBQwkLlS/IArcWE8I
	 7kLBYW/rv/Rw1ftPmQcn/TDnRpDNxQPoDJipLvXKdrU/E9/YTDv735EcN+FgT0ZiYHZXb
	 1HqzQV3MFNvogzQ51jOagn7AusJBlRAzDlx5Vhn+i6NwbtCWk1YLOGQDjt3XVEt0Qmqfu
	 VeAieEP33ftQTzCiCLF08THmq3ipLGZHfviosD5Z9G2R9/wS2E8K3SpH2jqdRC4KZ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576517;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6iRegssdGIhNKCNpk5hrItS2OkQ/SnEBgZjO9EF9dwM=;
	b=JNZScjJiyAjtdRae0oP/sTBTHqyz5+fpvlJzJQz3aCYBJZVMj3WJl3BL9wOd1KRpP1th
	 xcAQkkpr+adVoomxBH0EKxNd6pyqECJyEtvota/gyRQze8XCng0RhsJOOx/X4IDAT/5KR
	 G63Gkqy/iYSSdoDSh2tkjWyLdawAxxFZPfbYFMBbyJXgtvvdA2Y7K8f7ld5VPZmJIhA5c
	 rvjsnONwXNNRLZrbWcBR55BSg7cHno8DUDAL9LAijumSFyEEeYBw2ah2YZmLsvTneICDv
	 MfH/5SzQAiocq/Xtbm+1TBZNRKmcKfg9/Nnh2qKZMtoT52iAiaT/lR8OM6dJA9WKlMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AimqHB4z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA7B606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 23:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AimqHB4z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDA01F00919;
	Sun,  1 Nov 2026 23:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793576517;
	bh=6iRegssdGIhNKCNpk5hrItS2OkQ/SnEBgZjO9EF9dwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AimqHB4zhXkoRGbnxP1kvovuUAGJRhGbb/U1ByT22uThax7kRFCuXzXzFCeLRm+Hq
	 LXNwrVN3a38EZPYqvoaY0gxKSqGXhhBg2kPDRqFOfxIIGEPTC+AgNO+X4oghaW9H4u
	 dWxUaKR8KRVAHNpvIqHPgJ/V357D8qiu/JnrYA7GblF5G4yjYl3ZXXzkoEmHVENGR0
	 4UHMx+lIhgjmiUJIzclChNBY+ZtHTH9kyszlSsUPREtWSnriJ5e/eI7TPuSNZrJQGT
	 bNqjUUoceQIjhY6F2vlq5OJ+6yH09f3n0IYZG26KYclz+rGIqJhALOWUpZvbKVP1Xw
	 QJASn5AIqh8Zw==
Message-ID: <sashiko-outbox-192764@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 23:41:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: redundant IPA properties in sm6350-lena board DTS
--

commit ea5a49fe7f1eb96f27686737dd2b4c7bc009edc7
Author: erebion <erebion@erebion.eu>

arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP, IPA & MPSS

This commit enables the ADSP, CDSP, IPA, and MPSS nodes in the Device
Tree for the Sony Xperia 10 III (pdx213).

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 1e89c9798edf8..ce351a3fa8727 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts

[ ... ]

> @@ -325,6 +337,20 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&ipa {
> +	firmware-name =3D "qcom/sm6350/sony/pdx213/ipa_fws.mbn";
> +	memory-region =3D <&pil_ipa_fw_mem>;
> +	qcom,gsi-loader =3D "self";
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Are memory-region and qcom,gsi-loader needed in &ipa here?

Commit dc88d56f27e0 ("arm64: dts: qcom: sm6350: consolidate IPA
properties") moved both properties into the base ipa: ipa@1e40000 node in
arch/arm64/boot/dts/qcom/sm6350.dtsi:

	ipa: ipa@1e40000 {
		compatible =3D "qcom,sm6350-ipa";
		...
		qcom,gsi-loader =3D "self";
		memory-region =3D <&pil_ipa_fw_mem>;
		status =3D "disabled";
	};

and dropped them from board files such as
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts. Could &ipa in
arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts only specify
firmware-name and status =3D "okay", matching &adsp, &cdsp, and &mpss?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-pdx213-ups=
tream-3-v3-0-cdc3be96d257@erebion.eu?part=3D4
