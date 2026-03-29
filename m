Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8338834
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 00:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774743257; cv=pass; b=ClsBB6NWXVHNiL9TGvkrz6rhPcRMbIbq3XTC1fN07bes0jzpQjo5bV/9rYSA73xsApws7fC8jfSwTSYizuHP7EH2CCaiN+YTl20QbyUFrKR/qCBYEYtdoFuub0ShGpyv7O3rNZGHTVZpvbovKVr6JBm3+6rUlCrQ2xfrHGRasck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774743257; c=relaxed/simple;
	bh=6VPuVWGp2jsMVQP6+aQ2zSV/KYs6/oOd53njQt+zsc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jF9XbLmA8yZf3Fq5ii0MFeiVVB8hnTHntkL/ABuHd6SX5IvW5tF2fbZXnH91Y71TYOK6tbghaKUrBcvJA7mTzv7vTiKCwPRihJbIGEFSPdTt7FvssW2k/eUQi7H5f40B/3pC7X6ta2UpTHcs+moKcA0bsQgDB/tV5x2ZrelzB7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXk6D1DV; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXk6D1DV"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1273349c56bso4050164c88.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 17:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774743256; cv=none;
        d=google.com; s=arc-20240605;
        b=Ad2SRyMbuARYJJQrYF9zrsEuFSGf0NBISfFw22CQJWtVN/IlyW5V7zHHbR20TyZsCd
         gjPVlPOoVglmkPvqRq8eZI0ZD079no7OazyvT1oCrhA5BL/d7I/DKCHHqeehnv0j9iZi
         elgvJA1HSLMinPZOFyYhNy7hIzINttRUAkCKKwyOvI3+9Iawi0Clq5799k8jQU2G1EKU
         8YYLvCJuT2/eGgKuumqq7cWvILL4po9WDHIaQpF3RHERG7D0Ryp6Lhpf5cEmXVIRoVMQ
         1HdW3i67G6HlWP7jQ0cmToFglPPWkMWrvzLyfxkOFqKOzFLS2IXX/oyZES3uo/5rt/D9
         3+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLm/cWeL+ALoe0xoKYMB0cJ1r37KJ8n7QLIQtxRsqdU=;
        fh=whqk4B7bDOAeZNZ3iytWIBiKpUzPfw9xmIDf0XmpJgk=;
        b=BW7vJ8VGbBAYieDa0PS/DgqxHeKyqIrr/81GhzLmN/wcVEtWI0O9cnPzP74421VU8G
         HcOoUSPbQg+Nr4oSf3WbQ6qiqsBLKnccE2Oq8XP5ZKXnopKyaSSJzKp4bfmCseoSKHpv
         jqqpZd9Q2A6swSXKEBzdAdBmVqJP843duFzrcr4I9EcRFDT5OF0ZsVX+CTE7KQYkXLeP
         FVDIX4/uZdZwq/Em3wwUI6y59IU/InRou9CYczhONKN/1+AZaNpuSZLPQ80QvaJyR81i
         7Ad9ilWbjiZr7nddU77mHHTg5tOXTKvZGfy3zLrfijQdnpHXyA0LYXTd4yJX28HFUocZ
         PSmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774743256; x=1775348056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLm/cWeL+ALoe0xoKYMB0cJ1r37KJ8n7QLIQtxRsqdU=;
        b=YXk6D1DVWmT1YbqAvs10IPBGZA2ZUNGZ47Tg/ax3jre0uay46VV8CYyYYUBeyn2qRf
         KUinFu482oWhxm1u4Bx/xLv1uZCUgqmKtRqZ960ezfrAPgFtN4ldEncnSkmpFsWn+Dp/
         emCWfI2E93Sp4OtWEfW60+GxtP+lrJDPMKQBlEcK9CP6rmlsJHS8HUvTp+Emj7A2B2Gk
         EiNUPHHJwP3OFx+PUqiZla5rRjYAam9kum3ck9/8EHgmkFpuA4Y/30du6XtQIAIB7Rbw
         G0iRqqIWzxL9FjjLnX5FIPFWraZSP2e8bQYfeDpPro+zh7bRgkBRn7St4LCdN5YwgcEC
         ewqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774743256; x=1775348056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLm/cWeL+ALoe0xoKYMB0cJ1r37KJ8n7QLIQtxRsqdU=;
        b=lvRSXT+LKMJ0wl2Qj1UVU8WBAVq0s9fOpiGPvWQf21AbduNRgdB6fHTsKAtQkubNmW
         Y9hc6lVKZDn1pPj/Hs33QBAjtd/gq2T+64e81WX65c5j5QNeTC9fVNQyRkVBCYM5e657
         uDAiGP16jzoEUMUmJIpcg9v74X9tozpidsjqObsmzzCWVYt0gtgggz9jk4RRi753pT7O
         eGEmwgkuzNRa4L0JOj7MML+/vmWrgYpIBcJdUWTQpCtsx8IxLHYIfcfgoWWZJlJ7eXj8
         ngbNGN7vvCeycoZRDwdXiMM9I5XBEjDG3olk+0Hzr4O2k3+sDsQ7eWh5og4JtYyTFwB2
         XKwg==
