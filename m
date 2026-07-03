Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B89C233938
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 19:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108220; cv=none; b=Q4l8kC2PsWpJY7RP13Ldg+s5riEKIiRpLWUI50Mg1gNzK0dBDl3SlwvhPbL1Sr3birYXrQFxZJqNoz7Fxq4DtUNG/D/NcwH2KS35HAoxM1iD78m4naNf+xJ8lWcQKGQ6PI5NiDMKPJ5KrEKlYDocwWPj19cp4jv7S+/KgAiJaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108220; c=relaxed/simple;
	bh=unqNE8MP8lZX5bdNWaLZFUY2fN5TbzELhGKn7b2Dll0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ14fRjsOzX0conqlosuMzBWXkfQsjy5wm/ZQOvwrwsAYSKoydvWZOexrq50NViUC+qv5UO7Igg9WBtRa0fEAKycFq9Qy5WeiZtPsyC0Gb9RxcXZnHxe+cUlzQ7Vpd49Q0hoJUQ4kzmlaZAyraJHAd4tkbarCS6kYD87IjGsKTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPs4IcAM; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPs4IcAM"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-80bb578d58bso7049177b3.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783108219; x=1783713019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3YDyivCac2qwNApiX3s+EtwOjLvvZwzcM7r8yH4SCHI=;
        b=HPs4IcAM7hODQob901yoWImjnWrFQtVjbP4gFOLHR/ZzU/g1cbbuECOF9z2f6nweVx
         11rNedSHvGlZ9qbgLV9Iu2evYLYfA5cuXA9SnhXMlzXvjhLZjg4t+Mg8RnJJhgne7UY/
         s+eTpup8DVP9DxQd3t/1CD+3lrB1sxYuZiqGVNU0KQ5CJz+o+PJ48unCmch5AGbc/Sjv
         q2T00lDRmY9Hy/krNAxZ3hHwDnpg/eiK6JK5+m7+yng4G1Ed9CZ+HQqW2OpJtg78GypX
         bDlSJt4OfEKiSnxiofWdA/y2oqc72LO2d21PYbaoKk8TzqHg7jyo+HC2dtR9/fpHyk7d
         eQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108219; x=1783713019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YDyivCac2qwNApiX3s+EtwOjLvvZwzcM7r8yH4SCHI=;
        b=PDThsN+aBMWzDApObIdq1X6pJYHh8luvNmmn+GXHEwq4BOe9h+aIGERDSIbetnKH68
         s8Pwi5PQHco7WZJW/F30iAuIaIgESj626yEvqvcRlhrD5aXZ4sBk6mrEgPAAVWXyGVVK
         ZVNGDM7VT46zavyyVKnGcVI+073IGLw7vHFvSaFCfHMeK1rToxTrMqa2W7XTTxwV4Qnh
         t6EsKd+uEzIT8GWEoZW7INElBnjWkk+VxEDeGja05nzqoEdsH9clVOvJ7PXBTcj2VkEZ
         hk90NHR6iUdqjd3EeRki8j8szYpj4WuwrmhzhSdeBvQDHp/Y+Kll9gDXfezMPL7rnQyr
         C8sw==
X-Forwarded-Encrypted: i=1; AHgh+RreUypZ2EF7pQt+q6joxSQhm68qVOKHzV6EF8KX9gim3zLGOwlK/cXOEdkBSvAGc1OaRHAeqmuQfRC3@vger.kernel.org
X-Gm-Message-State: AOJu0YyYJGFxbXzKG0dylvQX+GiKO4GRsh+PvdtezwQ1v+WFTTkVRUV5
	Aa8Hb31+Hx0i0LywNydRkokI5xx0/pVe4OMVk2fc3csCcfgsKpmL4Vr7
X-Gm-Gg: AfdE7cnE59ylvV+Q5gqpAINIKcvYvlPiBvfZDa2ukljkpfpjmEBJP3CTNjo9ZChP3wm
	efgNfBw0A6aGVuuLXoeSCPo3WJ+D5FubhFMXTxA8qWRmmGrZ8IrXTTetThhasN7U2H8kYrLma8C
	Kt+CsakOI+YG1kQBeVEXEt8Gr8J/3Ft0EaJPgrq5l1+hBWy+poBsR/dMFeE6yjJTd7y91vuaays
	yYo0C79vHv/pMh8yNryddAxLc52fVioK2QZeOn7Wa5G3lPM4T/T2HJpB5MP3BIwrj4Zu/f9WzxD
	w4Q8d1OfZ5DJezeG68/lYO9I4Me0pJAdhpa6TUGmdEaFEoqUo3vW1HxXVzGfKI6JZE5+Wopjllk
	mzzCVZU1C73+WcK7+u1I9/3CShDfN2DxWz86nIzl0eWszPR+v8Em9B6+qCX0F9L/BMgPtw+di91
	JzR7GGKUBGA74qjI5R+f+iw6o5TThOsqfP7mIPpXbzsORS3Ge7/A==
X-Received: by 2002:a05:690c:45c2:b0:80c:85b6:7650 with SMTP id 00721157ae682-8173abb42cemr6694927b3.69.1783108218436;
        Fri, 03 Jul 2026 12:50:18 -0700 (PDT)
Received: from suesslenovo ([24.176.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b049939sm27500667b3.32.2026.07.03.12.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:50:18 -0700 (PDT)
Date: Fri, 3 Jul 2026 15:50:17 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523
 compatible
Message-ID: <akgR7N1LmqEmPSLy@suesslenovo>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-2-utilityemal77@gmail.com>
 <20260703-versed-locust-of-agility-d76fda@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-versed-locust-of-agility-d76fda@quoll>

On Fri, Jul 03, 2026 at 12:56:00PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 05:47:47PM -0400, Justin Suess wrote:
> > The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
> > It is not backwards-compatible with the A31 programming model: the
> > control register has a pulse capture mode field (bits [7:6]) that
> > resets to a value which captures no pulses at all, and the sample
> > clock divider is now selectable via SPLCFG bits [1:0] instead of
> > being fixed at the old module clock / 64.
> > 
> > Since a kernel driving it as an A31 CIR receives nothing, add the
> > compatible as a standalone entry rather than under the
> > allwinner,sun6i-a31-ir fallback.
> > 
> > Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> > ---
> >  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > index 42dfe22ad5f1..06656058ce91 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - const: allwinner,sun4i-a10-ir
> >        - const: allwinner,sun5i-a13-ir
> >        - const: allwinner,sun6i-a31-ir
> > +      - const: allwinner,sun55i-a523-ir
> 
> I assume you are adding it in expected order that Allwinner is
> following, not just randomly at the end of any list.
>
I did it in product generation order, is that what is expected?
I know that the a523 series succeeded a31, so that's what I put for
ordering.
> Also, please change all above entries to one enum, can be the same
> commit.
> 
No problem, I'll do that for v2.  
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
>
