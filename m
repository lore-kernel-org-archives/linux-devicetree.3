Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794683009;
	b=Ft7J9/kZZCI8qxHcmisPFUSDXd+I4wtapnksWFq2nRvSdYoIPYMqaaP6PuOE7NYc1ouu
	 4sOUxJWpQ0c+jMbmbGBgvTiB1esCU1HA6Am3SjFMYI9GxmNsAmh3uq00mN/hVhClknbzy
	 MypXoXVe4ovWXuwB40xlRv2k0vZA+fU9Sa8EpRWDZPsXJfpBsnv8NuGuMxE3dpy3B8la4
	 wYwhqImgXquRUGfKGvrv6Tu/KcuZOdtMrE0G7Vmy0B2mTsVLxazziIJR9bObIL3Xlf6Me
	 chai6+BuaGZAzZx2D6sWDZodEpuuTyvco1q8qVfptcDRabM54BEWqWtMcer35QQyehQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
	b=44cKk+MMzMq5ZSJ5+C1ebbIsHZsLYUmyausQ/3fZI2LD7Y85RlgosQ4yahumpoqJmc20
	 hxIo70I1O7algvwvUemkiX3BG8PJx2FlB0eb9VedAgu34o44Gqawe958NBz76erWHwd5o
	 TXlbx0gRBbv5UQh7dLXWkZqOm71kDt91/zCWmf57A53S2s3akwWZ54uopZFX7iQNwYiFd
	 Kl2QDa3XKtrpmQ/JKRq3jYY839q1No9nipAnd3wCZj8lbVpqKS/7CfXdxIIVK6EZfzgd0
	 vVfdC6FviTnLsZopSVnYiPO9MIyMfSIaUdLcxSLUvTFe6vIPl1/8TLMp+StsUw7r+4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ed5/AR8L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCE3606A331
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 19:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECCE3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ed5/AR8L
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e977109392so12021075ad.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794683008; cv=none;
        d=google.com; s=arc-20260327;
        b=E6goXuOO5lb+IIQXQmMidBQjVxW4KGHJrQ3REJKXLNS2JDFaOepnfK1WzjaFzCb0yq
         55xtTffGRHV50DhWRoQbHxOArJgY1mXzCvxOWIAh1sbc7QJDbKciJUCbV0YCKVURpBdO
         7frvmIf4aoVxbHz9G3UiNSszU8QxwMOL17y7T8Rbe8V9HQ4pFPxSQGabAKxgmdImvj1/
         gUIiucbszefs0W3kL3xr7eUjHL6X5+w8lOtxw5/H0cjhdPvc6JBOyt2QQviKRKAHvNvX
         q+fnjUFIXJ3rUj0NBjS53auwaPGGzwD5hyGEuIFiINL7L1ICNlnJyWlcOpSx4IWEuqyH
         oK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        fh=ZWgMJ3BiAfp5Dq9oLzswvMd1qF7swmV8tzg/QhW9C6E=;
        b=jvCDMes53ffcpXEHSvsrHRWK3EW2mZbgVcjqnURrrGXbD1OJQ0JrpzQB/BfltYaWkw
         Yn+IUOzPnsN0Xazdi1G0VujtsyuVM6MaS6YCJBKoukVcHELXTNEHgJiNy7vtk1fB/EDQ
         euwpjGLxiSUU6haz/axuFflX25qKXfLrHiBjaySFZ/THWW9pqEFg8hVRNgGFd5BZ+Yvu
         Mrf3vLo7PEaPxNqwXVjTWr3KhrnVhvIp4V3uTDi1mAlO7Q9whwi6ebkRc+GRiOpeUgRc
         tAH+z12GpsbNLtYEOeLT5f4mIsCRdmxvcyDnrSFd51p3ZjxrkwpSUZcrTc/birrRY9uo
         zpmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794683008; x=1795287808; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        b=ed5/AR8LX1QZTDhIbHcEBTJRhK/otuKy09bVoSRxvd8kBmgwUeOssZgQXYCkbNWurs
         O3Xfr7yfulcOnUSCxgW1aQKeZ3OA31cq7m0BSRm3AMi0tHy4vJI2ecG1kFc7ff9UNmNu
         CukSzu6El2BTqrtQfdgsP8pxSjp5kAFtpLD7JI6ZacmKnWHQ1dOJZ4Ywf6+JIScdzIXU
         R97MZdgGTwYx+iMNuq+7Nk5SX9r86ioR3Yzh156PG7hkRdW9tW5VSIxSZri3ubgujlkj
         XKh+XKpHmx4GZvYiOAHwI3YywCo0ljTrUzKUfKsp7NnI4/yoRGTV4EvNZyOkBQa6UE05
         pOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794683008; x=1795287808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        b=VtUoUd1CLCzAb2N5nuYN/6F/tMrVNh8Ujk2ZPkpYQok7zDYalheXwojjS6kVnEuS2Z
         16WMqr//9kGEF+1KNT50DDMCxFIXZAaZsCkAfoi47h1dP5MK3g64FgDeVIoCD8+q2n3Y
         0RlJrxJ83Fln/Tq0Ej2QeGOHvwrGulEHnZqMuQZJU/yLB0oKHkfnRYF2/sSh+vH6IWHR
         AGQaJU+dxRPMgJQHFNqCP/MoPsjawIkTeP11wz51E3vdpMJdH4JYpYAc6V/VRrDFcyMQ
         JTzst0v0riabXoY/EfR4xgK2uw11Uhm8v/1ehXR2yU4rJZzSc3N8GJp5Tn0O6A7aSTCw
         pmWw==
