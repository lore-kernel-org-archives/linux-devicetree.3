Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217FE37DE85
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890077; cv=none; b=DdSRL5t6382aHCpU0X2/W03oSZx3kyzKnqP29zcbvxwwAp7NHL5VHcu/ihPWgKLEULcAPvyGQ9ReHWW+v5u90y9uItqJT98bcGEORVm0pd8+6iY8zv2kkz7NN16TS01K/QL8SdDliV4s/83xz7brVMXQh7AG2hzOfnhuDEvmLhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890077; c=relaxed/simple;
	bh=Qpc9cSZIQ6XgIpUBdj/WRMIntrqVQ+95EOrd1XUDUos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjYMlgVYLrrBTM9MDQ1ZETBfw8UT7Hej0GWTScmEvc6lAfmjF123CXcvUsRVAsy9wbENFfhrZO4xLiZolzlPShzul7hMLAAsZ3UXRscgq5Gz0r/flnAkuKqBCXRqNcLRLX7nKs/Cr8LhQUFlF8CiJPn8ZWI26UH5W9+uf6PoavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/lKxzyn; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/lKxzyn"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824c9da9928so1662933b3a.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777890075; x=1778494875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AzJI2062NMt5980YtQqfww16vShKlaQt7llmD/pl5fY=;
        b=n/lKxzynrqsju4/uRu0/UE3O9BTL8Qc86vBW8RZ1wVpISguA59QqBikod0VX//Pc5N
         aGYLIHrRqMcUDMgmAB+3KF4OIYFeHMQhg2sRaTa+VzwwORJdBpaqpCDJantZV6QFXR/2
         a00Pri31c71xTjpvapCilLzfB6LiF+HerS2Extfebw4YdOD8mPljr/mdtOdRRXrbHUUX
         3YgZAxr201a4KT9JWQPtAB1iK5rVf85+1lqykNkQVg/huXYexOoi/+Qu527A4Y2mFsDQ
         hfZNPQKVkNZeoBk2hGSsHYL65Q+tasIsoDj/Xy3ILNfrdUwmsnAgUog/T7ozYXS5e81h
         SH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777890075; x=1778494875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzJI2062NMt5980YtQqfww16vShKlaQt7llmD/pl5fY=;
        b=rmillC4IOAEXONQexwTD4eEoX0JEx7o0hJaMIqRY8tvg35JgQ3QUDvDMUC0INg2YyA
         sUX6yyk77gGeaDm6+w+P4v/Oy2yC5cfv1VaDUBsvqR+8EUM30yl2aSCAf14KRqlDQ02i
         BpXVf7GgiHZpCGyx/QacTi8AHHLp31YKAQDvTxoGhSyBlW46zT77UCz2GiKKNirIErYO
         k0wAuHmAUVY0jYzDcEdeLH3Nojq+xY6A5qnVab45SJz1nwsgyDT/o+BsNFmkzYa6gRLf
         +STqpuXwQKmqwcpIGvVM5vLDpcQVImXHfJ8AZLpzmPI7qV2R6BkkW8DIbNxZWZCduwbz
         1Wmw==
X-Forwarded-Encrypted: i=1; AFNElJ/+V5rrZ/4eGSef0O9TlnnzY6rgUDMBvY3ADQsfRXoTyxl8N8LsfsVw4WV+uo/a5WlHLvLxYnoFs8BZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6sJCuyMnrgsGkGmMGhdgBpBabmfWO17pAwDe3KptOsNnR6euW
	NTrpMF8mAWtfX0yjn+XD5MxiozCrS/TueMoRcjQHstrYzjsycJbtwnDK
X-Gm-Gg: AeBDievMReO8DqH2vFi741oX9XyCz1KFo7yxfVqpjlAuouLDRHoKVKUwoy1M/rfEi6V
	KaFijqxd6w8eMfq4KrAic8ZSR8ck2raBpnJnQnnsRVCgisWit3Fs0mjTBwLzFmAM7+lPcofiP4Q
	izoBwEvAF7563b7ow6vqQtu9liyA+XJIWz0zOCf9I1ZPciZzkrsKdj1MelcKE7SM6NDSBzVCeos
	LhGyob8O13qc95dR0AHQuvTOM1xnnMFy15Y9ToxBYLb8/BgyfjeIY9SP3Zgy8IJtE7j895DLEJU
	Ezv/kG0YRnLL2oEhMdlkxjEfEfHC8raenoW1GLrOioPlTahpioiXMVltliu4DuNeXDr5yGcUsWm
	9iFKXnEDsXCO0RnO7pf93s/Jm3LyzJFW5pIxIWqK8T4imjASGKSnM7KciyyuOU1xA3HCVM+rD67
	yoG3Jkyn/xnY8mK37TYFvyXBwx4Viy9EmvPTOhZKt2Qwzv
X-Received: by 2002:a05:6a00:340f:b0:835:4291:6975 with SMTP id d2e1a72fcca58-835429173d9mr5262314b3a.39.1777890075240;
        Mon, 04 May 2026 03:21:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm4335636b3a.9.2026.05.04.03.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:21:14 -0700 (PDT)
Date: Mon, 4 May 2026 18:20:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ze Huang <huang.ze@linux.dev>, 
	Alex Elder <elder@riscstar.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy
 support
Message-ID: <afhx6C2EvDbMJc92@inochi.infowork>
References: <20260430022843.1090138-1-inochiama@gmail.com>
 <20260430022843.1090138-2-inochiama@gmail.com>
 <20260504-logical-nice-python-1e1f43@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-logical-nice-python-1e1f43@quoll>

On Mon, May 04, 2026 at 11:54:11AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Apr 30, 2026 at 10:28:40AM +0800, Inochi Amaoto wrote:
> > +properties:
> > +  compatible:
> > +    const: spacemit,k3-comb-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#phy-cells":
> > +    const: 2
> > +    description:
> > +      The first one is phy id, the second one is phy type.
> 
> You could mention here the defines representing supported phy types.
> 

OK.

> > +
> > +  spacemit,apb-spare:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to APB SPARE system controller interface, used for
> > +      PHY calibration.
> > +
> > +  spacemit,apmu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle of APMU syscon
> > +          - description: configuration of the PHY lanes
> > +    description: |
> > +      Phandle to control PHY mux configuration. The configuration
> > +      is described as follows:
> > +      bit 4: 0 - PCIe A x8 mode, 1 - PCIe lane share mode
> > +      bit 3: 0 - PCIe A x4 mode, 1 - PCIe A x2 and PCIe B x2 mode
> > +      bit 2: 0 - PCIe C lane 0 is PCIe mode , 1 - USB mode
> > +      bit 1: 0 - PCIe C lane 1 is PCIe mode , 1 - USB mode
> > +      bit 0: 0 - PCIe D lane is PCIe mode , 1 - USB mode
> 
> I assume this device k3-comb-phy handles phys for PCIe A, B, C and D?
> 

In fact it handles phys for PCIe A-E. The mux for the phy of PCIe E 
(the id is 5) is controlled by bit 4. If the comb PHY is in shared
mode, the PCIe E always got one lane.

I think it is good to add a public link for this configuration, but
Spacemit has no opened any document for this publicly....

> > +
> > +      The bit[3:0] is only valid when bit 4 is 1.
> > +
> > +required:
> > +  - compatible
> 
> reg required.
> 

It is fine for me

> > +  - "#phy-cells"
> > +  - spacemit,apb-spare
> > +  - spacemit,apmu
> > +
> > +additionalProperties: false
> 
> Best regards,
> Krzysztof
> 

Regards,
Inochi
