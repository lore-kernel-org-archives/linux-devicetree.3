Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B52431E73
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433257; cv=pass; b=k/9487nHTkKhZkw5zqBORpyRDEbyVb8ZBwDPofc8TqATYe1EfH1CAwhgwG4dSmPOKI6+EdYiZbYhboZbxRkYcpmK31W1FatcvZHvXDsYY5sW+SgehkJPNN3Lg6aCgUGDKO3MlAZhswS80mdVq+89UCpF0flfoWWnE/ThvPZNaW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433257; c=relaxed/simple;
	bh=0T4KD+yh7eCrgqXUmpJ6jMjhizCo2dTEgcnzge07jsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJrNZnfH3JtTFsEE6T9R/wFJjqRD7+aJHhE3Xkz6SaZc+S8xbh1Gq9VtmY7MCh6rzALewXRGijJh5Q4F4zVfcg7PoqL0q4waA6JuYmPV7yBSBeKISbt3MYRGA3t814qlWRbRaFf9faA7FbGY4Ytt1IwZIdXsKpjzj1IRXlJhQOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFdYf6xX; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFdYf6xX"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74ae4c75b20so641812137.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785433255; cv=none;
        d=google.com; s=arc-20260327;
        b=gLRD/gKtSKuY8ZD6kc5s2NYwNJfGGkCngkFiNPCg9wcqic8uRrg/YXo5nmAWWrPP1h
         XPAhVTACRBykl2UXzujNVawupibst77gWch+nC4McykGwkmbfQgUfemYTIHnMuavkngx
         0yQ+CbtxYKjIYjc5hdwfpOSVRoaqkW/gvBBTgkn8cOhZqWKZ7kpWCgrSPraLJIi+TGXu
         nlsTKRr3Ncb4WAq7EtQm3AQU+prhVj7eGz8oc9j6yFMDnnUQIcWbjG/3kTYRZjAUWixv
         tELIH3aE2RjzOUCe7UWLjITfQhWNndoLMnbPIZwycy0Dw4VfgA63+RbxFqfCKWvFDGxk
         s8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l9LIQKYBUdfDAfZJWrxo5rGoFcd84Hh3LANLGG2Bw6o=;
        fh=AmYnYfyMeFvTIsEQcRNFHzbSIpnYkZHJ8cWAmkwSRW0=;
        b=U4ekbZajZnN2Q0Kp8HowWZIduXNFK37Ijym1DK6eUxDi+tZzzJRHJU6FbnS7Lhgl+B
         XGfFK3tFzIQtwVhiYc5jPaDjyL0AC+84bkbAJcHV8h9dQDA07lYmv3vWW4xcVhjxGaGd
         0wzkQQVkZVNH1BkFf4PdtCS2VoxRfFFo3YYijygq2vhNtAqBr9v90eTEuO9bmLFgAEMv
         G+RGeNd1RnLOhxFnjx1OIo7fuQQq2U5WH3gxbZV5VErOjrbOk9gDzHbFVJRCHu6cs8Uc
         8C7+jf5Y/8sLGx5YWRMW+0DBvFQqobR9kQlO6llPh0XHQj4sokq6bQ6BR/OHXKxay0ZA
         Gj0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433255; x=1786038055; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9LIQKYBUdfDAfZJWrxo5rGoFcd84Hh3LANLGG2Bw6o=;
        b=AFdYf6xXCd+B5Yok/pkG6NtGrw7Q/z8Tml871BkxfAZaQNGN26He7fLWr1R+7CJXP5
         aJJHVr+Dugyu34YNBk+aSE+Hwo0/vKeee7TDjdFTynb5GJxMevFPcpczunbYIsPulE+y
         Lj2f+UBcLU7n8ZhQQZDDvZ5yxnfXOqFEF0xoPpMDBKCOLWSZKrafm6XeBt86+gOhh/Ds
         TNqwa0OdqVjjRVPg4JGgn1WztLHo4F4Z+PXlrd+/v8MI/gZIJ+0G4TS4UT11y63iebIj
         PScVMsuJa8LgpiFj/Zbf97apKHr4qRAT/Yng5g35aJ6JFqIc6C79rJPl2JrMbpZvt4id
         om4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433255; x=1786038055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l9LIQKYBUdfDAfZJWrxo5rGoFcd84Hh3LANLGG2Bw6o=;
        b=UsDdQbxELWBWs27ntHZLeUI6nzMewsaDM3mRpztVOag0H3IxZYIXCzNV5mXS60Bu+0
         MfT0IxgBWL3jcmUlO0tFo+NhU+FJ10zz4nCLidX3aPDBdPz2uvpSRgHclP/Odkc8WiXg
         aSiX9DDf3HwfVFiYBcL0yvxhURACsaQuxl0vj1cnjQnk8OP7Ih3ncV2W0y8efH+EosST
         l8KDf/wjSovqxrqGV160LNxmiFODG7ZtbIwfTCJsyI6vRpkJlcS/iZ/HPkCplmjK479Z
         A8+kuRPfU3qRObjRshv802Jfcym4WMD6yRlVJxAPHkIknq4EpI8cUx7xkH8+GqOPPcVQ
         vC7A==
