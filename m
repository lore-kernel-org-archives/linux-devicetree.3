Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796078;
	b=Y3/sOgKr8HZGziuF0CmRWn/GrnWc3a8P79x+7SGHS+Li/dXwK+x9HbcypDUpt2ujyeiJ
	 /O0bIHrGAGJx9xUrKPjpYWFNjaFqTvuFPfQMkBYhS1KiML7eJKXVibkCOlUH3TNp9J+4F
	 n7o1aqLyy0T6R3u13Dfd/SuLxZM0+5+m700whX6Qgt24vsKzyCkWazbvWCOwzJx27xgQa
	 nyahYQsuW7ytIYZ23U7cvaZwUslSvbjUvmEHK5Bhq/E/gaTSTP9rWjmkBNWgTSHQ/iLvo
	 PscowRsNIgMj3GbwEkQKW+c9ZPSY2z7thrzHUoLbEKTIGsyPGwjPpDtlhIRXOjYEKIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
	b=dRhCdFpqAonCSGAYmKatTR1DNPyuKgeDbzFwKJE3uPTmGt1RMaTaWFcLYrsI7HOceDt4
	 T+DpQAfUMN0uGO881tZlFxLti8M72pzAaG+obmGwHMWF172W5/nHdW9e1ZLdL5yIojXtC
	 OFj8iPQSkjsxLbAsTIWJWtYHPDK2uNG1sj3hcke2JGB9pbIQ4WGDWe7LxRJvXzZwo+6MQ
	 Q8UhHQb9GSaq2HQLwq5XnkaqXosFOCyGTgmMeg/XtdbfUmc/sagFUH2GkE/LCLKIMsQKS
	 qSDBFCwfFUcXxZLCwcF+qqTV613iVtUsP3ulKBg+IyaEw+W8uGVFdzo2ekD0ogNceRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEDYL3Z6;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A70606A33A
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A70606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEDYL3Z6
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so10488985e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796077; x=1794400877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=YEDYL3Z6VixFTTi2aQ1Fu4+G3ooQc+yBSLETFJPEYDRbUfbrnmFVMvzk4idoP0m/xq
         HAXfLuw4AyNe/DhdDuh50pO+Ye2UBQxQz+gI9bd003BBAyao2EMq8IPY0cxIziSjVKql
         FwKsnnxGv/GpS+xR4nHKQTdY35bcCYplrB2f24q1URxzOZG4SUgG8ux/xJ0xCJnfO7q+
         bJ506KJVp5VTdCI0HDbLOB74eMgh45Xi+C3ygm8V9AnUrgM//fiYLmsvOiimoXB6B1rr
         NIFPc7VV97IgVN67HGWaGyWeBkX7n61aBVX7x/8Fp9lMhtXZ/GSYwoZtlpJW0KiFzAfF
         KkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796077; x=1794400877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=lkiCTdrlB79rm+oQGSPguXwQEEu/jmsiARgC/5e/0NOkzExLtL47YKBNoJu/5egHAw
         3gJSUFcsmagQLMRAgYBCFPvhrS3S0jWkLZQwv2NXdoIscywOz+qjk+r4vQgb1AHjhOhE
         lKQowQGbyRw9x2PvftkAAUooFg1NZpzqfliYTSxkDl8/w7a0Y0/eEccqpF/j70oLRcKf
         M+TZKt9lc+0XZ123umssmoM2DW6NsVDptnvVQ8gMD8INN4AYg0OMJLLg7VjK0EUI0kAt
         pLNxGH1D5J3C37atIDk+AwN3Y6iTGcXs5ilZ4ccNnP92jRKWozF+8+nlLgRKuDnrqOwM
         7pBA==
X-Forwarded-Encrypted: i=1; AKwUvBxK1STjKvwbbjpuAS8R++rJFQuqERIOJo4X50kVNPbaxKG17V6F82VoTYA4nwzhIeQLHHeSaYvU8ltQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/kk5d4ZpPpqj63FIoHmHtJ7ks89zHmaKi3HCWItzgkPQDRZrjY
	Je1DJiJHcmcdGlO+8Cu8ezYXg5Tt3HSJCnoG1I9DasUIBZLz+E5rg5Nm
X-Gm-Gg: AYBFou2TeFnrH7Wds8ysLvsXKYbTAop5nSUiXgBcu4GrDROauYAoR62P4zgyaOLsEP3
	C3WN2m9WJyEpRDQyAyhG1OzaaaSkftaLhgAKEJZ8rHjuZSH5pmy/mo1GZMJvSdM9fiCZJNspbgY
	aKqGDdyJ8HH4xKnR8LXqYGAXtKEQ837FtvsYQg8VgZP+Y4JO6I5ykcPQrWDLBQj6WYEN8tNQKvc
	9vAoMLgYSW+5GyNWpdQdIP+mShrOj3oMEMTVq0oDeyvPyatlZeGAA79a1sb1Rm1DIDUmY2TcAey
	ER8uis27RQ/swwGBV7GFte+Zw8r9L9YSRBWd/tqN9ZODB9fnimrqlI75VIVwGz2FeOKBkHnwuOb
	E0l85Ljruq2kjMQ5/CEj6eKY/1bS4BfyjRuBVIUb1yPe8pNna+XxXUsGPdYrd6eOU61s4PmhOO4
	ed8aucafiUGdOImU+FMTZGdNiLPbh2TAWLinrzbwIL5ZRRhtCa7KRFck6982ag6EjR/vhN3yfof
	5xHOLbvd0e3R17VmSSS8D3z2JOK/4zC9y5KPf5wwI+a5fd99FcHwgTpqNSINvfabAE05rSLqu7p
	434v6WGjHW7RQi1tIFR89gD3w1nMK4eabE7pUV6h7jMXqJ9No8GR/NANV5aO/Pm2pRp2sIg=
X-Received: by 2002:a05:600c:4715:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4ac17567cc8mr348752145e9.11.1793796076509;
        Wed, 04 Nov 2026 04:41:16 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:15 -0800 (PST)
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
Subject: [PATCH v2 4/7] ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:54 +0200
Message-ID: <20261104124057.240288-5-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8903 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8903.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
index 089b673847975..bb96e8f790b2d 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
@@ -29,6 +29,9 @@ description: |
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: wlf,wm8903
@@ -75,13 +78,16 @@ properties:
   DCVDD-supply:
     description: Digital core supply regulator for the DCVDD pin.
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - gpio-controller
   - '#gpio-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

