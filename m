Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110618;
	b=xSlDCzO3e8D6ykLvAxQFLWVAqj7CgyTCPNn+w2lWpaBy7FvjISUtFdYG0nw6XCSo6jAq
	 ZMls7J44cE6D241Rjq+f+tsDbbrel9hHGVRWbYW5woii0Q/56uGRqvpG82zfEfP8qHLSp
	 RsaUXzdL8Md0hpNZQCQkOgnYd7/uWS3OffJXUY1Pes4A/1ROO+s/g5re1/RtWtq4ZtyC0
	 R8wFjgQ5Epjm0opyFHdJfOvs7B2qZxNGiQ2dSk1w6S2OzczVOQYRbFCyEhH00wWN9nriv
	 1Fx6WY/hHhz9jPeyQVfLG4hzJ47Py/YEVjKZiRV4Hr1TL9Dv94PMT7lEbsr/JTLn/rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q7g0KHNL5drVX1lZb8pGjmAF0NrBsrB1gG2lDqfKoWg=;
	b=wQ+ylJRj3aTiLy4p6Ef3yoYCBBAl0jeG46cHJgIMeGGfXoNBZ2ra0PW3GENDf28b1RxY
	 aKBLALomEUInCvEaw3OpsjJJP6BbkWBF1KPv3BPPWOWzPkj6cfiUM2ApLxNVJNGcmHDXS
	 SN1GGVlLLY3N+Nj96ekq3B9viytK5VwqKq3hhHw4ATCcRaUyAL3R9DdIx1O5JyPCpPB5O
	 3cKQIYwVa2/5+zCAMcaV/RE4OiUnGQGii7qpPkJrKmR4+skN89rZ5OBGvgUgtLs4UyiBw
	 tTg+NZeIJOcA92zFuXpfcjN06DNJWqgXIwUrYLEL/uanFzELJ0lAj7MLJQHu4OhuDEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n8OX20cE;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2974A60A2610
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2974A60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n8OX20cE
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so21890865e9.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110616; x=1795715416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7g0KHNL5drVX1lZb8pGjmAF0NrBsrB1gG2lDqfKoWg=;
        b=n8OX20cEK3rax+Ru4Z9EgjrB3T4PAKO/53cZnU3yUjRICzEumHI2YCgRq8WNLgRpgn
         OBHkOALaNHdPMil/CNWAGiKiOqLJzmAMh7ZLFtTDEkCKr4fTbnk2bFe+qlXX8Pyz/2+b
         n8IwyJ9QPHfScy+fZ6/4g/8G3Jc4L+bQcFYrMWcFzZ+a4hTyJ9aK+UDSsKfFgxwxBqtZ
         H6w37pNrqwAnN5wDR8kZBRVz0NJbbVETUmjr6wxwH2mNq3r2m2fLiDnEB306wyBEa9ke
         zTEVPvI7K/nreNvBST4wY2esXHwEwn9Xszabzl/pcUNtIHTdrM++u1rwURLk/NH+36mR
         Ynpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110616; x=1795715416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7g0KHNL5drVX1lZb8pGjmAF0NrBsrB1gG2lDqfKoWg=;
        b=rOYaYec+V0z9PF6jhRgEf+iCg76mhtjtkX4xs7Qx9eiKg7FQFUId82UIjnFnvpPRIZ
         zUnKdmne+Youv/k5X2m5BCdZvyAIz+4At6cokbcbQrEhsRXKx0PncSWJakMZDxEyrX1C
         ADgCyLubzcN1BD+mZXN42d5K8GNaKSa5ZBr/MC/Y9CkMhqXG3M1hW31yUEYzsR/S51PX
         +iQ3cZ//uxRQ08EgZliN34h77waXvyi5PF7f/kgdLmLLRw2OqQvCoTG3YMvgecozfr1X
         L34CAl2CvkSpqOCtSPBNL/6/HhknzMdeuowKcRXr0JfvX0UcmryTnNWudkxVpwfYrvMo
         /YJA==
X-Forwarded-Encrypted: i=1; AL+hErHN/IOaAPzfAvOL9fWwmMpo8IPxwO/cmX1MI06PfINamzepSP6+wZUvFMORrp3S0SxON18vYeaL24xH@vger.kernel.org
X-Gm-Message-State: APuU4Z9qDPEixHYTS0jlakyGt/LfIVX3b02S7LYprbXHpKpzg3XajjGJ
	p8KtLF0tzroq5+XL0wyK5ZG24mo6OLWXVMGfBb2HIws6VYtUZoVpKqbwu8HNydsszxo9H8oHdoL
	LvggTsko=
X-Gm-Gg: AYBFou3Y33k+v1JHDIVOj7g+ZsRwb9S/4gDbq5k4btCdvxFowsD2jq648aVpyjm0lqX
	F5zp/R9G6KrlkBrFMKLK5AmviCQoFWubn6GUGUeCvowT+qUXN0NhPVhsZfXFu7k8/clqAAtv415
	a5Vgug6T0NPmACmYFVJfiT3xtlI3pdyhzMOSqM/EDqEURxgrkapW5EJL9R/GgUuWYzD0aa+OBme
	O72vuBrD0pRIntSloAVJIctwtnbQ0fp9ihw6GYJvbfbN3sIEB89Z+rXhA8EwptET5o66zkJ2kue
	rGbrCdhlaYp8/1TdKGjosfubWVF1b6MdRNgJegLg66B4pBlY5E0mk/qpNtbrjvKwZVV81xERmPS
	gceZiUI4bzfknEJNhJ8anG2a7/s7tj6U1osEp6SYvAShvlf7LlVvVKtu37N7FSS41qZDxMQlzmm
	rxPnzwy5yamR4AI5ez0ZeZP0wmN4PWtTvHABJans8J/CAM4+WyXH/SUvEprP0uVRx+afKNQN3ME
	qeDA7FxXNqI7Hkgpnt+cy8V9Xb5z7P1hLgDnLID7pElxakw84TOojZeP1Q4lzPR54IQ3aAqVN6v
	DYzntQrm8p7RF2fdThvyboLFgQiMdSpc0XfAqc5+QwRAs0S9zTTWD5xmBX1HArN4cXzAmLgJlOW
	Wr7JW8UveH/wu33FpZSXfN4Dm5lf3z5oeACU7GLLOjB+oRdF33eD5nVRLRPV3WJAC70P0ImQ+Og
	SIyg==
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr7534355e9.2.1795110616543;
        Thu, 19 Nov 2026 09:50:16 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm66709165e9.0.2026.11.19.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:16 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 10/10] MAINTAINERS: add myself for the cw1200 driver
Date: Thu, 19 Nov 2026 18:50:02 +0100
Message-ID: <20261119175002.458988-11-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver has been orphaned. I am adding XR819 support to it and can
look after fixes, so take it over as Odd Fixes.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e7b5f6beba4..3ee6e717bfc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7209,8 +7209,9 @@ S:	Maintained
 F:	Documentation/process/cve.rst
 
 CW1200 WLAN driver
-S:	Orphan
+M:	Arthur Heymans <arthur@aheymans.xyz>
 L:	linux-wireless@vger.kernel.org
+S:	Odd Fixes
 F:	Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
 F:	drivers/net/wireless/st/
 F:	include/linux/platform_data/net-cw1200.h
-- 
2.56.0

