Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B968934DCCD
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418695; cv=none; b=lAQ93vTP6FLLfPtpZ3spBTunGW3RppELfU7yTWYe28nghn6AlS0obhzlPzNW+1zelTep/rI2sMKuCgLxAjrVZsB8QdPJ5tYj1MK+QaDd1jeLswQR/hcl+LPhtkIMghPjbasFqXBmqcrX85f4wH+URd0/czfEaYn9nKLK/t8w25A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418695; c=relaxed/simple;
	bh=F8uYKES44PjwsaKN8rdJgygjIC+8697NShiRqCGjpJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pzuxAkjdA7HeQjZJ98eEqzMGxaAN/OF5/zccb2U885nnv6HMXRdjP1n5aZy8vD9/yZhPTLtJrOgqPLmHCpp/9vfd75OuZebOgtHkuC8IxHL7J8J0oX02t5JBYPRiui3u9ZiWVHzgqJwZJT3pVrrKjTTZY938dfMVLjkhtAB5vDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3oIPEG2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3oIPEG2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A14E1F000FF;
	Sat, 26 Sep 2026 10:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790418682;
	bh=LLef3BXvnTIHTJWFVKMlQ6gJmE84fRwYU3GoxcATQTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J3oIPEG2NAuog3wqosi8YS1dOdZ4nROegEVJ6YXcal4nVnj3wMgnn+oFG0Obi1Yx+
	 hmN4/cH54YpGc6GIWPkvlnXewVwgB9oKCbt6qFJ1OF4+hPX/SGhScxiAw8qUDLMshk
	 WfVCDwRzfiyjbssGl+uGojDdXSYt7p6ORIY7LXFiBoywxd3679nWgMNuMq7ePGaGHG
	 aCnhOBvW2vpJft1kFIx8dVWpglrvsn3uCMWHYaPYdbGyUuDzvtMiDu2/7WIhJjbcP4
	 pzAzbNylQuTHWsO9k0tRsCrS7vvGUjMZf90hVP5C4d0wwX2vAZ6s/mPR+1LFI3C2NP
	 ITq8BWFaQURIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP &
 MPSS
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260926-pdx213-upstream-3-v1-3-1609c18b5c1d@erebion.eu>
References: <20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu>
 <20260926-pdx213-upstream-3-v1-3-1609c18b5c1d@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 10:31:22 +0000
Message-Id: <20260926103122.8A14E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: sm6350: mpss reg size artificially truncated
--

commit 33df29a70738e5d1e7f7a275ffc6f578951ece81
Author: erebion <erebion@erebion.eu>

arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP & MPSS

This commit enables the ADSP, CDSP, and MPSS (Modem) nodes for the Xperia 10
III. It configures the respective firmware names and updates the status of
these nodes to okay.

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts

[ ... ]

> @@ -321,6 +333,13 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&mpss {
> +	firmware-name =3D "qcom/sm6350/sony/pdx213/modem.mbn";
> +	reg =3D <0x0 0x04080000 0x0 0x100>;

[Severity: Low]
Is this reg property artificially truncating the mpss node's MMIO region?

The reg size here is 0x100 (256 bytes), whereas the standard on-SoC mpss
node usually has a size of 0x10000 (64KB). Since the device tree describes
hardware that does not shrink across boards, could truncating this size
cause an out-of-bounds access or page fault if a future or downstream driver
attempts to ioremap and read beyond the first 256 bytes?

> +
> +	status =3D "okay";
> +};
> +
>  &pm6150l_flash {
>  	status =3D "okay";
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-pdx213-ups=
tream-3-v1-0-1609c18b5c1d@erebion.eu?part=3D3
