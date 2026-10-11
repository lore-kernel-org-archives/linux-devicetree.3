Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE18314D1F
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736376; cv=none; b=ucAGa0AXYGY0DfpK4BdZqY16J7OAUOXEUoDqjA3gn05n9ZJHlm/KpgUwGeB3FVkXKC8CKu8UDTRdGEn043INz5tmJejjalJVOxImCuUTCeR+fffrpgAJWluZU+i0CQnv2MxiE1vOKMUUVWPHE3wqPZXuNutp8a8uHik+9Sxrz1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736376; c=relaxed/simple;
	bh=ksiJ7Ku4UCtrC0N0jmz3YWLOf08sKJ5ATpUDWt0FsFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G9u6nauL5G36RCqwe3xnwDyDESCzykqBADwDBmfgMR5G1xGwkcPoCM1260ocL8cRMjTeyvQL/k+Onciu9ELLq4S4KJws1bCVll6MBEatqpctLuv8EEiiwzcxoOS5mEgKfW4GmSd25iiJeHCUGBLlh63bPQ6fKF/mtQhecZ2qYfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNw40hmy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNw40hmy"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1101107f8f.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 09:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791736373; x=1792341173; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksiJ7Ku4UCtrC0N0jmz3YWLOf08sKJ5ATpUDWt0FsFo=;
        b=oNw40hmynIT6k5A3rO6aAD8SUzY6NU/0EmKSd33HNs3QgTHBxh8Rl+aUmDjn/z3hFV
         PwqUjlwP+apuVXI/YS98tou91vuosazRgR0nnXRZ8ss6RWphutN1wur/DgasXCUemSoh
         d0iR8EuKvk6WhGXSNguiSYE/+09BvG4tqriPnn5AE+L93S13Exux5Z3uKaC/8K4dLr07
         p6FMgcReuFydDOIqrmwEdDXtQPcQPgSWxJVHJXNhbIstNgWHF3x9kCZLNcf8L7QCe4Y/
         VAwYEeK3c44ZowTR3iPv55XQvUbkOub1zgLSwmdEULUi3pUVbU5UVa25CeGWlcw8QRJT
         4i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791736373; x=1792341173;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ksiJ7Ku4UCtrC0N0jmz3YWLOf08sKJ5ATpUDWt0FsFo=;
        b=OEieZDtEYD3TMOoXIgqqWOq2paEXUcgLoPDb9Jfhd+Q4KJmDdFVr2g+MsyMJLSzmuC
         8DQ1uS0kWCW2oRZL+f3Dw7R9M2TtYDQG1UU7oCT7bc9WAQ7/EbMTchbVPf7e1kQ1Eeic
         Oq4VD7ti6MC6cAO8E0fAb2R14TR38eN1Fifh1HElXtzyNoX7INxaupPI321Zy3hQNQT2
         CwQhUaegEmZQzSLnNC/TWqH80Bm8OxId2r3d8mYheV89tXK9mp5SZysH/Xa0+Dc/DYWf
         XjSyrxBlbpmuijJ4Buz1aW92aelvdg3Tltfpq1pFel4s+hEFQ9RZbK6DixZM0k7NHHhm
         VtNw==
X-Gm-Message-State: AFq9FYJWUxODH7rf0j9IkGrNDQhxNRXz7cbOe/YXDuql8Rb/1kyXobvX
	3OaD8jBVtOB3QGQSPHEDHzy8xkWAjoNuYMeGqDNQ/HaAprGLvx24t5bm
X-Gm-Gg: AYBFou1QD03iYB3E/yDElknOqq1wP/yjWWzR8YGQPbTvPS5CsuNjiZGB6n5GQtWnaxb
	y/42bOgtJdneB7CMfOxJL4LDX0bFtwxcDY3zcXldsz5A0w1bEylgypXv0ubpJAcWhluwTCSlDQu
	vD/u9266o4rU5G5O7nIU1L6/iaJ6xKUT0gJXqNLyu+0HM2QoJ7HvyPvVg4xZSaw0eIvDa7Tn2QN
	LxpmylS8THw8294WX6TKk5hT6eE84V8RAEq0b1tsKutrlzi749Poqm65W7zDANKc+xOh9qJyAe0
	zLeTpQSCwFbig1b8TBt2MIgL5x/HCDzjmVesXXFNhPDNQkfsGrijD3Ae6PZ2Th5dZGXp7jdlwjz
	lWeKnVPX/PBCR/7b/btkHQAIKIYeTbt9/pb020novfBvG3vsRBmBAKiwP1FtQ6g95ogV9NneohW
	4TU9lfEixyTWPq6cWjN8Rz4/CNBGr8AYhYESF6lPUPQteSh1ZWT9aqC6udCRDiR2HvXqg72fF15
	t4Bqlf5agxMwTmSxWqZzd98ShZSlAYn/AhXkyyi9DaVBl/bonqtqj5Y
