Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2005133D6FD
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304859; cv=none; b=Hc52W5OodvFK5gKUMfUv51duflVwycZvkmFcA6uGbWz3qtl5VgR2nqUJ0GoW22xaZrL8vgoTVSA5KbaEJQybIyb/5Ic+slLKiBXfXjci4M8Qj1ozH3IJ6dc3jWBp5aAjhAjNnzG8nNIIypqra4mfBjarSvH7uibhThFhLT2Ff7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304859; c=relaxed/simple;
	bh=Ml8+WIXJmSGrbqib0u5ulf7PiZ8NZS12P3rO01gEh/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZfVJQ3k1m0Eo7JWkyNe99zr/M5Nc699Vc8FgMqczY1pUpArTWkFcQxAyIkRD/Cwox9cOcwPLFjxUUycfO20rNw8DtlmdBuCD/G7ebnzCR4s6XPzrd3J8LQWEX29IRm185foryBzhuKNkvGJAid8HtWW5v2pW/0a9Mr5woQYUBmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATyNoNbh; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATyNoNbh"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7bd6f65c781so43269187b3.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779304857; x=1779909657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwF/HhmYwf5QBeLN9SEfEOEh9juP5SjaaFwH3isu8iY=;
        b=ATyNoNbhkn1D4TDdsDLHpLOv/c5XlU43LcBi0ztrXsSO9S0agClUeU5uYN90RQUGg0
         Mjj2rx13ZgZNstHaFjumEwvSlUrFr/uhzgXyjosPRXSyFBtoe3RxtqhizDY7ixCUZgGf
         JH4x90ag5tGHR59SjuweMso4kfOcnB1su9utIZFQ2G93KCzUWCgLzcMEN1UGENoxddza
         xrdApjs1cus2gQ7o2ec2e6uTu/iM7AU0z/chJZg9RqNmBpbl43tT/NEE2NcOKS4Yxm0j
         5portzOZOIQvcZ//Jjfo/b12U10Zf6LpCRfARAMEmK/oDlrTrhpf8+dVLByTxwUS41bu
         J1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779304857; x=1779909657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwF/HhmYwf5QBeLN9SEfEOEh9juP5SjaaFwH3isu8iY=;
        b=KJ2lI7ewRzcc9nKyauosvLlaDsWr0JCRXPjGx+f4v/X+7eLMVxONG4TwVY5uHEStpn
         kKY9cFCGfLK/hsyOHmuiQDzVqL76ICScn6wNepHVbaytG42lq9HOwu/M8YZTT+EVNM0B
         Ez36q1i+50+RGkB74jsVqX6byvi2QfOlKx/sUNUt3oJD2bw4tqV62Py1FP9g5O+R/JAB
         RqwtM6OWcKlMvc1/ZaJzgzy1+YwROJWRvLnHFH0O23S+eyx4ZsRs0YdhCn80YXmfPSrt
         4cyraqBEkIiK9AScj7Kcs8fjnV/XECuOAuzbsuLcHgUBYBe3WmYYMJzT3Xs6YOt0rPx3
         ma8g==
X-Forwarded-Encrypted: i=1; AFNElJ9w57r6b5916LausxB3NU4X6D3ESlFj+sgTEzdQ53/DYYYaRD84x3Ra5sDpwXKfrNSW5kz8SC+Q0Dwr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5AxlKHpHeqcMD+RgVLz4OupjTM1NlwMcmjXHrREVl22RcQ4Yp
	5dBvfWHY/cDezPIOoy6mGel7sq19ej3YHFeIdPHr2HJcxF2ZM5c/7M8=
X-Gm-Gg: Acq92OHdvVVaaqYfkNX5gGFRM9p/rmgsMxvLKNW1nTLjdwg5n6NObx325on/RfY2rAh
	ieFc2zSv0/V8GV1ZdxpZ+OO/CrWFNqT/V7kUeMchc5K3MeYn5/Oyqi9zyhXt2/ZmIXplawAwRAS
	J32jhlEVKeQxNmNGoMWCdzK1g0VdGEmKy4+0SmCpGbVi1lNFnGqxeOH+tQn6GoAKauzdk9n10bh
	2WqDk1RphrseYiejDPHbhHa2Kv2RIcrUg4mmT3wLNIdBA9jQh1ulpSJiwA1ZBbksrkIF1Q5lRrj
	UXEQYjxVmtFXb1EDyMWxpXe/lF05MA1KwOHEChsR5RmvKtRSotET0g/hmk0dzv5Yj3ERHKEtlLV
	/JpHpKe/mpiVIssTZyGW3jNTgwCgk6fjY6M0R7XWN9GMzSXVA8yygebyH5nRatYzEmDMKbE+sXI
	CzRbITveGUwbg+cwpmqjF7SaedKBvTJn00dBpu2/DO56xIJg==
X-Received: by 2002:a05:690c:b01:b0:7ba:ded4:df69 with SMTP id 00721157ae682-7d1c369ba38mr8993067b3.1.1779304857169;
        Wed, 20 May 2026 12:20:57 -0700 (PDT)
Received: from alir-mac.sitimecorp.com ([12.1.37.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9d18dcddsm56346757b3.49.2026.05.20.12.20.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 20 May 2026 12:20:56 -0700 (PDT)
From: Ali Rouhi <rouhi.ali@gmail.com>
X-Google-Original-From: Ali Rouhi <arouhi@sitime.com>
To: jiri@resnulli.us
Cc: vadim.fedorenko@linux.dev,
	arkadiusz.kubalewski@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjubran@nvidia.com,
	Oleg.Zadorozhnyi@devoxsoftware.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Rouhi <arouhi@sitime.com>
Subject: [PATCH v2 net-next 1/3] dt-bindings: vendor-prefixes: add SiTime Corporation
Date: Wed, 20 May 2026 12:19:41 -0700
Message-Id: <20260520191943.73938-2-arouhi@sitime.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260520191943.73938-1-arouhi@sitime.com>
References: <20260520191943.73938-1-arouhi@sitime.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for SiTime Corporation, manufacturer of
programmable clock generators and MEMS oscillators.

Signed-off-by: Ali Rouhi <arouhi@sitime.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..5e81b9bfa3d0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1527,6 +1527,8 @@ patternProperties:
     description: SiRF Technology, Inc.
   "^sis,.*":
     description: Silicon Integrated Systems Corp.
+  "^sitime,.*":
+    description: SiTime Corporation
   "^sitronix,.*":
     description: Sitronix Technology Corporation
   "^skov,.*":
-- 
2.43.0

