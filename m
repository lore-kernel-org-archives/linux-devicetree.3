Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7040149DBB5
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049821; cv=none; b=N/Rtfrehr6A1wX2W4fX1+cVnXopZrGfMbfIjlP/jKYp6sKEeYvl79ygBHsljTaWTG7bWShNQGyVwgsLTJESJhp6oudaWhD0nVpX4yPTNmHp/lxqe5PmBmBt42M7uaf0n5xN4dFR9UGvZVgjiTT8Au3K6QNJZsGsxTH2y1dT3QWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049821; c=relaxed/simple;
	bh=xA45Y61XTBAgpBy6OAEVUm+aoRID/iBFxEHp4Q6aM/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dX5G1W95JwOQpMoH0Xva/xQ2oUVvoBIn8n8DXtMvTc7hPJoJDxKdaL8COPtKZiUjk6Sj7ANwp3oPc+F0eDZQxWCQaTeQ5kvQXQJINqyH/Ensmi2sZCYSZRVFDQVSsRgCoau/ZKThbZrz9fZZmoVv60CMuQ11X8z1k0x1sfgqqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ9clEgS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ9clEgS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so96923735e9.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049816; x=1789654616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WKuPMePtnop5uPfXFl1ahyGCh0WOUAD5jTxVfDVb9I=;
        b=lQ9clEgS3Tw6dpdrUNTsv5JC6Pv6Mvk1nNq1+006g7fVDdjBRc9cF6cNuJpQYuJoLl
         rsSoRZbq8pwaV9OLBVFVWFcpKIIlHlhUeabZaTRxbyBpw7bEx0wVcdFk7Xbb/g/1FT3N
         tt3VK4Pps6RhuxY+6CfCO1mKKkMhQ1YwDRJ+/MbYaa0sM+jzi3rhP85Ksy8IlsE+Fq5f
         CI4e/dE8B0UkoC8hrq3QiCc/nQTsgjn7Y7bKH+yphaUuRPRTHtXZhKfl0oitdsGRrECb
         /5b3fFheIcitWvRzGSxrP421yH48vIuNZAHXTdyoTNti0MlyJpbMuxw1RUqBpPgpUdkq
         y4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049816; x=1789654616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WKuPMePtnop5uPfXFl1ahyGCh0WOUAD5jTxVfDVb9I=;
        b=LiDK0hbDoJ7O48iWR02HfXu9+XDJSux/mS3Dqwmu9PzsrYxX/n+xkgpM3/7lqRVV8p
         DoVC+2PUExWLXV96FbTg7zMNgo86EBykDMEXcQn/OA9l4jTrOCFSVLQBw80slBgVTxIJ
         5QebG9DxOBsF3Gl7c3PbWAT2XGaiG3zWAI8OXF8v3qbyvjwv76zWAtaB/B2cF6PYyXu0
         RmmGr5Hi5ltA8QfOj+V3Xr2W9YQ6+A8diMxJ1HUD+LO2uZc56LteUK5f5zEO+QSgJaWF
         auLxYbloQPu+Gw8rYZ+C/+AE5DapMhX6eVzSBfK3PgBIou6U1L7k7csOAcaW7rFPk0KU
         Vf6g==
X-Forwarded-Encrypted: i=1; AKwUvByQIKJmWgAfcfJUT5v0Ul9hEJ78B6C8R4M/AmcxvZGEga41g9boCTYl0AvC7ghXTGsArUlyDIFpX1sN@vger.kernel.org
X-Gm-Message-State: AFuF++kQQMQ7SFnu+QH7pSECygLLIG/cs3akS5NeFNf6rQEIp2vfayqR
	BvuDIfbOBL9ti04DbB36XnmILTQALPyKbtYYU9S4dXyxCW06IjSuRw2I
X-Gm-Gg: AYBFou0M8KLgyPK4Sy7s8WMFO7wozO10XdWC2NRoUXc7jwKVkuy8u5OjX6E8EUvW7fs
	8bQg3FgSngwBaFFeJWmMCaCHbIBlNBEVRY0UPXvRYuZzVKVRQ9moIl0kyeypv5V2l0ScL/Hc6q6
	7z04k/3XJw9roPZ6d/f0crBlDIb2HshjWwOtQj5oRFXF9CDLKA9vCU/dOJZjskmzwqhyJ/G2Bhx
	fHbPu8KRysgQ8n1DT1yoOaasYxqb2sb4bB+eONtG91oBrOzFARD2jCA4x2y9AlNC06LtAyQq0OF
	kiw4uiJZER80c2bv6s02TUIQpezSXK2jaYdyJuARsaMPHS4RyV7kZOaa9jTx8IrohtX0o48pfxP
	9TT/8ed5M1cwx4/VliBfsq2CW/E6JllWyMw3OAfozEXceJKxXk/9K309cw/ZokQH4JPXFHUbtU4
	xIAVmM+zYWu20DupxA9Wg0PkYG/BdOynRdoPniNZFidIcfX+owXC1TDqftBziOCmE8RTnRzUqAI
	QfQ2wmNrfq8pqrPObSLSbEjfjx38tgPKPJUpZ/hU1+B5dDJf22BWSJmutPI6Q6NkYGEHlI/tw==
X-Received: by 2002:a05:600c:c168:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49cf826c5f5mr415258855e9.13.1789049816022;
        Thu, 10 Sep 2026 07:16:56 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:55 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 16:16:46 +0200
Subject: [PATCH v2 5/7] of: unittest: Test fw_devlink with PWM nexus maps
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fw-devlink-nexus-ready-v2-5-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Extend the fw_devlink OF unit tests with PWM references routed through a
nexus map. Verify that the mapped consumer has exactly one link to the
final PWM provider rather than to the nexus.

Also cover a direct PWM reference to ensure that it continues to resolve
to the original provider when no map is present.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/unittest-data/tests-phandle.dtsi | 16 ++++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index c3727ed15bde..eef966615b22 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -85,11 +85,19 @@ gpio_provider: gpio-controller {
 					#gpio-cells = <2>;
 				};
 
+				pwm_provider: pwm-controller {
+					#pwm-cells = <2>;
+				};
+
 				fwdevlink_nexus: nexus {
 					#gpio-cells = <2>;
+					#pwm-cells = <2>;
 					gpio-map = <0 0 &gpio_provider 1 0>;
 					gpio-map-mask = <0xffffffff 0>;
 					gpio-map-pass-thru = <0 0xffffffff>;
+					pwm-map = <0 0 &pwm_provider 1 0>;
+					pwm-map-mask = <0xffffffff 0>;
+					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
 				gpio-compat-consumer {
@@ -111,6 +119,14 @@ gpio-direct-consumer {
 				gpio-singular-consumer {
 					test-gpio = <&fwdevlink_nexus 0 0>;
 				};
+
+				pwm-consumer {
+					pwms = <&fwdevlink_nexus 0 0>;
+				};
+
+				pwm-direct-consumer {
+					pwms = <&pwm_provider 1 0>;
+				};
 			};
 		};
 	};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index dfa3c885d142..b739a69997a9 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -770,6 +770,8 @@ static void __init of_unittest_fw_devlink(void)
 		{ "gpio-consumer", "gpio-controller" },
 		{ "gpio-direct-consumer", "gpio-controller" },
 		{ "gpio-singular-consumer", "gpio-controller" },
+		{ "pwm-consumer", "pwm-controller" },
+		{ "pwm-direct-consumer", "pwm-controller" },
 	};
 	struct device_node *tests;
 	int i;

-- 
2.43.0

