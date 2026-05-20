Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D743D8116
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277913; cv=none; b=fDOBDN2x6cx86Srx/n+kfY6qrLg8z4+cV+6Ho0FYAIOh4hFcPrpu1MstX05RXEQzt+AsODRxrdHXyZL1KK12Jrqv6MiJekhIBMWtEiDya4aYOmANyZzONXuT3QqA8PRw0IrRdBVVY/1m6Tv2rlj6cxelTePxL5PpOnHn3ooKIRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277913; c=relaxed/simple;
	bh=Oe/Vzac5SSnmypL3MNxPkUlNqyEwrti004P98hSz3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZX3w5dQHPz/2ORKwpwDUYjeHTgX7NnTwc3e/0KLloUXmY8zP1fqz2CVqYnEBZASnf7JNh+nctQbj/XKDG67LHIHavSVy4aQGqFS8vbD0POYHTxkJ89n8m55zQjK23KerEhTLyAIP61F85hnUHNgKbLvHIaQ5so6dhkIPbh+tL0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km9wSA4A; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km9wSA4A"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso28972305e9.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779277910; x=1779882710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCMz/IseOZebpAHaDUgOMN1trxulRuqbc4meMeT7XSY=;
        b=Km9wSA4AxOF349DKpc7ejBbVcJYUyk9+gpedFWNgwLmu8Z9NOfB8Y8+Uw8lHGFW2/A
         X/nbkiCk4qy02vwkN/65v1llnDln6QPtX3jnORxkBMYdXziqDZ9ijR8A/WhEhkUlxuIx
         8F6QpBtPgtDdEIfhdNO8MTXxfsonllK3qT/fDVytX15FSySRyHjXQ0nWNcYdu+JTR90W
         xBQmkI9rZMWfJqToSC//z4ywJY6KDWWL07Uw3gUEI8tZd0/ll6+7iVWpyM2R1gYyv0ZA
         9PKCefYGg2GJAxX6xD0ebWiyE+h9zhThT7d60iFULzcCrSAisDnHO68Nj6y7CmB971yx
         rpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277910; x=1779882710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dCMz/IseOZebpAHaDUgOMN1trxulRuqbc4meMeT7XSY=;
        b=H5ey3hKSRleSd+Obul1q8+MgKgiD6nfuoDeYfK+8Qqq45nyOT3rG6Bm1rnYlJpFsHr
         2S80eGyOisQap4Ub+0lUDSglrqJ0mKtv3/r7si2LuyhD54l1KiuGwRyZhHTWqIKXj/yL
         Xj0xvy+275CFzRLZlYE6rOCQJA/euxWkrR5MmeAPNrGO0JW4T+tZP0AJEIaS9K/1tIFZ
         XDz7O+XR0SkK67C9knpw2KGglNGBHS3eUsWva1U4kbBLo22inZj0hvylH4RXXa6z2D/I
         WeZBxV3CGc7LmS3Cot5GnCrqCNQGWvK50DB02zkpLGhuWmI1P6jNdxZpuHxYSbVzdk76
         BKcA==
X-Forwarded-Encrypted: i=1; AFNElJ95LCsaxMSArQDnqHFUQQUr//g7VFhVO5VzZT0FRHZ6FAeXCW97tj+BTNJEDj3hkIyVaPD80UvA6EVm@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTwA84sjN04R9dVBxX1bte+U+l9mnHEz93dyMyGy8He4mem9G
	dY/ODTM2fRZCjRnoQzCXpyTxPbuwXbxPiGfcm17YupZcG/IKE903AW6G
X-Gm-Gg: Acq92OFiNfiXwrD+zUkW6PW7wauC/hkcbRxtLg+RgArpiLb1i3wqvIpLtUNRsO2d14U
	bYpla5dkiUQ5bVd6u1piIe3kDIpaiR4C1Eu3UBXRfYq8y2/XLbgBYi1x55Exz48J9xHsB7C3q1W
	wQ2vZhKMeUhv8yVuzNOzNjiMRLj9n3nU3GGzF4QHpLzVCM8mhkvJ4DZyTwaN12pISxQC/XuGOee
	s+Yq8hr2wkm/ZUKeotxmQy1aSpipPYDffy3AJZtqHitqTXhuglhTulngXW3bps0XSmWhMdMTaiP
	N/+hgvCA/GPRY2JFDHzndwNTwTSh6zmpoo3inchZYm2FGCb9cw9r/6301TMKI/Rb8VGRpUdotPT
	0g2Z4O2yS8n/860bmibRIkzBc6oK3i7GUNtgdgvFAoubC1LYeASBXK2uJebBsGQRHeiI6XzdwmP
	ec7xrO7IRLKb8uNkWCZWw0nRicrOSEDvHjuUgWA3jIfIaJWe8=
X-Received: by 2002:a05:600c:c096:b0:48f:d1b8:9aad with SMTP id 5b1f17b1804b1-48fe5fd5357mr268970285e9.2.1779277910055;
        Wed, 20 May 2026 04:51:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:a11b:196c:5f9e:ac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm278842735e9.2.2026.05.20.04.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:51:49 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r9a07g054: Add max-frequency to SDHI nodes
Date: Wed, 20 May 2026 12:51:41 +0100
Message-ID: <20260520115144.60067-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
SDHI0 and SDHI1 MMC controller nodes in the RZ/V2L (r9a07g054) device
tree.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 7a3e5b6a685f..25f12173bd1e 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -1183,6 +1183,7 @@ sdhi0: mmc@11c00000 {
 				 <&cpg CPG_MOD R9A07G054_SDHI0_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G054_SDHI0_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <133333333>;
 			resets = <&cpg R9A07G054_SDHI0_IXRST>;
 			power-domains = <&cpg>;
 			status = "disabled";
@@ -1199,6 +1200,7 @@ sdhi1: mmc@11c10000 {
 				 <&cpg CPG_MOD R9A07G054_SDHI1_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G054_SDHI1_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <133333333>;
 			resets = <&cpg R9A07G054_SDHI1_IXRST>;
 			power-domains = <&cpg>;
 			status = "disabled";
-- 
2.43.0

