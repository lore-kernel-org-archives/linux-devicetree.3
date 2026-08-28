Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AB743E06E
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787926348; cv=none; b=Jpo8bm8BiFzzSnl1QywAzhVB2LWeaok3vZM4HUEaL2ngY72ghFCB/bThNP6y+m1fJRR0LwENn25ySf3RqAAPbbA0k8nRqH0Y9Smr99xpY9Pr/pCN6u4EFm98CBPeOJFoWwevxtZ1EGNGruV8R91WPcmFnHwCQu9PXct2XzN9e70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787926348; c=relaxed/simple;
	bh=+ppYtJXH1FHIsYmhj6hRPFHgQr/0HC8yx8va0uCgaf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g9CoFtLmGOaISzac72kn6FdNSBxvfUFBqYER/g/EUgRE28Kgn2UNq56vhISuC4uhARa43vA86eD9ieqm/elYkw6f7yk0MLhNEsfeicWkKM04TftXgStSffK7WA/CrFCWDv7bRNab9KgOL5/wdXsrmO6YcfYIhl0VRexl6FrdEHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z95+DI1k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z95+DI1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF821F000E9;
	Fri, 28 Aug 2026 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787926343;
	bh=ewEW/PbNGvzn1mLO4IM8foHLLqLhEziZuJ945iu1y9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z95+DI1kY1t1hEizLC77OsvXF2Y2MZ7xNPwX96xPqJZsokkQKDSoicQqhVRv+5uAr
	 39N8h5wKR7kAHr9y2b6TLyf4w2RuqBJVGDPJcco6zBG5joE5+cdIAsRNWjxsgxJfwo
	 SdSZIxisppc7eBGDehEe20RZQ4jzvV5Zblxj7bFsgRy1/cPlqyhiFNpuh0Dl6MOabS
	 Pe9lT4u5GAlQXdPbEMwhpemfbjzQr29oO2DHol4Ecc6n6tB57ljpYK6BP2RhfcDnUO
	 CmxK4520PxhL0/ydcXRj82Gxu2zh6tnkUOuDLkf1xBVPFInnWC3cG6OKr8gvqgcVdX
	 TT4c/NToXeTbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC/DO NOT MERGE 05/12] dt-bindings: display/msm: hdmi:
 Add Eliza HDMI TX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, vkoul@kernel.org
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-5-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-5-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 14:12:22 +0000
Message-Id: <20260828141223.1BF821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The conditional `if` block for the new Eliza HDMI TX device uses=
 an incorrect compatible string with a duplicated vendor prefix ('qcom,qcom=
,eliza-hdmi-tx'), preventing the schema constraints from being applied.
--

commit 95836f68df5245b7dc121437b6c3df3442b5e4f8
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: display/msm: hdmi: Add Eliza HDMI TX

Qualcomm Eliza SoC comes with HDMI IP block, built on top of one
previously present in MSM8998.  There are just a few differences in
hardware, mostly about handling clock reparenting, but more notable the
old binding looked incomplete, thus devices could not be considered
compatible.

> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Do=
cumentation/devicetree/bindings/display/msm/hdmi.yaml
> index 02d27ccad0247..6adaa095b7473 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
[ ... ]
> @@ -159,6 +180,44 @@ allOf:
>              - const: bus
>              - const: mnoc
>              - const: iface_mmss
> +        reg-names:
> +          minItems: 1
> +          items:
> +            - const: core_physical
> +            - const: qfprom_physical
> +            - const: hdcp_physical
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcom,eliza-hdmi-tx

[Severity: Medium]
Does this compatible string contain a duplicated "qcom," vendor prefix?

It appears that this should be "qcom,eliza-hdmi-tx" to match the compatible
string defined in the properties section and the example. With the duplicat=
ed
prefix, this conditional block will not match, causing the constraints for =
the
clocks, reg, and required properties defined in the "then" block to be
bypassed during dtbs schema validation.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          maxItems: 6

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-drm-msm-hd=
mi-eliza-v1-0-67843277de17@oss.qualcomm.com?part=3D5