X-Forwarded-Encrypted: i=1; AHgh+RoVlJCqTikAuVzetiQlZLneQ1K0vylt7EwyrhrzkubzZsXs5ObRsIHd+ScVx+cRc9qVNnlRoxU0WdtI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8FS6L5z5NUdbBU+T9fP7dTDiB7UnJ7qHant8serFwufE681jE
	XXHea1AzwKxPjnRKq35RVJPTxrqzIB8+vFMjt8tXIMVWQDXaQh7O+y99EDgC4pP13nQZJ27klnq
	oHoKGJguy+GQfUpmbyK5GtsW8734A3jI=
X-Gm-Gg: AR+sD11jZA3nQ4h6ehYwDE0pnq6aA1eQRJ3Bk4+OOS9aZ71NfTO9S67tVM73qPJRw2w
	AeRJxTaRB8Lpa+T9i9bKmw3oA2gY/AcoEP/32/NwpFx0MTa4mVmT3pE8cRzbHx6ZRYnrz1Oekpq
	89M5fIz0Arnc0MLSHgL9lLnSnwHvpj6vBMlg9UHNmvOr1rVioQ7KjOnyy9Ul0yPDJFDoPf2Lnf8
	tcPsrZFFEPefYb9TWtwYlJGX1D7XNkl6VSlb21sRQvtPWBeTCqvMhILegXXl3jSvJ5o80LOkhLH
	sB2B9sealVWJlIZU80tAggfS0L6lqdanqh/rCg1P6eBwHr4qKUXp8kw6yD2iVJGDO97bO+j/oQp
	WKQ==
X-Received: by 2002:a67:f584:0:b0:738:8b5c:a41a with SMTP id
 ada2fe7eead31-7582b0ed85bmr442473137.18.1785433255276; Thu, 30 Jul 2026
 10:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <20260722172356.2509190-1-juanmanuellopezcarrillo@gmail.com> <20260723002319.2793cdaf@ryzen.lan>
In-Reply-To: <20260723002319.2793cdaf@ryzen.lan>
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Thu, 30 Jul 2026 19:40:44 +0200
X-Gm-Features: AUfX_mzRjI-xu9REGBWM4Xyou0Hlcet9mWJBwP9-yY6cbvyclNHGRhHVoQ_g3AU
Message-ID: <CA+c=wxVB-cEncgBE12S2YgXhL7DVgRyg12_4jJ-CjxzBjK62kw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

> There is more to enabling Ethernet on the box, though, right? The
> EMAC25M pin needs to be configured correctly - not even sure that
> works cleanly with mainline? And what are the delay values that work
> for you?

Right, the withstand fix alone isn't enough. Three things were needed to
get GMAC1 up on the OPi 4A:

1) The PJ pinmux. Mainline's rgmii1 group was missing PJ10, which left
   one RX signal unmapped, so I got rx_packets=0. The BSP muxes the full
   PJ0..PJ15 (16 pins) as function "gmac1" (mux 5); with all 16 mapped,
   RX comes alive. I don't mux any separate/dedicated 25 MHz clock-out
   pin beyond that gmac1 group, and the link is rock solid, so on this
   board the PHY's 25 MHz reference isn't provided by an extra SoC pin.

2) RGMII clock delays. The board has a Motorcomm YT8531 PHY:
     - phy-mode          = "rgmii-rxid"
     - PHY node          : rx-internal-delay-ps = 1900  (YT8531
RXC_DLY_EN, ~1.9ns)
     - MAC syscon        : tx-internal-delay-ps = 100
                           rx-internal-delay-ps = 0
   That combo gives a stable 1 Gbps / full-duplex link, 0% packet loss.

3) Your withstand encoding fix. Before it, the PJ bank was driven at 1.8V
   while the receiver sat in 3.3V mode, so RX was effectively deaf. With
   your patch RX reads correctly.

All of the above is validated on my board (2026-07-08): link up at
1 Gbps/full, ping 0% loss over a sustained transfer.

Thanks again for the withstand fix - glad the POW_MOD_SEL patch helped
connect the dots.

Cheers,
Juan
