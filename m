Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FC526CE05
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770097; cv=none; b=s8QAosI8SMFVBdvL0eKZjRrIwPM3u94qq0rliK6mjbyxuW2nKGgZPAQAuSHVgRy/ByR16kT4BNUb3bdhsbHu5/hVeYlcOHM2tM3wTuOsqMmbXN9CJ2K+h4tQ0+6aj12TDZsPswWqY20DWLP0kzRQE86VJaLMXRWRmynGSkTAnGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770097; c=relaxed/simple;
	bh=OctojdIU8m+qvpily36Kzj0/g3R7pymJgNJ0NOynGkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLDAsBN6JwfHmQg5kTqx3q1x5K309Jmq748nw9wn01M27LMLJDLPXmcwQdCCK9lFoeBamjXt6SvlA4Q07klY5zLbDODUa9Hi2U8tmgZjEWK11uM3ipza42FeW7ud+iXLLvLJnvBPHiS629/vSVvsQj8pMecciXz3732SsDzBwqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSFy9KAF; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSFy9KAF"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a422090b2fso1807847a12.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787770076; x=1788374876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFyM3Fwec1jl9XCBpJd4z0243DKYa3L7/AD6Vvzau7o=;
        b=CSFy9KAFNMMDVxB7yo3QE4dFidASejrwM9iW2XMa9gcPajEsuEW1WZV982eF1p9duF
         CCTVni/vuKwHLLhlARoz8bW9acM7HG3UJe68ZjoDV+yXE6Yya6I6p3jbovd38wS65/q/
         iE5Qgq/4/npsm37d9HZcS2P1VIwiSuaMazsdk9brEPvLHWpR32Ejd6uOxUCdQOA2bOlz
         YcLb5PF6AmZlhgIoZTa2N09x+1K9q9XOdPH+xp+YBNejBvkTnyzXlM9k9BmXHCQAGQDY
         BRGrXsZDkDj/h/FOChgKEykwI8K4l2VSoxT+8au+UnZtPQbHmJ3hCHBAB83Y/PRW3AV2
         2/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770076; x=1788374876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFyM3Fwec1jl9XCBpJd4z0243DKYa3L7/AD6Vvzau7o=;
        b=eP+KSjNFCCcROCFq8j9fI5PQUm7a5PwTepDeTSTsq/faR0URCCKiZrNldRptgcHUJ4
         veXaGineItKxEUBryfKGXZj68zjT3owxQAYO4LiwTNGBsNeKk0cNGh92kwlEDqrQvLBZ
         s4Z+f93czLwZ2MNjvOfrkIP0GN1voqYUj5sTX12lM/wTNndcHXSOjbss4nfBzVR/la5p
         oshrWTrFJglP9TDCwkYgXVIMXz7DAmz0HoOpZvou8q79Kg0WqQcPFsbQwLoAk7eDl09X
         yvmOcfNgyebc0mcuTJ0kTn4iaCjIibhphXlhAnOq28ULQUyRXKC8BsWOY7reg1edMT+X
         Y6XA==
X-Forwarded-Encrypted: i=1; AHgh+RqKYGkwPca0Mbkfvtje855zmTKTF+8RjPqAKjX41be9hJdn8p3PgRTzz1XqpuTujT43ZpTFjt//SDaF@vger.kernel.org
X-Gm-Message-State: AFuF++lY8Du/3H0z+hdcnOppkUSOm19NotlBOGqO8hSAC/fn+9LRn4j0
	12yk+x6cOszC3MD/UD70kNeqrllMCXO0EtlKTaxqRpiXTL9Qkun+s7oM
X-Gm-Gg: AR+sD13fM87QHVad/leWmylq+TH7NXiUl5JKwRoy330QLQWBFQpbTJ5hubq4LJ32NyO
	g2tz7cG+4r/sPk0pWSNLSAfumID4FOlMhHtzOXNW1QWCUMWNea1g3ix26QkN2YQnsn1tPntN3+D
	7wIInRiddz2EOC2qH3ZUBXmYTPY2H9JFmFXrPxt6cocaTCsVl+xbRSOmnlwFNVzlTDekB0uvH/h
	jJ7To/4rtjCQayJ3kts2+YC3MOZXATezNbuL354stQb706Z8RrSAxw0v+yESA57HUkexsLCb+rn
	2VHs30xVqIqtIcRcUyO5zLwPrWTv4sDrfbx5zpjOEFon6ScWZ5SNZ4bm8FVczFEBPhMMy+cQdj3
	XnTIgCSnWabtQj0aTiLav/oE7AbcDcaGdj2GtnfYmWJ2b3glwEapxFYke7Nc0Ayefn04KQJgfpv
	wnnOIBA7AjY0ZMmY9l3lpAgJdTxl4qG9JrJrC1SWWD37+Y2aW4LWTE8tqju0S8w3ibr46WrF4O5
	sG2q2CZ16nn5moDBdy4DYGzyZqIjoWb03JhEw==
X-Received: by 2002:a17:907:e915:b0:c21:6f8c:2335 with SMTP id a640c23a62f3a-c250c391e16mr1061278566b.16.1787770075996;
        Wed, 26 Aug 2026 11:47:55 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2533945d0esm114523366b.9.2026.08.26.11.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:47:55 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: national,lm90: Fix channel constraints for temperature offset
Date: Wed, 26 Aug 2026 21:47:48 +0300
Message-ID: <20260826184750.4798-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826184750.4798-1-flaviu.nistor@gmail.com>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Limit temperature-offset-millicelsius to remote channels only, since
channel 0 is local and this property does not apply to it.
Channel 2 is only valid on devices with two remote sensors, so reject
channel 2 for compatibles that do not support a second remote channel.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- Use else statement in if/then block as suggested by Conor Dooley. 
- Link to v1: https://lore.kernel.org/all/20260824183900.8983-2-flaviu.nistor@gmail.com/

 .../bindings/hwmon/national,lm90.yaml         | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 164068ba069d..a8b2a24501b3 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -113,6 +113,23 @@ allOf:
       properties:
         ti,extended-range-enable: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - adi,adt7481
+                - dallas,max6695
+                - dallas,max6696
+    then:
+      patternProperties:
+        "^channel@[0-1]$":
+          properties:
+            reg:
+              enum: [0, 1]
+        "channel@2": false
+
   - if:
       properties:
         compatible:
@@ -134,6 +151,11 @@ allOf:
         "^channel@([0-2])$":
           properties:
             temperature-offset-millicelsius: false
+    else:
+      patternProperties:
+        "channel@0":
+          properties:
+            temperature-offset-millicelsius: false
 
   - if:
       properties:
@@ -149,7 +171,7 @@ allOf:
               - onnn,nct1008
     then:
       patternProperties:
-        "^channel@([0-2])$":
+        "^channel@([1-2])$":
           properties:
             temperature-offset-millicelsius:
               maximum: 127750
@@ -172,7 +194,7 @@ allOf:
               - winbond,w83l771
     then:
       patternProperties:
-        "^channel@([0-2])$":
+        "^channel@([1-2])$":
           properties:
             temperature-offset-millicelsius:
               maximum: 127875
@@ -186,7 +208,7 @@ allOf:
               - ti,tmp461
     then:
       patternProperties:
-        "^channel@([0-2])$":
+        "^channel@([1-2])$":
           properties:
             temperature-offset-millicelsius:
               maximum: 127937
-- 
2.34.1

