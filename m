Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41024303C8A
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778344321; cv=none; b=lRngefRGTZRUDXI4Tjj3xrHtRQvPqb08vkKH6QE8Ydt5vetA565li/EnEYvRHSBMhIgQdvz/TzqnIQ8uNKKn+evyOKVnCfzYXImHdnuqti9RxUXbxXQ6MIHgHkrf2fNH4+vTgzvDRiTHK8NIB50OQU+sYgL0o9HZpHGBYjUNM+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778344321; c=relaxed/simple;
	bh=3p9mtDOsu54yImqp7m6vW0J3J5aU5TjcgORAP053Lb0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nxgAk3m1DbTezVZC/qwZv1p/VzOsg7AjydVaVLTOvX72jfZAba/YE/3SpNJrcq0omJwc5W/8TC2kyRpcSqVNCVhUSmyCt49k/Ztpzz2nV3ePQVXYwbc26lesDbDdkekOkku3fwvRSjFncmbZ9JTBRox8p7paV3Tsf3WVWVfCev0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oZBqJbd3; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oZBqJbd3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778344307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T9e9XE+f9ua+OrU/UiZMbmSYCkJOv7xf3wcgmaZDo+M=;
	b=oZBqJbd3jzlkF0lmPhPsrPfddKHDZVAGxHfLS1ly9bnLcTJkX5wXfIDWNnTV82yFgqJnlF
	/6n7v++fiNPKojWxQrzvyj5IoXlcfl1HCHO3tBICpn/L55542Phct8+KeLk0LhtEN0m4vc
	R+MeUSRbMBYfZ2WlO267IdVUSEc5HeI=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Conor Dooley <conor@kernel.org>
Cc: sashiko@lists.linux.dev,  Arnd Bergmann <arnd@kernel.org>,
  conor+dt@kernel.org,  krzk+dt@kernel.org,  devicetree@vger.kernel.org,
  robh@kernel.org
Subject: Re: [PATCH 1/3] [v5 net-next] dt-bindings: net: add
 st,stlc4560/p54spi binding
In-Reply-To: <20260509-magnifier-varnish-b948ef563e79@spud> (Conor Dooley's
	message of "Sat, 9 May 2026 16:56:34 +0100")
References: <20260507212451.3333185-2-arnd@kernel.org>
	<20260508213255.60491C2BCB0@smtp.kernel.org>
	<20260509-magnifier-varnish-b948ef563e79@spud>
Date: Sat, 09 May 2026 09:31:24 -0700
Message-ID: <877bpcmtnn.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Conor Dooley <conor@kernel.org> writes:

> On Fri, May 08, 2026 at 09:32:54PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [Low] Typo in the binding description: 'STLC5460' is used instead of 'STLC4560'.
>> - [Low] The `interrupts-extended` and `powerdown-gpios` specifiers in the example lack standard secondary cells (flags/triggers).
>> --
>> 
>> commit b803e7cb976e6f9f5ea1b9d2c76cdffbb8fe0d67
>> Author: Arnd Bergmann <arnd@arndb.de>
>> 
>> dt-bindings: net: add st,stlc4560/p54spi binding
>> 
>> This commit adds a device tree binding for the SPI version of the Prism54
>> wireless device. It documents the known names of this device and the
>> properties sufficient for its use.
>> 
>> Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gmail.com/
>> 
>> > diff --git a/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
>> > new file mode 100644
>> > index 0000000000000..a32265c07350d
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
>> > @@ -0,0 +1,61 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/net/wireless/st,stlc4560.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: ST/Intersil/Conexant stlc45xx/p54spi/cx3110x SPI wireless device
>> > +
>> > +maintainers:
>> > +  - Christian Lamparter <chunkeey@gmail.com>
>> > +
>> > +description:
>> > +  The SPI variant of the Intersil Prism54 wireless device was sold
>> > +  under a variety of names, including Conexant CX3110x and
>> > +  ST Microelectronics STLC5460.
>> 
>> This isn't a bug, but there's a typo in the description (STLC5460 instead
>> of STLC4560).
>> 
>> [ ... ]
>> 
>> > +examples:
>> > +  - |
>> > +    spi {
>> > +        #address-cells = <1>;
>> > +        #size-cells = <0>;
>> > +
>> > +        wifi@0 {
>> > +            compatible = "st,stlc4560";
>> > +            reg = <0>;
>> > +            spi-max-frequency = <48000000>;
>> > +            interrupts-extended = <&gpio 23>;
>> > +            powerdown-gpios = <&gpio 1>;
>> 
>> Do these specifiers need standard secondary cells for flags and triggers?
>> 
>> Real-world GPIO controllers typically require #gpio-cells = <2> or
>> #interrupt-cells = <2> to specify trigger types and active levels. While
>> dt_binding_check accepts this since the phandle cell sizes are unknown,
>> copying this example into a real device tree will result in a compilation
>> error.
>
> Can we make this thing not whinge about stuff like this? It's an
> /example/ and these fields cannot be copy-pasted anyway.

If you have an idea how to convert it into a rule, I'm happy to merge it
into prompts. Something like "fields X and Y are not required for
example dt records". Sorry, it's really far from my area of expertise, so
I don't know what's right here and what's not.

Thanks!
