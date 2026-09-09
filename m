Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883B13AE185
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 06:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936666; cv=none; b=s+zBq+tKxwEKnaNDo+8XxbrjjDbERqLtj3bwSTXpkujIaROW2fxVq82jo2+KaoXrKEuvJURAMQ1SAmCFcscHbQLnIzK8a1wXy41Cx+wrgOd+Nsar5nVF6+cPxMKwVt7JNBI61vGvnACm7by6kuVKFRaHNy6SS5ZqHZVkd058MeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936666; c=relaxed/simple;
	bh=fcitUKDpF9kThgeapaT1KFefDBj1kbnOTZBG7H6CkT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ro0bxkdsnTmpJNPU+3hF8DuXBn+S5qqVu6buYkcC14fJ1WJ0BzW7Y41DOP1X61m+OY2VeLmUf+bej8Up88vJ4lq1BR716EjkK7mq2CUx0c8ApaS/vX4ug/T+yjL3VH88Xm3xgr7FqBOf4MBMssrVe6YG37sCqFyg9XdzDYoKQbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=j6Vl6JnS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="j6Vl6JnS"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a998436551so221081a12.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 23:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788936661; x=1789541461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EpsiGeLnMZIMyyW3N1yYpr4ElxKQISOJwtmVdkcRVSc=;
        b=j6Vl6JnSvKz8kYM6mNjpvPKRJ7u5qaD6PgtEgwJZlp1s9tuiBa6KZ8ZoD7nE1Wuxcd
         01WOOZ9UuPCZUt2R5n3jYeGIzV/Q4xsN56YtyvGpJaesUo/6I8D4EtXx5OKwz2aGLuk0
         Kjqi7tTz6n+c3UsMEwbggi8ckyaqyiJ8zG6WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936661; x=1789541461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpsiGeLnMZIMyyW3N1yYpr4ElxKQISOJwtmVdkcRVSc=;
        b=O1IKC1ljnp0QIXYBtXt6kxs9jk+vLcXLCRd0L26ROI+vhPkklu3JqmoypgJTWGhqtP
         Sq0e+C/O43eSqR/lULEIJyHY/zsuG37VYrv+Wi5cnTT+mwXKuMoCtVV5EbCC6SgSrfGW
         xG/5jUARygDIl67DeIN3iwMy8BtiQO85HQcUiHzx7MKa8gMphHen/vLLJFs9fcalmEC4
         eQvSTDbBfSCGDDK2ndKOb4/pIvdjhNSmIZzIkFEh2W54kZuqKcJlBFWrYVDOQEL7yKv6
         0awpzyB4aWEGw2Q59A+pahr7BuC1CWGHWsfs++LSf+xC8W1+b63Ri8Sw16VucTw5eGR/
         //hA==
X-Forwarded-Encrypted: i=1; AKwUvBzZVxmsAAFH5gJo+5QUgkeMNvzu/eiPEZs4vjPDMGJ/fpHqiBXjF48C5OxfIUTx9GCrNO+jIMCswzQB@vger.kernel.org
X-Gm-Message-State: AFuF++lUDfL+q8qvymyUGVPN5qGMvGgHGdDWKPw4SD9XUui5dKwhCjG5
	JZoC5GBh4DJOpvKobQO2X+NQhJ639jERQ+ITRmqktMmbMeitdyv0BQSF+8AIrnOOUOM=
X-Gm-Gg: AYBFou21xuZK72LRjidaw7UaYkwMjfda3FNCn4LZfTfHDNf8uoRdbVG202ZhqmmwQ+a
	Y90D50huT25GxgB75jZZBJtdq4AWt69GW1SEhhPfHby3V3K/IEM9iCtsp/mu701dNyhWy8BDt5o
	9+tKQ0TwnWuxz1vHWUPs813In/7bAOxWwx9Teu2IIYrmSnJTXplZfIOOVHiMbIE4VTzAsbffWfO
	5uKg0nDcW4R2leb5ib2pRwDgf9lBA4tVdRpS+b2eODSXoT5J/iS74VynJjXPxJs1werK78MMhn0
	hC9InNI3yNuljwJvqjT25+ePZesMptipgP+roICSKgvKR/3+IjdOTRIbCWHZ7THI5PYRuIz+gwW
	EIzmf4zaXvcAeQC3dcce1J/dmxWB/LDTRgmV1oeB5AkYf3n+xeZFKb4dAPSM9XXTFWFVeuxR2w7
	0A4+MvZX1oK8PU55H/miC7iQO7HPI9CWniPppK8zdUjXefFm3vhBciPFH9NbySv/SXwuYdOLezI
	Cx7Sg==
