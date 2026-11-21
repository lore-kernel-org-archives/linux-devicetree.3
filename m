Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220819;
	b=Jbom5cEyRadCv1QNjlkrvPMFz/XvLqsoPn8lulnDGu3raE3JG/6RvFFQoRIHJGv/wMNQ
	 I0d5NeflV4Z+I9V5c1G2ChfpMeRehIZ9kzeGJwUc5uWIRaboDFiVVoRPuGPZfCL35ePq0
	 1fDkEInjrjgL79Y1KVauDv7MRUq1Vf4DAc6P0r0J1Few8yWQY269zvk5TtIFiDAMXlV5J
	 l/tZNQ4hKLo09flkwPOQCdD2GuZi01YX+TsLIf33KUyhBDUlsecAV3wW/GFG4sEzKKXrX
	 asNgvjbFupk/Dp0uO5yXEAsmAwbWpCuNC1BcCpSbtbJJWgtOHK07bokJfPsEvmlnBQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=;
	b=c3dQ9rz4hiOtcP5Rn7df6PX6vDaEF+/nnB6GUOt5l9mU79coLjliOmvjwwSmBvx0cGmr
	 LA0D1WpNVTBSYOGU6ao5e6rwO5XTvD8+pQMO5q2z/KpY4PlfrD4sPnEur53XeT+54uKP4
	 wbARv6V5NbVsFH+QZbb/G6vzBzWeOen0V27n7Ux46ZOko56eT7My0Q7Z4Souv1z72h31g
	 IQmyN3GJ5U3fjM7CgxlHPNCOz49jlZh9mznRpfgjGgGhY/v8R1IvD85dSxhC1e0R5IpB4
	 v8bJYyBUmlF4xmY55zjLeaf8bGpsWZ0jFTpZEwoN4lS2S5jujjCdZ+990Gc4n0UhKCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZDsB/qDE";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9DE606A691
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD9DE606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDsB/qDE
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a05b210703so767154b3a.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220816; x=1795825616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=;
        b=ZDsB/qDEWCPt+BERX4mAYFP16HJ2fXDvFKs3XCs39Ehh37tP1UXNQp78fM3DixCUAg
         qhAUnMRtzYQ6GUectXiLdyitKB0YM06Wns1dt1yTfKW7QtnCdgcf9ww5N/Ka+XvEBoqd
         H0v+9mLqAF+111aasrSQYVMq8UG7ucOBZou2aB73DDUrtSa/nl23LpserBdh3OFHWvPt
         YUU1d5wZI5KnJoSCTq0YJcqeo6mU+HmsXlFGbK89yE9SYPA1Lucr2pIpU+YGLzt4cmH4
         TxopxseYcY2ygX0mujYHP0FKu8KX0YgQE5j+Svx4nYF7KTtP87OoaSBYmeT7ThMrQYAH
         u7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220816; x=1795825616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=;
        b=DQkmYb7YlDdvdp41Is6TJiZasESHfPWVs/IhLCI6CV6drhvnNbOXBAEhcjUuvgQF33
         vKlWGl9CmyqosuztMwCO2s6o+Va9c0uUBwxalAZMzvbkZ8oKpNjr+Cu2b49kNL0jLco3
         dsnCMfD2lo0lRsJ7p00PcuQQi0Pz9VJZx5jJo5PbpN+ECSKEBk0TUIZvAcLe+hSaF53p
         kRWijOqgDuoKHh+p8wdXRTCeLEeib+vQgSEnuACPBwVPY4ua6TDBY12J8HS+bWvDrEBc
         M4oiSKj0wrsGh8kAU+2jZVMSJ6mDmhBRPbHyPqV5I2iuRKHf1PzHXb5ZzzEhyVC685kJ
         uyOw==
X-Forwarded-Encrypted: i=1; AL+hErHVgRkHTSNgK4+gg9vN4K5ogW8hP5zWZ82dmpvP6Fa7Fa3+dJkj0Hi3Qqd5bx0RbnGn9u1a7VeIALtQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9AFDKYSQifXliHOrwNE7VIfv4VAGIdhRTqpx6ycSr/zjsOmbRa
	jRx/tdyYV+j8sDlRAydotIAikWHJzQL6gGho53jFyjjOYeSZptJjK46e
X-Gm-Gg: AYBFou236uXz3bwD+1vUiPpk2sd11yDyLAp+maMkXEzlJ6vuv/ycAnmJjXYfLEdnTNJ
	b6D7/lTIriRRum826TQE8HsyqMacTcLHhF6MhVR8Nk0P9naE/sV1UJsCtsgKcvwc1DMKu6Y2CFx
	ZVoUZztMoZMvq2L1zu5YM35aaCCz0RtrxJTkV/fqkcQ5ZjdRxViqXBfpV/J1NezAsvLIJ9/3hdW
	1U8VJgu4kU0YrxkSotjnsOJ5xmX7LnvJRMh3L29gLwk/BXqvcSaOzgJyxTyVNWQabqHoL8kwtiE
	FE1XtEwGKSHscCIlm7+WJqpk/UZspN9iJ50510yl7qusbbzMVG+HXOKl2BmzNU0DKnnLWfTJL3b
	wBUkxDXcP68U+ZoqGr7XtVrh1VuzTEcF7zrP16r8SEVi1fIYCxoEEwxFlZM9rFmPwPgEfMEC8wh
	6Z/Q0CsiKLqIsE1mPBTyKfWJBoBzWadLjBBrTxpOVGPEzvOyk5QcfllntDV/dhkwkxSJFIMwHIj
	EzGl2Z/T83GkiVEaaS6D8bMe4gUUeSKbE/nnNzBMDIzRe1kDPBTtLR/8yjD0u5iYiN86W7WGc0j
	F2NYNEMgZRNAcBbc1EXKKnzRJSe+7/aCjdWWV5RRQdGy8UqSE1kGyKTEAD8kdE4XklYmMcIV+e/
	fVn1EN7GWeI7Ru6PBIDDXcwtn5wX7CTyIFYDTCIE7fayNDR6NVetfANW53FSpiARjQ1X5/Mtqk0
	6jAg==
X-Received: by 2002:a05:6a20:914a:b0:3dd:85aa:4526 with SMTP id adf61e73a8af0-4014b5645c4mr4868571637.33.1795220816130;
        Fri, 20 Nov 2026 16:26:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:54 -0800 (PST)
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
Subject: [PATCH v3 18/22] ARM: dts: BCM5301X: Archer C5 v2: specify switch
Date: Fri, 20 Nov 2026 16:25:58 -0800
Message-ID: <20261121002603.25254-19-rosenp@gmail.com>
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
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
index b6a5886698b2..54898849b87f 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
@@ -111,3 +111,41 @@ partition-file-system {
 &usb2 {
 	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
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

