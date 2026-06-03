Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B823A9DA4
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495858; cv=none; b=MoBVmJl6aIUyo0qJb1jHo31QCKBJHBt9ly7XNh+dQWTzIu4diwkyJ1+Nl1g2EM0V/qHQrEfnEA/lIyIVh95XD+iqbiLdNeQGm0PGZshjcW8SDpN18sQ4kg+5zJA72jyL8uQgwc/HHONDeGK9Ep4eEMnNBl6gUj0Qxwu+7pT0Tec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495858; c=relaxed/simple;
	bh=CGFF+18t2BhBOdyiWzPFWns80o+l2buwNiedN7HApsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FevJhkT7VpbO+gwOYrRoCW+2ox6rBtMiMNDJ6hMYKazkcPMZPT53MoIIxx5/WS8E0YZ21EImdWEeo5mBpHoQqdOKMsG5PZQN6NIggY/OIBTcBDyw6bXN6HhB+GsCGo1DcQN7HSaHgm83ohBWRjlk6Ip67Hc78qMu4DeEZPHDWIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+hDu9ja; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+hDu9ja"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so4244167f8f.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495854; x=1781100654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmuRKl9fxrcF6ArlWkpcPVYc+ox+WNl3WD2EPf+Twng=;
        b=j+hDu9jawN7jluH59UMi2n8JXBCcETONR/kwacZo1q+01NNxjxbjQGB7JZebzkuIBN
         wCYX2eX6QfUrl0evIHyNEsbHMMbTgRTGbQu3eEprLNkOyGVlQwv7t3z43I+z5qfo+2W5
         Aaw6RJsv5nAfgo+72Iu8mIFHWrvdQbGrzYvclnfWjvtBNRziIehybTs3B8Kbs+KlM5np
         hgFBs71JQcik6Lu9vlK5+Dzp2xiXC6ud4fwmc4+nTkrq0vW2oMGsidiI8LZ8yrk0X4Bz
         y+B5MOxQIR/WDxuhvW/wAY3ZOxydpZnb7W3hp0bdzh8YHjJs7E6VlGYYM9c7h1IeptTa
         dacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495854; x=1781100654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmuRKl9fxrcF6ArlWkpcPVYc+ox+WNl3WD2EPf+Twng=;
        b=bfSpwYtBvDGiw2YLpJSAGDbteuQOGOkDZoSTYIOmB3MCzMv7j6gR2Kf7n7siaATaSe
         1dP9Ex4KpkEUXX3Uki5EOSiCZOvMD4V3oRKWOFzzqC8BuwHn1MElnlwt/i3VDoaH3VEx
         p0+SQBtQc9CRQCYtywOAZCTq0KJk2VDgs5cpOhF3Z/ZZEnKeGXw/N53l4XBSvKv9lluU
         joY0slrKsX7Z0H/LBvnDOmED9pliqvX1rfb+uV3awSfhtld4uIgdzSmPMODWDGJ1bD2F
         CvyN7aQ6G3sLw+HKJYxXH+MnwQKslaEe2bHVMiucEBfhodwH/osOT+nmxCj8jPUlXAWq
         ZJdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/3+dQZDtLHZzGCawWsxZBRP9FDvpq0k0iS09IASpQasLNY7crddW0pp29z4RNy7wB+4svZGDj9t5V@vger.kernel.org
X-Gm-Message-State: AOJu0YyNEk8s6pNMMObNVX2xVdSBsCTFa26h3U0QBbs24he1SMQD+ZI+
	Sa6LGMKU4I15O40E9iefWoa49Nbuq4uCVduRCEAYrPTy6MdzPdM3668K
X-Gm-Gg: Acq92OENPg5MZawZMBpb2B6u4sViVx3ARWVJwQY+9BxRFWzTomMY8hHBU/dRVRCTLMA
	I7aYnbnHxi5DY2SX5AqJKB977JILvSQBNkwfok8CXGVYJH8HaIbCF3KVC97iHg172Lmwsp83ow7
	SnpSTMSiCZAR404v2lxQvz69/bjhLx5dyf0wyx+IT//cu1WNnLQhz0fo/u2hxs7N9Lt55PP2l8K
	2B1sv3VJvtBK6CtcoqRmykyvzUhBegaksQyuS1CSCY4vYrzzeKL8+4zYaQnQybvrZSlHkOrzFaH
	U3udnJ3qqQpwaeDrdKT3wsoZ+Ja72kQqXaTcndluARExxBEEe3KPFwhhRKkf2UvIc+86AU0jOoc
	t4F308RL2fFEHCnVc/aFN5x39mgo5HRjt5J4DMbJcVNuiksUYBHt7WRBXXw0/IBhIM05r4Xwl21
	VmBPV9JHDi/sIOGa7ctfU96aY=
