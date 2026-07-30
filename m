Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE606402429
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403394; cv=none; b=rfhWUyfrKi4AN8j3dSvFH7Cqh89xJhE+vU0ZWy/VmqgU8bcN1D6MJqebKDVSpu840zaglUfiXpl4n1ljBWQ2B7j727THkCTzobb7X0Gp68Zl+Z/WVhek6Y+r1Si3rJMi5herE5aZX7EcYdVEI1MZ+xot6b/Y5hqweWjl/Qd7B5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403394; c=relaxed/simple;
	bh=4rDf13OrEejhabHPDOf8r8is5XO9Y71faY+r2M0nbCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9UZc3b3q9DTxuSswzKYqqV7VvrQx564uwOZ31iyWHsSxIoC6AQkAY+zR6gQ+hVyngtPKwa5nhsDManOERt3dv3EIKkIy2XnvBcOPdvn6K3i7610aTgfbPhfM+s0jpJ1YvoQFXb3CvIYAmnWzwYlEIqqAVg0Pb7RIPGdPt+VAFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StIMeeA3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StIMeeA3"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1790818f8f.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785403391; x=1786008191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19dWbdtDz3PuL5QLyRHvpa2qFjaBjIFM+A1PtZ3dpCg=;
        b=StIMeeA3Dhz+znVjUooqTw49hfnyCNc4N0O8jiWthV7W0/Xbbz08up/PQFvtIAoGpr
         me6HEWAfBlngXzIpbZx4s9dv7cI3aXISXTw35/ub5BJCNfQYwzX6WS/wCQamQxqa6uyT
         sIMR5MnEWqBeaM5cCNfnErdvXt61K7S+/pu3+/E6eZudyUcLGODnfHWzn9wOoWTIpMZW
         n2XbgeId4SqEbi9HP6w6Zdd4AEMkisfbo6Sra0P1ZlKBBSXvwGLTYqp5gyMu+xrWN0j0
         jCASVIyEocPnRDuzAL6Kd1ebTJ80YO2bendH1DpmoPUZLSavb7aXGi3ETtfbuX5Md35s
         wA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403391; x=1786008191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=19dWbdtDz3PuL5QLyRHvpa2qFjaBjIFM+A1PtZ3dpCg=;
        b=GujznuXVEnT39joE9jdw7Lsm26vHQvPFCvK5t3UNTtBv9Ev6NctNe8gzfxxe6l3fDC
         0DEbifUJOdt4u9vLHtiPIsKwcA2NyvZKtSaziffEzdj0omVEKoukcE/mRpU5I811TVi8
         n0ZgEC4i64MtBmCJl6VbDBOcCJUvbKpLONYREM3pKqe9nw9FEjiwQd/6bX7ZgksaehTn
         glMjunoFUtY/C54mIDt0/370ZPxiQR+tb/jlPBzaBQjMnn1tcnf5zal1xy7HIviWN6cf
         79lK31qd76Nwrknk2BflZbmBgj3CzWPHYDiEIYGExmQZp0Q+OwK82d6Snp+DVXqy6zIQ
         C+nw==
X-Forwarded-Encrypted: i=1; AHgh+RoL8xkZQ9AC5377ksnBOiQq3hG6OZWov1gq3SSOPy2EG/g90Yz47SxPSV3fudfJV0NfVNt3fKEPexXl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56EqviZP2ewilIL44RMMui0wF62PJfYoGPIsj8MLBdBrviw77
	rEM4/6eHqDCcOa20lA2nJ6Jy0MFsSADJ21LMx+SZuy/HgrOVbUHX5jlz
