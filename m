Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4645D1B1
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856246; cv=pass; b=PejHGiF4mYvxxvLazijCTOugMZCiQaGxvU1Yhn+jGg5Kn5Pi02ytm+59Ntg1ReqNDfU23k4paPfLi0QcMthdU2XqDnfyHJUgXUC49XxSiVcDqVhja424zcqwsq20NgKrk0ZPGZrZ2O2ZQv4CAe4/PO2BCOVF5JL234zF/EDHuoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856246; c=relaxed/simple;
	bh=xQHx3qdg2OB8eL+HZPk/PaSCwM5pfSflhLtr5HLqtts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ly4x7MbA8bIkt/qW1Qi7/LpFjAt4URvj+22CCWoFiQOd8KomWm8dZ3QnbbwnoSkndLSKnTsYFPL7YhTvWdV7uyomKoUR8KDv54UFOJuQTPZiMtjWOUy3m0hGSbTjFX4KU44YP7QPzN9o6YVPLVUnx44AmMNFYYctlYHL+GeS4rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWNZJJO5; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWNZJJO5"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-977310532a7so742877241.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 08:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785856242; cv=none;
        d=google.com; s=arc-20260327;
        b=XAQ0mVlOkvDv2si5oWNtPLhPYl986hPM0mc6EnYS5SCeGl+z2A1aNoOAjNpwaiVliW
         9BCLnF5iCXc/KMaEAgx4yR4uvfEyfqQUWyCa3zrWIhzH+ZszR7PaxvBdq+ntmN4f7Ghp
         jxR8RW+NVcTYoZRGDpzGbeSQRyCqLHo8QGA4GyoX2c3KzXPhioHAjVvGjzzIyLAQo97u
         2nAB1XrUGOQUccSmSXCkHzt958N5fuQM99dsZprtR13VEHGq2GdQ/93ZwZx1iE8LR6bv
         Ajispzd4PePe5pkXqAmBZCdRtBsMFdvNTJTy5/EHUNyB8qY766QkjRnctMheTOjHJl7t
         ygPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0T8R/JfTkQUvAYP+f+B/Xqjff5brUSAFh4e9c3jkVBQ=;
        fh=PH6ITBgchfAsGDbJ6gPRg/zDhRmCcYAEAxm3vRavuY8=;
        b=lqlLJLCt4t5CaTgcnkiFIQrz5KHHWPrrIQUdxD9fDVOF0+Yx3uxHwcHnvZieOqrwME
         MvfXOJATAg7KOZChmgS2leWv3LzMGk2VxELdW9efm1lv/6YTNg9TlsioTojrsRU4Fepe
         zNWmZlnfKOcV3AtYWwbf5zOEfyWPr7t+NbdGqzjsb6l5oBay+fPwVJ7+/SnVzjx3XSXv
         YHk/9VvZ2JahS7qf+283CJY/XPQnbS54G6Oj8nOuhGD+NZ0u1HjvtSNVGh52V/8sUDLx
         y1cve3RTt0vE2MvY8jiY9UoMYABhCA+e/cmEpLn8PnjJTlLANt4S9sUI341/33DY4CFK
         GXog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785856242; x=1786461042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0T8R/JfTkQUvAYP+f+B/Xqjff5brUSAFh4e9c3jkVBQ=;
        b=rWNZJJO5ff3sSM9HODqOM5stKGfvICmMmj+/7WzLrYIMkoKDSfkLY0UR4smODL+f2e
         dDp+w7ExYhM18aaMQZDisBSnZaSt1/9/YL9RNj0Tmd1s0sJzsIN9dvoSByJoeuovN0JJ
         a2iTHG9HRS3sO7lKrCIqMjfLoGcgnuqZLlBRJPbvklWNwry02JZcXMTpQNLlbz6Yf5bj
         ER88YwfDzWEy/ywXU1Ww5BAwr1NVMDz3wBnhBaHs7U/iCMjwu1B92Jnqzz1yoLytJ0nu
         8uIs0jPRxiz3sDHaiARSx3DVeLE/4rYqoyA+4CzFR9PRPMVOoMb+Hmj1vZHl7b7zF4Sx
         tjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856242; x=1786461042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0T8R/JfTkQUvAYP+f+B/Xqjff5brUSAFh4e9c3jkVBQ=;
        b=nrQPhojXWHlURBcoVsok7xlDpLT88RoN1PLu2JZt65a9Ynm6RHNRTZQAZM0dMLk4Qx
         fj+qi/EraMw+ZHXaDh1cVy4rULqErU+967HNSyTebLQCtr5Th9KxcBDBrHvrTQTydzAE
         fHBvgEWuqW8VbF62UnZVh4b+u65ZnXx0WMuAVl/EdWwmJYxe1AVd1G1rcttZ2+BAVXOx
         jcGtPEwM+94EaCYqAKfgbyWUDHMo6vMqiJMRxps22o+iQIJlgarvzVR9GWSZNy8QTIa4
         4DZue0INaCoerf8uixHhyk5gF9DLkCFbcce2IWKojLigaBYaBrwo/n2P9P3fSJgpDAf6
         ip+w==
