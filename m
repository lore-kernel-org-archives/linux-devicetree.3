Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F331ED7D
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785190654; cv=none; b=cDVGW3wED1HEBit++5uH7wc3WETsqILSqbdaVZgWoWT5vp0K4irh89qtMWvOrQVFJkoJMjELwltYVGXqqAi/tjS6VjfELC6kF2u3kwXaxVKoAAyQ1LYf04W7sY/CP/tTF24Kj0x1TS7t4eUgpzafDWVp8zqj/+C8aGgGg1zSQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785190654; c=relaxed/simple;
	bh=C2wVsnzMrlaFNpjiWg2lF/x15d3RO92rxlUSPYdvo3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyYgfaA08203TKkilKAFkT7pgJHTEAqFAfP1PQ+OlzitMnc39bOvzUdCFGggjAg5oYjVj7mmtVSrRlYUyYmjanBv8otaftijq8JT1S/Kuqpq32FNacA4gG+Xmo+H/nCOES9Jao70L0a2f2/B6JnCTMQI50R5PM62C6d8m/E0avc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fI0BPO3p; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fI0BPO3p"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf41bab353so46034855ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785190651; x=1785795451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SUe3YgVQms8Mfqwt9m0ylQTCLjUd6H2eV8tKFqZQjg=;
        b=fI0BPO3p1cWqEkIvUDVqTmxUc0SLX0UwuKH7+cYBDEGcgQDX7dQ9QGZLzT5TK9iIWM
         O7nPhsoW+oTmxN0Dg+8LBqxU919derY8qqQ8qMVuC29UBFoAhF4KY3vE/JiIdXourFUA
         ghavMZdVzaR4c9bSN7xUED1IpsXfEdtP6xNY5ITgdCdlYQ1mT089U0TRPvWUH8RDBzM2
         IFwW9D2Wa01M6dm8KPAji+RncmWINQDchcMHm+Z066nlWTlsLcF7eTQpyinnU/s1C/xf
         NGjEPRCnjr7U0pqZr7GgqcQozNFViB5ArVSgD3G/Zl+iGlplwy8PwUS1w6RUOu8fbx4J
         P16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785190651; x=1785795451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SUe3YgVQms8Mfqwt9m0ylQTCLjUd6H2eV8tKFqZQjg=;
        b=BNVLCCjVHwuTo+FwImEG03n80C6AGUyTejWNPW/qrJAQjYOvHD/i2jM9g67s5l8Xcb
         gSTPjn7UipSBX8jzNK7K2140yZgscohVZh4zg8rkMeAV2EUMRZSKfd4R5c/VyjWCwRvy
         VhKyKOrsE0bNsvSGEIS6C1qScnee5UTA6IK5fD3omLpJOEX75n0INclm+kkqyUNhbM5W
         09MgqN2qUzStzsARNxSYi+tnzbXLjQMNPv3VThqtG7FZ2arMCqL+uTfcLD/HMTWbfA6O
         7DC9VzLCtIvBEojaF1Ob3Ztczkdsxes3nEi9eE/e0NqMFKjZsLI9vtLF/7BAffwaeoqf
         Ytuw==
X-Gm-Message-State: AOJu0YxldotQE9jHvNjRgAHgUWmXxsaIbMrFP1EUguWK47Qyp1BxJxLH
	fBGJ40DbcEelV531AAVUhoakiy9kvK4ixG05Zl6fcfi36FDYAK0keHSjU4LW9C7Z
X-Gm-Gg: AR+sD13FMFSbYV0cMFpQpKq+hsOLXLjoR9Ku4rbSMS8YbBFqNT5gloS5H7uvzqLMsXZ
	Gx4+vMPNsoEBElcVLwHFPQnE2tmtlv0Hoszvwiz+fC+GBgDMewtT0/tVqLkNHxkUjqs97+oCZDy
	yvqoZNQx66tE22BEvxGKsR4zmxQdG2+2aqC6HyjM31h4X0VTrvz/x3/X9dV8VjEzVZ66vIECzxp
	fIEcKntd2U1PWytoQIQ1soMOrVd/ZjL6ixL8dNHkcZdWAUK59Y9sjMfkAMqr10ErS6ItRQAXclE
	jA9vnMrGSKmfTyW7vQkw/sRU4fNXve3wUMFy/I1d5d6R3YY2+qZ/qvSajJFIuX5bOeeT9reqG2Q
	YYaDJ5VIcPunOA0aCS0XkfSM01Q2onwrDHb52IR0jh5Z0rq2zbZ80GuTMNr/4giA1StXuhus78N
	RtzQeUDf8KzQDKTHlPWGyJfcYDvEGC4WaYEr2dlInKusP+tbbSPmoTqIyAIdFlSeTuOQiFBayQi
	4xBGI+kvrTioOcGTDuoXB5Uw6vebWaShJiXln0D2q/0TrzIA+x7Wug=
X-Received: by 2002:a17:902:da4d:b0:2cc:6817:d9b1 with SMTP id d9443c01a7336-2cfde8a52a7mr95829175ad.41.1785190651008;
        Mon, 27 Jul 2026 15:17:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2881sm41155645ad.25.2026.07.27.15.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:17:30 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: Add missing phy-mode and fixed-link to DSA switch ports
Date: Mon, 27 Jul 2026 15:17:28 -0700
Message-ID: <20260727221728.40811-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ports 5, 7 and 8 in the BCM5301x SRAB switch node carry an 'ethernet'
property linking them to GMACs, but lack the required 'phy-mode' and
'fixed-link' properties. The DSA port schema (dsa-port.yaml) mandates
that any port with an 'ethernet' property must also have 'phy-mode'
and one of 'fixed-link', 'phy-handle', or 'managed'.

Add phy-mode = "internal" and a fixed-link subnode to ports 5, 7
and 8, matching the properties already present on their respective
GMAC nodes (gmac0, gmac1, gmac2). This resolves dtbs_check schema
validation warnings for all BCM5301x-based board DTBs.

Assisted-by: Opencode:Big-Pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index 27a97c8122de..609f56ab936c 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -439,16 +439,29 @@ port@4 {
 			port@5 {
 				reg = <5>;
 				ethernet = <&gmac0>;
+				phy-mode = "internal";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			port@7 {
 				reg = <7>;
 				ethernet = <&gmac1>;
+				phy-mode = "internal";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			port@8 {
 				reg = <8>;
 				ethernet = <&gmac2>;
+				phy-mode = "internal";
 
 				fixed-link {
 					speed = <1000>;
-- 
2.55.0

