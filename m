Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605996;
	b=GZ9+nBypF+tZt7jVUFWpKSMPgpXU1gGuNSS9QWDTFKEZnYdfNMphlKK96D6wE+qvhzdi
	 7CYCww7o0tRyyo0P8zNTJw8ntoKVx1PTD/gin3JC64pNvuFlRG12sXuB16W6v2SacvVzy
	 Um6jvuy4ecxAYPQAHQnp9RdG60X0H97L9sUvK8T3HEfblcJ7M1ADXzfJniCuXusIil7iw
	 rmn+I3xCaGlbHHUsrwJ9S7xaZIn1pSXgwSdUxh8GsRioZpGPC1hneD/9vADT7ogyIYMVe
	 xe2LC626G+LLCYihFkySt4jzIWXkMuy6GlZjQkuofuQNHzHpC4hdumOV3IkOl3ItBtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
	b=QytPhln09bmTMelA+outkTNbApXJV4XX7n3ZpJxADSHtfIckJf0La2708IZhT1hXhm6r
	 Guxe1qsAD8S5OL83G/2fK+wgJ5a+LX3XGmjKEt8r1FNrnvfpTFhmQQrPm3Sysk0GONJWo
	 GKsq4ys5Dk+ZScmxcbFuAtoSbtr/l4V+HWU/g2q365cOLUimRrV5NX+b1/RvuTdcv+CUj
	 JApJuEi/Ddhxrshj24OGHNyyi1OoMMwpU6CrrE4NgmZZRyEkFcVlcBHTpfK5VC5PV8OqT
	 V9DuzcH5wxT4Hd7qTKZbgnhmkFsACZDGohoXUKoO76kI0MHdwsWtEzStxkpCUvWssyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuwcP9VL;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BBF60A262D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BBF60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuwcP9VL
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1221589566b.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605995; x=1796210795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
        b=QuwcP9VLjjET9UqnaCB4VTQ2KnNQAGTJSJ3bQCTHzKaIYapakl4ZQWGsaACsILb641
         W7KtxrisONpVDq4EpSVbWTvDXy86CqnaQFgdLrlYoSRKHlIEdQMtMDh3jijgGpFJF1yh
         EVxBpkbnO97KVy0aa67HyS/In4fpz0Sutuq4O1PuslmAC7w+uAGLD12pCFNFvtKF1c1A
         fKiicqVlZygJkGR80dlBjz1dOvPKQ1ObQ+qR2AxlVaY6MY5TvgX2iFg7mLF7XMYnoGrL
         tp2c0sQwBLFx7gQ6YUmGiPGoArhrmeIw6QsLxL3k4jTsuJKME1vvwF17PuVO+18EfydB
         JsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605995; x=1796210795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
        b=UQyqKjtOIv0TSvw3LeltvgRDKuYOJhRBxJCJvncWai/Mgf8JI3yyr8v57PI5MApHv9
         tWCSMs3XEpDvC+kRvspLG3//RB9genUPMOnB5xsTlEnkAJxLBzWYxaQRvceSc1gh2DP+
         RwSRoiZs27WGoLV4TmL0ZJfLXPJMO148U7bPq1ImEftv6SVDk/MrdxNAs00fFDDwlUCz
         XizT/tvTAFijCF/SYVHbwObDn5OVib2ToDW4nFYXBv3s810qcErQpcnZepH7a2EVA1y+
         atuAoaJCaMNYRBU203goU5wBVJcvb3wAv57G2og0hNTkIW+qs+jgYfD0O2G+x3jNY/dY
         /cYw==
X-Forwarded-Encrypted: i=1; AL+hErGnjg7tVb3PXyFZkKZKabm0Q+5C6pg2tlHUxYEqaCRaWaCBVGdBslKElQRohpBTyIU2+9V1BagHUAV3@vger.kernel.org
X-Gm-Message-State: APuU4Z90mobN7HTbhvey5ahntyN6SnwCZGEGYNSfIzFCKl1pNX5g412g
	1axbkW6tc5llBRCWMs4WMHGhe6CdBP1M/g3KU/g8iAfShRs2EAOvPJIQ
X-Gm-Gg: AZFdTZfOFtxeGkZmiapzInoCE9uLf0SEhHxoj2Oya3592930dFqUXqIYTfKrXCXVYuf
	Ffy4xMhmaN44d3rNfI2nT8s2tmvxY0YOikuN4HwUmgKP20FIfDQpL0Xq6hlhYsGGw9ktelVmlcI
	oczQzpu1cywFOYdBsDtJa8Jut8ohkeNY0udnO7awUeRw0HXnV/I+zQS2OHVVHXbGop0e81E8mxn
	C9EKgewh127HFdor1CvTU9MXuRpEGeTnLVv21aKVkz7XLWhHpQaUUU4Vy1TCoat0QudD3cPXBG7
	l34ZVaf4P5Krt47vdKJoT1G6AX5Xa1TAENmj8pQ48dd/CxAE04audmMvNMEol9LnaWzR6gX7bFw
	jwxCjNy9sWFoM3vfCIraTOGxRbvPa3H6wso7Y9qrj5VOXfPWhq9+I0/5ha4u8+rmcuYeRf56cag
	BOocr62zf4wJ8PVW0ETFG1A9/iFUOc2h8fx13N/L5NHVUGYNgvZsL855OJbgd4YQvndCgcbaMMk
	JBWSYJKz7PaE5ysKxdl5ERZHZWqxIv+2N1yRBmdS5GV7A7Tqe8vsughmhmT7dGuv2dECkMIBKLB
	RCld/mTv0yqn1IGAXgRsJ5rzSojqTok9jI3Tp5NNDdhD8vICBqdl+zaM/nzCm5CpQQrxLx1F/FV
	nTPPlRczLAhZVDwVvvfkK58LuP8v//PI=
X-Received: by 2002:a17:907:1c8f:b0:c50:9412:93f0 with SMTP id a640c23a62f3a-c51317e3208mr1522656666b.8.1795605994515;
        Wed, 25 Nov 2026 03:26:34 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 4/7] dt-bindings: display: tegra: Document Tegra114 CSI
Date: Wed, 25 Nov 2026 13:26:10 +0200
Message-ID: <20261125112613.237333-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Add a separate compatible string for the Tegra114 CSI, as it has a
different programming model, uses three additional clocks, and does not
contain MIPI calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 37 ++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
index a1aea9590769f..6296f3ab1d0ce 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - nvidia,tegra20-csi
       - nvidia,tegra30-csi
+      - nvidia,tegra114-csi
 
   reg:
     maxItems: 1
@@ -24,12 +25,12 @@ properties:
       - description: module clock
       - description: PAD A clock
       - description: PAD B clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
 
   clock-names:
-    items:
-      - const: csi
-      - const: csia-pad
-      - const: csib-pad
+    minItems: 3
 
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
@@ -121,9 +122,35 @@ allOf:
       properties:
         clocks:
           minItems: 3
+          maxItems: 3
 
         clock-names:
-          minItems: 3
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-csi
+    then:
+      properties:
+        "#nvidia,mipi-calibrate-cells": false
+
+        clocks:
+          minItems: 6
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+            - const: cilab
+            - const: cilcd
+            - const: cile
 
 additionalProperties: false
 
-- 
2.53.0

