Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768919;
	b=GchK2WmM7Cbj65Eb0bRA+mGJ4Oi1qhwIk0YspuREuM7U/sAW9NGxY+HosB9m7v6K6uUI
	 7HIzKxSPcYTJcT8oQoeaH6GmJ3lgq/iMQoCJfrb8fwZkjueb1R+WuBKN5210+5EnkHGWq
	 u1YOax05pnoQZb5PPfA8/UV7dd8mIFp7M7Mf9dXpVzQjv6MjrPmxcKnI8autsHmx8GCAX
	 s9NplIYDA180dnTD4PHvOKp6hsasi/n0YSEThUc/nYrtoO/0B+AEKMqknQ+KuL9S3qfHc
	 TSPsczYoA58oaHkSm2gXyWECeABAlDmcTPqrzDQTRil5gKd/i+IALc0NBUge9tu6Uxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768919;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zNptHUjYqlDmXJs/6CXPXs4TJI1A8PtUrOxv+qTWZaQ=;
	b=Gxnw/OcuKZZR0CH4bETaM0L7ES7Z1qn7aaxLeP0HOlfUt2erzQZMSmvDSlb8yJtAsAiw
	 LSfftNSFzoE2K6aheRSrpfH0OfzDHokgL6n5tmfMELE0PpUbS9pUztYZN44c1d9/1AF7t
	 EkVe68Dya4K98AU46S2zGM2cWcTuMUiWuMFZF2PAKZykTFuvWenSZAzlwAnhqVog9IX+Z
	 zc4mmhingV7JH/L5n47WHkN4U1jcyP0LdrRxx1oGukKzIA0FPMssy7cGhugHJ21jLjvq+
	 woKL7ahrcZ/HnSCOj9bWUJPl0oBOZrtOQ97qT0cVaDIXT/HQlcVtQAedS2el2R1PypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAlFoIJ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF7606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAlFoIJ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD851F00899;
	Fri, 27 Nov 2026 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795768918;
	bh=zNptHUjYqlDmXJs/6CXPXs4TJI1A8PtUrOxv+qTWZaQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UAlFoIJ91yCjbZgVWWJBAvu1n/mzUKkkAMsROyUKHacRZ8ytQA57z/FQDlPq/Ogvj
	 Q2eiM2vmg9HGbvGT0q7HRt8/byomcK83xxXoJm56usCWdKAv4vGzn0QWTJgbvsyL0E
	 nsVhUD+J+DG8gkO+NKky97Q8joJc+80Z1aF3Z1V+cVxBBMxnf9avCCg8yL2P3C0TAU
	 QzN/qoAPWvHjWCcPXfLRFngm5kkidKaAwnA1fJ0XdHElBdSWNbGl+xLlCe0/RcOmc+
	 H+of/PF+iPKa9kpC/W9qWdBhGssd+IkdvgSFLSzQ8889a1kydT2VJwiJaetvCBBpxs
	 J7+U+3yjpm1eA==
Message-ID: <sashiko-outbox-236894@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Add missing Iris pixel
 stream ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xilin Wu" <sophon@radxa.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-sc8280xp-iris-iommu-v2-1-34692fff579f@radxa.com>
References: <20261127-sc8280xp-iris-iommu-v2-1-34692fff579f@radxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 08:41:57 +0000
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
- [Low] arm64: dts: qcom: sc8280xp iris iommus exceeds sm8250-venus
  schema maxItems
- [Low] arm64: dts: qcom: sc8280xp: missing Fixes trailer for commit
  3a52eef16b97
--

commit bd0038d3876f2b669877bf5936ce392d140b4568
Author: Xilin Wu <sophon@radxa.com>

> arm64: dts: qcom: sc8280xp: Add missing Iris pixel stream ID
>
> The Iris VPU on SC8280XP uses separate stream IDs for its non-secure
> non-pixel and pixel traffic, 0x2a00 and 0x2a07 respectively. This is
> the same split as 0x1940/0x1947 on SM8550 and later platforms. Only
> 0x2a00 is described today.
>
> The Gen1 HFI firmware sends all non-secure traffic through 0x2a00, so
> this went unnoticed. The Gen2 HFI firmware puts pixel traffic, such as
> writes to decoded picture buffers, on 0x2a07. No SMR matches that
> stream, so the SMMU raises an unidentified stream fault, which TZ
> treats as fatal and resets the SoC:
>
>   SMMU:>> 0x15000000 NonSec Global Fault: NSGFSR=3D0x80000002, NSGFAR1=3D=
0x0, NSGFAR0=3D0xcfc03000, NSGFSYNR0=3D0x2, NSGFSYNR1=3D0x2a072a07, NSGFSYN=
R2=3D0x0, NSCR0=3D0x280406
>   Fatal Error type: TZBSP_ERR_FATAL_SMMU_FAULT
>
> Add the pixel stream ID so both streams are attached to the Iris
> device.
>
> Signed-off-by: Xilin Wu <sophon@radxa.com>

[Severity: Low]
Since this fixes the incomplete stream ID description on the SC8280XP
Iris node, should this include a Fixes tag?

  Fixes: 3a52eef16b97 ("arm64: dts: qcom: sc8280xp: Add Iris core")

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index 703b4f4e20598..328f64af863a5 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4266,7 +4266,8 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONL=
Y>,
>  					     "video-mem";
> =20
>  			operating-points-v2 =3D <&iris_opp_table>;
> -			iommus =3D <&apps_smmu 0x2a00 0x400>;
> +			iommus =3D <&apps_smmu 0x2a00 0x400>,
> +				 <&apps_smmu 0x2a07 0x400>;

[Severity: Low]
Does adding a second iommus entry cause dtbs_check validation to fail
against Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml?

The iris node matches "qcom,sc8280xp-iris", "qcom,sm8250-venus", and
that binding currently restricts iommus to maxItems: 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-sc8280xp-i=
ris-iommu-v2-1-34692fff579f@radxa.com?part=3D1
