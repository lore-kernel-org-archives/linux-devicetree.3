Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F8306765
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220683; cv=none; b=A+XVdxZKuKqNfidZ2oAcsa8PxZSKzs7Kpo3jG1X/6nKhgvc5rCfO1dxyvWtyMRpkVdiBZ5TFweoVgKN6AtwFRx+BrpHksvNIx/IjMxoE+sv/+ql8zi3vzqUnOK5824ZmpyoaWz/urYPRumlwY1DLjCgz/yiqbIJOYTJpLW1pVlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220683; c=relaxed/simple;
	bh=QWksKsu3aFjbz0U7IDFysKky5YyDvWjjH+s0LaexQxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkUIuDynVazSk/GySspPzPts39vg9FoW1OVYXbgiWu3SsHbwfLQq5+pFijWFKNkwOVC4RFUPj6/F4lIZJ7dBQNDYQdonJReARTpAwTmS5OT5U6WNdWSL8oZBJ9f5t1iaLAZquQo5LGaciUmkIZz0G6SzLLiyql5o4VsRQNSvpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=LRUJmFDC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="LRUJmFDC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4908b92904fso80157035e9.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1782220681; x=1782825481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQjsOKmDv4bAeAAg8kHxPjywYyxr88XeXI1w7+vf02M=;
        b=LRUJmFDCPthifYRMfZhYIydgCNTbxhaAg+fwOLgzNj8ZVf8RkBIVX6dwaigUKzLs++
         1QbcBRqkV6/V5rIROWULa/4il6+DXssu0ODMgHHxZMNf9qSxLPLDLdR0HqRcRyHijn5r
         HjbhBzlT7dxKEPFLAqxzPbrYk/9EFXZ9fmY4XAf4Jq4rBMV8TZxZkYhfvWc7i4tPFGqB
         E51EArs9o1X93L7IHgMYpK0iV3UJ7ynnwbt7fLycxsZAIXHHA3CP5rZijioxBkz39JGX
         xgeKE+PjZ6dNBp1W4rcM/smOx5In9Y8SlpocKbsM+D8vXUrZH9aYxKitHWQcCfhHvJ8b
         I+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220681; x=1782825481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQjsOKmDv4bAeAAg8kHxPjywYyxr88XeXI1w7+vf02M=;
        b=OF6TjMEaC/gKSPk5cuStHm8T3/bIXiN6w6WQAb+GzvzJ1CFTe7vyJyOcf+DQX9QLQ1
         6WTV6sSkKMLG0Djo76xb+6UH7W8Qt09vDNwLZ+jPSbN6mJmMXZkVlsaPICiW7imABjtS
         vuE4UBsxRmYADTK8GFYyWN7FEAVMEe06cTm4Coqmgw+jnM+gd5ZitTMCQVrrQCx8ht/t
         QTHWRLyWN+CblT5CqprdUQY3sqbvbfCTaUSx4/uaZCMkMl9q/gWistoNm5/D/6EQZ0uT
         /DKYibRfMdumX0GtK7e0r1ijqcdiCwKxtTrEVxMLMlzq1QGWT5pzJ3zNEwkjL1lXoSrr
         RUaA==
X-Forwarded-Encrypted: i=1; AFNElJ/3c+NelGARhlVQJ5JWA+338WqfnFnuleNHBySmNvDASON98SDw4Er+4Bk/ijy8pLKCUJGTqbhtqZ74@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXkDQsFBjfZCgleQihoQ1D2k45z2er2TCP3ECOyVd4F9Ar7/l
	qxeqhD/b49HexV5FtHv0m+NdnjGuvTS6lmvxaC3JzFIDyygH8Im1fN0NKV3gHBSqOuM=
