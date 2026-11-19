Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102134;
	b=KZfizAxrEUX6fy2G9pDereygJ1DfNX+pPYzf/U5Tl0WWOHGttAk9/nlTrxvTVDcRiR3m
	 frlD7GCrq7o7ogFDYKkLgsO0Jrqs1n+Vqaf4iCtVUoyVjlkYxR2Cf4rbul80LjaXxeYE0
	 cmfu2jXI+UTVDxIxFHaGJPFJM87B9QD0w0Ogbayl1AV1aBdeBJ8vUl0mij9FLQU360WnV
	 dcEBYzk9ggYkB3vstONa59FJAoD6mPSD1g3XL/NLRpHHaakUha2SnMkD1ok9sS0YhoRZj
	 xhAmyjc+hQR8fufvfDfL/Q9Rs7olwvLUTexNNj2ezACAxpkAU7T6hyfc6wo2JDe1bsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pxt1sopQlSkfKoFQzdpWbaKq45H8uP8fsn00DXSyY+E=;
	b=5bDfFYk3J9p9BIMITKNPlyjtRaxxpBE56dhVizf0RTQOqekOZzy0pwu7DXGzTN/7lKz1
	 13RUXWA5odW9WoCJUFduMdlIUvRmTA0GqXQ9LHYtWSCAlKgiEMqT+3EUC6zchLZeYCpQz
	 znDpNECOd+MzuS711gWtzDY/2zjM9zEqCIj7w3c6Z2ZP/fIyERSDzWnlf9FGAgHVMoIQB
	 h/suaGlECYqnhX7VyDxJCCH8tPxAVbjKz/OKS6sSwcKjemNjLhR1OS1tdLfrgCwqFIcMi
	 HprcFiz6pb6YcCUkFP31MS8QBqXrXNyx0zJuE9Nw9xFAI5erqbYfzf0tlFVoWjEGJWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mu0zmd5E;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E04606A32C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E04606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mu0zmd5E
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-84a248254f4so1342081a34.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795102133; x=1795706933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxt1sopQlSkfKoFQzdpWbaKq45H8uP8fsn00DXSyY+E=;
        b=Mu0zmd5EDt4NU4VDkAuAXO8B1l1sudhwG2aX8WgBGLBY1LQiR0vxsM/QX/4Lej91n6
         udmdbbLoJ5+bPQv145Jwz5Pr9W2d11HLoNFM1LSvcVfLXPlx8hRsi5sMva4Ssnrs5TIK
         4PHLEwKb1jjiKu994q0aHq/D55URpjmOE6Cm6GW3Oqkxj2NehitTWPlwcVYqbaxPzqUG
         N3ItLEWTOEiikRDDdRKWJHYlHvTAx/IxU/WoMPgLXpA6ULr8nxc6feX0D245W3gPnLoF
         W6vqzawwsr5zfY9GXNa9/PC/C5Xe8AihDg5/CjsaSAW1hUdaeIhYGbXC6EH4Y2DJ+d/g
         b1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102133; x=1795706933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxt1sopQlSkfKoFQzdpWbaKq45H8uP8fsn00DXSyY+E=;
        b=qfbSFuhtf3bveL6ksi29Za0xkDTfIClHBwE99zVqNUIfTjAPyA89H4B6qWVxV2sXZo
         723EjH+YqboEBh0Ay1OTmHT5FxnLuDP6+D+r1rQy69ktES9ktd/+BbpSg381o921rUor
         A/muUpttlmF8YAWr8Np8mws0LHK7hxyJTjTgFLydnmxj8XvhUCHnG/z3rIH/+jyav1hR
         CZZhirxrBWsXxLyBmbopknjmNlnruaUGgu+yF9e9XSYZ/lYy6dxYux3VZ5jQR1f3fg4X
         SG2OW5G8TY42j88Uaiy6heA9xT5YRnHr3uvevS3FXAG0usPZFveUcOMqUB4HIxVYUa55
         sMuw==
X-Gm-Message-State: APuU4Z8UlOZhMyrgfxpMFqoi3oeNtk5H4DGHgb6KCbasJkZZVFvr5lJG
	C4DFKeTer6kAcoMH0+6UV0p7AjQBmNjHflDHoVpChcOXaLX+ur8rrCBbCQoRBgwm
X-Gm-Gg: AYBFou2AJbTMfwh+B9AjM9xpkTbvZj/ZYaX0SLK/Xyo+oDLppCBcvaNz+VW2csW27hj
	0ljVHth2ihaBkXimznf6Rj0OkyZCRUGD6KqAHHf15Tl/yswLRDJhO+E1E5quURU3qqoeXqvyx55
	KNxv/9yhzKeH8GjUADZG9ZfwXYcaG32t2ZpyHy8VJRYuQLylme2axDndwBEOYCcDNmx86Vdypc2
	S3mMvqB6oxi1AZJWP6D2TFR1eXwWvfYMqsRm9xc65QFQnsqyEwTMvv9LKMeZ3xc7SWEwaOjPrbe
	E/x1xpQ6DP5BM886II/4fUAFHRFBwJzv+I6AX0PJiuycS8bNteZ6/xQf/M92KN0XborcjhPlSv1
	F4N0KgzLRquCthvbgLkDFoLHa3kt4jWDbeWGGbvFSADtnfvP3v3/Rn7DdU3RFo2ywsIaq/Ij+Xg
	vdmHjbVzym+paAwGI9gwZJDB2mPmNUkZm2wPe0jBGbcf5r5YWivPgAgiO1FD1SZ5NP2HESMj3cR
	Xihpvm95VAsz3FhjIV1oUsC0Bc6BUPuuy30MuKFsiq2lEfvO4VEX1NkZ0RBpMop/lpciXaXl4gA
	uwHtpmE0hrZO/Yo8uzq14mHl98Fdvg==
X-Received: by 2002:a05:6830:3495:b0:862:b9dc:183b with SMTP id 46e09a7af769-86315a31dd6mr230760a34.27.1795102133180;
        Thu, 19 Nov 2026 07:28:53 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm4560975a34.3.2026.11.19.07.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:28:52 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	cristian.ciocaltea@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] arm64: dts: rockchip: describe PCIe RTL8111 ethernet on Indiedroid Nova
Date: Thu, 19 Nov 2026 09:28:47 -0600
Message-ID: <20261119152847.312239-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Chris Morgan <macromorgan@hotmail.com>

The Indiedroid Nova carries an on-board Realtek RTL8111 NIC behind the
pcie2x1l2 port.

Describe the PCI function nodes and attach ethernet0 aliases, so that
U-Boot's fdt_fixup_ethernet() can fill in the MAC address from its
ethaddr/eth1addr environment.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index db6adeeb408e..d6254abe53c4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -43,6 +43,7 @@ button-recovery {
 	};
 
 	aliases {
+		ethernet0 = &rtl_eth0;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		mmc2 = &sdio;
@@ -493,6 +494,20 @@ &pcie2x1l2 {
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_s3>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x41 0x4f>;
+
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8168";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pd_gpu {
-- 
2.53.0

