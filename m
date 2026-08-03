Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFED388385
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 16:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775538; cv=pass; b=p4CJHuwGqtCeUGCEV/OIw31JWO43UbR3wN5TREBmn+hmcTrS6V4nRjKNWvm21vNbE4SdlBo1S83sn+r0ASopOQB0qDvFkeEb117LNHO4QonGgRMyvZHI41ImFfW4aqYHjNe9BjC4550icdxftAZ2aiFyMYcx8LT7OOzlAASQz4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775538; c=relaxed/simple;
	bh=pVJ/u9SrHtpIYcpsDllTKqpayBtCBNOqrDA3wdvqLR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZtsogAo2dTnpnTxvM5+LaJbSUjN3kC7RvmcksJdT3x+yscsNIJO0Q/4VlILIABlAsQM576xu2dbiri41HfJbvwLVqdvWnc4l8Z5t2bivMVxxV1HqYv6pupja8RYU3AKhH1p+d+VUuX587dxCZNc7dXbOmgVDeBKqmARqbb4rAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jjb7+6s6; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jjb7+6s6"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-96723c7151eso891178241.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785775535; cv=none;
        d=google.com; s=arc-20260327;
        b=TwZ1FvwHeXFmYsxXME0jcAu1qselTi2HfoMZLWjZ96oYKJ1YEidoLOExpKtMS4q3Nk
         IvRkJdKXJZw9ASCzKBHM44pi8YSSU5fCCJBUwYUPTl4QZl19CzYzB9Cthw1wRwi7ztkX
         Hsdmi3rv4tWKDBiTG4PhKu9TN1K3rnbA1QKY+1Y0p4LIsjFnlgmFlSkNsaN/AVYQA1EG
         k93rlEkoiN7g36gHjHjRE9eFO2tiNz8yXjXSeD1brZ96g50xTuInoeu5KI2+EEpGfDYe
         uLrrdLRVSsGfVwYJFCGmcLcAqRbtXRyiveTuqZnvdKYA8ktzWPFusfweOi49v/OHV7Ta
         WI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        fh=w3WSZ1ekXBH5/FFrf/giWOxEL5hKsn32YzQd2HjmvRQ=;
        b=H3lwlNFuge1pKbDbuwYOWj5X5zzV+3Y2guw83klJvzJHHoLAeREvWU+HH6EpIfNzoT
         +pt8s4ATJZmm6E5ZsFthxZw/b4luVDaMXwXORONHwZCQbc/kWtwt2da7gTA+oy3xX+3M
         3wYd2GUoIZncQ6ep5SYQT5l3uoGNMN8dLww77I3ztP/SNZiugVqY2yinfcs0VvV76qpm
         RC2lbCXdRDiphzum54uAjIo//4L23MYmuVlBkhKqaYkN3tRJwy+NbEXXAQk5h57ZqmRb
         gv42rLs/pEJDunW7VXN6igPV2J7x3xqqQzdn/GE4dOiZXthlQtEmItNacU8JPmswpfls
         cC9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785775535; x=1786380335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        b=Jjb7+6s6TLFWkOKejxwVE79v/pHkKWcfRtDNHkt49mRhfkUcOV65hnXYgFCgxlRbYM
         OcgqZe3TxIn664s4+7YrY/E5n4QRGLLgYj6J9Vfz7SgRICyQZqIyTvWt8rW0MOLY0nlc
         LlKqLm8Vzu0ip+aSFCUq+gyJJvJPvhMpcZobSUDu4WQSjoAX15+QnRoARTaBVejBzaGO
         xbWR4SavD+rEoi/M/wf/SGEzW4HKYn4xaOZpprSjsUr5vua4l6B1VUsN1aI5tH5v3Rss
         AaH3sQXP1H7gxi4lCQwoZjXD+A1iWZedLFs+aghC0X2OgtjnjEqlsKI5czbza+5Noyfu
         q37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785775535; x=1786380335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        b=fo3zbHJ80fHuZspt4Qm08r7ZM9GaK4VKzmm4b70qOudOOaQru7mAtUqfIeIRur2EFp
         KP73qRuO5tgPsk7NFoWBBkoYZE/NHH+P24lUMXlLj8JJKy8W9NhqBAOFuP5xPsn1Nd1p
         +DPihkxzF6vK0PUnYuCHEoe/ChIEqrl4UdQEGfVm6DkmQUiGL5CoFdLjnMbxTQpPosCL
         Lx7mtiOIHdOumDeuVckaHW5V5HqYuJGgrMsgm0grr2ZtPvK9g6hT5PxR2abwtG0CshpW
         oTtIkHK1usnSFncnW8MBmD7oPo7jKg2mfUPUreoFa75U1nTZXJ9aRD++iSvAsUKFSCIt
         icRg==