X-Forwarded-Encrypted: i=1; AJvYcCXl7crzJXhvt4nCEh9UNW4M/FnAV5xGeh0gzE4+T7fVOUc//FzhlUvO2BUZTh07oN1hCMXis/JkELcv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx89T2XPDImHXCBFcTsR8gZSQn4p7KziM47bbPwy1aBTgLd9k92
	SS+FNm0FuTDJXgkdezl8hV2CV+kNO+lPeijmYwmVQEHZ3aF/NzBajbZDq2/FETvOXs13xdB30rx
	ksEajvq8KoRGGlVmPg6HfEuZHyUSWSD0=
X-Gm-Gg: ATEYQzwWWUfu35cA30ts8Dy7j8w1L/NAeLsvpGkBbELCACRnue2QHra3BfBouLt9VyB
	3K4xRYUpy4OPUFipdPrVBPHPbQbLI3yRbMytH7Q3K0Qkd19SxzFfyQk7mzUDszZnuJUpRU9lLsD
	f+l9qIU0YauxKm48fAhe0Tfgyejune9CahecSUWK821rixg4K3n2Cm+yh0qs4mG6gCCAHnaSoD+
	4lbm3AsbZDQWisZpttrZHzliezGzJ2Qxt//4q9tRreG+VXJFzYjmkwuc4OV+rs3+ukNjC3CJp5P
	WE9SaGsbNQ1fqbD0iK8s
X-Received: by 2002:a05:7022:220a:b0:12a:71ab:8235 with SMTP id
 a92af1059eb24-12ab284be87mr3912794c88.6.1774743255658; Sat, 28 Mar 2026
 17:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com> <ed3d39df-0a0e-427b-86cf-b9b2d2094b51@lunn.ch>
In-Reply-To: <ed3d39df-0a0e-427b-86cf-b9b2d2094b51@lunn.ch>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sat, 28 Mar 2026 19:14:04 -0500
X-Gm-Features: AQROBzAt7ICtBirsaNdRYtv4vbmjxcTMi8IMv_vX0eO1yy8eUd3xiGfmPfRlEXY
Message-ID: <CAJ13v3S7ucjd-ifmKFBDGtsg32MbOar2OBeiGMVEJBsH8+JP7Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew

On Sat, Mar 28, 2026 at 7:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sat, Mar 28, 2026 at 06:39:59PM -0500, Anirudh Srinivasan wrote:
> > Adds the DT nodes needed for ethernet support for Asus Kommando, with
> > phy mode set to rgmii-id.
> >
> > When this DT was originally added, the phy mode was set to rgmii (which
> > was incorrect). It was suggested to remove networking support from the
> > DT till the Aspeed networking driver was patched so that the correct ph=
y
> > mode could be used.
> >
> > The discussion in [1] mentions that u-boot was inserting clk delays tha=
t
> > weren't needed, which resulted in needing to set the phy mode in linux
> > to rgmii incorrectly. The solution suggested there was to patch u-boot =
to
> > no longer insert these clk delays and use rgmii-id as the phy mode for
> > any future DTs added to linux.
> >
> > This DT was tested with a u-boot DT modified to insert clk delays of 0
> > (instead of patching u-boot itself). [2] adds a u-boot DT for this
> > device (without networking) and describes how to patch it to add
> > networking support. If this patched DT is used, then networking works
> > with rgmii-id phy mode in both u-boot and linux.
>
> I've been looking at
>
> https://elixir.bootlin.com/u-boot/v2026.04-rc5/source/drivers/clk/aspeed/=
clk_ast2600.c
>
> And i don't see where mac2-clk-delay is implemented. Could you point
> out the code?

I'm testing against the u-boot version that openbmc uses for its
builds. I don't think upstream u-boot is used by openbmc.

https://github.com/openbmc/u-boot/blob/v2019.04-aspeed-openbmc/drivers/clk/=
aspeed/clk_ast2600.c#L999

>
> Thanks
>         Andrew



--=20
Regards
Anirudh Srinivasan
