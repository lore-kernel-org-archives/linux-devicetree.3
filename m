Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036D426D1F
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050186; cv=pass; b=lCxY4WcRDgMJb+k4XpGWRBEIN1jWinY2qWNCotIt4viM637YgHXqBg0qBe2q//qdAPS8ldQ8MIHLRGZgRobY18xwzaHqqb6jjFHPXDsv/eKWaNftk2ro7Hwx8iVbWtiADskLy6RdHergwtMDMt4Jw6kD68OVqxP+d0KYh5SnuKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050186; c=relaxed/simple;
	bh=onN8FIFbQtcTOhoy8vCDtIf/NkLSgG6QTTFYue/FmMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3dB4ruBFCNSJPJnPiiiE4veS+BpW5AnN6LJBZ25pbL4q9mKm0la0mMXu1K6c0jh2QWONg8+mVVf3EFNfnWEl8CazssWGRce8o+gE49tlnv/fIU+QUqeSRNeASmSbK3rerzPqVIOyjFhcn9lIDsdEvXSxzOargvAOo6DtPLddFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=gilmore.net.au; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=UH4fQzKH; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="UH4fQzKH"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8a093c784b0so7652796d6.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 06:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050183; cv=none;
        d=google.com; s=arc-20240605;
        b=cxL1HB5CYsVYFjF8u+tUNkISDSibe4fe/7YmvU73ln5ekBnXPECTb20JO2vCSQ1xU1
         ZzC/XPvtLuXGLx+CT648pSkHru8/ElESHlhAqXG4IVie7vKaEmuoTvRw4ZL47zZxxhGl
         UkQhVF7StrhGuvi5rZHNczElij3ri5bwqqhM/iOYHBaAiHxaofDpI8RRyk/nHuMasJQr
         JittKWeKa10yj8uqu5L0d4EA7q5EOvObP3yLnOyHxDed2xoMB9L60UtSTVky+UZE4kje
         gaPrQC1jTUPYXy9/dwffLV8NyBDhsfLPLPCJ0Nw2nabt0MjA5JKEElfwdWIR4Y2TTEus
         Bu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VddJqdW/ivYdJwKAv4x/MZN1YGeGSQIg3wJqceIORIA=;
        fh=pQDVGv43L2mUD7h2Ns/2cZceQWMngYGwVd02BmCBayI=;
        b=RlCQGB0+Y2mYoGoYtN8WKUUOJoZY7uVBYAccBFbPj2gMrBYHh/Y+mCIqcjqOcZA8Bw
         fwI6tXvEiyRpy3mmEsxmNdmtX589aFdvOClPDhOEX/KeE+4XvYya5KpweVhjwQQ0V4Hv
         iWYUoKRwhilt02JHbRkziBIhIyoDeL29t0/yDA8u0RAUIkYze0rKy649YMfLAfXtM64H
         Q6qjCjWE66iOQtViozvlzLJ+hIGDavR/JjY8ofmjqFcJBeYFhDRuETOAsbyc8nSfINLm
         vSxWFCpFXhHR0yzZHwetBcLroz8nSeJhWIZWsrIWrW5UI27kcMjN35NBwMFU3l2JuSTM
         Ahjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775050183; x=1775654983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VddJqdW/ivYdJwKAv4x/MZN1YGeGSQIg3wJqceIORIA=;
        b=UH4fQzKH8GPtCXQDUHHbhsZ7l5t0fMQqLfZoAe9w+uzV7rn3SkjS/czYZlf2U/s0uG
         VJbFoeusYHl+nHOJwTe1l/DIYN36GyJ4+YksVnJPRF3LxnlcLW1OCgOWFuaQxzGjKHI/
         0QHTqmMfeTpOr9NcenRrMjTOGjyEovxgFWcope+NgeZXM56E3um+9zlBGuekayRlPXqA
         wly6djzUFZcEWLutQTvBhTtyOnbhuWq9ASbWAG8nYfmtRmUmVNYk4eVITNhYK9fRTmUg
         PO6HM+nel8Tl32P0bAeqvp0xc5rCRn9o1KQBTv8w5YcpOwCbHeFu7oirbkJfwKBvfkz3
         Jh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050183; x=1775654983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VddJqdW/ivYdJwKAv4x/MZN1YGeGSQIg3wJqceIORIA=;
        b=q5BWH81aqqgdZ8EqZydDGd2zOBviZmwf/yWGJx4rCwo+nPF7USMFwa7bBwD3nSnwIF
         v1XhfjYGbYGd10gxhoawvgFTVCVdRQlr7aBcWr/kuCdKosT9erxhYGy//kja+YW4PfEl
         Edk/6MgjnWBV0fovSWc1F3KlEHYbdJX91hnA1EApSN+TeTZv8lxDgqegrav2IiJXa4PH
         XhdG3UXua4jYuZSMXVjenwuUAs11wPmNN2omce7efpKDICt1oiOs/DK/tPXF6oMLq6kx
         prXtlF10Op3cyIc6MuBxbqUPBZYfPHudTuKjCLoAOm6rCX3iDh0EjS9DEFg7dQc9Gmxh
         WAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP+U9qIXlokYaPrGkSqOGNznIre8UJwbeZbB5ZqFCI5gBMcghO9EeJwBhewzCNl3rdgmd3ydXsHtk/@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1D7qIn9Jw7ATcZZ5T79rAJGcUMWYTAvKSyUZJJ///G05TcDt
	L6LiiTxqiFoN7oc9NM/C7+Vuj5M8voY7havKBzmeqPrV7SvMplEL2C0r/q1DR4UqWatcOKUNJUJ
	/sqv3ZU0FUlcum98xCxTXdt877CTjREArPCdqVMUmug==
