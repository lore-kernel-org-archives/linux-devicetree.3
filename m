Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501228;
	b=SW1q/APkTglMyiTHZfvUq9M3Wj+GJbchJP9+LReaN+8vQFmOzj3mIh2tsqvQ06G9BsDs
	 xnbIc71oBf1r9SullcMo/J6cp9MPwf3Nx5eWpfaCwhJ4PPyQlSnhDywdzXI1g8b2HWXjD
	 N3+j6pomVUi/zFfmkZC9673/2UkpDTKTMtw0l67ezOvOWA0aYHRxPQZa+Q5KoPSOm2fJW
	 EQBfxpazT+pIdwxZbz3X1HwkZtrqk1A65SU4sCGt13h8W22sFhKVOWHrBQ3JoBrU24bjC
	 ww9XgSdHrRsdvBJhP1nB1hWLORUMgX4jlINA1M7zYksHYGsLLobKmOj8bUx5jN+yTAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ThcckzMwPNlQzjyX8+RLOp31Su+73AzB9RfMA4Z1d2Q=;
	b=MAwjoSvm3oRsDRHBulfXbJ13R5EMqSB/PxdvtAexpf8iMHl8ic/torCR66dMY4dCNC/g
	 pLSx5DAT4jbT1HhytIzx2abx77NQnjLLoYIGjX9p7YNtk9s7zxOcg1LlvVfsCP3t6g0E/
	 tegPo++quLctZN6PbN635Zw7N5XRU41ZMqjYm24PVci/yqA7dPPxvA26OvPLc1m0vmK9W
	 Zpgq336nX8+yVTIZMy8NjrhGbuLQNWywEEh/kRef94ZVrOZkbeypVVnk7aRoQNgiQteX9
	 fJznKf+/cEQpfliHJf3hnCQHioiywz7TpRK9lJ1yqFnzSr3DSN7R6Yr08WTBQk6y0vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bkPIlHVk;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6B160A4ACD
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D6B160A4ACD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bkPIlHVk
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so32736205e9.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501226; x=1793106026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThcckzMwPNlQzjyX8+RLOp31Su+73AzB9RfMA4Z1d2Q=;
        b=bkPIlHVkl2+6DyV+bms3fSk0DUfaEBzatJ2hLyXeVQ6lKCBHOkuXcyYp2ucasQV7Y6
         Bzktlgjsblk+BT4Ms8druX1pFOKQE3DjybW8t7BeTCoZMIRHkrCGr4t/AdyRfIb6VFic
         +4CyCGDl5Ta9QPiLfoJHk0EALsoeuo1kuuua0HCYtIJMqR92YGEsJsjKnlqTAPIheXo+
         2I5c596M8g2SjCgjuH9KoREHp6KRO7jhmZnYPC90YCz2cr3KAsnMqyCge2ecpPMZszVO
         hVFKSV0IefGdfXTM9Bt3w1kMdXB7p0rS5qSP655OOQwtXGTDhfdp9EKuG9g2hPbBYlCP
         at5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501226; x=1793106026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThcckzMwPNlQzjyX8+RLOp31Su+73AzB9RfMA4Z1d2Q=;
        b=a5r0MKs30XjO2EiCqTAyhIOJI6D3l43j7bGbWCkWKKq5MqZOruVLIu+Nsg8wFy+19g
         XEnVIiOYLrNye00pA7g9JeRpFK2GDEX2UZPLs1vJDjZog55JuHc77gLKPzLmrSMdwkOE
         k2DTXhOeZn3+/k4GV3pU5wSeDUDYAKOECTO0CNAmxGTkdrAZMcHnZh1xwat5gSLqWob1
         CPuSgKF+fN3oKpEHlpcSSDFerybwQKD153PBKCG+m8eqo07VpJXiPlh6/ufqoz3GB3Lk
         B8NrBP4e2X1iI7L/N694DkUzNUXOIBo7Hzmg1vHZuSqr972/on6f6pUpQicTbs8XiorF
         iyiw==
X-Forwarded-Encrypted: i=1; AKwUvByW15HK2OWkC9Uiak7iMEzo1YDQCJFpGuUsPfjkWUmGQhQ6jYO2gXBmnAr8D5TY1qxjfs3kQYzEbPsy@vger.kernel.org
X-Gm-Message-State: AFq9FYLAt8PCqcs+DXcjPk7O/ZGdRygbKQgHjZCyi8JmG+kBxwF3T1MS
	WQVD27ijlXbkC3OuC3gA3S6N0lfm4jiewwprLE7Ti9QRmGjEWyy4BYXn
