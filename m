Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09F6415F00
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 02:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231198; cv=none; b=DB+jex+TCAnipVF5Y9r4xJYlccaBI84OKI9gSCaUYSIO38TijeZuV3oXrSFDmSpJmHVyLx+S3HxmuPPMnB/fgTSmJgsCxQT74xftYZ2pAKt20/D9ik8OCNi0vlXwZXyZR6imHQvx0XNoMk95cWeO9vVe4XZsnaWJOognQ84VF7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231198; c=relaxed/simple;
	bh=OEHTaTAcpQRiynZYruqCpTdYunZ1q+plyEFQSfcW0bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fv+idOjfZNE/hnhQCo3gh8GJY0p0zDJwnpUAu9MvZVCHvH7lujqhUaKsNz3jUivHnjrhODjr5JW8kMVVs0//q/bWrbfiLe8Tzfcb5x4YMlmlJGdPr7yTqsqPVSwua0r0NIsiXlE2OUyVOieb+GNt8VKHNOis/O1ps/qZ+FQs7q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKhl+6DC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKhl+6DC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceab75934dso49900975ad.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788231194; x=1788835994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycaVktr9GUautRfaUy5FlWIJEqAYyOLe3etWF2OPKqA=;
        b=MKhl+6DCh3iKCVG8cKb2zBpXPPlyWHPIBi8ztroFMLFY3gXKdcOThADfuhhkphNTVS
         TYV8VP7xuTIyQAVui4+RF3XX4XuEqFrteI3OjMJL/Lt0qDCDiLon9S8McuYqcRTAtkzv
         7ivkYUqYjghozHnzrogCgH5Pi7p86krOUhRNCUr/3hFEhBmlupft47AsZ6ySeMvLosow
         cbu3umWhTHawIlZ+eUDp5P3d37GVFjMwUFA+za7rfAYpYzNzg+f/9o7a0KN7nI22pYZ7
         n5oZ8D5J/p7fsYH0IEcI1or5E65Sa3Z+agpJANp0BxVUNI5RPuWLBNOtMm19v1x4KnIk
         Y0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231194; x=1788835994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycaVktr9GUautRfaUy5FlWIJEqAYyOLe3etWF2OPKqA=;
        b=EReMNoCUIvjhIhRfni9+nSCcS4GYSucYFpTKQrEOgfWPURJXs9nbCiwtY4nW+jYnyj
         /Y63V1VWtum2gMRxdiQ4M4RgieD1WwuJ/kD8X2JvtfV3DLVy+lAXBj5AgUvrwzMRiaI7
         XvtDGvqpC09Q6AVGSefn+k4atiUuh+b8cKGon/KhVsofOG1+77lIK9O7XoILUKcC3B3M
         jQhPM6AL9cdKG9OEIOsVHSeFZaVjhpNBeFcS4FP/IBukc/fh5zgkIKWQvOXBkt+H6U7n
         wpoql+S4G1azmbnUbih7zpZTH1hvm+3A5idPMOwOBtMbxv3iRgtiiCyWyAcsEFd350mW
         Zabg==
X-Gm-Message-State: AFuF++mVkZX2+LFK3BjgNYXKRV44Im2O92oLBqIERHTdu8bT0sdKeQN9
	drIo2z8xyoW72oRiprqLAzRld6IS6zI4KbIe/7/e0K3rO0FrKW1z0bBX89UOJg==
X-Gm-Gg: AYBFou3IfaHCiTmSjTY/ScpLseCt6tm8pKd34kkhIIbWZblUHkHOubRe6xBYOL6fZtC
	x4NdYvherT9jWpK7k45oMfPFd9IkphUwW4yJUfRXveNTAIfLl/5dHfO00tGYyiyq1loH0ocx+nW
	3oaKbsAoe5EzZj+2oZs1AQ/ZTZjywfLkDU7QxfFj8DAxro53ElCIKIb0H16IPjsIp9qigyHC/s4
	VmP5oF0GiIQNSlkdBC2LvEmx1cRPU01JpxU9fJx6CvSLnBtmLey0LFPDRTGF39zBjn/TWDe1Ol2
	2z6saIAOSx9LYia8guhns9+o++Vscan2pkxzx6FmWJOyToSOFsuq1sY3hkNguKtv6sQdDr/5kO2
	aa6Ep7cm53Rm9mrR+ySjAI8fzhQNhWtAb+YvKeyrZQlFUiR1ZHySP6eHYUh/BHc37FBFBT8VUSy
	N1NkKXJlNUOCGRmsoCw0AoZ0wEwy59adWGdr5eas5yv/xlCu2kjGG3IU2qGIiejXN7oHDb3Yq5K
	zYrQmFJjii59WlvozOLzHckxeKi8mYLE7RkTIhp4aO5E73MbDOD+3GvOiYMY2dbzARe4ezE6x8n
	3r0xiDR1UMiTGWYH2jY3qM0swkXDT/VShaRFeQ==
X-Received: by 2002:a17:903:fad:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d74dcc2d3cmr460608505ad.8.1788231194184;
        Mon, 31 Aug 2026 19:53:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm37613800eec.0.2026.08.31.19.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:53:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
Date: Mon, 31 Aug 2026 19:53:11 -0700
Message-ID: <20260901025311.955936-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input,
allowing the board to be woken from suspend.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 176198d99c26..e3376c703cbf 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -87,6 +87,18 @@ fault-led {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&microsom_phy0_int_pins>;
+
+		wol {
+			label = "Wake-On-LAN";
+			linux,code = <KEY_WAKEUP>;
+			gpios = <&gpio0 18 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	io-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-- 
2.55.0