X-Gm-Gg: AfdE7cnRqrlfuYDWcEdNL0mXX6sWddSg9lRUpwQLCOxkxd8ui+Eq3b/WMAjjfh/Jpec
	nasi5bRf6vO8iEY70PSnpwzVE6HUfu+fZNaANh0KlQapIsJ0Z5xeR1KkZoVGNlIWI9yHzvrRetS
	fd3n8tyovTzqw+fvOpo675VzEUWD5FQTly2GDQDx0pj89oR2ZjyKApFoTyVuiQhL+oOYflhnkhp
	cQrt1LpvyEBc1Ywj1bwoG5o8dbFHALg5Gee70jfMKrZ/lNilJEDkYoUCJ1rSDEpKwhcfJIlEjBR
	RDohRpVcuDPBuKUyeRUDc1Z/s+F7ClmnnWMNlYKgtweZVXf5tn/BS/f42tJ3synejuw5E+oQrZs
	3tFPilELELNLpsHI3yWC3LvvxFhcCrMiapaDOunWoUb/H/uqYNCki37WHVfLtvdlQRlQ1CwN+Yd
	bKj1LAfVJXhEsL5hMkskorvwZWqO7nYdbzyaEiOd66t60Tp/krffUxx3EjUvmHTu7wSYLrTon7N
	pfAiyzgxKrEYHB8LAb8vEhUEnfzYIfJFt8Ia3hZxcdcav36N5J/YfMeDjw9REqWKJTAbbB7tA==
X-Received: by 2002:a05:600c:1548:b0:492:39b6:5a30 with SMTP id 5b1f17b1804b1-4925b38f01bmr37906055e9.35.1782220676494;
        Tue, 23 Jun 2026 06:17:56 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5de7sm35009927f8f.15.2026.06.23.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:17:55 -0700 (PDT)
Date: Tue, 23 Jun 2026 14:17:54 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"danielt@kernel.org" <danielt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] backlight: lp8864: Convert from LED to backlight
 class driver
Message-ID: <ajqHgqKsh4CpMm1I@aspen.lan>
References: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
 <20260615120353.3409035-4-alexander.sverdlin@siemens.com>
 <0b39450b-559b-43d4-a1e9-bb6684691cb5@ti.com>
 <acb13aca040ab72b9e53abee3a5c8733ebc5b8dd.camel@siemens.com>
 <ajpw1w150SXm8Gbi@aspen.lan>
 <aa34231591d2e5f848bdd74524abb4fe85123444.camel@siemens.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa34231591d2e5f848bdd74524abb4fe85123444.camel@siemens.com>

On Tue, Jun 23, 2026 at 11:59:16AM +0000, Sverdlin, Alexander wrote:
> Hi Daniel,
> 
> On Tue, 2026-06-23 at 12:41 +0100, Daniel Thompson wrote:
> > > The mechanism we have regarding hot plugging currently is just I2C bridge,
> > > which de-registers and registers the bridged bus. So no additional drivers
> > > are required, as long as I2C devices are self-contained and not glued with
> > > platform devices.
> > > 
> > > So bottom line is, I'd prefer to just add the backlight interface to the
> > > existing driver, no matter where it would live in the future.
> > 
> > Is there any reasion that LP8864/LP8866 is unique in appearing on a 
> > hotplugged I2C bus? In other words if support for dynamism is added
> > specifically to leds-lp8864.c rather than in led_bl.c then what will stop
> > the same dynamic tricks from being adde to other LED drivers?
> 
> LP8864 is not special in this regard, not different from adp8860_bl.c,
> adp8870_bl.c or lm3639_bl.c, which would work in my application.

The most recent of these drivers adopted LED support in 2012 whilst
led_bl.c was introduced in 2020.


> So I just wanted to add currently missing backlight_device_register() to
> LP8864, but there were no such dual-API drivers under drivers/leds/ that's
> wht I started with moving LP8864 driver into drivers/video/backlight/.
> 
> led_bl.c however could only be hot-pluggable either if one actively
> creates/destroys platform device somewhere in the code programmatically
> or uses DT overlays.
> 
> Just adding backlight API to LP8864 would be much more idiomatic, I'd
> say.

Maybe.

I think I might consider the drivers above to be historical anomalies
rather than idiomatic examples.


Daniel.


