Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E59B51AFF5
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 18:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790792577; cv=none; b=lyV8+UaFA1h1e9EOAajdsXS4Eq/TzWEwjy3rUilsckzhNvQa/5TlehnBG9nyVom6ivv+gb8z1Hbi4AnLj/TLva9bPKvnowLmgChPPnkq2NnTrvQDbYPF6HBc1W9HUfWpYPPQ+BdDKf24GPC/XxQkueqwak3YL54EvqMiLs0kiQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790792577; c=relaxed/simple;
	bh=2C+bBiPe5DNT+9DNg92+7Lm4v0Aro8GKHfxyHmnKvio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJdlGafdVO8b/LJFWb7ffgzVQqpnz1Bge83HhCynx32l4+FBGeoVa1qtH66A5+SL3k7QkIJa6Oe0PttVsU0pMnlJtnKkRDJSpH6Ojado8KLO39goR9a6mJOAYIxjBI2mHzduK97cYAhyU7ESmvM0lUhkKAOT2J7C1Hwsnh6uSxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9IXjjbm; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9IXjjbm"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b3acd24099so2594827137.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790792575; x=1791397375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHAmxuGP8QS+IgIpP7bcBqqzxOp25g01NqU3vCP0Yos=;
        b=B9IXjjbmtq2z3bRyuSNMtE4YewdpYBDWt/MZVHjtyO2vpAUuV6eZslgWGaMbzd+xCK
         HEAYJb0vmqL/Ql2FUltaYlM3DsdE1dSJMphPoQL+cj8UeGUQz0TYhL8wRLKiCt08GCOp
         2dZPcMjVcDFc36yAReo61tUJ2VUdbX3ddjnWjqoEYBLZWNsZBqDEu98ml5JFhjTW7RbK
         h15lwAftzZu5ur2sS0FnunDtVOanTEPBcmo40tTjHQxf3IyuVgzqt0vKVa7goYwgxeAU
         Hf4SCb4vrkgEtaSnTAuUwgm2SPd1VLGdke+dmVlCuoAAQUg82h13IGWZruOfhwiDeMK8
         bYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790792575; x=1791397375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHAmxuGP8QS+IgIpP7bcBqqzxOp25g01NqU3vCP0Yos=;
        b=gf8nAfAdyQn6RslZ7ZrGEuUZDwWIuDsrPpspJm5KcwW6V0PDFJRzIcxgd4MifxpS92
         9v4rV51yq/8T5UABsmDlZrE7rx48fFzv0thtkEVmxtvMS5nXO6Bww6mz5Q28wRXGHqR5
         16WH403hwkNdGF7C+VTooTQ8NQ1iHfxBNsKHU9cWuFkLRsYGzZBiPret3gqDLFX9H8L2
         tZ8n1k1Mlqt/atWkdlk7VbzV1tSNgTwlKcqSuAl5I6p1Lo7H3xxbBqevGgQLODgc7uPj
         9BgE9U392897onnRyUxwBtkLupEzoFQgaDPkykju/ihC26MZV2MX2CRx5N8MUyhb3n4J
         kvng==
X-Forwarded-Encrypted: i=1; AKwUvBznTO94DfUYhljfabA3BbJ5/Ie0kxnOZoqb9/cK/GMrSerKp85stikUwTWoGUZelUuxFCT0Ctf4hKjt@vger.kernel.org
X-Gm-Message-State: AFq9FYLtwuXCsQn+pG9u7gPtccnT/X8mOMLIw46eP1GbMdyh0eM8fn8c
	VH8m3+ab6sKnXaF1JJ1HlXt1GgUqVE4YtrnPbnwm7GcpIubBYYKia9nk
