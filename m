Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188113;
	b=mz6dehcI1H4f9fLL5hHx9qVYOMNZ5RpQqUVMt9cKTg2po0ZfwBQMBWqNxy5+SIsaQ+XH
	 teDnaGbtKLvpK/FxwpS83k0eV2WCYqgfS6xOZfyPPkJUCPSQpbubbHWhT8PkFjyhjuQlN
	 5O65Vgh7BUlTiS+q9Z9bxOtx7xha7F25uLZisPRiWNggxOtbClSuXnHOzuZPvF9P6XUdR
	 K8OjE5i9W6dI3JbwCwuW8u08j2RfylZamyLnK4FlyhvjqYQz45nQXWGIAUsP4Zkp61ZyF
	 /K4nvTgiyVDf297k/rWyImHRBgZftX+fwpuQBDpI/5uYMys7y71uoC6JMkgZ8hyBb5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ab9Yfbpo3hn/cTagJWdL75RTonupVvPPfl6ZCeCMP0M=;
	b=Q6hk9NTtFhEWfd2GiQEV9/P3QGwkAhTO3wX7+EsFv4ngTYJPWuuuPkLX4YqROvLskCxI
	 Ixr99882E/yj6j+lb0bbxrCHQQ5d+9tx8JKKr4Hyk58q0zHXT8upf+ucbrse/16EE1Yrf
	 SGa+cEj8qWNAm8vXdpp4ng5jNrTkXQJ9Y5Uf1GIEaqwGFt1kkp2STc3/8CvGVMx75WQtR
	 Qc8vX+3HkV/sQRVfnImniPNDWkD639Bxxg+lhKeyIi7AtgacFaqLivPeRy11+qn882Ecc
	 u+bIbTkAcAaxJem5sir+W8jNc1hh3Krw7ngW2uUjH4BuWpFN3FJaMvcQNsiYs1T7nrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=TrEZSm8m;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F3A606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F3A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=TrEZSm8m
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so9291595e9.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795188112; x=1795792912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ab9Yfbpo3hn/cTagJWdL75RTonupVvPPfl6ZCeCMP0M=;
        b=TrEZSm8muwMMStTwJnYL9SzdI014MgArkBPwL2+Nb/h7YOQuW0cI26G7takikLBET4
         lIB3Nz6KaboasZ6rJfYDHmkRGeJaAo70dtLYw2vCVPikVA4t1xfHpfqzoniEcB+bwliO
         4088Vyge0JGLQ1yn3lvT2GpLWRngmjaZxCqbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188112; x=1795792912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ab9Yfbpo3hn/cTagJWdL75RTonupVvPPfl6ZCeCMP0M=;
        b=dI1ONh3EdJUW9jx3qgKqkMqW3nP5F3Nsc2672QF7XUMXjwY3oiGLqviJpGl2hzgmlx
         gBqj/OCoKLuQYcBLrSuCm9JQLzsrsgvHUqdKwRM2YanWbK42zayE0OzExO1d2KXUfkBS
         GVB8gDviX7pS4ch0lsDAg+1UR1XsKOE2xhA6rfHSJiSUpPbaTguCIkJDEsv0Gpi2E40m
         ahzSWzdv2wy/jd9ZT4hj5ehhtnqgktgQPqEX7EhnmFysKgsDWZITvrkzo6k3hQQin8J9
         3FteiguouxS2gR2cP+6rVhHc6bM+KqBwMJpH0UvGNxB4k18kuN07xaCSipIs5xeoGaOq
         R3Zw==
X-Forwarded-Encrypted: i=1; AL+hErHYcXelUiQGrpO4KHKQ8/LCgDoCBCx8Nc55KrSMKEDP660iBqrFq+RPt4iKV28gEGTH5kzhiVy9KCGT@vger.kernel.org
X-Gm-Message-State: APuU4Z8I9H+wE/nOrMU6KO84cCPCxsuBekpoLw8XiUP2S9HRKSnw+Y/v
	mCw/mtf6VX7dMw4YKx+t2cubm9okkP6JzJR2uCwkb3eREfmmfIcm6eC0LrSycuRQS34=
X-Gm-Gg: AYBFou19sQKhMNwUHkKLROgBw66y5Fm5g2wsK8JVztWSzqPfpPC5p3FpbrJxYX5PzSd
	z+ox7RtdPUI1ogIgtbuAbkNEl+lzRGeBcsOTqmCCi6Wh8Ihx+oda+zP5F2HOYPSfl1zBnT+/mP1
	ayCfjuY/NzhLFbzLJbfTZRfR9BYLsUNv4PhOGnBxO/oAAIf7EKU+iUuQT89bI0gP3a6KzDIYY+w
	RIcW86e/z5VsS11Sho11FI1hMM2q9aCKLlS0qa2EMXUmDQihfIyGTvWr3NSe4FFb53UERjZVpDZ
	bd3eVAXce4WKqbJD5Sn+diAzCI4i0I6uw4e9ecRO+mR+lSAdHPUvtbIPjWzW3fQkzRb8QwH+jve
	Qc9zaB8QtInxGQL3fVBhe6l056pH4JlI3AHrGTNzrCzg5nJnp83mXsbkHfgitxK4vEfAPUN5poR
	FuZ0yCfLGqI4hEF+33NHRyxGmg7Ero4j6qN5cqirZG8ZSKQPJy2v3iNeaJ22A94evOQxh4JEG95
	IRYqzBeVPycQFMNMb1injknTP26uEfu52Ck+ebfI9TzsganEoo9k78X4pu5mgiib213ABzy+RkN
	lR2mzF4vKFFl9IU/W/41To/JxjgWGs0DqBEygT7yIR+GXNOzzngq79Nr132emayAmAQjd0Yn/J7
	kZ5smreKNknyjqiaofzw7AMslmy6gN7n0nRZ4HCBOKAl9zlWJnQ==
X-Received: by 2002:a05:600c:5307:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb888283d8mr74634395e9.17.1795188111672;
        Fri, 20 Nov 2026 07:21:51 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm140812535e9.3.2026.11.20.07.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:21:50 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
Date: Fri, 20 Nov 2026 16:21:36 +0100
Message-ID: <20261120152146.1774885-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

Add boot phase properties to the resources needed during the boot
process.

The BSH SMM M2 needs UART and NAND access.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 2d9f495660c9..c74003ee9efc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -26,6 +26,7 @@ &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
+	bootph-all;
 	status = "okay";
 };
 
@@ -55,6 +56,7 @@ bluetooth {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -135,6 +137,7 @@ pinctrl_uart4: uart4grp {
 			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
+		bootph-all;
 	};
 
 	pinctrl_wlan: wlangrp {
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
branch: imx6ulz-bsh-smm-m2-bootph

-- 
2.43.0

