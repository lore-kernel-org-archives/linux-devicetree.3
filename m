Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307520;
	b=w0ebv9OmRlr5PWK5Ji2yXMopwra32O6o/i9Q02ezjzqoCdJ5gQnDK6/quotGKPR3WLVs
	 voSm9GjV/3fMdBul7jtqD2cJhcAAwwkAW52huVZGocHuXXOYOZ+2ZQE5Vt7E+h6sOWqDD
	 EFdcgRU2MWGvSDTrr6TfqO5UvxwkS7BpvsEvYJ2alS756NUj+Q89Ijs3ozzQWOyEmem2V
	 gK37FrO0CFSwNXZgfKQPGRZ69tjMfmjzI2icl8WOUAslD9LpOPZ+bLRReIh7FKO1wCDG/
	 N/VEdwvo7BtMpzaLr2BGmpLtvojh0+j/8wGuJyFLojoXHEtRtAeGbIh0qLZVB0rWzZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DqR3VaUxV5ZL1mlLLS8dI5+d5I/tI6arVdpvogwVwQc=;
	b=LAft1uypolrhfUg+5AOxA3cjdxbF1GNf+njbbO5mJKN7H+prJeZ36GVgwEP1lVJRdUj0
	 UxEtX4o/1VldrA2He9OJrLDX4nNO1SLeRGJrN93FhN7LkxoQLbjILjzBZ1NFzD5pHueiG
	 ewN7MHRMefU75Mu7pFzURQqHDuXF7Q8oXY+n3EI8vQiLWn02gQmyTksNFEOr0KjG5J2uc
	 5a3wvs8hOvnaLqLAxBE1kMR9nISI6hnJxJFkLlm04/zIqndev65Q3OaOpYYKwhmsQwcfy
	 20CQ1NRwaLuXvWvX2xgc8uCtkwmlIRchCv5ljZAg8OlW9iixJVg0fteDwXxIBEGyZMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WiDYzNkZ;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE335606A31F
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 20:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE335606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WiDYzNkZ
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91c75267b0fso468756d6.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793307519; x=1793912319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqR3VaUxV5ZL1mlLLS8dI5+d5I/tI6arVdpvogwVwQc=;
        b=WiDYzNkZjYE8JPyIxV4QK5mnAsTJmlWSi23JOYTqh3HCEPY941Gwh6yzoOURamYqBP
         fKwTX+cx1sDQYY0GHSjEghju02hSanl1aJNgI+SSiT9+fX2hqKuMnrgLroO1mLuLjAiX
         goNKarXR2TKGnoPbI5EfOyI/KcKiw/3A5CpYVdaO+1I3rA5mx1MUzFDxJAGC9o4f4Rjn
         HTNUqgP2IrWrF6kMZSi5pyXMRGZIpowU4Bk/eZg1d7bjtGFHgHI83fhGmt9RcOTRBaE8
         VpdNang7zhdmsp88BV/TqWrNKSiMAeRxcV6YsFt/KULEyFuxCJgviOBxVjyVchaTpUOh
         qEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307519; x=1793912319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DqR3VaUxV5ZL1mlLLS8dI5+d5I/tI6arVdpvogwVwQc=;
        b=05AhGfiFyCQ84H/VayqwOAslclcBJyXTxhZzPmU2hGywSuF41fdIcXU+4eJUQ/61s1
         70607pFt1Vk/y3RYkp1WNCnVuHbjfN7ECr0Ow/38+xU9pzLD9pENxeQ3cpp6uxrNV2o1
         CEMXwlQqY/aLNRcTVWp5QCNMhrfB7BJqan0J+SoVW7mTQtPsNw2QuwrlJYueq6BzWfly
         OOgZlIbA0YcqY+xdBpktdFfrGt9H4nhxSCnqN0gDdJzY6nSY8/3Lvoi9oCz4zd6g3eim
         DyzibMpuzrWEiQIcn/HLRdESEvZTQKAFrlAYWuprhAleEFSKEINA3tiPqtYEyGxzk7zA
         M7BA==
