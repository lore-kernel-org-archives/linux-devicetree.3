Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171710;
	b=QKn0Mew7nE9E5dSmJU1dYfnqOtv2MOiNBdzy6mMEIofeP1FGzyfCI9Kmyoh3jP2FMjjF
	 qwKVFlQ6G7L0XF0a4U1ItKZJVFako8P/FYVZuASQuqwUeTqRCEl66DMcDO+utz3kb+3Jq
	 SRm+yi4NwxaB5CrF01VS3E7a8mnOMXT/7jxBZtV/CNshS8qm2c+vtMOoe50nDRhRj8m9r
	 qVui6EiMECdWOJ1WR022t3cqTK9HwoKsXKIDFNcbcGj4PI06+GQD0vP4em8Uek0qDL/Ec
	 gicbcg2uNvFazTq/tFnAcataXFnz1RDNkmW152m44HGoQIZ3c5UnrgxYZkZO7pEz5Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=QJvMqObrWPXnLO8CGXpjNqdNBFHz9WUEvQTHgkM8ryg=;
	b=03a8RdZlN4iSHTjTvb7NAXn2Y36R28l/OkLmEj9xXBTkHV6p+t/Oax0ftjVjxsz0cnD5
	 jv8xB26HdBTrZ/S+sB+QLouXlPRD0QM4B8Rgh2FoVHYRmoOlOuLQuWrtHi4u5mE7Tu3Ea
	 ayjOrioqOAlfT4WKeZEW5h2MaOd1e3xjJs0zlpHa450TWqM2mXQc1+KRSfAza7+mynYsr
	 o1U+BRL63hKCKKFLcCnaD47ZEz13DA/NA00LD5voJHO+8QnyZHeAn14giyJNp4v27CnoV
	 7yOG8d99mc+T6ePybCvo9EaRUQSX7DtC3NMg2jlhxZFUvv0Y/oxF2kiD9/qEEE/05jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=y7gtBTxK;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A44606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A44606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=y7gtBTxK
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so6994325e9.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171708; x=1795776508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJvMqObrWPXnLO8CGXpjNqdNBFHz9WUEvQTHgkM8ryg=;
        b=y7gtBTxKEQ5MxlFKhDZmqDf0M0HC3SGqFjQFy9q8Jk1hdjlFrU4BsAnvw5ogAStTlG
         1I5FJYYYFVHE8ICIK9OxuQP1M6qQiwNPJVEItXyGBlIMz06fH4o62mfYsjs/AAd9IqCu
         35eVAwEhjKjpmGJ7+BMBPZzzHrJWNtsw01nfRU5mu2zDj7Tm8DrjzvAJ+K6i/arC8L8L
         fMiF9afAK9wT3So6vM2gyVDkCo07QIM/wz3LqSQphu8/BQC+Ptp0X2m77wp5250+qoAV
         36C0wGtoibcy8RhvxEuhupl/94FHMszbwuM0MV6CEcH2yCxG8s+doG75yVTNuHGEQ7qy
         edHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171708; x=1795776508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJvMqObrWPXnLO8CGXpjNqdNBFHz9WUEvQTHgkM8ryg=;
        b=KAw65TRTgQ54tR6j0m0j7ClvF4Msy/uXHWcPnppayRtEm3jSWbQ/WKOHcJAHHsjwHm
         aSwMdYu6Lt1d2vp5V8uK88cTOW6nUTf6lZymnTO1PWdCxkKJE+IGDoHrF80LyfxJBYfL
         XjI7YfMuPeDTcqQKse2ncFsRNiBe3chJtLB+ogn+w3mkAAzB2X7jLv0y1uzHDY5q0/k8
         KkqV7my9lN5I3lCwOzIKnw5VPMOutEEdkDENEh6tu5iGos1riS58Ow1MVnPH0nhLNbjV
         Ms42yf9oJCfml2EGOZMc85fxxLI85BJnL4DG84g+zN8pgmd3/p10bVjYvE9m/J9wl9Fn
         XyDQ==
