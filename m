Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87930ACE6
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 19:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786304017; cv=pass; b=piyoydUXqQM0PUIu8zdBT/3SMv1VORR2ycqwUz4g8AOU5lfK9mF10rEKX8pimcXcaktZUFjMnXlGos157bEoGCoZvAq2q7ao1fuIbeXepOVfmBXdxz4UFoI6Gkas55uSDfwqb1NAcN3UezbSilAkkMODLHUTO1iOPQyjTqwVE84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786304017; c=relaxed/simple;
	bh=RPr4HbeOYBx0UUfRs5eyQeh6mneGGhSTFXdVw6+j5y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpbYMfetxU7evIOu39VX2+DwuORGvA8x9h+y5pFAUkR+W9Y/AaIFOs9LCTPR4Bo9Pe8ggHh09y6zakzodMnYFjpKCM7FP5BWXpFYOQpZ+D8aaf7E1yq7YwqAoNWfmTxjkkWpMLuqpYh+5QZvnug+ACzSEMp6R3Mzcky028Nc0mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGchOm0l; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGchOm0l"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-979dc8b391eso537752241.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 12:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786304015; cv=none;
        d=google.com; s=arc-20260327;
        b=DQS+yrDfaRZsdppXZ2kSAWTT6pG2/93GT/SOJ+wQmbDOwd2/msIyS4uJvst289Mg+J
         fLSA8myHcwcKRvmaynhA6Pe5CqL7WR8bciouAuibj8JjDq55EbBZYoS7hxE5nP3CL8f1
         dorJEOlT6iMJLV+2f29uQp4OgcqlfedAt+s9N9n8lCJ+f2wFDN44wobsc6z5nUF9Vwt6
         d75Zq3FKz4BF2b/U7Mz7iA6zQUTGDkYxzcpuCxYkvFsYN8rp0PzdnzA24PlbPu/WwZzX
         Pu816LU5mMB8n5c00thUO+g0VeCy3923Il/vA0tA9W3OTG0LY8EcpAdmH+u6PJLBfQpf
         ggqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TGS68oaa5am41wZZT817t30c1pv9fxqQGsu7xsnoMpU=;
        fh=9DXE+CaiyNUye9HhTsew6dnTAw6Wx16cGNYYACd5YUk=;
        b=HYr4vmydTMj0cAt6rXLGjP49jFl7L5cvlxMhkEduGthVGiGuHVE10t3uUF7CtspGOX
         RBQBexYr3U+Bb6wjwpOUnZ578YSZ4F/vJYj08X8JwMg1RREexmTYCJwZynBIWu5WKPK3
         BFZlhuVI99yrzvPqkTBu2xO9RALDRhuOja9EStNdPCXp97v7QEh+cClGpDGEIyL5bxKB
         ireN1Kxn8R3PbR+ZxAHmppsl654VIC1BYeNhPJagUSszwjWaoQ4qeu0PWEXHELfqr0QL
         tRR+dvUNqa6bqsgDHpcDQepFsBSI8MN/LiyyJJpvWJDcDucqXP5fI7bMXGscbheacWOA
         Bm4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786304015; x=1786908815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGS68oaa5am41wZZT817t30c1pv9fxqQGsu7xsnoMpU=;
        b=dGchOm0lZ3GI5CKC/QppD8tK1h1Sl5Phx79Rn0lUGlvzBYd84feRbiN7LBtjwbsNpb
         FBGYdCpCXdONGzxn197nWUsLvIsel2ulXVGAJ2tkxvOm8PK9X25kPux1TusxX/j+eFu/
         rTBJ9xekAU9zfzkzKmjwXWiR9MPr3gcjv7EygW6At4KrS95V0AgF6VVXZF9CsNo45bj/
         D1xL+l8hQ0DG9dlz/GcjCAayKhx6Vx9jnFsmBbRarPUet0uyNnY1mkXxzZb0DruLq9fl
         A/JnJ2EYoiGltuT8FCWIEYv+QQOIOHgIY/D1Hq74InEU34txdJ2LgPQZcVNV7P+098rJ
         6rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786304015; x=1786908815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGS68oaa5am41wZZT817t30c1pv9fxqQGsu7xsnoMpU=;
        b=AFYocGPzFgrXWyHtFF9cn2k4IJ0IOHyhqNiqK1BdLwv7dnykekv84WDXCd74fQstQ1
         MlL94DgURlB21Mu+f0bu9ABXTId/fXLsdnAQDOP42B/c7Rs3VQY65aYPVj0sYUhO3z8f
         eLbD2P07QG0kzb1koZCC3deSKpYpdkT+XsODxJKQpPDXa15fjFjYJQgjVOKur9hQW1mG
         iyD6NlWZrw2Z+G8UlM/IXms8MhG0PsJPu6YaEr6x8rD4eyHpDB2TDCADesiUVjvKtxYx
         gJf2EuWBFMKmccDd4wpLkkAjBT+k+dl8aU/lREvV0MI7kJpX79vXSh/g51HNERhxPJM1
         zudg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+bPr/ABP4uYrw4zw7Po7BqjjrAJPddaDAgazlmQaEsT9OPBI4uSUlXeeMb/HdtTSEb5QQzH2lWoBn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9F6ct2jH/CEOjb2agkr30pUx1XQfMdwT5RBeFmJ8BQk3j1EeI
	jpaCD4EIO9uvFrL7r6OZ44m3WPYr4ChOCTqvb6un+UBWW6Zzz5h+3UsbK+bIHnpc12qlbpanIAz
	cLOICvwVv9EKn5KKW3Hl7zPhS0bcX9xQ=