X-Forwarded-Encrypted: i=1; AKwUvBzhQIeFH+JHQAUn+PuVL2LFkcxj/TTIisDlwaG1pTUVIZvzXSdFSie3W1ZCISKa7WputOEqqyixWJ0m@vger.kernel.org
X-Gm-Message-State: AFq9FYJRrhXEYdsyU93DAozs1t9GsK9epl6zAgH6i169Xwkcs/XT7l8C
	0h2l0cbKzN+pThzmHE8/kFegch6w8Bgjzrr+Afap43FYk4rIANvppxwN
X-Gm-Gg: AYBFou33cQ0fG795jfYzUd0JfpwMP4W4iOHxVzgBGeTmfl7cOzWP77ZYlqX7UIUxMSE
	lPpT4Itz1/4T0ho+PBYEUh4BHB+YOxohmV3CT5Tf3/LeG3PJfEOxcnZ7cEpWe9vSIQeNJLysh3a
	/cbZU8wO9zmPsITSHQ7eytZ5mtrOSKC3qlIncRQMSFLgKyoR3KUdrZ1AbktRISsMQ9D3YmIL320
	b3UoVDMT1YXIwC+p28oADzJ4xlsue4girA6MX9Jky5clFbvkFGqPK151lV48ATHVTkrLEg5lXtj
	XG0mHX8PGlJdBCCfr3vUE/dU+C4meuWGjbYy+5kJeWQoSFSK31NFwV1Wn7eTFlU2dZkMH0unxbt
	lOcLVLTwf94tNm+FAOcTc8UpCwqKqiDytnMEInz2K5MiCA4M0M8nYkxVZTa6kCOltJC+0Axg0jc
	7P1myUu8w0u4qTn3gvviC9C//ShWG0IOTjQGRf+OK+Gkgy/KXFA7Wfnf3/g6dsycqt+eUzbe4R1
	1fSpJPOn32a/fk82WgeZbo2wBSeuHu5cPSRcTtwqw1AB+1xOp32AR+GawfGEJgNvLcZXO7BWxhV
	UgJJU2ZvlHO6aAjO5QjZp3JHS48G0Ns7jfpOjA9sjdCxmCM=
X-Received: by 2002:a05:6214:3212:b0:917:8ea8:cf48 with SMTP id 6a1803df08f44-91ca4ae7fd3mr2661636d6.11.1793307518784;
        Thu, 29 Oct 2026 13:58:38 -0700 (PDT)
Received: from holowork.tail3176d.ts.net ([71.104.86.121])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca31032c9sm6006136d6.21.2026.10.29.13.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:58:37 -0700 (PDT)
From: Fabio Piparo <holofermes@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Barzilai <amit.barzilai22@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Piparo <holofermes@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: solomon,ssd132x: Add col-offset and dclk properties for the SSD1322
Date: Thu, 29 Oct 2026 16:57:50 -0400
Message-ID: <20261029205751.3513474-2-holofermes@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029205751.3513474-1-holofermes@gmail.com>
References: <20261029205751.3513474-1-holofermes@gmail.com>
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

Add solomon,col-offset, solomon,dclk-div and solomon,dclk-frq for the
SSD1322, to set where the panel sits in the controller's columns and
the panel's refresh rate. On the SSD1322 the clock divisor is a power
of two, from 1 to 1024.

Assisted-by: LLM
Signed-off-by: Fabio Piparo <holofermes@gmail.com>
---
 .../bindings/display/solomon,ssd132x.yaml     | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
index dd7939989cf..6c7830af0e5 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
@@ -16,6 +16,29 @@ properties:
       - solomon,ssd1325
       - solomon,ssd1327
 
+  solomon,col-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 119
+    default: 0
+    description:
+      Offset of columns that the screen is mapped to, in units of four
+      pixels.
+
+  solomon,dclk-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
+    default: 2
+    description:
+      Clock divisor.
+
+  solomon,dclk-frq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    default: 9
+    description:
+      Clock frequency, higher value means higher frequency.
+
 required:
   - compatible
   - reg
@@ -46,6 +69,9 @@ allOf:
           default: 128
         solomon,height:
           default: 80
+        solomon,col-offset: false
+        solomon,dclk-div: false
+        solomon,dclk-frq: false
 
   - if:
       properties:
@@ -58,6 +84,9 @@ allOf:
           default: 128
         solomon,height:
           default: 128
+        solomon,col-offset: false
+        solomon,dclk-div: false
+        solomon,dclk-frq: false
 
 unevaluatedProperties: false
 
-- 
2.53.0

