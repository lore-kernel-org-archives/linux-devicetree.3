Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220800;
	b=D4nw1qNDSMfL0ep8i1gWwg062v8TZd24MD5BZzW9P9UWK/qjcqeF6xjuv+J4Gedzm0GE
	 IpC8ELRMQNFwMWJ2OaYNrT8PHaDSXtMK6Er527PmMqK+r+E0NYPKRbkBm7z9FDSmelKUv
	 y9OlA096ruij4tM6t9Uni/Q3X3aKavlYGdCGSlNsYHSULqpgfp7soBokAMM1Ahaz9V8nv
	 l9U0ChAslk63M0RMMnt8QwCRlH+zgWp3FItWfNZlhW9/KnmIatU5TqHY6VcFaQyJX3WrM
	 MX+rrHO72BKP6vNDtKjb0wtK/i7LeVJi5Tzrx44GsZDiiXMnXQ/F+Lvtu7pHYrshSUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
	b=Cc01S9da2CYZj+qVFCrr33g0M/j8G5KNOH1MQrpri9SVLp+PRhvdJD3wDtZK13gctgxX
	 1fqhjOcwsy+pdXE3yiHsyg9/K2VNARsj/HxUhS1g9RmXc40aGYKhYrvzO/XefsAVQTHlR
	 53Yx2MFxexOLue5ZlYZfNjPlUduXi+cV0xisMtu7GFFTcWiCpnnBIsuSRFLlfwVYUnCNB
	 g278PwB/XHaCUN9VEKJKqkRtOFoPOxy0YnS3dJWn2zpEj/YXf6+9wqKkYadTW9c8V+ugF
	 JaJBrv+9xWUQiAowg9mJIzhQgULXNbXPHGMAXZUBgFsyhQkBp2I3aJA3eQaaSIoaN9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d1P0omCW;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90709606A338
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90709606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d1P0omCW
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9d7791b00so13935985ad.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220797; x=1795825597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=d1P0omCW1a2YD4GtLaOgzOKrPlIpz7Mm4KQWczHrYHYUP9GOrTqs0QTAOn3AXzrDHB
         OusYDfVxFeTYkDnd4G5D3mATv1YBi3ylpdbg7R1ybucCIhXpvTQcCfBip7fUhjT9l3gr
         12mtxNhG2qMzfojrOKiQ/UXsOQO/OwIt/0AZmN/y6XoWqlILrZ31kohOmannXSCaFNCY
         e30VwIx99qgRsOunRsJ+xlPbL3TmeBBR+YKvry1wsF5fon3K9bkG2Erbs2J+vStfRAZe
         ENH0E8e/fpsLULAn4L+od4cmr0t0cxQut1EwbFajLKQRCF21rg7OXuKggd//j1Gt/a02
         ViXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220797; x=1795825597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=ZWIHVD2K6C9NlzavWotqy2Zd1bxFIIVwdV0TjGDiXfDn7Dx8cz/z2USkLdfNsy8+08
         Nxl5bgSt78mkjMML/TPyv2haR0Wm6T6jtvWv6S5bJ5ENjp9hiGh2nyVbTxUKJ3W9rCAZ
         VDeOejf8sbiLd5ORMiOBbxlErdPbNG026Yriob/mq6dr4A4igE5lRgOts3DcgTDX6eNM
         xhKmsOE9y4Q4LrBS+PYPHm0QzceNVfoBzEeSiDmLZQwxdw+FBz1nCQ9h/4vrvhK+CQpb
         M+meEP4h1kV/BfX2KjNDVqIVvKN9GddaK1xJjOI6bgxpvUbgYSDu5e5rjXhko4cvgvVR
         LIrg==
X-Forwarded-Encrypted: i=1; AL+hErHQIHlztPKjT6sP3sRMMU6VmJoVMhm6iUM3nn6oV560PKnN+q0vXAhNzTXThyFB1KCLg9aN9I8Nq8Ml@vger.kernel.org
X-Gm-Message-State: APuU4Z/yUmFQaU/57CZKelN6YljLGXw6yIW9Rh9hokulx1clLWWbUkiH
	v540NT1uQsAuHxaFtirW+CucjIrmV6FXuo5Ir3SHoZpogwywlrfbkzMBmiA5sg==
X-Gm-Gg: AZFdTZc5L7dAkBGdIxtd5rDVu20j3tnKtLfKq9WTav4hSZn0hlvt1wiqObQuPedy0SC
	fHCtg0wP/0pf/wB31D15ozyf4PQcoUsjXW+t+TVoqjyCcgnhJaKnmrWW6Zv0EFyE8naTNuJJqlQ
	lt1efzf3yHBc7t/eTB0HfsboxhcUOTqkGiG1uGbVxYyGVf5v5DX33Ql3+PEe1/2TM4VFf2jIyVP
	ybUgf7Za12YFdbFoicMQ4F4UPf3MJ/kloC1TpBABPO7efWf2ucsk/U/7zvexvgdVacRNoVDEtP3
	s25wNXa5PTO4R+ulINVXzqNWBcEkMUnhZw/kjmzgyTBbbf1PKFyvjvJ2mMp1fm1p3xDK8lsm38B
	RAJznqt4SsP3TUZzlYsgombLonVxGPs9UAUleslhPCGp1viGbykJ90kC63qKJ6N+giz9ApBE4z3
	8hoCKL4swr9aAqJ7FNmZN4M2nyYT2Dn6r5FOth+w8lW8QNX6Zn4jQp0to3h1JVvTsx37fGE6b8F
	T0NhNu/wTOy+LkzSyiAqDbD1rOoHsiPpHKStwis3XyfT8nLXe4w2KjSM1QzoViUWwODaMwrgdzt
	0v3OsqIOUH8kipmSHMEKFC3gEjKGrhE9pvWlrXH4W1WhZYT/ui5cfj5ZB3MzmeoxjO4vN0Dxpwl
	FblckFa8/r+FrmdVG8JjJYsUnkpnxHaKjgrpMDbOFoSHMlyDS1yTXn3PxIGibF9fZe4nv/bnC/p
	G3EfdTgzN4kWX+UtQrF/c8IOOW
X-Received: by 2002:a17:90b:2f8f:b0:3b3:ba43:54c3 with SMTP id 98e67ed59e1d1-3b41c942998mr3916301a91.33.1795220796940;
        Fri, 20 Nov 2026 16:26:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:36 -0800 (PST)
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
Subject: [PATCH v3 07/22] ARM: dts: BCM5301X: phicomm-k3: add nvram node
Date: Fri, 20 Nov 2026 16:25:47 -0800
Message-ID: <20261121002603.25254-8-rosenp@gmail.com>
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

Add it and set the MAC address for gmac2, to avoid having to handle it in
userspace.

The nvram size was taken from a boot log posted online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index bb1bc4e61bc2..5b9250976f13 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -28,6 +28,15 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x100000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
 };
 
 &uart1 {
@@ -38,6 +47,11 @@ &usb3_phy {
 	status = "okay";
 };
 
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1

