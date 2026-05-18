Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFEC481FBD
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121228; cv=none; b=oCz+s8/chwbR1LVTStmTTM/kmtxwnOvVPyzeW1MjTDJoTfcv787zYtqr+j3ny3fWCpzEofP7Wr2aWIFHI4a8C3L+xjxDILKyE1YFrc7PlHziZls9uLdq0pda3RXUsYFaVmO074zyK+m8IHnM09nlMqDsYOPyIP3Ia9RutWzCO88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121228; c=relaxed/simple;
	bh=KtWQWhKC3Kxohq5UMc3habVp2D7N2gtkE1n6puIjLZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kH7kpvn4YnKLVRa9NURPxmktR/27XR7dcE4BRk8atlB0J1PAHnph31gyEU25beWpy7yIJ9lP+q/iVXjrsg1BjhnqxoudzaBvVPSIzp/N1FodN8gdgB2H05VFOj9XjIH3GGL2RmeRO5edLwLllCLkmXoao0mz5vctaO6aYs+3r0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOvbwuoF; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOvbwuoF"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-651d6347a69so4193918d50.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779121217; x=1779726017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m95kSTeSTgyCfxV7Wyxfftox/V8NCoAaJWZ67QlB3Ww=;
        b=mOvbwuoFyUruF+IIX9LuZ6MfteNYMWr4CzJRV0lzmy2BwFxtROds+Q+BZZ9IzVl581
         jAE/NBi+JXiAhmjP6u5brCE/95xWDlVjDTHOTpWex4CCRNgFDKK6kneBjipAIUaG37Qa
         7hq6YfdM3aABtEIK6TrenMHZ9TRpp7a0fpMx7tBe3F/pt7Z0chZEpgBO5uRSQdNABj7/
         dqeXCuq6qtEHsMs0yrNF0jn+U3HUjgXY+rfLCD/zz2QoGQ318eREeMm9AgJp7x3U7i5i
         Zxf+rPQK3Rlqv2PhmeOWhdNLwnfrq6eIbiGhnE6XCIGXnpCUwebAWDq8kCLy9uB/9zfX
         ELHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779121217; x=1779726017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m95kSTeSTgyCfxV7Wyxfftox/V8NCoAaJWZ67QlB3Ww=;
        b=j9gVc7iMy7q7V+jdrYdYd1sWQZZAAF2eN5V1rzGdK4lWXDy6eCZ2+AvTKzp8gU4Uxa
         lg9OQ6TNFZDy+9w47ci0BNxiTQm7XblTw3A98LeiBvOF0uBqvyEIQU5FlmeRc7zKXmfd
         f2LTqdAicodNuIuEzv8k1OMsjKWgQeCxt/JXH4bOlveTtL79/nxl8FftAZV0iXmnsAQ7
         rH7kmfr9UleRQqim6TU3CY99SKcLso77UPcKihPvuj8agQbs9i13dXToSJq0EjXR0TP2
         FR64AAf8t4CFYH24R0110d7aj2oh5BQJxwQ5XEMATdhMKwP4FQ1NBD6BCm095Cn1wNp0
         K6RQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gOCpkHTtPJO1CJxmGjOXN51vz1+3ewnZiNXkmWqfhlnRmm2HyPqzrjTimPXQTvUbWUTnulXgvaDsb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwcam7l96NV5U1CNhi1WZPdrLo98EfYmS4Qbx1kxd6nqARpS+5
	bEb7s8jXOUQf0bB+2xIrjkxbW7QEPOG7ce43kVNE9CIRNNugqQinnXJ1
X-Gm-Gg: Acq92OEW6sLdO+YHll9xO7CvjyAqEPGIdjY1pCsnXPCRjpFoFam8+JlaGZ9Wth1RwMM
	U7w9q48l6dd+mpAR/FFI/xVCysz/CawhZdsskWTeC3gpxf6SJgXiCArd+q6BiJ1vUQ1m/0BrCQR
	ePrQJ6vMO/TwGl4oxRUWfC+SapTz6pFQw3iwLjEt9FYpf5IFWPx/XpHp2h6QrFrnaP4aB7V4Km2
	4e90PwIi0rj+63wvw/MCsAswS5SDZ9mZOHOgpKNS78J963d1N+0c+E2HAZ3eXPLmAde5iCXMV6K
	fU/bzsRrTESMqFGh1AlHyhTnwWK4aNIWNv1ezrhVDpeqYJgTkXWqCNrZ9CN2TBBSOWxQhkTPr8W
	8maKBnf8TL69it7+ihNPqfmK8vOM176CRs/sEyiQbWL45cEQbNWMJt0KFEtstrTB5IWeb9gNqB4
	GdeCZVB0zsdYSt3gNlRvmlmOs1HgS2u1qmq0+9N45kZKYGh79Uj82R
X-Received: by 2002:a53:b451:0:b0:65c:d26a:6e71 with SMTP id 956f58d0204a3-65e0b225732mr12388187d50.27.1779121216830;
        Mon, 18 May 2026 09:20:16 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db60379sm6596021d50.14.2026.05.18.09.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:20:16 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	gene_chen@richtek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: richtek,rt1711h: remove deprecated .txt file
Date: Mon, 18 May 2026 11:20:13 -0500
Message-ID: <20260518162014.18251-2-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518162014.18251-1-akash.sukhavasi@gmail.com>
References: <20260518162014.18251-1-akash.sukhavasi@gmail.com>
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
---
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

