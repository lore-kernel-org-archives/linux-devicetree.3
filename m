Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CC7341660
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480352; cv=none; b=Hd7DLdnljIADFnsY/8xzyJ0W2ccoC8JVRGb22yaVlmILnAypLzLHlqk/bVnavyl9wTdZw1R4xyZjw9+aqL2f00d638NoMqpjXZGi163j64LkoinFzcB4Fn1KwOsXQFnsUjRkgJ6nufkmTh7zFfNoNg/4IFgNG54QsPv0cNApvTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480352; c=relaxed/simple;
	bh=yEJiRz0ut4OqquzOoDrHCNnJmPbJdaHDKmPFO5dEKhU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4FIApjV7M5/WirrncFBRc+l85aZhSEyV7pgG6NHcChoNOhLanCBYzlpb4IcHD1V9Ot9SpQCyx0tLo4Jmi5AJCtVkABkeAi5s2JAZWxk//lddH9EnnhiZHigNyjrmfmbG8FPp3lUQNJBDShFmYzEhJxXPIEgAKThQ6V0RGwdnv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBTMoe8B; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBTMoe8B"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a07a051a81so1107606a12.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480347; x=1786085147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MIbPeVG4258G9HKd8kCy72K/NwqK4KgRygqC+exQgG8=;
        b=VBTMoe8Bpe/kfyG76gYWE7s7OqYe2JbfgKTQPQhPjWBXZkBPclmUY1V/abEp7eAHVl
         bsUx3XDYAs2iGg+gHysd8JEbRfZR+moaOFlJVq6H91IZ8ruUPLASRwDS10O6sRSiZ1I+
         bH0AzVYM5RAMmRo9pym0eZPA7ILKxGNPiImtITJp3xid2Cq+t+tFDTIPSEar2dXfiYyu
         gf09AerkK8iIknReQ4x6i7QMvleI7MWejTsbN1GDgOQm+gCgT8fmmW1b6s81oLVwC/3h
         UNCgJVVxxbi9UCfBosydqmD06dw4APx+prDuUCVcM85YStebWSzifMrtcCJsRigkI86R
         ta6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480347; x=1786085147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIbPeVG4258G9HKd8kCy72K/NwqK4KgRygqC+exQgG8=;
        b=repbF4AogzBSlzRhc3/GvHqeDZijavCrTOKxJoKEVowXYa+dNUCyE4p2P4t3WjsFHS
         iFX4K08HK/G06AJHX8xpmJ8QNcMEDDAU0gsVYO1Jydn1roev8tPdttbluVYHEzo/Re7O
         769B1T9Hs1/DZhGiIQdL6Zbdy+XDGz6yI11BZluBldY/JygxpuYeT0vOV4Ypij5sNmO1
         o5fGnYq6Z1cCHpOsc52Z0HVSLIJDsMCnM5+c3SMleYN2BCrUC6hscyQPtytcjfp8vEAJ
         7CWCTwB88AqOX9TL+YLIfrZ81tc2myOQJP6yL6PKBIQmmSfZ00bAccqEX66p/G3Csnyx
         aXZg==
X-Forwarded-Encrypted: i=1; AHgh+RrI4cPT4hKGrFS7r2XyxucezVgH87QiDsNpM6nYw71Ty8VKmgSvTaBntxLFArC62GlqT2WXn1K8aKz6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9MbrcoJveTI167M7D5c5uIRCdocDx6We6tR2w3dF1xJiPOsrH
	O+cDI6e+4P2iDAwP+3As0epMlhEz6QMMXZQ4xXT8yKAiPUI+JyK6BRyD
X-Gm-Gg: AR+sD11LtUhtLoVvvE2o9Ts3gssgrd83RjpnQK0R6QakRknlVKRLbyZm4VkEIrPMvAQ
	k7JoLpFRisBHq759mad5I92Dflo0bCLqiruxQEVCZN5Epd3b3NbYP/q+2uHxEO1zIyYgSsd0GS9
	YUD0HAx0dpztYs6rAgjbLLyo/0D+oh/Dgd3fb8h//G2lLVKYM4MSLGJyMRWjm7MJ2T2rlzTAEzP
	ryEeeuoggnTXyFV4gjulMOzzltC211L+lGugZz+3QGlrQCqopNHTEIVkZUIyWUiIahqvmIE4RCA
	CFlAEpk3XvfMsJEKsNlHbQ1bfythhr89xpBWdAYrwpeaLwTDQbsD/MLsRDAZtPVM7CxiZvLgCqF
	VP25+UmI8X8x4pTdcrKoz9bh73Tnqyz6l4pxG3KxIMZ63avJTA7TmJkWMoVk2U9KYihDoqBp2bc
	lXZEJrzgZE8p5cjVdqAQyg/SY4YdI8JgR+e+y/TtBD9pdgaWEVmAIjv/3kPh+BodkXY2syz/Unp
	EuBXJ7ZvFidTnOzIr3an1JsJkyFi/KmxFt7NIv/rjL82GEU
X-Received: by 2002:a17:907:ea8c:b0:c1c:3b06:ed1b with SMTP id a640c23a62f3a-c1fd23f9c06mr42429466b.22.1785480346401;
        Thu, 30 Jul 2026 23:45:46 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5b0fasm33332166b.5.2026.07.30.23.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:45:45 -0700 (PDT)
Message-ID: <6a6c4499.797cc74e.266cba.6533@mx.google.com>
X-Google-Original-Message-ID: <amxElLesKZE9DX3u@Ansuel-XPS.>
Date: Fri, 31 Jul 2026 08:45:40 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound
 card.
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
 <20260528174840.28644-2-ansuelsmth@gmail.com>
 <20260531-spicy-sassy-woodlouse-b2674e@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-spicy-sassy-woodlouse-b2674e@quoll>

On Sun, May 31, 2026 at 02:39:32PM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 28, 2026 at 07:48:29PM +0200, Christian Marangi wrote:
> > Add YAML schema for Airoha AN7581 AFE SoC sound card.
> >
> 
> Nit: subject, drop final stop.
> 
> 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> > new file mode 100644
> > index 000000000000..80d9e87f1470
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AFE PCM controller for AN7581
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-afe
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> 
> This looks incomplete - missing at least clocks. Are you sure that AFE
> here is so limited, comparing to other Mediatek designs?
>

Sorry for the late reply, I checked documentation and the SoC doesn't have
a clock for AFE, Airoha reported that it's always enable from reset
condition. The clock driver doesn't expose it.
 
> 

-- 
	Ansuel