X-Received: by 2002:a05:6000:4694:b0:454:35b9:803 with SMTP id ffacd0b85a97d-4602184cademr3759686f8f.30.1780495853866;
        Wed, 03 Jun 2026 07:10:53 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm7217131f8f.2.2026.06.03.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:10:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: hwmon: lm90: Document SMSC EMC1402/1403/1404/1428
Date: Wed,  3 Jun 2026 17:10:31 +0300
Message-ID: <20260603141033.111300-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603141033.111300-1-clamor95@gmail.com>
References: <20260603141033.111300-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document SMSC (now Microchip) EMC1402/1403/1404/1428 thermal sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/hwmon/national,lm90.yaml         | 109 +++++++++++++-----
 1 file changed, 77 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 164068ba069d..a1de96e0b87f 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -12,38 +12,67 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - adi,adm1032
-      - adi,adt7461
-      - adi,adt7461a
-      - adi,adt7481
-      - dallas,max6646
-      - dallas,max6647
-      - dallas,max6649
-      - dallas,max6654
-      - dallas,max6657
-      - dallas,max6658
-      - dallas,max6659
-      - dallas,max6680
-      - dallas,max6681
-      - dallas,max6695
-      - dallas,max6696
-      - gmt,g781
-      - national,lm86
-      - national,lm89
-      - national,lm90
-      - national,lm99
-      - nuvoton,nct7716
-      - nuvoton,nct7717
-      - nuvoton,nct7718
-      - nxp,sa56004
-      - onnn,nct72
-      - onnn,nct214
-      - onnn,nct218
-      - onnn,nct1008
-      - ti,tmp451
-      - ti,tmp461
-      - winbond,w83l771
+    oneOf:
+      - enum:
+          - adi,adm1032
+          - adi,adt7461
+          - adi,adt7461a
+          - adi,adt7481
+          - dallas,max6646
+          - dallas,max6647
+          - dallas,max6649
+          - dallas,max6654
+          - dallas,max6657
+          - dallas,max6658
+          - dallas,max6659
+          - dallas,max6680
+          - dallas,max6681
+          - dallas,max6695
+          - dallas,max6696
+          - gmt,g781
+          - national,lm86
+          - national,lm89
+          - national,lm90
+          - national,lm99
+          - nuvoton,nct7716
+          - nuvoton,nct7717
+          - nuvoton,nct7718
+          - nxp,sa56004
+          - onnn,nct72
+          - onnn,nct214
+          - onnn,nct218
+          - onnn,nct1008
+          - smsc,emc1402
+          - smsc,emc1403
+          - smsc,emc1404
+          - smsc,emc1428
+          - ti,tmp451
+          - ti,tmp461
+          - winbond,w83l771
+
+      - items:
+          - enum:
+              - smsc,emc1412
+              - smsc,emc1422
+              - smsc,emc1442
+          - const: smsc,emc1402
+
+      - items:
+          - enum:
+              - smsc,emc1413
+              - smsc,emc1423
+          - const: smsc,emc1403
+
+      - items:
+          - enum:
+              - smsc,emc1414
+              - smsc,emc1424
+          - const: smsc,emc1404
+
+      - items:
+          - enum:
+              - smsc,emc1438
+          - const: smsc,emc1428
 
   interrupts:
     items:
@@ -169,6 +198,7 @@ allOf:
               - national,lm99
               - nuvoton,nct7718
               - nxp,sa56004
+              - smsc,emc1428
               - winbond,w83l771
     then:
       patternProperties:
@@ -191,6 +221,21 @@ allOf:
             temperature-offset-millicelsius:
               maximum: 127937
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1402
+              - smsc,emc1403
+              - smsc,emc1404
+    then:
+      patternProperties:
+        "^channel@([0-2])$":
+          properties:
+            temperature-offset-millicelsius:
+              maximum: 255875
+
 additionalProperties: false
 
 examples:
-- 
2.53.0

