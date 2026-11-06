Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948258;
	b=Lt0OqoxydlSRMGvNe2z/DXoe0pT77AQwIXOlgIHw7v7sdnnNzEXlhR3BVGQkuaR+BFkY
	 RZD3VnUNljW16tKTfCsjYp/1LTJ/hP+FfM4ejzly48yR6I12KrmeIDRfiTXjtFrpIYEO7
	 /BAhk8MPz5KIZZ37lnbymFaDUE+UK8m3O3KMcIuCgpFqM0wPQyg7jtRPmEoQulhnInUuH
	 vrIuMm7QfKZNvD+4g0NrTYgzt+9r1JiaIny5e1UvMkr9lns+Wa7CzghHilSDpbwgqx27z
	 rPZC6dj+8iaHwUpb1XADSEQxp4LK0W5Gu6bYPOMUzgjhiBhTEbWMUEl3RQdttNL5zxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948258;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wFudu5RMdCwWtCoC9RfHYhR/yaakyfX/o7yaoofEnuk=;
	b=nioYLBY/fnCTAQdr+gi6QoxulLltV+UfRGnev2g94XnAaw/9U9uiDBt3kNCsidqRDV52
	 +uQxy9dCBVpdNioIO4f7UiFKdPsdSMujzqRg+4IUgOZTnaM46G1vq5wppC6McN0tY5G0f
	 m9p/q180d5t4uplwt4Wk5Cw9is9xec2x0R+CMjxQNCZifUZu/TWUx+0VG0+tMdt3BZ3Sl
	 5ueln8uK98CJ/YYagH2eI902mAZ0Q7B+t9FGSgXPg6LTjCVVOQQ1UbARH6xPeqevT4Cyr
	 BmkpE8r/1rtBXy20eAlrVv8/MM5R8aUDU/EUgOpHQL5rGFefPDKyVo51YyiX7JjqIPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8Te+K2J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462DE606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8Te+K2J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94D71F0089F;
	Fri,  6 Nov 2026 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793948258;
	bh=wFudu5RMdCwWtCoC9RfHYhR/yaakyfX/o7yaoofEnuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l8Te+K2JwFb9oBkxs6WznhJNiDAR6oFX6zoe2awu3fyYcEHz8KFnVAwu0MjHBZwl1
	 2tYU6HYpfsXvfMaa4QhV7yeG4oQm6MII4F8r81xwA0/vkyY06ynowmTiHWxuE+L9rU
	 KZwmwV6gAz5//u6q8FLPajnKsk0a/b74eJ1ln3p5RXRekISszSo2CNFhZTbHy9NKnz
	 Mb5SF6Fxkgt0lgXHcZduimKpcmS5/6YCjibHprvJRbv56H6wSBbyc8d5obgw7dqLtv
	 uM7ARFcoxG+WGPLyFea2z6+RXLwOTN+kkg5MLEPz4efvYNWbNpOaoKotTpvJCKb97K
	 poC3XiNYkZ7LQ==
Message-ID: <sashiko-outbox-200949@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: i2c: qcom,i2c-cci: Add Hawi
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
 <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 06:57:37 +0000
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
- [Medium] dt-bindings: i2c: qcom,hawi-cci falls back to
  qcom,msm8996-cci
--

commit eeb66a38f27dd112905efa0a186dff7682ef33dd
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible

This commit documents the qcom,hawi-cci compatible string and its
two-clock requirement in the Qualcomm CCI I2C binding.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec..b2b4d4bcf7807 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
>                - qcom,qcm2290-cci

[Severity: Medium]
As reported by Loic Poulain on RFC [1], should qcom,hawi-cci stop falling
back to qcom,msm8996-cci and use a dedicated variant entry instead?

Placing qcom,hawi-cci in the qcom,msm8996-cci fallback list without a
dedicated entry in cci_dt_match[] causes cci_probe() to bind Hawi CCI
controllers to the legacy cci_v2_data configuration (queue_size =3D { 64, 1=
6 }
and max_write_len =3D 11) rather than matching the newer IP revision's FIFO
and queue sizes.

[1] https://lore.kernel.org/r/CAFEp6-1Zvt0hhBd7LNx2hsyi9J+bxCT8EWN3jZ4B30SO=
58SCow@mail.gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-hawi-maili=
-camss-v4-0-d528c7a797b4@oss.qualcomm.com?part=3D1
