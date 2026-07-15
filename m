Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B8449EB8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127881; cv=pass; b=Jv3M0kt0kyRvU6TDhyWo6mpflPNynUqS5dWv9VyMDAHaofMRw9HrPFmIoej5Rp+Q4PAoEZ+VXGbwEk8ll4EStcfIX8RV8cMG4nqY21XXfSHaNAjGI4ZV8A7Blw8SnumXdH37KVL/F2O15CBY0HtPaiDOYtUNg8gfGlRKYE2Zoac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127881; c=relaxed/simple;
	bh=J2Ex/vBwZIsuMi8zq3Q6TdHn7fEispCyHy5fZEUhOmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwREcEfXcpzyFYQ+KVSotofeOZYDn27tRrH5FhmSGj3tgCG0w5P/w7lqLvQxMvWfg9Fd1bmzJtK66Zsiv8Ky+O+UWldaRzLL0KaNEZUSLnI1CKTUzj2ErAxhZ0Ce1jeFK+EmY9ykFpIrNDhbtSZSGfyVqxDChhIPSCuMjx5zhPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJaAIuMK; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJaAIuMK"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15c7d22070so729596366b.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:04:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784127878; cv=none;
        d=google.com; s=arc-20260327;
        b=TVSj8s0j/N5dWfgtGPwCqSsP/x0IKWBBtha2lCPt2zxPLA/RC/3zRfjrKW9pPnuxAv
         4tbmUZOmHVNj+u59girw25+KRv6SkYgm3iZzOlK4mnyIFi2WOTORshmAdYF6YhqNOozu
         9e+Cs0fxICdi5f3PZCpmV7I8G7cb1lZ57joGgQr42HDark84x8yJ1Vb1zY23IrgETDvx
         aY3D0JKpeZ2DDzA7jQ1bbGm7CwfRHwMbRGuMVJwa8DcAtlLBhDRZPEHrQy1Sx1cVQ4xP
         zZFzR6B6fmAFtn55Bg6tLgTsmz48RmyVOo8t3RtYddypl3GO8ANRgvsIgr7CXalWnSM8
         ZpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DG9Q2oJgppieJnnBNek/PkQaa2uv3zufxUx3ZgWYTcs=;
        fh=JgG/JhvXLUDVJJVwLo6qtJxhFgVqxENYqFtm7ynrhPE=;
        b=L5CXGaN0fRBPN3LfwaLzwkhBthX86qWNYaiOiiho6o96KgE/TgJk+3bO5gCgz3upl7
         H8C37cN77QT5ybXnTfUSCm9GZc9twC2ylp7gzPtcyDQubHU11MkVVDBUVwG5GLt2Ab/g
         QTQ7vMJsc4RLKbaxQ6YZtpMA23wvvutbiaIi+F13IJC0JJlLWKM68WPJ4sfYNG/TSNRL
         K2H6aFO5kkjQ0kfLk8fwQHa1tcaRCAIrHOdvIBjlFDhi7wMvLMapGL19itcfslf+m3yy
         KJCBDY/3nNOKr9BYoHoqtM06NNYE5GoSncs0qrvcNGe0yh17wM63I/tPSHwWh5ijJzXJ
         IQcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784127878; x=1784732678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DG9Q2oJgppieJnnBNek/PkQaa2uv3zufxUx3ZgWYTcs=;
        b=gJaAIuMKPxXQVyISxn9VnnIyCwa7JD53mV15MdOsW/qk2RMyMu8ECJB1tedkCF8uhm
         dXwsbVshGE8t1vNH1hQHXXly2Ti+jEDYj04vy6oWBZO6fA2TFEM7enXIKQNfj6qyQ1eU
         0JD8/XRbNH1p/SnIdRQB6ptasP7VuF3XPwvHpEE0bwcfKof6b0XFyacVV3zMX80bIuDP
         cSR5jH4JNHUzG1obYh8iwhfMQhq5O5d36PeWUWwvhna7wGHPImmj3ftXQFIt8tKIHK17
         uiRKqdfIRShbVoo2LcJaW0BjYisSM93bqygHZLCe1zDRT/yiObA+zD087fEnF5ZtJhe9
         UynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784127878; x=1784732678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DG9Q2oJgppieJnnBNek/PkQaa2uv3zufxUx3ZgWYTcs=;
        b=FGBVB4zDiLIyxZgj5e7bu17bysb2e7lb/Zq+9pkLdW7GPSS43HrVCTvp4pAceyrgoT
         i+wCa5U93uHiXL20Np8vmy0SveOo2IZvnUq+pdhG2zVnAIO3Qxn7kGihS+yTXAfnnOwj
         7hvfHFMmmyW5iXWrWAVlJ46N8vYfOpJlKqs0+VJw69paFqE4yqJE5vTlsrYTqH/cTb/2
         GfXQD+0g1NOna9lmFvN/2o4Qzxpqg9z2tNKzHGuB0r8ywhyyee73ynvgSzHr2YCIAE3X
         ja1jRU+eHJgttqimdeCNS7zL639RfbuucDWr7MiMu3ybSBf5SH5orQFZk22FoX6QNrNy
         pS5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr1PzZ8YCyX0oukHiZVcBTN3aZcpFl/PpUbWDLjRBjWx+R9NqldTNjBilGuMdYqxJqoDnuly9CYIwyF@vger.kernel.org
