Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436946;
	b=CtysTDQR8Rt0QTYkqY52QdTCSGskE6B38eNreqHu+1pkjAqlPvelU+ha/gn46E+IBNgw
	 9MNmzxH7FVDjyeaDJnkRXmH5VT5gIPn9fI7V0SV7CkSJJjPHY/LsXhy5stJ7AfAZXOv+I
	 cTE0bN1EZGDE9xSQctWL9Vx8TZD03Ow77/8eBQqpspSbCMAxEFHjBGkCICRXyDRQ4q7ca
	 VIEvwogBiVHUzAIFCIzLTFDV7Kc4d2/O+p1WbItbpmtkFK6lPqb0zeGV1p7mqMfERPU+B
	 JEsSDYqlksap+/OLaLJqTIXDiaUi6UZiqESiFQMihgnM2srMKRM1uMjsdv2BNGXVdtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
	b=t6QWoZwuHNfYdF+V6PDU57ZOJFA1JyvmRtYm+LrInuGfFMXUUezsctXapw4IzaZiyB2w
	 1dxLbI2Hk1oU3eErrM9QaMBqvg9r1GIQ9DXKqcBF0glNbp3hJVDi+ClPJlXAv8ZVfsqDB
	 nmK8FTokbhigDCdUSEMro21vBf40mQARpJQWJxH7criUT0trHQvwH/Sh690Okx7X3VThe
	 vZ2wvVN2PytOpf0Bc6vXC2oiZDe4QYblrfGhm1bxyY+RQPYNBycX3AfFwq+P5m7NUyroD
	 m4YD/N7YJTOXBUG9iliDIVZX1Y9PXO7txeOVSNvlIfnIt0m6UE33sRojbPDA6sDDI3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="exdAKoY/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF3606A32E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83AF3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exdAKoY/
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2006272f8f.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436945; cv=none;
        d=google.com; s=arc-20260327;
        b=nrAwRCx9euFs5utABX8iCwfyQG/INX4quL3AA1KpVw4RELo99ZULbWF4+HIAPi9Ufh
         L5ZExrcEO+wAymjCJ3zMsJWtYyji3/hcw2+xBUtPrsxxkAZbiBbYFrM3D3MF9zulCkTt
         BRK/ef61oWeUpJYgHxg8uj5HlLbZ0OXj0TQHHugkIiLT8XdUS/0ExYdcwa57pO02G4hk
         ajoArqczr9tEIpQu01VsQskAGw0xgxaRCvu77i3rvdZlL8ewTCcfRepLvsT8MkdSrAUN
         uU1qht8ll0aAdip3/aCvIr5Z1GPzgmzNDFpt3fbMMlWpaVpZhR0MK3o6CyVnGqN/9TV3
         R+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
        fh=uEd8xYuEgi1c/Yagtoz1oIuvhacp8jYSzGi2xrPfX1Y=;
        b=DDwZL2pqzbLqPof6pp/pp136ya/WVA2dndI/Z7DV55HZ0vxpfIjgapS/ii8P+Unpur
         eha89lTunOlTJxWl+aR5n5Mb7cA2jIJZf9/mMXFXW+EdCIxqwwRgb2LIGu/ToDxdrtOm
         5K3kPlbFIMVXGtV08DNYuUQmjDEZtdme2kASo2lDd9zwLguzMecD/frIuvTirHjAOpkO
         RX77Q40MzN6dV1htspru0epUcy73X0xRQkZu/di4x+TPZVoGTBIQEI0CjyKYk4U8YXhe
         2Pg5fbSshjv/pPehuIgH02eWFLm08ACvRCa0hnBwGXv4jJgfGFw3pmL148sV8LXb5jg+
         AstA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436945; x=1796041745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
        b=exdAKoY/Sj/1MXfEqx6dzg3yHAtBCcka/a3q+wOk9rh8sSSJckb+zIRZkfr40oLKVH
         wfDW18ceNJCsog9LvJkKKnghF7uN1XMi7rRx/tO5FjZoD5OrqUrAehqlQ0o+5/u1ZdCb
         GjRUDPBlgZ21WMLM6Qxns5OK/KkgTPAcivTBlc1CcXwqPlJqxNik/s1J7qwpFImIZej2
         640uIY7tOPlp+LT4oahfc1rtLth1nAfWuweJxebo0Bt75ROek64MzxDq+chxxDV2I5JG
         9xX70cNeoctg55raFUoP/6PYAvapBr3jiT2FrzhU8eCeQ+J/6BN/7aeCO6ctwfkxnxAC
         VOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436945; x=1796041745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
        b=gNwZeHoIoz3XKi9g2Jh3wxYuJ+Q6Ewfdw0uks/E3iOAit5zSJaVwevcFBUuSIM6d6q
         uarQs7xFTpmrjYpoZ6TpWcMdqu1cbyBHvmmyqbrpucjj5lO1jNFhpXuV6jpnpkY8Acrk
         0ieyGCSa3scz1OnxjxLt/BFXrqaFs8yezptxjTthC2OwinywL8ixW1jPIJnVCPlp+MpO
         niIK/SI69e6Wn7YN3VbQemN6CyteYj+qLI2zu9ocffp5PlP20aGUDOKtKLlATxlJCFMc
         VO6IU9C03p04hOlLiuvxm1vBBBJ19nD7PkpFUD7xhIS6wKW1JRcaXei0MupPqbvCTmn+
         hobQ==
