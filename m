Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D8645EF29
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188987; cv=none; b=i7h7iOwIjQm7FQKsTqyBw2m8tCkIh54Ol0KuVnenIVP20KaNgbnxAAp1HY3gqFFlLlX6IqJtrzyMT/10IOYaudc6q5YOv9gdPRksvPEmMCmidjHU3ClWG3gBBjMqLzhbSiv/mam3LvwR+CJvCJme+R3y+/HKdGh8gVYl5RktcfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188987; c=relaxed/simple;
	bh=USJi1mzL8+lPOcpSNRWr0Z3kEjLwRiOa7ngvLPjI/TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohyql7u11+1NwGrs7/AxbOJrjT9OCZH/M5BpAfMPay5066NerVM9+D7QgwStF/4bx78vzxO5YD4o8LXEEjzgoHQV34rcpz1SIwadv/EYynazukBSaHF34/zIW/pBZ8CL6qCav6pmYeLy50OtkyyyHgMAYxbpO/oA0sjEnBLeNAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlvuCuPH; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlvuCuPH"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1168697eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 15:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188986; x=1792793786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7D3GGnuSg0CzAtbTEwk4pCTsYfF5JzaHvUW0xerr6zc=;
        b=nlvuCuPHnWXB84FmDro+crEVYnrpf8j5LWlh3WtRm6jV/xxRQXsGdxIhF5Anf1NYPH
         qh7nO0JCxykAKpYQKw3/0OvT+aAF5OgYpBIaY72mfyHP+vC5nL6xyfvbw7oy2xXaAOWm
         Gr/bp6/Vjd1qqlbCHWBZq7nHrmmZf5mCIPqeSEDyYVso5IuZ/85ZgntDnDRNkWH4o/Z/
         hIMI9jjd8ZeKOrY563XdIwufE8b9ckY5Dd/L4zyiRoFpz+MLtOfm/rZPy2mBNk0DIh60
         smqCCgxF160QxzJAAc/HOtFKATzVr7obBPNgIdTYaqGMQvrORrSpy+2an2vjDwfi01jQ
         cu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188986; x=1792793786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7D3GGnuSg0CzAtbTEwk4pCTsYfF5JzaHvUW0xerr6zc=;
        b=HF+DZBfZukATXyqO9w0Kzwj0C6hH1mxQ99TppRKu2Orxbert4J5IFIOcjo/fNQ8Upw
         3Vv4Ryju2mBPWCdN+QfB5m09D970egLb12Jryt7INiXdB5CE8aRopmsGCvwtZDlzcDsi
         5o2KNkf6/E8TLD4mockuzZbfSMrAK2L46w8fSd6pHuZ0k31v3PDRxLgr61IeXsZtwYe7
         YEUaw4MkcXCHN4yW/TuR7F998xl1C7GndCOgYik9O0sRvrrhxZBMwcwZXwJs3q6w72B8
         wN2osdGNtk2M4Fz3WnYjvdYqULUo75GzE4r1cykWM5UvEdqS7U4ZjXNYlvANVLz08cJ3
         MtgQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3/+rAduvODo/Sdx6Nc2zaLyRVk7WPatG3mN8/DQmMrvrSUKYJHm9evEcf/+WHaQTySJZ9ZSo3cTdz@vger.kernel.org
X-Gm-Message-State: AFq9FYJ43Ieh+V4N+s9b3Y1gvOvq2OEZRY473BoEEuWPEf0Z87Nx3JKg
	k3UaV0g9p4vu5keVlLXYZ+PSoezx7FRqjX0ciUtJtYwWfC2MsaHhtdjbeOaXa6iG
X-Gm-Gg: AYBFou0OTJiJloq8QmSlc7t+dIN95NLhXAccmLrWDAKdYi9EZo9EFp85kWRhV3HZQHt
	K/nypRlv2fCfS/138jTVhqpKdM0VHySGwWnSWIFiFIxjCrRsdbz/oOFqFFNh010619WIyAPRBx4
	L8V78AsCAVgKSztD3fKUf//Ca7wXa2dldqkY/AF3TVmwGyoLquyAnAMI/zFgeczirxRZwP04b55
	lCZldRJvLP+AmMasUUCe+dkMffryAwkSWqJu4WsVzJi/cPbjBW2l0Tf/xOsjnONXYQ0K/XLgwgX
	hUQ/4A5EE/fMUqYn1ylgqYXtpIBZme6hWN/PByKadHWKg+OCReraXGZNzjDIgRTmbus4S5zy+E6
	iZVww9Z7IVmtnlWLZzKFoXjoJSzt58XOzXUnBCZm1p2v27dSeR2wktoR/kQtGVgh0ZqZ3FMtY9e
	hmS1QweQmXHRpO23vsgJ55jHWYpWeDMc267tNoztoOVlm6Yk5mQQgT3NpglWtATY7uYar5eg==
X-Received: by 2002:a05:7022:b057:10b0:163:8b44:902c with SMTP id a92af1059eb24-18512c37e50mr1582749c88.17.1792188985543;
        Fri, 16 Oct 2026 15:16:25 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm10480863c88.6.2026.10.16.15.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:16:22 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	manuel.lauss@gmail.com
Subject: [PATCH 2/5] dt-bindings: watchdog: gpio: Describe minimum heartbeat intervals
Date: Fri, 16 Oct 2026 15:16:14 -0700
Message-ID: <20261016221617.2223004-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016221617.2223004-1-f.fainelli@gmail.com>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some GPIO-controlled watchdogs require a minimum interval between input
transitions. Add an optional hw-min-interval-ms property to describe this
constraint, allowing the watchdog core to defer early keepalives.

Also remove the 16-bit limit on hw_margin_ms. The generic GPIO driver has
no hardware register imposing this limit, and its heartbeat interval is
stored in an unsigned int. The MTX-1 watchdog has a nominal 100-second
hardware timeout and requires at least 1.6 seconds between transitions.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/watchdog/linux,wdt-gpio.yaml  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
index 499f1b7e03f9..1adbfe5e5461 100644
--- a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
+++ b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
@@ -36,7 +36,12 @@ properties:
     description: Maximum time to reset watchdog circuit (milliseconds).
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 2
-    maximum: 65535
+
+  hw-min-interval-ms:
+    description:
+      Minimum time between watchdog resets in milliseconds. If omitted, the
+      watchdog can be reset at any time. Must be less than hw_margin_ms.
+    minimum: 1
 
   always-running:
     type: boolean
@@ -64,5 +69,7 @@ examples:
         compatible = "linux,wdt-gpio";
         gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
         hw_algo = "toggle";
-        hw_margin_ms = <1600>;
+        hw_margin_ms = <100000>;
+        hw-min-interval-ms = <1600>;
+        always-running;
     };
-- 
2.53.0

