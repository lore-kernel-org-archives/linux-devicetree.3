Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E133F5B6
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 17:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782148078; cv=none; b=NkShanW+muPYHrxLBe3GnTSsM76uiNwmjWS7ySw00y7WVKNIoqYEdfxg4JjhFZpQRdQ2Xthbp2+uFv0TO0gHbDK0IE+R4wG0domuu3Wb53jb3T3+ItUdKDnw0pkJDvym/u3XH4d5+j6tFD+FAwaqJsOEYcZSr0jxjZMaDD0MByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782148078; c=relaxed/simple;
	bh=AgOtniyYm6rKfk7GnNxevEu64wIeIM8nzc0g2iDgTo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ozTcRP36NcthwTisto3NtAfSzUgeNIodRUQy1K1yfZqlwge8gwuJeTJ26yPWL5OoTUg23s8grag8f0cSxjEJ3KqdG2rYdaBTf0asW3TuprCF+Zxrc+moN7Tpatgo8cnMn2qhsWLoCRnH5aJbto2n1VXiEU6DlxLMzdxzuFM+tnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sfyJ0as/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sfyJ0as/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4629051c9d1so3196464f8f.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782148074; x=1782752874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=//bGganLCk4cosv6dFtOCUjlotV2gqLidDZkUi+6CSc=;
        b=sfyJ0as/iT9MT6mqgXYFAu6rTQYvimiy4EoTlkSMyAKiTrnd9ow3hc1UQsxRT9wvqj
         SVtujnex8qxPz6iVX2ozP5sjLR2PP6U2oM69dPlCeyFDD0r0lFra/n6V89/VwQ5zjSkd
         /5UScyyUcSUXQ+WuM6Xc1/7ljlzTdb0l5FL+Npee53c9UCNMq12t6gLfM0EtCoETAPa7
         rCErzU/yP8EXtQdsihf5CUyw5k6/kYdeteaWjmVVZQTGAUqu7x41id02i+mPOwPsZ5/x
         ztC5JOub2zxYRbiOsn6HttsB66YbUyF1BJGVqUus5uh0Y2c8YUOm+TKpmgmHoxp9k80z
         i7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782148074; x=1782752874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//bGganLCk4cosv6dFtOCUjlotV2gqLidDZkUi+6CSc=;
        b=j2Yuyf0VZejkdVU0tnA+WSEV2/iWjzi+Nl3aMB/+D4TsU0+a5y+QZIEJxdoPX4H97g
         4Vwe8MJRWXesYpXfpxzjUJ/l2tdDva4aH27s/pdZ8LfYlHNr/XlNGvRThs2S6mE8RejM
         kSU/sLOPKsihfQFvCyCVLHezjJmsepOZriZhy+fEQ00uxBczpF7NoKIsmRWvvhsQ9AeE
         MN/QNF1FjXBturynjWTGbJXkXUFc7czqtU3blIiGv/uP7isBZN/LCn/u8VG1/6RbIDYG
         DXTPf2e9zgVsaC/KO/O6Rdns+Ufvs0/G4GAE6TWQVFprVZAL0Ma6iHkZzSEus0MLuYfT
         XDbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+lT8/vLV124goZVYPRfYq/oSbLNH0CtkEVTBNH0zws8f7VEtPF38FVdZW0FIi867jI+LSnfeGHbvg@vger.kernel.org
X-Gm-Message-State: AOJu0YwSKmgYDzKhu9qr4bzPi8aq7CxVUEhcmB/QqVIO3BRJ9l7XclwK
	cYe+4y6J23DKI69nrD4PsFZ4a4bJ5utKoH354QRgA+QvRmzLnCSVK8P6KMDN6WTO
X-Gm-Gg: AfdE7cn2kWa4hae3jG7B5fKwytvgY2Ykz8xTCwjaZHSjfy49GUx49gjovkNV1CRU8i9
	BBtCoIkI0xE1LC+/Vk8aCk47j54iU5gxgPT8AlNsjxNJOErZFkih/Xnxo765nJw5e2HwTZvGQwi
	bd+W0rkGPRFxKA9Skp6+So0de0lzHIN/pbx4o8myJ6W5oTjP36OPdMXTMw7sr0YYb9V7GiMaWc6
	JIIjDxYk/o1yfqN6dBKeO/JrLQpPfQUwyLuWbgr6cCp1N0eF+8kLLSuyNEcx7VX9tspmmbvqypo
	LZ5URbciiTqLtoIbq/56WjhxmFO63ha30KNzRSR1B4ugVj7Z0CyzjG78mL5Jvb4uEg0TZeZGozz
	AEBDuxQ+LchZuN7upTRSVtoCcUVInxG6KbH8iNRyWvfi/0Tcmba4P+X5zssT5Th5gd/e/Anwk3I
	7QRsE3ImitniMLXzKn3wLwSmCJId3Vtuq4t8bqBlAQgwqQGupX1PKsf1tg93/rlSV1UJLnA29kj
	eKBAxH3p2AsTFXnNCvowfm3Yq8=
X-Received: by 2002:a05:600d:6402:20b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-49240eb56b9mr184933215e9.37.1782148074052;
        Mon, 22 Jun 2026 10:07:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1af4:aa58:7920:f0ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff821aasm329903055e9.12.2026.06.22.10.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 10:07:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk-common: Add memory nodes
Date: Mon, 22 Jun 2026 18:07:33 +0100
Message-ID: <20260622170733.1703585-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add memory nodes for the RZ/T2H and RZ/N2H EVK boards.

These boards populate 8GB of DDR memory, which is exposed through two
address ranges.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 1f575ea23db4..a0e1e4b1f23d 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -30,6 +30,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	memory@c8000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0xc8000000 0x0 0x38000000>;
+	};
+
+	memory@240000000 {
+		device_type = "memory";
+		reg = <0x2 0x40000000 0x1 0xc0000000>;
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
-- 
2.54.0

