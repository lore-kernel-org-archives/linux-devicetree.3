Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74F37C10A
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782493547; cv=none; b=RGjpOYnBg5AHxVyZdj8DK3RG1VRdwdSA5KGOgLw6OvwsqVXugskEza01VB/GZHzdRGkqelAvttXww0oBuaY+qHkwLhYJPXs4c6wkIargazz8zwR6lpJZG2ZY0OmJrkJ+lY0iiMVmfsuilER97L+TtPrNA0KhtvxJFS6JVUUC6xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782493547; c=relaxed/simple;
	bh=XR8MOukhdb4119CLjtzkhC3PmY5hiwGnrBNevd09pJw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVlTPaAqLc5wsa4uvH7aI8/HbmHaqbWuErv9cUzAsEsWgWeJFCBjTsTWR3QPezbU2gKOFUz7vbma3Wd+RRVvCT2GOwvgsDwrx8tiz1bVXYWPcOHk6xr0EdKqovd1ZtS9yqFm+dMdIhsc/j9mY4ahqsjL8ZMryWu1fG540cD8oW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=McaFOsB3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="McaFOsB3"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so11841785e9.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 10:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782493544; x=1783098344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJMulB6FHoz3UwRU2js2Yx9wDg7dc99Kfk97uaLSZ70=;
        b=McaFOsB3pyEjPyeAdIflDv75XopeHatu+YSzKhNHhQtlOkGyx85Ij7KbmajKq2+mjR
         z/fU2cUtdulbHYDdK6qOP/lJKMcz6E1mu6PFfLU7lwLoqNdXaGx0oVyDv8cZ9l/SqBoO
         lreN028lCyzALA1YSHSBaXL/z/CjhHtYo4FFmi7ilIMXTh1TywTmcgvpQMq0D3UpDofX
         zhHA35JJoFLRl9NsUvbdc8LgmWQMVjEIZxHIOQeSRlQz02zZIpx3W/QFcVB36ugeO02v
         8QnJkBT/Hxmnx3UaG72Zm/hPPP+o/N3ObBvfih8S0m19LQoX64UkcURGJ/AdtmxOaPjd
         p5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782493544; x=1783098344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJMulB6FHoz3UwRU2js2Yx9wDg7dc99Kfk97uaLSZ70=;
        b=VBMNmaedT2M0zXKsCiUnV6ffdJqOP2qTzrGwfMpJHi9dzPC4hQNcjO3JWKW1qh1cyM
         dFYKlPtQV6XEFCl7iOX3u3zWQ3DkEdiB/Oy56AUZ03e1Z/ZgqWlBtP3dvSLPCcdne7sc
         7iuVaOrGrqUy5ic6Q1pPwDsqG2MK6d2uSOTlU4ef0pfL18XUe7de5H7GMpRiMx9SEVZu
         PYFotPeih0y0nn+BkekINiT3oEDP/uH4kG5Gk+dzS9VTpEs3tn+4pgUDmEXSU09p20IT
         ZB4eP0STFR+HrO7aRlF0D1Os6sNAjXmLVfzlj9lqrLlMnskX4NolYc+sDq2MirAaCpsL
         uoMg==
X-Forwarded-Encrypted: i=1; AFNElJ/Rx9j4GNEFH30huMNBdtkxHoJWuJtxum81Vc9BoMD7pxNW9IrkmKz6ksYLPK7/FjvXp5JC1R7a7CMC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Aeh0TqHrmXjfFI9IBPahI2P2UrXRgH52wjkWQqDKXSLIK/eE
	4cTEdCmumEtpL2Re+qHtNYLuEj840oGWuveR2s4sMZq5XCJv2W6VTiAUrYyatnB6HDA=
X-Gm-Gg: AfdE7cmbA3+Lqu+whEmFCSvlK6XSLW2EjUfTIsZGmE/DoPOBiiH80KMU3COrAgeYkB/
	9tvhG3vaQcnzyC5K6QKvdQvHYiGHHTmeNrNaFakay83t3O6lYd5s3XXuHztHKtSuXDGZBN97cG9
	DgepRvJeIGR7u385pSBm7VwPsjam0Fdj9vKK0sQZIaSA2ghiMIGbzCOzkzMN5oQesYpcQ0haqvC
	2xNYAbrQwV2IwTNW17YxgIVNtbjeBhj4ELczVHBxGzVpOoNyU93Tgc6+J9B+wRMahmoYjxgRmky
	eRgXzZF4sfO3I38C/Cjb9hE/mGFRxMbiuYAopsO9I4b4b5LiP8ymun+HdHhv/w2/qX+ZeOG1o4u
	dq7DMbTfXvPe5U0iBqP+dnxF+4hpkGTr1Eg4Ndsqp+C8V5bhxXvlzSx6MBzULS5LVqgxzynwJlW
	DQpDLHMmWV+g==
X-Received: by 2002:a05:600c:3549:b0:492:4363:e7eb with SMTP id 5b1f17b1804b1-492668acc8cmr114223385e9.32.1782493544245;
        Fri, 26 Jun 2026 10:05:44 -0700 (PDT)
Received: from localhost ([195.94.150.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269009163sm100940205e9.11.2026.06.26.10.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 10:05:43 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 26 Jun 2026 19:09:08 +0200
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>, mbrugger@suse.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM
 controller
Message-ID: <aj6yNJQZaQviXugB@apocalypse>
References: <cover.1780670224.git.andrea.porta@suse.com>
 <350c2fb454951fd2c9d959f1d94802fea8fa8152.1780670224.git.andrea.porta@suse.com>
 <5b167316-ed50-448c-aa05-6a041a6544d5@suse.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b167316-ed50-448c-aa05-6a041a6544d5@suse.de>

Hi Stan,

On 18:24 Fri 12 Jun     , Stanimir Varbanov wrote:
> 
> 
> On 6/12/26 5:01 PM, Andrea della Porta wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> > 
> > Add the devicetree binding documentation for the PWM
> > controller found in the Raspberry Pi RP1 chipset.
> > 
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> > new file mode 100644
> > index 0000000000000..6f8461d0454f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Raspberry Pi RP1 PWM controller
> > +
> > +maintainers:
> > +  - Naushir Patuck <naush@raspberrypi.com>
> 
> Could you add you or me as a maintainer as well. I'm not sure Naushir
> had agreed to maintain the bindings in mainline.
> 

Sure, will do.
Thanks,

Andrea

> ~Stan
