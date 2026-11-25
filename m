Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639241;
	b=SqF2X+sO/I/E78LKeyLzrbjP9IxiEYe0Zfsd86l2yFTOhDjNwx6xomc+BB+lqXJ8W+uv
	 5enrvVDovYe9VV8ARhdK8BewCgFezRwpaD1g12hXhqNw+5g64GlqHmZXNqaSvXkiFAC+4
	 z1Z6tdy0ouBW7LlQGqJuuDo5cDy0jbLucCS7J9JLM7w4C68iYPw6Ipbr7RbYB6I5tOqcJ
	 mklBsj6Y3WQ+nAJ3047xKHtaivlqNmkQqg/+dX5XJzH/32Y5vOeNfYV/SppEurG26sC/Z
	 fqze6N1FUi/i6MMD6KHG7UUq+qQyOV6Yrv56hL8N96Q5dG4kWeJHHXC9gPpxm+54BmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8hi1KZiya0UHcnzPSX4a+krak37ozdn0IOzf8OkNJyc=;
	b=bRhGmenIXH7jtzWtKns8Iv/4fZ6Zj6MzfkXm5/llZgSrwM6RU8LSPhBDWqhj0qv8M6zB
	 ll3Gn1Dx4A95YcztNdEb3w5i2Q9yk+SE+dc7Tf5y6zk40jcqnIdXLpCZ5qPrggrZc7EN8
	 NvBbTFdmCXsuo9ILx22OKAiTIaXHAuprWZabjVqYziUmv23VJcGmGMosaY8GMMLgAIdqV
	 c/evdR/56DS8+Wg/HgV8e9M8rTrar+iJjVSXNvbb7pKFYMrB9rKP26952VZKf0enhDaXO
	 BDbt8mA+GrInFUS3s6bqtFMMB7H7BUCVBXoGg+VXG9Ely2GM1KflqLFHbWUiLkDqeWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0+vtZSB;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BE4606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0BE4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0+vtZSB
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843cf077f10so8456916a34.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795639240; x=1796244040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8hi1KZiya0UHcnzPSX4a+krak37ozdn0IOzf8OkNJyc=;
        b=m0+vtZSBjkmO0Cp6HPWsPVZ8DgZ/OdBhe5BQ+CSFmY04VIIJg8ehOpC9/tlhXKXE2u
         odQgnaktQjToeATIGYZ7iHTf/3GJi9AAAUSb2KzAr0g+t6x2bxMh/ckd1o7iz6RvF9A0
         ZLU3BkLdxpavvHb1SII1ZG8vKQ8XhNncxZRp0mClBM5iBu1DfK9OKMm2A95hc5y3eBk2
         hvkuhs5lGWD2zaW3ZPpsbJ+oGPWNCaCvzKatP09TMYh05GYTPVlYYjTRoqWpBu77JTv+
         1GmzGYVSWRoNajubCm3B/YI7qxthIXKxh1zGans0TmSyKGDQ+/1c63VhdIdwy4MzSMfJ
         odeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639240; x=1796244040;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hi1KZiya0UHcnzPSX4a+krak37ozdn0IOzf8OkNJyc=;
        b=K04Cl67xOeM4kZFcvmitKGOKqFuW0K2vLbkOf7mvdmDd8tbYyI4mPZ0eRpQp9VWA4/
         lbFl7mdDfxGliK09uR/GvBU+V7Z31irRaTiVj1QP1FIHmMPl4WIKh6ckPTayk3etAi0E
         dKK9CA9XgNRjRuOUBTfbkx0ah5x2W6mX5TnIU1U5lQy16VEgin+XH4W8S17hwPZ85ZVn
         NfQRUHawN2e19Kx/z9MDTjYy1fihHPmOvIWX5o1yCb/bS9EaDTCXEYwGMfwEipUeTSaI
         wTwK2RedWp/yPu1mMqjhsX7aLcsoQKfXEOODGx4uNLDw1TEdxjes15Z/E3kLHToULfLR
         JlLA==
X-Forwarded-Encrypted: i=1; AL+hErGvDbYbwJWPbi9Qh9uM7rO7RfomcPHXDGvkGaTK0UUk3cdcRsHAvL8zR4ipcZDTEIKy+kn8I9IXmBlk@vger.kernel.org
X-Gm-Message-State: APuU4Z+6cCeflTO4eqluA3mmbxY9SuVSkXGSVEoamBXs53GZJhDNGIYF
	Ery+BCaddK9P0qAPNde/t6Rp1vZdCli7dX7Gy8OAhPr2tODplfRh6+L7
