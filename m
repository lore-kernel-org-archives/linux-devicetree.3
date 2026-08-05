Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C579D3DB31F
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 19:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956661; cv=none; b=U6ddyhk/arIG+FfbvlBfsIdC3yQiR3Cq21QzdH7e2+PDqrPxF6bhBdMO+dGWPs1ZF2GS2MLVRu7/5KnLfSYusruYYW5wcyz3oVxj3qRVvQWnHPLDrWJSEFAp/eVaaY6TbZvjv5pG28wbPgOpHY+vJiuCa5TZT3gHIA8i9lQErew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956661; c=relaxed/simple;
	bh=Q1b0zJJDZ/DMUmf2mSCDdXPntJHX9qOBCUxZIm3+8w0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OK2Gx/Bn8BYQmccSRrhWR/1ucOAfCtN88OS2S7So/XJEqqo14WzNp6QESFRJGlk0SPIaJ8TXpNjbEBu3FhuA/Q4VgtHPYdhprAc182qFsHKjsaU8IvRz+EZJemeLM8APTdtFRXG6NZ5aPt21NtNnvjrxat7xIjouWOf2ZNJOlpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCIObgAE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCIObgAE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8486ac3f347so217203b3a.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956653; x=1786561453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jqakO39GFUcynzLn+nQGi6r1pMcg+V7Q1upS+QtlAsE=;
        b=LCIObgAE1rwip7xGqtSsZk3RwNRSFvqiaXuAe/tfIv+JygkmC2SN+zMm0joE2ecKeh
         P5xY75cAm17MbXDX03nkaFeOzSaz8NIE5Ii9l8P2mhTC4tTeJzdg/GsvAEp7LQTkhmSQ
         6f85qI2CSHpVIrD6Kqf+F44rI/47emtUax3lCbuPwhpIjveJkHJoiC1NHUimYCMGXxx3
         trfJPbLIT2p1VExdlHEFFHWs7OifL5x8KqhekvUQAG2/Mhxi3TJpXPeO3Tj47NIC3IDl
         0ZMzRxYFE1zbP14RPzQKBQ53a28v0kqf9DT+S3wnunfy+kfkgCASHOzjdlkBPy/bvmv6
         RO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956653; x=1786561453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqakO39GFUcynzLn+nQGi6r1pMcg+V7Q1upS+QtlAsE=;
        b=MEWMF8uONDQkVi/RaROFEhmnzjGZqFPHfIeKKhX/2v/b21ZW7K16+5kNzgmBbRtGVW
         mIVj+0DP22uzeBBzIE2+uIQj/u10QNCNxK3aeBtRhdDQpqTG4qwqJA/JlsxJv5NLDd5g
         v65jJwS7/NozciENOO9AbMqNu9euEvZ06BUtsC2Xp2cQmd7cPpBeJmUSLHZu7irfPdwd
         TsiZX7tCQOpjJ4Lx7LgQ5z9DCxGd0Z4FFsEUogGS5Mc/rlT7T+ymWPj9mQWfyo4fgVRI
         XotiUa1XQJc47NnxxcRe/CNYufyIYZWcFJHFqCDwulq2Z49T81iEEHti8YaXamDWTRmn
         uayg==
X-Gm-Message-State: AOJu0YwCuEbX5l8UW0nV6qJW4gxhnw2hL0noOUPTJvRDg26YFQZd6NdQ
	DjsjopVnZ7qwhJ+XPD4t82IMvNNAzIvmIx6nZCQoW+qn/CGLigDVyYDWAloPVw==
X-Gm-Gg: AR+sD11cmd4wvQ4w7rMiUb4TKtcvHqo4KJPlryn+v3UnC8A6vQP3UYY3dscul93PPfJ
	OtBK/s2QZiCYjwxiOSO/z5gARCn6nsy/ZmRrm8qNH8tmO8jWl8NmIGe3GTMB55V9eFJJwz14ufJ
	vVc3xD3fJ+XGlZCeXezR3XX0CPkFdARa0Mkdipde36u/sZ/K27bxNjWBALK5Hky1Sb3Owv3QEeD
	Q8vl2hrW+RkosG1R4jJdWUFJ7O/w+apXcXkHJG1qQLstWdPNv5ecM4r0snEiZbDdcCclUHql1TV
	IAtCXS05etbHzopeENIim4AbsktM8kKSXEDTvLKev8rUs60EEqeA4MYYkyYY0RUA1BvLtNHTJ4D
	Ipy0ADKh2Io3qmJoRDuhhPsyM1IOH5unruu9X9+tJ5wB0/L0WvpJzQZvhMGIyG5SJ6YPiErMPaQ
	1jL1UdttHegm/4L3hDZGggHDLgYfpSMq81w4+AL5FgZPiMjDHoaIDLtrjth5AVEv2Ffl0GbqL7S
	B2IYIUAitfr5JMJ4rVAZ/2p24FPAYhn4WHAmstJDqUfD7ITjIdQ8JIMSPCgP2o9a36DsJOKf2wk
	mDWaxT9as2EQZK8ynhktHkOxhe18rsr7+mQIcQ==
X-Received: by 2002:a05:6a00:3495:b0:846:eaac:a5ea with SMTP id d2e1a72fcca58-84f41b8eb60mr1648444b3a.3.1785956653119;
        Wed, 05 Aug 2026 12:04:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e4d3926sm1309419b3a.28.2026.08.05.12.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:04:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: R7000: set WAN MAC from nvram
Date: Wed,  5 Aug 2026 12:04:10 -0700
Message-ID: <20260805190410.7335-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
userspace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 24ba8f8f9bf3..66ddea2e91c4 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -104,3 +113,49 @@ &usb3 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
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
2.55.0

