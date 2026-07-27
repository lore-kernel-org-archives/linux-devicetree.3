Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0DE42A172
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183996; cv=none; b=smDtSr9Q14xJdUTPePMeDeGlQE1ZBbMg80G67LSKolBVt4i/A7E/wi34Jn66RlnZU3jJwiISCqr5iFF8jXHjhzxsLIMSvGRytLmc6GIX+2tvBfzCiE0BHyEdMrjUYrTy93q9DdlsSq+MFXx9+Ud+/qpA159zJ0LA3Rp372UMVSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183996; c=relaxed/simple;
	bh=7ysmMaUzgWk8FB26vpJxhR8hXfWWbep1ya7eZdn1FnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gsRSU2LEVMuGBFSGA385QNkabhnEK5girEdTgbWh3TAn8VUKL1+SktstnntzaIBXplAP7YNjKazjEBvWaxtOGwVrBH8Uls6UDqeFvQA2oYKQnJ8Q0j4nv0jpxDYHiveQ6oOAC/IGBjaNF6c0GxfdNmKoWX0dY6gWLc3gt/BL1KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOGdWTGJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOGdWTGJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2732856a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785183992; x=1785788792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wonnX1qWAYlx3Skv1xUfzqEtU6WhqVwzV5FeMHblEWI=;
        b=YOGdWTGJr/yPwi7KmyK+Dvp/BgNz0rqMd3jASf7+TYZDkihJj0FajRHjObS29QRKmK
         JcTEONK6x253ozBdliWEr4XKRYrYl45sgg6Fd4tbVWwLpf8v3Kwkbko7FQRRpw7xVMNt
         5O1hV96Cag4wOX4pWz43YeC5j63D+5MajQMLQEHNUREg/BqK2fCtoEoT+9Q1f0t49dsE
         K/TrIXpcQNF4B7sEdFxkWtCyH2hd9Uvm7SOkYW42KemYvAivXblSNnpA8hLIqnoB3o76
         2jCvXbHrFFG7Ghttbq0Tf+KpOIUeI3XaGm8catVZu7S6qw9uMPUknMzXFLkbliu304ry
         JIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785183992; x=1785788792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wonnX1qWAYlx3Skv1xUfzqEtU6WhqVwzV5FeMHblEWI=;
        b=JgG+SGZulZV0YZf211yZk39D+x944eBh2u4MKPs1qV9z5Dc6r38jZZVdnnz6eQyniD
         r640pnRCfyg0fh+UVRZyy5kGtbDMI8d1vCF8IeeGFU8BT4jbuAhOUCAfGOmHRnFGJcDp
         9NvHmIjasQX1Mu1M300tAoDddqEgObGcE3zWV0qfvbIxnMD0rJTJI75qU8t6TdwKvq7p
         +RwG5bWYtsaE7e2xRvF6Z0d7cFUFOKrMHVW9cjxwCcxzyv+ZMTxJ6Sa0/TUKLo8No6T7
         QpWayBebR7cre9c0HZ0f/tJDR2qG7L5oIX9QZQpz1aca1M3KQ8fo21gThDCvRXEkBj9F
         kGVg==
X-Gm-Message-State: AOJu0YyHN21dtCCcfcZwCd5pmVlBCa7C1zXywplBSXdmRjnDBlEsSw7b
	Mr7pN6A0a7CLaEXodEiXRY6RTmV2LLpwJDojDH/2WIfCmxTqxTNa3jhP5+H1YfqA
X-Gm-Gg: AR+sD11I/dxgGnwXhyfFIXz9Pq5vwegCerByglrmcUGMd7Vt2dQNzQjP637EYDuuZWO
	8ooHtkJiyqfr1FZR7BLP3PjU41wSuhCkiYuw+ZK55a0pRtcMEDgfL4yuG+fnF8Ang8IjoBzhwkT
	/YQ50K7gk89WaxRhRYwlmJDOGvsRbvZEYc6sym3e63rZAFNSZlaHvcl4MgykvkwgQw1OrzIWW6H
	4WHEOGtx58pvPBPZtBbn0WEeqmUY9aqOCQo8T0BP+kSzlph9+sTJYNga/d/U3dYL/DCK1ZQZasg
	fOjdKvIO1mdvnciQ/sTCDWfu9H3dU/e33qj3LytydpBK/asIbdSRqT/dPR6zJaE669Lw+6maogW
	BXMFfMG+awOVI1PIexHEIW2hpUMVrPZWo9iN9hwWEBsQfIkjsvQoqL0XDhLNnJbNGvDnyNzGYnM
	LfZXnOSKZtPOQ2ubgoBkbcwWvXfJspQFHvBe9dOQkS34oQrSOyeCodbVspN27wE0OCGT18mI7SH
	YVyDeECNSvbZ9d3aSJawLNzfLsVZIh6Lxbwn/zcwo8IEFl5w6c++ipxwv7m+o8V4UFeeIKwiYrW
	VpsONhhaABIUykfkTwQqefAAxFnjAekG7ZdHi8FpbInM7yxD
X-Received: by 2002:a17:90b:56c4:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-38f64977d0amr708875a91.15.1785183992369;
        Mon, 27 Jul 2026 13:26:32 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc57ae17sm31145099eec.22.2026.07.27.13.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:26:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM53573 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: AC9: set WAN MAC from nvram
Date: Mon, 27 Jul 2026 13:26:30 -0700
Message-ID: <20260727202630.21572-1-rosenp@gmail.com>
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
 .../boot/dts/broadcom/bcm47189-tenda-ac9.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47189-tenda-ac9.dts b/arch/arm/boot/dts/broadcom/bcm47189-tenda-ac9.dts
index 3ac6cac541ca..8b2ad7683529 100644
--- a/arch/arm/boot/dts/broadcom/bcm47189-tenda-ac9.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47189-tenda-ac9.dts
@@ -20,6 +20,16 @@ memory@0 {
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nvram@1eff0000 {
+		compatible = "brcm,nvram";
+		reg = <0x1eff0000 0x10000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
+
 	leds-0 {
 		compatible = "gpio-leds";
 
@@ -106,6 +116,16 @@ pcie0_chipcommon: chipcommon@0 {
 	};
 };
 
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
+&gmac1 {
+	nvmem-cells = <&et0macaddr 1>;
+	nvmem-cell-names = "mac-address";
+};
+
 &switch {
 	status = "okay";
 
-- 
2.55.0