X-Gm-Gg: AYBFou05c6kElozLkgp1Kn25Co3ABBcxu7cuJsyFChfAR0/8+NVGUin/BaYwog3VyKM
	UQChpA/7HpUOZ1mKHuR9cCgodHk3NuyHWG6+S4J7aOV55/fmvmarB8D7ho49nQ2RNPCO5HMSNMw
	efwzkDW9pwX343RXQMgw2TT1vGxDah0iCIeOxsOxO6Vuig2VV3SWskY1AyEAQnTnZhMbEYa9blv
	FVdEm7UfXnKtlRK0d80OREA+N+otnZhuM8XjLufqg3IoI3g9wZxKtcnDdI6Ao/tFWhXf1+RECnH
	JrXugjbhWXQefy+4XLWs1qYNNYLH/viuTyf+eZsjTxsflZeN3sR1CQgWXjedyvCsJnMZ1OIxkc2
	NFD55tnfKYNd1F44itR42o1O21siANTDpQKMlcf1p1gTuwoRfI5G0sumhK1Kd4IhZoxemfAYF0I
	1fn27zvU198Y03f7TtbVkRy3JM4Sbu+yUesiMNeNx4+8GFkeq7sCfdJuJKcIKWTFLcbwfpbeMRQ
	HxZ
X-Received: by 2002:a05:6102:6448:b0:7a0:f7cc:5045 with SMTP id ada2fe7eead31-7be728b4d55mr731989137.9.1790792575104;
        Wed, 30 Sep 2026 11:22:55 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98a86e99290sm681741241.1.2026.09.30.11.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:22:52 -0700 (PDT)
Date: Wed, 30 Sep 2026 15:23:05 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, marcelo.schmitt1@gmail.com
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, conor+dt@kernel.org,
	robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 08/13] dt-bindings: iio: adc: adi,ad4134: Document SPI
 connection mode
Message-ID: <ar1TiXPQSO3xCp6B@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1790719424.git.marcelo.schmitt@analog.com>
 <12e5af9d96f6c5e800ad860d3cfa6ac8006a22e2.1790719425.git.marcelo.schmitt@analog.com>
 <20260929230226.DDDAE1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929230226.DDDAE1F00898@smtp.kernel.org>

On 09/29, sashiko-bot@kernel.org wrote:
...
> > @@ -141,13 +161,30 @@ required:
> [ ... ]
> > +  - oneOf:
> > +      - required: [adi,spi-mode, '#daisy-chained-devices']
> > +        properties:
> > +          adi,spi-mode:
> > +            const: one-channel-chain
> > +          spi-rx-bus-width:
> > +            const: 1
> > +      - required: [adi,spi-mode, '#daisy-chained-devices']
> 
> [Severity: Medium]
> Could this regression allow incomplete device trees to pass validation?
> 
> In JSON Schema, property value constraints only apply if the property is
> actually present in the node instance. Without including spi-rx-bus-width
> in the required array for the two-channel-chain branch, a node could omit
> the property entirely and bypass the multi-lane constraint, falling back
> to an incorrect 1-lane default at runtime.
> 
> Should spi-rx-bus-width be added to the required list here?

I'll do so and further test dt_binding_check catches any invalid combination
of properties and values.

> 
> > +        properties:
> > +          adi,spi-mode:
> > +            const: two-channel-chain
> > +          spi-rx-bus-width:
> > +            const: 1, 1
> 
> [Severity: Medium]
> Does this YAML constraint evaluation cause a regression where valid inputs
> are rejected?
> 
> In YAML, const: 1, 1 parses as the literal string "1, 1". Since
> spi-rx-bus-width is defined as a uint32-array, the JSON representation is
> parsed as an array. Comparing an array against a string using const always
> fails.
> 
> This would prevent valid hardware descriptions from passing dt_binding_check
> validation. Should this be formatted as an explicit array to match the type?

Will fix that following the suggestion from Rob's review.

> 
> > +      - properties:
> > +          '#daisy-chained-devices': false
> 
> [Severity: Medium]
> Does this regression in the fallback branch bypass the intended daisy chain
> property enforcement?
> 
> Using oneOf with a fallback that evaluates '#daisy-chained-devices': false
> allows any configuration missing this property to evaluate to true for
> this branch.
> 
> For instance, if adi,spi-mode is set to one-channel-chain but the daisy
> chain property is missing, the schema matches exactly this fallback
> subschema. This causes the oneOf requirement to pass entirely, skipping the
> intended validation.

Will double check that and, if needed, change how the constraints are written.
