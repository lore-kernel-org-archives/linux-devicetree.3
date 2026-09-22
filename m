Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236F3DB62B
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069227; cv=none; b=g9Bk91m6fJiRdsvNF+rI2IQrZOn52WvoHjw/z1MFlm0zQg9tsRIPCenax7Ymc4JTloiAZ/2W0+zWX2RGSthtBTZyMp+7gYygE9+X2pCxoPsIqSvnnl5Wdbibk6pvD6td6AS3gQINOAxfODth8oRJJdz3sURzNTOtGDOg8Z5yWiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069227; c=relaxed/simple;
	bh=Vyvl9DHgZHWTNB0wJ5njpMRP92xZOP2bfnuQ5m30mvQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fBCjOxWQ8GpFypaNpgmwnuVOCh9xktP3hzEI4arXE+q7dYKbBsocimoP/57INrEq48VCQ4hppnkzhWWW1NDjXjRhE12ZQCwdFF3fnrLowKZg2tY5N1TRdtMM6ZQpRh00FTUc/FKjFZrH6DyDGeG27H5H8w3BdUoVwFteqd5naFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRvOuUPO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRvOuUPO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4505E1F00893;
	Tue, 22 Sep 2026 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069226;
	bh=9OdmwklMUusa4uZK3N/T7gPPFocQpm3C7I+UaUpr7B8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SRvOuUPOl1BbpkNLKHfsAOjXG51bREbLgJEJ4Hn4xTb4vBDAJGk1bAMvuGGBvdx31
	 O3cbWssvpQt6waPmjEq2P7TrE7VABBRFC4k0qROuHwL8HcJzjAaN24doZaFxtbOJZx
	 XS+IG2FNJU0801GcKpqmRdJjd1MwNwKDEjJgdap0S5P1tgbDU2v8YiLlKzuuq6b1Xh
	 ofeCML6YqWEZzCpzQ/FnvBhUGQN43jUX//WGRZOiGS1qAdJwmm4v5lr3ZB0GdPviIr
	 0i4Lw2mvDdXiSq/xgo49Epc9Mf8QMNK6R9nqbmkaRvFSfeia09dtaVVN8l808C4TRR
	 Kw6gxMordAmSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add LLCC node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
References: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:27:05 +0000
Message-Id: <20260922092706.4505E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: mismatch between DT reg addresses and commit message =
stride
--

commit 0675a08212d643f9f31ddc67dcf4a44b377036e9
Author: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

arm64: dts: qcom: nord: Add LLCC node

This commit adds the system cache controller to the Nord device tree. It
defines sixteen banks across four DDR slices, along with the global broadca=
st
regions.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index e0496fd40c308..6896bda14ef3c 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> @@ -2071,6 +2071,46 @@ watchdog@17826000 {
>  			clocks =3D <&sleep_clk>;
>  			interrupts =3D <GIC_ESPI 848 IRQ_TYPE_EDGE_RISING>;
>  		};
> +
> +		llcc: system-cache-controller@21800000 {
> +			compatible =3D "qcom,nord-llcc";
> +			reg =3D <0x0 0x21800000 0x0 0x100000>,
> +			      <0x0 0x21a00000 0x0 0x100000>,
> +			      <0x0 0x21c00000 0x0 0x100000>,
> +			      <0x0 0x21e00000 0x0 0x100000>,

[Severity: Medium]
The commit message states the LLCC banks are placed at 0x100000 strides, but
the bank addresses here show a 0x200000 stride (e.g., 0x21a00000 - 0x218000=
00
equals 0x200000). Could there be a typo in the commit message, or should th=
ese
physical addresses use a 0x100000 stride?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922091735.4914=
81-1-shengchao.guo@oss.qualcomm.com?part=3D1
