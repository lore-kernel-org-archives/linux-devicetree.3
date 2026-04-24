Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A69638B142;
	Fri, 24 Apr 2026 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.232.1.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023444; cv=none; b=HXcd7VTz8kD6fDBfANZIoD/2Vk1dwH85zK30H+MGOTveBlstbAgSbOJ4IkE0hwmLzQzUYYdDf7zHu2K6CWHhQYvPhz/qdxXZzwXWB2UdnEn2xCIF+7WML8j7fULJrJTajWDn3i+LJveaOhBgQx4BEPs479nAUCCQCw4hF8zOldE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023444; c=relaxed/simple;
	bh=a0V0e+SBbKgLrqg7xX2uz/rnFz+l0ndpLNjHfaL2BdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JkzzCrmvIy9Xmrw3uauZMTQ5YxuWFa3G8DVKATyttrczWP8nA1NJqCifX7RT8PoKRLeXyLOvswAS5XBTWAiFy675rgGMDCcsj6NI3wC+vJQ/J2jpN0OjS5TxQ/REkK1tYWCJZ0pJjQvO/xhoEvu/2JoI4T3GPJCYi4DsF6ZPbbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at; spf=pass smtp.mailfrom=student.uibk.ac.at; dkim=pass (1024-bit key) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.b=rJ08/PGW; arc=none smtp.client-ip=138.232.1.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.b="rJ08/PGW"
Received: from surface-pro-5 (77.119.189.242.wireless.dyn.drei.com [77.119.189.242])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63O9agoA1184944
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 11:36:52 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63O9agoA1184944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1777023412;
	bh=r7frfbPf1U6f464ol2QjGAiiMus/6aLxPIWxUChKGh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rJ08/PGWx1y9C+1JnR1Bm2TC2dGyA+Lc+AJh5zw1Ruv97sMM5l3b6SjBhswp/jZBF
	 EmQrOjumbHuIH1BoP8agAdkXZ6rurK2MEKC6XGiLavkVInMagJ5DoYA736qXgKFC0/
	 s14uYtM2xxpMLIVMdwwG2j6pyzjxD51yIIR1aYHM=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: amlogic: add support for Amediatech X98Q
Date: Fri, 24 Apr 2026 11:36:32 +0200
Message-ID: <20260424093633.10734-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260424093633.10734-1-christian.koever-draxl@student.uibk.ac.at>
References: <20260424093633.10734-1-christian.koever-draxl@student.uibk.ac.at>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -12.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,UIBK_PHI_SUBJ,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>

Add the board binding for the Amediatech X98Q TV box.

Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index a885278bc4e2..c0167fbc310a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -248,6 +248,13 @@ properties:
           - const: amlogic,s805x2
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson S4 S905W2 SoC
+        items:
+          - enum:
+              - amediatech,x98q
+          - const: amlogic,s905w2
+          - const: amlogic,s4
+
       - description: Boards with the Amlogic Meson S4 S905Y4 SoC
         items:
           - enum:
-- 
2.54.0

