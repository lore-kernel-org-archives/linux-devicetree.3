Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171699;
	b=Vjz5e7Ljiv8vDBOkZcGwWyTgqMmR1Wy2DXtPpnLZ/FG/Lcnosd65Drq1YgmyuJBuh/+a
	 5OxDuAnk8qMTy3S9H6irugktL0BZ4FSnsUeY4v2NLv8eKplMMsn7lsit4WHTXACEbpial
	 n7UT5/Bg24ovLY6EVtyDRwnPk1PoVndd1Nu+nXMYj/a8fu1u+vS8tyvXlX53Ldl18XPSC
	 Qun2yrbVsXaIUBADSVbb47VnJzjmCk0r6Bqkz400XkOxYakj9oE7UIt1cUQDAZKKuYZmj
	 i48QOtjlnXtD9sA1FK9UlCX/4g4IJayoLtrfosifOeP7ShqUGM3HSje0LoLFU8uGp0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jg4X90e3zV23j2h+WGmYwC1M03nD+Yo2HGjKpBKNeHk=;
	b=WnGML69ykKxmSnEF1chf8lXzvTEA0xdnf9MmPDtvYVK4VQO6kp4JociFreiGjZqwhyBF
	 EB/RcyA6dhEt9TvQK3nfvUFQrAtFRJ1aRZlYbiGYa7PPY4Z/sPtToay5/CY8/X1YEjQL/
	 Q6dEMAuHawbEwFliXwxIg9u/7CxlsH8Gg/Ew5vnaGxTFQENYHsK/dHVDVFhaP+9AFWk9O
	 8Uk3teeJaGwafmwF0n8C6rQAQv8jiM2numeKTFzlcvLXkzah8GpvHLUuNlKO45RjqxRKD
	 sIXFJTWLu56mlTTBB39LU1NIn1iIbrW3WeyCCepMnH2POLTsw3a1hK+dMgIzjFKY4xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=bbVzjcNn;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F4606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03F4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=bbVzjcNn
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a357b1c649so339773f8f.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171697; x=1795776497; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jg4X90e3zV23j2h+WGmYwC1M03nD+Yo2HGjKpBKNeHk=;
        b=bbVzjcNnbuNqpM0z7nTqS+G3LVZgd/q83BusWcV54fHNpW+2bZjpv8Z9ITtMefCLzQ
         mnEbsTL9H9gQK/5uGEl3JvgiWDRZP8oZ6ippYELcTU3oi5bjn4h30FI2hoHV3VJOLOAT
         fZQ8nygSRBNq+ahwUW24nOT8rDWlAxQ3n4atQzhkA4tBYgyh8c4f4L4pPjzDllrH3tP8
         J0/z3V9VZX3UDLgjwcDrPUjFSJD+0e7ETw6xhcVbCu0yxDzrWFxMjjbTFqxGg2zqkfJ4
         RwYH27TI4SEg8dWkxOWVVZE0e51b/nuyghMQHnnw36PxVs8bAOEKeKxqIK6Ff7YTY/gt
         mm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171697; x=1795776497;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jg4X90e3zV23j2h+WGmYwC1M03nD+Yo2HGjKpBKNeHk=;
        b=wg93GaXL41xf372QoDhaMio5XT7LjLhVqozhGMEL8KfOBXJlBqdeAqDtuajNOoCtVz
         mUu/vKH9asSoY6/1nWSoVCE2k6qByl+tDNpHu1WQd08NWyRCacnFpp1n3jcqXqSgJobQ
         SXEERyXuIEATRfKVuPgUShl/Vw1niCoLxhaDu8LL+bSgBKWeA8pLle/jbvicb8Zbk2Qt
         /JyooX625o0x3XdWilZ4VeQMFb8S8COS8lotdqKOD3tpiLMxptRKoo52M8fkdNw1lpQq
         5qXvkQz54dpBhObYPm+9xAGUWpZuNbkjn7Y9JAMkbeh/I1GcIy+15CQek+xckqIQZ0L4
         KaUQ==
X-Gm-Message-State: APuU4Z+7V546tsrL1C+rG8BgGiar5qig9ArcMmW95fenlTed8cf2JUFt
	xh/DSmjwbN4RgAvbbAR9oQymxR/mSMP3hIS98KgrDBv5jBmaxs6EpZ6YhWoEWsKrDWQ=
