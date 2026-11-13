Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560137;
	b=REssH6N/fxZ/+93Sj4gfJJVwdl1hPBfcLNGsqY0lIsnSSZURNYctUUO1qzYGj4zZNy98
	 4xxa89GXFx5JaEFcIKt2GneUJ7Vlsn50XSko1CCvIbyo/k240pXUXcAVTEY1Sb2uRzIKx
	 bfTp237hmcvNWbHAiO908sehyJDOQOzW6Ltnv4G/3jaH428bmAEZWX5sk5DIlROSDp77R
	 SQiYFn3ezKDIhxdIsjfD4RGP1S15Rin2dOvcmCicAdVDbg/KQpyIStYSOmXvZN6HrrmrZ
	 J69MP742fgZn05ThcTDz7bCTjwGBTCBXyyoCK8AuONWhl3p/V4bA/Sycuno/lF74Ixg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560137;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YWC5GW6QzXr3mcRyv3EAX+VlztrwKrULHabvYRb7ceQ=;
	b=jXHGsYsh8MuYI6wxEjbaUCGyl4iJJ0AgaZUD2NfNlWAKi4JEZOPmHkFm/RwxKSzVzKDc
	 28eUyrmY0EGsTNemmZVuuGcm2nJS2v8VzkZ2Fkx8eSYnHvxGrLmp8Lj+xmkLjdZMLYOU7
	 FfFBea9mF64tb2qtXYQjoPBT2uOjXO7xA1yxY75RhzC/tDe+/J5xIeBoVzvxeJYLK9+Z8
	 wq8sbTGEP6AxmdINtmNhxjzRG/kVNhNJrjizY791jzjMhpb01pn8iLqKF8CELBYN5e61n
	 ptROCCal5IcO6zKS7rgrrpoRcI9/NZE11RUwsNTKzw6UKt3D2nyWn8AEM0IX7OqugHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="N/QjL3n4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9992F606B36E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N/QjL3n4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8421F000C8;
	Fri, 13 Nov 2026 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560137;
	bh=YWC5GW6QzXr3mcRyv3EAX+VlztrwKrULHabvYRb7ceQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N/QjL3n4wV2iXjDUIJA2alr/cn9/oM3DG1rGbEjfMiDhh+NFICzU2I5Hqx1wP3U5a
	 cUlBU61JnCeWX8O5+k0Ztm7dqln1V23MIXLEXimDthEgnIrr2XG1rx/hOladHqqCRK
	 9uGu1fuFLKFyyMMBRReTWQODlmkCvJPTbCU/BN+DYT5VqWHKZlxPIBwQWtXeLc+3sL
	 FPmDeulQklYvhxXNNVUs9ZIl/DVtYWNQlQ17VT4cVbUH2KN8TmZvNq/r0Z4lF7luJ+
	 fUlw4UkFqGOiM90fYj75sKHMIig/5GvMtW2UzucF351TPm9rzghw64SMSzKrNsePt5
	 xGfQbfXL6Scvg==
Message-ID: <sashiko-outbox-212478@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: display: msm: mdss-common: describe
 additional block resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <114cd1bcce56c1267059826f7c9619d835a2912d.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
 <114cd1bcce56c1267059826f7c9619d835a2912d.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:55:36 +0000
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

commit a487330ddb2e36a5355178c8c4bcbb0f50bae826
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: display: msm: mdss-common: describe additional block resets

This commit allows the MDSS resets property in mdss-common.yaml to accept
one or two reset entries and updates the SM8750 MDSS binding example
accordingly.

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
Is the second reset entry an interrupt controller reset?

In drivers/clk/qcom/dispcc-sm8750.c (and earlier dispcc drivers such as
dispcc-sm8450.c and dispcc-sm8550.c), DISP_CC_MDSS_CORE_INT2_BCR at 0xa000
and its paired MDSS_INT2_GDSC at 0xb000 control the secondary internal MDSS
core clock and power domain (disp_cc_mdss_mdp1_clk,
disp_cc_mdss_mdp_lut1_clk, disp_cc_mdss_vsync1_clk, and
disp_cc_mdss_ahb1_clk), while the MDSS interrupt controller registers
(HW_INTR_STATUS at offset 0x00010) are part of the primary MDSS core block.
Should this description and the commit message refer to the secondary
internal MDSS core block reset instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794558882.gi=
t.xiaqinghuan@mail.ustc.edu.cn?part=3D1
