Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651155;
	b=OzlEGe4qToiZfNLuJaaNprDViCRyfQyr0NGRg/yFMD0B8Mro9udYnn3TrjMnRoxIPvNs
	 iUiEkIM6VA0qNlUEX7d2MFTNM/niy8UE6CacD+rpTnRcSlaf6vFOjHaEuSzITAb5rzUp3
	 giQVsUcP+DaNmPTsRY329lgMrbkKR/z5gZX8tYR720/ahHkDQSP5ZPJZPuRIqN9Z+wFCZ
	 Nwrnvi3zeSj2SqO/HlaUJDFxX+inKJcgsQ2yj64mN+CJTdr7wH4shsetK4MZJZF1wALDZ
	 Wpz2OpULu4xrOQonpV9TaUMd1kFmjKwV8uUsBugBkaPshk27xmcL4cywWL9KTu+bAwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3+lR8K5BNHxu5NP+v0e972pWYSboQ57GUDtZq5df2PA=;
	b=fy3rB5yZys/xyvlMrJrH5hfKiy92UIy75KSiyPdmZsQX872ogD7USgH48y+UtKFSkJ3G
	 7jdkypIiTwjv8Q4fVA6jR1ewSQJ2sFN1LmeF6RQLPXG4TqdUbolLuboN8Zb2+Ltbv9pwo
	 93ddyXRpyjcbtp5dR+ddYSTS71j8bAr83A1hLR+U+IJnvXIVLlMyylOTTC4Mjj3bZz/lY
	 1LnZVap7zw3haREM3DO6lPxs8YEm6ZBovDOoJAqF0B0Ooq8Qp+BDPNuTVj7++mjZbf40J
	 joF2/w1gi3gKGFVWuKxrZFCr9QIkjduyPb4/S3iGKiX9KTv9R1MXQHUpV5ji6Ri9S4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lhn1fkbs;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3934606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3934606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lhn1fkbs
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e831e86ebfso8678025ad.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 23:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651154; x=1793255954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+lR8K5BNHxu5NP+v0e972pWYSboQ57GUDtZq5df2PA=;
        b=Lhn1fkbs+sQBMP7mnjKv5ZuB9n6zoQ72cinSgQnjkMpF+5wPP+lzv9866yFyUm4oju
         Ip22FGzJ6C1ChXAKP2KeTvyXkUuCZTfbxTTgs2vyRmD6xNctWFYIKdrffPfMqfL2u8yN
         u2ckjis9olpbLwxkLmslhZn2+SIzSHFB8it1gaNHMLINQndRBuUMqaMaXZxAwRBZVbiQ
         henrDjUyvyl4dbKkg63vQHVp9PkqH64m16eI3Bu21BatisgfPvDkECYgLSVUi1Dy8db5
         dVn7OC56bJQ6wcCRyhclowhvmLN5NjlM3AtwIROf1cmfNfo9nggtRXOCmb515YmzzK/t
         3EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651154; x=1793255954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+lR8K5BNHxu5NP+v0e972pWYSboQ57GUDtZq5df2PA=;
        b=p+tK0mYg3C2EdsEW0VpHFZMKjUUTijIMPV5I/RIszJ2FdE/0dmX/dFsbEggigQ8rOM
         iHA1UbPkE/vskGbX9UCsTCbacIyyyG3UCivvgHTH4VPA5uRWVqUMMiqeJD7lpwXaiSLl
         IZC7ROZOX0U+jd7m38ml/rrztU53UcI2uZcShVs5Nmn52DPEZE6C+wDM2IiCGcPaMu+g
         bfJSu4sRzYsfp8AewkrKxTy/q9+Q6KUB3RFuXkWrojIcSugEtty/FPLjG8IcPo5z1r+c
         tX4u3w1bw7s5yxgouoJmOjP9a+n3/7PaBP2VMHV/Q/0PBiFt9YllAiQMaj80zJRiWZ7J
         hFDw==
