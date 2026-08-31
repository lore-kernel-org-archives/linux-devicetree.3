Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC8E343889
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219390; cv=none; b=psKupun5ByszSJfFvZDCM6TV+pPuInTF7ByUSJJI3d3znwM5wwm9RjxuYsuRQAGm5ythE1Ra/zFAu6mePPwUo+J+Gx9BI68fu+2LOzc0bUbdTN2O5x1eENfj9aTTNh9i75Ctm08kbR3Dq/Fg4PuKWLFum7BCSVow41eTK5SF2bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219390; c=relaxed/simple;
	bh=3H8JaHXZ7KeHJkuUYVZ6lz7owGpxdvcLEIEWKZv7rvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exCOz772EFF3ThmcwjRFnyG6V6XolAKw4vKK1ie5N9FfdQLqZAleY6S/TDocIGv3acK7mafgQxzUUo8ju3Sn0MfBGx/MZjNNjABpbm1ZWyLLDgw+fhioaKSknWo6AKbmB8lNoe8vS8xc30rmrq09CeKYTpBBg+F8Ui3h6KQd7Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ox7bCNrp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ox7bCNrp"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce98cb8165so4668835ad.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219389; x=1788824189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xl9licwXR/swzm5cX9g5EeWFJilD97YjV5zsf+lppfo=;
        b=ox7bCNrpP49wxiN82zzEgCLBAu+kUyWer6C/Ja0QE+vpipN1KRd7Gw+htF36IB3+TY
         /c6G+bLiDR+X4cq15qgyiGzgyDVfSioxlvC5MfGfl4VP6G4z4lFQd9K5lG1PnIyJ1QIX
         9Igg9RCPxInCV4C3Ycl0rwUWmxZFK4V7Kyb0saVmOZ/9p9DpKA4pGsolvs3ywRmh0NHm
         Hjq+V1siC28H4A5UGAM2ObwWSVIp9e2IQmUHpLXmLyqchRv08quaDJATHazpE+Y78g9D
         H6jIw3wNt9soIO9rj4OF58eVh0et3Qzpf8aCgr/hzUoNlah/F5S/XNRWuGoZjEDoIrTx
         WfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219389; x=1788824189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xl9licwXR/swzm5cX9g5EeWFJilD97YjV5zsf+lppfo=;
        b=QyeC64lsASReQIsNW3sJIDN+jeonaMULD1KAJHBqIrvdfNSEAcN2JKiQkeikfpyCzc
         6Sb3Cim03EKBdkEfLt1jn74y7HkAQC4D9XvgAoQR1lnqCQvQmFL8c/o5Yn1BnI8l8Ct9
         kNOlFYQmF/aA2qCwUvVQcdhH8YAwLQzx527uoRjrx+8rn5FABNI+MGdB3aQD+hixv+fH
         yXJapny8frhvxlQ3bWgExVbAlUQ4c6rZFLgAvl/7KV0dOYMN5+3akbdI0fGld6RK6uDB
         YIsnnpypPANeNwjco+w41oTO+/OWScaGkieJ8F7LpISDP2sM7QsbbInA5muX2XCRwEWr
         Je1Q==
X-Gm-Message-State: AFuF++lVcYvRwMvSObuC8oU4eCg/+KUHAJYP6AKpMJbbfDk3NWYidXwo
	ZNKbhpksJPW01F1JCoW+4aWW7sKQoEZvaeqb0GE/Yk2ob6iSF+LCXZ4uO6pR/w==
X-Gm-Gg: AYBFou0UQdjQkRHDAbIbK96XO6K8bL2Gt8aGu1HoVj9vOF9JuuHplvm1b66uVl96n2W
	2VaAWt9rxaFWCk1eRNTcuXySRB0whPpCyB3hZXaevnrn8geKp3S0Ti20PVaEAuCSfDMr9L6WrQX
	G2rbw+J9Pr8H0ZXQk334rrcTg234W/pQ62Ok2qw5gSZ9PdE8OMIK4wWGvdL5FMhkoiCsU4mhsy/
	hJTpC66Q+4vT7WSqrYCigZpBmNSyONH1pEG13XXNwmXd53U62PzhelC6TN5p2LJiuZ01iqwEO3i
	hqyId/QN2EpcQLGwXC+Q7+4rUZMhJIZUNmJidnRTr/IPyMOkwrIEw24XuxQavxRVupKJ4lpdabR
	57skuPerFdeJs19RLx+13lGxeGmSXD6Q2P48D/4Uu2crpyf/8llSx/zrGIozqXpF9PTItg3MXd2
	kIN61Bsn7qM+Vtd/j8DvdIsEy3AGvaROdshYe+/5nL6YqikoDkqb841RwVqzVcUXiJuI57l5GKr
	1sWYK5A4VKss3pH4UmphpNdW/IgSE0246t0wjHMPniFCxIZOFrwDJXSWaDV8UEnyP92PbSUma8R
	CmetcfyojWKRGTs9rd5K5+drFdDRgCiXOEi5mA==
X-Received: by 2002:a17:903:1b08:b0:2d8:ff71:66ae with SMTP id d9443c01a7336-2d9526d32b3mr11811515ad.1.1788219388599;
        Mon, 31 Aug 2026 16:36:28 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d951b52bfbsm3732835ad.17.2026.08.31.16.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:36:28 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: helios4: add #phy-cells to USB nop phys
Date: Mon, 31 Aug 2026 16:36:26 -0700
Message-ID: <20260831233626.13947-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usb-nop-xceiv binding requires a #phy-cells property; without it
dtbs_check reports:

  usb2-phy: '#phy-cells' is a required property (usb-nop-xceiv)
  usb3-phy: '#phy-cells' is a required property (usb-nop-xceiv)

Add #phy-cells = <0> to both nodes. No functional change.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index e63b8b5e632d..548fb92ca811 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -141,10 +141,12 @@ fan2: j17-pwm {
 	usb2_phy: usb2-phy {
 		compatible = "usb-nop-xceiv";
 		vbus-supply = <&reg_5p0v_usb>;
+		#phy-cells = <0>;
 	};
 
 	usb3_phy: usb3-phy {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 	};
 
 	soc {
-- 
2.55.0