X-Forwarded-Encrypted: i=1; AHgh+RpZTIruPy52fB9UmwqBDqvHKyGjuUYn799NaTABqZaYyam71S6aOS2UXc8Th2kMkxEEjKq4Qvj02Azy@vger.kernel.org
X-Gm-Message-State: AOJu0YwLxxAXyyAp97iabrQjDau0iZIjnbAxzhgxoBvdD7fwSEMIG2eP
	Y8L207Z/LUuFSVV2cw3USAec1w2XCI6wYSycrbHU6utXWSwvwnXYhvl8qm1MKv7ln4zo4Fpl6df
	1uYdSqy0TGiP+6vum3rtEs3BDKKWDVP4=
X-Gm-Gg: AR+sD100GXya2dNflTvuRxidixb6WgtwFm/3hH9i9/4YhtYjJPlEI5t991a+YI8weWL
	nV93eIbP4NnLl277Ted8TiUL/TZi5jGE2LdS6H68ACse1hQJQ7Ib1CPBLG3GpFO5v+puHDm7lP/
	07Z9rNvQkWAZZuxYUIgfNyLPbYVUjbrJgvqFNsRHwckWzUISAj2Q9cIfBuH0Q0kRaYx40dQnFl8
	nQ+R52FVRNZLJxaCPOBLceLUjCRdXMXBkUMCe9d0eSD65ifQQlopsM5oHro9ArPciuXMk7tsSp6
	NZJ55X5xEfkFECdl2DtqEyhtAPqjY7QeM3iXkHjjEt34gqY1bc37xsQaAlcPZym9PLSjJiFODEe
	9kAjh13jzKAk2TSfWEDzpQ9/beJNSWAz81eWIKu3b/5h98V4ScjdrKzMfXTIhgQpxuhRTtnz3cw
	JmVTYTm5Pq73+GbJ77TGjQnTk/Af2COcRrZnJe
X-Received: by 2002:a05:6102:5e82:b0:73a:128c:4e3d with SMTP id
 ada2fe7eead31-75b22b6375cmr7983333137.8.1785775535469; Mon, 03 Aug 2026
 09:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com> <2c0210b3-2c68-41f1-aa33-3f1693454849@lunn.ch>
In-Reply-To: <2c0210b3-2c68-41f1-aa33-3f1693454849@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:45:23 -0600
X-Gm-Features: AUfX_myHhqSCOlS18NU3-rnIJB_yJDCs5Z0LNUdIv6o7tNasY8YkhUjPJd2Ilvs
Message-ID: <CADvTj4pfNFVGrQV86T7X+nZQYUamxEYLLWuxVXk=av0da_XocQ@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:18=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +            ethernet-phy-control {
> > +                compatible =3D "x-powers,ac200-ephy-ctl";
> > +                nvmem-cells =3D <&ephy_calibration>;
> > +                nvmem-cell-names =3D "calibration";
> > +                phy-mode =3D "rmii";
> > +            };
>
> What do you mean by an ethernet PHY control?
>
> I assume this is not an actual Ethernet PHY, but some control logic
> around it? Where is the ethernet PHY itself?

Correct, this is not the Ethernet PHY itself. It is the package-specific
sideband control block that must be configured before the normal Clause 22
PHY registers become usable. For AC200, this control block is accessed
through the parent AC200 I2C regmap. For AC300, the equivalent control bloc=
k
is accessed through a separate non-PHY Clause 22 address.

The actual Ethernet PHY is a separate device on the MAC's MDIO bus. The
shared PHY driver for that device is added in patch 16:

https://lore.kernel.org/linux-sunxi/20260802-submit-acx00-of-dynamic-v1-v1-=
16-0a53cd9e21cc@gmail.com/

The later board DTS patches instantiate it as an ethernet-phy node beneath
the MAC's MDIO bus and reference the appropriate sideband control provider.

>
>        Andrew
