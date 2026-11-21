Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220820;
	b=Ig/0wodHjn8NVpNdKr+iBRFlQ1J5J6rEvUygxQR5wuDI7zzfixUYucNmm/vYZCkT+xOr
	 ltZl/LYYdQnBX+7S154iBJ6vSeoOsFtDqaUgkmirD92TV29H7urvDgnis5E7/FmoTK5GG
	 yZgRvH7B3nC0Iq/j1a+7zXrhSk8VN+X8Va8CSusTecr+2pqcfep5gi+whmX41wFMpab1R
	 /iFux4w/NSWJYMuDGgmUwrJvC3mCR9Gnt+GrZS/Lv8d9vx5WQ68fEvR+4TyXvjkrUQjU9
	 fLpJmWdptOvRmnH4WafffmW4knDPL6bio5lrENQCdgITxxq6o8z6YX2fhavAgPorajQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=;
	b=sC6xLa+t94C02Meh8eMAkkKJkVdB+xgg+KeNmXSHq6D2Tjdabl1uxxRDDvot29Cy6+N8
	 7AcWCZlKhpQa49BEyK38KJQjT+Cyagm8J9mPKukAYk+mW8CgVibsyktdo4LkizSdQn0YS
	 T4d6lW7g31Z0N7H/BqM8H/dimKusQB0PnU6irm8De7/hy1Dwdw/wMP+rMBTpBd4S75kEZ
	 xXcgTfT2dFsort4LjdmLoOnk0NzN3Ync1ROr3VYlNgWkmjuDS+H0QMm5bDhCPWhsQf4sC
	 JKNNVWykH8mvdWHiybitc4Opd2pAmHYv4cVSYO+nvveYyV049V9R1k8A77GY6qz/B+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyNi5nwY;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DA4606A69F
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35DA4606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyNi5nwY
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1053467a91.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220817; x=1795825617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=;
        b=oyNi5nwY5MwaBzwjftPqnidwHbe/Se697Xolb1rCTDFMOWZKaR0EipTxQpg+D+KFzB
         wdJD5N3uDYRBveq3dSxqmUZFebOrNQs6JNZ/PUhwVM2HthIGJlAYJBfWYqvjTUIHdNFD
         IZ25GVqv0N8jzdoXYe3DYAOujULqVb4NKn74ThvBL4OxpA8Y09/eZYXaI0X592MJmOvO
         bth9kgj3RooU8UrwDnGOvEaG801gpko91TyRmtW9rdXeSuoLOhDmyvdl/4vkdDh/r63Z
         NnDw+TZ1FVhzXuzFhPjOUvQLUUi8VqaKFQM8uAB9BhS7GhqHrvqs1/PLoI8Cy3yTDLjJ
         3qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220818; x=1795825618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=;
        b=MmI03Rwl6wl0un8bkgKTHiljIlSHebRiGIMEGyhiDXsC1a53fRs7/k7zDuNcXngbtI
         1TIFIp0Z8HUNYXYLdqM1dqUCMGFd0Xk0aCKeck5dua47FHceMdhz8XP0t3pcbv+59AcZ
         iREqRCVoo2lekWn4CKrRuGo52TYOuxTXL5dRYH4EA/YI3I2TL+KENIspOoQV749WUxiu
         DaYvoHKxu0oplUpF7mUsqKxoMKSYmTuvEBnA5QCYnZ3v8KEZrSXGxmAARZc/8UuBnpqm
         JeuaLn5pXyfRoZLfQXoj0sCWmiSsTR4uvL9wE+p47ccFcTWqYp/rSsVKKnV+hUtz8nai
         8Cgg==
X-Forwarded-Encrypted: i=1; AL+hErFxM9OqE+HfU+zI8WqFrcVMg0wjgKa4HSVKQScUT3ISjs3ghkL8X/nhZAClqJRrlvofwTsILaWmhTSa@vger.kernel.org
X-Gm-Message-State: APuU4Z/i7EEEK9CFf0HE6gMpDyjQTEr79TNYvJ7EpVPG+5OXnaP6UT86
	eT59HIIdrE5UW+CuDve6fQfJ6snyYyt/R37jbb4P3uzOe+3hYjFb5RSt
X-Gm-Gg: AZFdTZfRJRgQAxFCs89arr4PuGlbANVIlnhufleykzzyNbROJ0y+wvYUAYInrly5QC2
	hKWM4jnEc34byMzspqwa8aD83tA0Sh7C5mhuxlABX0jNHvZgOQ20YRExWMtQSFtPIUui7FhFSsp
	aLayU1rFz2RBscZRV74olg00II4PJDrukHpBZop4qnqbvVCy4Wvv0+wE00wISNuRukvh3xDgNMe
	QXKJe6VhWb5eW1PVCo5zFxbxV2F37Fa+AnM2n7+FBdkoaO0ajRfZNdLVblDkF+dOiNqqSvTwCRu
	M7a3cQ7n6KsgPDCcFEeFkh8GdrSRC6v/wQLebdEZAuyuUby9hX/aKNlEqHO8I6fUkCtTByseZ5X
	UqK5lS6gsoh9OPBv8a1QspapwWW0vidSpmY5z6JclKd9SjTcneUa9DT9bGfJEjWel1T183q2Xm7
	CDBjG16StzqNKXtdAbDzGaCI5FRk/gTXPz/j2rBwUrohXwazeDhjxGH2v4rcPqlaBcye6bz2wgJ
	t/HIDALKfFsqwX3GMcDbdYNkEESwpgMBKaVP2AYixQk05Wk1qrYv+eRx98PMfZgV1hs3S/2F1x/
	ZixbRt1WoNjiOcY7mM9NxsrPvqMu5JMnUdmiCZT1bNanvIimJ98a8IL+Bo2zfY6wNVpoMyXXXG8
	IlPQ9rpnrWJVRMIW9T/C1gUD76INPFu7I+c0xpt+nhU16JLd+YvRPIvXnSodR3ycY297ijHpOGy
	QCO2I=
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b636:763c with SMTP id 98e67ed59e1d1-3b41c8fe33bmr4553827a91.22.1795220817531;
        Fri, 20 Nov 2026 16:26:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 19/22] ARM: dts: BCM5301X: Archer C9 v1: specify switch
Date: Fri, 20 Nov 2026 16:25:59 -0800
Message-ID: <20261121002603.25254-20-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
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

Add labels to clarify which port is what.

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
index 5a8b2b1567e6..c38396ac1288 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
@@ -120,3 +120,41 @@ partition-file-system {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

