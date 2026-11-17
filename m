Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895879;
	b=XRsifb3qd+fxlKhe5autbQ7noclo7HNIQ3TRnCKgeA+xQeGC1rNX8X1YZwdwX6QbgCT4
	 XGP7pSvOxF5nwdsHia94sKuGfPGFqZjwNi2NEDC3pe8iKZk9CqLfGWasU0SWUQt8C3QNC
	 kHkdMd2BYDlnvNtz0OKVkSxlpwCyEFa7/Zhw0N0uIeMcZpif/UBfzN8YDifNlrA6yrOwh
	 15ByEPwIFG6fm3w2VXYq3Ex4l696vHPnRmyNPSDwMlJCJdx7Vr4qzao3E4C5GalzELytr
	 t8EyYHVcv0WfDejESLkLGzZolXzAaauldSm50CxYwv/zfABBNpKg4iTUjd/SIt+ASwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895879;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=X7Yc41h61gZqWAycB10fD9gtVC3wZOSF26jmmRADAdo=;
	b=1hwFM+HkF7ejGtpsACGgHJPtZpkyMG8CxG6kClfRIhNowDNY/qH6M6JsAWA4L7Ot4xIB
	 lT0CPysrHpK6xLUALaww5MKd6Y7PNT6XFCCroEin6+qt0hBDS9OcfA+Cld6YXTyjDvDIJ
	 gpZz0RXuHPSkQtg4ySR5S42PI87CoEvYoQt5wsdZ9eJQ0BJ8IAwYPx1LP5wSTsY2zfmbK
	 yIRTZ+R5nXuStSDkvdCKpn4NY3h5bAk9YX5HglpAKwyGNhKdV1mvvCqrll7kTuwExMVH8
	 a+j2HNWig9fBE6DWim7BbPYVV+Ny0Hb39PXJjZlJe48Fj5nLd+rBtMbqMCERACtoeaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwbXamsV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1683A606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwbXamsV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533621F000C4;
	Tue, 17 Nov 2026 06:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794895878;
	bh=X7Yc41h61gZqWAycB10fD9gtVC3wZOSF26jmmRADAdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RwbXamsVQ3XNALxje52EmSU8MB3ZqdEFNjYTg3DqlEagwE85Egns+7lwVncHfto9W
	 1msAoxNweGJhtulh19xdLb2cFUO+P8eB0ejsTeYreAa5bsI3ae0cDrhPPC8Ai/vYAK
	 Z0of1Ww55HCy3JuCswQfpyzPlrYNPmrPZEfIWUWrnbvNo5wTd7GseMixIVhybYFQp5
	 itzFnED9yEqk3VCpPvH7N2/xgxcVRuGHKi3v6lIYcw4zLHP2g4WwxZzbePkYEO4vQw
	 md0kHZI4O748xO33A2Oeh5ZSZp1VH/nts2EpUjvFeA+/NzXNECdzp0FjZY97hCS+Zi
	 ScHDBAXEE+bBw==
Message-ID: <sashiko-outbox-218240@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arpit Saini" <arpit.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-resend-upstream-attention-v4-1-3f11ab312d2f@oss.qualcomm.com>
References: <20261117-resend-upstream-attention-v4-1-3f11ab312d2f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 06:11:17 +0000
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
- [Low] arm64: dts: qcom: sm8750-mtp: Fixes tag cites panel driver
  instead of DTS
--

commit 58b7afa3ece802e52179ca7a4b00405394a5f6c2
Author: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>

> arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for panel nt37801
>
> The NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=3D1.65V~1.95V, so set sufficient voltage for panel nt37801.
>
> While 1.65V is within the range accepted by the panel, the power grid
> documentation specifies L12B as a 1.8V rail, so set the minimum to 1.8V
> to match what the hardware is expected to use.
>
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
> Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> Co-developed-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>

[Severity: Low]
The Fixes tag points to 4fca6849864d ("drm/panel: Add Novatek NT37801
panel driver"), which only added the panel driver under
drivers/gpu/drm/panel/.

In arch/arm64/boot/dts/qcom/sm8750-mtp.dts, the vreg_l12b_1p8 node with
regulator-min-microvolt =3D <1200000> was added by 6a02becf4b42 ("arm64:
dts: qcom: sm8750: Add MTP and QRD boards"), and the panel@0 node using it
was added by 20a761211630 ("arm64: dts: qcom: sm8750-mtp: Enable display").
Should the Fixes tag reference one of those commits instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-resend-ups=
tream-attention-v4-1-3f11ab312d2f@oss.qualcomm.com?part=3D1
