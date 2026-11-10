Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308546;
	b=iP/tJUvpxiFAAmt1mVJzP62UVe53BGWCJ/E7wNCVKUYVrVll/cC3kxC3BhS7Ex5Z5Xvw
	 FZvjqMhkksJYoa0CAnA6ldNWPt668Cez0zLB8rzxbLIfaqUGbm5DPHJnhyEhzjaU8hxZB
	 NsIAnNmW2i34DxV0v3sqGsFFF/c1omrXZLqQo449IceSsk2l2guigLzT67GBRrGxhZ1Ig
	 9dqOPRmf2/il2j06gCN2w1xwEIk5casrFnYsMb8N+HqiJY3oNvnX92uUfgBZx/tL5Y4M2
	 YQzlNQNL2/h+0U+UQfPOUyhMx5M///Wj6cIcMIxiZEjYK6iYps+gL6JArLv9/LWXzBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308546;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZJYoYlGTPqoOkxwfBVoB9SF3Zffp0I2yLiXYZe4EBJ0=;
	b=YrUQz+YGtPig6oXWKqQxQkXwy8mysGCD5n05+/3KQlQlxA9fkbQCENEXOsxJ7kDDOrn2
	 kc7uikTq/ggwOjWc9bm/pq3gzOFPGvUAa3tRlOU+JFq7LUv+3wqCdb+Ax9xewaT7fBiRl
	 j9BbMZWDXOd3bQrJ6Hsl3fNWG+i47Lg4wh7uMtvbw3keCuH2HnsmxjJrN4VsDFob/XmQW
	 71IfmxDyWorKNZsQ6WiAK/Q64l+EcqKcl0K1D4QdhXBC+mkFVV25ozUNZ2dCv48KYsuBF
	 94rB6ub2PYj0iBs6oE5rhOorJF3dQu4H0Pg9kGXwORuoeHSyj6aSHqGPztYRvE0fKfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UuzNYFS3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B8C606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UuzNYFS3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A0C1F0089F;
	Tue, 10 Nov 2026 11:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794308545;
	bh=ZJYoYlGTPqoOkxwfBVoB9SF3Zffp0I2yLiXYZe4EBJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UuzNYFS3FDWwKXH+LNSXgIdFbJ/4V6EnD/Ikt+x+hkBnzAUkQysMeM/chbAtwPsfZ
	 YAruuxAQ2KwN/Q9lAuyqBLpCjGWl4zIb3puGg8hISQqzUX8ucBlechdh0SIAQCxVEh
	 Qq06BlBepUCggGd3mEEEc5frijIeyBvW6VUgU7QAFYAaV7yKzNkgdBN/dzWDtIjirv
	 BuQxG9v+mncAYzaMKwlqQzDtoS4tYFhdoxonMaMyHPNb71UB2baxcZ0zadzZIUdBdq
	 QyGjPlrqBsBArzNM57vS8BUv+s6EBKHFeK58Oy1m0VCbPx6+nhzOzppvOjlNpsVb77
	 97awlTHW4z/lA==
Message-ID: <sashiko-outbox-206915@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: ti/omap: describe omap3 i2c via ti-sysc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-i2c-sysc-v1-2-8945eb1d38f0@kemnade.info>
References: <20261110-i2c-sysc-v1-0-8945eb1d38f0@kemnade.info>
 <20261110-i2c-sysc-v1-2-8945eb1d38f0@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 11:02:24 +0000
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
- [High] ARM: dts: ti/omap: typo ti-sysc-sidle in omap3.dtsi breaks I2C
  idle modes
--

commit 7b585c63ba05ca384163221aab8d44c23e10bcd7
Author: Andreas Kemnade <andreas@kemnade.info>

ARM: dts: ti/omap: describe omap3 i2c via ti-sysc

This commit converts the OMAP3 I2C controller device tree nodes from the
deprecated ti,hwmods binding to ti-sysc target-module nodes.

> diff --git a/arch/arm/boot/dts/ti/omap/omap3.dtsi b/arch/arm/boot/dts/ti/=
omap/omap3.dtsi
> index 447736d2e53ca..42d80c7a0a854 100644
> --- a/arch/arm/boot/dts/ti/omap/omap3.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap3.dtsi
> @@ -396,31 +396,91 @@ uart3: serial@49020000 {
>  			clock-frequency =3D <48000000>;
>  		};
> =20
> -		i2c1: i2c@48070000 {
> -			compatible =3D "ti,omap3-i2c";
> -			reg =3D <0x48070000 0x80>;
> -			interrupts =3D <56>;
> +		i2c1_target: target-module@48070000 {
> +			compatible =3D "ti,sysc-omap2", "ti,sysc";
> +			reg =3D <0x48070000 0x4>,
> +			      <0x48070020 0x4>,
> +			      <0x48070010 0x4>;
> +			reg-names =3D "rev", "sysc", "syss";
> +			ti,sysc-mask =3D <(SYSC_OMAP2_CLOCKACTIVITY |
> +					 SYSC_OMAP2_ENAWAKEUP |
> +					 SYSC_OMAP2_SOFTRESET |
> +					 SYSC_OMAP2_AUTOIDLE)>;
> +			ti-sysc-sidle =3D <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;

[Severity: High]
Should ti-sysc-sidle be ti,sysc-sidle here and in i2c2_target and
i2c3_target below?

sysc_init_idlemodes() looks up "ti,sysc-sidle", so this property is
ignored and ddata->cfg.sidlemodes remains 0 for all three I2C target
modules.  As a result, sysc_enable_module() and sysc_disable_module()
skip programming SIDLEMODE and ENAWAKEUP in the I2C_SYSC register,
breaking I2C idle mode and wakeup configuration on OMAP3 (as well as
failing dtbs_check).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-i2c-sysc-v=
1-0-8945eb1d38f0@kemnade.info?part=3D2