X-Gm-Gg: AR+sD10aE/6ovHPbM+l8sYHa5auMscufre+kDHP89ygHPoi10B0HP+S/DwS5cqJROnI
	boiCEXoVEtiepCOk/XwnEpXN0kJabpFz9naGi+ILrsrF6+LTyyBKsCByDUgVkejPEPhYbbFaXYc
	ketjyBC1gHvtai5pmJvEkGL5FdW7Rl6SVTOIoEkM4YmI4FQ6SxGTw8GAY2AwZd2hfUnY7SikFYd
	EJTaj4vXI/iLzFHpL9lDNO58MvUxmX5ZIycT7kC+LgjQO9Xx35J+9HCSKOU68qwL0oWpcleWalB
	MB10hgfNQi5qFahbB5QSQ6bIGXhHThjsstC2WIUAlMCOQreLTcWro1li3af4A1b/R7LWAUzqoVg
	UU0XxQUEza1oKpJRkg8xmFIEPBLidV40oEKCCq/JW7AUtrJmhXSCCvWdgl/7dcodn4sOliTIm9W
	KgCtSXvAdicCPOY0IRjofQDiA8m9uOEt9/0tWlMIsDY8xnrWQ=
X-Received: by 2002:a05:6102:801b:b0:744:dd70:a364 with SMTP id
 ada2fe7eead31-7634d10f5c8mr7573848137.9.1786304015056; Sun, 09 Aug 2026
 12:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
 <20260806-submit-acx00-of-dynamic-v1-v4-1-9bf2f7441632@gmail.com> <0cdd9998-51e7-40eb-8c01-54684f6944dc@lunn.ch>
In-Reply-To: <0cdd9998-51e7-40eb-8c01-54684f6944dc@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 9 Aug 2026 13:33:22 -0600
X-Gm-Features: AUfX_mzOq97FjaI0PSkDYysmL-_ryYIJwwwtqJFoOnJ9tJbRQVWAa9v1yb6KcCE
Message-ID: <CADvTj4oa=G0WYAG1Hw9se3dCXxer24X-L0Oe2X-D14m7FpLOFg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/4] dt-bindings: mfd: x-powers: Add AC200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 9:34=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +description:
> > +  The AC200 is a mixed-signal companion IC containing audio, video, RT=
C and
> > +  Fast Ethernet PHY functions. Its control registers are accessed over=
 I2C.
> > +
> > +properties:
> > +  compatible:
> > +    const: x-powers,ac200
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      AC200 input clock. When using the Ethernet PHY, its configured r=
ate must
> > +      be 24 or 27 MHz, matching the rates encoded by the documented EP=
HY clock
> > +      selector.
>
> What is the scope of this clock. Is the PHY the only consumer?

No. This is the AC200's external CKI system-clock input, not an
EPHY-local clock. SYS_CLK_CTL selects that input as the source of the
chip-wide SYS_CLK, and the audio, EPHY and TVE blocks have separate
downstream clock gates. The audio clock tree also uses the 24 MHz
system clock.

The AC200 core therefore owns and enables this shared input. The EPHY
driver only checks its rate in order to program the EPHY-specific
CLK_SEL bit.

> > +  ephy-vcc-supply:
> > +    description: 3.3 V supply for the Ethernet PHY analog front end
>
> This sounds to be specific to the PHY, so the PHY driver should be the
> consumer, not the MFD as a whole. That then would allow the PHY to
> perform power management, turn the regulator off when the link is
> admin down, so suspended.

EPHY_VCC is specific to the Ethernet PHY, even when a board connects it
to the same physical 3.3 V regulator as other AC200 supply pins. The
regulator core will retain the shared rail while any other consumer
still has it enabled.

For v5 I have removed ephy-vcc-supply from the AC200 MFD node and moved
the supply to the Ethernet PHY package. Both variants now use a common
vcc-supply property, connected to EPHY_VCC on AC200 and VCC1 on AC300.

>
>         Andrew
