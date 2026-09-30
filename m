Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2152B3BBA08
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749159; cv=pass; b=Ak4DiuE1OoAXgJp3FCox4wR3kQjDjfOIezwBTL/VUKLOBqFdbXj/+yby4Saozfh4mJMpHlNMGWUymtsG5VAdsJngN9Cj6BUVeZzDZxwaKuW444A9ez2qfYSgDuZRpnAM5pxbNNP5MGwrma9Xp3a4uINxCuupDhV73VE6HWs4nDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749159; c=relaxed/simple;
	bh=zFoTYb73ldMKwmEbO428TD3BtZYTxTeL01meO4CkLck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocOd+nfKErCmbFYme26HlOHcam6Tr8EXTvOmxanZo5SVQ9+BRBmVIqf7caAPVOyg1Bf8N3WddjrYvEIfz+8cqoTILPAbYHai29OzvmEIqkLngW1SrqKz1n+3bvC2Ps2isH/0kgUP2Ef8uRcwTu1qHZu+VtL8Phqy/wH6K3ExLek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=DajaYGKa; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=vNWaZTSM; arc=pass smtp.client-ip=185.56.87.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="DajaYGKa";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="vNWaZTSM"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-fvjw.prod.antispam.mailspamprotection.com; s=arckey; t=1790749157;
	 b=PzFMfXhZW4R1+UwBs1EH7cSjT6o3isZ8FlFPuGIZHauEWh8dsQDK1oPjNHYkY8FHCsFxVovAAQ
	  SeuF5pfdNH4O4pZrWhcE48Jd97Ihi8C/zTH7REZo20NjDt5y3WMbuEB5xWt94ZZ5Db9ZR7wZek
	  a85JXvpcz/XffDaJtG/0L7lSmat6QZWYSsDugTh9Wk6BHoIKs7Okj4c6WLOuM/Y1/vH11Z76yA
	  MMwljhFFpPT2A40Z65hlA+K1FCx7DovWqT590rVxE+huSZwrjHzkf/bOyIOxI3ABBQWaakhntu
	  Ftq79K5zILFAh5l5fullWO5aP/IC68rVQsHkAbvR7KBqFA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-fvjw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-fvjw.prod.antispam.mailspamprotection.com; s=arckey; t=1790749157;
	bh=zFoTYb73ldMKwmEbO428TD3BtZYTxTeL01meO4CkLck=;
	h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	  Message-ID:Subject:Cc:To:From:Date:DKIM-Signature:DKIM-Signature;
	b=cnQaoZlmyzBb4QEiEmxSEvD1uua3IFDLybLMWSX5wWETwkSNiwR5pLTq89oFMCYvfm96bwz0RT
	  jdaSF7NlC2VjT6mGRWgyyGH7tEJSNRw0orGGLfEmQ5gyvLF3TE1iwB7k1Oq5wH3lp18uiqmuNp
	  qnZor1Vz28E5LMPSN1WNCmVQSLwVq2OrYVdyn5dP+nA5Zs4QTJKDGlQ6lZ/YrgM+gqjsEIz5R/
	  uouQUXb60kZRhPeIqS3jW93c5Ubbc/GLNfbpUPvYJjZkflt0AHooEdFHgULAZGQ4AQ0sQeIBaZ
	  UheW0IEKFWiC8qh/+QgzK2cOgFkvbwrpioH5hVJ2smNAtg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To
	:From:Date:Reply-To:List-Unsubscribe;
	bh=AbLTFjIhx+uI0756kXzx+0Wed7ebu42odZefl23u124=; b=DajaYGKaqsgB7sYVHwk6Ma2Q9X
	y3grzwqJWbGGs//qQ6Fphu7H+yU0kY+ys2QXbaCijgj/Zpk+bDOYklyxQVTeJ7hKJN3dBxdhoxbYa
	B0j5Ydcq+cWahZLMsf/dm4neeqFNGy0hTauVAnPZbiG/R3mRz7CR4dGveeCz+35m53MU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-fvjw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xBnes-00000000fv0-1FGv
	for devicetree@vger.kernel.org;
	Wed, 30 Sep 2026 06:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=AbLTFjIhx+uI0756kXzx+0Wed7ebu42odZefl23u124=; b=vNWaZTSMdKSjuGWs4B1nAJLk+v
	JgZgpuuMYwkOKAokZdtW4FbhvcKdbSfQAbmDZuPhMmsifXY+It3LX1H5Tlom/t/67KuTCjwJ5VbNj
	f7iaIxoAD//wZICuPL52kUW9hdtchJiO7XOsr74gbRyS39at1urOoT9laQIF81sUJWDo=;
Received: from [87.14.44.235] (port=64978 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xBneo-00000000PI1-2Ld3;
	Wed, 30 Sep 2026 06:19:10 +0000
Date: Wed, 30 Sep 2026 08:19:08 +0200
From: Francesco Valla <francesco@valla.it>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	Eugenio Perez <eperezma@redhat.com>, robh@kernel.org, conor+dt@kernel.org, 
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: add bindings for spi-virtio
Message-ID: <arypmHeudsJm4RIN@bywater>
References: <20260929-spi-virtio-bindings-v1-0-6a0eef3213b3@valla.it>
 <20260929-spi-virtio-bindings-v1-1-6a0eef3213b3@valla.it>
 <20260929165015.E5DDF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929165015.E5DDF1F000FF@smtp.kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 88c449a43b40d1505ba4a510627e5d06
X-AntiAbuse: ID - 88c449a43b40d1505ba4a510627e5d06
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xBnes-00000000fv0-1FGv-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-fvjw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Tue, Sep 29, 2026 at 04:50:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: spi-virtio: undocumented compatible in example
> --
> 
> commit eb6ae8a9a8b3aa403347f70589897a8c7d297186
> Author: Francesco Valla <francesco@valla.it>
> 
> dt-bindings: spi: add bindings for spi-virtio
> 
> This commit adds device tree bindings for spi-virtio based on virtio-device.
> It defines the properties and node dependencies for the virtio SPI controller.
> 
> > diff --git a/Documentation/devicetree/bindings/spi/spi-virtio.yaml b/Documentation/devicetree/bindings/spi/spi-virtio.yaml
> > new file mode 100644
> > index 0000000000000..5b8639dd2e1f1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spi/spi-virtio.yaml
> 
> [ ... ]
> 
> > +examples:
> > +  - |
> > +    virtio@3000 {
> > +        compatible = "virtio,mmio";
> > +        reg = <0x3000 0x100>;
> > +        interrupts = <41>;
> > +
> > +        spi {
> > +            compatible = "virtio,device2d";
> > +
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            sram@0 {
> > +                compatible = "microchip,mchp23k256";
> 
> [Severity: Low]
> Is this compatible string documented in any existing binding schema?
>

Yes - the compatible fot the Microchip MCHP23K256 is documented in:

  Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml

> The dt_binding_check tool strictly validates all compatible strings against
> known schemas, so an undocumented compatible string in an example will emit a
> schema validation warning.
> 
> When running make dt_binding_check on the new spi-virtio.yaml file, it
> parses the example and attempts to match microchip,mchp23k256 against
> registered bindings, which fails if none exist.
> 
> > +                reg = <0>;
> > +                spi-max-frequency = <20000000>;
> > +            };
> > +        };
> > +    };
> > +
> > +...
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260929-spi-virtio-bindings-v1-0-6a0eef3213b3@valla.it?part=1