X-Received: by 2002:a5d:58dc:0:b0:48c:77aa:2f78 with SMTP id ffacd0b85a97d-48dbacecfd8mr10168095f8f.56.1791736372532;
        Sun, 11 Oct 2026 09:32:52 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dba1be42esm16537414f8f.5.2026.10.11.09.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:32:51 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 20/24] spi: Add ZTE ZX279128S SPI flash controller
Date: Sun, 11 Oct 2026 18:32:46 +0200
Message-ID: <QRsVQG8CQny06omTkaluXQ@gmail.com>
In-Reply-To: <20261010130024.177503-21-ghahramani.navid@gmail.com>
References:
 <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-21-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartl3bGPPFXTCGY5ZUHclgI1Q";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartl3bGPPFXTCGY5ZUHclgI1Q
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 20/24] spi: Add ZTE ZX279128S SPI flash controller
Date: Sun, 11 Oct 2026 18:32:46 +0200
Message-ID: <QRsVQG8CQny06omTkaluXQ@gmail.com>
In-Reply-To: <20261010130024.177503-21-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi,

Am Samstag, 10. Oktober 2026, 14:59:58 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Navid Ghahremani:
> Execute bounded SPI-memory operations through the controller FIFO. Honor
> device and operation clock limits through the CRPM divider and cap the
> validated maximum at 50 MHz.

The registers look identical (though with slightly different names) than th=
e=20
quad SPI controller on my machines. I have a more advanced driver here:

https://gitlab.com/stefandoesinger/zx297520-kernel/-/blob/dlink/drivers/spi/
spi-zx.c?ref_type=3Dheads

Please give it a try on your hardware and see if it works.

My driver has optional DMA support, which does allow measurable improvement=
s=20
in situations where SPI access and CPU activity happen in parallel (althoug=
h=20
DMA operation is slightly slower than PIO with an otherwise idle CPU) and I=
=20
tuned PIO mode a bit (in particular avoiding redundant fifo size reads).

The qspi driver is a bit down on my FIFO queue (I plan to take care of pinc=
trl=20
and DMA first), but I can speed it up if your board gets to a point where S=
PI=20
can be done reliably first.

On the hardware otherwise, it can also raise IRQs when the read/write FIFOs=
=20
are above/below a certain threshold. That allows PIO mode without constant=
=20
polling. I found that it doesn't have an actual performance advantage over=
=20
polling PIO mode even when pushing the CPU during SPI transfers. DMA mode h=
as=20
clear advantages in this regard and I found no need to implement an IRQ dri=
ven=20
PIO mode. If the performance characteristics on your board are different we=
 can=20
reconsider this.
--nextPartl3bGPPFXTCGY5ZUHclgI1Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLui4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiohIP/jltt0RdhiQcFCJFiY+i
lBWYzFfkpW0WFbbuaPjW07QU6TdmsxABYgtMo5UywPDwJWTuxuWseKezgKcvAu93
aBjVqfPFTTzLHuLOS9Lvw9+kLzMTTMXNUDmyJdknX6o3MATiXogR65iHx2QLKXUJ
Y7qtesJzGYj6G5HbN0OmNJAv04MR+44AtAkwso0XQQ8okMG/yy9uebCsAGQTCQqD
zWHgbM+m2HAo2cGDAW5VAA49G3GnVUod7kAiCYN1+qwP7/Eahft6Ahvh/30adTTJ
I7StoebO/u6OmOpBrHLNCZRxGX/xZNNYzjhvsNz6cBPFxmcBmXYrs2nSe7daBbAj
tT890gloLO7vRy9S24zRzks4qRP58KjAHge/p82nw4n3lw0/WLrFWlwmnW5taghI
VfIrc51nV9hCh2QVh/duqzEMYSKw2pgf8PETjR2185t+J7ioga4wbMVsNV8FJ1cb
YGD335pLu8UrmU/k7yH91l0NUD4A0szLWfOmZY1bhcm7XD4MG7Yy3UAp1IqbVPb4
es5TEKmpx17UqW8PbxdRqYGSoCvm7PKVxz1W8/L8HHMPFdLh6GFVLn8t8D6ip9Zs
z5pOSJw8bzOEb6eU9zlkJZ1hF0zEgHLd+RcIJe6yEvwcV96D8waWRc8e3FYW5jyg
nGvefMr6NWI8W0ygaYQIDGLk
=l+tS
-----END PGP SIGNATURE-----

--nextPartl3bGPPFXTCGY5ZUHclgI1Q--