X-Forwarded-Encrypted: i=1; AHgh+RqupeJYHjOlJPdinS0nOSAVz/SYLu14IlIz0AEsqKcH7QfWEJDUniCVxC06q2W6g7fMjQYl/PBWk4J/@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBzk9KmVMbLtP5FHSOuIsk4WQQy6VTH7OhkQbF5H2lEr098Yk
	6K/h3nsbKHRU8A1qlcQYocTCi/WnbnmuBMSNyVbiWTG0MjDj90ZkGwxCwTk8Rm3AMTVUgkc6XSq
	2Q48SHOpgEmvprN4Zl+YUF7zFvt78ldw=
X-Gm-Gg: AR+sD13OAjfdMrz/L7hOVs1qhPiAbclEfxYOJ5UgbNN32Ut4Pwq3/HcvXDb2tXdcjWj
	6ghLlsmpW/O9iH1PwQZrJBfNFUZIS7HVzW32uWyz97P8b9hGNjv10oa9y6prAdzmZWmKPG5VrCd
	+NAPaF8zZuWD2+bdaTJNPdF4rIYVm5exmHY/oDEJ39pXdxbityrWhV/lG01fJBTHdkrRBRnoIvI
	asJuBw4NlOkJGaacQkxDOWxDbn4W12nV8q42A6aTG3AN/aUKmC37rFTVDXJ4k57XxhTb12cfnlH
	T8mJyyqeiKMZEO1oaJsRrYPDobWEGREmWfBcuyqeiYVHIeOaOl0i+IzA4mt2E5pCwIlMdmCQUAg
	7BiWxgLsq2noUS2IRvc3ZtcUYITTixt/eHo4Nzk8csBbFnsX1U+VclaV6x2uAmQ6X4Q6YkjqPGV
	X3jPiYJPvdYZFvJ6jU+MVXZ08koPhE71ja1EKY7HPreycpz+I=
X-Received: by 2002:a05:6102:578b:b0:738:394e:a595 with SMTP id
 ada2fe7eead31-75f758f90cfmr1181484137.11.1785856242009; Tue, 04 Aug 2026
 08:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-submit-mdio-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com>
 <c1c5ce0f-2c65-4c19-a525-cdd2ef33b6e4@lunn.ch> <CADvTj4o+B933k4TUshgcvZ4tENDbit3fHEBtwy5ODpsf60osyw@mail.gmail.com>
 <c6f001d6-b9db-4434-8468-4705d62ffdbb@lunn.ch>
In-Reply-To: <c6f001d6-b9db-4434-8468-4705d62ffdbb@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Aug 2026 09:10:30 -0600
X-Gm-Features: AUfX_myEkwMmILqoz6WhwBFrVnUN6AKUbAAhMRjZZlDrp-P41avXbKl8LxYfdPg
Message-ID: <CADvTj4rA5QaeccDvSP2qrseFKv+7MKhj=pRWdSnNzKKjMCdK6g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/3] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 6:54=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > If this was a hat on top of a SBC, with an EEPROM indicating what the
> > > hat was, then maybe DT overlays would make sense. But from what you
> > > have said, this is a fixed PCB design, nothing hot/cold plugable.
> >
> > Some H616/H618 boards have the ethernet port on an expansion board:
> > http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/detai=
ls/2W-expansion-board.html
>
> I don't see a list of pins which go across the connector. Does the
> MDIO bus go to the expansion board? Is the PHY on the expansion
> board. It all looks passive to me.

Pins are listed under "24Pin expansion board interface pin description":
https://orangepi.net/wp-content/uploads/2023/10/OrangePi_Zero2w_H618_User-M=
anual_v1.1.pdf

I think it's just the connector part that's on the expansion board?

>
>         Andrew