X-Forwarded-Encrypted: i=1; AKwUvBxw8/onaJhP392pgg4r3YzjMmav8y+RhIdLBo/ibaaft81C91+hnsxopZ+yERE/z88vYlNECQUKjm24@vger.kernel.org
X-Gm-Message-State: AFq9FYJoPkSMz6/+34DPradXqr8oRga/H0E6G/TYTcwPj2uSvj+m6zLY
	n2how+Oism4WCDLoDeS/IzRkgVg+Z5/OzYy/sckJ9XuQwPY1jVYaAMNfZ2fcwuE2IIA=
X-Gm-Gg: AYBFou0TocDfazw+Lcl3O1zsx0ziN9VizEJvmYWyKUsjTMBqzHlUtFMYUNY1l+3Gx30
	ayQsSktDtCz7ZSeqeym5hbAB05o2t692aUeLV/BWaNlU6x/RjQA9x1twQZ0KR3zuYbj9Yy1yriB
	TgZnSHLt4bnuIofG6+O+uv9AzujUqNr/3sTzgpRi2JM1mGTRIRhfjpkyAi4qL2VmIibb6A0rabX
	sZPkdoQqgqpMqTfztbX0p5AU4l7K9J5N/NnCPspqVGiu3k+Y7ZJ1XPBIw4h5QbvTBY0jciCCa3V
	DgAq/lSgh2lr1q9olsMvN4kMWwIZaqzEmAl0gnwwHL9+E13FdlEl7dS+87lR+3AkY18KDm16Lqs
	BwsNVHm9kIP/6v1qbVyTlWQo1P7TBLrQitcZUWuK5WLVqL++42hciO/5I11CWhjlD5IkD0AngOA
	rpycZCqeJ3XGxwqv/YzUkhFA1c4RaP0gT+A1Yyek/7NdcZ9vTGRtib7PkZAG7nD4sCIuAzo0V59
	0e8BDHDSHYizYika2/TtzERwqEDGj4sF5d44R+9c+JpyLGB70UqiVu1hTA599s+Ax6LMJTErKun
	z7zSiVCzHODZacY=
X-Received: by 2002:a17:902:ecd2:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2ea439da835mr37180195ad.37.1792651154247;
        Wed, 21 Oct 2026 23:39:14 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4113b6sm18844305ad.19.2026.10.21.23.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:39:13 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sh@vger.kernel.org,
	glaubitz@physik.fu-berlin.de,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] dt-bindings: soc: document Casio fx-9750GIII
Date: Thu, 22 Oct 2026 00:39:02 -0600
Message-ID: <20261022063902.471383-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document for the Casio fx-9750GIII graphing calculator,
which is based on the Renesas SH7305 (SH4A) processor.

Add the Casio vendor prefix and the board compatible
binding.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 .../soc/renesas/casio,fx-9750giii.yaml        | 33 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/casio,fx-9750giii.yaml

diff --git a/Documentation/devicetree/bindings/soc/renesas/casio,fx-9750giii.yaml b/Documentation/devicetree/bindings/soc/renesas/casio,fx-9750giii.yaml
new file mode 100644
index 000000000000..f3c1c02f1bd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/casio,fx-9750giii.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/renesas/casio,fx-9750giii.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Casio fx-9750GIII Graphing Calculator
+
+maintainers:
+  - Artem Novak <artem122novak@gmail.com>
+
+description:
+  The Casio fx-9750GIII graphing calculator is based on
+  the Renesas SH7305 processor.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: casio,fx-9750giii
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: casio,fx-9750giii
+      - const: renesas,sh7305
+
+required:
+  - compatible
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..78ba9c29cb56 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -301,6 +301,8 @@ patternProperties:
     description: Capella Microsystems, Inc
   "^cascoda,.*":
     description: Cascoda, Ltd.
+  "^casio,.*":
+    description: Casio Computer Co., Ltd.
   "^catalyst,.*":
     description: Catalyst Semiconductor, Inc.
   "^cavium,.*":
-- 
2.56.0