X-Forwarded-Encrypted: i=1; AL+hErHYgsQ3LFi3+JQu7yEUCRb5MWIC0hYdEabIIyP7SoeJ3b13K+NIVw0HJo0gv+9QpbqHf2Tjec0c+Hz5@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZQZALKfdsulrXWo8HQtuWTvXo3maeSLTicBLFby2xTcxeszH6
	VGXfFB2XSDaBXuIncuq/uypM/DUPaxc2b69AbdF9J9s2brR1yuvfTkLHWBIJlkXiMwYsi0vwrMK
	fcY6zpDjtOYZQ3ySVXyT34RLnFc6KBWs=
X-Gm-Gg: AZFdTZfTwWaUAazYmLvl1m9K60bNNTV5gsv5z2VvyTqeS0NV/w+LMLHhlr2yet1B65w
	xUTkpnC0cwVrJazMPJycfqZwZ/4CjVbHcktyrrh0IoK1LJ5diZw9OBl3sGEHrI+tRU5qGpDJBv2
	irBja3JmWXabJPPkvmzI2/DofelNydkGLap3vUoEucM+xeAKqZAD+XSQfCsXaLGlQqlLjWeQ1pV
	1skR/gpRiH3oLmJ7SHIu/jRIyHUT5ereW7BAVYPMvOUixkn2TErbjB4gZrwC0cXJb6NF39/ln2t
	VoSHxtvWKVtgZYiR7iDRkflgZ1Zc+STqs4frdbyHVR1hAhN9C2qv2sjN1DgMrPWrl8W6eWcYZgt
	ZD68VMnUxbhsbK/nstO0Pc3LbHsnDg+cR6wYT6dUKvd6DrRWDARm0W3E031L5Za9INMMDd+djJy
	aGrn5QTD2ij/AwmkE20ItyIS/lnilowKpz2TPjCARt+BYyMW+Apew72kzGow==
X-Received: by 2002:a5d:5f41:0:b0:4b4:510c:519e with SMTP id
 ffacd0b85a97d-4b4510c5231mr3941260f8f.27.1795436944634; Mon, 23 Nov 2026
 04:29:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <457ae5cb-fea3-4366-802f-f81447cca3cf@lunn.ch>
In-Reply-To: <457ae5cb-fea3-4366-802f-f81447cca3cf@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 23 Nov 2026 12:28:38 +0000
X-Gm-Features: Aa3M54pwpdIWaGuuMBrn27ZxcRZ-1H1x8XFbCBtqvnWS6semHXinABmTSf51p7Q
Message-ID: <CA+V-a8vGO+pf-2fSZ3BEfNepz7wpPmqiRB00MUMWrW87mN13JQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 12/24] net: dsa: rzn1-a5psw: Add support for
 optional reset control
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you for the review.

On Fri, Nov 20, 2026 at 3:32=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
> > SoCs, where the ETHSW IP block is connected to a dedicated reset line
> > that must be controlled by software.
>
> So it is not optional for those? At least the DT binding should mark
> it as required for these compatibles.
>
Yes the resets are not present on RZ/N1 hence I made it optional. For
the RZ/T2H SoC where the reset is present the DT binding marks resets
as a required property.

Cheers,
Prabhakar
