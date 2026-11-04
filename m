Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796082;
	b=MvP7DFzI/nA/aqKk08TVx9419Icw5QpvSfsNLCIUh3926MgEoqMZNnDDEehoh8jYKhNw
	 bp/dAvLH4WGCgr9Ra36IU6qwrcyVndE9HxSoWLn50ZQxxtzEd1/aZKm5nO3xMIKd3f1iX
	 mJdAmzzf92qCH5rqMFz77jSHTFrW0RGVVMvN/qltU1lqLHTp1n8+r2KHhhe/xJEERsE2X
	 xVsl0AhKGNyqAktlAwg4T150lYs3s1sIC3298rfTDs5+Dgylho6pgaS+kPJ7GLxUIzpZ8
	 6Adx/t1g9qWAAoDWj7/N2l8hSRjrYb6PKEcH5W5ymy+CQOYkrR1rvHv5MsFo+/nCEpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
	b=N9uS/7z7To7JUrrA3eWAG7WQajbZ1pLaYnw0JAY7OMxd7qYbjZ2DMpr7aM/Gk/tiigit
	 stfsScey6Ex7NO9jwRQv+jFZ8sWJz00H+QOJ1mYdegc1PAPjSo6+OmWaXBLpiGH7Y/F13
	 /+REPHq9lv+Z3XnByp1hZIHOEZLsq6oRjs4bFqk5Riec3n9GTEEijzq6nREuSqGSBHl8x
	 NlbPtxqMp3SvSjp52R4oJ6n8s+iZdM7mGN9LPvd5sMZ+RDmkmUErnUJVyS90/szsDV9rE
	 JmSECSlHiKAuLKhqHqb7nxvWhDG0ZE3ehHBDdMXLppfgsUNC9xMJIUXr6IGRvdWmuyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CRzmj8+/";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0D4606A339
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D0D4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRzmj8+/
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so5262835e9.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796080; x=1794400880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=CRzmj8+/NF/BN+I07yf2oD4T5kFJjXjbNL5RcAPCsr8/KRarKHlyodp9inl5fv71Jn
         o7SqXX4rln8aBWEqErqW4hisC4TP1WtD6JdJ/q+ad/HnKWRnTuZU05YCtv1yT1NLHa4n
         UGOqs1zvron1/mHeqNxuqiZX91xIMqNTF01XoJjsoWs5cw9WuvMLlByz0/+gwcdiR8sb
         Fu9GgS6OVoMg3398FtSLpfqztKxtrjwr7qsCXyr4KSlLxF20QjurOq9eV87E1Qaxxybo
         Tszg3VIasQAonxfHIZW5y0AGXwZQneMpzuJ2AQU6QNhYLlvfuBOiYFHEiYwQN4/YL1Pb
         dGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796080; x=1794400880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=xZmX6go+lp5Z+ZFQIeAZCtU45LjvLsE14cg+LUnmD+aC+kfm5tN1Rz/9xn6xPdpJCg
         Q1szAX42TGLNw+LF8Wcg1BfMPwQshxCsWmOuLaX43FyGMrUh5zmVzFlgrtzc44FoMqfP
         RS3NJB/decDQ0hwlTgD7W3g12jpKEEWzhQT0bibhkLdIiRLbQkCRQcnAbzre5fo2BkSj
         wwjAyb7nBltWQonlpnQdZS+/zs5yHlKOH9+OisHTEwh8lSQyD4AClp9xXH5t5JRpKqvD
         qaw3Ge+G3OHzzFZ6vihdZfS/lCQc2evCbLZlaV1uhjrrij2F8+9PedUOkaX8jT8QTwyk
         72qw==
X-Forwarded-Encrypted: i=1; AKwUvBxBwLbBBhUQ03cyTInrRwja2GyWBTYyGJWtEHjCHKLgR4YIcr9voJDqWomDQalaFzK3xX/JOk7EpdKI@vger.kernel.org
X-Gm-Message-State: APuU4Z+rJMf+RPpyWNXMoLPpWL8uBd1BJyUNN11pDsMCwswTrkSu1jEt
	ItzE8+t6CgLuYEd8eBO8jGb7QOVB/zqvs5zUlG9gMn2xTIlTbb2VnsUa
X-Gm-Gg: AYBFou2I8u6snjpBCbJ8XVR+x242av18a+J4HnkI7BuNaWVczf7ePfUx5EbMe75/m2E
	7km402rb1yWqGhwCrY43KEl9mUrHB3URz5/EONtovzprUM+OEcPEIOWZznjfQ/lIllV62xROEqi
	jy6o4DnW5fi7D3Zm8XAfN0Ie4YMIL0Jj2j8l1TEJQTMYuvk5N9lo1spIuLlfDHUzvF6xJxlVQ0l
	zU5AA6X6Im1p5RdymLYu65S4w3LLlF0o0FZ47MIlDuJV6QwGIF66e03a/w0Mfgk1cJ4u4Uf9rCD
	b6OjQZu5bdJxHnbhll2i885InReCBhEykP3SR/d6OMDO8jYzEGbHT5UZ48p31NU988y8HpkGV1c
	V05YSJ4GWxpR/q7TqDjm0qM1OaasCKIFpOLtAEWBzWBByy4lAHLa2M2oi88N6s2F7QBQZImRjSv
	fgNwj+NFFVKSYvHKdpFIHoGZuRhB+2bpP7tixW5Kay1OaqwXk2hV+qMnDBEcBcntiW1qmaXKtIc
	bgZ2VEs01Z+qgK4BRvgbcK4NQH9AehHXkwE6akmXkSHEresdf9Z4A3IhC+TfCfKkTixlQPkaeYh
	JM6ykW1eDT9H2GkmJENAJyJ6G4RUhYEWs2waMgvG30z+fQeLZIYjUXHBIEU+mGxQ5UiENXA=
X-Received: by 2002:a05:600c:354c:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4ac18c7389amr378083555e9.34.1793796080386;
        Wed, 04 Nov 2026 04:41:20 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:19 -0800 (PST)
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
Subject: [PATCH v2 6/7] ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:56 +0200
Message-ID: <20261104124057.240288-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
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

