Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102469;
	b=vpnhEvsaEJK8GkS/7J+OgH6JxUk2KZLH++WKxzVL5jPp2xPNbUoQv3OiAEaAO2boBbO6
	 xOdi6D8pHCzZdEHViC+ly6t2INn4uVEX30nQ7QmzTY9BnrDZGtE/fpTvKlZbDkOl7zI6J
	 lxJJTvjPPxHytc70HitW52+xvMr6bVzzJ0o1KLSN4aDrNXQ5YWSC3hwR+ToBm/pLTPxNJ
	 sXFOv0zYa/r4Ko+masLF2bvuE6nIkFHCGGtXrT18YrSL6+VsN7JKawz2PX1lTYY2nq5Bm
	 EQl1cTxhytPw2mkvcnVN+5DIItvLrC1WUe/5sRaIb/DQf0Ex9d7D5C88s+BMPstRpZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
	b=ricCSfqxhLxe31Vtjz37yZCqhiLyA3BLYDs8oDj1utJPU+Y5fcHpNCmJO2uGHyJXj2Ti
	 Pgehfwwj8pc+t4uTOJB1IuBT9QRagLPPPaWOlBPmm63qnUEtpmM+cs72Nhe/oScObHp4d
	 q5rELRELXlALYWaWIO7ASzMJSCcUw9y5bWiqyWWivzc2MATl+e8Mc8oJtTYruY1l4CcUw
	 MX3vMF83VS3aFbkEp+YeoUnGvLizPEOy5tOY1JCymvRqm4Iti+Hd/NdjLhu86Pp2de6sR
	 XY8t9OUBqyE6KK1NFOPlItCaizedB79AkFlK7Tf9lKxfmZ82QpD7SLPI4GPaOxi5+lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="f/lWBDEk";
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC160A3820
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBC160A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f/lWBDEk
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so6323608a12.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102467; x=1793707267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=f/lWBDEkfIPYFql3vPWiiT0rc3kWE1tCkHjWfg1CKxziyIZSDJ3v+JAjoHedbkvtho
         8Cm/kuiTJKwJvHx6CCRVdEGS1z9ABZ9tUjnKP67gzJA31Rd7eGJaCVkvqC5m4OM5Fy6t
         NYXMRa8we68AinGC9pbbxsO5Z+xeo/AYq/QoqXNtOCPutbu5qnFeAflJi0Eo4Ptc2gub
         qZUcENewFIXSny4FMvENO4D/KDg4YI77snagNteSZRUsl5PyWekoAEt7l1kL5qNtx/wy
         MmRTbLXTQWua3o+U1KtLi99yEXXzgPTjtO74lpJyjKd/DJ6OcI5LnyCuTst+PYNCy4uW
         tfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102467; x=1793707267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=M0H4JAUS92Bw+FtyiS8SWLhPsk0qvshGDDzBilhzJOz26njN1p5+UYl85HoJ1e79k+
         l1oDUjleHvhMJuuGkISXuJhhXFR3OfwD/YWzeXs0wsX+Zr4tFM23drGAbUSLF3uZVNeZ
         Mr36yk4Qj0Lqe91gqg9IQp6f9hSUPX1MtEt0+Ef8OaaehEZvevQfHnyS4fGecJ74KRpy
         gfoy9vQR6jCpKTQzDyifS7QRGMCE6MNpxbNqsPVLIEuDAGEyKXl6VhmbKOI9L2OHRLsn
         6Y/T/FoJ/maQBQFGokEM2279ffV8B6G4MlqgtLX88N0pyd65b9vuYuBTm0x5TZ3NgwVs
         jjow==
X-Forwarded-Encrypted: i=1; AKwUvBwHuAawh9Su/jlPPsjuKTuBOrrqulBcpOD9FMVveGK9zgkLYsPUt4/Bq+fktiLLYJ/mkE+Nd7sA3lbt@vger.kernel.org
X-Gm-Message-State: AFq9FYIjn2IhDrkmE0NwPqj5yc13pYheY2Qmstq0OocrYY5T3C0K+vjZ
	Bn0ZVfUST1NSfH8+isNnzrRtvX/0XC5lm9SgDsDymEGJ949i+nVPjD77
X-Gm-Gg: AYBFou09Cf0gTD7pmZp73AF6oHBW4Dzg0hAX8QqjRYy/kO8/BXynFDsz7KM3FgFbLAT
	WLFhZ5WqrUDt6WA+1JnQ4FjYObcRDl8NMbZsO9c2nUbxbc/FFvCezZ932aQiNDaUTtxuiUI1F06
	3CPMwoTonWctfZa1vkWBjFPuJwUJ9UIKtIYur49VKNhLt0gjZEPbyFwStjU7bRfrpkzR8PeEedr
	UcdFPq3f7nNHcaqpkVIsZXBFzTwN9MXa5IiKbOiY8fJv1FdEacC7/EIdkLPo7nXBPXNrRyWDySV
	n1B7fT9hDLMozJewI3MqTcoQ2UcGNfIHxWHvsc2rZ/Y+JBUP2zZcNd6w1bP0oQ/pBpvQUiJPpbG
	Z+EYHh/uk4bsezxZ5b3ewwmKOtjLlPsKfrb3CcVNm3hVwKDyG1b4iV0YyWKpnB+duPScOOmvsAT
	RSEThvGNp8r+mN00uNsu5LoQ+ge6IA5LKdiTbUccyPYTL1PnzKBXsYj0T29cgZr+EqS+tFjGb1t
	GIJ9OtI4J643IUN4JIMT2NXef7zb8M+ouG5cs2BtauMQZuH4FGFqJS9gAr7SfWMyWBDwUkfKzXk
X-Received: by 2002:a05:6402:a6c3:10b0:6af:5b14:78e7 with SMTP id 4fb4d7f45d1cf-6b44324f449mr6887681a12.34.1793102466212;
        Tue, 27 Oct 2026 05:01:06 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 6/7] ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:18 +0200
Message-ID: <20261027120019.93611-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Tegra20 AC97, Tegra20 I2S, and Tegra30 I2S controllers each provide a
single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra20-ac97.yaml    | 8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml     | 8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra30-i2s.yaml     | 8 +++++++-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
index 4ea0a303d995d..19e242f6cf028 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra20-ac97
@@ -45,6 +48,9 @@ properties:
     description: AC97 DAP _FS line
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -57,7 +63,7 @@ required:
   - nvidia,codec-reset-gpios
   - nvidia,codec-sync-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
index 68ae124eaf804..9a17866da7731 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -15,6 +15,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra20-i2s
@@ -49,6 +52,9 @@ properties:
       limiting number of supportable audio rates.
     type: boolean
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -59,7 +65,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
index 89c3c6414ab13..fbe4cd4619683 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -42,6 +45,9 @@ properties:
       - description: rx (playback)
       - description: tx (capture)
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -50,7 +56,7 @@ required:
   - reset-names
   - nvidia,ahub-cif-ids
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

