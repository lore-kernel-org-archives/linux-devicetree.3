Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B9B39D3DA
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860188; cv=none; b=tVPehpL4sw6G0JM5Cpz+03gYY2YTFmgNJvPy/7IiA8sUkB2cdA50euq+g7NThTYK2TSVkQwoiR1fySy5T50Z04/+0mrBk1LIFgH/kmDwsZWInkXJW8aTp/CAavAYveFEuErW8KeGUDa2CseGZQ3NncHQqC/SagXOubWo6bj1Dw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860188; c=relaxed/simple;
	bh=+qcOBCyquzbMXOAKmlpf5VjF3OUAWJ6xtfrO0MubXiE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H+kxgwkUH75tHgehvnwSjQ6aYkwoh+ucWXkzFB6YG2eHfPdUJ6J1o1JS0hUoH9L9qxAyOgovhrgG0sKcmbXQMp5RB2+W1LbZSJYP3jBwBLskurLDvn9FaNBNMiSbhZpN8610AlVUOXikcE8E5Ep9SRq64ADJvMV85Jg/QctXGIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bA50JpBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bA50JpBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DBE1F00A3A;
	Tue,  8 Sep 2026 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788860186;
	bh=Mq34waoJSk3F6r5C2Uw1p9anvggTnBAYjIx5URUw9Hk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bA50JpBoC1nkh7i1D2n3vOEyGjXcM2i6D3F2cGoV/Q2HTTs6JLvQySm35PQV9hkpK
	 LWAssyaQFRRg2v8EgbX/eooDQjs99LFVqQzGR1V/LyT6NnOwD84gME8Um3rbP+NYHR
	 tzYNuw3Gj3pPr0sGlZKnvPK2i5Tk/CUoXyG2dOz75KnW/gSYVlJ4Z4kH2tMIM8aPCQ
	 q3sIwaUJAV2SFZ3lTMOVYid6bM83LyI5s3Ez54Nk6NrQmFnhj9Z6QrE1907S/y5G3f
	 lTwlE7I0DcT4Y9UeH1w4a7IbPGEzaj7zaVrQE0KgJOqk0RMM0VvngnpcXDDPlegIV2
	 itRftGnN63/bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: display: verisilicon,dc: add
 support for nuvoton,ma35d1-dcu
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260908092840.225220-2-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:36:25 +0000
Message-Id: <20260908093626.60DBE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema fails to restrict the `ports` property to prevent `port@=
1` for the `nuvoton,ma35d1-dcu` compatible, despite the hardware only havin=
g a single output port.
--

commit aa050e9da3d62c01f3875ac6fea01c9b0fc78e94
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: display: verisilicon,dc: add support for nuvoton,ma35d1-dcu

This commit adds support for the Nuvoton MA35D1 DCUltraLite in the
verisilicon,dc binding. It adjusts the global minimum clocks and resets,
and applies specific topology limits for supported variants via an allOf
block.

> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yam=
l b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
[ ... ]
> @@ -79,6 +84,45 @@ required:
[ ... ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nuvoton,ma35d1-dcu
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +
> +        clock-names:
> +          maxItems: 4
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          maxItems: 1

[Severity: Low]
Does this conditional block also need to restrict the ports property?

The commit message notes that the DCUltraLite has a single output port,
but the schema doesn't restrict port@1 from being used for the
nuvoton,ma35d1-dcu compatible. Without disallowing the non-existent
second output port here, an invalid device tree specifying port@1 would
silently pass static schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908092840.2252=
20-1-a0987203069@gmail.com?part=3D1
