Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688C53C1A
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787529926; cv=none; b=eIgl6iihpHITZEt6+Ft7LyGASJNgO5KdjddzFJCt2jqr3k/LzFSzckG2+TvJOWCPLbS2NK0ON7ceXc6meMnNiIXMtOTl7XyCf6ho6fpaztdvkvLOU6mb+Kfvi7KZKi0lQexWJaJf+i8fvhuvPC2q+ICqjsPbR0RqXCVkOE8KNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787529926; c=relaxed/simple;
	bh=gFcONkeQuF6JMvG1V/avYXivrhuMhqVuNjKrfcc//do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=slBvuNEeH5x693BZJ/3g7ZdyN4KVY53SE0+k2h/sGtcysXTTRwCr7DipfWUOAYUaYo0lneiqhx4ayZyBPvJpkFi0a+zQBNsFCYtAg+oyXOLFvWPNNmbmqHiTgtih3yuzdiiWlXhD8VRuhxmjvpJQ93WRQ0FUuV8YoAsmgh+w3E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1nUW9Uo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1nUW9Uo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d0407aedd6so30552865ad.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 17:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787529925; x=1788134725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PnAW/+M2N3uaW3xnWGqAHnUdUrdmX0tYWAkQfErLz7w=;
        b=Z1nUW9Uo55DWVBsn9k5eDxoHFehvyQ+v05sdNrf7YS+BktaoKLxaE8fsQzdcLZydlx
         MjxeEQPYl0uS8xPTPBKzIJmEodPO+iNfPHqWaVL0czquSbhBJmOuvufRVmdoFM8gEO1p
         MxyeXy34/912qX6h2GZZOUvwc4Vgj0egbFGauZPnP1R/D3KoTdV+46gSWsJm7/79UZPu
         8/btyDe+vWlqKgnOoY4kb7WRbQSO5Vug6eWN+qkxukrH8LFacoFcCV4h9XSUVIW6O9Tv
         Ws2KZ/UyuU6jAOoumPqkGmgfbSCyADOeFBfO5poN2VY8QOXvgqODS/Osy+yYQ6O0kAlx
         ApCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787529925; x=1788134725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnAW/+M2N3uaW3xnWGqAHnUdUrdmX0tYWAkQfErLz7w=;
        b=WB5llaEjO7wcWiHq/VFvQTxoHGqOpWl67UpIVSNda/IQYVKEw0knQc5AtcE+ggyZf7
         nhsQZR9rTtzsEvA22DGrD7TvUOobQEE1mX3nyUrtwTYORNblajoXeV5i8b6GR8xKoB3M
         MeS3Wh2SYR99poFe8lMBfLhTApx2U6s/xeZycn/EYk4ESk+BzKV5Ea2UPqRupUIDeu6g
         wpj5/pmcB9+jpgZSRFhu4AnlnXqKad0WCyisDnSeDD+K3xX9ZVlIR7buwnTLaaHuSWl5
         fnEyOscR5EMyBgyQYW7ijm3Uu3/9DXw31J3/9gi6zaRZFwp2OY7pXeV2zCAYTOGrIi+3
         Pl0w==
X-Gm-Message-State: AFuF++l6izuUfR4OZ4f6HaX0hwV5LMykaWMjvFp8Q+WWn/7+WML8Lh/i
	WAyhLLKCcTDExAhJmkaq2mMzeGwIdF39BTrWekkH5kn7d6LBNpkbn1j8w5Yzsw==
X-Gm-Gg: AR+sD13ggpPDYNE2rvLZKgRHPtr9H3b+zMurpEgxDCY9dpMN59ikRWwx4jK47IZGbuv
	cnmixmzsSLMh8lbKu4r7sX9eR617GS7QzUhyoQ+f4CnAT1ystUYZdilJE2+MNpBMja4EbkB8BJO
	zPcuQH3fZqCH29GIElKkJSoK2WeTrubNdlOVlskEtZ3OhB1mZX39N6z00p2T0FNqYwYGkQul5AT
	eG0+hDLW4d4fNdcYkB1WwOikvz7TLX+9KVyMBAX6fRTLgh+1K5AgeAErKocQZYuzdOWCcShiAUT
	xuWA5OtqU669ls/qdQMcSQdOIvkPvzb+Ke6D8dN3eYxIgD1/1PmIEBbOTTJFGhlt8T3mYOJP0iH
	nVU7HjzAVTO3wJZHopx3KLvf7c9WKgosccNbC3vJw9Ld9G7L1LS+tRwp4JRFIUIZLFEwKIKvZKq
	/8QmimiQVMOc1Nl0WHzMfSdPin8gJAapatgx0wUZOcSs9xApMIGDKW9SfLFhYPSgXI+2PBE7dne
	OPVdP45Y24OQvCn6dR4Q12AJgrNgHYzkrZzwInWHae1zpandEqwGg3iTyhslaa4Uei5sp7ZpWhN
	YuvE22BPGp4oKAQdzL3Q6RiCEml/TFUeXSOj/7TsmSw=
X-Received: by 2002:a17:90a:d605:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-395df5e8fefmr26414134a91.16.1787529924655;
        Sun, 23 Aug 2026 17:05:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d7eb9sm7672228a91.9.2026.08.23.17.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 17:05:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: armada-388-helios4: fix vmmc property name
Date: Sun, 23 Aug 2026 17:05:21 -0700
Message-ID: <20260824000521.80492-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdhci@d8000 node references the 3.3V regulator through a bare
"vmmc" property, which is not part of the mmc controller DT
binding. The binding requires supply properties in the form
"vmmc-supply", so the current entry is ignored by the driver.

Rename the property to "vmmc-supply" so the fixed regulator is
correctly wired up as the card power supply.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 0b23d4da8276..092290da1f4a 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -304,7 +304,7 @@ mmc@d8000 {
 					     &helios_sdhci_cd_pins>;
 				pinctrl-names = "default";
 				status = "okay";
-				vmmc = <&reg_3p3v>;
+				vmmc-supply = <&reg_3p3v>;
 				wp-inverted;
 			};
 
-- 
2.55.0

