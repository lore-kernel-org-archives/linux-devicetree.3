Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586213;
	b=o3NheKvf4AYEvG5HS52BeYxB5utABuhI/iC9xf/Asg6Dra/VUmlAm5VcwVoPI27BKw4t
	 S6iqBD+b//YMDZIc6g+wRT83jpefJsv8T1RQ3tNUllS94BYfdXWdfVlTZejY6jOmzXeHP
	 jL7zd3TIBipA5wxKWhwzuLMEe+R8L9wunAfNddc2pxOyxtgnqWHPTHJG4qVnSBDtz79oj
	 I16cascZxw5HJky2czDJcPnYp9LvFB5kzRGYqGo6pc0PnYpQRUqG0cQXiHDTps89xpMaU
	 QKH9OqrLV4WAhtavsfncXXVFDcFXGdE0MEwLh+R4dKZlERvtMrJ/1ofUz4nbUa0+gaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586213;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CO68uu+19Fq5kJxdGPKAsumVDWujtn/UdXPYvC2akZA=;
	b=os/vHUeiTQFtc+YRZmj4zsJfzBR6ImxCZQ87OHTNBprCBzPGAjYl6SQdswMK59vUx0n8
	 ARM/MMdAewuf4eoa3OxoKkPo4/ky9+OQ/2Jg75p0s0HwWcvnSFwOQXFod8csC6nf4ccre
	 A3mbrsm+tghSn808r/CWccuEE6qTmshrwQ0XKWiaZzbxDnD3hO4y9k+Us+SdNjVrF3k+K
	 PCsZKeE1s25BaLjknDo48yIGEqZ4tBEx6GQG2/0bJhgikjU/3p4bTwcRRXI8ZZ/gRjlvp
	 REndeGTqcOgtQK7eLSY5BQoGfh6JJNRi823rgLlPQlZkX3e1yzgVmL72j9v747tCA2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNyJdGzJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165A606BA8A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNyJdGzJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEFF1F000C5;
	Fri, 13 Nov 2026 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586212;
	bh=CO68uu+19Fq5kJxdGPKAsumVDWujtn/UdXPYvC2akZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jNyJdGzJIdW93Mlm6IFepl9JH1YYEdWjpsLTLfOKoBjWw4WWhOTGbPYyAKxu9ElYR
	 NzDuW6NdRlS6onI66nH3A5nOmJPiuImlHriIyRV7ibc2o56DHXsXZUAxgK/I0UmtEE
	 iPU2xpp7t2LMHGqfUh0bgCVBKJ7aB/o0IYHbT6U/tsj+qkOJSvm/YEhNv9DEz3GsYj
	 wEH0pSpdPCYH/ecP3KcLzdxzGWQQu34GHscuvDubLCg90wbdTjCrkroep6nr/ARcQE
	 UGKNq/B/T3UBQ1eUpSZ+VCrVWPwSJu4YcvU1QfvZ0+yIFI/3SJ819Ae4BL10yoK/Gg
	 uZkrRNnEnUBbg==
Message-ID: <sashiko-outbox-213169@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: mdss-common: describe
 additional block resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113155606.1677313-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155606.1677313-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261113155606.1677313-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:10:12 +0000
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
- [Low] dt-bindings: display: msm: misdescribed MDSS_CORE_INT2 reset in
  mdss-common
--

commit 022650a3f28469dcfe73a6138dee6ab78a21185f
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: display: msm: mdss-common: describe additional block resets

This commit updates the common MDSS Device Tree binding schema to allow a
second reset entry and adds DISP_CC_MDSS_CORE_INT2_BCR to the SM8750 MDSS
binding example.

> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.ya=
ml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index c6305a6e03346..51ef4cc74e818 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -84,8 +84,10 @@ properties:
>            - const: cpu-cfg
> =20
>    resets:
> +    minItems: 1
>      items:
> -      - description: MDSS_CORE reset
> +      - description: MDSS core reset
> +      - description: MDSS core INT2 interrupt controller reset

[Severity: Low]
Is "MDSS core INT2 interrupt controller reset" an accurate description of
DISP_CC_MDSS_CORE_INT2_BCR in the binding and commit message?

In drivers/clk/qcom/dispcc-sm8750.c, DISP_CC_MDSS_CORE_INT2_BCR (0xa000) is
paired with MDSS_INT2_GDSC (0xb000) and controls the secondary internal MDSS
core clock and power domain (disp_cc_mdss_mdp1_clk,
disp_cc_mdss_mdp_lut1_clk, disp_cc_mdss_vsync1_clk and
disp_cc_mdss_ahb1_clk), while the MDSS interrupt controller registers reside
in the primary MDSS core MMIO space.  Later in the series, commit "arm64: d=
ts:
qcom: sm8750: describe the second MDSS block reset" already describes
DISP_CC_MDSS_CORE_INT2_BCR as belonging to the mdss_int2_gdsc and *1_clk
domain rather than an interrupt controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113155606.1677=
313-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
