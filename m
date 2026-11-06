Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793953711;
	b=d8coAWFfOOoBz4ugxyFMx+21dsDwzI+h8RB9+K1R6FsiyqmEXDK5zXP4o+nRGrGs5+zW
	 yglZ0UhmNE0DdjBojN/km8ToBgQiGnA3jBh2e5NS3GdVppsHiq5XYjRS+WrLLy7QdGama
	 25EkJ0bqdETPPfOHz+2Lkizx7gZFyhQLAzE/qXhd/vNREzDJgb2PhFgDpRl0slqYMyeB5
	 1LJWHVWPqq+jXaPwZVnms+hg7isRSMdx/jd6nxi7aKRtNJ67EG7jyA2QpI8YPEprpIPDA
	 XKBP21LzBu1EZgwztqWfccIw8lYx1cO14gFlgi3axQeVEkyFRZKI+Vhx3omL+kHxp9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
	b=kM65C2meLJt+d3sMexJRNE4CZcaUB4zMJDRhebCNb++Gi8KG+9SoznRNtPk7fUUseGG2
	 BZr5CGaT3op0x3fHI3E7kgbGJq5JrcU7r6ZI9+r0AU5hhiFCfxz11Vxaa/9XchZlwPwBt
	 lwFOFmhB85EbHw9x0xLWETTLo63HEAeJ0EllRNwwxPRPvHAe4uIHQFoHh9aupT3vSpfyy
	 /iJ9iFb2axNGZnek08VY8MbWZcdOXzS8F2P99YmFux2aBCRoX0Zln9a/ppukTGLdapuav
	 znklRLbYLyRfg+0HMPIefwOTVKR3ylidOGHffoRZp+2uJSnvtSMJKEQ22QfE8s7yDMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hEnidWAO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96507606A328
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96507606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hEnidWAO
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cc0892f92cso110145137.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793953709; cv=none;
        d=google.com; s=arc-20260327;
        b=YbjbwMP8PmBbep+D0EUY52cIPTfMPtqR7jPitmm4y/IVhylrWhFvQBuNM18R3mE5kS
         q9P6oEvHmbErscd53hOIGpxANTWXiqvfzntYH4ZZYiv89m0m7MbYwNG5OEJEqTuIGW3w
         TZWDL8MX52QBuAx69LwAwGmEpSh9dB24bPTuPSUvZ08LurCqgFSz2zWvWnD/dA9xV6so
         s7bXeL5hVPiGs7edtf/WwQKSfWiZrWLx1ClZcyGZpzOLHs89dBFVqxXphJz8U+zhE0DI
         N0RxIuL4ahI+WJASytgvuJUQ89AzdFDvdNDA1vSPfle+/KunEJh3pqwL+nDF12w4saJt
         pnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        fh=qgR8OpiAilbsL0G0uFmHGUH+iXpa0UJL9g/IvTA2sFA=;
        b=YK3Dw4x/2o5/onrFc7buQxsHYDCA1qE2D5TNP/DGgKXmltpVjzibPOwmqpFKrg0ETb
         eXeKQiDmEzCXHMCuFUxwFra1B5NTwP4lHME8wxnTxaAVqGE/IyW8mk9sNO89N7wjeCGW
         wKsT+UOVE7OYYGu2v94cw4sslWsvWs/dFiSDziOUcF7AmV1vNviKAThPNJiJU9U/bj2a
         AcZI994e29u7ULGtNk0oXsbs0y2+w9GrZlrUkANfujNt/ip/r3A/SENWvvyz9iLcuJvI
         ozjBg6S2WOlFmtfXRAxYerSaLXA5jbkCIUqDGMIBYYZfnZBtnZAXVV8mod+PQT8+hp87
         egjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793953709; x=1794558509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        b=hEnidWAOoNvV6D6mWgt+NTpHcZsp1xjMeBUNPwCRx84h3Jl3GOUx2gQELSrYjSaHDi
         0W6/i3x9m7UqYVVbLBvHz2w64pYRbokNhn75xH24jGXObbpD2fhhjjAMGUSvcrVrDTVa
         /jzoJDlBRtagL/bc4wjkluMtwu5D8SBRih1UZVI4RVmLaqhmrJ/Vk026G/AjH81BZmlO
         QEc4CbpBUL0kFeLIGY1qz8yLx9/OsaJIeL/dEBlW8nKQMovNTzz2fFn9B6LdrqIFWCm/
         lxdV7eqo66g0eXlu/08mtdtpfyGnDFYhuMUDCwkx00DM1SKUJ9N4cKOOrGXQVc0UHnCy
         Txpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953709; x=1794558509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        b=XQZzZ0Dvni0GCAswP+OOHrKMxQy7adUBE0aFVDETK/rNn3mq7XQ976N3sjpshAusUx
         0MVDipZ6SftPOJvNuQA0F1SAYYGxiEbu1W70G4hmRaszlF96lzS1ov/ZCzf5GGYPIDCi
         wrOs9dtsujuD/4KsqY1rj6tR+E7x2mPowgmzCtM8xKOk+/S+QBeyfS6Lk32cUowgCIC7
         /JggZSHEZZMgq82WVy3A3QV6cK0fy5t+0tK7C2dHemaRIGfhiwlqoojzHIZnuewWTMHD
         8WoXgbbAkxwJobTyhV/NNfcJUUcVKsiLVjcaCh1E7qQoTH72w4Z74uNy0uN8Znb0TKOS
         9IgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcQ+xwixhcEzM6V+fiQtuUmKIvUpCw0wuryiaMNcfsowEuF2RSHCYqqzeFj83NjPJR8kIKoLEmLCd+@vger.kernel.org