X-Received: by 2002:a17:906:c116:b0:c26:19de:9add with SMTP id a640c23a62f3a-c2619dea99emr1231458066b.28.1788936660938;
        Tue, 08 Sep 2026 23:51:00 -0700 (PDT)
Received: from carbon.k.g ([85.187.61.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5768c2sm701752366b.39.2026.09.08.23.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:51:00 -0700 (PDT)
Date: Wed, 9 Sep 2026 09:50:59 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v2 1/1] ARM: dts: draeger: Add socfpga devicetree for
 Draeger's M48 board.
Message-ID: <20260909065059.GB10420@carbon.k.g>
References: <20260908111011.960876-1-petko.manolov@konsulko.com>
 <20260908111011.960876-2-petko.manolov@konsulko.com>
 <3dbe92ee-805f-496d-9a7d-94c837e674b5@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dbe92ee-805f-496d-9a7d-94c837e674b5@kernel.org>

On 26-09-09 08:36:23, Krzysztof Kozlowski wrote:
> On 08/09/2026 13:10, Petko Manolov wrote:
> > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> 
> Please run scripts/checkpatch.pl on the patches and fix reported warnings.
> After that, run also 'scripts/checkpatch.pl --strict' on the patches and
> (probably) fix more warnings. Some warnings can be ignored, especially from
> --strict run, but the code here looks like it needs a fix. Feel free to get in
> touch if the warning is not clear.
> 
> 
> > ---
> >  .../devicetree/bindings/arm/altera.yaml       |   1 +
> >  arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
> >  .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 130 ++++++++++++++++++
> >  3 files changed, 132 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
> > index 3030cf46fe74..8ed1ba733510 100644
> > --- a/Documentation/devicetree/bindings/arm/altera.yaml
> > +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> 
> Same comments. Binding should not be part of other patches.

Does this mean i should submit the bindings related patches first?

> > @@ -47,6 +47,7 @@ properties:
> >            - enum:
> >                - altr,socfpga-cyclone5-socdk
> >                - denx,mcvevk
> > +              - draeger,M48
> >                - ebv,socrates
> >                - macnica,sodia
> >                - novtech,chameleon96
> > diff --git a/arch/arm/boot/dts/intel/socfpga/Makefile b/arch/arm/boot/dts/intel/socfpga/Makefile
> > index 8df0976da01c..cdcea11abdfa 100644
> > --- a/arch/arm/boot/dts/intel/socfpga/Makefile
> > +++ b/arch/arm/boot/dts/intel/socfpga/Makefile
> > @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
> >  	socfpga_arria10_mercury_aa1_st1_emmc.dtb \
> >  	socfpga_arria10_mercury_aa1_st1_qspi.dtb \
> >  	socfpga_arria10_mercury_aa1_st1_sdmmc.dtb \
> > +	socfpga_cyclone5_draeger_m48.dtb \
> >  	socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb \
> >  	socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb \
> >  	socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb \
> > diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> > new file mode 100644
> > index 000000000000..423c76cd1d4a
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> > @@ -0,0 +1,130 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
> > + */
> > +#include "socfpga_cyclone5.dtsi"
> > +
> > +/ {
> > +	model = "Draeger M48 Cyclone V SoC";
> > +	compatible = "draeger,M48", "altr,socfpga-cyclone5", "altr,socfpga";
> > +
> > +	chosen {
> > +		bootargs = "earlyprintk";
> 
> That's not a mainline suitable argument, drop.

These DTs are meant for u-boot only usage, but OK, will drop the bootargs.


		Petko
