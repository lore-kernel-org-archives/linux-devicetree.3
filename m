Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5152139A809
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681819; cv=none; b=GKWO92xG2Ahfj613kGaCsDFNBXzHJg6+QZxwW3Z2uhZr26FEmY8NudyzOxCoXN8I8JIkOulHMWHhiJ09erR8n/qhXPINj8pX7GoMSGUul0ahXoP9XFrnRV47XkNe3Z7s6VJsTA4WiIgdPVeNHxxsoIh7X4PAsv2GaUcTWf2GseE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681819; c=relaxed/simple;
	bh=VhekGTjk/1zXeGIGbEp+mvkiBuKm0sxCLfNTFeimcHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phkMsCeZrphQaYKsjQDLa44NfYzKyxxpVbcB2m03OwPsXKFQdCwUHbsD+Wa2DjSuJfjHdxDxtQ+tVAoQ66hujGonrxEW8o0HgVo7quv/521nIozv6rbiKmJMCS0046ISWvfOh+67dpcL048EmgTiEacSj+Jcz9h7z2DvpD89YX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZco2aAJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZco2aAJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43fe8bda8e9so1362880f8f.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776681817; x=1777286617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhm2GeLeG1UM0/AQDKFsQSbZ5IfXuExVpXyI9JPf4cs=;
        b=VZco2aAJ9RKZn+y48b6y5KhQxByBjuwm3Kgk7lgj3BvOUSEqQSdfWaLrzFHMuWg9Tr
         O1rg14RdAxE5MQJKSxSHVLRCP1AjPWJle962XWIHVGTiWOkrX70EvuVASDEEXtvsX3uB
         NESzrhQ8W/FvJFj6s6VbLqJh1N9t0RKlgDkL0tTVXD4yvclwoehbVClSG4NpQuHKKDp6
         3GhhIvAnNuPWRoi04UIJuAz/FdmfGCD7v/LnG2tgFRov2VTZx1KeG1/pmFzOKhbKdi9b
         3qaapAP6JgI71odqO43GtbIQ90GR8wepoEIz8RpaPEUtlanO1RrorWUqKubzcM2A9yPX
         rBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681817; x=1777286617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bhm2GeLeG1UM0/AQDKFsQSbZ5IfXuExVpXyI9JPf4cs=;
        b=ZgGcsfOi/LLDB/fsDIoHQ1dE3MPng4fyfHrOwz9UIyGnYOK1+fwVW45HxCBS4Bj8bO
         7nuGc9sF1Dndxkb/GL+ajZi7cFMMYKFYcWFvSNnk7M9rKRoOCbe5OIpJYnn18wEQeeYh
         ZB3hbfArLEHm1ALH/6bpBTWnpcCibO79HSsrK5RUORbJWafvw9H7yGFODKwGY06apnOM
         BtRPqWXUy4HGHLZfeGggomPUfqJWp47hKn0Uc6/69hT2VNdfbTZg8VHC5+qUhfto/eGv
         /54XrGYeIizmWl9KND9HWyJWVf/dvEYtrhxW71m9hDvuN4ge+t7dyBTKm+s0FFlqkrzC
         pHuQ==
X-Forwarded-Encrypted: i=1; AFNElJ90yM+K0msLpDTb1fAGk7b4MqiQDpN7Z/PFos4FvOrtvRlsWwxlcak48jRXqCU3rxTiiWOLDX9+FR/H@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ529L01d8yPSGlw0K2CfEqo7DSpibzQbzLr2c7+EG7D4M2M7X
	BUhCAWDZvMZAcdCKwtqAXPpF4oYOEOCvVX1Asp+uLAXf009/UyRrMFZh
X-Gm-Gg: AeBDievsb+S7th9JmhZMYnkL0sfv/Zcooj0ovjDp7R9oW+kxGmG5+vremNeWvtD87mo
	YC4wrnlV4OEVUQisXyrfjbjzuRKO1QLjqI9W9RfO4OmIj6sjrZbgvx8I3B/WGfsoZDE5tb45PYH
	kozwjpUIM5ENeYIN3I/l1+r65lLMKq1VraeWTw0V2zyiN7ZblBjQnLEgyXQtD5/Nux6wmqwiOQ8
	zhsjaKbLFRImOTyeWwTzbjRsh0K36fSmhY4rADrlgFhn0Q/AUefgTH11t/XbmisP2LF9/PTtv/4
	mKNAcibEc4pL5QQSZmgqZxjuOqG5h8WoWEtlns14NsCzGp6E1h8Dmjxf57VQSCVc1FRq4XEhwb3
	6LVdqlsbeCr9rDa3bQyLvZd7zy5QdPGHb+xi5KPYHvtmjmflh9jOJ0PNS4rXWAXYV9luhfiHRPr
	H0Ic7bJpWHqaUGMCVxSFVZOsq06e4rpRfcfiptmsni25BZZBD9FOpxBFT3MxRBENwlT5WsvQ==
X-Received: by 2002:a05:6000:22ca:b0:43d:6f0f:32fe with SMTP id ffacd0b85a97d-43fe3dfd65fmr18556724f8f.31.1776681816481;
        Mon, 20 Apr 2026 03:43:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm28038301f8f.0.2026.04.20.03.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:43:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 1/9] dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
Date: Mon, 20 Apr 2026 11:43:18 +0100
Message-ID: <20260420104332.153640-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
References: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L GPT IP supports output pin disable function by dead time
error and detecting short-circuits between output pins.

Add documentation for the optional property renesas,poegs to
link a pair of GPT IOs with POEG.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * No change
v24 from [1]:
[1] https://lore.kernel.org/all/20250226144531.176819-1-biju.das.jz@bp.renesas.com/
---
 .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
index 13b807765a30..98bcde755fb9 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
@@ -245,6 +245,28 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,poegs:
+    minItems: 1
+    maxItems: 8
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to POEG instance that serves the output disable
+        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+          description: |
+            An index identifying pair of GPT channels.
+              <0> : GPT channels 0 and 1
+              <1> : GPT channels 2 and 3
+              <2> : GPT channels 4 and 5
+              <3> : GPT channels 6 and 7
+              <4> : GPT channels 8 and 9
+              <5> : GPT channels 10 and 11
+              <6> : GPT channels 12 and 13
+              <7> : GPT channels 14 and 15
+    description:
+      A list of phandle and channel index pair tuples to the POEGs that handle the
+      output disable for the GPT channels.
+
 required:
   - compatible
   - reg
@@ -375,4 +397,5 @@ examples:
         power-domains = <&cpg>;
         resets = <&cpg R9A07G044_GPT_RST_C>;
         #pwm-cells = <3>;
+        renesas,poegs = <&poeggd 4>;
     };
-- 
2.43.0

