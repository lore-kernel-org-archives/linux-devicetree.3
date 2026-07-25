Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82E22D8376
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785019898; cv=none; b=t3tprtUnn4Nqw4TP9cVTvZbovQDLEXXk/cE+7CiM/ZVw5pL3TXePtrxBpDehRkRm9qbJ5ZEXgmUYIL1pxgW7yPBN3+UunAiFu4BJtItm34nKM+LwNCzbDqbzJNFDJ5/TW2glIuUOkOq202iD5oqtU5q2Fdd1kuVWQGxXv4OtyOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785019898; c=relaxed/simple;
	bh=OTMLoaXNmc0daefahm7Ve/Ya1YVd+Uzup/9wVhoFs/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psr3JuWiJCsZMEbXatU5Ov7bVveV4a9pJ6Ou5Sa+F0eTj4CZZN1VZb/oTbb0UEzPb1/kt9pv8fS7784BWeKXoyVVnCUQF1OcOgyijwEaroykHI+PvPQAfXB6N4doCIyFR1yYTVDm7Yo4bXnEnDPaTpAh+7RilqJHqzQyNuXWStU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ugm1IM1g; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ugm1IM1g"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1760042a91.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 15:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785019895; x=1785624695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e597SzF5n/PM9EkMnGuBBQh4XkUddaPspXC7fYxFtHE=;
        b=Ugm1IM1g3IdKVSV76YGowyNU5KXZU7ZFTU+lQhnVIQXSw7EF35SrRC5MudtxWAoJc+
         Cw0JDVe5342OIOYuaWnEyczcucP1a6R1GsJu3kHbYfebgbLGkgF+Fs9rxsEI3j1+Q2Xv
         BP9xkpI1ZVvfE9lvRHV7zuBv0+nUgWnNIgc/FZhUfNKj5EUylcGi6IRCa0lZxT2m0aIc
         xWzA8OfJ6O5beLcEHmlLTAqYyS+71aA4pFIeWL0viP5bD3/I+MOUIGD9S3aqxwUti2tK
         RXYXX0UwetLRTgXdeBDnPnYL6qwsLt9kiKg6FyL5HWjHOW3YOglNxptIohnims3JANrQ
         w12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785019895; x=1785624695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e597SzF5n/PM9EkMnGuBBQh4XkUddaPspXC7fYxFtHE=;
        b=j3XS4tTXlayXFy7AJu0oxIUxrZ7ejkgt8XYPSwlmiLkuOolTAiLB4A+UDDWRNomPdk
         YlMOEoZm3EAG4Kg2665/RHxNylNXuBLW/CJBRPltXR6aAb9bzpMVB4GC1bID9oX3ScHk
         +x9Zu57UYoBclYhhgSYGu+Nnun6/yHc0JdBMSv7rusKX/6gH5gQwVWkGKgtWqn5l3YZF
         JBJWFxM3KiGCdle9FPkxz55TZZaAQ/90iNA1ivvCqcLlnwQSeec+TRYSt8siBQhZfUZo
         ejbKrfVp0l/3tNQc8XdqpMnj0FIMGA7csWwanTmvDIn7EwB6Dk0YmCoUOS+bLdq7/lCn
         OMNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCsTUVKF75jEPvVBr54Kx/bwVQS9rvQqVqYCS/HKlepZR3C/al/F6xerGPRkmfAb7f3a6yoVzJmIr+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Ge2BBR8qzgyRJnX0BoVTNVW8zll7wq18Bf2rDNrWHaHMeYte
	pGf5+7+UB+tnFnZclagJLFOuVlRAGmcydIXqLh63kSPS7O+VdYuRT3GS
X-Gm-Gg: AR+sD10w7tK4Z4eu29uJej7AkrJcG1gg2O/thWXJ0eG5MhFdL5plg/62njFtw+Y8t8C
	AW2OWjaa80HPPoQC1PPD0t9UJy2vAAFa+g8nATvVcQTsuMN02IFDFRYffDB8cWkaqqVNbBiSU4S
	OxLvmrNyX1Fc7i4VXvKAwy7z5BnU2zrEicAK+rKXzSVAe1m9M7gCnhiVLtn8Euiy4bIehzTpLgl
	DdrHxZpv96FY6C5aQY0k4F5JNzzx8EbDgoO4k3o5weU3g+118vc0ZNWiS8lOTB6qKUrbHW5tZRq
	3e16QBWlEfGKaZDdmAHkw2GaJcO+Y0dy3sLeaQCSrfn4+PglWXQSh/NSxRyHJ7qn/M1g53QtUA2
	FvSPwFvfSp0aRwxmZVUJFsAOmh+GT83jF2LIH14wMVTtJ4fZeW7rJTKAA2BUST80mlLd/zLMbym
	zk
X-Received: by 2002:a17:90b:268f:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38f2978b966mr3637050a91.41.1785019895045;
        Sat, 25 Jul 2026 15:51:35 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm3263879a91.8.2026.07.25.15.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 15:51:34 -0700 (PDT)
Date: Sun, 26 Jul 2026 06:51:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	E Shattow <e@freeshell.de>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Fix phy id check for the phy
 on pico-itx board
Message-ID: <amU94BeIJT39DRRL@inochi.infowork>
References: <20260725005804.373698-1-inochiama@gmail.com>
 <20260725005804.373698-2-inochiama@gmail.com>
 <0d11de51-546a-42b6-80cb-8ca258389a17@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d11de51-546a-42b6-80cb-8ca258389a17@lunn.ch>

On Sat, Jul 25, 2026 at 05:57:42PM +0200, Andrew Lunn wrote:
> On Sat, Jul 25, 2026 at 08:58:02AM +0800, Inochi Amaoto wrote:
> > Current phy framework can not reinit the phy correctly, as it will
> > assert the phy reset GPIO so the phy id can not be readed. Setting
> > the phy id of board pico-itx manually so the phy id dectection can
> > be skipped.
> > 
> > Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> > Reported-by: E Shattow <e@freeshell.de>
> > Reported-by: Inochi Amaoto <inochiama@gmail.com>
> > Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: E Shattow <e@freeshell.de>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b2a7d2d0d3a8..b9d2de878f38 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -196,7 +196,8 @@ &eth0 {
> >  
> >  	mdio {
> >  		phy0: phy@1 {
> > -			compatible = "ethernet-phy-ieee802.3-c22";
> > +			compatible = "ethernet-phy-id001c.c916",
> > +				     "ethernet-phy-ieee802.3-c22";
> 
> There was a patch recently from one of the DT Maintainers removing the
> -c22 compatible when there was a specific PHY ID. I did not look into
> why. Does this pass all the binding tool checks?
> 

Thanks for this mention, I have found the patch link.
https://lore.kernel.org/netdev/20260323194803.GA1241974-robh@kernel.org/

It seems like this patch is not merge at now, but I am fine to
send a new version for the incoming change.

Regards,
Inochi