X-Gm-Gg: AR+sD10xEfreeHCntp0wPKILOgOVej2thb2mjJ2r+NAyGsmL00PORtHHGA9LBrSW1dY
	H4O6+O/QEdxxntywOkt9dwmc53eC3hoD23vfWVyuOwOMan3uYoGRQLIJ2gpNloeRQJJzgnlA3Gw
	IhZ8siAe0y7PFGsb0di0bLlP/1bpHS9QaigXnJuWzY7FjZXZE5ecMI9cwhz0VNr55/fROxsGgEe
	/5Bxj0lqzyXR4trbZ8e57P1EXvdEJhSeChjYkqbuxay0ReWiCnYkmzhMphh4P3I1FLn1Kyw1Bug
	QKrxx/aiQwg7u/1Nn0V7PM6/PFsXQgABF9wOCSePJjKz8KqQA6ZeraYCO6QpbxHJ6/CZrFhC0XP
	jgfKbnuB6Ej8rWVNVOMdFhr9est61Di9Y5QxWOkF4mJ1BAAsLOp95wNSGYkQKxLw3tYBVZrhcph
	0yxjujyOz73Oh9zy+N/OcjiFV/olFW+C8Hs6KrZedgimg4TUYK75JGI0Q4jppE4pE03IBaSJq01
	qtvJWoapKsThanSbk1LHSxQ8tQJQkmZxA==
X-Received: by 2002:a05:6000:1a89:b0:47b:5f25:7c59 with SMTP id ffacd0b85a97d-47fc822dcf5mr2420000f8f.38.1785403390868;
        Thu, 30 Jul 2026 02:23:10 -0700 (PDT)
Received: from fedora.tail6d6c39.ts.net ([82.77.79.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fc88e64d5sm4308425f8f.15.2026.07.30.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:23:10 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Eduard Bostina <egbostina@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH 2/2] ARM: dts: ti: omap: Fix TPD12S015 node and endpoint names
Date: Thu, 30 Jul 2026 12:22:45 +0300
Message-ID: <20260730092245.52034-3-egbostina@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260730092245.52034-1-egbostina@gmail.com>
References: <20260730092245.52034-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPD12S015 node and its internal endpoint nodes are currently named
with unit addresses ('encoder@0', 'endpoint@0') but lack corresponding
'reg' properties.

Remove the unit addresses from these nodes to resolve the warnings and
align with the core schemas.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts | 6 +++---
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
index 46270ed87..1ac9c13dc 100644
--- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
@@ -152,7 +152,7 @@ hdmi_connector_in: endpoint {
 		};
 	};
 
-	hdmi_enc: encoder@0 {
+	hdmi_enc: encoder {
 		/* "ti,tpd12s016" software compatible with "ti,tpd12s015"
 		 *  no need for individual driver
 		 */
@@ -168,7 +168,7 @@ ports {
 			port@0 {
 				reg = <0x0>;
 
-				hdmi_encoder_in: endpoint@0 {
+				hdmi_encoder_in: endpoint {
 					remote-endpoint = <&hdmi_out>;
 				};
 			};
@@ -176,7 +176,7 @@ hdmi_encoder_in: endpoint@0 {
 			port@1 {
 				reg = <0x1>;
 
-				hdmi_encoder_out: endpoint@0 {
+				hdmi_encoder_out: endpoint {
 					remote-endpoint = <&hdmi_connector_in>;
 				};
 			};
diff --git a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
index a2a654ef4..ed8d3eebf 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
@@ -121,7 +121,7 @@ hdmi_connector_in: endpoint {
 		};
 	};
 
-	tpd12s015: encoder@0 {
+	tpd12s015: encoder {
 		compatible = "ti,tpd12s016", "ti,tpd12s015";
 
 		gpios = <0>, /* optional CT_CP_HPD */
@@ -135,7 +135,7 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				tpd12s015_in: endpoint@0 {
+				tpd12s015_in: endpoint {
 					remote-endpoint = <&hdmi_out>;
 				};
 			};
@@ -143,7 +143,7 @@ tpd12s015_in: endpoint@0 {
 			port@1 {
 				reg = <1>;
 
-				tpd12s015_out: endpoint@0 {
+				tpd12s015_out: endpoint {
 					remote-endpoint = <&hdmi_connector_in>;
 				};
 			};
-- 
2.54.0

