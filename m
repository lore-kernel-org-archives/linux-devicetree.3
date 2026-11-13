Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586335;
	b=uc7H43DOgKRle6bZwFLViCLJoI7gHDMZgsioG86PO7bxOXYPL6zvm7dNg1HLZhaFfKI7
	 W42o+MG9lhRDZ6Z+X8bMdO3oSgsKGzViYq/qZRT09Jmy3a3D0eIqx+TmpKJL24uGKSQbk
	 DhnxJY/fLrpOdt/2Y239O++RpwGD6oRUVmlBOTJE69tJ0kjcxH6YfNNMKyrZBwRboRxTu
	 kL5YyqtwEyNPkLzrvjQEJr/qu7tsH9kgG/rhUpWwkZZ9ommeXo7RoibaVfS15f2lE+Vqq
	 v5BWE+otxzR8J0w3tJ/aDBWAuW1gZ2cgSpxQtDXAT+YR2HXhIDgy5a544CTkEyCbRTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586335;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1GPN2CYAxENG+Z5ps/0508Q/FCgeOgFKH22MWuJY2pw=;
	b=ixUA8XOWIhPdvC7SxkDpA4e6ELuxk5HxyJZmUPpFahDzhyF9dsql4+nx+jgd/usWKi6s
	 MZmWy4CURgUsB6desUu0iaF4/yab7+bvGlUwWwaa2X22OzvPef4Rht0A3ArcQcWOvErDk
	 htZMRv2mnevw/1WdFL/xp7OPHudt82efDwfivkgMNY4q6SxAZXtx5MuLzaj00LaBYVc/i
	 xKmbjmU+LGPNAiDGGOmL+nv6gVplWDqCTl0FJfAlXS42xkQA03WB+SpfffVO5NefHSBoE
	 aDCR3QGh4YCiAPX4G5Av0nejjyYJTI+YerRi2syS8PGvYgI8xBHVehmvqwSQ3qKHGqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kdENJYhf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C42606A893
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kdENJYhf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8371F000C4;
	Fri, 13 Nov 2026 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586335;
	bh=1GPN2CYAxENG+Z5ps/0508Q/FCgeOgFKH22MWuJY2pw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kdENJYhfofxxdQCrQU7AVdLmUf9YvwnsBBpiolACuz4+UeWwtXjazOl9nwu1F659e
	 xQMPWVQ6XwfeJtc6XJXA0EAPN6J8tlke7eBUg+ZMZhbjGJT7oW4OQpL5FBxUFkzupY
	 DHJHesOAEqEuyo+jnkwdjFSSuyd/YYtemhrLRn+aCp6M7RXEVN92788brUiSTDduq3
	 BUXVUI0OtG+UrRL0qDYss9aQ2QAQDuAz/Gs++FB3Kh/pB92LFafP+G9d6HfubGUDgO
	 Iv93fNT3kTZDzLjhE69mQN2zMoVxpmhGpfakxlF00R+AZCdNrtRh9O9Vhscyq+4LN6
	 rB2pIauV6ZxMQ==
Message-ID: <sashiko-outbox-213171@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: mdss-common: describe
 additional block resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113155635.1677541-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155635.1677541-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261113155635.1677541-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:12:14 +0000
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

commit 0f5d0a5d3c7e47f59b13ac8f16fb077159d613cd
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: display: msm: mdss-common: describe additional block resets

This commit updates the MDSS common Device Tree binding and the SM8750 MDSS
example to allow a second reset for the MDSS hardware block.

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
this reset (and in the commit message)?

In drivers/clk/qcom/dispcc-sm8750.c (and sibling Qualcomm DISP_CC drivers),
DISP_CC_MDSS_CORE_INT2_BCR at 0xa000 is paired with MDSS_INT2_GDSC at 0xb000
and resets the secondary internal MDSS core clock domain
(disp_cc_mdss_mdp1_clk, disp_cc_mdss_mdp_lut1_clk, disp_cc_mdss_vsync1_clk,
and disp_cc_mdss_ahb1_clk), rather than an interrupt controller.  The MDSS
top-level interrupt status register (HW_INTR_STATUS) is part of the primary
MDSS core MMIO space.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113155635.1677=
541-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