X-Gm-Message-State: APuU4Z/AkwuQ2e8FjCAMW5ZclkObTuyYDMY4EJPpcGM38w3i/70IK723
	GX69vBrV0ksjqcwPLjbUJoglCG/OR93CdJ+r0Wvgbz0xVPG6eds1Rp2mABwNja6oSnM=
X-Gm-Gg: AYBFou0WeWHT/17VeZf/gEk//rJi2h0GUQYC37i9QKN3B2Tyz3tDJyAbLubNcvIZVam
	Gbko04uFAH5nGODbKVdoic56u5L8b5ffBibFIQlH2mjRKxmqALLZU7L3F+lkjpiA49pL6kUAQ7f
	bCNXsBKKCLB6K2fh+fSO1oAtIxDVJP8lGnO5xjkMwHG+DVdEBv74wnacJAA8sRJWZVXlgZkYrw4
	OCHj8lbBUzqteBoj7MA6LlNlQmjNBVh8jgK4hLulX+5dr7EaBuZlCPPSKD75ViGJuhnKV3axGU3
	wu7RDov16AMLA6hy10HGCmz3I/BorcBciJwaz2rzzx7Y0lmuftKqeCc7QubDQb7WzgNLhptDnLc
	3KMTenrp1BYiQkQ0hReVmZCt9dtGUnFTKOV50wcuikvGeRJt5015pXrFpfDDImLTgX5mTTrLgkX
	P5f3pDyXqdMKnN96WwEdeeI3Jtl3TUGJIo69kkfJZ02cd0iFzH1ei/Cm8RPU1AftBhOGaC43BQ2
	/KYCeRVaVteyYj8G24axa8Ng6/LFT3fboiA/ejoUsbOEAr6SUaJBvClwizIqhBinYf5cetwlZIA
	ZBgW/6dO2RsWWv+WISbgIb5VTVANhJPa1DTnruW0P+XmOaD08dWh7jUuYWsVxcs0ZpRFZz6tW2V
	11G4MbyMo
X-Received: by 2002:a05:600c:8b11:b0:4bb:6871:8f21 with SMTP id 5b1f17b1804b1-4bb88822346mr61768745e9.23.1795171707952;
        Fri, 20 Nov 2026 02:48:27 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:27 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:13 +0400
Subject: [PATCH 5/7] arm64: dts: rockchip: Enable ALDPS on Sige5 Ethernet
 PHYs
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
Message-Id: <20261120-rk3576-phys-v1-5-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=alchark@flipper.net;
 h=from:subject:message-id; bh=FH2xw+twk+nUW3rJo+48mjUieXBhhK1SNjsTbxltvB4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqOZ6Xnn3panSrn/HBtvTLNsy570Sf5X7+vXRpWuSS
 u4lfTzL0jGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUb5rO8E+ho5upbK/p9GmnzVJ0G2qTU69oz/HqmzShhNVAM5Ln+BOGfwaT1nn
 rXGq/b636eCGnd9aqmSe6u5ct3KHVmdjkvyS8lA0A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Let the RTL8211F PHYs power down while no link partner is present
(Advanced Link Down Power Saving), which a PHY leaves disabled after
reset. The PHY on GMAC0 is also strapped to stop its PLL in that state
(PLLOFF pulled up through R338), so an unplugged port draws close to
nothing; the one on GMAC1 leaves the strap open (R368 and R369 not
fitted) and keeps its PLL running, but still saves the rest.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index b8547395c608..45a4489863bf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -783,6 +783,7 @@ rgmii_phy0: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
+		realtek,aldps-enable;
 	};
 };
 
@@ -795,6 +796,7 @@ rgmii_phy1: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
+		realtek,aldps-enable;
 	};
 };
 

-- 
2.56.0