X-Gm-Gg: AYBFou2ZUJNKQGRIl1QFRa7EsgRnSI3qIPdkrDLJ8jaOd+BlhmU0sxOvIVmBR6xkau+
	3nCm6k17CRHGxcmKxMZKUPcoJUanZhEfuH1+XIC803GunJAYhD63dtCjH2yKRTWIp2DGhFMMK8P
	G/TfkQXuucfD1V8Axu589Wge7YyJjN5FE9hrjIvh6w+8slx+RDyEYL10RaF3nJeL0J4lKVyBAsg
	HwkMmvExK8cQtIsLTIULoVO9Oq/fKAjJdBdC860FG3Qh8ec3EvFMd3MUJtvKd4osWGZ/9s6w3hs
	MVdnHgmqTg6sxTCssRGqpMh7linHceXF2lmKZccM7zfcpeZqfA4SH0DaV3NEgm6sb4ldCP+4o/v
	xE3MWfd1tg1BTKpN/6bcz2uTRRF9yZPrkuLRfeLpseXIdcqQQTM64j2ZQJTi5TMrdBpOs3+zGGp
	9LrFhnSUbsrWHlIsByJxdJlfyt+Xk0tjmp/K5swvJwSAHSW4U4AZCJpjS5utd8TjR3X+QjZdG1Y
	R1SOXePV49JicK8LvWc//weUA0898U2eyA+WDCzNkiLOnBCSN1JLwxFgXjDwGIt4SVJrpMZ2dkX
	kSjQG8OgZg==
X-Received: by 2002:a05:600c:6298:b0:4a1:96cd:2f60 with SMTP id 5b1f17b1804b1-4a1d75ce285mr218735335e9.3.1792501226292;
        Tue, 20 Oct 2026 06:00:26 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:25 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:17 +0200
Subject: [PATCH v3 6/8] of: unittest: Test fw_devlink with PWM nexus maps
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fw-devlink-nexus-ready-v3-6-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
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
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
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
v3: Route pwm-map entries to two providers, use a middle entry (Herve)
v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-5-17ac82dbe226@toradex.com
---
 drivers/of/unittest-data/tests-phandle.dtsi | 22 ++++++++++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index f5d7ee072c90..1fd465bb8f79 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -89,13 +89,27 @@ gpio_provider_b: gpio-controller-b {
 					#gpio-cells = <2>;
 				};
 
+				pwm_provider_a: pwm-controller-a {
+					#pwm-cells = <2>;
+				};
+
+				pwm_provider_b: pwm-controller-b {
+					#pwm-cells = <2>;
+				};
+
 				fwdevlink_nexus: nexus {
 					#gpio-cells = <2>;
+					#pwm-cells = <2>;
 					gpio-map = <1 0 &gpio_provider_a 3 0>,
 						   <2 0 &gpio_provider_b 5 0>,
 						   <3 0 &gpio_provider_a 7 0>;
 					gpio-map-mask = <0xffffffff 0>;
 					gpio-map-pass-thru = <0 0xffffffff>;
+					pwm-map = <1 0 &pwm_provider_a 3 0>,
+						  <2 0 &pwm_provider_b 5 0>,
+						  <3 0 &pwm_provider_a 7 0>;
+					pwm-map-mask = <0xffffffff 0>;
+					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
 				gpio-compat-consumer {
@@ -117,6 +131,14 @@ gpio-direct-consumer {
 				gpio-singular-consumer {
 					test-gpio = <&fwdevlink_nexus 2 1>;
 				};
+
+				pwm-consumer {
+					pwms = <&fwdevlink_nexus 2 1000>;
+				};
+
+				pwm-direct-consumer {
+					pwms = <&pwm_provider_a 1 0>;
+				};
 			};
 		};
 	};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index f15c110dbf4d..320a992c4310 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -770,6 +770,8 @@ static void __init of_unittest_fw_devlink(void)
 		{ "gpio-consumer", "gpio-controller-b" },
 		{ "gpio-direct-consumer", "gpio-controller-a" },
 		{ "gpio-singular-consumer", "gpio-controller-b" },
+		{ "pwm-consumer", "pwm-controller-b" },
+		{ "pwm-direct-consumer", "pwm-controller-a" },
 	};
 	struct device_node *tests;
 	int i;

-- 
2.43.0