X-Gm-Gg: ATEYQzwyrv3dRtRYgHPLlAhxYtqDTGmFZFqgUDk24vy/RnABBrJkFjdgTfYSeD0ysaj
	cLxXwKd9hthcGeY9Jm9EguD7iY8iWLwHKVQ5XFuGZI9LfruojbBI3IukLvYvfpL2hkvAUQxgYLh
	0oAk5IqUeh6iAzgrO22vqxcgCGVt6zpuNFSoD49SePsdLeEteImNxt2DxBPONE6AyB5r+36o5le
	2FygsGH1ckwUyWuhABAgTyHGtzxaTGAFpQl4gnf1+x6DBG6a2lTZ5tRTOd32B5iUWxuvh3mYHdd
	u8z+W2PvxpBM7q4FDnXnmJhQJ30pl1HFyk085CF4erDFUZhvgrOkSHgA319PbX3DZNtu3m0=
X-Received: by 2002:a05:6214:1304:b0:89a:14c5:f4e with SMTP id
 6a1803df08f44-8a43a273786mr51708376d6.52.1775050182430; Wed, 01 Apr 2026
 06:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401010707.2584962-1-dennis@ausil.us> <20260401010707.2584962-4-dennis@ausil.us>
 <7c4791e9-6621-4afb-a166-55211b18fb08@lunn.ch>
In-Reply-To: <7c4791e9-6621-4afb-a166-55211b18fb08@lunn.ch>
From: Dennis Gilmore <dennis@ausil.us>
Date: Wed, 1 Apr 2026 08:29:31 -0500
X-Gm-Features: AQROBzAu4N-C5ikXx_bUWzY21o8WyoQ0kn_i1gnmUiRPmbCXX-sUt6a9jBTZs-8
Message-ID: <CAABkxwvfCYqN1y+aVUPVP05uzoGNEitC-BVjvAXL8ZPgRHav1g@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Apr 1, 2026 at 6:56=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Mar 31, 2026 at 08:07:07PM -0500, dennis@ausil.us wrote:
> > From: Dennis Gilmore <dennis@ausil.us>
> >
> > Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
> >
> > - eMMC module, you can optionally solder a SPI NOR in place and turn
> >  off the eMMC
> > - PCIe-attached NIC (pcie2x1l1)
> > - PCIe NVMe slot (pcie2x1l2)
> > - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> > - BCM4345C5 Bluetooth
> > - es8388 audio
> > - USB 2.0 and USB 3.0
>
> You said in patch 0/X that the Ethernet driver had just been
> accepted. So i was expecting a node for it here?
>
>           Andrew

On the Orange Pi 5 Pro, Ethernet is connected to PCIe; there is no
need to define anything

Dennis
