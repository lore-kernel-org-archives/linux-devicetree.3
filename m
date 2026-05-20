Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC78366075
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296695; cv=none; b=FyiTPDb6PZKw9ZMGRPvj10yZxeOLpzvvOZjIWDrv+0+hMQKWZR8p8iFu9aAK+2igNjkpSW1MY9kqcDzHK/rGXN61cyQBu5Q87vA2OulN7m2OmcOW9EuiSnvHJssxx9Jsp6EgBCVBkuOWoRk3/+6my7NrYIqVuhQwWvxLp0QB4Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296695; c=relaxed/simple;
	bh=FLqUIX428NcdVXqPQ2yfeTF+6utbR8zEMIS+77WHeGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+eKCG86FNzW+9Lp3HFU6YEPPT7YC/F9mhJGDR3Hz3S0aRxgNkzUavhjLII1cmwqakC3fhCEG2jlF4UTHBmgN+WGI/j/CIBcwOCbJ0tfz4cAWAHZnn/OwJKfCrxavfqlW4vFhYPT+798NS4VQ8RVHS/JgKoao6ru5v2z6ObvE8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmJs9NaI; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmJs9NaI"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7cfc382d896so17258277b3.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779296693; x=1779901493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Geiy5fyM7q9u/Ph5RCzfpkeFo9yFSQlzm5rQUMnd6z0=;
        b=XmJs9NaIioj6M2fCHZYqyj76Ogm8Uxt3zm6SDj4JZeQRgf+aBW8krHfIWxkuJB19N1
         qnEskcx2EWpkMcA7kRLLFhk5akAmjD8VGBIXCFKHANCbc9R1eQphwsi25YIFb9j48pe/
         kKER3XzozT5ikU3qGFRyuwnzJxnsaFldx6VOhmJoPW0TdVhtfPDoZd4iteq1tRnjI9nZ
         tY8OCbkJiepGf2G6ENLOV/msx5uN/2xb0OgDLFDQ9IGGIHwcBX2jikBX/PUpOCGUcI+G
         wCv4Acur0BFv2pvOtoTbOQ52qNTT8rDmHTxnlzauxOQlnltzCUxqiOy+ARhffx6DyvJb
         9R1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779296693; x=1779901493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Geiy5fyM7q9u/Ph5RCzfpkeFo9yFSQlzm5rQUMnd6z0=;
        b=LVU/VJhdH/WEht1t9O/kTM1B+++GVBy9+d53iDbu1cyOCcMAP1cejDTEkopboj8mTF
         +DrtlMcnTUorkmCayKIYAx57LumbbOx+vd+qLChboB9QdmHDJokPy5iSFpoVl8vjeDUD
         gr/jNJRUyMpGutyCHpizmcvyKTLRuo2OUBYpSOQD3YWmlJz7BvCPndNoWQIvW+Hwc5PG
         0kPSyR1fHBbNoqi5ppYy5ae/8xLVolAhFz76znZbD/OxpKWjgnp7f6SoFmzznSxR9jY2
         e5iFqXg+Nsge1e6TaVJ0jsxumoaPPnCx2FNH8X0KNGZMM30TQZ/5XBpI/F+b5rwIRuCk
         7vgg==
X-Forwarded-Encrypted: i=1; AFNElJ+5T9pzmGm3qpCWDVLw+BcidUoX8r3x2jbCq3eEjbH8nZyVGUnQeEzEybuFRqp/3gGw+sIc4Xwk3Jfx@vger.kernel.org
X-Gm-Message-State: AOJu0YywFggyO+i8zX8+3bPwnzj3mOoBO9/Vg5ysESM7DRxd0zt04x6e
	rZoQE1artIcT3D0ninT0i2wz4ulAyhypfbMZLVhal28oVO9ypl4yYlJs
X-Gm-Gg: Acq92OEu0fJ1N+1fg0sUicb4Ror1pddhotgN+Ca06Orxlpeu167DrXTTmZwLHqlV1N5
	2eZDC25XuWzK8sAzjzmlvAV9/NkXfsrz0rfXGBn8dO+HJrc1oWMMYFPP6IPnm4l2zDbbkJus2kO
	t6sQyY6gpRPpCl4uasybOcOWtyFO5IGENKsiloNLqXib2XUjFXA5qyTsOY72fUonOee/3aPEJDp
	v1nPVkfiCY91Zfv66Pa9ebjXWTJAOaX1OXbiuop0yJltxbqmtw8kR+S+Sp+RLYFbkLd8z/Ytj87
	s9bv7Qih5XJaAIlye0xo6IcB7WVLSFPMVLVa93kP/8xxmrPJB0c9FIkJ7T/XAb09mlPj0Dmusgs
	yj51oXBgoe633Ci9GJ0LlHMwm4GYQZdULFUV1Y2SUII7JkmMjmEESsjsU+Gywn/bpZPjaA1mZH8
	wqT/+8kYng8Yczw7VjYzimPy3LE4r8wRxM8wgf1yziLA==
X-Received: by 2002:a05:690c:7341:b0:7bd:7039:f30a with SMTP id 00721157ae682-7c95d2d6960mr254992827b3.48.1779296693004;
        Wed, 20 May 2026 10:04:53 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cd0bfdc094sm51144937b3.32.2026.05.20.10.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:04:52 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: usb: richtek,rt1711h: remove deprecated .txt file
Date: Wed, 20 May 2026 12:04:51 -0500
Message-ID: <20260520170451.2403-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the deprecated .txt binding for richtek,rt1711h. It was
superseded by the YAML schema added in commit a72095ed8e65
("dt-bindings usb: typec: rt1711h: Add binding for Richtek RT1711H").

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Dropped patch 2/2 per Krzysztof's review. Resending patch 1 only.
- Added Reviewed-by tag to patch 1.

Changes in v2:
- Patch 1: No changes.
- Patch 2: Fix port node indentation in example; port is now correctly
  placed as a sibling of connector under rt1711h@4e.
v2: https://lore.kernel.org/all/20260518162014.18251-1-akash.sukhavasi@gmail.com/ 

v1: https://lore.kernel.org/all/20260518142901.1747-1-akash.sukhavasi@gmail.com/ 

 .../bindings/usb/richtek,rt1711h.txt          | 44 -------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
deleted file mode 100644
index 6f8115db2..000000000
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Richtek RT1711H TypeC PD Controller.
-
-Required properties:
- - compatible : Must be "richtek,rt1711h".
- - reg : Must be 0x4e, it's slave address of RT1711H.
- - interrupts : <a b> where a is the interrupt number and b represents an
-   encoding of the sense and level information for the interrupt.
-
-Required sub-node:
-- connector: The "usb-c-connector" attached to the tcpci chip, the bindings
-  of connector node are specified in
-  Documentation/devicetree/bindings/connector/usb-connector.yaml
-
-Example :
-rt1711h@4e {
-	compatible = "richtek,rt1711h";
-	reg = <0x4e>;
-	interrupt-parent = <&gpio26>;
-	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-
-	usb_con: connector {
-		compatible = "usb-c-connector";
-		label = "USB-C";
-		data-role = "dual";
-		power-role = "dual";
-		try-power-role = "sink";
-		source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
-		sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
-			     PDO_VAR(5000, 12000, 2000)>;
-		op-sink-microwatt = <10000000>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@1 {
-				reg = <1>;
-				usb_con_ss: endpoint {
-					remote-endpoint = <&usb3_data_ss>;
-				};
-			};
-		};
-	};
-};
-- 
2.54.0

