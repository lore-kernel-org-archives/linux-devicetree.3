Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586099;
	b=iJU9YHDUoE05qX5qagD5FUZQYIGSxCx8Ozs+PuDbKWbruoPON52VajLpQDc1jJmN8rFE
	 NgctYWDkXI+1ARV8W13PvWXajqJOwHryFF7SyfUl153XjJZAcDV8IKuXLvWyT1jjpcKLP
	 vJDPhnZyaMZ9TMnoEJSWG9Vh6A/CeRIFDw5YN3T4dPICTcl7K3LluiX5hsZhfgU0nnUw3
	 8tQntT3c4dGci0cLhQcgjFq9hNCT6bHQZiScAs6omDjYwJWx6pf6lsnQC5kHsajnbJVhA
	 AQmxkz4/jRVqGQ0xbK0XMxj3T3ieIhHVgqHsrxu1NQW+pK2Dl0oV4bhXiQ8/WzglCyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586099;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7HCQsoKBHtIuRVqYGL/sXSZ/WJIPHBKdU19CX6ZrJQg=;
	b=nJa/Jz0A+/f5kEikLK/s8UXefmpFnzIFXtuPFSnJR9zx6jhI2xDgXER2dsi28TQ3xN9r
	 bg/WGZQeFy63EU/X8S7MUiBYWDIwI/NsDNAg4Oo0wVrtSMp/SRyjPfxgzY7LWZA5W9SMi
	 OZb4CHdztXyl0L7Qb20IlZNtdJdNVFZ0adsZPfnOlbxP/RpQ4hnVGV9ijSPlHbqqJwArF
	 rzcFkoJFF0exxAP3G1fXud8Yxmqv6258ZtTASY3d+vMFJbo7r8xYdnbzxMQef14bdj6qU
	 6MS6PB1R0vH14xUCgCRyZcYnwYeT6B42rkj72MSxNVuicJC9+gEfa+ZjD0FU5McJFZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GD/MInvS";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539D6606A884
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GD/MInvS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E350B1F000C4;
	Fri, 13 Nov 2026 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586099;
	bh=7HCQsoKBHtIuRVqYGL/sXSZ/WJIPHBKdU19CX6ZrJQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GD/MInvS/r/kVol9hR+xKVZYMGjTbHrYWDtNw174NNfswqfP5cK6j+o5AQIoWwBCo
	 fuJ/PEFACMPOC/aISmxNAfuMMXgTO/val8UTfOcNTLR1+RgICzLiOTcA8Ig71zQ8of
	 08/SFxNKlmYliTNmxuvAWiMIkC5IaDZ6cMRdaleNpqvVFbMfNxxkOv7w1g0Fqr1dJE
	 HJQvK73iqORJYG0Bv+65p7GZGp78A+8JMGeVL/9nuv57VeDcneB2zvP9MQ9VfRH/b4
	 6KP9tvz2XW9cgJK8AaIDLtrKs3h+oLFe+yJBx5W3jIDoh8PHPIR0Hyz0s2J23qmT6O
	 BhivPTsxqxBlg==
Message-ID: <sashiko-outbox-213159@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/msm/mdss: reset all block resets described in
 DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113155635.1677541-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155635.1677541-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261113155635.1677541-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:08:18 +0000
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
- [Low] drm/msm/mdss: inaccurate INT2 reset description in commit
  message
--

commit 216edbc98463c8e657023589d0ec19367667e829
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

drm/msm/mdss: reset all block resets described in DT

This commit switches msm_mdss_reset() to devm_reset_control_array_get() so
that all resets listed in the MDSS device node are asserted and released
together.

>     msm_mdss_reset() acquires only the first reset listed in the MDSS
>     device node.  Platforms can describe more than one MDSS block reset: =
the
>     SM8750 display clock controller also provides a reset for the MDSS co=
re
>     INT2 interrupt controller, which is left out of reset when the
>     bootloader hands over with the display block still running.

[Severity: Low]
As reported by Dmitry Baryshkov on v3 [1], is the commit message accurate
about DISP_CC_MDSS_CORE_INT2_BCR being an interrupt controller reset, and
what is the side effect of leaving it out of reset?

In drivers/clk/qcom/dispcc-sm8750.c, DISP_CC_MDSS_CORE_INT2_BCR at offset
0xa000 is the block reset for the second MDSS core clock and GDSC domain
(mdss_int2_gdsc and the disp_cc_mdss_*1_clk clocks), rather than an
interrupt controller.  The commit message of the follow-up device tree
patch in this series was updated in v4 to describe the second MDSS core
domain and the cold-boot symptom, but this commit message was left
unchanged.

[1] https://lore.kernel.org/r/awb7bslhrhemsgvu7ubaejvurk6fecotgvqlwtvsoe2be=
nqdgq@tvh2sfjbuzyu

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113155635.1677=
541-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
