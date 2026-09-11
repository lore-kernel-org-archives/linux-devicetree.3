Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088CF3537E5
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154324; cv=none; b=OmsK+zdr2wlaMffgr87ZYUQmYD/csgwB/AykkVvIoSzmpK0WH36Lqn3c2Bux7GNliR7WkFSBoCqg9GNzLUB+agl1LeMUfBP/JEF/QMwFMSnDG1bGWPkHMpMvmYHs+MNcIM0i+f0z4e1XTbF29AM7i5cuE8j6XgrX6Vv+pzueJDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154324; c=relaxed/simple;
	bh=1Q/rIhx0THYuTBbYEtvYk7MPD7tjZ93oQIYtC0rtD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AnuO2MODpruqdISJI5wFqeEl+YftoqXLc+ZMEJRdsq3m8WwvfgMVeq2Arci9WnAvNrS9rCuxdxK9HzJTBuMoeLfDA/egCGsJnDGyjf6CcQJqmtUQGf+LkEqEwuQUSJlrkpBkVCHsP+xDXGDOI2cNsEnCwWHTF+L5DoZKGPm4tak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTTDC67C; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTTDC67C"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fe517774so3354895ad.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154306; x=1789759106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz8Ujftbx6uO4EEfstLR80Anc3hrjvDuwmMLGDrkFX0=;
        b=KTTDC67CZHsWK2lzjk3WaSQ7D9irSlJLBELyKvjzXEO4qn0xX2kpAILXmJQN3PQilH
         5gj/jcd/yQwOgHCdgNnXpCj8qvqVbPuqVb7ju+Zg7vKCmyShp+8bFcEe3d6j3Q8pMnhB
         KPfWdFx7AJGZnlGVrn+7YJmxg8RZdgo/zSHwCVFg94JMbMP+q3F/ImnGxyjmMIcqLKqM
         JkOabx34kBuB00aeqLOICfC+t5z3c83r9RKnSuuyQIkazrRmKWD+4MdW/l3/TvXEZQq4
         1Eof9o3613CqzTLKZ+nIVJJBseiWo/q1KglWtYjTmo0irvfjs0RwvChtxD5j7DPvBUBd
         MJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154306; x=1789759106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz8Ujftbx6uO4EEfstLR80Anc3hrjvDuwmMLGDrkFX0=;
        b=nVgBOfydCt25IQhTq3fQMtK3nSnYmU/W8qnQDQGA4b8Q8NlbNZz9e9PbxVk2q0R/nq
         tmYOpC3ePvX74C+YR0+Znij+lwkf67Y7fHcAJQ9UU3tqeSHG1uqPEY0re4KwkAafAUq7
         cl0J39aNp3e5qOSN+DLQjIRB8IiT97AN19nm+IN5DMJeK3i9Sih1i17JQqFnYLt10SGG
         sOrnSlyoWz2guLuWoT7OACsX5AowT8kMEY9RX8bOo36JIeYe8EzWsH2dZy7Gr6qNaLMu
         zU7QNrHVV9BxnRJ/s4YGHQtKSLBrNoGuWM5cJ0R4AUQMST/rfOfGnrw5/YfdEbh5ihMe
         J14Q==
X-Gm-Message-State: AFuF++lWBnl4BkmKV0RDh3tUGh5CxFDffknSljGxrWTUVTMQ5ggdf8Ak
	nXaajU07s7E0npjkh1q+83U4chi8tMTpbJFWUWYPZPX7gE1JRh9+pYTA/x9FcA==
X-Gm-Gg: AYBFou0gIMzOnDwaOdHWe8a4jPbTtackZhwnH3bVlVCVLoXq25tuJBHXsT/5HVsoQ/k
	2k3+vOi6TprtuKp91BTW1XmciRFbG/HkQsrQe3bPUirX+l0GRNebAZgc0WibcGH3G7l+Pq2hA4x
	2TO89McA06sbgM49NBopH3ZQFVfPs82xnP0DlX2+Gg+LGtuBhdZmqGjzFMxbAQbZsxXEVIQPI6y
	BpvaJGJO0TgrZ4BXLApn2Ka4PDyV8Q3srw4Rfk3rtxp56fzRvR8BngPvmjkT2xAigJHFil1a820
	DJeMxTQlaGf/v8g8SlymJJjSzaBLh16jkhTWaQ51CMYDEVqxm8BX20tIgbe+HzG+DY0Jmc1EeO/
	Zte3WFr/osa94WLhn9/R8TuMsIwBbdX+PUc5GilRw0H8qqYbJ+eA3JAKQcmviBVKfWGuZkRywv2
	dyjXfJ4Pfd4vYxHM7rDDYtnbDjI7jQZgtl5XBcu9YtnW6YZeC6vtUNpfNPm7MDCHPmGJO3SEFQ8
	/gEpmDfutUXy08q1Mfy8xStI+xuY0Z19FN5gCFDzPYS4cQvBX1d93LfxRTRercy/X1R00sNCchw
	aFDLDJJowfCAVFHbnptDGHTuHGNUBzWtGBMfZ9IKw1qLu/1OVBrB22b5aos=
X-Received: by 2002:a17:903:198e:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2dd2a1ea2d9mr111775205ad.6.1789154305684;
        Fri, 11 Sep 2026 12:18:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcf48dsm16472115ad.57.2026.09.11.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:18:25 -0700 (PDT)
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
Subject: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
Date: Fri, 11 Sep 2026 12:18:23 -0700
Message-ID: <20260911191823.80631-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set MAC for gmac2, to avoid having to handle in userspaace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: set gmac2 MAC instead.
 .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index c80ac16ad949..708599f8c4be 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
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
 
@@ -92,3 +101,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

