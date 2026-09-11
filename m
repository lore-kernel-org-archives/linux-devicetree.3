Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86247A870
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134854; cv=none; b=ihCzNQHURZEEVqQXqJ03nRSJmIDpnkw4MHJNvWfGHz4H7CyCccoK4+SpycK/UcmVfWhHf076xPWhRMA9zPWNmwYmzUm10iIuZo0OYRchKuB8LAeatjSG9x5uXyGaSmhlINvp1Obd2myVnYJCOJ0WMWy7EJp0c2u+H6w9cV0Sp2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134854; c=relaxed/simple;
	bh=WJf+h+wzd+5Y2WjdClj0+V0E6I9bAwVQp8kSb5Q9i3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JUJ4rtzNLLc069TMFPYS4K4xXYfezqfL7S4zlGzo+4xwpz7Hn888y8y7DtiLazqpcVNsSV/ek/zRZVLIt8pJ3JFK9Pq2qg4g2gts5s+8IPQcO3EWQX4h9MbVqJmWy7mLCLwyE60PZ/gy4zbypYXNKpqvQccKXHuVbnHqxBy5rak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuitiXii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuitiXii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4C61F000FF;
	Fri, 11 Sep 2026 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134852;
	bh=iTlyVHlCoAuFf06MAngdwHvg0rqUhMogl2nbqvNvkW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HuitiXiiyAqPeWTPBKXdFiPrxyYcslmgTwDYIDNlSpkkqsD3Z1G3zNk9wOY5DaOUD
	 AZtdoLYIxwSBKQTpUHwqKveZJNHwMSrU4y5kP+sBewIJAqs8Oz0Ji80iY7EkEpJGPp
	 W0iLrIJkaZRua6uT0mM4DqNjZrHGlm0BkImDDSWyj2M8rCzNRhtwEhHAU+4R4vMW1N
	 D60RmCGliz4S2ZUe7Xly+E/ueGA3C/RLmx2wYWVvwQz7qqnO+w0IhGCcoAzXMNidrg
	 BZikGLjbJq3smIj2Mj6sBtIa/t1QY1ziM11SDH59bLNKaRc8Z2ugVjZYmw+4+f9hdP
	 og4SsV0AU/4Tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a08g046: Enable TSU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.jz@bp.renesas.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260911133653.115553-6-biju.das.jz@bp.renesas.com>
References: <20260911133653.115553-1-biju.das.jz@bp.renesas.com>
 <20260911133653.115553-6-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 13:54:12 +0000
Message-Id: <20260911135412.9C4C61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The TSU device tree node specifies a compatible string without a f=
allback, and no driver supports this string, breaking thermal mitigation.
--

commit c0610eba9fadf799fcb3bc01e18ea5baeb813435
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Enable TSU

Add #cooling-cells to the CPU nodes, and describe the ADC1 (used
exclusively by the TSU) and TSU nodes along with a CPU thermal zone
using passive and critical trip points, with CPU frequency cooling
maps for thermal mitigation.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index c63a857f0e5b0..a2f6718c0043a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
[ ... ]
> @@ -270,6 +274,37 @@ scif5: serial@1004e000 {
>  			status =3D "disabled";
>  		};
> =20
[ ... ]
> +		tsu: thermal@108d0000 {
> +			compatible =3D "renesas,r9a08g046-tsu";
[Severity: High]
Will the tsu node probe successfully with this compatible string?

Looking at the tsu node in arch/arm64/boot/dts/renesas/r9a08g046.dtsi, it
appears there is no thermal driver that matches renesas,r9a08g046-tsu, and
this node does not provide a generic fallback like renesas,rzg2l-tsu.

If the device cannot probe during system initialization, the cpu-thermal zo=
ne
will fail to attach to its thermal sensor and defer probing indefinitely. C=
ould
this silently disable thermal mitigation entirely?

> +			reg =3D <0 0x108d0000 0 0x10000>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_TSU_PCLK>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911133653.1155=
53-1-biju.das.jz@bp.renesas.com?part=3D5
