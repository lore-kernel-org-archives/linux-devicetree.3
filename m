Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8AD39B4A0
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333436; cv=none; b=AhKuNeKohw7pQaWo3+SJbjqo1NErsiuVovZ+Ui8I4sAlzjVOUlxYwt9e4G8XQYm1TTiSNgGO9NbygJqfER4ZwaU8R3hJk0ZdZlOor4kx185ZKs/Zlvd6pHDoVF1hsN+QAIb3hbdZlX4mCnuSu1s19WFTMIZunRPV5ipCjffIYtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333436; c=relaxed/simple;
	bh=B35GEUiYL/i4rKfP8Gn+tSIfYFuWGyIXIcU6FNxorf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETWbPQ3tU06FZYbffRjGoXYZ7VQZykAeVjicO7wKWpXNnzynxbatwud2Uo2taNAwF/HDyEOLtm5l9e5+FmIVlUjt3iwiWnTYLObFMzApky6rSa07CyNX8ZKkvf9kvLr/mooOuHOPWIcRBqjYS9ke5fCqY2hK8L9YjEGrdmxDd9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=Aof3L7DW; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="Aof3L7DW"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12736a0147cso599004c88.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776333433; x=1776938233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVEo1CGXYrQb+Ske7PtqTrPoqQ9eYUg9aVr/T0Vf6Tw=;
        b=Aof3L7DWupwoJcKDUGZaU2bEMfpkIB7IYKua15lVjH1MBdhi1qwc8OrxirdAmHbJd1
         iKIrizLxfAeRNdga/oIW3mqCXMlMKMD3IqOL7CRU48omxrLVkJcOfsXXNLjc+JPSoOIP
         2/T6ci1ORsNz/Wg97svCUI9q/H2d6IK6GnahNfcV62YD8PeVR50q4kIHL5TKR9QNDJeX
         jFgb8fJrbwX1sIFwlOG7gzqkoDiyeKGC57ECEdGaG+/rnPpliQxHMwg7IVPas/6u9rfs
         ay6ICQjEdt60OTXOJv5yMd8ahln81PhHGISYhJ7LvLnd5Ds1f4aqvgGU5Y9u6L+YF+gS
         oO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333433; x=1776938233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BVEo1CGXYrQb+Ske7PtqTrPoqQ9eYUg9aVr/T0Vf6Tw=;
        b=KbLNIExOZxMEUCrblRzv5cLYcZn91TsFGoJWRcWiS63D9rBO3yJL2nZfiMpXXu/+R/
         2c7RRDswQtn/dLGPZhn9dHoJ0jC62tcI5QVeC/8NAdCY0BL+Z5t0L/WIKFW+YvyQrLHw
         Eqdkik31HX0eOFA2ysVGZM+k09LhK+1CN4ofFDGjqBoIMw+JEooINLrqUGywUIPSJuCj
         EXM2LlsTT8+VCncGUXjcfNdIP3wvsJS34SST0Bfj1bfoOSlzOXM7MhKi2nc4oocX1/pC
         KEy0ZgYQvi2DQXUjwy1Jfvv5m3pB8PHWplVX9lftdhCCw1+JxS6etPzm2eCuz2Bih2xy
         oSKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xQUbROSbDWngO/bFmUe9ZFHuHNoIwviXx88UDeBEhkaxCABizANJNzzB2JG5Ejk4x6VMAGtU0jq8b@vger.kernel.org
X-Gm-Message-State: AOJu0YxF2OfdVCY19l2kmvsqf1sKEsceMTPGdF8cRwO9F0Qdas7HUnTn
	1U9qqDI4fsnc1aaI7ilNcu5K3j0CxQezixCRFeQUi7jiscyeQLaqJ52oRxg490SJew==
X-Gm-Gg: AeBDietUMVwZsG1UcUQFOPYF+u4JWUNABZ0MRrF63No/HMcPZU6XuKt0xqO3SuMG6F/
	mMeB9VRyC+lQkSJs916KNfk/M8ZUY5zcwrrMqaq8QwgtIbpCPDgxCFxUHINTArjY5AwMs3WEpXn
	UAm1T2H5SPv6e3yvYgoP/Zfupc5BCuNs7TBrGolUSYV9SirjYhn9FwAbqV+KXjEcEjcYYyiJDqz
	yfk084jy8IbakbKAjoDvdCLgrBYzaGeukGMGiS5TFyA7dFznKDOyhhkDxf32XvgRkoYLeiYGqmg
	aJ77kD+GFwuluxeFa01eR3RyBFKF91eHqdsNnnDsZ8GjJf5ySXzOb8CUDSsF1sqQnAPinQAMBmA
	cz6nGIjytiHShDolerLFfZjZ/+psu9oM4P+xB0b0s/Z4m9OAJEjhZGiR2vcGEHR+Ll81npcs1qE
	HYXZr/0rJ2Guk/2whm+DPwiSuX5iWURxfZ70M4/ZJArd7UFVfWhw+H1KMF1VA=
X-Received: by 2002:a05:7022:48e:b0:12a:6ab6:8a64 with SMTP id a92af1059eb24-12c652c1211mr357227c88.0.1776333432722;
        Thu, 16 Apr 2026 02:57:12 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5f3f3d93sm4532913c88.15.2026.04.16.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:57:12 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v2 1/2] dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
Date: Thu, 16 Apr 2026 02:57:05 -0700
Message-ID: <20260416095706.3212158-2-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416095706.3212158-1-adriana@arista.com>
References: <20260416092414.3210383-1-adriana@arista.com>
 <20260416095706.3212158-1-adriana@arista.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configurable "ti,read-settle-us" property to resolve a limitation
where aggressive I2C polling prevents the BQ32000's internal register to
update. This ensures the hardware has sufficient idle time to update its
buffer, preventing stale data reads on systems where the "interrupts" are
not configured.

Signed-off-by: Adriana Stancu <adriana@arista.com>
---
 Documentation/devicetree/bindings/rtc/ti,bq32000.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
index bf9c1c4ddb7e..46403f0c85a5 100644
--- a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
+++ b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
@@ -29,6 +29,15 @@ properties:
 
   trickle-diode-disable: true
 
+  ti,read-settle-us:
+    default: 0
+    description:
+      Delay in microseconds to wait before reading RTC registers.
+      Aggressive I2C polling on systems without an interrupt line
+      can prevent the BQ32000's internal refresh cycle, leading to
+      stale data. This delay ensures the hardware has sufficient
+      idle time to update its registers.
+
 required:
   - compatible
   - reg
-- 
2.51.0

