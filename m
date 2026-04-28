Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38D0239E7F
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336497; cv=none; b=HehvTPcm9D9gBG4p0yoMDipHh8YAyFs5DyNFwRoLbcE+Bfm/5oNHvfNFr9QRrFWuDJTMO7hFIVUhpenv89vjStYDaAGFtT0n6RhAJkM95YWxDQA6ki3V/9HGYd2CIQ2e5K0b9dlFBEcdGMM/ocBq7UFvKAnSIjDU3sO4rBzDJhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336497; c=relaxed/simple;
	bh=1MEvtHLSBaSxR+1sNhqwrZf3GdS+p2/3VevRkZxhtdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrKjE3CdKSQJHfRlubTMnh+nAuZWV7uIqJoJ6gAUn27PoO2qR72opQ+VkBl6sZMYLSJYi0Lc6JRKeEpvlwkdU8gW7gIKQmn7onH5Q3XCoEsdwfLeKm7/HK000fTX2pWuoKV8S9/BIuqYcGHrDwjMujEGr6yHMt6pmyHP77qyMx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/MPEg8v; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/MPEg8v"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c19d23b19so14078860c88.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336496; x=1777941296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTbkxPf2kr2XKpradxxHMrPE8qucoJpVu0Gl1gLk7hk=;
        b=U/MPEg8v8AtmhZWNxM38qrp4uA2SWdD14T6dasNX38DJUuMTz9VXq+xgzGuKiPZvSi
         owMMdKhYISd5ukyfW3ErIS1ogGYD2xrJnc6dS1RpWvVbBXb9Af+28++mJ8w2TVOJlGSn
         jjit5X2EqsXlSMIJFcnjZ6mUSAB6zJz14x3Tr/2Pk31r9s3SU9wOkBDQIVtUDIfdtz7n
         5vrbvsm4jpdgroRiVYD8Z0Xi81WyCLCcgDZM6aOqfuBa+mm/D+6Tg8Qp+nQLKSmurLLn
         IjTbsDl5jqeDGxf6F3wzYrw4CDY4JcdJcggjsKfQ069gYk+M4E0Y6EF72paZQKGr+Dcw
         8I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336496; x=1777941296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gTbkxPf2kr2XKpradxxHMrPE8qucoJpVu0Gl1gLk7hk=;
        b=Fet3xhjKVTT9wTfqdEKkOR0nQZ5GA0fU7JB6CkItDH1X2w2Q48dA6P61lfDKNl8DwC
         YMM4DNn8QSnkjFsOHhePu1R6iJZee5us0/vd2C5QtVt7dCHn+1LAzzdyWtSZ0IUqR2rN
         yho+gDODUCsruVFMeemVIdPktDNVXnpA1lQ1RA4/o8SjimJol6AaUEVLWXxL9FvhcirH
         soDOOYbK8uAMJFhQNuPKKo8UWJLBjWPqRiFEyG3QCAI9x6o8HjSiTyvafDBhWZJP+qW7
         5DrSQUolDFTiirFuuuogjEvgbe9h0Pf5sVm5v2V8wBYSDX2Eag0mJ3TdfXjKEMEqpYCS
         2peA==
X-Forwarded-Encrypted: i=1; AFNElJ/bE9j03vKYpUo4T2dcLdKaUVgBlAUb5jHTlYlEw5mGOLZB6td3JGuvQjzYoKoBm+oxvX0df6X6GKD7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70hs7o/Q14vRiU8SOrAf/qOXv6FngJmaamt1II6eKcJ8b2aFc
	TyFGqrNtNQViDmPO0PoT/e30uQSdjk4pk4M3NFQU+JQBTK38kU7aSd04NJCJxKdyNVg=
X-Gm-Gg: AeBDiesht8d/KhNwHqWsZ+lUStibggcu0NSty6pRAkcgcwYZh1GUV0CJgKNlOrgnBWc
	C6qGpmDCqYB+4ErVYe42Ldhr0GjZzmIuG1E6BfUQfGU7sziMKjozD4KVhMwEzCN5GqLHeoIit8R
	uafVhbWUqtiUUDizuHg4IjdbWMeqYuRbyb2vMM8R8daZXK4W4WcdoZxS/a2uKPEGAxPBkZ4Czms
	9RhVZlfb52LaGQj83ly/HUfURvttCAk/FQxZKA2VH+02gaiURMGBEeThwkY7BcZQNR8HbmKOyK+
	RwU3e6uVQhkYGR9UoOnMlevOCI2cLJbDsmuJREK0nxjTlEqQOIESVyXscfr1bXXblf8PhvaGRoq
	+i/V/JOquBlpC2BzcrI+myNbILxpiNGw+AwjpLdHUsPrVbGIbB1kJAe4gdh4lRhEJACfZtTrOY7
	ccn1n5xNEQUqiBTnyUebFn5SR+saHbos0=
X-Received: by 2002:a05:7022:fa05:b0:122:2f4:b285 with SMTP id a92af1059eb24-12ddd9b4786mr562288c88.25.1777336495781;
        Mon, 27 Apr 2026 17:34:55 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:34:55 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v1 RESEND 2/5] dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
Date: Tue, 28 Apr 2026 08:34:09 +0800
Message-ID: <20260428003412.322032-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428003412.322032-1-jerrysteve1101@gmail.com>
References: <20260428003412.322032-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/leds/issl,is31fl32xx.yaml        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index ae5736e1b8e4..01284a506e0b 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -21,6 +21,7 @@ description: |
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
 
 properties:
@@ -30,6 +31,7 @@ properties:
       - issi,is31fl3218
       - issi,is31fl3235
       - issi,is31fl3236
+      - issi,is31fl3236a
       - issi,is31fl3293
       - si-en,sn3216
       - si-en,sn3218
@@ -37,6 +39,12 @@ properties:
   reg:
     maxItems: 1
 
+  issi,22khz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
   "#address-cells":
     const: 1
 
@@ -60,6 +68,22 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - issi,is31fl3218
+              - issi,is31fl3235
+              - issi,is31fl3236
+              - issi,is31fl3293
+              - si-en,sn3216
+              - si-en,sn3218
+    then:
+      properties:
+        issi,22khz-pwm: false
+
   - if:
       properties:
         compatible:
@@ -116,6 +140,7 @@ allOf:
           contains:
             enum:
               - issi,is31fl3236
+              - issi,is31fl3236a
     then:
       patternProperties:
         "^led@([1-9])+$":
-- 
2.53.0

