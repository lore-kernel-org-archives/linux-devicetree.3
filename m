Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E519A3A16B9
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 21:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314009; cv=none; b=qq6iC4S7b8RaIMdVgdFNxkTkrieU6g93PKxFh36ZIIaRnw6MH1kctSsSj3aPlTkVZvVPowxoH4t2JpB4X2CJBZep92Ces5A9nPNRmYEKqLyf9vFGsLRXHjGMcuDD+vQtVE3VYmDzIPWMAsNNH+g8T3wba9yf2cCkNh4rKuZbi5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314009; c=relaxed/simple;
	bh=2jpczetlLozyTiVeyts3vv9EERY5zylmKwvuFDOsQLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=buKKTbQ+rTFd1UfE+ceAYjgrDacB05VW64b0o/g4rjQ9YjDpJ9bS95/EIpu3qM3z7QlQK+evbXeE0Z/eF98NK3Jrr+W6gwC1L8SUoY44hpk0GOp5q2NPgrb+94p8G+MScPnPd7fNyktm4FPRivgsO9Q1vNlk0RPsoMtBN0yhen4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbW10wzS; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbW10wzS"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7bd5e373d07so56191267b3.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779314007; x=1779918807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USZ1ZPEwAt0buJ1raktBiS8fu4e5iLdAr8IWfRSGWK0=;
        b=cbW10wzS/cJoRo+4RsmAlOwjzhYjEyQxF91zaX+ul5Lt/52bXcEEGPMa2c/c0EuTRY
         vp82V2PoG3Zu5Ymid+lEKNkfg1b0wxxXwFj9ET9H+cRCcoFVEPCU8oCxYzIwpskcpfmn
         BmOTaXbgNWJDgfbmKDvVFxSYjiCoj8fllT6dJGlYDezQlgH3AAJ4tvdzzxq6BxUNGxwv
         /c6JJBzaVgB2wR9qnppbjK1P+CKfUl9nrZhmsj4o0aCdBq5808erbo7mXgKs7VlcM2HZ
         93xKQOirZdslIjQCr+7Vzx9r0vSVOe/1L5czWmAeM7I3EDgMzf6Hges1EmFa8l0Tapnv
         969g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779314007; x=1779918807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USZ1ZPEwAt0buJ1raktBiS8fu4e5iLdAr8IWfRSGWK0=;
        b=mMJTmWHt7877WXvkcwxYv+Q4z5GAYo4bkfbTOaptx6W6oD4xrCcgXvChKqUeVC3q7s
         rkRRiT9KcHxB3PPYrZA14dSlKhitkGRaBgiVWdd0kYwF3pD9WVSraGwjGsGl2bTqUFSc
         FwWSCm2XGsChB4unEAkU2QtWwFFI2WEADC7xHbpwxfuN0H81vtv/Hbjfvc7QH/OhVwY3
         HQptVsiCX3zCCTfg56SQGrRGJZdPUPL1Zk/zpugr7LpOk0tgsI086dIMjuKnEbECeRvX
         wEMNoi+LqHAMq3aMpoewz1bKSBBxMJYh/Fts4tqDtD14NyyUv7/+PTztYaqKRUGbgcO7
         dnpg==
X-Forwarded-Encrypted: i=1; AFNElJ+H0ag7wqqgyQEEc5PjN3YG9fZuxNGPqtPrRLamt7SKbmB0Y1KnBQrneT8NtH7NF82Z0KxIuIzF/p8T@vger.kernel.org
X-Gm-Message-State: AOJu0YxXKSXw1wdV25iT1FZq9LjkvnN5zQQHw2q3ys767Xhph/XQDyqo
	OCYMglcMrMTqQQoVymnsMWIRsbY8uBa8qFMTFjNptzq2df5TseNAj2aW
X-Gm-Gg: Acq92OFzzBOp8vmrnyI6MFDZHeSk+rSJVVgdX/aRxn2LEcf9t51WcFjpIcHNaRsuOXb
	wj5bd4xGkWZ957O6Wuyg8SdDezpX43g3emMqs6jqAALy1YfDHxy9gFGSskWRB8X8R95xKXlQ85j
	ZWsWWad5TiVrdYSE9wOdNeaHoY3sIs9bG4ddS5uwh6Wq/QLLRK0lCPf4yAA9AGfJMSGGbIVzddF
	5xkuxmWThTkNZLhaXUjfaSsN+4J9IqUIr/dAWB02jSt52Olwy8dSpPreS399dM8pyfM6Jx8F8HM
	IxN1SRjlRc3gMZWAGhcJmwP4fTXDQ4stY+6gGu69fRPtxYatOm9bKIs6hQ6IUJCVkwHVI1R02A4
	gE+Y02skpJ1SY85DzYLQEYrCwDIwG3uXhYUU4DZcCTUe8/n/cVg81LT7lj9BFjOq4ys2qRO/AUN
	Kr1HWfgQHiyxkTAQPBsuCH99PLl+wtrpv7NTPs1jwnfw==
X-Received: by 2002:a05:690c:c4c5:b0:7d0:b4d:e03f with SMTP id 00721157ae682-7d20a7a9720mr3219537b3.9.1779314007072;
        Wed, 20 May 2026 14:53:27 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9bc0dafdsm59071347b3.30.2026.05.20.14.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 14:53:26 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: xuwei5@hisilicon.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: hisilicon: hi3660-hikey960: move role-switch endpoint into connector
Date: Wed, 20 May 2026 16:53:25 -0500
Message-ID: <20260520215325.55353-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rt1711h Type-C controller on the HiKey960 has the USB role-switch
endpoint placed as a top-level 'port' node, outside the connector
subnode. This triggers two dtbs_check warnings against
richtek,rt1711h.yaml:

  - 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
  - connector:ports: 'port@0' is a required property

Move the role-switch endpoint into the connector's port@0, which is
where usb-connector.yaml expects it. Update the DWC3 remote-endpoint
phandle accordingly.

The TCPM core (tcpm.c) looks up the role switch starting from the
connector fwnode via fwnode_usb_role_switch_get(). With the endpoint
inside the connector's port@0, it is found through the primary lookup
path rather than the device-level fallback.

Cross-compiled for arm64. Verified with dt_binding_check and
dtbs_check. Not runtime-tested on hardware.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 .../boot/dts/hisilicon/hi3660-hikey960.dts      | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index c6056a85c..27fb08d34 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -550,6 +550,12 @@ usb_con: connector {
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					usb_con_hs: endpoint {
+						remote-endpoint = <&dwc3_role_switch>;
+					};
+				};
 				port@1 {
 					reg = <1>;
 					usb_con_ss: endpoint {
@@ -558,15 +564,6 @@ usb_con_ss: endpoint {
 				};
 			};
 		};
-		port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			rt1711h_ep: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&dwc3_role_switch>;
-			};
-		};
 	};
 
 	adv7533: adv7533@39 {
@@ -683,7 +680,7 @@ port {
 		#size-cells = <0>;
 		dwc3_role_switch: endpoint@0 {
 			reg = <0>;
-			remote-endpoint = <&rt1711h_ep>;
+			remote-endpoint = <&usb_con_hs>;
 		};
 
 		dwc3_ss: endpoint@1 {
-- 
2.54.0

