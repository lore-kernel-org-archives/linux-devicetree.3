Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369E43DFC82
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177920; cv=none; b=lkah6SsMfvKwvC2vg+lX6H7LbfuNMAAs0Rm6H2iD4R7pQrK2NxMfQ58SKbundsJwoud8wA9TXPEDdH0RnI+OdfFCN6Q9h+davWg6diYhBzWXyrIva3PCRGK7I1RHVpmCwz+UqOygOvS15BzIsyfvOhcgcbwJeNJ0+hhY/7Tu+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177920; c=relaxed/simple;
	bh=0tISRbQJ/TrkYrOk6rEn9IetTA/nSlxFr/g3wS5VXyw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pt3bXpOMAcktZr2giQRdKqkY8TOTutRdeu9zFRVFok0ARkUNEkTP662Xvw5cMUI+7vhkzEgjpFtAV9DzyRt/bkqYkP4SKoIs+pAk4gvSaYY5fwDHzxNVWh+HvadTQbFBEh9SSpiNbtEj+HTKanuoSgqAuSgO9El4Enyv9BTpctI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuD4yWOs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuD4yWOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B97C2BCB3;
	Tue, 19 May 2026 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779177920;
	bh=0tISRbQJ/TrkYrOk6rEn9IetTA/nSlxFr/g3wS5VXyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IuD4yWOsqzDi3akzX2g9gwuyVXO0F0H7cKWKeIP8cW5ff3oSkEjDV3sxSNd2uz3WD
	 keXVjOvZlI1y8sIEna0ULlH0X90n8dsBGAGteZSpTIv8ejzNQeo9ixElLzh6OMgZVM
	 ThOnXZPcfwvz1tjP/wY5jh45HuM5DesCU/YfwaEeMwfC6g0Fwd5/Du25+FUz/73xGe
	 sfFNwBwaroHVyjJJ258vlsBsKfErRaABVL/2Cztfk27TVxp95YNLi7EFLhFx3jIBuX
	 xQlzVRrXHhtDynxcYdRhTQTOFsS0KwK6yYOZTrKwhTwlIzCZETj5yMqKGAeXy0SQL1
	 xqchjffPyb3wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: renesas: r8a78000: add MFIS, MFIS SCP and
 transport nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260519074702.3308-5-wsa+renesas@sang-engineering.com>
References: <20260519074702.3308-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:05:19 +0000
Message-Id: <20260519080519.C4B97C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing the `prr` node silently breaks SoC revision detection a=
nd hardware ID verification in the Renesas SoC initialization driver.
--

commit c054ca5a70ce33a42761e6ba3a791607f5814e31
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

arm64: renesas: r8a78000: add MFIS, MFIS SCP and transport nodes

This commit describes the MFIS and MFIS SCP instances used for tasks includ=
ing
inter-processor communication. It removes the PRR node, handling it using t=
he
MFIS compatible instead, and describes the STCM transport area for shared
memory mailboxing.

> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/=
dts/renesas/r8a78000.dtsi
> index 3e1c98903cea0..d77bed5326832 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -678,9 +678,123 @@ soc: soc {
>  		#size-cells =3D <2>;
>  		ranges;
> =20
> -		prr: chipid@189e0044 {
> -			compatible =3D "renesas,prr";
> -			reg =3D <0 0x189e0044 0 4>;
> +		mfis: system-controller@189e0000 {
> +			compatible =3D "renesas,r8a78000-mfis";

Does removing the prr node break SoC revision detection and hardware ID
verification in the Renesas SoC initialization driver?

The drivers/soc/renesas/renesas-soc.c driver uses the renesas_ids array to
find the chip ID register, which currently matches "renesas,prr" and
"renesas,bsid".

The driver can also fall back to a hardcoded family->reg address, but the
fam_rcar_gen5 family structure leaves .reg uninitialized.

Since the prr node is replaced with renesas,r8a78000-mfis without updating
renesas_ids, will renesas_soc_init() fail to map the chip ID register and s=
kip
reading the product register? This would prevent the hardware revision from
populating in sysfs (/sys/devices/soc0/revision).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519074702.3308=
-4-wsa+renesas@sang-engineering.com?part=3D1
