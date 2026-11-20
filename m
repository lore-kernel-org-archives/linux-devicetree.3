Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171714;
	b=RFPHQAH45BxSFBdfqC5TcPmv/1MFpBwBsAV9ISL4B4qa7MMMdWNUFRqIJfJTDs/mUveS
	 17N4311ENw2G9bW8NR0GcX9+fst5PPLl7Jt0jT6J5ehr9/mzaDE5txKezX/PBhEmKzuoq
	 l+BJ+U8E2j+PUDTKqLTwwryhoRbDOIMNFejpW+NBaTWB7vwyrp8jIt6ebjbOvzFyQTB2X
	 WOlkP7r9kyeViOj71sNpPtwzrwBeNCrR1Kl0PoKujxv73myq3y2oQ+zt2kxj12YzsP6NQ
	 Wf3g/6jtAsIaQeT1ugUgXOXCyxNfjt/AGpdWlmrDJjojmdmVlzGX7H9gppeSMguK97Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=CYESoVgfwgsRsCvBatykAecmK7pBObqxccBDfQWhhIo=;
	b=Pa544ZtfJCUOJgsB1JUXG6lhOX5sIDPhLQpaWegChrIZcYgfKTWQdGp+cMCestiNmA2K
	 GPBlvqerZrIZAfP/NBLAGte9CpN1zsH034HWH2XtVGHsIggwl/yQjp/xrmRQou5jeOl6t
	 G/u3b5Ro7+1noi4liy9+6TSuCtYfjctPvKwW4pbng1BOAV8DeFASiiMU5A+1YL6FcpoUy
	 hqPaBXC//uR4xPSSGbSc6bj40pRwrkS0AMYOmN8aiRY1a4IV1omS6dtxSIqxnJoN1kfk4
	 L2uMSQKPeg3otX+QaL/Jt4/Nfe9+lgQq7VYoQulXutFDozcMgD77szW0G7nFbtw+IKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=uRZchBfg;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA486606A33C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA486606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=uRZchBfg
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so3801505e9.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171712; x=1795776512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYESoVgfwgsRsCvBatykAecmK7pBObqxccBDfQWhhIo=;
        b=uRZchBfgGYFshUPsI00je5g+tjy1yjiBuv6y2QLngQIeiiTtSld8+KhfVZXihDN2MG
         E6WFilkQc7khjRssE1rv2qz7pF+uHN/Ez9Z16CyFtfcaaDgFMoFQ3BZsZZkVz2KVFH6H
         BE3Wg5JJZDxWDBdUAgn1iAeHbMKruvK8DXRvA2/n5iRs4t05aMUwjiJNNitqbrfbN6OM
         KmummrlYnpYrEqhT/vjsIxkAkoi9976BmouYDmdrc2muE6374hoMcl/KxcWhStY74iEo
         T+9+caRiU1khvRF3DMa7zJnHV4OKXO4cV26Y81Xiol9zX8lzn7nxwxmhtfIn0dnbQZQ9
         3JeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171712; x=1795776512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYESoVgfwgsRsCvBatykAecmK7pBObqxccBDfQWhhIo=;
        b=CjlXTvyWQxjqdrgMVHD2rQsE+BWpGGQIwegDnqK8otQrZ3IXSrnNOqQLCft+66BFT5
         ktpXlypMjqkkQlD8SOGLSbKFERez9sLSeLe3KUiPGhh65U6pBj4t41Fv7dqqNz//rkeR
         HWTsF2g7bwJ5KEX2YckTRwqheu5zqAk34FaSfy3j2QFxie0I/RhwNAPrhlgjTbhXL+uS
         KXGYP81n1tIlwXo2279dP3F5l80VWW0IDs27C69GPg6UDv38HBFyk0PunEw9DMgDqwMb
         DeVDZ4isb9jrqFzdrdraDNmiUKIXeWNMKTPGTZgat7NGGYiuqJ0ZJAhyhDOW0fGCeQFq
         ML6g==
