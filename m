Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904A31E847
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 21:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785016600; cv=none; b=f49TKX7yBedF4TEHtk63t4vc5qe33L5SFzYEqTDF4xeur9qHJo1n1r/GDbcYMFxJAxUGjL4apcJLkuU9x6RAa+IfPf0tK0IJaPlsh3MHCeRyIXt/7janhEjCFBEEIJZ4xfplrMmGZ4Ko3mMwoKqWykR58xzIjiCXhjc0BazGKXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785016600; c=relaxed/simple;
	bh=bxo7lTJ3jtgGXJ4mqGf7/vOIqpRu01gaO2zK4GEjXgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d5iSs0Dn+lqfGZQEGIJZgwVhaXb9x8NFgEpecT0O8E1zEa2MbPBZbn04QLu3dRSUo4D3YFeOAkjd6s4WYZu8HUQjEl/cEnuM8ClYetfjt6ttLKqCcnPwBvyGTrwb69RZ//uLdntSjq9fnTqscVup7I88PvQhxM7S+tdGH3Tz5Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQc6qJRj; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQc6qJRj"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1435511a91.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785016598; x=1785621398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LvYS8NKwdWmh3EA3ib7bv++8n3IVYdz0vmZXYG0F4Hs=;
        b=LQc6qJRjqSny9Jfp2RiV2yCu+J/o4ZIl2vxG22BpoB5pUWvrOyIbgu1++PmQ0tojNi
         CqyqAhS2ZmJpSADwRxciibQwxjYfcbpQxUokMGlvznzeeVQu2d8DGD+qBZweziuuu5lk
         ZcMwe357i0D4mTNk1RIBKwaY1+y0JtlHOzWotU/d/0iGohTr83afbdHkWL3lW9diIB1G
         IGqFnvJyd61KNWh4do0sht+6QMErg8ZyNPyVpRJJ35ocbQ1EsH7amm2IQ81duVIb6A/5
         8+VeI5BVuIJZcieWkcEycgrb7cqDJGVqGz50PhYLNLe0CL2jRbN5giaf1BSd1DDIKs0S
         uA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785016598; x=1785621398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvYS8NKwdWmh3EA3ib7bv++8n3IVYdz0vmZXYG0F4Hs=;
        b=RsR9xIaY5Rbe5DwmgI3YV0x2uThCvxBrO8WLLYIO3BiC2P2ub49Bq3NZ1JT86tVNq2
         L6A28ctbm4q1N8EjdrlB11a/xFht/cd47BcyRA5jVDxhebG9k51sPMae01iMOGBlox/5
         SPa2XgwQyXrgwBuWP6sh/iVVZ0GhE1OaNma+HzUL/r3zQ27ZawtM/K50fDY7kyy1dnH+
         Jrd2tPPEkONjs7vCZNHGaRFyFROULRMdT8kGmVYpoRkNlzDox0eulXLlbY1oAYySORUp
         tsIoi6o+v/mDvy79gagt46dRiON0sTb2CqtzNDXi9ua39ToZhS02Z86AL9BBkxOCi4fl
         r//g==
X-Gm-Message-State: AOJu0YyFmLL6gDWzZqkxSUOwo68k0DwnrD1a/tsn6VQvuzgDsXZpxEZg
	V31ocWt7pkzjPRSbIdPMVPWzBk53CRLUzHEIov87ga0z2aeRxslZfkcrYLpvEw==
X-Gm-Gg: AR+sD12GQoxUBEltaMES3iAiLNK7yW2RWTVlyo5MRwi773NXlyml5wMt8AJrRJsnnMB
	BrKw6IdCgeB8V55aE1SoGLKh8hkfhNiPy4RF0GNcBeA9WnnUqjBLCYEX1dfzDXwBV/duqnoXFJ2
	IAnijOegisbU/atZADHC2YQ9Ilrk4SGbvAdexEldY6u754t1UW2cR6AArJTr+m5OImIlXbBMG29
	A+bp+U0oKH6BibrTBDafMbYXSOFLvlkzh/rnkKowmlwgEQIL0d26aym3MkNDSGVVufS9MEKmTWo
	bKc/vFGXl5KtdJg5GHbuUyDZsiBkAdgxizOF920at5XgBa52DbngHiThqw4sVVApmmjz8pusLC0
	y5e4Gq9mQeaizyHfxmV4UEtsO1NMQ03qAovR9rYgtRaZBmOctbrG/SgRay09LzIQ1Ud/TQLxGxk
	CLeszjDIFemOX7JyMUgER4QS6fdQZTfwj60DNXX0AKZoQWxfInxF2oXvnjALAC94IfIL6ojVgpP
	oN2R0V9dT9M2fOii56SjmlJJTrgdGPXcfjnZB8AkfLGdPemaMosGMw=
X-Received: by 2002:a17:90b:4b09:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38f296554e1mr3503484a91.25.1785016598427;
        Sat, 25 Jul 2026 14:56:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f0583bcd0sm2267757a91.1.2026.07.25.14.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 14:56:36 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: R8000 add NVRAM with MAC address for WAN port
Date: Sat, 25 Jul 2026 14:56:34 -0700
Message-ID: <20260725215634.9181-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The R8000 stores the WAN MAC address at a fixed offset in NVRAM.
Define the NVRAM region and attach nvmem-cells to the WAN port
so the MAC is assigned automatically by the DSA framework.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index e85693fba16a..a4b135d37659 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -36,6 +36,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et2macaddr: et2macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -211,6 +220,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et2macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.55.0

