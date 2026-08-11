Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763DB3EB100
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477033; cv=none; b=Dh5K7pC+CrCxKRNmE68R+q/IuYH9rQ8wvTLaToGt35Gphd1tM4OxoL0LCMa9ZSdEUyPjR7r+h9E3slWZYlKkI4UPtdLVpEpJQHGw8kVx/CPajZzF9CohY7l0MOPj04jGJ4MvKwPvkDP0p9ymVuCxpIOyZWqdq7aGwMsctqGo9mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477033; c=relaxed/simple;
	bh=NPnnBgv4cW7xlqPQ2752/SCeU/CKbX/y1dH1UX/0MLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BtvmDgQDAlBrJZP1iF6kbAct7cxJo0vOyFG2fNjzuoEOHfOGrCepKjf9uZv/d4leV+U89aaaLY9mPkZvzWIz2Q5oGRUxIPch1b32lStQYw9gDszEwppPMZyK5tRtdljtImcMPISjSIDFmbVrZ/MiCoWh0Qiahaf8+r6E1d/FHng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HE0QtYXU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HE0QtYXU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so1133625e9.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477029; x=1787081829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cmyu/AALd+CLLHUAUOEgsycpvTvhYWOAGBvBiIKKJb8=;
        b=HE0QtYXUHI127MY8y30NZhLtDhftzwAWuJaikNQiUQAldMXnXU+oBplgPPK4zljaCo
         62Mby7rbvlPr2smXRAlqS0Vi9GgeYlr1wUMlw9kOtOBDZPDWwnugMVH5T2A9RsjdXfDo
         74kIx0sBge7j9v1lSfdTLV5hMCg79hgWGZjks3uoRqlJHKpfM7+DXRJOlx1jyOPj5ZCO
         ZDSH1dGoGBoeEm7ZZWjaeXv8Xk5TX1lt35ckqm6u2lyXTDM/qOLvRm/X/U4CZ91EdZdi
         MqyNp0XF7dtHaMLbAusiAyiopIHoD92aXQ/yjlS4XcYPlHc6MaXQikfnFybzn3uLBLJB
         xXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477029; x=1787081829;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cmyu/AALd+CLLHUAUOEgsycpvTvhYWOAGBvBiIKKJb8=;
        b=o4mXEsR2BZcihpV1lxilUCw4nfG2IDWua+4XqcNC7jX/DM8Mp33baJo5zOx8ulbtBf
         o5cQ4cxH1HU2Pdl3yoFhDUCjVJMcRYlSteocYdndgU9uP7U2ja8OJJA5Vs0vQGHxQkyd
         rusMNyeTPeJQm6Lpfl9SnxD3FbCKMrLL+o4bq9oYvX+gk7MJp9Xl4VkENPFAUKz7PhSC
         w/mtQj+2KuO3v4lFzm8irJINdgpdnD9NcVPyFHfwDGWtaGtuhdDnKVLnSS6wa1ItI+Dz
         B9nUjRJCM1SrzTuyVYonR2NwmpT1g/A0gv+vUI2HGtjySK0bm6t3nR9EKow3PdKo8acT
         uhWQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2tj+V5zSt7wQwB+GFKZ2kL/YKWtdEWaFGeEtbXIHE76JcbBbjQqFyCo+79QtULhehIg7jZ9nro+5j@vger.kernel.org
X-Gm-Message-State: AOJu0YyFoaz4hjoqar8t7tg+av+U8HpS/NjVTRRF3wo5zP/5/BoJFJCT
	rOHOxeaL23KANFQgJMJySPGxPURaA0jd88pmngrJaug/zADoWJxKnBSU
X-Gm-Gg: AR+sD12lzOTQY9PfH54tBYguEvwmUqdsLWTkE91LpASrBt/VSI6XXHEdQs5zvwu+IGd
	gprq2avOrnEXHjX3bqBtvF4LOji14yFgXhflfHMew9oNFVy+tPDVsYgP5JBpmV3jwGoFwxF41JH
	axgsPKGVmXZOd7+3WRMa/IgyBgxhmaSzLSFq0pkrxo7Ke3YRfZf7sC4+LE9cgSmglXkAfX5/u+c
	UWRHQx3lQY653Sc2ypNKc6xuB4r6skSB3Z5+DgQ1drPOhpUq/b7+ml5A1I4EF4IcKvHbR2KoxTM
	N7txY8xY2gV2fveJbjB6s5sgUBcv+v7PPQ5ykPW3ba3Mc7IG2ZKkUbF0VqkhGG8DHlJbctI0u7f
	aBkcljRnIS4JoWOCrh3uq4oFM/p8fmBqq2qos1jiRIz3en1aijy98Gb54fd/Zs3eWJyyl/Ekvb0
	8xuSMAxcjyb7jaWmURj8d1FyFoU/kStvAkb9a0uvjw/8sI0NdRNp4qYBe8BCXHugNTlji98U1PH
	gsL3kjn96TExom5l/TggoKeHo7xzA==
X-Received: by 2002:a05:600c:c490:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-499784559a0mr94570785e9.8.1786477029607;
        Tue, 11 Aug 2026 12:37:09 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b15b807sm10130285e9.7.2026.08.11.12.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:37:09 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 RFC 2/2] ARM: dts: BCM5301X: change Luxul XWR-3150 CPU port from 5 do 8
Date: Tue, 11 Aug 2026 21:36:58 +0200
Message-ID: <20260811193658.14304-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260811193658.14304-1-zajec5@gmail.com>
References: <20260811193658.14304-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

Northstar devices have 3 CPU ports (each connected to a different
Ethernet interface). This design was meant for dual IMP setups when
WAN traffic goes to port 5 and LAN traffic goes to port 8.

For practical reasons we label only one of those ports as "cpu" (the
rest remains disabled). It's because of Linux behaviour (and it's
probably a bad thing since DT shouldn't "care" that that).

So far the choice of "cpu" port was based on how vendor decided to setup
given device originally: which of three Ethernet interfaces got MAC
assigned and which port was used by vendor original firmware.

Most vendors decided to use CPU port 5 & relevant Ethernet interface.
The problem is that only switch port 8 provides full functionality.

Change the choice of "cpu" port to 8 and make the third Ethernet
interface (connected to port 8) use MAC designed for the first Ethernet
interface (connected to port 5). This makes Linux use switch in a
feature full way.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
This seems to be a slight abuse of DT. Instead of describing hardware we
make it steer Linux into using a more appropriate switch port. This
isn't strictly a setback on its own. It's a change from one choice to
another.

I'm not sure about that MAC however. We say that the third Ethernet
interface should use MAC that was designed for the first one.

Is all of that acceptable?

 .../arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..7969f0f331b5 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -81,6 +81,11 @@ &gmac0 {
 	nvmem-cell-names = "mac-address";
 };
 
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &pcie_bridge0 {
 	wifi@0,0 {
 		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
@@ -136,7 +141,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -144,7 +149,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.51.0

