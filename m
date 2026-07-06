Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C0C37883C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347637; cv=none; b=YT4t03wGeos9pZs00x58VfTNY0U6WnkBIkSlUBg4n/tFPe8jvlyJHo8KoNr9gT+HlR+aXPdrcQ5pV/Wr336w48z8UEnv1bg0eyZhg2b2ZjHEHeFhlSZkxc1SdPL03ZJpF5Vfg73GBBHH42vPtvZ7WxSb3dgrxkeBZpLqnJWrFw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347637; c=relaxed/simple;
	bh=xzJjPofCJ08uKrBiHTPsrh4Lv1iPpv0ZP+YOYwjbVAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dgCRPmyCScBxUCURjFuFWJtFkRRDxqsawTM+xgFS+hQGTXlDEJ8Nf2j8ZV2nDEFWNxYB/26so10V9prUxgQO5UpoDAB5XBTBZ/j7Cq3l7PyJ4cdss/LelMKKYfC7jEGL3JuYSDzW7BPhwMC1JgHGC1chkoesXkdXJj4CBD9YUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAH3SsBa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAH3SsBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864841F00A3D;
	Mon,  6 Jul 2026 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783347636;
	bh=KHKGSQn1oj1mN1nEMqv8pOsvs1NasCEjNQBGYoSdTPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LAH3SsBaUch/Sdt/bm+ySbLRS+Xe0F3D1WpL+Lve6B9aLT26Up0iHWDXM8eBlSHH4
	 OgFj6q7p9evMUHrz4wD88dYz8cdAok5bW0jVuUmVWMuDS9mAmzHKDPzmu2/zMA2mfz
	 MlkBQ2NLO+FGd0f0/8rwBdL2tlQqITKkX95oHlulWBfmpIsmilzMaGckXfAhMc0aR5
	 7gCHnrl1mtjCKTpSWnUeCNy4DusWmHpiLx1YKBHKy3csqnba4pT0m+m4BdFcs4VmjM
	 Yc+V1ofn7YDPnP28VE6d99gjLXwYG+dRI9C2WeY+6L9rwzhz6tB1Rwo5sSbZVXOXH7
	 Ov9JxbQ9UIKCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 14:20:35 +0000
Message-Id: <20260706142035.864841F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] A trailing blank line was added at the end of the file.
--

commit 6ff53b628acc8752d158af919047602ffbc82460
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: Enable SD card for Glymur CRD

This commit enables the SD card for the Glymur CRD platform by configuring
the vmmc/vqmmc regulators and setting up gpio-based card detection.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dt=
s/qcom/glymur-crd.dts
> index c98dfb3941fa3..48407e47aaca2 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts

[ ... ]

> @@ -427,3 +450,4 @@ &usb_mp_qmpphy1 {
> =20
>  	status =3D "okay";
>  };
> +

[Severity: Low]
This isn't a bug, but it looks like a trailing blank line was added at the
end of the file here. Should this be removed to keep standard coding style
and avoid warnings from tools like git diff --check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706141346.4180=
348-1-mchunara@oss.qualcomm.com?part=3D4