X-Gm-Gg: AZFdTZcpHKdeuhirowTGADi33cC8nc2XigM2cDAJ7YDSEFaEXMG2htfL7R4/V4fmRzj
	v1xv3oeucGRTSNXd15I1KcQvc8/jaqChPgoY99dBfEmFUM0UEYYgKpd5fwV2mrBjfCzqx+/SNiB
	n9nRC5g3nsDNQeoVZXJ4/FW4pBa503G/8KCxEqYy7UA7ziYg7B1jJ5SSJxcjBiq+3FBLiw7kof1
	I4a4G/lz/iFFoezXMaynTdVq44wCnd0gz/p9kShfs61dAuwrzNRBZi4I7EHCk2zEXm9ey5XuyDU
	Ae7Z0pXE2VDgJsH1Rre4Ov6Yji11Rr01oLhW6qBdpCVn5Z3fTbxG3GV873tTAOHGPbMwjuxXm0b
	PVsMc2KbXAOtDJDXPoECQfaskvVGbRgaj7VZAzntIxKcS93Ze7CGp5ZkHBtacJyfNCb2Pb4IAcq
	BAR0NIshwzNPUgyCW8kZIbYeqamj8Vcq+Buz6NHOFWZhDgDyqbw67Ah1lki09eECoFdwecIuF98
	lAxS10W6ubkK53ALe157hh16INjPv/I9XOPn73lRaKoeKL71Jy2HpNSpakDZfYVtO6Wc48Yamyn
	KiMX9Mcx7JJakfoMPd+v1xM51V39dfTjgi31BGxtAolfiw==
X-Received: by 2002:a05:6830:4411:b0:862:bc33:da9d with SMTP id 46e09a7af769-86315939b41mr19156987a34.23.1795639239726;
        Wed, 25 Nov 2026 12:40:39 -0800 (PST)
Received: from neuromancer.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6d8sm13477219a34.10.2026.11.25.12.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:40:39 -0800 (PST)
Date: Wed, 25 Nov 2026 14:40:36 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com, linux-pm@vger.kernel.org, heiko@sntech.de,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	sre@kernel.org, t.schramm@manjaro.org, xsf@rock-chips.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V4 1/3] dt-bindings: power: cw2015: add cw2215, cw2217,
 and cw2218
Message-ID: <awdHxIQ7AMNUtiq_@neuromancer.localdomain>
References: <20261124191346.434143-1-macroalpha82@gmail.com>
 <20261124191346.434143-2-macroalpha82@gmail.com>
 <179560806608.84329.5895350466243051992.b4-reply@b4>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179560806608.84329.5895350466243051992.b4-reply@b4>

On Wed, Nov 25, 2026 at 01:01:06PM +0100, Krzysztof Kozlowski wrote:
> On 2026-11-24 13:13 -0600, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add bindings for the Cellwise cw2215/cw2217/cw2218 i2C interface
> > battery gauge. It is similar in function to the existing cw2015 but
> > with a different register layout. Each of the cw2215, cw2217 and cw2218
> > only really differ in the minor specs and the hardware ID they display
> > when queried. shunt-resistor-micro-ohms is a property in use for
> > multiple devices so not appending a vendor prefix to it.
> > 
> > Move the minItems and maxItems for the battery profile to a conditional
> > based on the compatible string, as the new monitors require 80 bytes of
> > firmware instead of 64 bytes.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../bindings/power/supply/cw2015_battery.yaml | 41 ++++++++++++++++---
> >  1 file changed, 35 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
> > index f7bde324153d..992cd5f6a216 100644
> > --- a/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
> > +++ b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
> > @@ -14,12 +14,13 @@ description: |
> >    phandle in monitored-battery. If specified the driver uses the
> >    charge-full-design-microamp-hours property of the battery.
> >  
> > -allOf:
> > -  - $ref: power-supply.yaml#
> > -
> >  properties:
> >    compatible:
> > -    const: cellwise,cw2015
> > +    enum:
> > +      - cellwise,cw2015
> > +      - cellwise,cw2215
> > +      - cellwise,cw2217
> > +      - cellwise,cw2218
> >  
> >    reg:
> >      maxItems: 1
> > @@ -31,8 +32,6 @@ properties:
> >        it is to mail two batteries to a test facility of CellWise and receive
> >        back a test report with the binary blob.
> >      $ref: /schemas/types.yaml#/definitions/uint8-array
> > -    minItems: 64
> > -    maxItems: 64
> 
> Nothing improved. Broadest constraints always stay here (explained also
> in writing bindings).
> 
> Best regards,
> Krzysztof
> 
> -- 
> Krzysztof Kozlowski <krzk@kernel.org>

I think I get it, sorry for being thick. So this would have 64 as the
minimum and 80 as the maximum, then further down for the cw2015 we'd
have 64 as both the min and max, and for the others we'd have 80 as the
min and max.

Thank you,
Chris

> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
