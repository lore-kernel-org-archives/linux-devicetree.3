Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144F440E8FA
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786480873; cv=none; b=IHgCDogNNEP3fGd9N5Zd2N8ps4QiHPfreB8meip6sOnU46nSkfdYwl5yInYRyBg7V0GEk5rAJKDbQO3rIDiYS8YaDtxo9jcaBLE4f9VZAI1jQF1SIa6KJVnPXEOrRYPIzUNfYMRMsOBkgMoy4BcjqHMj9JiPMbd7rOSfF+KgPVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786480873; c=relaxed/simple;
	bh=yuFZsghncwBGvoWiqsy07LLYblYUcMgaqCoi/hPDRXg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z8Kx/iueEVa2PcYd2jj7fVC7dsY439x1BJblVjudjQnEBZZYHSqMXBgrehqhMvoYwQtoQZ+V3m8PYrJqmVZUC3Ok5ZhOe/dGcehtxBlSG3Ywf2f+d1QSbFcTmOYHiRyLO1q4U4UrL7XypCI2RzQ3hUMjDCeB8gTql9jAQOGvnQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsOHEEe7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsOHEEe7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3F01F000E9;
	Tue, 11 Aug 2026 20:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786480871;
	bh=tuD5ZxxI68MZJBR3cmncS4EUyANEhSusjVftFjaYhG4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SsOHEEe74yhRaaubS36NHns/ig1+VSVTnchTUXldBQ9vjrMGBJq7wOdpbm28fQ1/p
	 +JKK3o1c97nR9pBtmWrj4RL3xGg854RAayUGRlPdI7becv7cz2DK+TfnBY9V+V0ps5
	 G8mBKLgAqOzYFsWvoocR8pYsbFYkkZMIs+/2IPlYlq9Z0zzQPb0ETjHjIuFk3nLN4D
	 aotllH7GP2X/4o486ORIzAE7UWlo+rf4mTTVwBNJubLTB8Cb380hOPNYb+7pdzCali
	 JxYm1dgCRuG9fTHSMmBbf5nPAq7tcPdB4/t1MvR/Ovda5t6MI5Mck2r+qhJdc+nOGw
	 ZuLZRv3Baq6YQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: describe download mode
 register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robin Snyders" <robin@snyders.xyz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260811-submit-sm8150-dload-v1-1-1a87eefe6c89@snyders.xyz>
References: <20260811-submit-sm8150-dload-v1-1-1a87eefe6c89@snyders.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 20:41:10 +0000
Message-Id: <20260811204111.5C3F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `tcsr: syscon@1fc0000` node is placed out of order =
relative to its unit-address.
--

--- Patch [1]: [PATCH] arm64: dts: qcom: sm8150: describe download mode reg=
ister ---
commit 5aa322f38216f1125e002cbfb8d2789a24d59cef
Author: Robin Snyders <robin@snyders.xyz>

arm64: dts: qcom: sm8150: describe download mode register

This commit describes the TCSR download-mode register for the SM8150 SCM no=
de.
It adds the TCSR window and configures the dload-mode property to prevent t=
he
mode cookie from remaining set across warm resets and improperly entering
crashdump transport on the next boot.

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 94a3b02cb2897..29cdef6b3ee27 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
[ ... ]
> @@ -2176,6 +2177,11 @@ tcsr_mutex: hwlock@1f40000 {
>  			#hwlock-cells =3D <1>;
>  		};
> =20
> +		tcsr: syscon@1fc0000 {
> +			compatible =3D "qcom,sm8150-tcsr", "syscon";
> +			reg =3D <0x0 0x01fc0000 0x0 0x30000>;
> +		};
> +
>  		tcsr_regs_1: syscon@1f60000 {

[Severity: Low]
This isn't a bug, but should this node be sorted sequentially by its unit
address?=20

The address 0x1fc0000 is greater than 0x1f60000, so it appears this new
node is placed out of order, which might trigger dtbs_check warnings for
Device Tree coding style violations.

>  			compatible =3D "qcom,sm8150-tcsr", "syscon";
>  			reg =3D <0x0 0x01f60000 0x0 0x20000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811-submit-sm8=
150-dload-v1-1-1a87eefe6c89@snyders.xyz?part=3D1