X-Gm-Message-State: APuU4Z9PM5ijE0jb5cVC6lCnXu0Fz5kdeGvHRPv57U9hsmfrQy/q/t+B
	35Deqy15UTDPd1wd6HB1o6lKZXWueelC2HT4gyK3xYoHC6qWyyp3mdzG/hQm7xZt/PmQdrHTyv4
	+gYNc6XlILaYkw2xjdvMN4hvJvnoQezE=
X-Gm-Gg: AYBFou0EwRWVciabFvtGJB0CElemYY0SLrQZBzrVed7fll6DR4L2Ulk9b0yoZHdXxRv
	87xmBR+YQzIVB77Clq7FOiYyVlmaNMmSGcHXOM52qxl/TcIY6LiVbDu0TM5nOuGLsRgnVQ+Fy+X
	DYJKnsfWqG9ox0iZyP/yIpiZ1cLoooRu6xXoiJGBNhbu0zmjvnHves9dQweP+hDx2wD+Vflo4xA
	ZSxV6G7P1uM7bBebgghl+zL5s/uvtHGKgFrX69lMIIlNbv3nzWqdibIvOux6h2IpyJO2RUET7b7
	moAHTqTH8ish9ihzZz92NoNyWohhuyawzZ7D53LGjrpb0nZ6RK/7IA9nKva3RZPEH8SOyi+kDfB
	1H3WIsoMGDvYuZGOvua2bky67K2NUCyr2vwT9wwA/aB9+KLMjxjhYQ+ObxRkpAorjCCHipLJTRW
	V0Doz8scqSR0pi3Hk4lrx603/YsrTpqe1NmX8RVKih0nnKAULsvWiuBXX3bVY9ON70FHtZHGWiy
	uLdbi8KJq4FF3R2lNd30RrfbOXHVw==
X-Received: by 2002:a05:6102:4bca:b0:7c3:8150:83e7 with SMTP id
 ada2fe7eead31-7d2a154169emr1074240137.9.1793953709418; Fri, 06 Nov 2026
 00:28:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
 <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
 <20261106-crystal-flat-caracara-ac1b3c@quoll>
In-Reply-To: <20261106-crystal-flat-caracara-ac1b3c@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 6 Nov 2026 01:28:16 -0700
X-Gm-Features: AclHuK97Q_fmR3tCSb11vsNOkfJ9UktWDyo2C1YoKfEXjUnSy-Rv88kHCKF-O1Y
Message-ID: <CADvTj4rYG01pNxZS3FAKzHw9yOO79W-zMdBzaXvV_hrMs+sp2A@mail.gmail.com>
Subject: Re: [PATCH v10 20/26] dt-bindings: mtd: sunxi: require the H616 AHB reset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 1:19=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Nov 05, 2026 at 11:55:36AM -0700, James Hilliard wrote:
> > The H616 NAND controller needs its AHB reset to stop internal DMA and
>
> So was the device working or not? Be explicit, because this is an ABI
> break.

Normal NAND reads and writes worked. The failure was in recovery after
aborting an active internal DMA transfer: the controller's soft reset
could leave the first subsequent read displaced, sometimes without an
ECC error. I reproduced this through fault injection, not ordinary I/O.

>
> Best regards,
> Krzysztof
>
