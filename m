Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CBD3AF65A
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453147; cv=pass; b=nlAbKqL3IS+dTyIuuDKEWCQHIynVXGYdoivUXEzTGRyOI339nNF9ckTuCUT0i029wzdPZ7xIdYdZEuPf+y7bgD2BjtiEnY8PasGPFBEi3sIpDKFcmcyMuAJ1SCqZaI7gc0EXphzPENvADe9m/hyx0SYbL7IRKSBzMjmJyE9GSYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453147; c=relaxed/simple;
	bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Il7+oYe679rUHnSNLLkBc/uZi8dV8hmNsN+ML0g5e6Z/ZoG+30nJraWvTFdBKupOPFx9KvH1rXyg9r2vsL8s9FZQILZMZxYD9Gfw+FDWcNZwhcPvvfukMFlguV6pxVjM6jKSTj1fX5jCmjjXM7s2Z+aJJexDMiqwUanlkm4WpdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=WcsVYiM+; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="WcsVYiM+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so15460785ad.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453145; cv=none;
        d=google.com; s=arc-20260327;
        b=ht6DzyjH16R3trlDUj8G6PeXf27Gl3ZuDiD1IYcw7afC4jy3dCqy2BJemKSmKnvSYx
         Iy3geHFhvSMWGr4r/ZiLWgvxuTuIDTO3xyQEEkrws81aHB1KMJYJucbil1wmXWxMo+2U
         W3z1opzsUpInvUwomEkwXXvrQIL5wvy6tmTO8NNlIqbjKKFPZfioqdE6FKVrOry/8Ll8
         LgN7fgNSURrd0ln0rk7m4GGqm+Kfh6l7fIpzHUBU7u5byG3kSVHMRLDC0MEWnB0a7qaz
         9huAhzAkU1bR+gQpEcX8qBzj7U1w8kYrurvSKjHHAxMGtbBD5IFjcHFua/jBemp8dqvz
         SO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=;
        fh=Zxo8+dpNh9c9tIjO0AdV4du2cXzGZD/ON1AiA1C0p1k=;
        b=L+vMVT9XuaWwfJTgK7XVh1Gr30xhK7uS+p6fHRVUnrIZzNuwy/cCpY8hKxkpwrpBhA
         JkzUNVoLY+4ed63EvSTY55f23HOF7hHxdb0RjNqO2MZA/1s2xy9PnwqBqIzlMMUks+EQ
         993sKlqHjOcgAx2e94QbwfLL7YiMdgAjnjDYY9vFDQIN67KitTpoVSsD/cEyhWuYo1oZ
         RW82BSiWGz8jKJ/D/1p+Cb93GRXY5w1LmjRivIMFsiKxrv0ZcBb+d++SzNat+KrTLB/W
         5R7ZvM4h171LnXzWYmli9beCGfLxOmp/s3rWOdVS818tLOgfB/7vYBzBq/KR2LYPkmhg
         zxtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453145; x=1784057945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=;
        b=WcsVYiM+hhJBJ1RgWZ9BoMx5pRmYMeR6sFwwE+rpCS1le2/LI0ysf3YUGrYEKoey7v
         vvh/9ec3pMQ/pe+AP/Hn5Ee42FJrWC2KTCtdsfs1RbRTEmw5KnNCo7MTv5SD3xu8p26b
         26Yedm+rSPmkTv9EUCa4WTxYpN0q6d/sSuSHW6Vhe1XKoM1yFiSbFIrIxL2mZsodAiwd
         BYu2+ag7SMfgV9qMW9fHiZ7Cxvo4OE/wlZ1C12jVZ8LpnIGhon4+91z8KldhCofMvLzY
         6knfR/Oz2emoh7QqDZmEwtJxZ/ZwtzMiVB/XWBgVrikpFsLMzxHtJ8+XzU2f9Tlz/WDd
         w5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453145; x=1784057945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=;
        b=E4Q450GB2Ez7knfn2oDRQIxYwWOJQZh57GiOvnzw5KsN5yKPTjPcz+JE5WZAtka7EC
         sIiLXlT0/zu8kzuQUhFpkdCy0PkA4AQ6WzMMS7YczxcmCHUmaR1Q9nRz08Ou6t6domFd
         egyVckHPTgtrLIYnyzmdtdED+/EZ/Jk0PpxrazYmmcObvZL9UIpdYwDRcOafIDbrZLko
         9szxH8IGgMBB2kCDe66fz/EIwpnN0X/iKXSyea4a99m20XoX9Zy2/H6tp06JbfWBe2+N
         wXyQg78hVc8pDp+PiOrAci7Az4ZQX87hv3p670Va+w1ZCFLZSpJ9w/5bsjvKvN3Uz1Qy
         oe3g==
X-Forwarded-Encrypted: i=1; AHgh+RrDVVa1qYnh/PgVJTV72+2nvZkATezuRegDHC0tGnUz/5c5ysbY4moKRBT1AK4uJ/BFKN/yVgT3Psvk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkvphh9pJeRnON8tDPAl17rLUnQgI2m+viQqEZLSjZQGDnz5bW
	IvXInjZDsaaKAy+2IstskPwxZwD2mOgxHzlwuNLqX/YpDmXOPHaWZWJ+xhJ169Ad760YQGfoEkt
	zoEB5B/cmKnvsF6G2Eh8cL4cf+meQFRg=
X-Gm-Gg: AfdE7cm0I/3asCz9h2lvJYi2yjm9Tpo51PO6HJpkAMv0+DY78rJWP2PYG8V3Jsatn+t
	lolSsIcfRZYc61hWwHthFKMp6T/rg26IL+O1rRkgY2kqfOA2gxYkYqknNT+RafPSNkDauH0lMdY
	+MTNJZgzkLTsmKDvcBRsbdCPXVmuArqltdrT9Dqy+ADO8vlh2iXpd/VRLlzBL7/KXIfcNfnyKG+
	uU0R4R+M1tbc6vKEdGYsUSueq3a6QWO0Ax2E7YtpeDjEM1ln0r0wzE0oTT/Sh7mpiph5knxyI1q
	fxO/BkpslJtG3GVC7EyMLmqojZiRDa6Mdbw5
X-Received: by 2002:a17:902:db08:b0:2c0:d94f:50c7 with SMTP id
 d9443c01a7336-2ccca8f720bmr37243375ad.7.1783453145051; Tue, 07 Jul 2026
 12:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-5-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-5-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:38:53 +0200
X-Gm-Features: AVVi8CffeiaHURy-2AEleWqNmHrerEbtp1JXKt7I-5nEUnoXQSWzsH5GdBfCNl0
Message-ID: <CAFBinCDq7dv4vSC7=Gr4iqydfnKs96VkPpqzG7w7JVUSQceMvw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: amlogic: meson-axg-s400: enable
 mipi_pcie_analog_dphy for PCIe
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 3:58=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> The PCIe PHY node references mipi_pcie_analog_dphy via its phys property.
> Enable this analog PHY node to make PCIe functionally viable.
>
> Fixes: 9715b01da6cf ("arm64: dts: meson-axg-s400: enable PCIe M.2 Key E s=
lots")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
