Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9E03AC0F8
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734161; cv=none; b=JsKU7MqwvpL51rE3bAvUp6AcoBbkJnBKzdamzWfol71jkZAacMUFfxUQfeeaTmyVCJ80GO0ojVyybnij+l6OiARwG17CCjnhX/aZMZ23KvWtvYKXClGnxgfH38OYwrF89J14X47fVTOityqLmkWv+cFtfy7Pjx+tcbcoznPdcZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734161; c=relaxed/simple;
	bh=GJHoT3sGNBaHJutusjqByQrs0uUzgfDmspxJwWo+2Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8eYAQ6iYtQTHcCLUaoEdbN4sr0otxxUVIDAlkYwp2q+6tpzdaJ42FvEjPxb9K53+SSMroFCnvVvuxMthGBKkEdxp96B//AmBfOFVOhWmACs7iJ8TjHdavwZoUXEo+ZCYteH3dIGYbWrwT+ltZVvwxy7trMHn4jbxDwPPWGFvWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCnKrLON; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCnKrLON"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb6573bd52so2068285a34.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734159; x=1786338959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3THAfFmoIZwxbw2uyAABLxKH+fs/K6w42J64CA1198=;
        b=FCnKrLON5vTrm4/zRqjIDtzKBvino93qWUryfDttFEfy7iO2GfcUJOGBl0ruywyCDu
         6R4Ge4kGmrT903YX4iFvKfrGmyBtanU35OWWd69rXk9D2z5+4V8tEHuY1cfpJ2F/1sSJ
         zuUGzJMtvRcmWzDYjUS76PTRlI4Zjw6glfiBOcw26ArU91IjcN7AjtUUkbbw/8IrQ1jJ
         vZG4VtEJ4QnHKbal2ARBi6AUycr4jdGnAusuHUYH9oA6HGYJ2qcPhW6cxK2M+ytiVM4U
         ki5Vw8d4NkAteeV2O7qhNK1K91hPdhMoaxkQrT2Mu917gcATNMgsxMq8DbmJBHASrFC8
         h+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734159; x=1786338959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3THAfFmoIZwxbw2uyAABLxKH+fs/K6w42J64CA1198=;
        b=UJqfVildZdaFAO3pG0pp0s2cm4dN17CzqZnf6Ee+Z5VrUGAKTrHbgXY6SzEjZsrSdn
         rzQsU82SI8ZfhqOB56rDufNhCbtgYwlEEcQmF4fmypBRjOAjVS/dGqZUzjz3BOi6BYKy
         RHL36qgOOWpf8qWgijN/CU0G3IlF8wG+ajGq4bNBZCTStdHRvcJoJLt4snzGBqDusQAy
         l4kSgv51TKCwgliPl8WYczA0yvJC27ryvd8cGcp8+wDpqndVxdJ/nG0WipO62qgjGnwP
         RrjvX3OkFjytjV8bl24v/1KwlqYXUMunh3JM+BeISIE8YUu+Vs1Qbso1sBNN+vvZbtVT
         Bx3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqPxEYgIyhNZOCOh0ZDURufql/9gmmbebC79uxOXYkj7wK4hFPVMq67MfoObnTWM6wnaTtZ3jaLbZZ5@vger.kernel.org
X-Gm-Message-State: AOJu0YxHKfLXDwW8BGJVBCgJEok5qMVRup+Rm9X+Wpv9Y9EcEdJUIXQ2
	p7Q/uRFe9sWWS+XaUpHcpiGVu7ju0RSADD1n7waSCfLmLjFPixu4fBW2
X-Gm-Gg: AR+sD13sTcV332EnfeppxfFvMkR3vxurNMACpNy0Crk5ceBmofeOaKazFA/MPCi6G3y
	5kjPe6P/Whcx8r1HtdX36PVyUQdgosJOWcoiBeRRUDXupMm3HqCGRbelheoAqjL3Q6AWwRQQYIf
	S9w5dx3rQx0MQ1GsDBUOkJTsIuwPDtccid9+Rtnw+1e1c8+Q5tlIhrHZhE4VLd42sWO3RbO1Pxu
	ziMQhgqpaurKoq3/0dhWOYvFSumOoTtp5XG77mgcdhzN4hqIWeIxJVzrUv+2dk1OxEx1OsjVsP4
	YwyZZdW1ufmnvK/oOi9NTWj1gngoKBg4xlhBSnFC65D8h7wWIwATuP7axlaacz23QoOC7i+BYhi
	/XGqpl2CstTqlCnB5i5OpnZLBo5fQeTUvduRhPV2VARqyvKN5lkfasqwcZIoplZ63nIMJ5c9SoF
	tGef0uLk+08C15I7IfNpdenNXw65cUI3zGpfXsgJlyOnJhv8qaRWLQC8jUJLscZDitBz2zRABrX
	2240r+j+tZaFUd3Nggp8ZPF0EjflRTXMEUAU7ji9QBRAzK6Qr+odXnPiKAjhMnSfouLq2QZ12/3
	70Dn+EKbVeQO/6WJHsPQ0Ah/pii6UnT/eD/zzGfVuuG6jeEsPi9HVphJWUeSQWWPfXG/t9eptDG
	bJ+XeerLGQwvVvOuJ0OOPbR1yH76OCB5JlCx8
X-Received: by 2002:a05:6830:2a8b:b0:7e6:f7fb:9678 with SMTP id 46e09a7af769-7f196cb65a7mr14526881a34.1.1785734154482;
        Sun, 02 Aug 2026 22:15:54 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:31 -0600
Subject: [PATCH 21/21] arm64: defconfig: enable X-Powers ACx00 Ethernet
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-21-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Build the H616 PWM clock provider, AC200 MFD, both variant-specific
EPHY control drivers and the shared link-PHY driver as modules. Enable the
netdev LED trigger as a module so DT-described PHY LEDs can use hardware
offload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..53f6b8edaf33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -475,6 +475,9 @@ CONFIG_DP83869_PHY=m
 CONFIG_DP83TD510_PHY=y
 CONFIG_DP83TG720_PHY=m
 CONFIG_VITESSE_PHY=y
+CONFIG_XPOWERS_AC200_PHY_CTL=m
+CONFIG_XPOWERS_AC300_PHY_CTL=m
+CONFIG_XPOWERS_ACX00_PHY=m
 CONFIG_XILINX_GMII2RGMII=m
 CONFIG_CAN_FLEXCAN=m
 CONFIG_CAN_XILINXCAN=m
@@ -828,6 +831,7 @@ CONFIG_BCM7038_WDT=m
 CONFIG_MFD_ADP5585=m
 CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
+CONFIG_MFD_AC200=m
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
 CONFIG_MFD_MACSMC=m
@@ -1325,6 +1329,7 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_PANIC=y
+CONFIG_LEDS_TRIGGER_NETDEV=m
 CONFIG_EDAC=y
 CONFIG_EDAC_GHES=y
 CONFIG_EDAC_LAYERSCAPE=m
@@ -1726,6 +1731,7 @@ CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_SL28CPLD=m
 CONFIG_PWM_STM32=m
 CONFIG_PWM_SUN4I=m
+CONFIG_PWM_SUN8I=m
 CONFIG_PWM_TEGRA=m
 CONFIG_PWM_TIECAP=m
 CONFIG_PWM_TIEHRPWM=m

-- 
2.53.0

