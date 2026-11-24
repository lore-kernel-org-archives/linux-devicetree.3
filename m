Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536075;
	b=uXEd85cTAzlO/+9YxsMpMoeDttpF/FkrB24V7g6MdKAMWE2PhzXn6sNrktFTVgjoKWp+
	 fXgn57W+7mIIAaus8TYIKGmtDMYF4ahVQfOa3ShetSOvoj0pg1fwLvuEphS4giD6vYpsI
	 KToYlqXltzGUA+ijhpm2PCyVaKAK1epNSq61lzGWbaO6flEuiq1iKH4z4SKfc3we+Gs5G
	 w3GG9uSwJeNOHhV7F8QrG/Xh/a+xEkmnijQCHOBeNHDobX831GavyCixTgNpXF7r1xBkB
	 l9U4qvdm3/R2/YwKPEXV8GXcRavXQmoNfBWswyDreBUPrGcz6s1tyFpzps9YGuygobA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536075;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8sGR4iHu5TMhwED7m6JSD2tMmjVouvYse6AbT98Ap8k=;
	b=UaDrjA3hVJpj43/ezW1YRSoF81SiJiNOu0UvOEMYjyHxcvKqZhZ45qvh7GnRPctTr4YD
	 sE5cnIYJ7uie/HMEclcQDuG4Tp4l7a1PMfBGLKoSPT1KAR1nKZTLYjVr6kJ8ewhG2/1dh
	 9cBmrJB6zWEjvNGtbqMFN3rynKnZHWAuLg/7zzSsIjMsOT6/oUNTisOWNkHISE4bcl2Dd
	 y2wN+zfh143p3Xz1WOd+EbKaQsn7cyGnuXL1my7BHuh/iW2S3bG9/k1WdOc7+UfFvmRcL
	 ok82zo3sMCV3b60+xKtBr4ie2TGjQx1H/S1beg75lbB8NQbIsTYQnBDP/fgJl9Eoc/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADpVGNcD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AED606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADpVGNcD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7E71F000CA;
	Tue, 24 Nov 2026 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795536074;
	bh=8sGR4iHu5TMhwED7m6JSD2tMmjVouvYse6AbT98Ap8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ADpVGNcDWqwUcCbBs3A9M69Qi5TpS4IKQTL7wXmy/xNrPrW9KvrbG031nXMHx5Yfg
	 PQkanW/DQr8lH/0XrwW4Mhkzvr+5FWDoCfkDNALZ4QXJV1/emKB+ilKDl85edBmzBF
	 QbnqVnLUtiB1iPkerSGHnQbU0HBqzA+ahlXNZUH7yjqkhMibvbQKJEgj8gc0tCzMdi
	 9V3NLTVit30wmosY7DoF7mGh4YS+GVsOypKCTaGwbce+qRLBZutgLIoYu2m3TFa5jI
	 C2t3Y9y4Na58AQF5BSSZj1KcQEHdeCuc2ocArtc+9hoSWOlZ9ND94qfkoxbNzw3xZP
	 SsV0hTHRFxR/g==
Message-ID: <sashiko-outbox-231516@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 03/18] dt-bindings: display: bridge: Add
 starfive,jh7110-inno-hdmi-controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-jh7110-clean-send-v8-3-de92635dd857@samsung.com>
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
 <CGME20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af@eucas1p1.samsung.com>
 <20261124-jh7110-clean-send-v8-3-de92635dd857@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:01:14 +0000
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
- [Low] dt-bindings: display: bridge: interrupts listed before clocks in
  schema
--

commit b6ba6025b0306adcf27f7bbe0cc55dd2f63c08f8
Author: Michal Wilczynski <m.wilczynski@samsung.com>

dt-bindings: display: bridge: Add starfive,jh7110-inno-hdmi-controller

This commit adds the Device Tree binding schema for the StarFive JH7110
Innosilicon HDMI controller bridge.

> diff --git a/Documentation/devicetree/bindings/display/bridge/starfive,jh=
7110-inno-hdmi-controller.yaml b/Documentation/devicetree/bindings/display/=
bridge/starfive,jh7110-inno-hdmi-controller.yaml
> new file mode 100644
> index 0000000000000..eb03404d8c60a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-in=
no-hdmi-controller.yaml
> @@ -0,0 +1,121 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: starfive,jh7110-inno-hdmi-controller
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The HDMI controller main clock
> +      - description: Audio master clock
> +      - description: Audio bit clock, from the I2S transmitter
> +      - description: The pixel clock, generated by the PHY
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: mclk
> +      - const: bclk
> +      - const: pixel

[ ... ]

> +required:
> +  - compatible
> +  - interrupts
> +  - clocks
> +  - clock-names

[Severity: Low]
This isn't a bug, but in DT binding schemas interrupts is normally placed
after clocks and clock-names (matching the order already used in the
example node below).  Could interrupts be moved after clock-names in both
properties: and required:?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-jh7110-cle=
an-send-v8-0-de92635dd857@samsung.com?part=3D3