X-Forwarded-Encrypted: i=1; AL+hErG3YTA/mx5If1tHwEZ/ewBb659pByQl5vlP+IUG2cwKcymqjf8/MWFTeE2xX39cB60UwME8RcvYWbPW@vger.kernel.org
X-Gm-Message-State: APuU4Z/wtSrCe5oImC2KFk+HCH74cjWRm1GKzVEF0YxArnDLr+LMjryZ
	uNpIiMODUzwzXMdUinf0EnpF6KhgRrj45p8Pug+tm+uYxSp1kDbgMCdmbgmVw/wzJLXJ90sq1Xb
	6OeAZrsCuGycBqbmsDiRZdzNb1+NxYw==
X-Gm-Gg: AYBFou2ehxIb2BrnAJa+finO/7yJyD3QNjdMLJzOSr2AG9nrEqJLrqWe649mnLXN/Fp
	KxrFSdddYrm3UpJ5VtgFxwU9EkyuOzIU6WFlBfimszZECLZwufE7Ctpd3w225jEPguVe83axWQD
	tkX+1ewn3tC5xf2IZ+dw0fNWYhRixY3YJU4UyyXUbvpEheRx38Ndq8WhysQDO6PQqMMX61Zw2ys
	ur4nKb3FiPkcg4cgGkS3NBA0BcVy8xlD7GSM5vQe2ZUexbqKupe6UQGxGHfMstN71HaiWLxBTrn
	F71vsCARnkF5X/0S5964Wq28JWU9g7dP6yeehc1FtJp/34Q1XJEREgvQiHuT210zJNUh5vqXzQX
	z2fqm9M5jRU98JSrWy8Tgve0g6nvg6LDAa18S
X-Received: by 2002:a17:902:fd85:b0:2e9:734c:5025 with SMTP id
 d9443c01a7336-2ee0da98dfdmr60035435ad.21.1794683008249; Sat, 14 Nov 2026
 11:03:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-m52xq-nfc-netdev-v3-0-725a61ce4148@gmail.com>
 <20261112-m52xq-nfc-netdev-v3-2-725a61ce4148@gmail.com> <5b31dcc8-8fc4-40ad-8c09-aad8d77965f0@ixit.cz>
In-Reply-To: <5b31dcc8-8fc4-40ad-8c09-aad8d77965f0@ixit.cz>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Sat, 14 Nov 2026 21:03:16 +0200
X-Gm-Features: AclHuK_Q0fCYoqErL7BMlQPVGQL9gfpYv5yw5VBHiZrfm9MfbMBI5fajd-Czxx4
Message-ID: <CAARotke1QDxr1XAHZhDBtq8nSqXzrbZk8pmdyy7ceK9ObBHNWw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] nfc: s3fwrn5: i2c: Enable the pvdd supply
To: David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

thanks for looking into this and for the schematics pointer.

I don't have schematics for the Galaxy M52 5G, so I can only go by the
vendor kernel's device tree. Its NFC node describes a single switchable
supply: PVDD, a GPIO-controlled fixed regulator that the vendor driver
turns on before enabling the chip. None of VBAT, AVDD, DVDD, PLLVDD or
TVDD are referenced or controlled there, so on this board they are
presumably fed from always-on rails that the OS never touches.

With only pvdd-supply wired up, the chip probes and reads tags fine on
the M52.

I'd rather not add bindings for supplies I can't verify on real
hardware and that no board would use yet. If a board turns up where
e.g. AVDD/DVDD are switchable, they could be added then as further
optional supplies next to pvdd-supply.

Does that sound OK to you?

Thanks,
Asdlerto
