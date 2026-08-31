Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306703AEF59
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165767; cv=none; b=hIlO/7ounJMZqlKw4FiUOuy/ZyDzvVzaDsAJqo8O5pdEZj5IVXla/wutFSuaJGdCkn5tlbkKRp5sDCTJVMbDNFahARt2CoNURJe1EsUpqaFT4YD4jUtzUCLNrgYksN6cPMiNilcWciWukNV7IaRmojVgujg1v7UtdRESy2VvNlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165767; c=relaxed/simple;
	bh=Rwe0GCwO7ASl44P0Eertrbhqzrq6LpgeS1FZqPsnq3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nej7/0zAfHga7J2fOlJ4bDvjOqTuQVySlc4/PpP2FkEeXuT6Ot5Gn7dQpglwq3nRm+BFswAZQJjgeSy9YIQwlrOKePv1yjjTZeILkk+91IJ6Igu0ayy8SG48ViXgwG51GPWcJWemSN15TKT3b7Min1fpb3UUE+WVI+2ija7OR0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4ajlRmb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4ajlRmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7960A1F00A3D;
	Mon, 31 Aug 2026 08:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165765;
	bh=Vvg3sfOFpv/DBqo2re/qrS5jT9iJB0JgddHp+qkdo2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R4ajlRmbQIuQCKq+DaeMqjNYNaz9vupn/ez8Uzir58RSY/3HkG2Wd45qbyw5sNKqE
	 3O1gZKO+0Qu3zRhTWLe3Aw55KLhPcTQ54n6WfyYgODU6svpExvwU4KMMjH7j8Ap6Dt
	 gSVp8RGrLIqgLlhR70gzZhAEjv2Dn1f0hDwFNjAHcqYpbyIn6lVHq8LBGmu3U7Bb00
	 dPNwRVnbw4pskbY1nWhZ2n67Ae6OELIotdM+vmU+uEH82E5crPe5YABCkzB6laljd4
	 g/wHzk6pqRvlT1HhDVu0dkZ86tLGw009TifmhL8qVkyfqA7zArMdPQjOMqaKrRq5Ki
	 EHJxoJneeFGIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: media-ci@linuxtv.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-3-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-3-830195b9bd91@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:42:44 +0000
Message-Id: <20260831084245.7960A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding specifies up to 2 interrupts but lacks an 'items' list =
with descriptions or an 'interrupt-names' property to identify them.
--

commit 96c8a7f3d12fa5059564a56fdedd6a77c76d68cb
Author: Zhentao Guo <zhentao.guo@amlogic.com>

media: dt-bindings: Add Amlogic V4L2 video decoder

Describe the initial support for the V4L2 stateless video decoder driver us=
ed
with the Amlogic S4 (S805X2) platform.

> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml=
 b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 0000000000000..a93a2140801b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
[ ... ]
> +  reg-names:
> +    items:
> +      - const: dos
> +      - const: dmc
> +
> +  interrupts:
> +    maxItems: 2

[Severity: Low]
Does this properties.interrupts binding allow up to 2 interrupts without
providing an 'items' list with descriptions or an 'interrupt-names' propert=
y to
identify them?

Since the driver uses platform_get_irq(pdev, IRQ_VDEC) (where IRQ_VDEC is 1=
),
it relies strictly on the index order. Could this make the bindings harder =
to
use correctly and lead to broken interrupts if a device tree author guesses=
 the
wrong order when constructing a new board?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-b4-s4-vdec=
-upstream-v8-0-830195b9bd91@amlogic.com?part=3D3