X-Gm-Message-State: APuU4Z+oEcPgymAnKNn6w6aDsLI/ty0fcyQp4qxh6DBfqF+XjT2HrCCJ
	TsxrNyj6ScpCjys+HGKtPSHQe259Hkx4luBMjlMipwIEKYR+AKf0jtahvmZ580jJxws=
X-Gm-Gg: AYBFou39BkAHhdtUz5EvgtLEoAgFVdCkHXE19rYSuWPYvszdheuqk+F4RNbjTpmAVeq
	wH7+P8kxDACBk2+5sFVle7bqcpGj3V5vJRNOlfkyhMsVKzSEkaul5QgvFd+3HpSXomg+w+xkTiS
	DHXrLyFbhDcEzy7u4rfoGr+Ruj+WaTcVUrVL2ZRzJ48bDbYzuhCkDzCgZP68FVQnVPNMsSEsYM5
	/5XFHoKZn2K31xa6eBrNUUX2gpSEnSK4zoB/EmdccxdPgM3m5LmrgXL9kILlc8Pt+9ZbF5ovKAw
	edci6Ffxdlo+f+jQh3jXVbLpPq1A1+bheBv93RWqzEkCfAxHBkS6SFrIMWg+Tq4cmd9KhbFA0r3
	zwjeGm5l8gHMhZ167nCGA79HZM1wFvc7IXG5Qj/NY831TevhditeNIE5iuQq9H1pfAD1yEsd4L3
	u5+hJz7Tix4I6H5NbZ6XE5G5ae0U9RUXMNMQCDb5KfWYCi1oPMMmQUj8luNApRC/+NB884Ta9gQ
	UeoJy8mDs/QxMc6tIk8LR99n+LSroT9yZmB/PfLli00HAmGjL/MwPNOhPtp0Z1HzUi/I6/QeRJx
	KuFsUMayVj3dx5d7dw7HKw31CT90F+PffiI/uZDg6+vv2uGnH1uyF2tlfGgDDngJohUG+BSV49k
	1TdPUtNnc
X-Received: by 2002:a05:600c:848d:b0:4bb:52d8:73ef with SMTP id 5b1f17b1804b1-4bb88940f1bmr56043855e9.34.1795171712233;
        Fri, 20 Nov 2026 02:48:32 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:32 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:15 +0400
Subject: [PATCH 7/7] arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset
 to datasheet timing
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
Message-Id: <20261120-rk3576-phys-v1-7-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=alchark@flipper.net;
 h=from:subject:message-id; bh=udM5Uz76VRJ4rdTS0/vqmjrYLFd8GBP+/ltQgETwpHk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqOY+Elj+wdS9+l3iOzMXGWtjuc/xlgmpgYvLqxKie
 EWUpxR3TGRhEONisBRTZJn7bYntVCO+Wbs8PL7CzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCcFvLGRlu3N9xb9b5u0b3UoyZZkc8Zz0Xad3Gp2PVaeHvsSeH/xM7w//ozg1Rngo
 r/VVd321fl3/uzOyZxzQ1RH2Ovt8pIPBbLogVAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Use the RTL8211F datasheet minimums for the PHY reset: hold PHYRSTB low
for 10ms, then wait 30ms before the first register access (Rev. 1.1,
section 7.17). With 20ms/100ms every reset of a PHY keeps its port from
coming up for 80ms longer than the PHY needs.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 45a4489863bf..3e7158ebdab4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -780,8 +780,8 @@ rgmii_phy0: ethernet-phy@1 {
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac0_rst>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <100000>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <30000>;
 		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
 		realtek,aldps-enable;
 	};
@@ -793,8 +793,8 @@ rgmii_phy1: ethernet-phy@1 {
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac1_rst>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <100000>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <30000>;
 		reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
 		realtek,aldps-enable;
 	};

-- 
2.56.0

