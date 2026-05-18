Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63BE332EA2
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115216; cv=none; b=PwMzUNFHXD5SlNxuyHsD6vjvCnkVpbvD89QDcK91U8sCr15wKTSUA4s45ZUJmFUG0+e+BAgE+eOIFitv9RbioxoGHyt6Iue3XpsJ9x3uSW2OCkRuMjYQK2b84bhJOrVd8okntLEEqvF21mWy1BFlrOVWZqEZmsNL/mZi1TfyCIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115216; c=relaxed/simple;
	bh=S4c2AULgCr+oAYdflJy/tl/FD0zXRMyuMjKCi/X55po=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=POnl1BqIMysiz8xbxLemTBIkYrxc1SA9DeL7+QWNi4bf0+NI+uflvUxNYV5+kFRi88DeUrt6PAsF/XD894uZYPJxLR3+/7m+4FI96IGhnp5WsKtl+7OTOXfqMVmPfg035Afi3d33eoEy+GM5GloOqrvtk5jOJU4Wo43QwlVpe8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnMK1kO5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnMK1kO5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso27201645e9.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779115213; x=1779720013; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S4c2AULgCr+oAYdflJy/tl/FD0zXRMyuMjKCi/X55po=;
        b=VnMK1kO5LUOgU7cKJlYM/HrhxVirEAEorJlSJJju2iCw01MNnZmKmw7B0u1Brl9HYh
         vMhHmD7GifRGe9a6rkLRK9RSWdUMD/WN/7PvsAMR6yYlUE55bfZjy/Mzj2mLcFN96JoT
         dAo+2oTxHMa0MLxYn1qkfO+emQ2z/0w37hwa19h7VlgDqpNTuJ+A41tyKlKVQr/UdBp9
         EvRFn8pQKq8r5cazg0Ujb0JcDZkCpVZXZ2s7OfbtBVyBzh7JGrtrErFPHg306rU/k481
         jfeddD2dLx7kkyuBXvUzlGai4eDbdhb/dbHIHO/wZjngdhS+ipQLiO4nPK9tiPwz8Yc/
         Td3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779115213; x=1779720013;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4c2AULgCr+oAYdflJy/tl/FD0zXRMyuMjKCi/X55po=;
        b=c1iQdi+f43Em/lLMj8m6f1+g8gWp/ym82T22sokfvL3loQChHV/54ZcFlnUOl3MfTw
         dUrNAHKTHkLSqxrNcM9kp7LCPqQdvSBpNzGamOaSgdooKyQdD8BaJDFQjXiawdswMstZ
         jx6BMA8S20NyXee0kya/0j8Wf77ynCKqoQubd82TwlUgf+rTPN7eLeaS5PO+wdk4KttF
         Y4tthNSOeetC32EJBKh8h2rXXUyZn3dKZbzkRyivSDoilfKBjqcHv+8/lHv10vkw+J0c
         CclL9z6aeow9663XEOBWjwoewMk1fRClCQg3a9IRqkYHWD6dVPxp02kXXMIdQb9IeLHZ
         Mrbg==
X-Forwarded-Encrypted: i=1; AFNElJ+yOll4jAqeraTDyFb6UBxhBi9U9vZiVDAmSJhR4iYRfPN/aWeAvBpsHmVuMLOhfD6km4u0gvlUP6A1@vger.kernel.org
X-Gm-Message-State: AOJu0YzOlgf3xZzUnRqzpEGQge1W32gTad3Eh/VZ7CfA2YH8AqS8EHwi
	HVQAeOC1Urk2Ye4TDrmF47ZufC7aYN3VZXkRrovhnsgvXTNcQBqG6cls
X-Gm-Gg: Acq92OEcJobScNI5XD1+YlA5GeJKeTAXhTBGKAiaX9xobXv/B5TSL/rzg38ThvtkBwC
	EmS9kOJ/KOcB2grQCMLBOz0sG2A6cHlX6wubZY/+TlDXtK8h6aTwtVaDmVfJfFKEsARg2OvIFFN
	XkDqnZN39JJA59QjnjnhPs5W9ev+EQH7Uv7XICXl7wduNpx1FsLlFw8olHZ7SPLaE8ZxAO09pc4
	bJMI50bjnB77nh5Y2aiY+7RiGkuMmH9+umGHNgwcKyR73ha+5bTdfrRY5dZWOcaIWokkzRcGYNj
	KPMhqD0QhfagR0dyOc3DihJ7hADzkZXJo34AbvfCnR01PIWyR0bC01ovYJTRGoI5DNQVCwECr2C
	ctrxPJJo6XGnH9iZQu+TEO3RlfAeqIwMVHS5h/tXFX4Kf54ahjVVRo41wMY1jPqViP9rk4qp0GV
	/BmD2umqK2W2O+SDRf4yMuKXNl5JC6aVLoKUp1KK2J52JY9oTc53pLTkZ/U0AqjcrVkhHqzktGO
	DQ=
X-Received: by 2002:a05:600c:c087:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48fe5cb36aamr189623285e9.0.1779115213181;
        Mon, 18 May 2026 07:40:13 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5e9d5d9sm303576575e9.15.2026.05.18.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:40:12 -0700 (PDT)
Message-ID: <bc3b786313adee30cc00c65ea98ff5258a816abb.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:40:11 +0200
In-Reply-To: <agsezxcxjQlBmesm@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
	 <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
	 <agsezxcxjQlBmesm@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Paul,

On Mon, 2026-05-18 at 16:14 +0200, Paul Kocialkowski wrote:
> I also have a U-Boot config ready for it, which I could send once the
> device-trees are merged on the kernel side. I could send it to you if
> you're interested.

I do have one as well, I'm testing all open-source ;-) from ATF-upwards,
just thought U-Boot would require ATF merged and kernel DT merged
because of OF_UPSTREAM in U-Boot. But I'd be happy to sync when we get
there.

--=20
Alexander Sverdlin.
