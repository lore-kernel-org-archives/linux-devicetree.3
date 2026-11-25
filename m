Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605912;
	b=MLIthEqL3dKp0hr9zlZY2Da1DRHsKI6XdVL41jCVCyxIzTa4ctrTAwiOEstd0LWi+4yB
	 0rhInpKrYvq5ZvFpweaS4eEgH78IymK8KEfiafetvw/gIpJDmyKOv0a6m64k1WcVRO5MM
	 j14MUeP6FZPTfuIfkL8aC7oi7P9+cXNQ2ySS+ZfGePedR49u9SGl+FHM0Ap2gMu3+LKTM
	 vyDu0qZlAHCjevu/T1MvrZeM4Z/kKkh7btMuhB0gJBkSroqiNxP7wGyf3bSMr+LMZdCLs
	 pttir0avGewehnEmpCiENE4Xf6XM0tOz5P/yrAB804irf48fOw3AAI5r7oRJerzzrnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
	b=B4BXB0B3DvaH8O+eCMLrVR6jw9r2f/sNvLg0R3vn0MZ3vAsI9Us01U5YsFG/NXOiqiRF
	 cZr631NXfsGUq+SHe48ZecehWj70vpR4EbK9moeMfZ9u3Pzxr4z7gaMxekRxDuA0tNhZh
	 UsMfl9koAybHxeNf8yGTgXpq+7Ux0wkVsI7xQjGmE0+cFNjCKCDUlAZbGV1moTRvOtwTq
	 pL4Z4Sd+MLdaFzogR3N6EF3D3tOze8f/2YlljTA2442m1znUPucajINUvCY6zziTzwlG1
	 bf5RVPii44RHrP+LF6prluvl/bqADQVB1tVWS7l0AEcd7Gt2NyNPxHmjziEiIGW+F2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BHvkk1oj;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D45606A331
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D45606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BHvkk1oj
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3afa1c39cbdso4126491fa.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605910; x=1796210710; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
        b=BHvkk1oj1N/Y/8xVLUVFziJRf48T+nJE0q/VVrEXN2K60+RdL5nKgLVeA+3XsY4TAU
         jIA28ewYUk1qausk+ve8RiSz4aRkkDp4d4wPbSkv1RoFytrvlEJVQw0kBXk7qNxH4RKA
         pYQ/keaOTkT2Zp5+BZs8SMJZHwt7xRy+2bL9l2z1NqcKTs5s+pg1To9u50cg5GcLjpH1
         xjYG3YUkLpdTsnsxmGljo05ebVVWSFaK4glJS8cTg1BeFUMM9fzjMvZM64mMpOJEN6Ac
         HJU5xcOa6jUohhpc6s+uKPlog0UaEoCs+xbNCRQ1+SpG+fp5JxNINHyC9SuH5AlLzNsJ
         qF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605910; x=1796210710;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
        b=SjeHJIpsfRVLgnyGvDC2WoO5pBuRoSYR4LUbsJxoZsUE0l5xjPWcabhzjJaXVGv5ac
         dD3AyxZhmoSP1ux6RPWGOkVvFYru/+VX9SdfynH+YL1gIlOkkxU7/h96jcYXg479rzK7
         MWSSPLKO1lh4Q8F2gNKs0MdJcB4jLuXcmF0fBriEqsVnUnVyoRK6CHwaAtxHv6Occ1FH
         7xV5M8kWS4Datf5y+mD58M2mDx+YtU+Jvv4fCIbghc5H4ckpLjd7YKGdd0Eh95N6MKh/
         Cr47pm8FReF1jL4oEz9V5FVQFQsl91YYFGMxAS68kibpKSx2zUqIS3ZO2I4J3NGs5hhz
         BsYQ==
X-Forwarded-Encrypted: i=1; AL+hErHfwFFhknjGZXUp3NElpGIOCYl63uZuRzw9yJ5fyRhv5Jy2IiZjqIEGXdckxUWG7CAYEpC857f7z71s@vger.kernel.org
X-Gm-Message-State: APuU4Z9sdl4uaHF+kVQZl6OYyhx2rzItXguAdVmTGCrUEowHjl73qyNG
	np/1Oy21YaELCoVjsUK5xCbxZ4kbpFc39+LAtN0PEBj3j2UroDWJifIJ
X-Gm-Gg: AZFdTZdOZGcXVxWZiX+YZt1s2okrpn/2p/LVhxtmK3E7n/GRbZ1i1gL4Nkze8Ut82QJ
	ZGKklFnetrVgEiH9aaZPh7xv6AkNOq9t8Qkg7OwoyMDL/jAsofk6R5N9gPFLUjXhM8VBUShvzUG
	dw+4egGf9FMY9pjUhrGhP9hWYJEdvjXNeTRfRy3qI3MuojGY6C6CwTJoDmJ32fMlVdBTXP9h+N9
	oPdOJI4a+ysbS6XzAT7LkeTTcTIEbYpjj4qraAOWjdMDngJJA8FTm6zyQCingk7SJ+dpLWB6EJA
	feaLe8KqGf1Z0yybK8u1iiyBQCIWioj0slgyPDH5T6PLU19bJKyv4bqWwd2Bqw1DNQRp7YR3Vx9
	155qzQ/yqHG6h0XxhZOCCd+kYyV8eFZsjFnPOMAOxPw/Zs+gNUaAkzwIVxOBk6aIbeI20zNnKZW
	qN+WjbxJuP/TKxa/y9BkpF/Hj1IhWKpfx+2Buf8RsKcTmVKioplcZhL5Sjb1+PEvzBE84ZPyiQo
	FlRWDYwynGwMmUA5sWCXWghmASTSHY+18O8tk03uzwlROT0f3qjbgdXBQpxk+jL5HdLqG436PYu
	QC46uwRRPbv9GSosV28OLV0aoaczFpyDKp2qa5Z1X0uSuzz1jNx8DEMem4mPz553pIBvjoZ02ty
	p
X-Received: by 2002:a05:651c:419a:b0:3ac:8a38:130e with SMTP id 38308e7fff4ca-3ae7fa692d5mr46457601fa.21.1795605909904;
        Wed, 25 Nov 2026 03:25:09 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ee572sm45958281fa.10.2026.11.25.03.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:25:08 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next v2 2/3] net: cortina: Add CS7542 CPU network datapath
Date: Wed, 25 Nov 2026 14:24:53 +0300
Message-ID: <179560589359.3.5378747793444153378@gmail.com>
In-Reply-To: <ef5dea6e69e0947489f4825540d0f77903960f78.camel@pengutronix.de>
References: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
 <20261125-b4-cs7542-ethernet-v2-2-d0ea3c6eb375@gmail.com>
 <ef5dea6e69e0947489f4825540d0f77903960f78.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Philipp,

Thanks for the review. I'll drop the RESET_CONTROLLER select and both
status loops. The provider polls each of the seven reset bits on assert
and deassert and propagates a timeout or register access error.

The individual asserts matter during teardown, when the hardware may
still own DMA buffers. For example, if the QM assertion fails, bulk
assert would release NI, FE, TM and SCH again and skip DMA and XRAM.
I'll keep trying every line and leave successful assertions in place.
Any error keeps the active DMA mappings pinned. On bring-up I can use
reset_control_bulk_deassert() for the reverse order.

The 100 us hold was a conservative delay I added during bring-up. I
don't have a documented minimum for it. Cortina's BHR4 U-Boot toggles
the global NI reset bit without a delay, but that sequence covers only
NI. I'll test probe and rebind on the Almond+ with the delay removed.

Thanks,
Fil
