Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990459;
	b=3axPAFBUncLjEtJ7SLp+iJBiGC9a4bCuy9yFd8C0QBuqrwmOwscZX2JZ1+N4VK9yvsfs
	 V9zbfgMrVld0EkFQJgYs4Lg+5zobzzgrCZgUbkhgTUwYC/J7o2q7g+YsWOqG8444rYMc1
	 qyMoP1KavoPJ2YVk6DpZ4cI15oFr+RnW5q9Ywe46PxXCVtzQsuWCS8qJmay0MDZv9Kuxq
	 DtTFF8tvXQL1KayBT/+2jEG1KRKzU1Sjrd1zzU1gfOsXzvhSnpI7EJrHjbA3fMsEkVmVQ
	 HfxZZImLtqypq7WIIA0XWFiHeCSq0wLilh69cXw2+xWi5xKb6Nokire/W3GtDKBPxkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZaelhNqiG1jjnWUS7DQjeKgvGs8acmmgXW1oDJtzlqs=;
	b=b9xmlcRF8r7CGGB0TuMdcUyIHr3SKHFRASBrH1dzrJXG1b43xAdFLLTwQFdZd/G3qcBC
	 2DSE4VChBO3lET2OQYwa1j9G79tj1N87Azbin5U/t+v310JyR5edtOa9Eb4eAQv2h+YmF
	 HNnvfsbNIAZCoiZlxMqPgSom+Q9gkjHUrTIJbAmJdWjKFarW6R2hR0tkOirsRkO855v50
	 PBYSEena3Zm94K/U8QsZdF60B6OQBLFv+Ubn6trSqi3nhp+p1tDW+GuDULeKBukY8+rQZ
	 WMKWFs0lVjCxhp8AMAZ0VmFUaHcVqkGbQ3q1d6je4qT33gO9/+uECwGLVIZNbab3mXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CIcvlfK0;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1FA606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 18:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1FA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CIcvlfK0
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10737785e9.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990458; x=1794595258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZaelhNqiG1jjnWUS7DQjeKgvGs8acmmgXW1oDJtzlqs=;
        b=CIcvlfK0T97zL65/lt/VU2YSyMBUSNWeRflPH5i85jlUbN8I7vxRaCjPgGLFM71CB/
         J6tmTh2JODT5XeBVjRm5cCHRUZ8Pf3zqA1LzacR3iEmzWW2mb2jJVoos/JXATF7Zcizu
         Kye3RzREd3l4jdOj0McItLU9V4gm2gvLhJUiFrah/7oR6DNFRUrp4bNz9qw4wiKO/53W
         btZ+AP1cKWGkrretllnu4yVFaB5pL8lGf3FaAvT8AZ1gJJW5Awc7n0T6AD5FnW2eMOKk
         iTN2r+YcXF1GPp+TfrB7Y2qS/+c33vaYXUH4ujPS1CXsVJlDiSYAAvaAr3FJeiQ88KnD
         HGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990458; x=1794595258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZaelhNqiG1jjnWUS7DQjeKgvGs8acmmgXW1oDJtzlqs=;
        b=vQ8w6umB+EJSRH7HDvNTbZKF90eO2TAmis2nvYdYGBtVZ36mnM7xznx/oFzBF8/nXc
         bZJOhXwaM12aPCnO5Kibt0epHNHmwP5SnX3HRxbmcHz4ef1LAt/gMXO+3yMkLN53wS3i
         SqY2WGwCLvkJW7OqtJt1EYQ4MxXK8vpeVECgY9BsYzXbSNPo9C6IgG2rXtFps5ASHLqg
         HTVaLTc1rKUu2Q3W0CCHcRzVGKzL3XDn4m7Ni/e/TnoC1WlJ0RJhY53AznVlqnUakMlP
         bJhAbrLgxX/eOxtylotBm4E0rEj+IQIM4XxZNivKGQhl/flbZc2cGOws3gU71qlsckZe
         FYaw==
X-Forwarded-Encrypted: i=1; AKwUvByDt1m9HU4TVafeqPEni/tqo17oSpfST2Yb/Ga8cFiRcYh5cyomjLEeeHs8om4irquBfyoMuKMyKCGN@vger.kernel.org
X-Gm-Message-State: APuU4Z+nhy3GAi9yS7nMguGSR76NcJR0tLKykNL0BXVBaM8jeBkCk49X
	nKFV2a2oIfpq3O3E+KsdCoE2A60IW+IGFNeGCjWkRgsrNYy+Ngpc+7Eo
X-Gm-Gg: AYBFou1LXdrvIbhrFTG3URJ83nKxIDtX44ATAttNpYO7AHp+fkrHlewvx2mwWhtwkFe
	WxdXc4YOngcNML7VH5fe9sv5p+gBNEXP2RCFoG5C7LwaGZJJmJts3h56F+3bEFMURdTx/PnpNHA
	gTiPG7svBI/dinSNH/DS/i3wUkuoFBJvdDHRLJPQzAoV8WbwMRpsMqplb64wdAEGYcPRBzR0TR9
	/xy3F6yxImTK8xt6Sdvcisy368McLvif/uw8EbDqItlhoZ9+bB7j4zkz3yAEGojn1ovauypKU0d
	1P2cDQlGvStu1E4v+4e3ddTwPg7E+3rF9+EjCBAgkFKy6eGS/p6Nl31zG12Y/nDrmOBlo4LWx1K
	xIdt4MDRqc2qdG8733XyhoZ1SMn1+WJZmZpdBvpyYffHtMAAGsNSZw8vksdnccIcY1H31Oby326
	PUhW/6lpST229sxe0T5L5piFu41hiOSLQJqva3il+xZ1OGONutqXwa6FLLyrsOygQB+Kn9ESEF6
	iXYxkILVhSup+3FkiJfQ/r52wo72G0ollALAKqyTUU/WZEcCqeMKBr2k3iGCuyYocT/U3ApMnNj
	s7LQephl0HPXHMPulSHbqX+X0w3A0Jg=
X-Received: by 2002:a05:600c:4443:b0:4b6:b2cf:3088 with SMTP id 5b1f17b1804b1-4b6ddcf59abmr64076295e9.14.1793990457805;
        Fri, 06 Nov 2026 10:40:57 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795012503sm3874945e9.2.2026.11.06.10.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:40:57 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: E Shattow <e@freeshell.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 18:40:55 +0000
Message-ID: <20261106184055.3891621-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The firmware turns the status power LED on, but the node has no
default-state, so the LED switches off when leds-gpio probes and the
board looks powered down.

Default the LED to on.

Tested on a VisionFive 2 v1.3B.

Fixes: 1ec99dfe9eb0 ("riscv: dts: starfive: jh7110-common: add status power led node")
Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 64de468f2..7ec94e968 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -44,6 +44,7 @@ leds {
 
 		led_status_power: led-0 {
 			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
 		};
 	};
 

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

