Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2E2773DA
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776138594; cv=none; b=sWE3stw3UUy4s+VJqQmww/tGsd0s8RLNsCrtZVYSpAEv4u6BFILf7wBcZGxF4/QmPnBrDWUvFFzbQSLmynM/evruJLPUqbKtfj2pq/P6qIJLTXkj4SejExZfsdnmjizxgqLV4iQsHjwoyB2/uIrZ/tzs4anQIN03QTNIU/qOG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776138594; c=relaxed/simple;
	bh=kmtf5vt+sD0ZYZ1WFjpMm8wNrV1qGNum6vpVLgOH/Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IjiwYGGroutP1Zy1oYJeSEbqckefgYHwOhgilVBeg20IH5dgk7KIHXiOidbeOEK1XKsM4x3gvPDYFAo2vqpdpy0R7KI2ivci3EghC9WLDR1vWA+nOnustPg06ME4IJdTN7pytI99WGCBVUEsPGeCMLmHUw3u+OREmNBr7U0e1oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htfAMTU9; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htfAMTU9"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so623758a91.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 20:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776138589; x=1776743389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8nCCohEIByHxDLQV6fUvAFMSkLwCh9AbZE4mUJ6uPw=;
        b=htfAMTU9QaNOgtDd6LIMWx6zJNuOj1PhzfuKzzpIc7uJfk+UQ8dp2Z+z9N4RA2T47N
         XjhmK8rbkQ1ptUif5UhD3wM+m4HJLHqEfDDFwa2JdeBsN17YV8wrl7GQG1CpGxxMvCvT
         0ikW7PHW6zN9av+PNjTu2QXSWzrGPDT7bSoIQK6imyKPrcDVFWA/dOW4LfW+wlbpUqA3
         DNt1+jLp0kGZD/LmQKnOWJsXsvvl4QPhymS5XvzPuHNxwPPG/dI2fnsDv+LdgQH7n6s6
         /P2lCAPrEyTBcjX07a+vkE3M6NkoRErPtD8BldcMOQa3vSPLKqUhKYb3z4Imb8DodlDl
         Alqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776138589; x=1776743389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8nCCohEIByHxDLQV6fUvAFMSkLwCh9AbZE4mUJ6uPw=;
        b=iXxITKcSgkZDHHJtVWPHPvuodWUK2Kd+by3o/E4X+GK/5CdRtvFMzSDKVoVaGUFN0D
         SdAEYNA3H9fzta0NmgwVIoejoxpKX666EP6f8Rxp3/PQZtJcmRu6xS57ZUGYJUzsjTjH
         qM5uRX3kJJndC7GPkbMEP7M2tqudllnhuDQOG/JlFgSy+oGkdfuC5PSO9Syrn/A6vdkN
         sgiH6v2zdxdCWWYOhKs107HQsi1RyKeZfR/wanguNDj++Rl1UaKgRT7UZLYKfkacZ44g
         JRMaVNBxX71Uk9N4DQJ8DODS/095gTGzf3iExRQFX9MOSl4Nz6HQx0uvf3HpF64TOp4B
         tCmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UEPc/9sdvAxo73r+ZuhVv0j6KI6Nffyq5pKaqlCzkz/eMmuwF8RWgKh3+6QK9gB7kMYtlyrRFS/El@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrpyf7+0EB6p8QTYQELyQp/BqLlZQmcEXFvgYuftMCJfPXebfs
	OP9/llFFZCVVODF2SpD+yLdVRtWdklOtSTFw6T+noHlHpCEKu2XOGeoF
X-Gm-Gg: AeBDiet1yI9K11pQyZan3IZBAsmZlRW09XETHtqqOx0nDSA4dz8jE6/LJuLsRukYYnz
	2qTqVyz5Qpl/8BYnR5EueZpUT0EgJqYWx05R+zXv59rZ0nCfvDzxJGVBgkaEa1mY5uXoRG9YmPu
	4WdnFs2gNi0o3qWCvDQ7raia7DWXUPLFioyun8m54yP4vgRQi0ycAJlO2y2IgwSXnyuQlpJH3Je
	RTZQiGVNvTDDdRkZmDrrfNB33SjuQX+lXeWwpHZd6YeYFLAEKnsIW14UfKjfMuyQN1mQbHUOHKX
	Ah7dkfgpPqh7brBRJa/fqCSqzT/+GWHeXTUuv0ICLDdqvNSZe9KLmuL4NaCl9cv7w5ukgiVlS/a
	i4RqVy28u+7v41Vbqqg1IcKLRo/cYnYvzgHzXgQ/tFUwWrKwCKDKaHMSJTXO68aasoz4a2EC3uL
	LxYZF/FOlW3v9h1aCPZ/x7QzWAWp5GNGmbhZuy6eGneDP0IUu7
X-Received: by 2002:a17:90b:4a0a:b0:35f:b940:4e81 with SMTP id 98e67ed59e1d1-35fb9405096mr5084175a91.16.1776138588603;
        Mon, 13 Apr 2026 20:49:48 -0700 (PDT)
Received: from padmashree.. ([2401:4900:9393:1ba4:716b:b03e:9a18:6988])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fbdf9e171sm1765694a91.2.2026.04.13.20.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 20:49:48 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: k.marinushkin@gmail.com,
	lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	padmashreess2006@gmail.com
Subject: [PATCH v4] ASoC: dt-bindings: ti,pcm3060: add descriptions and rename binding
Date: Tue, 14 Apr 2026 09:18:54 +0530
Message-ID: <20260414034854.461661-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327121919.603768-1-padmashreess2006@gmail.com>
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description to reg property and overall binding mentioning that this 
driver supports both I2C and SPI. Rename binding to match compatible 
naming convention.

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
Changes in v4:
  - Rename binding from pcm3060 to ti,pcm3060
  - Add binding description
  - Add description to 'reg' property
  - Remove unused label in example

Changes in v3:
  - Remove description from 'reg' property
---
 .../bindings/sound/{pcm3060.yaml => ti,pcm3060.yaml}   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/sound/{pcm3060.yaml => ti,pcm3060.yaml} (74%)

diff --git a/Documentation/devicetree/bindings/sound/pcm3060.yaml b/Documentation/devicetree/bindings/sound/ti,pcm3060.yaml
similarity index 74%
rename from Documentation/devicetree/bindings/sound/pcm3060.yaml
rename to Documentation/devicetree/bindings/sound/ti,pcm3060.yaml
index ceb6f044b196..5a402d8b7daa 100644
--- a/Documentation/devicetree/bindings/sound/pcm3060.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm3060.yaml
@@ -1,11 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
+$id: http://devicetree.org/schemas/sound/ti,pcm3060.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: PCM3060 audio CODEC
 
+description: This driver supports both I2C and SPI.
+
 maintainers:
   - Kirill Marinushkin <k.marinushkin@gmail.com>
 
@@ -21,9 +23,7 @@ properties:
 
   ti,out-single-ended:
     type: boolean
-    description: |
-      If present, the output is single-ended.
-      If absent, the output is differential.
+    description: If present, the output is single-ended. If absent, the output is differential.
 
 required:
   - compatible
@@ -37,7 +37,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      pcm3060: audio-codec@46 {
+      audio-codec@46 {
         compatible = "ti,pcm3060";
         reg = <0x46>;
         ti,out-single-ended;
-- 
2.43.0