X-Gm-Message-State: AOJu0YxIUqq79oqcQJU7/Ml4bDQVvR4Cay6sZSE5aUE5OGFyK8HQrK/m
	RuhSx4fzum+seGDNeh9Sfpikv2daa2YmL38iYdCyQ0MMHAOyC1zsHWv63XAFH8xFMbH31rwcVBl
	pYaHtSdfIF4CM8U2R4Itk4kWnXK6NZLQ=
X-Gm-Gg: AfdE7cnxLsyT0jIBGBBuYGtF8A+FHlq/PElAVL6QmukGuUWr24/UIB/DMiUEsZt8V/x
	J6juFPNphSvnvEoetgYu1qLPGmHd3C20HSW/tyVILIkkfEdU5qJZXTmgN+ZtFlw0JlaQRbyXqOs
	1h/j3aiuBAOJJszY1vuDSjRPFaEalToDNGZAY+XMfe8sAgtSCa8RgdhEACXN8CE/dTGYAJBES82
	24eoNGp1V9vd6lSlBp+0nw7Onup2n0qsPw+JVufZ7XA4ES7AwVKlGJg7r9e7NejqMsm2qYleA==
X-Received: by 2002:a17:907:3d03:b0:c15:f476:9685 with SMTP id
 a640c23a62f3a-c1667a4d040mr437375366b.30.1784127877536; Wed, 15 Jul 2026
 08:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713131223.279555-1-a.shimko.dev@gmail.com>
 <20260713131223.279555-3-a.shimko.dev@gmail.com> <5c95a7cd-d5d7-4998-8641-7dee1e34078b@lunn.ch>
In-Reply-To: <5c95a7cd-d5d7-4998-8641-7dee1e34078b@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Wed, 15 Jul 2026 18:04:26 +0300
X-Gm-Features: AUfX_mzls_I9Vp10-hyrFrNgdKmPyVr__N8ZHCRFExvJHAlqZdwP3XzRo9bwUe8
Message-ID: <CAOPX744Xi8oJqcDHB+TokuRJtY8fqjeuQ=xm2QmLs=PUyo4Qhw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: phy: add DAPU Telecom DAP8210R(I)
 Gigabit Ethernet PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Jul 15, 2026 at 12:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:

> Please drop all this. Many PHYs have this sort of facility. We want
> one generic API, probably via ethtool, which all PHYs can follow, not
> N different incompatible APIs.
Got it. I have dropped the entire debugfs interface in v2.

> This can be simplified.
>
> First off, there probably too many phydev_dbg() messages, specially
> for normal case things, using defaults, etc.
Okay.

> of_property_read_u32_array() is documented as not touching the results
> value, if it does not find the property. So you can do:
>
>         u32 ps =3D DAP8211R_DEFAULT_DELAY_PS;
>         of_property_read_u32(np, prop_name, &ps);
>
>         return dap8211r_delay_ps_to_sel(phydev, ps);
Agree. I will simplify the function as suggested.

> This is one of the less well defined areas. PHY_INTERFACE_MODE_RGMII
> would mean either the PCB is adding the delay, or the MAC. There is no
> reason however why the PHY cannot perform fine tuning, adding a small
> delay, say 150ps. So you should respect the rx-internal-delay-ps and
> tx-internal-delay-ps delays here.
Understood.

Thank you for your review!
--
Best regards,
Artem
