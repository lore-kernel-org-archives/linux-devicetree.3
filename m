Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE353655E6
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787529416; cv=none; b=Jxr22g4qZr7+moAqwncREm7llJ6biN3gNDtaYC8oEd5LoibHmxcK7a8E0QAxw/7W9s7m4GoThzudpO0/0Wb3P+mgoMjRyM4HvgUcjeT/CFtEMtkiVv8viqugWxSWNOR++dALruDSLtMSXGmDFTCAB1k4gl8n366I7WDGYIyHbfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787529416; c=relaxed/simple;
	bh=Iv/wkJpIcnYQi3BGgwN9JXrSDxB7aK+IEMYc6c2gbJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SNJ14Tqxi9tpSeSkrVTEPJTRaaDt4KjUPNHFvPOoG7K483MR5NprnwoCNvek2PErf9F9LOl6dckOcD87U2EJhkBJQw53/vMQ6RQUb1Gm4iSobp++vLNYSe9YQ/4AcF7NeZS1Bk46mA77jG9BDz6pTGJDyeOYWYsAmh8NimZhG28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laZkTtGH; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laZkTtGH"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-395ea741d07so836306a91.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 16:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787529415; x=1788134215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlY+RMZdBnQ74zf8vY3yLEI4IPGDkLn/SUP8M0vfoHk=;
        b=laZkTtGHh9/ino8Xpht4Mi6+rhbXBfNWxe+jH5D6TMgiaAfa/PLMVsmhEm0AL+YB+C
         vwZgj8daMZMtu5qhP3gGmcHWID6DunnpK0cxNk+fhHkYIpsS0WViWwjCeES5YkTREmcB
         /075jxTeQiI2HMbGz2+4Dr2X0RFa0+3iM/hGC/fdlhIfqrfDSM0XzPBse3y/7Lg93Clt
         +Djj5C7xk9iDFhBG0l3HRvuvwxybTI7traYamKzKUsNRwO8KqqfRHOlvTdSw1xlymi/u
         Z4tC5+1yc1vHETlH4vvOjy1RhxSM+j+9F3Od7fJ4o6/OW4MGNaqR/PEZyzIIQBx5VETr
         Pemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787529415; x=1788134215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlY+RMZdBnQ74zf8vY3yLEI4IPGDkLn/SUP8M0vfoHk=;
        b=EkTaV4Abk3NEiF7UdaHZCrUwRUTYf8hM3KRSGfskTpBdqEPlOVqsZUtmkXZGgbCmS7
         XoHPRkr++e6v/ZPiMJUvrS+ybSzoiYpn/EmI1OQNjkM8+sAgp+1uIn3FmQSuWiTt4Xrn
         DX5+2gj+NOGGW/5pGTBteLigA4hmTx2qBKKXQyo7A1Emo6isj0t4j26fgYCwVDurSKDw
         6j9K3Yo/Ts9J9Lh5G2994zWlt+vQsyXoksPATs/dCXuXpYtV+3uXC87mT6XnOqI9K1ch
         Se26AfUs1t+5MDQAEjgsi79RPD2Zm7pxrIANiqcUyDHc3KvOfsD0Wu/jDCC/2H+FgJwv
         AX1g==
X-Gm-Message-State: AFuF++kaZMHT8O8ArhU6UUqpewN2WU5DEYgdFUVn/shNAYZb6eRzRB/S
	EXOG2RvJQyl5OkyswER/giEI7aR/v0PsG7LtbarptrG5Br/p8XLJuhsmNLp4ig==
X-Gm-Gg: AR+sD12BGM7ZVz1+DioQGp3j6i02KsIvDAi2iLf7JSe+LvsMqnHe5/cLRn4zemdut8E
	qVvRzRn+P0/0mEdz9x7kT8aGBUeeMD4eZNXPV6H0j22fwL1UKxwTVW2l3D+s56s4822AjFAzf6N
	krJOEMtj9uyoFIaHMGymr0Dd1CRHq7wItYWhLtdw/ZQfcATlE66RAGPdCxy2nnJA3TJtXL2R0xh
	7xZYGri8MxW03WZJWjHiBaDkDYrtuMstjWapY2CABS5Q8lGB6hI8wVXQm+SGml+rV2wMZfCEk0e
	8C6ZfEKq/TNWaNWufeSaS9F0/2oPTGrPAfxsEV+eIuotbJhorOSBHKJ9WNEiN9OyRgkTHZ5O+CS
	jJQVuOR4+Vjp//wXnQtwo+HdXSKpuquEBWQ2icR11GmY0f+RFzcLufu5R9mfB3aBUGu6bfx5gyd
	0tKAwI9otbEoOPY4SAFcocbHMRrHfwFdymh3nweZL0SgmS+O26GlYQgiflG2NTMRVwaoP3cPm1U
	S0lJQPigEcORIQpD+N5Z+LRPs/rSqAMaH2NmwyLLPKS1PE87AlVeuYZWc5cW0JSD/lVAjXqHfuT
	tvqfI/DZ8Iu6YaJvZhmA6BEJOxCyPniojlzdCw==
X-Received: by 2002:a17:90b:5288:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-395c3368e30mr43320247a91.4.1787529414679;
        Sun, 23 Aug 2026 16:56:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c9174be7sm3460508a91.3.2026.08.23.16.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 16:56:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: marvell: add SDHCI clock-names to Armada 38x
Date: Sun, 23 Aug 2026 16:56:52 -0700
Message-ID: <20260823235652.77997-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The marvell,armada-380-sdhci binding requires clock-names, but the
Armada 38x SDHCI node only carries an unnamed clock reference.
Add the missing clock name so the node passes schema validation.

Fixes: 6eccc52b448e ("ARM: mvebu: enable the SDHCI interface on Armada 385")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-38x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dts/marvell/armada-38x.dtsi
index 1155bee20523..598022645dd2 100644
--- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
@@ -627,6 +627,7 @@ sdhci: mmc@d8000 {
 					<0x18454 0x4>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gateclk 17>;
+				clock-names = "io";
 				mrvl,clk-delay-cycles = <0x1F>;
 				status = "disabled";
 			};
-- 
2.55.0

