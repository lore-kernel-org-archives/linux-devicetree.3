Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D312ECD1D;
	Wed, 24 Jun 2026 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287944; cv=none; b=AmUAkGNADLo42sn2E5+XzhiI/STZ19ViLPpRx8f+WOT1iVWX8GET6n0fNbNAFAdIpu/fapNcQfUAxedalBYqLEfIdbEQLiQaZBOzv5RsTn6x6t5ai2HiN+4+ObcZ5kNpJ8QEgmd5AlprbMbdpFbCUCBzD7dA9KtB47ZUfU1a+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287944; c=relaxed/simple;
	bh=dbVtdGRJnbQhHBFeu1GGdzDEazzTr9j4JIGdNA1OCwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNLGriYY8oiPVUpxgZsMjhz212+O//assO5i+/yAeFDfNB2GN5eV3C94ERCpfhyXINryRG0w7kDwBZtSY3gWd4baira9QCdEa/SXzyg8tyf0+tA7o7/Ma2st40HPSflMYp77Tg1Yr42cUdtiaQ/favSYLbjbdlbVYr8GLVyfw+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8HFwZ7y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8HFwZ7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A051F000E9;
	Wed, 24 Jun 2026 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782287943;
	bh=QkYKCgxQU6KvSyvLLWfg45WEOY2XnUCNPzXVNmKvy+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n8HFwZ7y/8Sy63L+oepv4OUd/GA8G/porNz4CZTiKCED9Cx1oudWaG+jczBNhs6x4
	 GpEHfC42VPs1qeEyHJuUVNeNWC1ObC9oVt7KjI9OwpYzHV31gcSUNmfHGVdMqNSPH8
	 dEXVqkXojMHTaCY9SgsnEQ00l2Z46UE2dx1H82Cfz9oL77fd5WhDwCoSvAnD8U31ah
	 wyrAbV3xew9llyf8uY8tHB5obCpkbVIb55fQ9c5Zy8oTG7AETkjf4rndJ44w5qXz5P
	 Y9W3jb6HgAdln6ai54HN3AWrj7YBsKAxJg9QbflMUoEedQUw0XnGP1m1J/vL4XapYe
	 LPKafPkow5eqg==
Date: Wed, 24 Jun 2026 09:58:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mediatek: cec: Correct the compatibles for
 mt7623-mt8167
Message-ID: <20260624-silent-judicious-impala-56b20c@quoll>
References: <20260623135757.5111-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623135757.5111-1-l.scorcia@gmail.com>

On Tue, Jun 23, 2026 at 03:57:53PM +0200, Luca Leonardo Scorcia wrote:
> The HDMI CEC driver for both mt7623 and mt8167 is actually the same as
> mt8173-cec and the mt7623n.dtsi board include file already uses mt8173-cec
> compatible as a fallback, but the documentation lists them as separate
> entries. Correct the binding by adding the correct fallback.
> 
> This change fixes a dtbs_check error.

which one? here you paste it (can be trimmed a bit)


> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../bindings/display/mediatek/mediatek,cec.yaml       | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
> index 080cf321209e..4d741ba415e8 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
> @@ -15,10 +15,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt7623-cec
> -      - mediatek,mt8167-cec
> -      - mediatek,mt8173-cec
> +    oneOf:
> +      - const: mediatek,mt8173-cec
> +      - items:
> +        - enum:

"This change fixes a dtbs_check error."
... and introduces new other errors, so error count stays the same. Not
great.

It does not look like you tested the bindings, at least after quick
look. Please run 'make dt_binding_check' (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Best regards,
Krzysztof