X-Gm-Gg: AYBFou0zynvGQTudymrW3BJajCNxYYr2zvDl92ePCOVc7AuSJnHrMiFwusqL4ibDFCG
	sbhYegoZ0w9kpjVnQUgYnr3E/EWseUUCji5Mt1Y2A0Fxqkw+A+DaubnQALfyGEfbJENSOtCHLwY
	DUALF+zrx+3VsktC4HxZWnLFkSOXP1lOFWXmBqgsRV/FBaUiZIelnTLLLfIwXm8IRgfUywEYGS9
	DgWTYPKAKOmvoFvOecuV9koWEbP6XGl8KscnecVORYm8Ehrv7rLVwRysxjCVePwOsY9eLVoZiz4
	gm5bUDitGSdqNJU6+YNO0pjgvpDeB6gNog2gsdjrYLD7HTehR+gMdQpZcLq8YaT+6NXjZczmhYu
	gPYRBCMOtDzFM8pa8MHPUmobwnYJHtwjoDSs0ua1hkLHRN7qhPXuGrc35R18e0MLjwTDMu5PwHr
	cjSgkhGLtSiChP0e/MTUgukJ1xR66jnL4L6AoiRREFN+R64opqihqELWYfslXMhD1f0HYuTSaQV
	4FPT1JCx1Drqdz7pE9qkctvVlcWZ7M077ftOWQn3ZeI4o3CiPSbW9ZbJw+1qn4eZVy+nb/YFaTc
	1GS/pUrMymTntK1o0vjrbOQZ7/iRJnXHuY7PMy9QZ/KgjhzK2qdJlXpm9L7273UHmbiJZpGWZYX
	s8bxjlU9V
X-Received: by 2002:a05:600c:4e0b:b0:4bb:68f1:5bc0 with SMTP id 5b1f17b1804b1-4bb88920967mr58829305e9.33.1795171696983;
        Fri, 20 Nov 2026 02:48:16 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:15 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/7] arm64: dts: rockchip: Updates to RGMII PHYs on Sige5
 and NanoPi M5
Date: Fri, 20 Nov 2026 14:48:08 +0400
Message-Id: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMD3aJsY1NzM92CjMpiXSNzczMLg0QLc/MUcyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgAJfcibbwAAAA==
X-Change-ID: 20261120-rk3576-phys-277680a877d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2101; i=alchark@flipper.net;
 h=from:subject:message-id; bh=5sdbEL5GXTFR6FwhqPpfL+d2C9hL8olV/xv+pbxWIgo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqOa83X/p5+Hdf6QYbtcl7MnLMPMpkrVNqZGMX/vZO
 XL3wjM5HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1qdkM/31T1u/Ku+Mo29m+48QCYVGeRT/fVDT0XBN4vC77QxRv4UWG/wXinNK
 rVhwMf1V8uTqMR06Sq+fuhprm52yME779v277igUA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Both ArmSoM Sige5 and NanoPi M5 boards use the same Realtek RGMII PHYs
which currently share an issue preventing them from enumeration unless an
earlier boot stage left them out of reset: at power-on, their reset lines
are asserted, so they cannot answer an MDIO probe. Until they answer, the
OS cannot look up the ID to match a driver. And until the OS has a driver,
nothing releases their reset line.

Fix this by using their known PHY IDs instead of the generic compatible,
so that the deadlock is broken. This also opens up the possibility to
enable the Realtek-specific ALDPS feature (automatic link-down power
saving), which saves around 400 mW for each PHY with no cable attached.

While here, also do a couple of minor cleanups: NanoPi M5 uses a dedicated
crystal to derive the 25MHz reference clock, so it doesn't use the SoC
provided clock, and the current DT property is superfluous and misleading.
RTL8211F datasheet also specifies much shorter reset assertion and
deassertion times than currently used in the DT, so adjust those, too, to
avoid wasting unnecessary time during the reset sequence.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (7):
      arm64: dts: rockchip: Describe NanoPi M5 Ethernet PHYs by their ID
      arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by their ID
      arm64: dts: rockchip: Drop NanoPi M5 PHY reference clocks
      arm64: dts: rockchip: Enable ALDPS on NanoPi M5 Ethernet PHYs
      arm64: dts: rockchip: Enable ALDPS on Sige5 Ethernet PHYs
      arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to datasheet timing
      arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset to datasheet timing

 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 18 ++++++++++--------
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts    | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 18 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-rk3576-phys-277680a877d7

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

