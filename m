Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1884ED1AB
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054748; cv=none; b=PqQ/mrZaPtJLXmF6LVqCXjzPTXKtfn8z5qYdmlfybj7/N1kTB+uCzQ0FMUt3JukATsKmQYq208wKjq6LaOCyexbFjGUM6gfPf22CBF/KCev30dQCKppIReNMzYPsly0Nw9mYpjnaFe2h8B5TnciBn6LDxmZT9Zx70A9cmj/b3pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054748; c=relaxed/simple;
	bh=mibTasoYLPRkTtHblHAGE9NyG/cWGdvc4fiuNRggKPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0knOsLyKHBbxU5xUS/y4NyTIaJUqcMuuq01dwq32fOSzLi75834R1P0FdQTlTkzfrsylH0sBDxf445WgrIJg0UZPcWgm+U5SSMg3I3GMecutdA4+6ERuDYvUCS7JzEm4fruWzeGgcODcz4r/O6oXBHcEnCYIerZ6WumhHZeHoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL63G2Ne; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL63G2Ne"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e7e742a2c7so34263635ad.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054745; x=1792659545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iY/Ca6upnPsDr/ZtUeBJxSM1jnY+ETFKViUNpFJNrus=;
        b=fL63G2NeX5FDsy8QFY2K+7ygXxneotsfEgCL6Yf6C2kLlTzRttEbYeIMm4lBh4hLx3
         GYaiGhXHE/4nbXXnClwzXtclTztWSq+wCzQT03F5CUrXj614Sain3CjZszuGWB+K0Whi
         +BxOU26ylNHRyYrwgOTquJSbz/8C0cAC5yB0LjP4uTbY5CVgIhdOnxDCWu/6Vf1pPluj
         +f4lQsKCALpBNcSkshdVOBUeX1/VopvxgUjYkxmgJOxzYMPbWnz8cVCFbjr9xOXfeqIz
         aQPhQKAa1/kRpbnEuXt0kZ/+wyX1W0/8koz1ibM3tuhI3GHkrKYVXjwu6S+aYTSfV2iK
         WdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054745; x=1792659545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iY/Ca6upnPsDr/ZtUeBJxSM1jnY+ETFKViUNpFJNrus=;
        b=yVzqqdjjY2AeEJPex6SAUzv8F17b01MfYNP5YMfEX+XGAQ1pMB6tOt/Ph7QNArva9S
         GS8lzvuZACXTtc9VtQ67dCFzz/B9wsBegJhfACkF+aXEwdbbJxu3brGV0SnPdutxlGUg
         OXnbZPWhCNWugXkyXsKEl39BYQoK6EjR0HOWhbq8Kr2YcttbI5btciqL4QSlSJa2ZvGT
         LBrUNjGV9bGuINiainRj64Vn3IpVrknWHa3BHdFnl076pWn5GkqyUB9t9VGtZA9k0No+
         U3QAdwnIzwQj+4+x7xQWZ6La8g/jMNgWZRmi2IyfA3YcXg2SNczHr6zEq+Aug7MUSgR3
         52ng==
X-Forwarded-Encrypted: i=1; AKwUvByl1NyV8WJTiNMnakL5xW30dc8qY6hE2Wo3xx7f/OMNpo55Bs7RshtvKZCiz3Gl4tdUO+Lsnba3UIXO@vger.kernel.org
X-Gm-Message-State: AFq9FYLJnY+WFapuXbFID3i/2JhtGxi+8yjx7H0fRCq1oMC9gJ3JgdPp
	NT+h6pIxsc6jceBaDKXKOj2PCO8pS5rX5u0QmMjgGh2Cel3oRZWFWOIh
X-Gm-Gg: AYBFou0HyrSDtDg+rYG/tGRK59KsrAEZJMKTYFugU6OA3mfr6Q7yy45ufo3tvsTfr5y
	PJ9yTV0rQq4FXtsdNaqlUGTtgxUjEn2SxZ2dNrQbwrm+zO2CSkWwWeD11pX7QRrP9X5lgJUOL/t
	aXWChpi8o4CeXdYKO4qPl/lvRzsnkfdK8PXH0Nwfc39YfqOks3lbERs34z7oNAOmOAWYJFqe3Xr
	FYf0kpS4Kcys8YhKHZ6TbLKQgxWOithsGhO//ecBFSwtQBPkNqm442FytR9NHFOK4IJYAsUIGTN
	9jPFwkapd+1PoAz7rCCUdigWbQ4UkfOobBdoXkp0DEhkz7KdcNqcLVe6jCvhthmr/JAM8eqcmim
	bEa+/eXj/0UGtEtpVArrjyWxYoHCcvgTUqz3JuJhQFuk2dT9swflZXNeUSv2JzDp7Icy3oQgHm1
	LkAkry9eZn9JlXxkCHk5UT/DUOktUUXbNZ5C/MG8WRsiM16tDoYN8zaxw0R0WJJm0y6sDs4Q==
X-Received: by 2002:a17:902:f70c:b0:2df:aae1:4905 with SMTP id d9443c01a7336-2e842cf990amr110281435ad.26.1792054744748;
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e94ba30f6asm13269885ad.57.2026.10.15.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:58:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Message-ID: <atCVYXd5cIkcB0oS@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-2-inochiama@gmail.com>
 <20261014-humorous-cryptic-llama-cf6a6c@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-humorous-cryptic-llama-cf6a6c@quoll>

On Wed, Oct 14, 2026 at 01:43:29PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 03:45:13PM +0800, Inochi Amaoto wrote:
> > Sophgo SG2044 uses eFuses used to store factory-programmed data
> > such as ROM patch, public keys and other factory information.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/nvmem/sophgo,efuse.yaml          | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> 
> Filename should match compatible.
> 

Thanks, I will fix it.

> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> > new file mode 100644
> > index 000000000000..d4bffe2724ac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo SoC eFuse-based NVMEM
> > +
> > +description:
> > +  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
> > +  public key and other factory information.
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +allOf:
> > +  - $ref: nvmem.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sophgo,sg2044-efuse
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> 
> Why is this flexible?
> 
> Best regards,
> Krzysztof
> 

This is a mistake I missed. It should be the only clock, so maxItem is
needed.

Regards,
Inochi
